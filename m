Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAF1DFA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 11:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfD2Jjx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 05:39:53 -0400
Received: from mail-eopbgr1400135.outbound.protection.outlook.com ([40.107.140.135]:11014
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727351AbfD2Jjx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngoi7C62QRCmVDsmMCmqXbmCwpmmy0fuxvQblPD0a+M=;
 b=JaIH9FSxPklZrzBlbSSvPA3CljuswhbgK7fmT6bNYFV2prysco+9d8IVjl5jwOMJ2NPlo7BrLJMu/kA+xFKuQ0G3h6r7DvyqmUrD3x5bLhwznRITSeq3A2XFlkQq85vkUWvteCarhcBU8F7NZXnSfZmr+RDlSIYa71Aiy9D1Cl4=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4424.jpnprd01.prod.outlook.com (20.179.181.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 09:39:47 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1835.016; Mon, 29 Apr 2019
 09:39:47 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>
Subject: RE: [PATCH V5 4/9] dt-bindings: usb: renesas_usb3: Add
 renesas,usb-role-switch property
Thread-Topic: [PATCH V5 4/9] dt-bindings: usb: renesas_usb3: Add
 renesas,usb-role-switch property
Thread-Index: AQHU+oA6dXRTFq0hpE+JdgWnShXjsaZOwqmAgAQiIZA=
Date:   Mon, 29 Apr 2019 09:39:47 +0000
Message-ID: <OSBPR01MB2103BF796E95B788CC018CA2B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
 <1556097743-12717-5-git-send-email-biju.das@bp.renesas.com>
 <20190426181405.GA1881@bogus>
In-Reply-To: <20190426181405.GA1881@bogus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce56be12-fae6-466e-1475-08d6cc869e85
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4424;
x-ms-traffictypediagnostic: OSBPR01MB4424:
x-microsoft-antispam-prvs: <OSBPR01MB4424326FFD6A55A9B7A7B64AB8390@OSBPR01MB4424.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(366004)(346002)(136003)(396003)(199004)(189003)(51914003)(6916009)(76176011)(68736007)(7696005)(478600001)(54906003)(7416002)(76116006)(66446008)(73956011)(66556008)(6506007)(66476007)(229853002)(486006)(99286004)(66946007)(6436002)(64756008)(97736004)(44832011)(476003)(2906002)(186003)(4326008)(33656002)(9686003)(66066001)(71190400001)(256004)(53936002)(55016002)(11346002)(26005)(7736002)(81166006)(8676002)(8936002)(81156014)(102836004)(52536014)(5660300002)(14454004)(71200400001)(6116002)(3846002)(446003)(74316002)(316002)(86362001)(305945005)(6246003)(25786009)(142933001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4424;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R1aw6Fe0Fe3/r6+6bW1HFzCGvf8VS/3veP96OzTSE6uzZg4vMiwhsAHO6T2bR9juNzwOlLBlR2fs65SZbGAtuaevrOFGcRIBPDasLPiH2DR4PfXrMwrpEHeYWcO8KI+MNDb+z7eair5fd+iN4zDJVor+u+k47QKhN3vRA9jZd4MZytRi7LjznFLS14QgJv6QxocTOjP7NLUtiHfJziqBvYBZvQ2NTU4aWAvpI9h1xRqpEDQsjA5swTLeWTZIRudhu7hn/HA5VtF4VeBxO3a52j8Mz83BUXm/8BXj27B0DeUZGpzSZEmR+VGt1tH5ELJE8ut30lhOQKeM1qcdEZNGcN+Nrp/zGObg9oJBFzQo2yMJf0ZxMsT0Uzs391ousrJxdHM3573VjRxgGN01N1AxEz9vUtEq9FOuGX8SZwFZr8I=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce56be12-fae6-466e-1475-08d6cc869e85
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 09:39:47.1535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4424
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH V5 4/9] dt-bindings: usb: renesas_usb3: Add
> renesas,usb-role-switch property
>=20
> On Wed, Apr 24, 2019 at 10:22:18AM +0100, Biju Das wrote:
> > Add an optional property renesas,usb-role-switch to support dual role
> > switch for USB Type-C DRP port controller devices using USB role
> > switch class framework.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
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
> >  .../devicetree/bindings/usb/renesas_usb3.txt       | 22
> ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index 35039e7..f1cb06a 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -22,6 +22,7 @@ Required properties:
> >  Optional properties:
> >    - phys: phandle + phy specifier pair
> >    - phy-names: must be "usb"
> > +  - renesas,usb-role-switch: use USB role switch to handle role
> > + switch events
>=20
> Mediatek and HiSilicon both have same or similar properties in patches un=
der
> review. Please coordinate and document a common property.

As per R-Car Gen3 boards design. The USB3.0 port  on the boards (Salvator-x=
s and Ebisu) has a USB3.0 Type-A receptor.
For debug purpose , the same port can be used as peripheral  using force_b_=
device mode on debugfs.
Ie, we can use force_b_device to switch the role on this boards.

Where as RZ/G2E board is having USB 3.0 type-C connector.  So the driver ne=
eds to know whether to use debugfs based
dual role switch or non-debugfs based dual role switch(type-C). That is the=
 reason I have added this property.

> Really, I'm wondering why this is needed. Can't you walk the graph to the
> connector and determine if dual role is supported by the connector type?

Yes, Basically we don't need this property. I could walk through the graph =
and determine=20
the role supported by connector type

Please find the example code which will be used in the driver.

+static bool is_ext_dual_role_usb_connector_available(struct device *dev)
+{
+       struct device_node *np =3D dev->of_node;
+       struct device_node *parent;
+       struct device_node *child;
+       bool ret =3D false;
+       const char *role_type =3D NULL;
+
+       child =3D of_graph_get_endpoint_by_regs(np, -1, -1);
+       if (!child)
+               return ret;
+
+       parent =3D of_graph_get_remote_port_parent(child);
+       of_node_put(child);
+       child =3D of_get_child_by_name(parent, "connector");
+       of_node_put(parent);
+       if (!child)
+               return ret;
+
+       if (of_device_is_compatible(child, "usb-c-connector")) {
+               of_property_read_string(child, "data-role", &role_type);
+               if (role_type && (!strncmp(role_type, "dual", strlen("dual"=
))))
+                       ret =3D true;
+       }
+
+       of_node_put(child);
+       return ret;
+}

Regards,
Biju
