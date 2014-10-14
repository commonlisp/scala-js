#!/bin/sh

BASEDIR="`dirname $0`/.."

FULLVER="$1"

case $FULLVER in
  2.10.2)
    VER=2.10
    ;;
  2.10.3)
    VER=2.10
    ;;
  2.10.4)
    VER=2.10
    ;;
  2.11.0)
    VER=2.11
    ;;
  2.11.1)
    VER=2.11
    ;;
  2.11.2)
    VER=2.11
    ;;
esac

REVERSI_PREOPT_SIZE=$(stat '-c%s' "$BASEDIR/examples/reversi/target/scala-$VER/reversi-fastopt.js")
REVERSI_OPT_SIZE=$(stat '-c%s' "$BASEDIR/examples/reversi/target/scala-$VER/reversi-opt.js")

case $FULLVER in
  2.10.2)
    REVERSI_PREOPT_EXPECTEDSIZE=998000
    REVERSI_OPT_EXPECTEDSIZE=165000
    ;;
  2.10.3)
    REVERSI_PREOPT_EXPECTEDSIZE=993000
    REVERSI_OPT_EXPECTEDSIZE=165000
    ;;
  2.10.4)
    REVERSI_PREOPT_EXPECTEDSIZE=993000
    REVERSI_OPT_EXPECTEDSIZE=165000
    ;;
  2.11.0)
    REVERSI_PREOPT_EXPECTEDSIZE=932000
    REVERSI_OPT_EXPECTEDSIZE=157000
    ;;
  2.11.1)
    REVERSI_PREOPT_EXPECTEDSIZE=932000
    REVERSI_OPT_EXPECTEDSIZE=157000
    ;;
  2.11.2)
    REVERSI_PREOPT_EXPECTEDSIZE=930000
    REVERSI_OPT_EXPECTEDSIZE=157000
    ;;
esac

echo "Reversi preopt size = $REVERSI_PREOPT_SIZE (expected $REVERSI_PREOPT_EXPECTEDSIZE)"
echo "Reversi opt size = $REVERSI_OPT_SIZE (expected $REVERSI_OPT_EXPECTEDSIZE)"

[ "$REVERSI_PREOPT_SIZE" -le "$REVERSI_PREOPT_EXPECTEDSIZE" ] && \
  [ "$REVERSI_OPT_SIZE" -le "$REVERSI_OPT_EXPECTEDSIZE" ]
