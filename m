Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10AD0421E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 12:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731861AbfFLKDU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 06:03:20 -0400
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:47506
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731837AbfFLKDU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 06:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THHuJLvNQTH1zUFyFJNJT5KEQhoP3/d/LSZqqivMfGI=;
 b=TfOtTqJEljgOiM2bG9Ky6y1mx4eAteC0l1vcA1Wlp8TC5bek01Nu8UlCXaoo86jE0bdxaUUv/KsqCMDQZlgGwB6qHr7xSwCcpsgft7smIyPvllT+DdQHExjohpqryIyYMmBjKPUycy59RQfwYq/LlqcrNEv9DRxuHyjtJ4llwE0=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1500.jpnprd01.prod.outlook.com (52.133.162.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Wed, 12 Jun 2019 10:03:16 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 10:03:16 +0000
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
Thread-Index: AQHVHQkEF65BtXynz0KAWAQHwuh89aaXt2YAgAAAWKCAABVNAIAAACxQ
Date:   Wed, 12 Jun 2019 10:03:16 +0000
Message-ID: <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
In-Reply-To: <20190612094524.GA2153@kunai>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13b08dc3-230c-46f4-159d-08d6ef1d3088
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1500;
x-ms-traffictypediagnostic: TY1PR01MB1500:
x-microsoft-antispam-prvs: <TY1PR01MB150063964E286AE9555459BBC0EC0@TY1PR01MB1500.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(396003)(136003)(346002)(39860400002)(189003)(199004)(8936002)(55016002)(11346002)(446003)(186003)(81156014)(102836004)(26005)(478600001)(9686003)(6116002)(64756008)(8676002)(486006)(44832011)(2906002)(76116006)(7696005)(305945005)(256004)(6506007)(476003)(3846002)(73956011)(66946007)(81166006)(6436002)(25786009)(66446008)(7736002)(66556008)(76176011)(86362001)(66476007)(33656002)(6246003)(7416002)(229853002)(68736007)(99286004)(54906003)(316002)(6916009)(74316002)(52536014)(66066001)(5660300002)(53546011)(53936002)(4326008)(71190400001)(14454004)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1500;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0Nqf9pVhY4CQW55yJyDNHHj2OW/KPVigBgNdba89t4abbLiTJ8GzJHSLke/3ko3nGYvlgWk18VRodylldpiFWPp3CYnbdFLXuasmh3ViVwowm2ttaG+vK3FnUEidjG9Xe2LlJSYJe+co8FopdMXUzIGYrwf6vPs4JVPo5wNSgZ2IBP69vRj5IC2SqhRiR1MCmSGzfSXSQpSGv9qKf6sqO0IomCopAJyIVlL6uo9pU368yyFKePJ0PQ4VZzktmxc31PZlpNqSJ14WUtzEefasFdt/lWP3jwmak4wRxU7ZzYuZ9qjEqL80nJh5F/TGFbkXwQhMF/BTGQiV0SoKoxAJmnyiqOETruuNji8gi5gowNObVYkor5/KXtcKKC//B252QQz6OKJjlFmPxIAkQlczb9FU/EKmqtAUngVUDM4oWa4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b08dc3-230c-46f4-159d-08d6ef1d3088
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 10:03:16.4869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1500
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Wolfram,

Thank you for the feedback!

> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: 12 June 2019 10:45
> Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
>=20
>=20
> > I was thinking about sending a follow-up patch to list hs400 here
> > after Wolfram's patch appears in a RC, would that be okay with you?
>=20
> Do we need that? The *board* does not handle HS400, so why add the
> property?

The SoC the design currently comes with doesn't handle HS400, but they may =
replace that
in the future with one that is based off R-Car M3-W version 3.0 (which does=
 support HS400).
Also, the HiHope will come in two flavours, the HiHope RZ/G2M (the flavour =
we are currently
adding support for), and the HiHope RZ/G2N (sporting an RZ/G2N, which is ba=
sed off R-Car M3-N).
File arch/arm64/boot/dts/renesas/hihope-common.dtsi contains common definit=
ions for the
mother boards for both flavours (including the eMMC). My understanding is t=
hat R-Car M3-N does
support HS400, hence the need for the property here.

Thanks,
Fab

>=20
> Similar setting would be an I2C device which can do 400kHz but the board
> layout doesn't allow for such speeds, so we are limited to 100kHz.
>=20
> Or?

