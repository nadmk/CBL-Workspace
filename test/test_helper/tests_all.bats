#!/usr/bin/env bats

setup() {
DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"

}
@test "Script can Run" {
        cd $DIR
        cd ../../
        run grab_cbl.sh
}
@test "Can grab Image" {
    # notice the missing ./
    # As we added src/ to $PATH, we can omit the relative path to `src/project.sh`.

        cd $DIR
        cd ../../
        run ./grab_cbl.sh
        run stat CBL-Mariner/
        [ $status = 0 ]
}
