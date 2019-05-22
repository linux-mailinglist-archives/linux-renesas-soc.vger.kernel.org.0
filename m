Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 118D8262A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 12:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfEVK7z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 06:59:55 -0400
Received: from mail-eopbgr1400099.outbound.protection.outlook.com ([40.107.140.99]:6114
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728743AbfEVK7z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 06:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+PpPvTnS6Yfv85x9wGvxFaul7LNejjMe/lwF/a08lg=;
 b=p9wGBcR7hj28GAA6g2FO/Uf5aVPla3VpAFk5E9tQVxDDS0uAgpHBli7P9/W8HGqLDe9qBfXwuXaBWcOMRd7gp5u8uWwz8784IHu6JwCBcxONNO4uaMnfolxGRlEBdp5MbN5C2fbFLWNH88zrlcytC0BPCNdV2h6rZ4CS07YaAgE=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2197.jpnprd01.prod.outlook.com (52.134.243.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Wed, 22 May 2019 10:59:47 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 10:59:47 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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
Thread-Index: AQHVCxgM+eh9qHNmG0u9jtRSG8piA6Z1QSmAgAABdICAAXvewA==
Date:   Wed, 22 May 2019 10:59:46 +0000
Message-ID: <OSBPR01MB2103B7A7CF5F9CDDC40B9A2BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
        <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
        <OSAPR01MB30899C8C3E0F316FF37DAE3AD8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <877eaktf8i.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877eaktf8i.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 929b81f1-c2c4-454d-c034-08d6dea49ab1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2197;
x-ms-traffictypediagnostic: OSBPR01MB2197:
x-microsoft-antispam-prvs: <OSBPR01MB2197487FC0DE5C9A909B6F2DB8000@OSBPR01MB2197.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(346002)(376002)(366004)(39860400002)(199004)(189003)(51914003)(6116002)(446003)(11346002)(476003)(26005)(73956011)(64756008)(186003)(3846002)(25786009)(66446008)(66556008)(76116006)(52536014)(305945005)(74316002)(6246003)(8936002)(68736007)(66946007)(7736002)(66476007)(44832011)(53936002)(4744005)(2906002)(86362001)(256004)(486006)(5024004)(5660300002)(478600001)(99286004)(76176011)(7696005)(102836004)(54906003)(110136005)(6506007)(316002)(14454004)(33656002)(71200400001)(55016002)(8676002)(81166006)(66066001)(71190400001)(6436002)(4326008)(7416002)(9686003)(81156014)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2197;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hZsRVlnrlezt/qX+7xZ62qKSrB4UFS6q4tq5rzzpTXQrfrYMDkVyuH7xjTzndTzETjxGNLMXXfQEypnf43anUyCwWz3X+lbUKCDcBTheWz2fTCmu/3cvf4WlRhf04zrYSNl/XhGOPn/u6iw3kjRAGKfwxWJMwh1gQuVdp0icY5293iHxKnpjNZupBfqSG53MiEULqKGlaci8a2f0df6zCeAPZ4/qMUWq9mux5O7hb4mmecLJQSFFajJrTXJeZhfFdUhJ9J1Wvv4TUq9QD2iVaIvL5UpRLznTQF9rAEboYapGNM5qpOISPPEyqvnaCGHIErBpRrx93yhTuITLpP7yaT6o5RSYpbPEZr2DFdxn7ombQTraPAgeydfzKuiOnOQO29HtxGDEQxDp8oG8aJY6cqF5J2vKemdLFYvEyeUnLCs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929b81f1-c2c4-454d-c034-08d6dea49ab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 10:59:46.8778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2197
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Morimoto-San and Shimoda-San,

Thanks for the feedback.

> Subject: Re: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree bindi=
ng
> document
>=20
>=20
> Hi
>=20
> > > +Required properties:
> > > + - compatible: Must be "ti,hd3ss3220".
> > > + - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> > > + - interrupts: <a b> where a is the interrupt number and b represent=
s an
> > > +   encoding of the sense and level information for the interrupt.
> > > +
> > > +Required sub-node:
> > > + - connector : The "usb-c-connector" attached to the hd3ss3220
> > > +chip. The
> >
> > s/connector :/connector:/
>=20
> Maybe it is for alignment ?

Yes, I need to fix the extra space.

> > According to the connector/usb-connector.txt, should the connector
> > node have ports, port@1 and an endpoint nodes like below?
>=20
> "ports" is needed if it has multiple "port", otherwise, single port is al=
lowed
> from OF-graph point of view.

OK. I will use single port on  the next patch series.

Regards,
Biju
