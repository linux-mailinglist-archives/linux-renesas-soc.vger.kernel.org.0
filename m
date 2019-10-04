Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C27FCBD99
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 16:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388733AbfJDOm2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 10:42:28 -0400
Received: from mail-eopbgr1400105.outbound.protection.outlook.com ([40.107.140.105]:30272
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388840AbfJDOm2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 10:42:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5RX+LdwpuexQ7VM5T/EZ1xmZ3IrLmgRxsVA6G7xC69roJfyuKCGr+/RW3bO1cW8e19w4ICO4/75PbgyBHzZpT/JC8jKmBOcAHB7KRJIvolsxxdpBhk+75BvZXZ0vOXzbZkaNqt5w/80EUYVC9W4f7dbI03RTK5NyEtWrV2JgLrJ2mMqAj4FNwHEAlO5yXCl2efrcb1X2QdiPxhC+SmKnU0VIz0DV6ZvMCbbxa+UDFqyCYZ9DM89nG8ETidaou5HXUTyeMsfwTUoBvpXC+BMJWlBhOycPYroWX/vlNdbN9NiVglR4c7SQXqu/IfK2e13sUhg2J2WiIatrNcXi5rhNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl/ZTuvtQVfyQXBjycvDuCY/pMUWFCzz1IEJ8OpbMKQ=;
 b=RIlO4uTLhn0ZeRBSTOOY/HNFvQ+xhkRBAz88WUpdvQShlPr6+XUkiRALTJOtv8n74gjCtUUfjExn1kYCjAYVc5HA+9ZZoQL0TB17bdZbyMu480RWiWL6XcuEK71hyHrpWSQKsFS9zF688GA9hfTDfK4juTqTaoadWNpFGOcu5KWvKtjPgtw7hYMrbiw5t85UDaZXMxf77zNY/CWmjZ3ov2+8TKd+iPAtRTXrxdCiMHQ0qjLkoNfGzyYXxRnl7yJH9NTnnG4x+N/Lof+Y8A6Y2jaN+CymB0JY2WqWRLu7qjwPgrmPa6qHzi0S+78a9oPRh3l4HLrH1nnRklofPaffBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl/ZTuvtQVfyQXBjycvDuCY/pMUWFCzz1IEJ8OpbMKQ=;
 b=MZDCOYy4ksQkRPy8qVNVWjLqY9KO58Coq/6wjA/OTBwpEeSK+Re3nggl2wkgEuUkRvWdF4TJTYldNXeK6pbQEvyh0Ws0we6Za0rn2ezZl8b9CS890pAeP4ZUfmggIvOYBNIMLvCEnQgEx0tluR7CCj+B3heSuZvRUePFj2LETIM=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1578.jpnprd01.prod.outlook.com (52.133.161.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 14:42:24 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::55fe:d020:cc51:95c4]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::55fe:d020:cc51:95c4%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:42:24 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH v2 1/2] arm64: dts: renesas: r8a774a1: Remove audio port
 node
Thread-Topic: [PATCH v2 1/2] arm64: dts: renesas: r8a774a1: Remove audio port
 node
Thread-Index: AQHVesEx8qgzEuyGhUm32JyeMIy6I6dKjaYw
Date:   Fri, 4 Oct 2019 14:42:23 +0000
Message-ID: <TY1PR01MB1770CB0A3FC07D61B903BFB9C09E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1570199795-49169-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570199795-49169-1-git-send-email-biju.das@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb4e5a48-6898-4afb-fe4f-08d748d911de
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TY1PR01MB1578:|TY1PR01MB1578:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB157835A47D3F3F04B9568238C09E0@TY1PR01MB1578.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(199004)(189003)(107886003)(55016002)(229853002)(64756008)(66446008)(66476007)(66946007)(9686003)(3846002)(498600001)(76116006)(66066001)(6116002)(6246003)(33656002)(14454004)(966005)(6306002)(6436002)(66556008)(71200400001)(44832011)(486006)(86362001)(476003)(81156014)(446003)(8936002)(11346002)(4326008)(26005)(305945005)(8676002)(81166006)(76176011)(186003)(7736002)(71190400001)(6506007)(7696005)(53546011)(74316002)(99286004)(5660300002)(52536014)(54906003)(256004)(2906002)(14444005)(110136005)(25786009)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1578;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JFVTeZL11ipD2UjFcCpaB85XmHh4KNF1kDYXwwyOBi0ub3UAyHqwdX/Xw9HnzxHuLBMF+9UMBOZZWOZCJXPAJTfpS3PlNUhp30c6xet3AsJdmtbnrruueZuK6/Xmy7mp9U1oT1T8EQaNILl79ALXtfbTohMvsien3AaQP3en6zIeSM9LHI6Hqoeilb7AbEWhrOj0C+GIXYcvMQOXkm3NOgH3SerV+9+mCacA0/DvwfDuvqesYp8M4H7JECDDlane3lb8zmnQD80he1e1EIdmAisWSWYVqf5aTp/QNWIxRy6K3uI6klgWsalA6JOpxyjQekikxqS+rbB59V+9z1NJU437zfBUWLfoobnRHmyPlZw4sv7xGUFrIg/bYd6Dc863tey+NObBia+AXTpZZzp0Uas2ekudZnV2P2CVDiHQR/W2mFh+zfFmVuovRm8W55nJh8Ub4FOODwgk57tpWYFPQg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4e5a48-6898-4afb-fe4f-08d748d911de
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 14:42:23.9225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGqjwaqiMKXFWlfGiY1uv2chemy6wTT6EWp+ezA+Q4CKf144yukvIZPeOMB8M5pkR0D2A1yCGafPsysp216gP5dWbsh6rm44i2tCq/ohP70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1578
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Biju,

