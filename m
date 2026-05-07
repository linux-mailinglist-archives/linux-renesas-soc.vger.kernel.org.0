Return-Path: <linux-renesas-soc+bounces-32253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKBwEquf/GksSAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 16:20:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8644EA05B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 16:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A58C230078BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 14:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1B73FBED7;
	Thu,  7 May 2026 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p1p7irOc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23F3F1655;
	Thu,  7 May 2026 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163602; cv=fail; b=K8XKEKumcwG/RuYcK2GBgIjf5RGB/LyyrAqHLeanOj9f4WhBDkmJ0k62F8xXo/ydNU2AjuYj5t+gYQ0+8aJy+7Zfq4j06KPnrBzSlMlvHn9TYZFmmw2r5PHRjpICe4eqqRQhMV2sI7VoH6BE8330Gt3IxaUa8t5tvhj9KCiGEcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163602; c=relaxed/simple;
	bh=sVand/y/o/Ka+nCakdK3ZMuahJPMu1c68HTH29dConc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OuEiWBsU5K7LYyh0ZjIAdNxcyFAZEt6OC9Hf/22A0YR4tE/9+Gcg9eIeSY+gbE0I7nmTEwQKAa/PO+nTfH1wz2mlO170W1XGfnZvime+9oHs5+dZPeMjA27OfMePtQdU0i1AYpjYPaQ/8rZ6H/TsTp5H+wbO1oRzW/L1fEL8W4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p1p7irOc; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DV4H0njxLRvBLKxwjxzKgkVwgv9AixX636eZxuVuTbeaIxa+IsugqSZWFvVz+fHI7FnHVXaC9BIVPMAZgmbA9ssZ32eSHNTonMoAM9bmlzkom2YMifmAGc/0SdWtfkWz/IXK0fYg2G1R9EHx7jcLIR+F8fD0AmqAihBIVzR2Cxw2O8uBNrOjhwtRJopdXpeDub1nOd0YkL2ZYDMu2JJ067Gz3lCisei+05uPS+7xd4mno1Q/Z1N4bQSEdFdzOWQHZG6/5Tadmk0CZx43LfcksvUAq+9432fIHO7A259/IN++ebV0iSq6fr1KSV8aDtqIuUIzbGxZCsLNZA8q9Krrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WI9RHysxNvfrLCafwFSeb8K61Lic+hifuGEKc+ASZQ=;
 b=ngaybzwPoqv9Oz7fXOIvR05QVjh33H07KARhBCIM82xBQyPG+UCLC9G6JQYF9wUsEe5FuETb3vIdl8Nx5X0852ppfZZEDO+Nhtz7dBeMxxVL7A4xyBDPH4clx4dX7X3nSMI3wGOz9N6pGTI1GfR7u6g/xXd/f/gbuNZJTJEUvZt+hi1OfUeiFbZ69rF8CGeoWZPbYqNSDDNXpvpwJfgdOzXdWy3lhIDPydy+NBUy35DH7izUefnMPpAudWF6BJMTkmQ2Al9VtA+bslJf+DNOuIRp5cbZTEoIBSt5GujeN7Gb1nl5JGKbf37Av6dxSCLWmSAz+jqArj1cfIYcoa6e4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WI9RHysxNvfrLCafwFSeb8K61Lic+hifuGEKc+ASZQ=;
 b=p1p7irOckH1ol8DjwyQOJBcVRLAAYgxPCsOYWVIbSDVz+MaSJcfBSsvHi2hEkA4IaMiZSjTNg5UTzyexS1DcVBnUnm9kYnkIJE7WfPoZ/3um06URgdTx1kTvYreJk5wk8gmtEG/7MsvUxwBmeuUM1yUEh7A3HgWdacFe7Gehjeg=
