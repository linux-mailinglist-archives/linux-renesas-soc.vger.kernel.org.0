Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD904BAF7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 16:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbfFSOPr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 10:15:47 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:6126
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725899AbfFSOPr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 10:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45erZDECeD0HN16RpufBGSa8hcdPclbypFXW7uOKgFw=;
 b=fo1SoMx9pqYASxc0ThM8iSYHjyLr0/YiXtNvMGhPceEH6UGGlrxDHrnxEixRCJUkQ5yGsZCpLqMzBTMtTMbSHxke4kRvgrXUCFNhlAjaHYnLzyv7oeMQ5RRDZLUNrAOV57M3NG0lwpdE3IEzH8yvR4XfT1Ts8pCyfsBUv1rx72Q=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1563.jpnprd01.prod.outlook.com (52.133.160.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Wed, 19 Jun 2019 14:15:42 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 14:15:42 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Thread-Index: AQHVJek7vUy9P93/fEWDP1bpe4SW26ai7NGAgAAAbxCAABdRgIAAAY+A
Date:   Wed, 19 Jun 2019 14:15:42 +0000
Message-ID: <TY1PR01MB1770E5A98A22F0902168F19DC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190619124131.GB21753@pendragon.ideasonboard.com>
 <TY1PR01MB1770B099456BD96D352DF526C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190619140631.7jdbobstw7udgahy@verge.net.au>
In-Reply-To: <20190619140631.7jdbobstw7udgahy@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4591adcf-b601-411f-0b1a-08d6f4c09d11
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1563;
x-ms-traffictypediagnostic: TY1PR01MB1563:
x-microsoft-antispam-prvs: <TY1PR01MB156338F557218E1AF982F4B9C0E50@TY1PR01MB1563.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(346002)(396003)(39860400002)(136003)(189003)(199004)(5660300002)(26005)(73956011)(66476007)(446003)(99286004)(64756008)(53936002)(55016002)(186003)(74316002)(7696005)(9686003)(316002)(33656002)(66446008)(229853002)(66556008)(66946007)(6916009)(256004)(81156014)(8676002)(6436002)(8936002)(52536014)(25786009)(81166006)(6246003)(44832011)(6116002)(66066001)(7736002)(68736007)(71200400001)(2906002)(71190400001)(3846002)(11346002)(54906003)(4326008)(102836004)(76116006)(76176011)(6506007)(305945005)(53546011)(86362001)(14454004)(486006)(478600001)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1563;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0I35jnK1k+d3MkZx9CiWNiYunNtgh0/sfuZF+C4/J+fjhCqQlcJJZ7MsCHWC/oD6jJLhhDOLffXl9l+J7IhJ5ywC6qKpcWIkD8KF5VSt9nv21AnwgNO2yXjR91NUtPVXPLhXLi4O5Da5EXi49AwDnna/Z7TgPgTmydBM93WCsonbjLziyLAhOGsQBLJdlbo28VM5GFM0lc0uo6tzxkt587G3KI/qIKfL5OwcpIkzGzUsM5Vv2MzRylcLU2pArQ2AJDDLABwoEdSAK3ZXTDzhrLpNWHRU5v8LWnHa3A6ZPbIbbuLMJo7zmvlFZsjQj6yV90tl9WFd2JRbUU3IYpBhDSX7OhbMsibpRWOhf6SjS3xla2rO+e+sIEKsbB4rJXlgDB/EIj8heYSbEVDHBoW6rsQUjsuw+D5cj7MD4UyEcHw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4591adcf-b601-411f-0b1a-08d6f4c09d11
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 14:15:42.4092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1563
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 19 June 2019 15:07
> Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI sup=
port
>=20
> On Wed, Jun 19, 2019 at 12:48:17PM +0000, Fabrizio Castro wrote:
> > Hi Laurent,
> >
> > > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owne=
r@vger.kernel.org> On Behalf Of Laurent Pinchart
> > > Sent: 19 June 2019 13:42
> > > Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI=
 support
> > >
> > > Hi Fabrizio,
> > >
> > > Thank you for the patch.
> > >
> > > On Tue, Jun 18, 2019 at 04:18:39PM +0100, Fabrizio Castro wrote:
> > > > Add HDMI support to the HiHope RZ/G2[MN] mother board common
> > > > dtsi.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > >
> > > > ---
> > > > Please note that this patch was tested with a 4K monitor and cma=3D=
96M
> > > >
> > > >  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 62 ++++++++++++++=
++++++++++++
> > > >  1 file changed, 62 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/=
arm64/boot/dts/renesas/hihope-common.dtsi
> > > > index 625c3aa..e7568e1 100644
> > > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > > @@ -17,6 +17,18 @@
> > > >  		stdout-path =3D "serial0:115200n8";
> > > >  	};
> > > >
> > > > +	hdmi0-out {
> > > > +		compatible =3D "hdmi-connector";
> > > > +		label =3D "HDMI0 OUT";
> > >
> > > Is the label physically present on the device (printed on the board o=
r
> > > the case) ?
> >
> > I am afraid it's not. Shall I send a v2? Or perhaps Simon could take it=
 out while applying?
>=20
> Thanks,
>=20
> I have removed the label attribute when queuing this patch up for v5.3.
> The result is as follows:

Great, thank you Simon!

Fab

>=20
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Date: Tue, 18 Jun 2019 16:18:39 +0100
> Subject: [PATCH] arm64: dts: renesas: hihope-common: Add HDMI support
>=20
> Add HDMI support to the HiHope RZ/G2[MN] mother board common
> dtsi.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 61 ++++++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/=
boot/dts/renesas/hihope-common.dtsi
> index 625c3aaead14..9f05e80cee10 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -17,6 +17,17 @@
>  		stdout-path =3D "serial0:115200n8";
>  	};
>=20
> +	hdmi0-out {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi0_con: endpoint {
> +				remote-endpoint =3D <&rcar_dw_hdmi0_out>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible =3D "gpio-leds";
>=20
> @@ -82,6 +93,30 @@
>  		states =3D <3300000 1
>  			  1800000 0>;
>  	};
> +
> +	x302_clk: x302-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <33000000>;
> +	};
> +
> +	x304_clk: x304-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <25000000>;
> +	};
> +};
> +
> +&du {
> +	clocks =3D <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 722>,
> +		 <&versaclock5 1>,
> +		 <&x302_clk>,
> +		 <&versaclock5 2>;
> +	clock-names =3D "du.0", "du.1", "du.2",
> +		      "dclkin.0", "dclkin.1", "dclkin.2";
> +	status =3D "okay";
>  };
>=20
>  &ehci0 {
> @@ -109,11 +144,37 @@
>  	};
>  };
>=20
> +&hdmi0 {
> +	status =3D "okay";
> +
> +	ports {
> +		port@1 {
> +			reg =3D <1>;
> +			rcar_dw_hdmi0_out: endpoint {
> +				remote-endpoint =3D <&hdmi0_con>;
> +			};
> +		};
> +	};
> +};
> +
>  &hsusb {
>  	dr_mode =3D "otg";
>  	status =3D "okay";
>  };
>=20
> +&i2c4 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	versaclock5: clock-generator@6a {
> +		compatible =3D "idt,5p49v5923";
> +		reg =3D <0x6a>;
> +		#clock-cells =3D <1>;
> +		clocks =3D <&x304_clk>;
> +		clock-names =3D "xin";
> +	};
> +};
> +
>  &ohci0 {
>  	status =3D "okay";
>  };
> --
> 2.11.0

