Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2829D27899
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 10:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730236AbfEWI46 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 04:56:58 -0400
Received: from mail-eopbgr1400101.outbound.protection.outlook.com ([40.107.140.101]:38814
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726230AbfEWI46 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 04:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u73Lr6WRkohx8JxEQ2CDY6LJvcwJfGIjXIzaQ7fMwUk=;
 b=Pl006vamNtEa+mUNgVkIsfM3QgbOEihWQ2Jm2Jj5M/EneeojYjWGIqNQiAkOSnBd76/YGlz1MoeXLuGK5gsUDnZ42iVIpBXEKwW9eK1MVskd7BrUEJ6uFfklLbZGpOQMXmL1a+jlqSWCLM3rQ1q/QEMLk/zBscyKwqEo5EZIHas=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4454.jpnprd01.prod.outlook.com (20.179.181.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Thu, 23 May 2019 08:56:51 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1922.018; Thu, 23 May 2019
 08:56:51 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Thread-Index: AQHVCxgM+eh9qHNmG0u9jtRSG8piA6Z1QSmAgAABdICAAXvewIABeSGAgAA6YPA=
Date:   Thu, 23 May 2019 08:56:51 +0000
Message-ID: <OSBPR01MB2103449C227E75781E857368B8010@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
        <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
        <OSAPR01MB30899C8C3E0F316FF37DAE3AD8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <877eaktf8i.wl-kuninori.morimoto.gx@renesas.com>
 <OSBPR01MB2103B7A7CF5F9CDDC40B9A2BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSAPR01MB308947DD6A61047728A1BFEDD8010@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB308947DD6A61047728A1BFEDD8010@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06669ea0-e849-4bbf-abd3-08d6df5c9929
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4454;
x-ms-traffictypediagnostic: OSBPR01MB4454:
x-microsoft-antispam-prvs: <OSBPR01MB44544EA1197E1163ED6D988CB8010@OSBPR01MB4454.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(366004)(346002)(136003)(39860400002)(51914003)(189003)(199004)(102836004)(66066001)(186003)(478600001)(26005)(74316002)(8936002)(76176011)(316002)(14454004)(7696005)(14444005)(68736007)(256004)(486006)(446003)(6506007)(476003)(86362001)(11346002)(33656002)(44832011)(71190400001)(71200400001)(3846002)(6116002)(7736002)(5660300002)(2906002)(55016002)(6436002)(9686003)(305945005)(53936002)(6246003)(25786009)(64756008)(66556008)(66476007)(66446008)(54906003)(110136005)(52536014)(73956011)(76116006)(66946007)(229853002)(4326008)(8676002)(81156014)(81166006)(99286004)(7416002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4454;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Dm9AHwUaEqG71Gyu84zqoCPzHdSZxR0bsJ1yu/qh3BalpO2l8U3AMubEFlGeyfTal+h+uEI2B/bCd6sFAcdRR5ZBhE9kBag8ZyiKtxV9agHIfkRLNv5maKe8IZvt7Z1L4AUPNA7mBL0MrWemTYkUSpQWx+bOaj71d8SoM3KMj8thJ3kmiduKyP8SI7KKx8vfstJzXp2ge7UvFCb52oapI6Gpu949VnYKUroQzDuoMX7sScjMWsHmU+el11HjtIwWulA1YUzJrVQhuyjv0mnS3IQfuJ/r++teqcmUb7RESvblINskPh5jH2eUIOX6f1hUmOmST9+N8TWRivb2PrhfE+EtGi//+eChntZz33Jb6YV+V57enabd8h5OrsUExSPZ22Dr7kO7O13CVB+p6elg9wZ07j7xuiQPa9ZC6RewxOg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06669ea0-e849-4bbf-abd3-08d6df5c9929
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 08:56:51.6955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4454
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree bindi=
ng
> document
>=20
> Hi Biju-san, Morimoto-san,
>=20
> > From: Biju Das, Sent: Wednesday, May 22, 2019 8:00 PM
> <snip>
> > > > According to the connector/usb-connector.txt, should the connector
> > > > node have ports, port@1 and an endpoint nodes like below?
> > >
> > > "ports" is needed if it has multiple "port", otherwise, single port
> > > is allowed from OF-graph point of view.
> >
> > OK. I will use single port on  the next patch series.
>=20
> According to the connector/usb-connector.txt [1], even if this device use=
s a
> single port, we should describe ports node and port@1 (for SuperSpeed)
> subnode like usb/typec-tcpci.txt.

OK.  I will update the example like below.

hd3ss3220@47 {
	compatible =3D "ti,hd3ss3220";
	reg =3D <0x47>;
	interrupt-parent =3D <&gpio6>;
	interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;

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
					remote-endpoint =3D <&usb3_role_switch>;
				};
			};
		};
	};
};

Regards,
Biju

> [1]
> Required nodes:
> - any data bus to the connector should be modeled using the OF graph
> bindings
>   specified in bindings/graph.txt, unless the bus is between parent node =
and
>   the connector. Since single connector can have multiple data buses ever=
y
> bus
>   has assigned OF graph port number as follows:
>     0: High Speed (HS), present in all connectors,
>     1: Super Speed (SS), present in SS capable connectors,
>     2: Sideband use (SBU), present in USB-C.

