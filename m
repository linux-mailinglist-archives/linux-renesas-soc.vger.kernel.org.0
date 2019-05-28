Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 557832C00A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 09:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbfE1H0F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 03:26:05 -0400
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:43168
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726305AbfE1H0F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 03:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Olzw2CxKe4q2xX7rwUJiuUg6o55GmIZDKySoB0j/1Bc=;
 b=mejPKvSwNJYLnVC0vsmB73EvSX8lL/PGgxNE+NDYn7bQWjLfyzvph7OKeBhmSqqUyv89qg7nuJ0jXWLxaF5wshr4k3RfCtBQTJhUpLeliQhnMyPOwppLTp0IRHfkFpFvUlcZ8HOMIghIBVS3tpedd7JZLzN2/CKM8et0FCKgPlQ=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB5013.jpnprd01.prod.outlook.com (20.179.184.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Tue, 28 May 2019 07:25:59 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 07:25:59 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
Thread-Index: AQHVCxgOXrucqKyKGEO8VEjNAtE3NqZ1R9aAgArtWZA=
Date:   Tue, 28 May 2019 07:25:58 +0000
Message-ID: <OSBPR01MB2103674E30AFECD6878367F9B81E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-3-git-send-email-biju.das@bp.renesas.com>
 <OSAPR01MB308934C379A9759841E58043D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB308934C379A9759841E58043D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 063132e6-49b8-4da1-fbf4-08d6e33dbb1b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:OSBPR01MB5013;
x-ms-traffictypediagnostic: OSBPR01MB5013:
x-microsoft-antispam-prvs: <OSBPR01MB5013FF10A03EF54DCEDA0321B81E0@OSBPR01MB5013.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(376002)(39860400002)(396003)(136003)(51914003)(189003)(199004)(256004)(14444005)(3846002)(6116002)(4326008)(66946007)(7736002)(305945005)(5660300002)(55016002)(6246003)(476003)(8936002)(7416002)(86362001)(26005)(76116006)(186003)(66476007)(73956011)(446003)(11346002)(52536014)(8676002)(81156014)(316002)(66556008)(64756008)(66446008)(81166006)(110136005)(478600001)(54906003)(99286004)(33656002)(2906002)(53936002)(74316002)(71190400001)(6506007)(71200400001)(229853002)(6436002)(9686003)(68736007)(66066001)(25786009)(486006)(7696005)(14454004)(76176011)(44832011)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB5013;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2qZAh34Y3N+U4HCZLuyU7/xLeFOAYmhAEZXcZh0wqC4QNGb0IDk0oMX+b1e0ESKUJfWaUuN6ostHdd2MYvqKUvCNo2WOjN1J9KfKcU10Z5G+xp03L7Di8cUIsbZ80k5+Rv763+HfyzIgZULgKUX+w31qNkEAEGVCSAtAgJizp7g8Ps+ssuhASHhu3JFXiCk88toDVTZ3YE5IQYAtDy6oraImAumIfUjxcy92Zyi0IYSrG2xTGuLQTBTuYS9hjbzxfre3otUtAGs5NjaSdnJhon1SQ4cfK7Dv27n0dCCUvawORMkhdv5L6EPpi2u3mUKKE2D6tOMg/6lNBoL6ZoNLi16DkgxmTuVp0PgPDv6UZLZK4UUsLfoaZGdVi+LBkhHMMv6pc+c5N1AEvlUZlEKvssS8OdkFLvhtjlb5eCZLhFE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063132e6-49b8-4da1-fbf4-08d6e33dbb1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 07:25:58.9658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5013
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

HI Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH v6 2/7] dt-bindings: usb: renesas_usb3: Document usb
> role switch support
>=20
> Hi Biju-san,
>=20
> Thank you for the patch!
>=20
> > From: Biju Das, Sent: Wednesday, May 15, 2019 9:09 PM
> >
> > Update the DT bindings documentation to support usb role switch for
> > USB Type-C connector using USB role switch class framework.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  V5-->V6
> >   * Updated description
> >   * Added usb-role-switch-property
> >  V4-->V5
> >   * No Change
> >  V3-->V4
> >   * No Change
> >  V2-->V3
> >   * Added optional renesas,usb-role-switch property.
> >  V1-->V2
> >   * Added usb-role-switch-property
> >   * Updated the example with usb-role-switch property.
> > ---
> >  .../devicetree/bindings/usb/renesas_usb3.txt       | 26
> ++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index 35039e7..ea6c63c 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -22,6 +22,11 @@ Required properties:
> >  Optional properties:
> >    - phys: phandle + phy specifier pair
> >    - phy-names: must be "usb"
> > +  - usb-role-switch: support role switch. see usb/generic.txt
> > +
> > +Sub-nodes:
> > +The port would be added as a subnode if the "usb-role-switch" property=
 is
> used.
> > +	see graph.txt
>=20
> I think we should describe which type of a subnode is needed.
> I made an example below. This is based on the usb-connector.txt.
> ---
> Sub-nodes:
> - any connector to the data bus of this controller should be modeled usin=
g
> the OF graph
> bindings specified in bindings/graph.txt

OK to me. I will add the following  at the end.  ", if the "usb-role-switch=
" property is
used."
> ---
>=20
> >  Example of R-Car H3 ES1.x:
> >  	usb3_peri0: usb@ee020000 {
> > @@ -39,3 +44,24 @@ Example of R-Car H3 ES1.x:
> >  		interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> >  		clocks =3D <&cpg CPG_MOD 327>;
> >  	};
> > +
> > +Example of RZ/G2E:
> > +	usb3_peri0: usb@ee020000 {
> > +		compatible =3D "renesas,r8a774c0-usb3-peri",
> > +			     "renesas,rcar-gen3-usb3-peri";
> > +		reg =3D <0 0xee020000 0 0x400>;
> > +		interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks =3D <&cpg CPG_MOD 328>;
> > +		companion =3D <&xhci0>;
> > +		usb-role-switch;
> > +
> > +		port {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			usb3peri_role_switch: endpoint@0 {
> > +				reg =3D <0>;
>=20
> I'm not sure, but I don't think this endpoint@0 and reg =3D <0> are neede=
d.
> In other words, can we use have following node?
> 			usb3peri_role_switch: endpoint {
> 				remote-endpoint =3D <&hd3ss3220_ep>;
> 			};

OK . Will update  the example with

        port {                                                             =
     =20
                usb3_role_switch: endpoint {                               =
     =20
                        remote-endpoint =3D <&hd3ss3220_ep>;               =
       =20
                 };                                                        =
      =20
         };

Regards,
Biju
