Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEAB83CCB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 15:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390032AbfFKNMJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 09:12:09 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:44496
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389077AbfFKNMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 09:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cMuS4gsqjAgnz37TEKlHRK1cbHkybuipfSHgOIQMAw=;
 b=H1mABFdG/HUGXjV4ehMqzN/GuysEbq+Je1E1FF+30hgiv747BwP5C/Bvtrwh8rkmuILsVGkb37MqT8RNNDRvPKvPE3KTH7LxG94SiNXaQxguLF0YjVOICZXYDkV+l+ihTrGjmavgJfGqFeVdckmn9uc0Age9vPZCBQeqJtkTd68=
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.168.140) by
 TYXPR01MB1600.jpnprd01.prod.outlook.com (52.133.167.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 11 Jun 2019 13:12:05 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::acfa:7109:d143:eefb]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::acfa:7109:d143:eefb%7]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 13:12:04 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH 0/6] Add USB2.0/CMT/TMU support to HiHope RZ/G2M
Thread-Topic: [PATCH 0/6] Add USB2.0/CMT/TMU support to HiHope RZ/G2M
Thread-Index: AQHVIFaRfqtojhOoXkS8bzmIbfpQG6aWbVow
Date:   Tue, 11 Jun 2019 13:12:04 +0000
Message-ID: <TYXPR01MB1775725F45944C969BCDD49EC0ED0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93fd71fd-3618-4b4f-9448-08d6ee6e6651
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYXPR01MB1600;
x-ms-traffictypediagnostic: TYXPR01MB1600:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <TYXPR01MB16005516ABD4238EC2905240C0ED0@TYXPR01MB1600.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6029001)(396003)(346002)(376002)(39860400002)(366004)(136003)(189003)(199004)(7736002)(66946007)(478600001)(256004)(74316002)(8936002)(86362001)(8676002)(6116002)(81156014)(5660300002)(52536014)(73956011)(71200400001)(71190400001)(7416002)(81166006)(66476007)(66446008)(7696005)(110136005)(64756008)(54906003)(76176011)(3846002)(6506007)(53546011)(66556008)(99286004)(102836004)(44832011)(11346002)(486006)(446003)(4326008)(68736007)(186003)(33656002)(229853002)(305945005)(25786009)(76116006)(26005)(476003)(6436002)(316002)(9686003)(966005)(53936002)(14454004)(6306002)(55016002)(66066001)(2906002)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1600;H:TYXPR01MB1775.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FoObxzFueNIe2cg7G2pPdCQVOMjZhu0JgaQtb6oUBbvI/IYJhk0SegFv3BqZBTZWvcg+iWeSdRsgTh27VLLHM59Q2P7Hr/LXTvvb1EmvleGejUsYVdHnFmolIrD4W166fSjcDsgRGsbCVaPn8wsXJd0/coGf/bA8N1CZg+aft7V58dgTjdmAeRsDRhGgbJ6RQaFdBKx2KHLubXaKSIFFRrqa+Jy1RQl4zrEInD0LvnZucWzKghqbxNXB1TR85wSRM0ZCK2MWFkeRrDkMS/1ttRucr0YiSCjaMkhfq+k++ZF9xDL4BffqyMA0Sr+E3x0iE4Q/1RycfOrlGh2CPi4QiIvVAKB3OA654+X1WIRtzStP2toDNSIU2xGr+DuJ6ApdSUhatbmTuuwyqGIWqJBD7HX7K2ZiXARUnBJEnN6G014=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93fd71fd-3618-4b4f-9448-08d6ee6e6651
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 13:12:04.8100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1600
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 11 June 2019 14:07
> Subject: [PATCH 0/6] Add USB2.0/CMT/TMU support to HiHope RZ/G2M
>=20
> Dear All,
>=20
> this series adds USB2.0/CMT/TMU support to the HiHope RZ/G2M.

Ah, I forgot to mention that this series depends on:
https://patchwork.kernel.org/cover/10980861/
https://patchwork.kernel.org/patch/10980997/
https://patchwork.kernel.org/patch/10986211/

Thanks,
Fab

>=20
> Thanks,
> Fab
>=20
> Fabrizio Castro (6):
>   arm64: dts: renesas: r8a774a1: Fix USB 2.0 clocks
>   arm64: dts: renesas: hihope-common: Add USB 2.0 support
>   arm64: dts: renesas: r8a774a1: Add CMT device nodes
>   clk: renesas: r8a774a1: Add TMU clock
>   dt-bindings: timer: renesas: tmu: Document r8a774a1 bindings
>   arm64: dts: renesas: r8a774a1: Add TMU device nodes
>=20
>  .../devicetree/bindings/timer/renesas,tmu.txt      |   1 +
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi     |  76 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi          | 151 +++++++++++++++=
++++--
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c            |   5 +
>  4 files changed, 225 insertions(+), 8 deletions(-)
>=20
> --
> 2.7.4

