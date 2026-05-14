Return-Path: <linux-renesas-soc+bounces-32645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO5rGhFJBmo3hwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 00:13:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC305475FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 00:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6DB3300980A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 22:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC4E3ABD8D;
	Thu, 14 May 2026 22:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aCUUh8lG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F337D127;
	Thu, 14 May 2026 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778796812; cv=fail; b=T3JaNMzdOBuBoSTjdEB+smDrOkbsYs9xzAHGncgt5qbaTYxwDeq8pdeeRyrA0MzEOnsi6LljdsbikJztR6+0Z8+MTtLdKAN4duURKGXAQdC0hveXs/5jf5cInP/zN+TDd++jruTOZSCO+FDUHJR4rj5e/yVWeYXw6O+C7VkA2dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778796812; c=relaxed/simple;
	bh=5wdSzSCPEZNzo61aJw4urcOzmmSORWbmRxaatUCJhJI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UzLNwNgfUt33qI55vvNjPem15T2+Ariea7KPiIJjekX/cg9lxEzZ94lj+y1X+O8GvkTkOuCF5uU23Yd0yoSkuzIrTjLTR5aUWAAjXvXxIBh+TQJkX+hmHH6cfceaEQ3Cf7NXrj6JCAz4VdGt8SZ3uQoVhomMW+rC0A4FshGYBao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aCUUh8lG; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJbJ0Zx/n531XHhR5ytZIT2304RduMC8OpVXGkAuw/R7qzcyBvSB72DND8NW9j/g2cM/lctXMKrxV6r7NsFqC5QDCxk7yKHN7VnLxi4EIER0HsgGgpiVVCV16RzAbf+nrXUpy1F99PrwGadHEpLNNspQohCuHwzfTYaq6YFi6OsYFnM7ZKT1ZOjz62iWQWYevbxf3ilMT69JBknSWQ99D3ZbLWc38mY3dXwbea9tjnzEiMLYyXi41eNFU+shN+dblLdPF8YDd6uEmpRkey55mkuC6todYDov4G3Way/zhgDTCPo6kHadxMjAtEh9XBo/oQIbYYUCIzEAdy7EU4ZfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvqRgk4Kki8g5NXTS6FKPaWDA9q6LC4sFLIKklor2IQ=;
 b=Ue6lx5ppcE6+gLfnSAvnV/HRqDVcVogWiJWX6VM0QDv1CR0OhKz/9/oWiCVoVQBQnccOAdF70UxejORobr0VMu9qFr7BMAnZ7OLnsO5kaDiaOOa73NCK/BRD74Dh1lCg9Utbxt13UXh6dVDVh+//OKUZ/wYP7iRuWPUvt7oB/PEcRPY0W8vb0EgsYVdMeHXWc2geTwMsfBJ5bcTXOJ6LfxyNyYstnGyraXg5k4yHWWcZIGAQwqDVB4pCJuoLgfKshE6ythmrI6xwvCRr2AWOMPzLA0EOiFnFkEGobjqXLDSphpbHnFP8XNtb8Xa3IQKqCStg8YnOBDVSihCJ8c91aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvqRgk4Kki8g5NXTS6FKPaWDA9q6LC4sFLIKklor2IQ=;
 b=aCUUh8lG7Mc46S0yckZI298HN9mf1FsyFVJEAoaLuWRVz2Q+IjUHLWk+ETiwWOHdUINJx1PDDSjOu46zqF1w6+z0Eb/RHY6fwUxIiV/PphNGLWDlHA7AOCDepiWNalmhNFYwURKF7F2dyPQxzwnwICsPLhRXKcwgbNEFb+MTmqc=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY1PR01MB10851.jpnprd01.prod.outlook.com (2603:1096:400:327::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:13:28 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:13:28 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 04/16] ASoC: rsnd: Support hyphen or dot in indexed
 clock and reset names
Thread-Topic: [PATCH v6 04/16] ASoC: rsnd: Support hyphen or dot in indexed
 clock and reset names
Thread-Index: AQHc4j0V16INKzLnJ0OiYEteIEX2D7YMsXUAgAFnSmA=
Date: Thu, 14 May 2026 22:13:28 +0000
Message-ID:
 <TY6PR01MB17377960D1B5A63F801363C3DFF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
 <20260512182631.3842065-5-john.madieu.xa@bp.renesas.com>
 <agUbLPizzMP5XZ2q@sirena.co.uk>