Thank you for the patch!

> From: Biju Das <biju.das@bp.renesas.com>
> Sent: 04 October 2019 15:37
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>
> Cc: Biju Das <biju.das@bp.renesas.com>; Simon Horman <horms@verge.net.au>=
; Geert Uytterhoeven <geert+renesas@glider.be>;
> Magnus Damm <magnus.damm@gmail.com>; linux-renesas-soc@vger.kernel.org; d=
evicetree@vger.kernel.org; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro <fabrizio.castro@bp.renesa=
s.com>
> Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a774a1: Remove audio port =
node
>=20
> This patch removes audio port node from SoC device tree and
> fixes the below dtb warning
>=20
> Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has
> a unit name, but no reg property

I think you saw this warning midway while working on the patch, I think you=
 can drop this note

>=20
> Fixes: e77ad88d0c6228af65 ("arm64: dts: renesas: hihope-common: Add HDMI =
audio support")

I think you meant e2f04248fcd4 ("arm64: dts: renesas: r8a774a1: Add audio s=
upport")

Cheers,
Fab

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
>  * New patch.
>=20
> This patch depend upon
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D182=
581
> ---
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 20 +++++++++-----------
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi      | 11 -----------
>  2 files changed, 9 insertions(+), 22 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/=
boot/dts/renesas/hihope-common.dtsi
> index 355d0a2..2c942a7 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -86,7 +86,7 @@
>=20
>  		label =3D "rcar-sound";
>=20
> -		dais =3D <&rsnd_port0>;
> +		dais =3D <&rsnd_port>;
>  	};
>=20
>  	vbus0_usb2: regulator-vbus0-usb2 {
> @@ -183,7 +183,7 @@
>  		port@2 {
>  			reg =3D <2>;
>  			dw_hdmi0_snd_in: endpoint {
> -				remote-endpoint =3D <&rsnd_endpoint0>;
> +				remote-endpoint =3D <&rsnd_endpoint>;
>  			};
>  		};
>  	};
> @@ -319,17 +319,15 @@
>  	/* Single DAI */
>  	#sound-dai-cells =3D <0>;
>=20
> -	ports {
> -		rsnd_port0: port@0 {
> -			rsnd_endpoint0: endpoint {
> -				remote-endpoint =3D <&dw_hdmi0_snd_in>;
> +	rsnd_port: port {
> +		rsnd_endpoint: endpoint {
> +			remote-endpoint =3D <&dw_hdmi0_snd_in>;
>=20
> -				dai-format =3D "i2s";
> -				bitclock-master =3D <&rsnd_endpoint0>;
> -				frame-master =3D <&rsnd_endpoint0>;
> +			dai-format =3D "i2s";
> +			bitclock-master =3D <&rsnd_endpoint>;
> +			frame-master =3D <&rsnd_endpoint>;
>=20
> -				playback =3D <&ssi2>;
> -			};
> +			playback =3D <&ssi2>;
>  		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774a1.dtsi
> index d179ee3..34a9f47 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -1726,17 +1726,6 @@
>  				      "ssi.1", "ssi.0";
>  			status =3D "disabled";
>=20
> -			ports {
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> -				port@0 {
> -					reg =3D <0>;
> -				};
> -				port@1 {
> -					reg =3D <1>;
> -				};
> -			};
> -
>  			rcar_sound,ctu {
>  				ctu00: ctu-0 { };
>  				ctu01: ctu-1 { };
> --
> 2.7.4

