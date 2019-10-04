Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE16CBDC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 16:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389043AbfJDOqx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 10:46:53 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:56640
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388936AbfJDOqw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 10:46:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LU/Trt2UezvVhtfglPXDmakkAFiwbeMIY8XmaCgg+9LUvpP6U+oFo0CqYYmlWJhk6dmaTdMIxdxaB8ghKJdkNeofbH7zpU1f87XMxJUnpDCsHz7wB17XzSdLKwPw05F2mInQMAwJC1ZSlY6dLyXkU/O8Dd+TZ6GxhuEAItEkTkCl5zdUMAyoEjVN1sTN78VF3TnigxS0MbawR6LdK074w7QwTSXVMqRKjpSAKJENZsKEwFOuk+7H/vNr4GVVxzZtMIsD2gXqU45VzNV5pR5BDACYxB1VBdpUgWMtWoQFr0wC5rlc9LkW66Yo+kVn39a5WTZ7+y6hrtL5Z8xS7HNXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PQ1mfOjYnt+bN8SWxq4YECOg/EemZ/6s6yPNOktSkE=;
 b=dnV8kEgR26yhbtDP6LlMv2ukX22dj1MpaFF+7zdWOux/+cLZYlZvLKL/4z52WjBLh79IIALdBDo7MoomDxwJH4jD+YdWcpsRy3BF7+zTcV65pkFrqVAY99WudXCfAM8/Rr8ZaNfyk98nFJqLi4YqmO3fKcw/D1xIuVFrjR6lXpq+F1FfyrupWUBmDz19U9TnXO/iVZ/INaV7aM8+b5WgYSQvxxQxw5C6zyjvxFsNZdpRh1aRriMXdeBZDBme94TpzvcYH66XxUdLUh5XPdjzhrpa9dKDsRoEB27b22YEAua/pIRwjMeit0GDTrh8jHKMPoFhPFTGqNMG3v9foCBADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PQ1mfOjYnt+bN8SWxq4YECOg/EemZ/6s6yPNOktSkE=;
 b=TSTUNhustlhiY9yFr2pGsrSRG05y89DGI0A+dlpR+DUErQQ0l29Tu+OF6A4+8J9VbwjidrTqbr6j/K2ooOlpfLe1JKSAT+fkFDJK0jvc+vaezpqa+vNUx03RL1f3kMZDz+uhMqOcCtQWTif2+0edIx4CVzPs91fJiRs5uypxRRQ=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBSPR01MB0018.jpnprd01.prod.outlook.com (20.179.184.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Fri, 4 Oct 2019 14:46:49 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:46:49 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Simon Horman <horms@verge.net.au>,
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
Thread-Index: AQHVesExhg24U/9gskGcAXQ/KS8R3qdKjluAgAAAIRA=
Date:   Fri, 4 Oct 2019 14:46:48 +0000
Message-ID: <OSBPR01MB210369703B86FC189ECE9563B89E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1570199795-49169-1-git-send-email-biju.das@bp.renesas.com>
 <TY1PR01MB1770CB0A3FC07D61B903BFB9C09E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770CB0A3FC07D61B903BFB9C09E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1052983-fd83-4528-e41f-08d748d9b02d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBSPR01MB0018:|OSBSPR01MB0018:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBSPR01MB0018FEAB3CB6B7754C736C9FB89E0@OSBSPR01MB0018.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(189003)(199004)(51914003)(7696005)(76176011)(86362001)(6506007)(33656002)(102836004)(5660300002)(99286004)(14454004)(25786009)(66066001)(305945005)(7736002)(478600001)(186003)(26005)(52536014)(44832011)(486006)(476003)(11346002)(446003)(966005)(74316002)(2906002)(229853002)(9686003)(6306002)(6436002)(8936002)(55016002)(4326008)(3846002)(6116002)(6246003)(71200400001)(66446008)(64756008)(71190400001)(107886003)(8676002)(81156014)(81166006)(256004)(14444005)(76116006)(316002)(54906003)(66946007)(110136005)(66556008)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBSPR01MB0018;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EzfXfxCJkrOlqhRPpce3oNpmaajqfohqUrq0Apay7RhL4Xxob5IXTJEx+MEGqqgXQjWzBvVijiI/M7kfmmiJEdJd4/zWlZi4/TCPD9HA5qrCzMTYO3AAuzDCOxoCsIpTWi2y/daBesTXFcx52YKrWAFE8wrPtNUNVZlAE2btkXD9zDySfvq+n0DQcBiN4Mhj3OkeY5j176DAPeJsbxJiD/1tLK+xfR/DaYDnPIj4Z7tq2MShUJ4FGPr3cKl40bFF74EYln4ny7yXXY/srqGbE3ANVzijRAX0bGuoweieRftEUI7727uYURNzVXC3oaPb6Nu7uEnZwEk4j1uXAh+geTPx7pE24iwqXf41fZ6DPEVRQRP7vRnkaqu37XbsbpVCWfWwFnr3X5VJ4ydFckX1vcgMQRdWfnR17D6j+171MQijBWuFilXdjBxh7UggoEYE+B1OE4aX/dLCvxMH2PWEjg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1052983-fd83-4528-e41f-08d748d9b02d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 14:46:49.4256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/srK5EfFTYsjQL2RqugFK7QuSc2k6Qn6o0P5g297XKYiUmbUk3eBvHuKOCJeKhxvvnI4YPncRP6F2wcGu5RMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBSPR01MB0018
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Fabrizio,

Thanks for the feedback.

> Subject: RE: [PATCH v2 1/2] arm64: dts: renesas: r8a774a1: Remove audio
> port node
>=20
> Hello Biju,
>=20
> Thank you for the patch!
>=20
> > Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a774a1: Remove audio
> > port node
> >
> > This patch removes audio port node from SoC device tree and fixes the
> > below dtb warning
> >
> > Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0:
> node
> > has a unit name, but no reg property
>=20
> I think you saw this warning midway while working on the patch, I think y=
ou
> can drop this note

Ok. Will take out this.
> >
> > Fixes: e77ad88d0c6228af65 ("arm64: dts: renesas: hihope-common: Add
> > HDMI audio support")
>=20
> I think you meant e2f04248fcd4 ("arm64: dts: renesas: r8a774a1: Add audio
> support")

OK.  Will fix the commit message.

Regards,
Biju

> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > V1-->V2
> >  * New patch.
> >
> > This patch depend upon
> > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D1=
8
> > 2581
> > ---
> >  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 20 +++++++++-------
> ----
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi      | 11 -----------
> >  2 files changed, 9 insertions(+), 22 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > index 355d0a2..2c942a7 100644
> > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > @@ -86,7 +86,7 @@
> >
> >  		label =3D "rcar-sound";
> >
> > -		dais =3D <&rsnd_port0>;
> > +		dais =3D <&rsnd_port>;
> >  	};
> >
> >  	vbus0_usb2: regulator-vbus0-usb2 {
> > @@ -183,7 +183,7 @@
> >  		port@2 {
> >  			reg =3D <2>;
> >  			dw_hdmi0_snd_in: endpoint {
> > -				remote-endpoint =3D <&rsnd_endpoint0>;
> > +				remote-endpoint =3D <&rsnd_endpoint>;
> >  			};
> >  		};
> >  	};
> > @@ -319,17 +319,15 @@
> >  	/* Single DAI */
> >  	#sound-dai-cells =3D <0>;
> >
> > -	ports {
> > -		rsnd_port0: port@0 {
> > -			rsnd_endpoint0: endpoint {
> > -				remote-endpoint =3D <&dw_hdmi0_snd_in>;
> > +	rsnd_port: port {
> > +		rsnd_endpoint: endpoint {
> > +			remote-endpoint =3D <&dw_hdmi0_snd_in>;
> >
> > -				dai-format =3D "i2s";
> > -				bitclock-master =3D <&rsnd_endpoint0>;
> > -				frame-master =3D <&rsnd_endpoint0>;
> > +			dai-format =3D "i2s";
> > +			bitclock-master =3D <&rsnd_endpoint>;
> > +			frame-master =3D <&rsnd_endpoint>;
> >
> > -				playback =3D <&ssi2>;
> > -			};
> > +			playback =3D <&ssi2>;
> >  		};
> >  	};
> >  };
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > index d179ee3..34a9f47 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > @@ -1726,17 +1726,6 @@
> >  				      "ssi.1", "ssi.0";
> >  			status =3D "disabled";
> >
> > -			ports {
> > -				#address-cells =3D <1>;
> > -				#size-cells =3D <0>;
> > -				port@0 {
> > -					reg =3D <0>;
> > -				};
> > -				port@1 {
> > -					reg =3D <1>;
> > -				};
> > -			};
> > -
> >  			rcar_sound,ctu {
> >  				ctu00: ctu-0 { };
> >  				ctu01: ctu-1 { };
> > --
> > 2.7.4

