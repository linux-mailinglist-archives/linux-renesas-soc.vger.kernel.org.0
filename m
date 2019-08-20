Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3826961A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 15:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbfHTNwY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 09:52:24 -0400
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:37443
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728248AbfHTNwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 09:52:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTcEaUVIsAdCV7o/GWwBzSxMSfd0/dezrPLk5aTZ/s6V0PMaPHrwnr+KmRBUcrw6//PdpyK6VG27G2BOVWIePawMlasCTAtYft9KhZ47TNzMFh49pVG5l9IJ+IkIYvt5tFcTgl8n8l5vwfmTa3RzXO39cgSgZpJ00m2N2P1FLBDgDgQmZHDB9/iIESa1yqa4HtoU5iWxsfycDz03x6rDdDGLbQaPNZgdjjxhObic1RyISSPFLqrnR2OdF55BNS89POCSht/fpdURaTYIrseXv9bBTpuSb/aEkPSgXoW34HdArh+ADHwBKjuu8ZNCHMn0PjNGrZ3Ss8lP4eiDKJ48PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8qT3BiU61F1nrz9OsIPOaUi3VNcSCCyQxtDu+g/Baw=;
 b=ZRa5ryI/YoG1BmwOBiKujMSrNV75ZANb+pO+qiZ4h1CRKKYmyZP6x/1J0UlXv27lqMfnliYQRqsVEjgZdmk/Vj25UbnnY7Xyrdd7Mkcpaw7oMUO9ZqpnF4dDTwqc4MHSoPL+DPKo0UYhjXkumYj1sayhXvR9IOoFHGVepgBsJyQ/rknuoijiTHCDtwVvuI5ZVQ+wE+0XSZtMIQrpazDX08B6tDLM+ecpWFQcZZG2/xOD/ofjB1DmvWFyQrIvy1w079X/dFEkmlhHNxdlNdUO3eMUS+zOKzU6nYGzt7Ph1CnqVZR0c/nXznKRX1Bkb+IuiglAh3yDF9YEAF3xASkOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8qT3BiU61F1nrz9OsIPOaUi3VNcSCCyQxtDu+g/Baw=;
 b=NFyUS/jF3eJTyRcxGHKIcL+0foGlWbPBXenz292HKnBtgOUSJlui24gTXrvCIjZg7L/t+ypApN21bSyQfO5V+4fM/gMbSWAIpQQiHz/KW7O/PZLzV7mODzlbSSCzsbRAIGZbR1v7nGTaSN1cMES5a4NhPPwyhj8KOFoChcjFT0E=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1802.jpnprd01.prod.outlook.com (52.133.164.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 13:52:20 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd%5]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 13:52:20 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ARM: dts: r8a77470: Add PMU device node
Thread-Topic: [PATCH] ARM: dts: r8a77470: Add PMU device node
Thread-Index: AQHVVov/A8yluA5wbEyc7cnzxdCqpacEDpqQ
Date:   Tue, 20 Aug 2019 13:52:20 +0000
Message-ID: <TY1PR01MB1770E06C284134AF69D24631C0AB0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190819124529.23745-1-geert+renesas@glider.be>
In-Reply-To: <20190819124529.23745-1-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9c56e87-b755-46b4-74e0-08d725759f38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1802;
x-ms-traffictypediagnostic: TY1PR01MB1802:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1802C78B93C6F41C8D76C5C7C0AB0@TY1PR01MB1802.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(11346002)(186003)(9686003)(305945005)(53936002)(76176011)(66066001)(446003)(3846002)(6116002)(8676002)(110136005)(6436002)(6636002)(316002)(86362001)(2906002)(486006)(14454004)(476003)(25786009)(44832011)(102836004)(229853002)(53546011)(99286004)(81166006)(81156014)(71200400001)(7696005)(55016002)(6246003)(66476007)(66446008)(4326008)(64756008)(66946007)(256004)(52536014)(478600001)(33656002)(5660300002)(7736002)(26005)(6506007)(76116006)(74316002)(8936002)(71190400001)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1802;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u7hDH5Mm5qQUx+/lsfpCzL8E+ft4yqsVtF4EUjzjEI5vmIi0QJB6BzydQs2GrTVbcNG/MNwJFp9rzQ/OKDpRulj94SXaf6wM2UFjCw86fRDHLu1xMZ/3XiXxb+E2UFN3t74Z0FCwmoC6mI5SzUbF/iVoS/KtD+zE7RVap7FAblKBUCyWiiNhNT5hlF+fzb3uNfIjEW4sfX6KfaTX+MzAE/TRAWqfYwXsyHGFk++sM0rVQnul6Zi27Pe1gpwaYzPfL+l2enEybH9y64znM5WZhXZkvpe75PoaoLbVY5O0//n76uH0v5TcmUSyti2GBM8hejk0iI3GvEf0zuKl8Ja3LSVSLLAO4Or8NlMZfC5eICQvPJ/9VBJCbbfYypsIhEbkFN/wjPgzES4J91xf2dhgoV2hZuRQUdOll2f4IOyw95k=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c56e87-b755-46b4-74e0-08d725759f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 13:52:20.6574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8Ne9FkdxLTT6+WM8JHNlo1q0F4td6XqEVEizZtM5rhCVempeNvFRM2cPiI/N2KaoHUqjAzhAFC1OAgYcQUqF2Kkw+H6YW/F0ZTe7Owe9TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1802
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Geert,

Thank you for the patch!

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 19 August 2019 13:45
> Subject: [PATCH] ARM: dts: r8a77470: Add PMU device node
>=20
> Enable support for the ARM Performance Monitor Units in the Cortex-A7
> CPU cores on RZ/G1C by adding a device node for the PMU.
>=20
> New Linux output:
>=20
>     hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 counters av=
ailable
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> Untested on actual hardware.  I even made up the kernel output ;-)

Good guess!

>=20
>  arch/arm/boot/dts/r8a77470.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470=
.dtsi
> index 56cb10b42ed940dd..51806c7f486a3681 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -63,6 +63,13 @@
>  		clock-frequency =3D <0>;
>  	};
>=20
> +	pmu {
> +		compatible =3D "arm,cortex-a7-pmu";
> +		interrupts-extended =3D <&gic GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
> +				      <&gic GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity =3D <&cpu0>, <&cpu1>;
> +	};
> +
>  	/* External SCIF clock */
>  	scif_clk: scif {
>  		compatible =3D "fixed-clock";
> --
> 2.17.1