Received: from TYYPR01MB15615.jpnprd01.prod.outlook.com
 (2603:1096:405:291::13) by TYWPR01MB9758.jpnprd01.prod.outlook.com
 (2603:1096:400:234::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Thu, 7 May
 2026 14:19:57 +0000
Received: from TYYPR01MB15615.jpnprd01.prod.outlook.com
 ([fe80::d8aa:d4b:55a1:2948]) by TYYPR01MB15615.jpnprd01.prod.outlook.com
 ([fe80::d8aa:d4b:55a1:2948%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 14:19:51 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano
	<daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 02/10] mfd: rz-mtu3: use device-managed reset deassert
Thread-Topic: [PATCH v2 02/10] mfd: rz-mtu3: use device-managed reset deassert
Thread-Index: AQHcyQgzT/aTuw+zQUSR0TY845IFgLYCquiAgAALUqA=
Date: Thu, 7 May 2026 14:19:51 +0000
Message-ID:
 <TYYPR01MB156155B2A517931DADFBEA65B853C2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260507123903.GI305027@google.com>
In-Reply-To: <20260507123903.GI305027@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB15615:EE_|TYWPR01MB9758:EE_
x-ms-office365-filtering-correlation-id: 8c54d93b-566b-45c4-ffb4-08deac43b419
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 Y0V29bR8wI3qTtC3lXp61587N4TVYPXdP4Wm8CDCyLR+rH45lPlZnAFfbgWvN6C4R5pKhAsQ76dyHx1fQsoCS5WqH+lXXsQgr45TQzMK/jg38DD5nGLAeZ20ySbf9hEcJPJrz11HUFlz7p/z2j2SxDtUbojzmM580PeF7qTpopmpGmocSX4hb7idUsoEEWfFihXk71gU55xFmpiAp00seSD6jSQE3T7LVdx37OxwHms2gBf4n18D8WpFG6l+CaOZMJdPnuFy1J80RPuVI/yAKqWdW0yoc7k1Dqr3y6u022vu1Cy7kKGewByyqsP1j5IS94/isoW7eBdRJXOlr0ChW262udCtNzY8lLCXlajJuwf9XgMxSdI5L0UBhK/GTCCJZlgo3u7GLfOvAXkNyim9EwSjo5M4z6Pp5ttIFVRUzKfnMYBsTXFMaHOyf60kOMnniz4QOEmMhqPMXp/uJJcB0/8llJJ53C5qjxXgSwAvq+ESw9cRB+YiO5dLwVHV5wNOQgUa54I82SEqu3M8qePbA+IQmz1F9Tc74CVymmDQrwQqdqBvMiCeZAGhHuqkaDRM3bTewq8PgnjcTzjJY3uMEZi2GuIVElFQ91qjAXBwv6SklRMBYZ67/pKUtHbpYgFpmrYCAJOuJQaFXf/l3fVZst+0NqBLPQLMucFGWty2JO03ETq2ad2FkB59iJUvnnbG8IrCBrGNUUdFiy/ypkG1FPZr9fv3GNRjmRJh2aWbGxCR8x2ThEGfEkGDGCJDYvdB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15615.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Rxc0NW/6eIRRQ6yU8fDwVb5PBCYsnG/vdpeIIIGbHpywUSYCWtsPM2vbHwaX?=
 =?us-ascii?Q?t3oVinHjeaXP0GQ9N1cts3UNjRxwDLySl+Yut43wIMEj4UHASHx4FPsoICJo?=
 =?us-ascii?Q?49AzJ5r8EvR6yRrm/pfSIsgpQWrVjkDUjGo+/+bfY/jGWLf0k02XrIKgZHUj?=
 =?us-ascii?Q?014hLG5ze05GPU51PwiXOilu8fptvXDAQ1mxlr14osJ7DtE8EgFxXJfXg2hS?=
 =?us-ascii?Q?k0RZCfuFYToAmxLM2miWTYLOSlpiVfkuv+JRFAhg7obv5kgMykQxYhO9WmXk?=
 =?us-ascii?Q?ZQdwqxjigjnjHbQo/bXWDslvidlDzh2ZF3cqm73TQW+KpUjHQjFZGIjIOsi9?=
 =?us-ascii?Q?9q/iUuIh5UcHxCcE21JvggS9WOUBeb+070EtsXjhRDOayZ78fuFJylweYvcp?=
 =?us-ascii?Q?/KtwMG14k3N9W4IP7D+/V0uf28MndCnvcLMpwvC5eas1PY78pIPda4qpNbJO?=
 =?us-ascii?Q?PP4yNgIUqzDS/WMTO8SYuofibJfxRfNMdABcIcEkSpO745N8sHCVAzXbCw1A?=
 =?us-ascii?Q?YLMCgEJCFi79dIDgWyWUP2cX22bT7k4u+Ycz55+MH62X1lIQQbQDgyNavO3G?=
 =?us-ascii?Q?8kQsvF3dyJdaWDNz3m0IEwrxNdy/BWg/uz6b3rSqza86QChXQ4WJHaqV0Mju?=
 =?us-ascii?Q?otl1XVmsPGiefjjYUH6OBoh6whGQnZqleNzv3k0n2pRh+8aenB9JDwq0fTYi?=
 =?us-ascii?Q?GI2O4PKOFF2Nt9/dSNwKiLlqCeCDTwPJBxrKSYXEpa7xGdyNVgcdOotJBJ5Z?=
 =?us-ascii?Q?fExcNOCIOQnJCV5p6FGV8Ovo5626OhhnQNOy+slaQQnP6boEiBYH2DMii/+l?=
 =?us-ascii?Q?sJuuPClOyO8bfZgRZqxr4e1CStZ6tmOFnLKfJejkxX+ZT/FvqsgIixzeTijy?=
 =?us-ascii?Q?qrcArIWMriW0q6t2oZYffPIWaZ+3znBOa1xz3JW5m+n50oHGQqa2JkJmudSU?=
 =?us-ascii?Q?6DSqg+5NwkVJzORA8+RvU3cepxmKbi83E8/kZzxv47bE4Q5ZIVD4kp9kBDBV?=
 =?us-ascii?Q?v6TFugFSdU/TE/qZwA2qW0T9lMexiGEWtGhTGP40jCx7QT9tLAAU9vprsERi?=
 =?us-ascii?Q?SzZQxZNh6AOskCQMp8SR1aFbgGSKJtgxxThbne9pb6HUsaa34OmPJXtZJ/6N?=
 =?us-ascii?Q?2qQoCk9w3xHZN77Mkt+fyFV+GuzZJr2XgOo1f9SmJToljgJRC38jPsF812Xw?=
 =?us-ascii?Q?ODlBuHVADaBI6CF8Zb7ex6SHx04uVj+xlNoIEATcQHOLXMlxr8zMJpEOpx+z?=
 =?us-ascii?Q?SUELZK8GnDVcjfWTG4cqp45s0bpJDAThrWYkZ2sKE6k8En7JCi5GGUVJzali?=
 =?us-ascii?Q?em+jcKKMB1lEKYHYuvsKIRW1B4hjM92N2VQka8ZN/+N8BUpnNtbliWxRcxp0?=
 =?us-ascii?Q?CspTKnsYr33QpoIPkikcYRS6gXRHTSHY4Mrx5f64oFg4e/6lUU9LYVCXK98T?=
 =?us-ascii?Q?IG8J00Qzx9qQuFeC1HUvGn8XxwffyiB3W/dr2wBv3kLR/Cv3Y5Sf4xICxICO?=
 =?us-ascii?Q?HBhSyWR01KZ9g9ByIHtOezkkQ3RRzsQb+YJBmSTrUDdckx+J6sPCjb1zO8OA?=
 =?us-ascii?Q?57xpsTvH2jeTQ63Vh7b/tiPOh2nvvW3NfZjDhOg4mcKxEQSmS8wy4zTF8If8?=
 =?us-ascii?Q?YGk0q9pnWmRadnvwGfGm6jwllciKG30iq+W6N7tVE9sBgl3zaQ6dS/TfddsF?=
 =?us-ascii?Q?WWK/FIChDJ1WzdF3meeu4uhT4bbydKax2aMWhLKVI+kZUBZYw7OoNNoYmWwT?=
 =?us-ascii?Q?MRYTkbfkbyFHCJvbNqfBcR5eiSj5I396EYcRl2w0S8eHXcLqq8S4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15615.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c54d93b-566b-45c4-ffb4-08deac43b419
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 14:19:51.7143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QW3q3sY698pctgtCPVE0QCO2S6Ys+AED2FP/R5VnTlkr4U7RkZbj4X9xOj3cWVsnjLPGb93Z2PVx4MLtDYcU1JtRXA+1ut+N575VPjGnWv9ZNZJxTnHuPx0Wf7FgV/Hd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9758
X-Rspamd-Queue-Id: AC8644EA05B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32253-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> From: Lee Jones <lee@kernel.org>
> Sent: Thursday, May 7, 2026 3:39 PM
>=20
> On Fri, 10 Apr 2026, Cosmin Tanislav wrote:
>=20
> > Replace devm_reset_control_get_exclusive() and the manual
> > reset_control_deassert()/reset_control_assert() with handling by
> > devm_reset_control_get_exclusive_deasserted().
> >
> > While at it, remove struct rz_mtu3_priv::rstc and use a local variable
> > for it as it is not needed inside rz_mtu3_reset_assert().
> >
> > Rename rz_mtu3_reset_assert() to rz_mtu3_mfd_remove() to accurately
> > describe its usage since it no longer calls reset_control_assert().
> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > ---
> >
> > V2:
> >  * no changes
> >
> >  drivers/mfd/rz-mtu3.c | 23 +++++++----------------
> >  1 file changed, 7 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> > index 9cdfef610398f..6b9c6831dffa9 100644
> > --- a/drivers/mfd/rz-mtu3.c
> > +++ b/drivers/mfd/rz-mtu3.c
> > @@ -21,7 +21,6 @@
> >
> >  struct rz_mtu3_priv {
> >  	void __iomem *mmio;
> > -	struct reset_control *rstc;
> >  	spinlock_t lock;
> >  };
> >
> > @@ -301,13 +300,9 @@ void rz_mtu3_disable(struct rz_mtu3_channel *ch)
> >  }
> >  EXPORT_SYMBOL_GPL(rz_mtu3_disable);
> >
> > -static void rz_mtu3_reset_assert(void *data)
> > +static void rz_mtu3_mfd_remove(void *data)
>=20
> Remove any mention of "mfd".
>=20

_mfd here is to describe that it removes MFD devices, not that it is
part of a MFD driver.

What name would you prefer to use in this case?

> >  {
> > -	struct rz_mtu3 *mtu =3D dev_get_drvdata(data);
> > -	struct rz_mtu3_priv *priv =3D mtu->priv_data;
> > -
> >  	mfd_remove_devices(data);
>=20
> Why not use devm_mfd_add_devices() instead?
>=20

Addressed on the following patch.

> > -	reset_control_assert(priv->rstc);
> >  }
> >
> >  static const struct mfd_cell rz_mtu3_devs[] =3D {
> > @@ -321,6 +316,7 @@ static const struct mfd_cell rz_mtu3_devs[] =3D {
> >
> >  static int rz_mtu3_probe(struct platform_device *pdev)
> >  {
> > +	struct reset_control *rstc;
>=20
> This shouldn't go above the main device data structs.
>=20

I was following reverse fir tree ordering, as required in some other
subsystems.

Is there an MFD-specific preferred style that I should follow?

Would you prefer having it right before unsigned int i?

> >  	struct rz_mtu3_priv *priv;
> >  	struct rz_mtu3 *ddata;
> >  	unsigned int i;
> > @@ -340,15 +336,14 @@ static int rz_mtu3_probe(struct platform_device *=
pdev)
> >  	if (IS_ERR(priv->mmio))
> >  		return PTR_ERR(priv->mmio);
> >
> > -	priv->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > -	if (IS_ERR(priv->rstc))
> > -		return PTR_ERR(priv->rstc);
> > +	rstc =3D devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL=
);
> > +	if (IS_ERR(rstc))
> > +		return PTR_ERR(rstc);
> >
> >  	ddata->clk =3D devm_clk_get(&pdev->dev, NULL);
> >  	if (IS_ERR(ddata->clk))
> >  		return PTR_ERR(ddata->clk);
> >
> > -	reset_control_deassert(priv->rstc);
> >  	spin_lock_init(&priv->lock);
> >  	platform_set_drvdata(pdev, ddata);
> >
> > @@ -361,14 +356,10 @@ static int rz_mtu3_probe(struct platform_device *=
pdev)
> >  	ret =3D mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> >  			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> >  	if (ret < 0)
> > -		goto err_assert;
> > +		return ret;
> >
> > -	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
> > +	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_mfd_remove,
> >  					&pdev->dev);
> > -
> > -err_assert:
> > -	reset_control_assert(priv->rstc);
> > -	return ret;
> >  }
> >
> >  static const struct of_device_id rz_mtu3_of_match[] =3D {
> > --
> > 2.53.0
>=20
> --
> Lee Jones

