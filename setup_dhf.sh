#!/usr/bin/env bash
newdoc() {
  ${NEWDOCPATH}/newdoc "$@"
}

newdoc --dir=../sf90/pln/0001 --file=pln-0001 --logo --shared --type=stdCodeReviewDoc   --title='Code Review Report'
newdoc --dir=../sf90/pln/0002 --file=pln-0002 --logo --shared --type=stdDesignReviewDoc --title='Design Review Report'
newdoc --dir=../sf90/pln/0003 --file=pln-0003 --logo --shared --type=stdTechPlanDoc     --title='Technical Plan Report'
newdoc --dir=../sf90/pln/0004 --file=pln-0004 --logo --shared --type=stdTechReportDoc   --title='Technical Report'
newdoc --dir=../sf90/pln/0005 --file=pln-0005 --logo --shared --type=stdTestPlanDoc     --title='Test Plan'
newdoc --dir=../sf90/rpt/0006 --file=rpt-0006 --logo --shared --type=stdTestRecordDoc   --title='Test Record'
newdoc --dir=../sf90/rpt/0007 --file=rpt-0007 --logo --shared --type=stdTestReportDoc   --title='Test Report'
newdoc --dir=../sf90/rpt/0008 --file=rpt-0008 --logo --shared --type=stdToolTestDoc     --title='Tool Test Report'
newdoc --dir=../sf90/rpt/0009 --file=rpt-0009 --logo --shared --type=stdUnitTestDoc     --title='Unit Test Report'
newdoc --dir=../sf90/rpt/0010 --file=rpt-0010 --logo --shared --type=stdVerTestDoc      --title='Verification Test Report'
