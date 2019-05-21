Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 743CE249B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 10:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfEUIDf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 04:03:35 -0400
Received: from mail-eopbgr1400135.outbound.protection.outlook.com ([40.107.140.135]:47680
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbfEUIDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 04:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wo77SUCary/Cni4t6t6xh1vMAEKBFdTkP7xJRHoiD34=;
 b=lftoisxVdyjvRVqYuxuMFBdelWgSo91oGqwOKv6wCvd4kM3x1XBJ8O6FVlBG4n/HXm34/5qmDs6lTPXzFXGJVII1cWt+vNpsbIi1c7tcnHIEb1UJoj36mcgcEgEh6q7dO677ybSQaCmwkpKjkNeJxjs80Q3pscIa2EcF0rHcrq8=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3409.jpnprd01.prod.outlook.com (20.178.128.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Tue, 21 May 2019 08:03:29 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 08:03:29 +0000
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
Subject: RE: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
Thread-Topic: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
Thread-Index: AQHVCxgMa5SFoB4ScU+YblO0KwTthKZ1Pzwg
Date:   Tue, 21 May 2019 08:03:29 +0000
Message-ID: <OSAPR01MB30899C8C3E0F316FF37DAE3AD8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b47f4a53-1b72-44ad-bd96-08d6ddc2cfc0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3409;
x-ms-traffictypediagnostic: OSAPR01MB3409:
x-microsoft-antispam-prvs: <OSAPR01MB3409AB235F431D713BE1CF01D8070@OSAPR01MB3409.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(376002)(136003)(39860400002)(396003)(199004)(189003)(2906002)(14454004)(3846002)(5660300002)(6116002)(71200400001)(486006)(66066001)(478600001)(476003)(71190400001)(66446008)(66476007)(4326008)(66556008)(66946007)(25786009)(7736002)(11346002)(73956011)(186003)(7696005)(64756008)(316002)(81156014)(76116006)(446003)(7416002)(6246003)(74316002)(55016002)(305945005)(68736007)(6436002)(102836004)(256004)(76176011)(53936002)(5024004)(33656002)(86362001)(229853002)(6506007)(55236004)(26005)(99286004)(52536014)(81166006)(8936002)(9686003)(8676002)(54906003)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3409;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C5NgqP2An7uoFnqSkifG3oZPOIll2RKs6AbmdUUCNl5tt/ia4VPKXdfjSpdKPOcnb1gGbicywZ9191c0XJScBe4ZiKSnkIYEztbyIcNZ8hoEoEdBfpf/aCzPujlJwJqAgHpzq8yiPjqMZiPo4FrR3YuhWQmAyPZGP2EcBsLxp5Xfd/neKAlatbCfLtHznFSffHMtNMuxrobM9aZ4bYB9kTgRao0s0/x1m7hAGLR7ImqQuUEQm/DhPFwWCgxh6JtjqJwgecBci8G9eYVvXFncSNWiOyokUMiNjUF7hGeBfo58j4P0XZaZvGDz4N8RMBJ+yjrYfE0J/wJVay3Y2W3SfoNLAj4CDPZBPk5fOyZoIx/1uQKjxCAnCHFNzxbZTq99rVzU/xv3I29ne8RSTipjvFA53mnWykQxGB7a0EGWsmY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47f4a53-1b72-44ad-bd96-08d6ddc2cfc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 08:03:29.7669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3409
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Wednesday, May 15, 2019 9:09 PM
>=20
> Add device tree binding document for TI HD3SS3220 Type-C DRP port
> controller driver.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> V5-->V6
>   * No change.
> V4-->V5
>   * No Change.
> V3-->V4
>   * No Change.
> V2-->V3
>   * Added Rob's Reviewed by tag.
> V1-->V2
>   * Added connector node.
>   * updated the example with connector node.
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> new file mode 100644
> index 0000000..7f41400
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> @@ -0,0 +1,37 @@
> +TI HD3SS3220 TypeC DRP Port Controller.
> +
> +Required properties:
> + - compatible: Must be "ti,hd3ss3220".
> + - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> + - interrupts: <a b> where a is the interrupt number and b represents an
> +   encoding of the sense and level information for the interrupt.
> +
> +Required sub-node:
> + - connector : The "usb-c-connector" attached to the hd3ss3220 chip. The

s/connector :/connector:/

> +   bindings of the connector node are specified in:
> +
> +	Documentation/devicetree/bindings/connector/usb-connector.txt
> +
> +Example:
> +hd3ss3220@47 {
> +	compatible =3D "ti,hd3ss3220";
> +	reg =3D <0x47>;
> +	interrupt-parent =3D <&gpio6>;
> +	interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +	usb_con: connector {
> +		compatible =3D "usb-c-connector";
> +		label =3D "USB-C";
> +		data-role =3D "dual";
> +	};
> +
> +	port {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		hd3ss3220_ep: endpoint@0 {
> +			reg =3D <0>;
> +			remote-endpoint =3D <&usb3peri_role_switch>;
> +		};
> +	};

According to the connector/usb-connector.txt, should the connector node
have ports, port@1 and an endpoint nodes like below?

	usb_con: connector {
		compatible =3D "usb-c-connector";
		label =3D "USB-C";
		data-role =3D "dual";

		ports {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			port@1 {
				reg =3D <1>;
				hd3ss3220_ep: endpoint {
					remote-endpoint =3D <&usb3peri_role_switch>;
				};
			};
		};
	};

Best regards,
Yoshihiro Shimoda

