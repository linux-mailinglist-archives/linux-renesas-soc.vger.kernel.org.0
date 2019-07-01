Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97AF35B6C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2019 10:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfGAI0x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Jul 2019 04:26:53 -0400
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:33664
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727702AbfGAI0x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Jul 2019 04:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdI6gRF46MizvnRgpHb930XIvchVQamoUzKYP+2oNIE=;
 b=jGL2TNnVE0R6t1rVAT24xV8asP1S4aVt47mViRFi5TA/CxAMi+xzHZCG8oEQZ44Rs4HivADeVKegPXJs/uktF/0Vare6kXwqyrBN7glRur+4Rh416Q41iaSX7gerLfVzFjbjzB5eX8rplO3T17BZV5dFq60PtAq0llD94/XY3lE=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.174.85) by
 TYAPR01MB3582.jpnprd01.prod.outlook.com (20.178.137.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 08:26:47 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::602d:62cc:de62:eaba]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::602d:62cc:de62:eaba%6]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 08:26:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 RFT 0/4] mmc: renesas_sdhi: support manual calibration
Thread-Topic: [PATCH v2 RFT 0/4] mmc: renesas_sdhi: support manual calibration
Thread-Index: AQHVLrS912vGv7yj8U+Tcz5/XzdQSKa1brKw
Date:   Mon, 1 Jul 2019 08:26:47 +0000
Message-ID: <TYAPR01MB4544C8EBF12CF1C230BDA191D8F90@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190629195443.366-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190629195443.366-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.135]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a61703f-b9bb-4d4b-7be4-08d6fdfddbc5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3582;
x-ms-traffictypediagnostic: TYAPR01MB3582:
x-microsoft-antispam-prvs: <TYAPR01MB3582476772FD899166033C73D8F90@TYAPR01MB3582.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(14454004)(4326008)(6246003)(53936002)(5660300002)(7736002)(25786009)(66476007)(486006)(68736007)(6116002)(3846002)(478600001)(9686003)(2906002)(55016002)(316002)(6436002)(229853002)(7696005)(81166006)(476003)(8936002)(26005)(86362001)(186003)(76176011)(6506007)(71190400001)(71200400001)(102836004)(30864003)(81156014)(446003)(52536014)(8676002)(110136005)(33656002)(2501003)(99286004)(305945005)(14444005)(256004)(74316002)(11346002)(73956011)(66556008)(64756008)(66446008)(66066001)(76116006)(66946007);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3582;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K6Mzdq/7NggNl1WxWBQIVLkfM9QWchUXSuMH15tTzm0PVW/unwDuzmdnACs597J7C+y/seJRBIZ3o0NQ3vI5K6K8En1dvUoCOJc8xc85a87qoSoxUQsOVgb6mnrq4nHJCsCqCy1nzB3HXcWJlFRqw1dZW3z9Iy1x8m5sbF/z4F8tCNvxgewHAAuN4xWls7tz1HRA/SjOMQYKNasA+Ix07rkd6MhtCGMOGjGoBBNCapRBtXpmA9a7bT/FVSynctuyWteS+uJdm5LprdDrR6yY1Z/dsbs0hbE+LEa5TjVZZfIplV0dCyoq+zicu0uij3syA90b2d/Azf338oZDgZeFqlJT+mK+vZCUNWEDuzf8QyF5wTLmtkcWuvZonxB8+Nqmc28NcoMQUI0b5YhWfOZYjKZg3ncQh9goT6fpN6Y/hvU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a61703f-b9bb-4d4b-7be4-08d6fdfddbc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 08:26:47.4600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3582
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patches!

> From: Wolfram Sang, Sent: Sunday, June 30, 2019 4:55 AM
>=20
> For those who read the text already, I'll put the changes since v1 here:
>=20
> * check 'quirk' pointer before using it in patch 3
> * fixed a bug in the verification debug patch (not visible in this series=
)
> * tested on more boards
>=20
> Old cover-letter follows:
>=20
>=20
> Some R-Car Gen3 SoCs need corrections after they tuned to HS400. This
> series implements that. Please have a look at the patch descriptions for
> details.

Since other HS400 issue is investigated now, I'd like to wait these patches
to upstreaming a little more.

Best regards,
Yoshihiro Shimoda

> The origins were patches in the BSP from Takeshi Saito. However, this
> series is heavily refactored:
>=20
> * DT configuration was dropped, there is no user for it
> * the fixup offset is currently hardcoded because all affected SoCs use
>   the same offset. We can add it later to the struct quirks if needed
> * disabling HS400 for some SoCs was already upstreamed
> * the callback in the TMIO was made more generic to allow other use
>   cases in the future
> * less impact on the TMIO driver by stricter seperation of the SDHI parts
> * clearing the runtime flag in the error case was moved from
>   select_tuning to hw_reset to catch all error cases
> * cosmetic fixups
>=20
> There is a branch for testing here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic=
/sdhi-manual-calib
>=20
> Tested with a Renesas R-Car M3-N (needs this new quirk), H3 ES2.0
> (doesn't need this new but older quirks), and H2 (needs no quirk).
>=20
> The patches were developed against mmc/next. However, the above branch
> is based on v5.2-rc6 with some cherry-picked patches from mmc/next, so
> Geert can consume it easier for his renesas-drivers branch. There are
> two more patches in that branch worth mentioning. A clk driver WIP patch
> which I needed to get HS400 on my M3-N working at all. We are discussing
> this patch internally right now and its upstreaming is a seperate issue.
>=20
> Also, there is a debug patch on top. I can't test that the manual fixup
> values improve HS400 because the actual issue only shows with
> temperatures I can't (and don't want to) provide here in my office.
> So, the debug patches add some trace_printk to demonstrate the functions
> are called and the outputs match the intended state machine.
>=20
> Here are examples (with comments) from my M3-N. If you review this,
> please don't trust anything I write here.
>=20
> An unaffected SDHI instance (no eMMC):
>=20
> Adjustment and runtime flag get disabled during the reset in the
> beginning of the initialization. The same reset routine will be called
> when tuning fails.
>=20
> kworker/0:2-965   [000] ....     1.413767: renesas_sdhi_reset_hs400_mode:=
 ee100000.sd: adjustment disabled
