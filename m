Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2443425C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 14:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731124AbfFLM3F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 08:29:05 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:5997
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2407613AbfFLM3F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 08:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf2D8H+7jdH7mpnfOFybSdhLksBlwYrUVOxPPfwFiD0=;
 b=ArU9zDDqnKiGdhdSgA1n7Ktf4CQ6oTsuDpwNfbFFCRXuoc9pbfx5N0nv0DKeOtPp97akIC0XXRhv8ipJiMPg4L9Wpw+gBDLmazuHb0ArPWlqkmCPGOAaPYSex9oJ/oiDWSF3dIpF8liz8T9JjbOiu/5IG1eKECyiAEGhOUSA7Lo=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1852.jpnprd01.prod.outlook.com (52.133.164.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 12:29:02 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 12:29:02 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>, Wolfram Sang <wsa@the-dreams.de>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
Thread-Index: AQHVHQkEF65BtXynz0KAWAQHwuh89aaXt2YAgAAAWKCAABVNAIAAACxQgAAILACAAAn9MIAAB9IAgAAKKICAAAjM4A==
Date:   Wed, 12 Jun 2019 12:29:02 +0000
Message-ID: <TY1PR01MB1770847D11F78F1509DFAB34C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
 <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612101516.xrlvqw7cls7eiv4u@ninjato>
 <TY1PR01MB1770B85D549CD20C963620E6C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612111900.2crgsg4adinrrw5u@ninjato>
 <20190612115520.27likbbmm7dqbx7u@verge.net.au>
In-Reply-To: <20190612115520.27likbbmm7dqbx7u@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4e27568-bcbe-44a1-7106-08d6ef318d4d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1852;
x-ms-traffictypediagnostic: TY1PR01MB1852:
x-microsoft-antispam-prvs: <TY1PR01MB18529BF7C9BAF3FC8FB46624C0EC0@TY1PR01MB1852.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(396003)(39860400002)(346002)(376002)(189003)(199004)(186003)(68736007)(256004)(66556008)(6506007)(305945005)(73956011)(81156014)(8936002)(44832011)(102836004)(71200400001)(66946007)(14444005)(71190400001)(81166006)(7696005)(5660300002)(26005)(8676002)(76176011)(110136005)(86362001)(76116006)(54906003)(486006)(53546011)(66476007)(66446008)(446003)(11346002)(476003)(66066001)(64756008)(99286004)(4744005)(52536014)(7736002)(25786009)(2906002)(55016002)(33656002)(316002)(6116002)(478600001)(3846002)(6436002)(7416002)(74316002)(9686003)(6246003)(53936002)(14454004)(229853002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1852;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bwxWwSgXibPxb6vX+6lv+rVEQJQvrhIez9n0fvH3eyls0Uu17SZ6PcmBhRBt3J1ywbCMy4pd7WlqvXe5Cu8jNJ9D49UixTqqGGzV6TsmlLDljy5XHRwpdaFt4OnPgWQn37R2Tx6rNHIWOeMByVCliC4hNLrl+X8O8EnI9VyzeYSpVEqrXtYP1iPhjuXmReHa5EzkkSLQWS6d7lxt2T7hKCiszJC6YMMq8+hcNOs87b0V3v+/gqvE40+wNDfPtA3t+C+IoyVN3GrRXa+Zo0EVcAPehIFvwicRVFK9X/cJNdVdfytdqLSv5bmGHqm73PprSC2FQ8fJKpqK5Pw8ZpQgL2zT882IPNJ1oMEXTdnSX760Z7N7S1qTrfLsLlGo/u26JdGoa62F7q9iLb43+ipkYRZGsoa/nB0zda7QFIqFVSY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e27568-bcbe-44a1-7106-08d6ef318d4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 12:29:02.0543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1852
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 12 June 2019 12:55
> Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
>=20
> On Wed, Jun 12, 2019 at 01:19:00PM +0200, Wolfram Sang wrote:
> >
> > I think it is confusing to describe a HS400 property if the HW is not
> > capable of it. Even if the driver has a safety check and will prevent i=
t
> > from being used.
> >
> > But as I said, I won't be insisting. I understood it simplifies things
> > in grouping boards. From my side, we can close the case here.
>=20
> I would slightly prefer if the property was left out
> for one thing, how can we verify the board supports HS400 at this time?

We can't, hence the compatibility only with HS200, for now.

Thanks,
Fab
