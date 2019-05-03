Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D94FB127D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 08:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfECGjb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 02:39:31 -0400
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:6018
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725804AbfECGja (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 02:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlnkttHs6rPgQVesupCVksk7IKJBC0H2VnLVmoSGWCo=;
 b=ni34mekuTim256cdJZpJxBZgwGAYQzGYKAWaqXC0dZmji+5rcAZLT+Sfb5Dbv7CuxSQ9ilULZFFw4HkY0j8BUvxjKf4VfhW2qeltE3zW28LTKLUPZU6EX7d35vupYakS29Gk7gXXuiOdWmH49YNIUz+e9g9vId+WxxkKRRgL8NI=
Received: from OSAPR01MB2098.jpnprd01.prod.outlook.com (52.134.234.146) by
 OSAPR01MB4708.jpnprd01.prod.outlook.com (20.179.179.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 3 May 2019 06:39:25 +0000
Received: from OSAPR01MB2098.jpnprd01.prod.outlook.com
 ([fe80::acc0:7e4b:822b:c645]) by OSAPR01MB2098.jpnprd01.prod.outlook.com
 ([fe80::acc0:7e4b:822b:c645%3]) with mapi id 15.20.1835.018; Fri, 3 May 2019
 06:39:25 +0000
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
Thread-Index: AQHU+oA6dXRTFq0hpE+JdgWnShXjsaZOwqmAgAQiIZCABhgtgA==
Date:   Fri, 3 May 2019 06:39:24 +0000
Message-ID: <OSAPR01MB2098D4F5C9C2D620324DD42CB8350@OSAPR01MB2098.jpnprd01.prod.outlook.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
 <1556097743-12717-5-git-send-email-biju.das@bp.renesas.com>
 <20190426181405.GA1881@bogus>
 <OSBPR01MB2103BF796E95B788CC018CA2B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103BF796E95B788CC018CA2B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fccd03e5-3078-45db-35a9-08d6cf92157c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB4708;
x-ms-traffictypediagnostic: OSAPR01MB4708:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSAPR01MB470838E532231622EBD9C657B8350@OSAPR01MB4708.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(3846002)(99286004)(86362001)(6916009)(6116002)(7696005)(8936002)(66066001)(68736007)(102836004)(76176011)(6506007)(7416002)(81166006)(81156014)(316002)(74316002)(305945005)(14454004)(8676002)(54906003)(5660300002)(966005)(66946007)(73956011)(186003)(64756008)(66556008)(256004)(33656002)(76116006)(26005)(44832011)(66476007)(66446008)(6246003)(71190400001)(71200400001)(53936002)(478600001)(9686003)(25786009)(446003)(6306002)(11346002)(55016002)(229853002)(52536014)(486006)(2906002)(6436002)(7736002)(4326008)(476003)(142933001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB4708;H:OSAPR01MB2098.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Eb+5usMdaW2oILMoc1SHC4jLBkuOe0bjopfSQWADKCVcVSb+vrip+jrr0ojA2SkrNqT+Uw8BiQWR1jDFrAv+gXyQuGKikodcDYABs5m2vgRlFwOL6AXwT17uqIZH0xddzTW8PvwgzTadz6nvehakrQnRPCaImur8evvke1vIgPM62T4khVx4lMlUSlGH5gRnD38UdD69L6sLja4BPa8bcMhghZn6b9u56UmLE0xlahexxEscyndcHVbBngez8W1gY3lcjscWTtI8g9ejYt/zqLKnNXkMQOh/mobry9WtIhbCDnGHQ34Nna2RD3OWHWMOsMUb/s+1CLn0abiMpIrNV/xlJsy/1QqXs1hfm491/x9LPirgFbovOpMf9aRkVZrBvVbKh38IclAATwUZLs0sMg7Mk4LwmdwrgIM+2Myk8nw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fccd03e5-3078-45db-35a9-08d6cf92157c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 06:39:25.0078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4708
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,


> Subject: RE: [PATCH V5 4/9] dt-bindings: usb: renesas_usb3: Add
> renesas,usb-role-switch property
> > On Wed, Apr 24, 2019 at 10:22:18AM +0100, Biju Das wrote:
> > > Add an optional property renesas,usb-role-switch to support dual
> > > role switch for USB Type-C DRP port controller devices using USB
> > > role switch class framework.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >  V4-->V5
> > >   * No Change
> > >  V3-->V4
> > >   * No Change
> > >  V2-->V3
> > >   * Added optional renesas,usb-role-switch property.
> > >  V1-->V2
> > >   * Added usb-role-switch-property
> > >   * Updated the example with usb-role-switch property.
> > > ---
> > >  .../devicetree/bindings/usb/renesas_usb3.txt       | 22
> > ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > index 35039e7..f1cb06a 100644
> > > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > @@ -22,6 +22,7 @@ Required properties:
> > >  Optional properties:
> > >    - phys: phandle + phy specifier pair
> > >    - phy-names: must be "usb"
> > > +  - renesas,usb-role-switch: use USB role switch to handle role
> > > + switch events
> >
> > Mediatek and HiSilicon both have same or similar properties in patches
> > under review. Please coordinate and document a common property.
>=20
> As per R-Car Gen3 boards design. The USB3.0 port  on the boards (Salvator=
-xs
> and Ebisu) has a USB3.0 Type-A receptor.
> For debug purpose , the same port can be used as peripheral  using
> force_b_device mode on debugfs.
> Ie, we can use force_b_device to switch the role on this boards.
>=20
> Where as RZ/G2E board is having USB 3.0 type-C connector.  So the driver
> needs to know whether to use debugfs based dual role switch or non-
> debugfs based dual role switch(type-C). That is the reason I have added t=
his
> property.
>=20
> > Really, I'm wondering why this is needed. Can't you walk the graph to
> > the connector and determine if dual role is supported by the connector
> type?
>=20
> Yes, Basically we don't need this property. I could walk through the grap=
h and
> determine the role supported by connector type
>=20
> Please find the example code which will be used in the driver.
>=20
> +static bool is_ext_dual_role_usb_connector_available(struct device
> +*dev) {
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *parent;
> +       struct device_node *child;
> +       bool ret =3D false;
> +       const char *role_type =3D NULL;
> +
> +       child =3D of_graph_get_endpoint_by_regs(np, -1, -1);
> +       if (!child)
> +               return ret;
> +
> +       parent =3D of_graph_get_remote_port_parent(child);
> +       of_node_put(child);
> +       child =3D of_get_child_by_name(parent, "connector");
> +       of_node_put(parent);
> +       if (!child)
> +               return ret;
> +
> +       if (of_device_is_compatible(child, "usb-c-connector")) {
> +               of_property_read_string(child, "data-role", &role_type);
> +               if (role_type && (!strncmp(role_type, "dual", strlen("dua=
l"))))
> +                       ret =3D true;
> +       }
> +
> +       of_node_put(child);
> +       return ret;
> +}

Since we are introducing "usb-role-switch " common property[1],
I feel using the common-property make things simpler compared to walking th=
rough the graph.=20

Are you happy with using the  common property?  Or  still prefer walk throu=
gh the graph solution?
Please let me  know.

[1] https://patchwork.kernel.org/patch/10920909/

Regards,
Biju