> kworker/0:2-965   [000] ....     1.413768: renesas_sdhi_hw_reset: ee10000=
0.sd: reset! flag disabled
>=20
>=20
> An SDHI instance with a HS400 capable eMMC connected:
>=20
> When preparing HS400 tuning, (potential) old HS400 tuning gets reset and
> the manual adjustment gets disabled, the runtime flag (signalling new
> manual adjustment will be needed) is set:
>=20
> kworker/0:1H-1009  [000] ....     1.864628: renesas_sdhi_reset_hs400_mode=
: ee140000.sd: adjustment disabled
> kworker/0:1H-1009  [000] ....     1.864629: renesas_sdhi_prepare_hs400_tu=
ning: ee140000.sd: flag enabled
>=20
> Lots of tuning CMDs:
>=20
> kworker/0:2-965   [000] ....     1.864673: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864706: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864735: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864765: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864797: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864825: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864855: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864882: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864909: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864935: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864966: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.864998: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.865025: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.865052: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.865079: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.865106: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.865130: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 6, flag 1
> kworker/0:2-965   [000] ....     1.865603: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 13, flag 1
>=20
> First CMD13 after tuning discovered, enable adjustment, clear runtime
> flag:
>=20
> kworker/0:2-965   [000] ....     1.865609: renesas_sdhi_fixup_request: ee=
140000.sd: adjustment enabled, flag disabled
> kworker/0:2-965   [000] ....     1.865635: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 6, flag 0
> kworker/0:2-965   [000] ....     1.865654: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 13, flag 0
> kworker/0:2-965   [000] ....     1.865676: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 6, flag 0
> kworker/0:2-965   [000] ....     1.866143: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 13, flag 0
> kworker/0:2-965   [000] ....     1.866601: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 18, flag 0
>=20
> Reading multiple blocks (CMD18) above failed
>=20
> kworker/0:2-965   [000] ....     1.866867: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 6, flag 0
> kworker/0:2-965   [000] ....     1.867113: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 13, flag 0
> kworker/0:2-965   [000] ....     1.867137: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 6, flag 0
> kworker/0:2-965   [000] ....     1.867384: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 13, flag 0
> kworker/0:2-965   [000] ....     1.867409: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 6, flag 0
> kworker/0:2-965   [000] ....     1.867651: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 13, flag 0
>=20
> Seems like another retune is need, start cycle again:
>=20
> kworker/0:1H-1009  [000] ....     1.867880: renesas_sdhi_reset_hs400_mode=
: ee140000.sd: adjustment disabled
> kworker/0:1H-1009  [000] ....     1.867882: renesas_sdhi_prepare_hs400_tu=
ning: ee140000.sd: flag enabled
> kworker/0:2-965   [000] ....     1.867926: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.867958: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.867986: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868019: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868048: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868076: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868103: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868129: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868156: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868181: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868208: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868237: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868267: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868294: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868321: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868347: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 21, flag 1
> kworker/0:2-965   [000] ....     1.868370: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 6, flag 1
> kworker/0:2-965   [000] ....     1.868837: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 13, flag 1
> kworker/0:2-965   [000] ....     1.868842: renesas_sdhi_fixup_request: ee=
140000.sd: adjustment enabled, flag disabled
> kworker/0:2-965   [000] ....     1.868869: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 6, flag 0
> kworker/0:2-965   [000] ....     1.868888: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 13, flag 0
> kworker/0:2-965   [000] ....     1.868913: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 6, flag 0
> kworker/0:2-965   [000] ....     1.869381: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 13, flag 0
>=20
> Finally, we can read lots of blocks without problems. The manual
> adjustment is still enabled as desired:
>=20
> kworker/0:2-965   [000] ....     1.870027: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 18, flag 0
> kworker/0:2-965   [000] ....     1.871300: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 18, flag 0
> kworker/0:2-965   [000] ....     1.871454: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 18, flag 0
> kworker/0:2-965   [000] ....     1.871579: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 18, flag 0
> kworker/0:2-965   [000] ....     1.871712: renesas_sdhi_fixup_request: ee=
140000.sd: opcode 18, flag 0
> ...
>=20
>=20
> Okay, I know this is a lot of text, but it is a subtle issue, so I
> wanted to provide the details which enable other people to actually
> review what I have done.
>=20
> Shimoda-san, if the BSP team could have a look and share their opinion
> or could test, I'd be most grateful.
>=20
> Thanks and happy hacking,
>=20
>    Wolfram
>=20
>=20
> Wolfram Sang (4):
>   mmc: renesas_sdhi: keep sorting
>   mmc: tmio: add generic hook to fixup after a completed request
>   mmc: renesas_sdhi: make quirks info accessible outside probe()
>   mmc: renesas_sdhi: support manual calibration
>=20
>  drivers/mmc/host/renesas_sdhi.h      |   9 ++
>  drivers/mmc/host/renesas_sdhi_core.c | 129 +++++++++++++++++++++++++--
>  drivers/mmc/host/tmio_mmc.h          |   1 +
>  drivers/mmc/host/tmio_mmc_core.c     |   3 +
>  4 files changed, 135 insertions(+), 7 deletions(-)
>=20
> --
> 2.20.1

