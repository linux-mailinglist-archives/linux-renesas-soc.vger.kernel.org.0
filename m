Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088D03CFD99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 17:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241164AbhGTOva (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 10:51:30 -0400
Received: from mail-eopbgr1310124.outbound.protection.outlook.com ([40.107.131.124]:13442
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239986AbhGTOWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 10:22:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJOW/wl/5w6y1i71ZCB6cDTBVSjCngYYXfZRwJXLtXpKKTN9cAOINBK3ZHvMsj0S1kiDWDwykOBtGa8Rkb7rYnNyWqkNsXkQT8ErGWeLK22uc1ggFOYGjXU8L9vW7aG0NcyVD8ClVVQ/VSy+y9VjVkdxrcMYrWckEZJqCfFL12ML24h0Q79ODPmWpcP5rIOi6v9RDyrHNGLhE48VcgwANlBkfWxFV7wyAVuWaZ8DPGfraFcEOaIQerVq4MB0CpLbFgvEmyjevxNW5KbPqphJFKokY/fXuWwKBRPl+KkY8BqVKXi6E1V/uD4bvUfYLOXCzCAJedGumVdrQqaz9EXpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md9bef20NhAmX42l1fABs/GxX/qORrAVwVgPz11Wc1Q=;
 b=HW44OCHWdcOeqgeTanbbGNw95eTFZv/oBGv5FS4x8y2NnXLCj7YSAEyq2XhqS5szfBml2eh+MaV4fVa1zNFAWFy3gmLOlKohaNiZgLnYv6cto3H6fnqwFn5rfN5n8jX1eTLlhqnhQVckxlLTKJkBYxKDC7q5pxkQ6sVXM1tW4jEeeliX2c8Rm4w5YnlZqxYKTob0B5rJjCcxeOC6vAcC04QWpAb7h4gszX4wb3zyep/oUm/L1se34EroyKwRM27Li1rSoqZjvOwcHo7lrzIb7UBWPZ9Wp/LqkmXf9l0HoyMQxe51x27ytECQh42m2O416Myr0o458xyZuzAwUvxqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md9bef20NhAmX42l1fABs/GxX/qORrAVwVgPz11Wc1Q=;
 b=JEkRVqLd3lol0XqJr/afztmpelkW9qenavxyh/JhYZxSkRPf/RbBodr3KIeqcUwKf8SZeQKsulVmifdQtnF8wWACp8WzoBCzYYd6rFFPcxTY9/PAwMyYPPh0FVC7qMHpF1afaZ9XlAjH9lHyqgzZ4058OK8tnkir2x7Z+DRcueQ=
Received: from TYCPR01MB6319.jpnprd01.prod.outlook.com (2603:1096:400:7f::5)
 by TY2PR01MB2761.jpnprd01.prod.outlook.com (2603:1096:404:6c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 14:47:56 +0000
Received: from TYCPR01MB6319.jpnprd01.prod.outlook.com
 ([fe80::10cd:b376:429:f160]) by TYCPR01MB6319.jpnprd01.prod.outlook.com
 ([fe80::10cd:b376:429:f160%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 14:47:56 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: Regarding SDHI clocks on RZ/G2L
Thread-Topic: Regarding SDHI clocks on RZ/G2L
Thread-Index: Add7vsI9+kXhl+CeQLOqy9wopCg2QQBtkhtQ
Date:   Tue, 20 Jul 2021 14:47:56 +0000
Message-ID: <TYCPR01MB63193D71B89ED65ADFF521F58AE29@TYCPR01MB6319.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922386AFB9BBEF95626761C86E09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922386AFB9BBEF95626761C86E09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctN2I1NDMwNzktZTk2OS0xMWViLWFhODctOWNlYmU4Y2NjNTQ4XGFtZS10ZXN0XDdiNTQzMDdiLWU5NjktMTFlYi1hYTg3LTljZWJlOGNjYzU0OGJvZHkudHh0IiBzej0iMjQzMCIgdD0iMTMyNzEyNjYwODI1NDUxODEwIiBoPSJ3MndrKzRYdEMyY3g3SERpOFMxak9XV243bWs9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d89f6e5-9b7d-405b-3825-08d94b8d5c8a
x-ms-traffictypediagnostic: TY2PR01MB2761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB2761191CE90433E80114DA788AE29@TY2PR01MB2761.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f8AuQkcK1CVo6ArIJ6+S94LSjhgc0WFjGzpZpGLBS6RkbMV9fwWCHsQaNe/3JLPAW0hiZZ3BuoPykKtxdA5ynydd1XICG4Y/teaRC9oSuaLOepDX5SDe/VubidNJwaTPhr+YW1hR7kH7UHOt1RNPwDLBI+o0MowmzOPdAvhupq+evJU57xEZWzLB2z5wLFC0f6bdQchWzT4Oy35m+qyWZyAaxuyEIQXE5q45xjCYItFtlXzQ9wI8SH6Fz4rH68sTnqu2fpffL2V362GiQbFXndwla7hH8bVEc+kzoXgBVUQLao3fC5ll+TG1sJFGjI4m6+VRDLJsNgswsIQW6rWKGK/0AIBPHGvNoURNmg2CVjWW1gvbCaB3YLPg9STBLyIj6j3IJqsZHIkuInXWy6Ep6FkYqacZDupqw9Zuf/OIogRUEMKenwTmADfxpMRhemrScvefVfbWTPMJ8mSiqFJ6kRoHD6ycmV+3mGb4ouRGbvKJL2nyLo1jAtc6RpW5vm2OBYar3lHC5o+VM5zdW5vgn5u/ZxAIOgJBIuB3kE2+v5U3DOJsJJNj5/HAyOEDnJjxfjwX/ZFXPWmPBed8qkBbuO4gvv5nHAa+4EnYmbSFUCQnB1bVRXQLoiYwV8wCdFnZ0AToCUbX+3Fq3BZ++H3l9WtvDyDxELR+NpHDivq8o6Hq85saSvbt5MFPFxz1L+t/OtSQo+UNR/O/m3lwZUJszg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6319.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(66946007)(8676002)(71200400001)(86362001)(55016002)(66446008)(76116006)(66476007)(66556008)(64756008)(2906002)(7696005)(122000001)(38100700002)(5660300002)(53546011)(6506007)(107886003)(4326008)(8936002)(9686003)(26005)(186003)(478600001)(33656002)(110136005)(83380400001)(52536014)(54906003)(316002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zjcM8SXSQzC7Y4GKmPnrUcUC6/HSjd2sDjnnk4iwaeZfVx/Id0Q4mGHXki/g?=
 =?us-ascii?Q?IaJJpJAC5wCLWpvwtMhbwRg5IRdBzab9/Nc3hb97aeSB9D/lhENknpPu7IhA?=
 =?us-ascii?Q?i6/R9DZVd6UFz6ZVXdN4mcCMc1zU+lHND7tVWqMdhMfCodry30Ia18ZSBetz?=
 =?us-ascii?Q?4LtOT4hbwqqmWwE4XBZFzAJKqDGyKMMXWPIuUx+Efhx63pAGlfVj6yWeIsoo?=
 =?us-ascii?Q?jqwpHtRcieakJarotxcgeZgfR7aEqnYzJXhI07l9VEjjvSSXTc5gaqYV1AN4?=
 =?us-ascii?Q?6FBHot48jsCqVXFi1R4Y5tcHWzz9LUB2CaW+VvJGXPOifO451koGcOjKFfrh?=
 =?us-ascii?Q?0r5Y+tDNvfKGA+w1XGv4mBCtbiXrQoRmsViQfO9iliC8373jNdL468vzgiz/?=
 =?us-ascii?Q?TNJEOJJ0CX1vOh6cPjPxKr/5jZ0VTnXvRJnnmS8GtP+oWJlzjKjjKEbySQ+t?=
 =?us-ascii?Q?V+eAhYMJs3hFx6EMXBXnFtcUazo7Sh1ob5Knwe144bKZdm8rHZjZdfWMkiWz?=
 =?us-ascii?Q?sbf0GKNiajCqlFOqBizKyTZNq4UGtbjAcXvPwc3cYIBiIUNua+36oP2Mh/VV?=
 =?us-ascii?Q?7ckQ2ktTxswdPKR55ePDiDPEbwHpi+oTVbXgE3uIjDzirKRvZqs3phZvI96t?=
 =?us-ascii?Q?LoQrdTQxFDwAyBClkk7hwHmu20Pv3qoVGsqrblGaehpmk8CgbwBlaMkgESfF?=
 =?us-ascii?Q?/y2zWMYyA4mjWdviREFLY7qZiMHlY0XeV3oOR+3kFHCxg0qN1XPz+Nydifsh?=
 =?us-ascii?Q?xiylZVuDjPHwIyR1vjq2DOK5awGkUDsj10dTQQK6g9JqtW/l89Wq44Z5DZ/v?=
 =?us-ascii?Q?LFss4nr3/rziHvyU15bF4DZq2SGRiEWOHTUXLq0bBeuE2yb69sB32eqObSsR?=
 =?us-ascii?Q?SC+xFqPVt8HCE7YEjB6rugvqUUYdY1OephmCva9lWH2+lmPkEkcZ/Bm7yuve?=
 =?us-ascii?Q?XbfnS3R1WEZReZsETfyzxJLYcUB0O9ku+ob+dPU5uKfgifX+Ck/HnluZ/EO1?=
 =?us-ascii?Q?W7fMBVyZmAOAa3u6ceiW+88JSG66LdePmubsHaY38avSPTw+Kd2ThOJoqg4O?=
 =?us-ascii?Q?1WVptyOWq6vR0V8c6fc7jAADpH88JByKUyZ0QcwCpT9qaysh0EiZjugN30X1?=
 =?us-ascii?Q?/AzPgd7GoDpeivUzGSWhJnA3cPV5l15Hgg+2O3Dh1lNYvciZs3Z/4XFq+KOI?=
 =?us-ascii?Q?09g41d8+GFrMionoMWFoHT6g8NDvI3RAFtprwJ5Ejp2vs/jOA6PFDXW0NP8A?=
 =?us-ascii?Q?vzTknIkqGI22BNhTd0QME2OSAy9YREYiOsN527pPwt+hnCMhtNWGbT1Ux8k2?=
 =?us-ascii?Q?9k8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d89f6e5-9b7d-405b-3825-08d94b8d5c8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 14:47:56.2141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHragmtTHDPd4fUgO33nEftzREtby3HCS2X9UBM77be+1YzN4TzcMK2mGvzwhpFeOFXHIT+7qPiDOYxBczKMtC2/M6sn6D77J2TEV2OB3as=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2761
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

> But on the SDHI driver, we are handing cd clocks for RZ/A devices.
> Unfortunately we are turning of this clock
> during suspend state.

I think it is fine to shut off the cd clock in a suspend state because plug=
/unplug a SD card is not really something that should wake up a system.

SHDI should not be a 'wake up' event source in a system, so we don't need i=
t running during a suspend state.
Things like interrupt pins and GPIO are wake up triggers.

From a power perspective, I don't think it will save much power to turn all=
 the clocks off. So your #1 or #2 would be fine.

As for #2, it's not really a 'critical clock' for the system.....it is more=
 of a 'clock we don't care about'.

I would say go with the one that is the easiest and makes the least code ch=
anges. If adding these to the SDHI driver make it very ugly, then we should=
 just add them as critical clock and be done with it.

That's my opinion.

Chris


> -----Original Message-----
> From: Biju Das
> Sent: Sunday, July 18, 2021 6:26 AM
> To: Wolfram Sang <wsa+renesas@sang-engineering.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Linux-Renesas <linux-renesas-soc@vger.kernel.o=
rg>
> Cc: Phil Edworthy <phil.edworthy@renesas.com>; Chris Brandt
> <Chris.Brandt@renesas.com>; Chris Paterson <Chris.Paterson2@renesas.com>
> Subject: Regarding SDHI clocks on RZ/G2L
>=20
> Hi All,
>=20
> As per the RZ/G2L clock list document, SDHI has 4 clocks and  IMCLK2 shou=
ld
> not be turn off during suspend.
>=20
> 1)IMCLK  Main Clock 1
> 2)IMCLK2 Main Clock 2, this clk should be not be turned off during suspen=
d
> state, otherwise card detection won't work.
> 3)CLK_HS High speed clock
> 4)ACLK	Bus clock
>=20
> Multi clock PM domain support for SDHI is available in RZ/G2L and we are
> filtering this clock not to add
> PM domain.
>=20
> But on the SDHI driver, we are handing cd clocks for RZ/A devices.
> Unfortunately we are turning of this clock
> during suspend state.
>=20
> Q1) Is it expected behaviour for this device?
>=20
> Q2)What is the best way to handle cd clocks for RZ/G2L?
>=20
> 1) Handle it in SDHI driver? ie, enable it during probe only once and avo=
id
> turning it off
>=20
> or
>=20
> 2) Add this clock as critical clock, so it will be turned on permanently =
and
> don't handle it in SDHI driver?
>=20
>=20
> Regards,
> Biju
