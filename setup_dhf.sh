#!/usr/bin/env bash
newdoc() {
  ${NEWDOCPATH}/newdoc "$@"
}

newdoc --dir=../sf90/pln/0001 --file=PLN-0001 --logo --shared --type=stdCodeReviewDoc   --title='Code Review Report'
newdoc --dir=../sf90/pln/0002 --file=PLN-0002 --logo --shared --type=stdDesignReviewDoc --title='Design Review Report'
newdoc --dir=../sf90/pln/0003 --file=PLN-0003 --logo --shared --type=stdTechPlanDoc     --title='Technical Plan Report'
newdoc --dir=../sf90/pln/0004 --file=PLN-0004 --logo --shared --type=stdTechReportDoc   --title='Technical Report'
newdoc --dir=../sf90/pln/0005 --file=PLN-0005 --logo --shared --type=stdTestPlanDoc     --title='Test Plan'
newdoc --dir=../sf90/rec/0006 --file=REC-0006 --logo --shared --type=stdTestRecordDoc   --title='Test Record'
newdoc --dir=../sf90/rpt/0007 --file=RPT-0007 --logo --shared --type=stdTestReportDoc   --title='Test Report'
newdoc --dir=../sf90/rpt/0008 --file=RPT-0008 --logo --shared --type=stdToolTestDoc     --title='Tool Test Report'
newdoc --dir=../sf90/rpt/0009 --file=RPT-0009 --logo --shared --type=stdUnitTestDoc     --title='Unit Test Report'
newdoc --dir=../sf90/rpt/0010 --file=RPT-0010 --logo --shared --type=stdVerTestDoc      --title='Verification Test Report'

newdoc --dir=../sf90/rqs/0011 --file=RQS-0011 --logo --shared --type=stdTechReportDoc   --title='Software Requiruirements Specification'
newdoc --dir=../sf90/rqs/0012 --file=RQS-0012 --logo --shared --type=stdTechReportDoc   --title='Build and Automated Test System Requirements'

newdoc --dir=../sf90/tds/0013 --file=TDS-0013 --logo --shared --type=stdTechReportDoc   --title='Software Architecture and Design Specification'
newdoc --dir=../sf90/tds/0014 --file=TDS-0014 --logo --shared --type=stdTechReportDoc   --title='Build and Automated Test System Requirements'

newdoc --dir=../sf90/rtm/0015 --file=RTM-0015 --logo --shared --type=stdTechReportDoc   --title='Software Traceability Matrix'
