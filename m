Return-Path: <linux-renesas-soc+bounces-30670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LGtCNvLzGlFWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 09:40:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 618053761B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 09:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF894317A39E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 07:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7310638E5C8;
	Wed,  1 Apr 2026 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="byeQcnJt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F1538D68F;
	Wed,  1 Apr 2026 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028632; cv=fail; b=UhTgNMfgxLzhK0/paA22NPbsixBR1qIcebTFOylIYsj848HS8l/C8WyO1EKzbXEMbXDG0Sh9AEHZpLRI62zVP1S8BsrPxsqthm3TRgC0aqBkHO7NMcgHCuUy6c1G/nnQMscY7mQu8WZkT55lFDYUHfsqKMFF8nmriLGCSp+ovyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028632; c=relaxed/simple;
	bh=J2QRY1fZWuu1y0Te9UofdJOqIUsbFTf3moeOgB4t/wI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=utvyX56K5uF3PyWz4+/S1ZMiZRoH0kpzr3VQWF76YTUrdmoewuR5tBMUqPR/GMAmNy+PN8FCfFW3v5pAzwPBzXLY3I6Fs9pFJGsnlZOAMYvj4MhVkSpcm6yP7YxQKO1/vBZ+0rTEVASL82z5AI0YoGWC6ys6CeqXsgjkUUz3J80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=byeQcnJt; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAotVSFyXRdcqsWWfa06DvHIjQJHYRA6CsgYkkpDnDhFSRA/2kkHUZ068proaMMw/4dVzwjFFQtddk2vtRpt49pRgGFVDDmm7NcWTL23s9Gxc92lvY/TYrGLziz8gh3epMw46Qzlc78IrZUBzp45Q02PKYXxopSVaWXzgAMWMA+VnendL5OaoFKIv6S6cL7hkZIcQSvsd5wkuQuFnJj+jFz1GuaRptCNKbg0DDNoxsyRj0c5bUKgomkUCegLt98rTYQyP/agFaFub84twUD3N9Vjo7Etr9Ife1099CZ2DvS9bbKCxQndkiBjzs18zLobEJu2NeSn40B54BhFGPWy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrF+rHf1qwKCLP8aLQ+ux4i7seE2eogqwKYf4/+kv3k=;
 b=FfDzKBLl5vtrHZkz6YwSbf5wQwGaA57obabr+dF3hwjlq26+fWAVbJ4TlaxGkQg1d1oT2N5mgKrkeRdZpsBvZR7KDGu1/7A6QkaeZjdUSG/AeJGjZybPcVA9O7Hy8A9z/Sz3qlqdP1a7IKSYRgbJavAE/ZQnb6wfLObWiXE+3yOY2V6BizVElzlx4clhUT0VSEk6w1XGqm2uJoR6Otj6ug6GrsEfDb32z4l3yLbm0Ju/dSF8esMNjvO8OhF5cb4uiYxMTuGK4QlsR1eDcMP1KF+hnEmf4u3s29S22e87f6I+bDNSgAh4zV+XktJQL7UQwMMBNdEm64jHgJn5hC7uQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrF+rHf1qwKCLP8aLQ+ux4i7seE2eogqwKYf4/+kv3k=;
 b=byeQcnJtLHLZ+vXptETe4JMLI6xm0yYRik6fatcKCOpKF2IDpwZek7yPyqaRDCd8wlMDbmTadUvfsu5t62IpDPb6mK21WJuCdQ3cM9rDYbIxySzJ5xfa8tux5XPTgpKCqiUr0wB5ccWXqbwKazrn4lH9jq+/cOd+T+0Nm/k65a0=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB16911.jpnprd01.prod.outlook.com (2603:1096:604:41e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 07:30:28 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 07:30:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
Thread-Topic: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
Thread-Index: AQHcvp5UlC3Sbj2+60yBPqFW97WwkLXI1hIAgAABSyCAAEWgAIAArq7g
Date: Wed, 1 Apr 2026 07:30:18 +0000
Message-ID:
 <TYCPR01MB11332DCA62A7B45AF2583DC238650A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
 <20260328103324.134131-4-biju.das.jz@bp.renesas.com> <87qzp07z5v.ffs@tglx>
 <TY3PR01MB113462DB4547CBE03D94F93628653A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <87o6k391z9.ffs@tglx>
In-Reply-To: <87o6k391z9.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB16911:EE_
x-ms-office365-filtering-correlation-id: c60ea2ac-aad1-4a35-ab07-08de8fc08661
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 +Y5J7a3JdAdJ9uy8tC1urHX8iSPRxXR7Bg7I53vsI01vJaSwJeGRTu09D+uii44v6eHViHk1manx3jeLYcpFQaCGGlSD9oPQtHh/kK/Vt1MDPwH0STGZUWqxHZUNTdtr5XbsrJOHnIxZ3QLyf6gpyeDVoPSLpBQJrj2gPljTXzsmyq6YmUzq6fbf0drIGFEu94hoGIfQ2A+3SJLCC3YSabCxV1TKaUXbL7oVpnR0DkkbzX/NiqK3UdQaIN3/CmL0tWojqItBUoEA2Ts77mGT4mbbQlU1Gtcbr6oelDLjW8Oa2MehmIO/E87s6B/iWJ8kXtT80tmdrrwTnY/jIYk8XlZHAXgt30HftWb4Wz3AiCUYaFW8t5vTpkBi7z52TKzbkxra5ROQ3Ef0p6c99vpogUE2Xgk541HHn+Ltru1RYDQw6xVvUUGdR+LwRGgshdjxEX+MJvcBtUIpuUz5XeSSTS9B4lBK8xUpGEql5s3s5f+Nh+fB7jfyDmi6T/rvaK/2ckNiwJuYptgudAimgViQkxqpAUF/SdL9jn1QURI+PrxXfy3nZl7KFpIqAF51PClJP94ymRIjlOj5UEmllU2+sn/j6hMI/GvRvxAU9MqN3Qe7Oo/ASCpXd0hqGgEWXAVryZn6w5fCE9+6rVZf0uFbk64FbvYzhkH8TjPYYul9l/v3JLnkkuDvLeC/o4pv/h22ctN7R5xeQJweZJQFXjKutjuSpKo1uHsD3E4Kp/LT5BJfXgK0GeRQ66KCogOVsAxLNLeoqznscvOzh3oGEe8Lbo9mBmDoZzse/rozLPO5dOs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MkzYeHmexFrhL7WFUXWkK/P17sxcqy/kZeXe92T5BOFrh0pJWaBY/iFBFF1L?=
 =?us-ascii?Q?0hHCSjmnfN9BRI5Pz0IIpkY6thAFuykQ6gjbNE7sxXbt/9J+C6OPjPkKGKEt?=
 =?us-ascii?Q?zcIhj3lLDHGWVlTB46eM+E6WgXKj4YhLzlUxtP79NDyx1Ys/x3DbrCl4UQnA?=
 =?us-ascii?Q?JbQjMAzEvwVPGGI78AmATEB31unIy2vnxj6UIAGPvcuTDpc+3gPQvc5GLskQ?=
 =?us-ascii?Q?KalxA3dUl+d9Xh0pwfF2pm04bwxB+LnBq0qarYQUJeZ96lf158LvcqxQDkZd?=
 =?us-ascii?Q?GbktePDL4FzEQBC1MiJX933zbxqgAI9TYOgzLL+nKtg5EOJ0Hh0V9dJc0oyH?=
 =?us-ascii?Q?3hjQLBeW8uo5N+rTt4mVDuskg3vZowErqVRV+Gibd0i8z7rX75RzCqlp3Q4y?=
 =?us-ascii?Q?bWXLg7W2LMHD1VcACf9mar1uCXTyslHfsinH+uV0OPiYc8xlkXPPRN+83n5w?=
 =?us-ascii?Q?gdv5E7s/251/OLA5HuBnxCEOccho1mE2j+mC28vz/4L+BFn8KxxKkLzIBIHO?=
 =?us-ascii?Q?1Z7t5X/eMt8zRVDMpGkdiUckdKIurDri1xDBq371p6ELgMyp3khVyWgvL/nl?=
 =?us-ascii?Q?kIlSBaPlNjXweBkfiIj3fr3Z+TwXhcIsg4eg/0LX+JsRmmuzu0mqO7HemAP8?=
 =?us-ascii?Q?YDGWzTYiQbE/wdnmbLPy6+rmOazMiQOxkwnFAHxInVqAn/bTENi1enyku5K6?=
 =?us-ascii?Q?fR0GgAoGDnoI2etLtoJgHfoC9lWc43vfiD9iSaSfCN+vKQ/oNge9ohhl37Wn?=
 =?us-ascii?Q?j46pjSjpsG6DXGG4t0kzLXm9F+rzvFVU5xrWGd0wkRFX4gSb7yyTRyL3jyWq?=
 =?us-ascii?Q?Sp1wr4Ptu6rLlS/mUdGkpX9YidHTyBQ/qHr7D0C6k7xUvEo4pAnkN68qC8iQ?=
 =?us-ascii?Q?lu5DaJDbOCScWe6KzHE2fyW+jHQyTOxHsANQX60jZZXskQAqF/JC52SlwU+n?=
 =?us-ascii?Q?o8BqBel/+uOz5Mlq2yPpT6UdU4bZkTo4GUXZSPpgyl5TpjTdm91DjBrRT8b9?=
 =?us-ascii?Q?IcVHIMOP25o3XxFABtp5RdKAUajAd5BPGod2XP1kbWTB3sKuPQV1aahL6Ypc?=
 =?us-ascii?Q?v5Hasj+ZzCjxehs8/xKmjKGuSm8xbz5jqt4Dr/WPodlyXjRJ5m5+JM8fL4JG?=
 =?us-ascii?Q?895MGFg+Bx1Mbl9Vf3Xq4DgfJ6kC9ibqp4U7IViP7FGb0Lx+ytA+vipIcKEH?=
 =?us-ascii?Q?qtpA+1tcHr6nM+hvsV7jdpWaLqGHeObUOWujkDQQjqrCJfg5s4A62Fc0CBJi?=
 =?us-ascii?Q?qIZVwzLVv4b/8ST4ZKd2KWS/6/vsWTsg42qsmNNWbv0TB+HOYibtOEi5iP3a?=
 =?us-ascii?Q?eHicOTLD8tphJS+32R32NtgeIfygj1kVhqo3EzUZkL+RKueodsgvlnhFo570?=
 =?us-ascii?Q?lr4iQBCU/L5PddYGxHWzZHDTBVgOo9G8zYIUJTSpeMita99Vvi9jgAPc6X9+?=
 =?us-ascii?Q?ROSRlsGquPyYLZKDkg76ID76YXjV2GLfxED4inKeSPUAO4lpiOdCwkME0jcH?=
 =?us-ascii?Q?YlgejRkGiMyHHV7Ku9hsWHERj7wwi6JD+Nluurm6xKP+Z1rh/NDheQjyEm7G?=
 =?us-ascii?Q?7gl7YifxW4Bh1cw2qb9NADtWSrJOhCDerTz7NCLX9h/WG5PYqU6tivgNzsyo?=
 =?us-ascii?Q?NwCl9KpnvMQnYvQ1CBnYBRyGnPn0rkXBFhsI/SRmF8edDUeL5NIx8+lAyAgE?=
 =?us-ascii?Q?Ucpxj/wY4ahlM7/4R07kv//SYcUpH600NVQpk/pQ8nJJzU+MwUyoMnwTuVpA?=
 =?us-ascii?Q?eBrqs+O1zQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60ea2ac-aad1-4a35-ab07-08de8fc08661
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 07:30:18.3959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AcD7Mx4VqAL8vvIqyU56kkzZLRtItMXCFmecuNd5m3Rs9r8XaGwdTzw8+ILqWggexblkYIz31O2f62GKs59T4B10uFjR5j7cbR5Zn/oSF5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16911
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30670-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 618053761B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 31 March 2026 21:30
> Subject: RE: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
>=20
> On Tue, Mar 31 2026 at 17:10, Biju Das wrote:
> >> From: Thomas Gleixner <tglx@kernel.org>
> > Will drop the lock as it is not RMW operation.
>=20
> Huch?
>=20
> > +static void rzg2l_clear_nmi_int(struct rzg2l_irqc_priv *priv,
> > +unsigned int hwirq) {
> > +	u32 bit =3D BIT(hwirq);
> > +	u32 reg;
> > +
> > +	reg =3D readl_relaxed(priv->base + NSCR);
> > +	if (reg & bit) {
> > +		writel_relaxed(reg & ~bit, priv->base + NSCR);
> > +		/*
> > +		 * Enforce that the posted write is flushed to prevent that the
> > +		 * just handled interrupt is raised again.
> > +		 */
> > +		readl_relaxed(priv->base + NSCR);
> > +	}
> > +}
>=20
> How is that not RMW?

It is not a shared reg, as there is only a single NMI interrupt and hwirq i=
s always 0.
I will drop BIT(hwirq) to avoid confusion related to the shared register.

>=20
> I assume that you want to explain that it's not a RMW on a shared registe=
r, right?

Bit16 - NSMON: NMI pin signal level monitor register (read only)
Bit0 - NSTAT: NMI interrupt status. Writing is allowed only when NSTAT is 1=
.

Yes, I will add a comment: Writing is allowed only when NSTAT is 1.

Cheers,
Biju


