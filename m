Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3E946FEB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2019 13:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbfGVL1c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jul 2019 07:27:32 -0400
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:29677
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726339AbfGVL1c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jul 2019 07:27:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSZx81Fg272dq1z48MF++J2SLbYhWYgi67KXk/P0g0qviz9RfMvUltp6xQ8orUiA4FnNlYeohMrk2Dq1loMw6/rIVwJl4aHbmTJ/qkAHYL7lPOXnPelcdhYrBVO2CQI76ACA6ye91XR6mxCzGnY4mL3jqBMAcxWtbDCaar20GQ8sa1Rtof2azxmZdwD0WQhOum9jGuqA2xhBFrtM6raczgy5r9b3fSVdHFejVf4+GwG9dF79uG7xt3fWSDxWd7MDDs7pGE5o2pXbTkgrQunATOvKjW0ULV3hlBc4ORnsHxHcxSvDGyuQYENTk/PmwdQUHlEKaeX+zsyf8ehy3fcS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtCG8h9YDiBiANdY17xPGEtRnwU5O3ZlhJvg82hBcqc=;
 b=aKDE7NmMyTx7aTydhwG4KZg1T/VzvuyRGNyWBm5wxpgBqHEOvsVOqOkgfmH5usXa0B77U7+zKK5ytMDETAWY34NfeaP6Qcar8ooit3oDGwyXJHmDHM9I8CISHJn+yAdQEgVow2X6kIrVY61sGiZ9w2/rIGBNPF+sIzOOMttog50t03D8cWD7e4A1cGWQLjQiKy66POqFDhp8SE6NLrjExyXLnc+Ctrr6ptV2P9wqS8L6PZCKMTEoKN8koKmwTqgifkuTQ7ZkiGAjjy+/4XdMRnImefbQ+jZHwQnxF90p6zhPcF2mMxT+dg8UDcVOaOKBFQOChm4nHdwPFWxNcNdZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtCG8h9YDiBiANdY17xPGEtRnwU5O3ZlhJvg82hBcqc=;
 b=aKmxY1TbXmXKBwD8R9kugVwJr09XObsiZGSrxh+D7Z/cmNjJ8846S1hihofjVhQZG6g6zTSUOLO5PQwzF+pHZ94djESVcy3EhZ3k8zschC3HFZUngU1MguOZ/OcEJCA/YuhsBSy/GlprnE3W45x5FeIw/5QvBL/lClLfRSwdE3I=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1564.jpnprd01.prod.outlook.com (52.133.162.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 11:27:27 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 11:27:26 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 10/10] [HACK] arm64: dts: renesas: ebisu: Enable LVDS
 dual-link operation
Thread-Topic: [PATCH v3 10/10] [HACK] arm64: dts: renesas: ebisu: Enable LVDS
 dual-link operation
Thread-Index: AQHVFV+LuQSI9RSCM0+gPOgQhRN8ZKbWymOQ
Date:   Mon, 22 Jul 2019 11:27:26 +0000
Message-ID: <TY1PR01MB177063CF6128DB62E16FD0EBC0C40@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-11-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190528141234.15425-11-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8325a959-1939-4a90-c6a1-08d70e979328
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1564;
x-ms-traffictypediagnostic: TY1PR01MB1564:
x-microsoft-antispam-prvs: <TY1PR01MB1564A15151EEE8792CE9E812C0C40@TY1PR01MB1564.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(54094003)(199004)(189003)(52536014)(3846002)(6116002)(7736002)(305945005)(54906003)(81166006)(8676002)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(5660300002)(256004)(76176011)(8936002)(86362001)(81156014)(4326008)(7696005)(71200400001)(71190400001)(44832011)(66066001)(99286004)(6246003)(74316002)(102836004)(53936002)(2906002)(9686003)(68736007)(25786009)(55016002)(476003)(229853002)(53546011)(478600001)(6506007)(14454004)(110136005)(316002)(486006)(446003)(33656002)(186003)(6436002)(11346002)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1564;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bvDxIstGJav/46JnmZgTXHhnJMS+h/P7yaUg7+qUQjvrLtEbP4uBEePFj5XboZnmrFekfz5jM7RckqiK5Bb4dshEKT/+mAjAMJv29cDq2H2bPD5/3m2huJ0PWngvguYkMEtmonxpdp2uOwYAuxbK1+eObEfgLOi6bhP9cyBUV+nDa9hJ8QS+6LVDS4eLR0l2edXEEirKKOKPf6KqVfvw1k+4Hy6NGaAePPzwV2K6GbLfP57Fp6BM/wPqkAg1eqsjeVHDRste4v1f8YAXkeWWpuzuvNFarQ5CK+ADvXQ8aUryTRShQjo5xs09KDPrMDeu56UK/Wc87R2KfdOogc86ZxavRj285SMIWi7EPKjldDwj+iDq/fphrdW3FTW3v9GWMTVOgMls9ZLGtNtRAw2kupHiHOONv69HmPQcyCSY2Yw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8325a959-1939-4a90-c6a1-08d70e979328
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 11:27:26.6748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1564
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Jacopo,

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Laurent Pinchart
> Sent: 28 May 2019 15:13
> Subject: [PATCH v3 10/10] [HACK] arm64: dts: renesas: ebisu: Enable LVDS =
dual-link operation
>=20
> Enable and connect the second LVDS encoder to the second LVDS input of
> the THC63LVD1024 for dual-link LVDS operation. This requires changing
> the default settings of SW45 and SW47 to OFF and ON respectively.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

