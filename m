Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B8324A52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 10:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfEUI1d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 04:27:33 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:58544
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726201AbfEUI1d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 04:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxJufPD7Sj64eiG5Amc2+rjEXND/O7dxYk+LELzdG0g=;
 b=V+8TXPGVAc6sJa9SaPhAxJETiMuGihgYvsUocCo8rSf9HjQ8QHMOBpbv+0XR2km15wzkeMfovTtXw3YPq/Wdjb546YuavhSAtWi1UsGiYBQsQcd0tkIeMC9dsBSl2vCq7LdOzprlpS+7FdgnsZBV1BoR9GqrYVuJbfUP77QvpnU=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2481.jpnprd01.prod.outlook.com (52.134.245.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Tue, 21 May 2019 08:27:24 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 08:27:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 2/7] dt-bindings: usb: renesas_usb3: Document usb role
 switch support
Thread-Topic: [PATCH v6 2/7] dt-bindings: usb: renesas_usb3: Document usb role
 switch support
Thread-Index: AQHVCxgOYVTacbZXFUG//sel1YhPLKZ1QuVg
Date:   Tue, 21 May 2019 08:27:23 +0000
Message-ID: <OSAPR01MB308934C379A9759841E58043D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1557922152-16449-3-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d069454e-c445-431f-e310-08d6ddc626a2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2481;
x-ms-traffictypediagnostic: OSAPR01MB2481:
x-microsoft-antispam-prvs: <OSAPR01MB24813A79A0A17D59C4FDD227D8070@OSAPR01MB2481.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(396003)(366004)(376002)(136003)(189003)(199004)(486006)(6246003)(6116002)(7416002)(66066001)(53936002)(6436002)(476003)(81166006)(81156014)(9686003)(68736007)(25786009)(4326008)(8676002)(55016002)(8936002)(5660300002)(11346002)(446003)(229853002)(478600001)(52536014)(54906003)(86362001)(14454004)(316002)(110136005)(305945005)(71200400001)(76176011)(66446008)(14444005)(256004)(33656002)(102836004)(6506007)(3846002)(64756008)(76116006)(186003)(7736002)(73956011)(71190400001)(26005)(7696005)(74316002)(66556008)(66476007)(66946007)(55236004)(2906002)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2481;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ANPJlg8Yj+l+9rt8Tww79NZKo7hfVB1fG4MFU11WDcNyRqvHGg73c+wm0uaYa8vYlNTQ5i6kgYlO9B5NzTRjRAmY5JhJSXeiMba6Gjxp/7ZOUx8RaRAZ2YrXXEK2L0w3329T0u7qrs+Bc12jaJUU+R77hA02RTQkmemYkJRzy8OY5FrhgLyk73R8K2Wb5Li1jXheoOq78mGleV9klRcXCZj8pS11Uxd7duA1AXRvbmGdztwjiq9S2FuJO9kcARcOhcYDFbom0jDXdQVsf2X1APjQvzB4mwGx/zm3IVYMIjTYoszgWOoxef94hDq2Kq0NADq9OO+Dauocaq0WoH/9ZvKcjp2R9/88Pnmu3Rqfs2Vu84uZo3G1qaxNHQvG07CCGbCNdEVNzc+EMHl5mrYtm8xVy9sYZ0d9SRooh8KJilw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d069454e-c445-431f-e310-08d6ddc626a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 08:27:23.9608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2481
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Wednesday, May 15, 2019 9:09 PM
>=20
> Update the DT bindings documentation to support usb role switch
> for USB Type-C connector using USB role switch class framework.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V5-->V6
>   * Updated description
>   * Added usb-role-switch-property
>  V4-->V5
>   * No Change
>  V3-->V4
>   * No Change
>  V2-->V3
>   * Added optional renesas,usb-role-switch property.
>  V1-->V2
>   * Added usb-role-switch-property
>   * Updated the example with usb-role-switch property.
> ---
>  .../devicetree/bindings/usb/renesas_usb3.txt       | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> index 35039e7..ea6c63c 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> @@ -22,6 +22,11 @@ Required properties:
>  Optional properties:
>    - phys: phandle + phy specifier pair
>    - phy-names: must be "usb"
> +  - usb-role-switch: support role switch. see usb/generic.txt
> +
> +Sub-nodes:
> +The port would be added as a subnode if the "usb-role-switch" property i=
s used.
> +	see graph.txt

I think we should describe which type of a subnode is needed.
I made an example below. This is based on the usb-connector.txt.
---
Sub-nodes:
- any connector to the data bus of this controller should be modeled using =
the OF graph
  bindings specified in bindings/graph.txt.
---

>  Example of R-Car H3 ES1.x:
>  	usb3_peri0: usb@ee020000 {
> @@ -39,3 +44,24 @@ Example of R-Car H3 ES1.x:
>  		interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks =3D <&cpg CPG_MOD 327>;
>  	};
> +
> +Example of RZ/G2E:
> +	usb3_peri0: usb@ee020000 {
> +		compatible =3D "renesas,r8a774c0-usb3-peri",
> +			     "renesas,rcar-gen3-usb3-peri";
> +		reg =3D <0 0xee020000 0 0x400>;
> +		interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cpg CPG_MOD 328>;
> +		companion =3D <&xhci0>;
> +		usb-role-switch;
> +
> +		port {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			usb3peri_role_switch: endpoint@0 {
> +				reg =3D <0>;

I'm not sure, but I don't think this endpoint@0 and reg =3D <0> are needed.
In other words, can we use have following node?
			usb3peri_role_switch: endpoint {
				remote-endpoint =3D <&hd3ss3220_ep>;
			};

Best regards,
Yoshihiro Shimoda

