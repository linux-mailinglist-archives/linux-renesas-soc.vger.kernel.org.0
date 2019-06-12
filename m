Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 296DA4235A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437016AbfFLLCR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:02:17 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:56565
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406154AbfFLLCR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv5q1vMEkrJgZwEcOn0TFzybJ8868g0BWKO3vIOwxoI=;
 b=L9qMqpnEoNtIMQjrUYMdPCCJ4vP47yFWvn/EwY2eZTaaULoY0e8EJVx2MDyz93M2Sc0TaoKv8xAtyTyVyZ2sxskLKu5RsvSbyw5YPbOhnMK9ludItEq8jbeERNvJ7GgtnOC7RjjbrDQHSy3M8erV0DSiqFL+2tNO6JiJh3EvQUI=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1577.jpnprd01.prod.outlook.com (52.133.162.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 11:02:12 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 11:02:12 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Thread-Topic: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Thread-Index: AQHVHQkEF65BtXynz0KAWAQHwuh89aaXt2YAgAAAWKCAABVNAIAAACxQgAAILACAAAn9MA==
Date:   Wed, 12 Jun 2019 11:02:11 +0000
Message-ID: <TY1PR01MB1770B85D549CD20C963620E6C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
 <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612101516.xrlvqw7cls7eiv4u@ninjato>
In-Reply-To: <20190612101516.xrlvqw7cls7eiv4u@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f4197c5-a86a-4de9-2adc-08d6ef256bcb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1577;
x-ms-traffictypediagnostic: TY1PR01MB1577:
x-microsoft-antispam-prvs: <TY1PR01MB1577312DB59A70B662C4EEB2C0EC0@TY1PR01MB1577.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(346002)(136003)(396003)(39860400002)(53484002)(469094003)(189003)(199004)(53936002)(6246003)(4326008)(66066001)(25786009)(6116002)(316002)(3846002)(478600001)(14454004)(33656002)(8676002)(66446008)(64756008)(71200400001)(71190400001)(186003)(81166006)(76116006)(54906003)(81156014)(73956011)(66946007)(66556008)(26005)(66476007)(99286004)(86362001)(7736002)(53546011)(6506007)(305945005)(486006)(476003)(102836004)(256004)(74316002)(11346002)(446003)(68736007)(14444005)(44832011)(7696005)(5660300002)(76176011)(55016002)(52536014)(2906002)(229853002)(8936002)(6916009)(9686003)(7416002)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1577;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wGZ+Y/FG/6em+TFZ4Y+YsIOAj7v/j4RKMmqD+1N26984nTwz9f9LurjPkVGgq7HmnIau13Uau+dMwYOyzlUCDpLII2K48kesnQwRp4pp8DLxjuPtoGXde4o2xaS0JEN+rNiuhIOr5kJcO37opwKArDOMx/GEzmy6+JZH+X/RIs7Ejf6GWBXJdQN7QCHBIhgx1oLdtsiwGZln1VkOUAS3QmPmKDqsrOIoJXnPtY2bjFq7tcU8HWcL1c62VvJz5deKV/CbhDiA8iLqRqK+EP7GgQsRHSrDifbsIgk3q2L0f5LnoVanoxD4SueZmLizJpQD5O4hfeHNO7WlIe8fpCz8R6Pu/wlY+D5pjiS23ZZm33FDIALs7Bncw3t82KnRsY74Rc+Sa7eSSiezmF+zk7I/NXHG6XLc0P6sKQwHyWyQWxk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4197c5-a86a-4de9-2adc-08d6ef256bcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 11:02:11.9669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1577
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Wolfram,

Thank you for your feedback!

> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: 12 June 2019 11:15
> Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
>=20
>=20
> > File arch/arm64/boot/dts/renesas/hihope-common.dtsi contains common
> > definitions for the mother boards for both flavours (including the
> > eMMC). My understanding is that R-Car M3-N does support HS400, hence
> > the need for the property here.
>=20
> I won't be super strict here, yet I think it is more elegant to add the
> HS400 properties to the board DTS files, not the dtsi. I mean we could
> add them to the SoC dtsi otherwise.

We will give both approaches a shot in due time, once the relevant HW
will be available, but I do wonder why we need to make a distinction in the=
 DT
when we have a quirk in the driver (the real problem is that HS400 doesn't =
work
only on some revisions of the RZ/G2M chip, do we need to create different .=
dtsi for
different revisions of the same SoC? Or perhaps different versions of the s=
ame board
dts?)? We could simply put a comment in the DT once we add the compatibilit=
y of the
eMMC with HS400, something like:
"HS400 won't work on RZ/G2M rev=3D1.2"
and let the driver handle the difference between revisions of the SoC, this=
 would keep
things as compact as they possibly can be, as well as simplify design and m=
aintenance.

I hope this helps.

Thanks,
Fab



