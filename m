Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8866C2755F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 07:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbfEWFSL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 01:18:11 -0400
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:15790
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725848AbfEWFSK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 01:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUGPJSZVv61in7g1sqVPQdmLPCzjRU/Zi9ZkgZH88VU=;
 b=dbGbLIDEDeBoVpTy63QYSQij2IzJZmHBbQ8nVXdAGxH4VDAy36Sn7FrTpH9oBL9wT2EH8hoLh4bu5RsmTR2ZynbXVvEmk7sCU/QuFBvvz6JK6aeQamCN9sRJl+YfvFkNoGxoUb5azZGu3IZWZH1V9C2WkqFO/n/jxDaJsaMRuAo=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB1793.jpnprd01.prod.outlook.com (52.134.233.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.19; Thu, 23 May 2019 05:18:05 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 05:18:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
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
Thread-Index: AQHVCxgMa5SFoB4ScU+YblO0KwTthKZ1PzwggAADYYCAAcIiAIABMR2w
Date:   Thu, 23 May 2019 05:18:05 +0000
Message-ID: <OSAPR01MB308947DD6A61047728A1BFEDD8010@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
        <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
        <OSAPR01MB30899C8C3E0F316FF37DAE3AD8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <877eaktf8i.wl-kuninori.morimoto.gx@renesas.com>
 <OSBPR01MB2103B7A7CF5F9CDDC40B9A2BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103B7A7CF5F9CDDC40B9A2BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf1d80c7-a952-4a37-25e9-08d6df3e0946
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB1793;
x-ms-traffictypediagnostic: OSAPR01MB1793:
x-microsoft-antispam-prvs: <OSAPR01MB179357F895997F73BB1E1BE9D8010@OSAPR01MB1793.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(8936002)(102836004)(81166006)(81156014)(6636002)(33656002)(4326008)(186003)(68736007)(6436002)(26005)(6246003)(5660300002)(53936002)(14454004)(54906003)(7696005)(86362001)(229853002)(478600001)(71190400001)(110136005)(76176011)(55016002)(6506007)(9686003)(316002)(71200400001)(99286004)(52536014)(73956011)(2906002)(486006)(66476007)(7416002)(66066001)(66446008)(64756008)(305945005)(66556008)(3846002)(25786009)(74316002)(6116002)(66946007)(76116006)(256004)(8676002)(446003)(7736002)(11346002)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB1793;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5NRHhIpgsNAbGEH6CYYhHCe6r42rAmCWzSI2FL3Sf8h0uRDW7np8b6lAIqOrxoMBgIhz5bkWmS63ed19s1ZrLCqf/57GevuXobb7NZrym9rrTOuf1WiduNJ1pb/3ZjdIwBSIcIc8FYll64T+1bsKyjEMpUJxbdtTUh+6AUO6avppl9QYt8W6IPhKv+8liyVzIqZ2RD4bgOlLhUWYgsRUvUsj/CHgtM9Rjv57CFDX9PiFH2SYlj0NVtIarmMq2EGBNe13scL7BQA1n3KUHmNLNUn598wdeIsOPcM5ss1v0hdrUZM8ragluoVks5mxXIOP2IRBcJ6FyIQ+dIPrVqkb/BetZlcIMAPNUn83vMehxJ+QbtvfuWL7S7E4RlAWHnNlFw6C5axfsFKiYAzMxzIa6g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1d80c7-a952-4a37-25e9-08d6df3e0946
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 05:18:05.4083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1793
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san, Morimoto-san,

> From: Biju Das, Sent: Wednesday, May 22, 2019 8:00 PM
<snip>
> > > According to the connector/usb-connector.txt, should the connector
> > > node have ports, port@1 and an endpoint nodes like below?
> >
> > "ports" is needed if it has multiple "port", otherwise, single port is =
allowed
> > from OF-graph point of view.
>=20
> OK. I will use single port on  the next patch series.

According to the connector/usb-connector.txt [1], even if this device uses =
a single port,
we should describe ports node and port@1 (for SuperSpeed) subnode like usb/=
typec-tcpci.txt.

[1]
Required nodes:
- any data bus to the connector should be modeled using the OF graph bindin=
gs
  specified in bindings/graph.txt, unless the bus is between parent node an=
d
  the connector. Since single connector can have multiple data buses every =
bus
  has assigned OF graph port number as follows:
    0: High Speed (HS), present in all connectors,
    1: Super Speed (SS), present in SS capable connectors,
    2: Sideband use (SBU), present in USB-C.

Best regards,
Yoshihiro Shimoda

