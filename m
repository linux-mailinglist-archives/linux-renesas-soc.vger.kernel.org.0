Return-Path: <linux-renesas-soc+bounces-19280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA1FAFA3BF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 10:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE54F189AF9A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 08:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F641E0B86;
	Sun,  6 Jul 2025 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jecWszUs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4386199230;
	Sun,  6 Jul 2025 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751791530; cv=fail; b=pWlh2svNaKv41TdAH8oUtW16lxYxxXkWArWg51JtYZQsnNGsAhWZ2MZ3iWANZULunf1gJVEZlUjwJkk6vQfrFTJ9AMqMsiEN7g8MeYrR6wsHUlTVu/DWQv+szEwdkzxFQxu0UasdDKSsBpR6biKPQ7p6lFCqPYb3ji6SKsw0Z7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751791530; c=relaxed/simple;
	bh=I5AdNe4rXx4m5tbsgeyWhHWgnuhy3Q2GJRcoDjfRC7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E+6wPl6ce06ukVVl6b4sXlPrLX3ra4g4gPS4b5XDrUxpUqbAEcpeeOumIrd77MOVSafznzEJKmGuvmE4JIoIYoSCTYCx+5YexfvR8JD26pumno7sUUK5gLrc/qb9+nrMy8fbbuyPnCzSkDroWCuBY3M0WqntcfasyWeZRN7SnRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jecWszUs; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHwCPfTMMlFbTmbvTdtaEH/Th/7ixNlx8QbK7kP299BljWYYdr3sSKl5pGK5rD4F4xdBzgO5nfrs9XBUfr6Ulo743fL7HQjwjjuSOVvr0NwXF9oIRGWSeGwPaAvbF4mV9c4hHkRWU1XgHx+PV6QOP9o1JGOszrxiX2IB2RyF0mcgvrXW+iEdJ19CfS/Hvbnd7jR3I5pB6fvz37qGrKCIM+HybDLUG4H7I/wfX4TP1gQIiSnRNy+DAJtBBD2zqfoFqUfIPTXa8hJCEdSr0S/KzzR2Ht8QRokFO//Cgw6xXZAr6breL3dn9B7OwB8mJuT/2szJdQ5T4X2soRqngAW97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReohkaU/NRro8WDbtweioS9U4S4JkOx/LOBkUtx9E6c=;
 b=fop8vztnMLr0th9pQbYob4hBfYOtu5DNhLhResa+KUu8Svr/2Ep3VZTAmJJqPEyVHu7KK07yvemx/GXMG4O9kF/dmnWsx51R/XkGTdW55MpnAcyjd/MyELDZHNA1x1xsjLVvKvlIzds0Ly0YYOiIHD7G9fzoKZ3Ht8hAs1KCtMY0lUUgB2s5kKynMwIxfyeLeLjaqEpj+f+TJOOJkV3AVgUXF4kegkmHjtmjPomGmSB9vy6v1Qsf2XS/bAgVdc3+wsSIlhPY9enqz/Pv2ifBLEOJA+vFEcDv5HNq7HI1tmRMPYv1+m19C1KrER6J+bdMrPNIL8VpdLDi9Vx0ztxTag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReohkaU/NRro8WDbtweioS9U4S4JkOx/LOBkUtx9E6c=;
 b=jecWszUsFMf2VogTCufJ7IxrFVdSSPIS5E11dc32Z+ZZFUOXooYIDhOe/9OzBcZrVOOtw0qfzwHKeI+SqPkGMccEvekhqcJmMj35Dxrvqe17aFYrFGlVJqo9YibjhmgJkQFMlALOST8teSEL0tt8ovui2qFaVAbUJAIJt0FC8uY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12661.jpnprd01.prod.outlook.com (2603:1096:405:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Sun, 6 Jul
 2025 08:45:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.024; Sun, 6 Jul 2025
 08:45:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Russell King
	<linux@armlinux.org.uk>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Topic: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Index: AQHb7c6+F2cIzXpCE0eHQabSLpoq6LQj6xeAgAALbTCAANFSwA==
Date: Sun, 6 Jul 2025 08:45:14 +0000
Message-ID:
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12661:EE_
x-ms-office365-filtering-correlation-id: 00f43737-447d-432a-2de2-08ddbc696d14
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?E3YdDSrqtMfeL6i9e2Px4U2KiAvu1FBAMaFM/cnTzh1V04KH8SL/yzKR9+FX?=
 =?us-ascii?Q?IBtF7Mh7YOeg70rwi2NCohFbnJ7egLF/5owzaSLlkjhke4xAludoSoyAriK3?=
 =?us-ascii?Q?bTCE9Ar0wxoCxFrMBa7cJVLAw3wrUkKq6bDCUIEB11tOoPU4Kn2OyprfC/bQ?=
 =?us-ascii?Q?eswdXr7tXO0yr3uZuEuAMPV4IpVDoAiwQGHgbFcFv4Y9+ph4WvrN7zVbrWnk?=
 =?us-ascii?Q?gWXZv1G+PobRVAOyt+62KSoZ9Dh5KhlowIQX5BPXHsTJ57UF0uacFrOLNu1R?=
 =?us-ascii?Q?zH1t+G4e7czsccAlBHEjv0dC76SGhGfM2Iotm2xwvL9Q1NVe5XFWEsd2borE?=
 =?us-ascii?Q?gmg6eLzLy8EEwAilI+R3otZZY8B9IdMXrxpHhenQqt3sxUSuFvcD0IIJoEWF?=
 =?us-ascii?Q?GJb3sVwWHHJ0w7F58qJ9UcShBRJMvlaSzgevgDXydpJWy79axCRnmx7q8BD3?=
 =?us-ascii?Q?1NgfDvQ0I88zbJTGKR/eixZCGO2Zrx3zTAyJAAhVtVgPPD5PKdXApKKTYdya?=
 =?us-ascii?Q?LyjmEb5fKJOpgLblrbFId8nI/4LfD86HL3A2CizSpvYhTIaVCnxXKPnzNzIM?=
 =?us-ascii?Q?h4ktiMDMFfysDvqiqJ/ThbPYMvDY0LLsJwtuUmGCqLSLNrOo+2UFplwccD6V?=
 =?us-ascii?Q?/DdLQa/Jp9ex8bfNewoOjT8xl/o5bT8iKqHHuUqUnyZ0lETTtyqNuSXEIviH?=
 =?us-ascii?Q?YvFO1/R5cndgA2BIKYmhc8hxQ11x4tpNSZTCD5187vcCj58ko2uTRE2nXQud?=
 =?us-ascii?Q?DAT9352ts6fjptXNOtrNKMOBvZf/5xkDzMNthjMvZG5SklIecc3IFXgDCA6T?=
 =?us-ascii?Q?VdAxDA6DGT3oOL8YXxTLD/hlmHpgXICUqtQAdM18nwg3fH2PdfS/oFXiWo+s?=
 =?us-ascii?Q?913NAcUAGAp0bRCfwJYhnN/svLKOCms5F88v8TskH87scBkXvLnkwkb+suoO?=
 =?us-ascii?Q?SjuLtYiYVrrhUAfYCZh+dDluJ4amQEQfzMyulc/WTB/p6q7XNj/qBlYfeOXe?=
 =?us-ascii?Q?ucogV/Q/+EOIxKMonvR8dFLcPmStdGqFFxGFcqnUhEFG/6bvL9hwu+iuzX3U?=
 =?us-ascii?Q?0fRAgZMZtabxgRunEST8cGtRZjwWgBjLBF4CTrYFMs05HZTdqbWD63l/WVed?=
 =?us-ascii?Q?MIzRKw/6AwZQZI4QsTaUAFqpSE8SkdiwnuU6yfOqJNit8cyRQ5xiQvirZlBb?=
 =?us-ascii?Q?9RMcWU3hIWFy1PGrvOyI2UC7ae8r3KBypWu5wdvTIJGKGa2Zd04/H310+LQQ?=
 =?us-ascii?Q?C1Iffy0supo/LJ/Am3zd0RpW7v6M9rQuI4EfXoaBmNgIIC38KrXqzfJMkUYf?=
 =?us-ascii?Q?3d+Z25fVeVu9I6EnCA7prh7m5x7LIlAL9TBayZm2nOtYSZ1/M9NqfDQvLXYQ?=
 =?us-ascii?Q?FBEt5mA03W1CkSj2xKfvSJI72dEeAj0dnQLfDx6Lrrt5kwjRfeCyCXKnEgsg?=
 =?us-ascii?Q?JqqNmE7MlEMv26dlFobCAd+MYfXvBPUmElVKA1R8UwV81LTyoG4qvw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bLVlBIReGjesYctCQAojzuXvi4TdCuKZSVbQsW2pDJP9VMNeao9xhEAs3QV/?=
 =?us-ascii?Q?3wDve+kJztlxFzV04eSYO9TsEPZCX/fyaYkAweLnFsNUhlDJMdMAKPyiOqa8?=
 =?us-ascii?Q?67OwodJNoLJkyU4A56rJBFRrDd4UrB9oF+zPG6BAOle2pCJmu/J22eDR0DOp?=
 =?us-ascii?Q?F+F5HOz6vS3oqKJWCoE922DWq8hq6qcg8eLRWkOmnprTCNduvnSBwfR64q0C?=
 =?us-ascii?Q?keXVyqTL7al4wXqvcldCJ9HdXDo4IAJZaexqShm3VP7+KZM+oTASLPRdrcef?=
 =?us-ascii?Q?agICMt66k8Npot0uDVYq4W+1K0lsvoQptfmhXtlvsEXMPRra3wZI5ObaSkTC?=
 =?us-ascii?Q?abnbCj56KgJv1qmteYNthXLy3Q711EbOcI35pByqv2Gf3loLaFdejQpSMXEs?=
 =?us-ascii?Q?/FPYNx5cqbcbqjnDQIWMkMYtx30hwFBfVl70/ly/Gu6WU2achrDyi34xkkP7?=
 =?us-ascii?Q?RAZal0lwgwXxhZGadODkJmLwgbllwtcsvQW/qfIWDtC5EbRJsIS55Z6PusQR?=
 =?us-ascii?Q?2i5+LQ0McT/0gUIdXV0lzdx8lEm5mPHORNL9e+l4oXBR88E3hmoXqAXjc2A3?=
 =?us-ascii?Q?NmI1s763vgEjrFVo/w+Jjei0sEuVKEbPhnDi6iQRkkXbSK+yPo+H6hjIP2+z?=
 =?us-ascii?Q?XBdgPnrjKnzRMo3oWRm5B+BZUoxsJp1ApyJRJL744gyHsuRpy38DAsrXm9bK?=
 =?us-ascii?Q?kyTbjjY1Shopj95pMlClkUobxQoOXn/Y6uof6hjf16T/9T9UHncaphpdfT+T?=
 =?us-ascii?Q?emByYtSvuZRdGuERTTuaAJn+eWs+bzIfUIXnnfMAvEJrD9bvXKoMFV+kAXjK?=
 =?us-ascii?Q?gWZC+p/dkrSs//UeKDZE/CFxtZopytU5qYyzdkbZKG4rGNn+JVPqlA7drdeb?=
 =?us-ascii?Q?Tcx8EEN8C5wt7OgNsJvWdLn6Q8NktjrwEjDybbblA78Rbp5yiLxTPaXfvr1P?=
 =?us-ascii?Q?8H0FY7kMKAX3cF6KQk6e4x4EmyD2LCW9FxzV8NWeK4+Y16cG3RqqbcqU7zjA?=
 =?us-ascii?Q?LhjSpmYley+WITWtMRDpOwvMa5+NZj1I/lKTY32H36EuEWlhXE2UbZCztH4t?=
 =?us-ascii?Q?f11kYXzqVLR6ZsW1VKrtacV4oSfjy9q+ti1wIqjwwYDHYsdcwp/kDqZ2LPoM?=
 =?us-ascii?Q?+7zLyvMAPunLBjY2xLavOlqknztVqGgyk1RMtBkk/ewljFsqSes5Ug9ZlHkH?=
 =?us-ascii?Q?RFBkVSs8p5HgzRabO1xP19ICcl7BX6hA0RmXxpHHz1v93WNVhPO0GOU5SjRW?=
 =?us-ascii?Q?PiqgOkMqc+hiTSVDKH6sszCJfm9CsmUyLMOw6tdeCC6KrAiOSu4twYMB+FkN?=
 =?us-ascii?Q?JTchS1lP5KniUdfBVfDYCLGqSO6WUeldltPKOKOrpjfmN3vWV9EFSaQmU5i8?=
 =?us-ascii?Q?ByJmFfrzc4tb01DpEm+1NoryXhGIdVSA0XKcfr1OsU5+WTLR1kuBgS7Zb0J8?=
 =?us-ascii?Q?F+T2tjmY0rWpYLEXjNIgv//nb1ekqfHh4XpMqjfDtxCR/QkjBKyK6qVW0TXy?=
 =?us-ascii?Q?67CiCqfuO96WznIjrhzs0sBeceGxWFPfOy/us4MzW5FUhIkNe7dlsT23n9wX?=
 =?us-ascii?Q?Nm1DzXEq2Y1iV9gx//YZxPjLiR1jupS7cMfq5/wuhI3BIrb6TCB+Yyi9mwwq?=
 =?us-ascii?Q?og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f43737-447d-432a-2de2-08ddbc696d14
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2025 08:45:14.4015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWu8/tOkTcPhX0ie5pUmrIYtKkHLWLMrAQSWKvjEJThI2OENmL581v1YImT2TVpH01bSsREv4VMGB8Qkq6R5YJoBqL9fkyOKAN8WWgg6OvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12661

Hi Russell King,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 05 July 2025 21:27
> Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM su=
spend/resume callbacks
>=20
>=20
>=20
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
> > suspend/resume callbacks
> >
> > On Sat, Jul 05, 2025 at 06:03:24PM +0100, Biju Das wrote:
> > > Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
> > >
> > > The PM deep entry is executed by pressing the SLEEP button and exit
> > > from entry is by pressing the power button.
> > >
> > > Logs:
> > > root@smarc-rzg3e:~# PM: suspend entry (deep) Filesystems sync: 0.115
> > > seconds Freezing user space processes Freezing user space processes
> > > completed (elapsed 0.002 seconds) OOM killer disabled.
> > > Freezing remaining freezable tasks
> > > Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> > > printk: Suspending console(s) (use no_console_suspend to debug)
> > > NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> > > NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> > > NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> > > NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> > > NOTICE:  BL2: SYS_LSI_PRR: 0x0
> > > NOTICE:  BL2: Booting BL31
> > > renesas-gbeth 15c30000.ethernet end0: Link is Down Disabling
> > > non-boot CPUs ...
> > > psci: CPU3 killed (polled 0 ms)
> > > psci: CPU2 killed (polled 0 ms)
> > > psci: CPU1 killed (polled 0 ms)
> > > Enabling non-boot CPUs ...
> > > Detected VIPT I-cache on CPU1
> > > GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> > > CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> > > CPU1 is up
> > > Detected VIPT I-cache on CPU2
> > > GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> > > CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> > > CPU2 is up
> > > Detected VIPT I-cache on CPU3
> > > GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> > > CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> > > CPU3 is up
> > > dwmac4: Master AXI performs fixed burst length 15c30000.ethernet end0=
:
> > > No Safety Features support found 15c30000.ethernet end0: IEEE
> > > 1588-2008 Advanced Timestamp supported 15c30000.ethernet end0:
> > > configuring for phy/rgmii-id link mode
> > > dwmac4: Master AXI performs fixed burst length 15c40000.ethernet end1=
:
> > > No Safety Features support found 15c40000.ethernet end1: IEEE
> > > 1588-2008 Advanced Timestamp supported 15c40000.ethernet end1:
> > > configuring for phy/rgmii-id link mode OOM killer enabled.
> > > Restarting tasks: Starting
> > > Restarting tasks: Done
> > > random: crng reseeded on system resumption
> > > PM: suspend exit
> > >
> > > 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
> > > root@smarc-rzg3e:~# ifconfig end0 192.168.10.7 up
> > > root@smarc-rzg3e:~# ping 192.168.10.1 PING 192.168.10.1
> > > (192.168.10.1) 56(84) bytes of data.
> > > 64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D2.05 ms
> > > 64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.928 ms
> >
> > You should also test with the interface configured before
> > suspend/resume and confirm that it continues working afterwards without=
 being reconfigured.
>=20
> Yes, I confirm it works without reconfiguration.
>=20
> Please see the logs:
> root@smarc-rzg3e:~# ifconfig
> eth0: flags=3D-28605<UP,BROADCAST,RUNNING,MULTICAST,DYNAMIC>  mtu 1500
>         inet 192.168.10.7  netmask 255.255.255.0  broadcast 192.168.10.25=
5
>         ether 00:11:22:33:44:55  txqueuelen 1000  (Ethernet)
>         RX packets 35  bytes 2208 (2.1 KiB)
>         RX errors 0  dropped 0  overruns 0  frame 0
>         TX packets 27  bytes 5368 (5.2 KiB)
>         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
>         device interrupt 20
>=20
> root@smarc-rzg3e:~# ping 192.168.10.1
> PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
> 64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D0.866 ms
> 64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.900 ms
> 64 bytes from 192.168.10.1: icmp_seq=3D3 ttl=3D64 time=3D0.938 ms
> 64 bytes from 192.168.10.1: icmp_seq=3D4 ttl=3D64 time=3D0.929 ms
> 64 bytes from 192.168.10.1: icmp_seq=3D5 ttl=3D64 time=3D0.890 ms
> 64 bytes from 192.168.10.1: icmp_seq=3D6 ttl=3D64 time=3D1.02 ms
> [   75.812501] PM: suspend entry (deep)
> [   75.849939] Filesystems sync: 0.033 seconds
> [   75.855680] Freezing user space processes
> [   75.861550] Freezing user space processes completed (elapsed 0.001 sec=
onds)
> [   75.868559] OOM killer disabled.
> [   75.871788] Freezing remaining freezable tasks
> [   75.877342] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [   75.884724] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> NOTICE:  BL2: SYS_LSI_PRR: 0x0
> NOTICE:  BL2: Booting BL31
> [   75.939455] renesas-gbeth 15c30000.ethernet eth0: Link is Down
> [   75.948464] Disabling non-boot CPUs ...
> [   75.952584] psci: CPU3 killed (polled 0 ms)
> [   75.957722] psci: CPU2 killed (polled 0 ms)
> [   75.963385] psci: CPU1 killed (polled 4 ms)
> [   75.967815] Enabling non-boot CPUs ...
> [   75.968025] Detected VIPT I-cache on CPU1
> [   75.968069] GICv3: CPU1: found redistributor 100 region 0:0x0000000014=
960000
> [   75.968107] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> [   75.968786] CPU1 is up
> [   75.968882] Detected VIPT I-cache on CPU2
> [   75.968902] GICv3: CPU2: found redistributor 200 region 0:0x0000000014=
980000
> [   75.968922] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> [   75.969351] CPU2 is up
> [   75.969446] Detected VIPT I-cache on CPU3
> [   75.969466] GICv3: CPU3: found redistributor 300 region 0:0x0000000014=
9a0000
> [   75.969486] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> [   75.969980] CPU3 is up
> [   75.987181] dwmac4: Master AXI performs fixed burst length
> [   75.988097] renesas-gbeth 15c30000.ethernet eth0: No Safety Features s=
upport found
> [   75.988117] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advan=
ced Timestamp supported
> [   75.991717] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/=
rgmii-id link mode
> [   76.007851] dwmac4: Master AXI performs fixed burst length
> [   76.008761] renesas-gbeth 15c40000.ethernet eth1: No Safety Features s=
upport found
> [   76.008777] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008 Advan=
ced Timestamp supported
> [   76.012353] renesas-gbeth 15c40000.ethernet eth1: configuring for phy/=
rgmii-id link mode
> [   76.204477] OOM killer enabled.
> [   76.207609] Restarting tasks: Starting
> [   76.212024] Restarting tasks: Done
> [   76.215550] random: crng reseeded on system resumption
> [   76.220909] PM: suspend exit
> [   78.612495] renesas-gbeth 15c30000.ethernet eth0: Link is Up - 1Gbps/F=
ull - flow control rx/tx
> From 192.168.10.7 icmp_seq=3D7 Destination Host Unreachable From 192.168.=
10.7 icmp_seq=3D8 Destination
> Host Unreachable From 192.168.10.7 icmp_seq=3D9 Destination Host Unreacha=
ble
> 64 bytes from 192.168.10.1: icmp_seq=3D11 ttl=3D64 time=3D0.663 ms
> 64 bytes from 192.168.10.1: icmp_seq=3D12 ttl=3D64 time=3D1.19 ms
>=20

FYI, The above testing is done with rootFS mounted on SD card.

But when I mount rootFS on NFS, after wakeup, I am not able to contact the =
NFS server.

The below patch makes it to work[1].
Not sure, why the original code is failing if the rootFS is mounted on NFS?

Cheers,
Biju

[1]
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index df4ca897a60c..434ef1802195 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -25,6 +25,8 @@ struct renesas_gbeth {
        struct plat_stmmacenet_data *plat_dat;
        struct reset_control *rstc;
        struct device *dev;
+
+       bool suspend;
 };
=20
 static const char *const renesas_gbeth_clks[] =3D {
@@ -50,6 +52,13 @@ static int renesas_gbeth_init(struct platform_device *pd=
ev, void *priv)
        if (ret)
                reset_control_assert(gbeth->rstc);
=20
+       if (gbeth->suspend) {
+               struct net_device *ndev =3D platform_get_drvdata(pdev);
+
+               gbeth->suspend =3D false;
+               phy_init_hw(ndev->phydev);
+       }
+
        return ret;
 }
=20
@@ -66,6 +75,8 @@ static void renesas_gbeth_exit(struct platform_device *pd=
ev, void *priv)
        ret =3D reset_control_assert(gbeth->rstc);
        if (ret)
                dev_err(gbeth->dev, "Reset assert failed\n");
+
+       gbeth->suspend =3D true;
 }

