import re
import zipfile
import os
import git
from shutil import rmtree
from shutil import copyfile
import sys
import subprocess
from subprocess import PIPE

git_repo = "https://www.cs.bgu.ac.il/~comp191/compiler"
reader_test_format = '\
#use "reader.ml";; \
let input = ("{}");; \
let output = ({});; \
Printf.printf "%b" (List.for_all2 sexpr_eq (Reader.read_sexprs input) output);;'


def test():
    grade = 0
    timeout = 160
    notes = ""
    case_count = len([f for f in os.listdir(".") if f.endswith(".in")])
    for in_file_path in sorted([f for f in os.listdir(".") if f.endswith(".in")], key=lambda f: int(f[:f.index(".")])):
        print("\tcase{}...".format(in_file_path.replace(".in", "")), end="")
        sys.stdout.flush()
        with open(in_file_path, 'r') as in_file:
            with open(in_file_path.replace("in", "out"), 'r') as out_file:
                input_str = in_file.read().strip()
                expected_output = out_file.read().strip()
        test_string = reader_test_format.format(input_str, expected_output)
        with open(in_file_path.replace(".in", ".test"), 'w') as test_file:
            test_file.write(test_string)
        try:
            proc = subprocess.run(["ocaml", "-stdin"], input=test_string, encoding="ascii", stdout=PIPE,
                                  stderr=subprocess.DEVNULL, timeout=timeout)
            output = proc.stdout
        except subprocess.CalledProcessError as e:
            output = e.output.decode("utf-8").strip("\n")
        except subprocess.TimeoutExpired:
            output = "Timeout after {} seconds".format(timeout)

        if (output != "true"):
            notes += "failed case {}.\n".format(in_file_path.replace(".in", ""))
            notes += "\n"
        else:
            grade += 100.0 / case_count
        print("done")
    if (notes != ""):
        notes += "{}pts per case\n".format(round(100.0 / (case_count), 3))
    return grade, notes


def setup_cases(cases, target):
    zip_ref = zipfile.ZipFile(cases, 'r')
    zip_ref.extractall(target)
    zip_ref.close()


def setup_sub_workspace(target, sub_file, cases, subdir):
    if (os.path.exists(target)):
        rmtree(target)
    repo = git.Repo.clone_from(git_repo, target + subdir)
    repo.git.execute(["git", "apply", "--reject", os.path.abspath(sub_file)])
    setup_cases(cases, target)


def is_readme_valid(sub_id):
    readme_fname = next((f for f in os.listdir(".") if f == "readme.txt"), "")
    if (readme_fname == ""):
        return False
    with open(readme_fname, 'rb') as readme:
        content = readme.read().decode('ISO-8859-1')
        ids = re.findall(r'\d{7,10}', content)
        if ids is None:
            return False
        # else return check_ids(ids, sub_id)
    return True


def grade(sub_id, sub_file, test_cases, is_final_proj=False):
    cwd = "."
    sub_grade = 0
    notes = ""
    # If id is not null, then build a workspace to test it in
    #        Otherwise, test the current workspace '''
    if (sub_id is not ""):
        try:
            setup_sub_workspace(sub_id, sub_file, test_cases, ("/project" if (is_final_proj) else ""))
        except git.exc.GitCommandError as e:
            if (e.status != 1):
                sub_grade = 0
                notes = "Can't run submissions. git apply {} failed with error ({}):\n{}". \
                    format(os.path.basename(sub_file), e.status, e.stderr)
                return sub_grade, notes
        cwd = os.getcwd()
        os.chdir(sub_id)

    if (is_final_proj):
        # sub_grade, notes = test_compiler()
        pass
    else:
        sub_grade, notes = test()

    if (not is_readme_valid(sub_id)):
        sub_grade = 0
        notes += "\nInvalid readme.txt"
    os.chdir(cwd)
    return sub_grade, notes


if __name__ == "__main__":
    print(os.getcwd())
    if (len(sys.argv) < 3):
        print("Comp Grader\nBatch usage:")
        print("\t{} <patch_file> <cases_zip_file>".format(sys.argv[0]))
        exit(-1)
    g, n = grade("structure_test", sys.argv[1], sys.argv[2])
    if (g < 100):
        print(g)
        print(n)
    else:
        print("OK")
