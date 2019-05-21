Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEB8248C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 09:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfEUHLk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 03:11:40 -0400
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:26208
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725790AbfEUHLk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 03:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaq7Ub6yaEuiWxmAsOJkhvX5uVHPQZRtQ3is7ZxU5ks=;
 b=A+oXlxro9cqCVEY5nZwOma6XSsS3t4W15HcRRsZS9HO3euB+RMgIP4q4vk1rlDUNkw7B2foqCNqaNjT5d4fL1J6EYGWVAlvS7E5b1r4q9s/tmm7PtQw8POAYXtmU9T+kYLZG2EhzRCplPqLLEE79ibGej/WzBnQ+YsiKG2UxIvQ=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3907.jpnprd01.prod.outlook.com (20.178.103.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 21 May 2019 07:11:37 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 07:11:37 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [PATCH] mmc: tmio: fix SCC error handling to avoid false positive
 CRC error
Thread-Topic: [PATCH] mmc: tmio: fix SCC error handling to avoid false
 positive CRC error
Thread-Index: AQHVC0tfiBVcIese/kC+61tkuBk8R6Z1MQLA
Date:   Tue, 21 May 2019 07:11:37 +0000
Message-ID: <OSAPR01MB30890F24D0F713F1B6498940D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <20190515182346.5292-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190515182346.5292-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edd78e85-513d-4ed1-6eb9-08d6ddbb9086
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3907;
x-ms-traffictypediagnostic: OSAPR01MB3907:
x-microsoft-antispam-prvs: <OSAPR01MB3907A93D714647BCF11B7F49D8070@OSAPR01MB3907.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(136003)(376002)(39860400002)(189003)(199004)(2501003)(6436002)(5660300002)(229853002)(33656002)(25786009)(446003)(11346002)(476003)(74316002)(305945005)(186003)(55016002)(26005)(486006)(9686003)(53936002)(102836004)(76176011)(6506007)(86362001)(55236004)(478600001)(99286004)(81156014)(8676002)(7696005)(66556008)(73956011)(7736002)(52536014)(66946007)(66476007)(66446008)(64756008)(2906002)(66066001)(68736007)(76116006)(6116002)(256004)(107886003)(14454004)(71200400001)(71190400001)(8936002)(6246003)(14444005)(316002)(4326008)(54906003)(110136005)(3846002)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3907;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SCQBEVt3zaopJNXwDLX0lUbaOqKDm+BrpqvakQOpy5cbHAUHsl7VY5t+dckgtUUZHYNPpTiYA4cb3Fj5iTpeJdpdnbIK6G2HTnaWbe5Gu48A7eZ4XwgrLTiXxOENS0aPopB4UUjYE8JppB1/DeYlULo+1tIwxZYr32+31cZjhbDXEzGEESV+6ZrIUcTJGiIKMRZjjeEF5Q+CwLaPCempdXX1CGc9TJqZUd+PcVoHDECZ98XBMYJbAdy1C8ljmAA4IjWFXSyHZAeU1SeUADXkrd8v2+bm1sEFlnlAp4WFC+m/QIcs+41B0WEn2p8KRw8oBxk8MInWV8s4HfNex2AmkusbiqnbP9YCtN7H2c8o7LPw1k73qoVSwdKH7Xzd4B5+vEMnvdI3Oc58gv4o/ZT6jQVptd8lQU1Tifo5nOzOarc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd78e85-513d-4ed1-6eb9-08d6ddbb9086
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 07:11:37.1528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3907
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, May 16, 2019 3:24 AM
>=20
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>=20
> If an SCC error occurs during a read/write command execution, a false
> positive CRC error message is output.
>=20
> mmcblk0: response CRC error sending r/w cmd command, card status 0x900
>=20
> check_scc_error() checks SCC_RVSREQ.RVSERR bit. RVSERR detects a
> correction error in the next (up or down) delay tap position. However,
> since the command is successful, only retuning needs to be executed.
> This has been confirmed by HW engineers.
>=20
> Thus, on SCC error, set retuning flag instead of setting an error code.
>=20
> Fixes: b85fb0a1c8ae ("mmc: tmio: Fix SCC error detection")
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: updated comment and commit message, removed some braces]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> This patch was suggested by the BSP team because they were seeing CRC err=
ors
> with a hardware I don't have access to. I tested this with my R-Car H3-ES=
2.0
> and M3-N (both Salvator-XS), and things were still running fine. But I su=
ggest
> to wait for a final ack from Shimoda-san or someone from the BSP team.

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