In-Reply-To: <agUbLPizzMP5XZ2q@sirena.co.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY1PR01MB10851:EE_
x-ms-office365-filtering-correlation-id: 475e2e1b-baf3-4bae-436f-08deb20606c0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|22082099003|18002099003|38070700021|56012099003|11063799003|4143699003;
x-microsoft-antispam-message-info:
 BsmcFX0wgNqbWhunCu95RsZ1l5IsVXe53YuEPdyu+xdj5Tbmc7hBbtyYA2DsSZLTY7TqAguNxntzCoWZw1IHDnkNwI4yeKYJOX47wQrv3Du8fCZWz353shNKXugoDF38p89/TkVAFIn1vDpaUz/OLEpC1gEoyGN8OsBaeH6xy3ldyOH//Yj6hI1F9ugZK+gYYOMFd3JwnC+FKbkaHwno2GSxfC2NBYBwwWc7e00ShOBMA8IBp1uXsLFMFJdD1tLxep4/cFPoW9kwkwBDFwE/dcJQSsOlxxdqvTHCd0DiFWUTDEWUz4znRJd90OskRgO3T3KgJZT1aTE0HCzXzkNjAiyQEevhF+4k1tT1SnKbv/Xejx8tVYwxMfUNIKidxjtnTDzdAhQpmqActqim5nOcX+hNmxjkNqPwPgx16XlNXCmyU+NZKOb+/B8LRPEOfczTpIM77DQdyU/zTGuo5gAKZ9zUsWeyFbEh8YlJ8WrKwmioRI6GIPaZ6M4jaKcjEW4gew4l24f/V7saMGRBe+3KQVKwSIUV3IB8P53YZkmCbsdmLQPh6fyJxw9QBaWwv4juDU3jpMtUTXUmxOph2rAeo1Zb6rcpFVYOYfMMWknZ/H51G1lHH6IG8NrPknrsqNPCxd24A5NnvjiLvtIiqH0iYkvequ8FVJVSl9ZSnnKKOwmYjVgIQysODjoUJcnI+OwVhh+sk+DW8lNz3hIDZ1X0BjHwhf302zPAiDWD02qKX05ItClVSjIq0WGcwjloPhms
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(22082099003)(18002099003)(38070700021)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eXY9rCN22awrnYgVg8g2Xjrd21i8C+3qe6oDVSrdFyfq9Zr3ZnqYo6j18n/O?=
 =?us-ascii?Q?pKxKUJ+tSyNCv8Zs2xX1EWW+uxmUrae7K3lbZon+nsYCGk7Hgc284MmOuUj7?=
 =?us-ascii?Q?H1mjVKgVabCXy3WyGTyTKG7VQFdgQWTnux/M0uD/zRqaoDt1tonKcsIucubn?=
 =?us-ascii?Q?z3xeUak8tODftkks2lZqvcRbmo2YDjmrBpA3MEpq+5jf9b51ZIIO3qPAe6gE?=
 =?us-ascii?Q?ZC4xhSuhyiWrKfKp1Y3y1E7z9dCjEeGiMTRl0plsCJNQXsXMQ6vEbT/ealtY?=
 =?us-ascii?Q?a3Cl6njJuhXO+FWv9aoo2QRypJHyr6p1ILxO8Kw/TfnTggGNxILeMZWiE+4c?=
 =?us-ascii?Q?z+7uTEvDyFAivsCi1spzIG4gmMl44hfl3SAvDYGIqcr17h/mQw2gswK4U9c7?=
 =?us-ascii?Q?EtZ5f2cHIRqCguTX1bxMJxEjskI9knohWnj4LaSthFI+zN5xZGcC/MNg4RuY?=
 =?us-ascii?Q?yHFSr3yTcyrg+hdY7NWUS0SCuUGy85NHsuI/pHmSFQXkAZlIgVdbBZWK1axZ?=
 =?us-ascii?Q?UyefXl5Cp78l9mCBqaZ1dP8zcZQg0/d16PzrkOtq/hHvj8pS6uKKIAAJNbsS?=
 =?us-ascii?Q?Y397+Or2+JAvvrd5iU0ucxjDJHEmQ2u2lNVrqSoF3GYE0fXsn2eG5E5lyctQ?=
 =?us-ascii?Q?/EQlbK5NxVQbCwcJ1905s9+bH+3yZ60VxzjFjnz36/zRLJWb3by7TG057lag?=
 =?us-ascii?Q?r29RQJCMN7u7dsDzwMOfYyShnCmQu4KjzkpuHbbio9S0dnOph9qftWvU28Dy?=
 =?us-ascii?Q?foSbGIFGASdWjlPLGzOBy6rtT6YalEUaAncUAbhAULZ+TGj0yT+cwG9grbm3?=
 =?us-ascii?Q?kiZxdnhZrKgb6rCQMAw6xOJ3cfwY4c4A2t6SvldQ0KbAYpobEyeLmygWKK5l?=
 =?us-ascii?Q?SBs57NyzfqYeF2AhYgk59gjl/KbeTqIwv24NdsDnAAnutAJP3goyeQXrjQ19?=
 =?us-ascii?Q?b53GBHmxEnI8r5hEZt6KpN4HTkW8tEcPk4ObRSDrQWrHrBBTPV5JbpAYaBI6?=
 =?us-ascii?Q?K0rDtCLJO3N7V/Se9yH30+XD7770HjC+izvO1LNeMhR8nBFW0X6qv1CENkxE?=
 =?us-ascii?Q?/JF4G1LDSOm/VSpMSLM4us45KQC7bA583VCWcSI2RJXnw0HX817egpjiod2l?=
 =?us-ascii?Q?VeAZvYQuqG9tUT8NLi5sy1553gxaw69crhbd5w1yGLMP+oE31V+1Nrw0HeLk?=
 =?us-ascii?Q?n5DbwQVPDpKZaZbLNfPZkGjO5OIL18nulOG36LuW1Gkxqqi5izICRv1JAv9s?=
 =?us-ascii?Q?Ruo/TeYB7sfcCOndyn7+tsLibDN0vrJB3Rya83HMImskfSYVL6rVKXP142Lm?=
 =?us-ascii?Q?xz8c5ODLg1tpUPnUbJPHdGYEmr5fyWJ2EY4bAOGp3PKY8rSqHwzUQoAzRi96?=
 =?us-ascii?Q?V9z+URNRVDKdqtoNqPLhGgds/iSHBxsuJzMwdFSjKV8PFcwaKdSVC9jHQbZM?=
 =?us-ascii?Q?lbCeOlMQaIrCU0xq0rFiCfewdKZTKvO7tFuzeb42N2KEfQ8qZyxDo3wO3CBC?=
 =?us-ascii?Q?uHmphBmnpYbwa+RbAw1wv4T1lutdjaNKE7Z8lEFOrYXZWVhSRItcvaOiO/cU?=
 =?us-ascii?Q?VM4xqJ6biVnO4acg7dAqdztBCZAiSYAEunHbyR5Y6KjWmvsDRr9oSRyvXxOJ?=
 =?us-ascii?Q?r1JmUkkJZMagaxCI9pOQs4KEDEOJoJYqzKIlqyq5B/MPzm8bIuDLEOiGooZL?=
 =?us-ascii?Q?pwnk5Ly/d5JRdVcQFDISSQbzgP7CNRuHyJ1wskDjYsf84pn021PJa1JffJb9?=
 =?us-ascii?Q?YhGSPPQzWaH3Son6FbpdZi/5ZI8UZnY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475e2e1b-baf3-4bae-436f-08deb20606c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:13:28.5843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPW8rw+8z4Hx8YrIt/SPhsVwVLmPGiQ8TNOotXicaZalc4j1MT8FHaMFUjzSP5Hcy5yELUZR+WWG0fTsOZhr3/ZjbRTToyedRl0ibcH+I58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10851
X-Rspamd-Queue-Id: AFC305475FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32645-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,kernel.org,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Mark,

Thanks for your review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Donnerstag, 14. Mai 2026 02:46
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH v6 04/16] ASoC: rsnd: Support hyphen or dot in indexe=
d
> clock and reset names
>=20
> On Tue, May 12, 2026 at 06:26:19PM +0000, John Madieu wrote:
>=20
> > + * On ENODEV from the hyphen form, the dot form is tried. All other
> > + errors
> > + * (including -EPROBE_DEFER) are returned to the caller unchanged, so
> > + * behaviour against the clock and reset frameworks is preserved.
> > + */
>=20
> > +struct clk *rsnd_devm_clk_get_indexed(struct device *dev,
> > +				      const char *base, int index) {
>=20
> > +	if (!IS_ERR(clk) || PTR_ERR(clk) !=3D -ENOENT)
> > +		return clk;
>=20
> The comment says ENODEV but the check is for ENOENT.

You are right. The check is correct; the comment is wrong.
Will fix the comment in next version.

Regards,
John