How did you test this patch on Ebisu (kernel branch, configuration, switche=
s,etc.)?

I tested both linux-next and drm/du/lvds/dual-link and they are not working=
 for me.
The base configuration I am using is coming from arch/arm64/configs/defconf=
ig from each respective branch, on top of that I am enabling the remaining =
bits and pieces.
I have tried the suggested configuration of the switches for this patch, ba=
sically nothing is happening. I have also tried reverting the changes made =
by this patch (on both branches), and of course I have reverted the selecti=
on for the switches as well, and even single-link doesn't work for me. Sing=
le-link support from the BSP version of the kernel (4.14.75-ltsi) works for=
 me, that confirms the configuration of the switches I am using when testin=
g single-link should be okay.

If, in the single-link use case from drm/du/lvds/dual-link, I connect lvds1=
 to the vga-encoder in the DT (like for the BSP DT, but I can see from the =
schematics that ADV7123 is actually connected to DU, like the configuration=
 in the DT upstream), then HDMI works as expected (most of the time).=20

I wonder if for some reason we may end up using the wrong lvds encoder at t=
imes, or no encoder at all?

Have you seen this problem? Am I missing something obvious here?

Thanks,
Fab

> ---
>  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 24 +++++++++++++------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/=
boot/dts/renesas/r8a77990-ebisu.dts
> index c72772589953..988d82609f41 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -93,11 +93,18 @@
>=20
>  			port@0 {
>  				reg =3D <0>;
> -				thc63lvd1024_in: endpoint {
> +				thc63lvd1024_in0: endpoint {
>  					remote-endpoint =3D <&lvds0_out>;
>  				};
>  			};
>=20
> +			port@1 {
> +				reg =3D <1>;
> +				thc63lvd1024_in1: endpoint {
> +					remote-endpoint =3D <&lvds1_out>;
> +				};
> +			};
> +
>  			port@2 {
>  				reg =3D <2>;
>  				thc63lvd1024_out: endpoint {
> @@ -482,24 +489,27 @@
>  	ports {
>  		port@1 {
>  			lvds0_out: endpoint {
> -				remote-endpoint =3D <&thc63lvd1024_in>;
> +				remote-endpoint =3D <&thc63lvd1024_in0>;
>  			};
>  		};
>  	};
>  };
>=20
>  &lvds1 {
> -	/*
> -	 * Even though the LVDS1 output is not connected, the encoder must be
> -	 * enabled to supply a pixel clock to the DU for the DPAD output when
> -	 * LVDS0 is in use.
> -	 */
>  	status =3D "okay";
>=20
>  	clocks =3D <&cpg CPG_MOD 727>,
>  		 <&x13_clk>,
>  		 <&extal_clk>;
>  	clock-names =3D "fck", "dclkin.0", "extal";
> +
> +	ports {
> +		port@1 {
> +			lvds1_out: endpoint {
> +				remote-endpoint =3D <&thc63lvd1024_in1>;
> +			};
> +		};
> +	};
>  };
>=20
>  &ohci0 {
> --
> Regards,
>=20
> Laurent Pinchart

