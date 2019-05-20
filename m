Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F5D23344
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 14:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731642AbfETMNT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 08:13:19 -0400
Received: from mail-eopbgr1410118.outbound.protection.outlook.com ([40.107.141.118]:34597
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730921AbfETMNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 08:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVbRf23qLzksUBMaCijPpkabW6SegJqiOIIEVnb879Y=;
 b=oNrOwn/uYMW6L8BhU0GooQwMSJUXYpPgHyd1+j0viw71kFFaBySLiOz2Uo6tGzXQhBgNuOu3UqASkPtUkr/WQB98zB6iQp+QA5qi+ufq54THByu2MVpyMvBWSSI/cHYZMMjmquRejz+WORTfLKRhqfTIg9bDwd5Gn/MPHtYgGo8=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4165.jpnprd01.prod.outlook.com (20.178.99.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Mon, 20 May 2019 12:13:15 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 12:13:15 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r8a774c0-cat874: Add WLAN
 support
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r8a774c0-cat874: Add WLAN
 support
Thread-Index: AQHVC8azXpKfL4HQ4Em7s1MTntYjoaZz7agAgAAFY5A=
Date:   Mon, 20 May 2019 12:13:14 +0000
Message-ID: <OSBPR01MB2103EEC3D299D26015F50EC8B8060@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
 <1557997166-63351-2-git-send-email-biju.das@bp.renesas.com>
 <20190520115313.koe4vjykiiun3tef@verge.net.au>
In-Reply-To: <20190520115313.koe4vjykiiun3tef@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ab3670b-41a5-40a7-af95-08d6dd1c895f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4165;
x-ms-traffictypediagnostic: OSBPR01MB4165:
x-microsoft-antispam-prvs: <OSBPR01MB4165FCE08AF13E821C4226CBB8060@OSBPR01MB4165.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(39860400002)(366004)(346002)(396003)(189003)(199004)(53936002)(14454004)(26005)(7736002)(33656002)(6116002)(3846002)(74316002)(305945005)(81166006)(8936002)(81156014)(8676002)(478600001)(2906002)(9686003)(68736007)(73956011)(66946007)(66556008)(66476007)(76116006)(316002)(55016002)(66446008)(64756008)(6436002)(256004)(5660300002)(4744005)(229853002)(52536014)(86362001)(71200400001)(99286004)(6916009)(71190400001)(76176011)(7696005)(54906003)(4326008)(186003)(66066001)(25786009)(11346002)(102836004)(6246003)(107886003)(44832011)(486006)(476003)(6506007)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4165;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G3+uO57hgT8P9yPVWeQAhcRD6wZ0PvH5qxyyU44VmntFSBthZ6EpDuugpG9bhy1JHGIeptNILG6Vn079fXR3AV1IeZ0cfbvDd8GLhC3ZEHbdcr69RFDpt0f/ZR34V1D4xUB7VqQqCjuJWQsDJFKVOFUpUzcx+BLglA/eTRq2vtzC8eQrLUUkd81kboEURFcCSMGV/7rX/0xZGR5fBgdJ/urayZqc5LVAanGxS4RlirM3A0HDGFRWoq7DS0YTNVLz8EbMglRBAbt1cHpMGXYHL9EPzmCqz4fH36xzI1RSg7+RBf9lriTj/Jcr9rRFaSvsXl01LwXnT+zjVnPm2KaQFvXMh4Hu9zT8s3moeQ9nqsnVEQHxNxZ2z0UCsrtLQvayJIG7KE/m38fmoKp3Ypi0OW0FbaGjNiOOASwcin+KXkU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab3670b-41a5-40a7-af95-08d6dd1c895f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 12:13:14.8568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4165
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0-cat874: Add WLAN
> support
>=20
> On Thu, May 16, 2019 at 09:59:25AM +0100, Biju Das wrote:
> > This patch enables WLAN support for the CAT874 board.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>=20
> Thanks Biju,
>=20
> applied for v5.3 with the subject updated to:
>=20
> arm64: dts: renesas: cat874: Add WLAN

Thanks  Simon.
