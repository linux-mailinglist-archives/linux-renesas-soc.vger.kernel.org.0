Return-Path: <linux-renesas-soc+bounces-30025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNtXCvlsvWnL9gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 16:51:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E3A2DCE50
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 16:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 404A1300B85C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 15:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240073B8D42;
	Fri, 20 Mar 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qUgHXcAC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED7B3B19AD;
	Fri, 20 Mar 2026 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021877; cv=fail; b=UbeniwVK0+LzxXbuKsufdVR/AXZD2hpEUKykwsLhc0LbTfaFDW3f7noVSnwZnG2LMEXVywnBzF7KhkSPy+4ArjT+/5uCpBmcgXFUMd6rbuWeoMdA6vSQ0k2hoPLgrl8Z5KdFJzImSGb3GZ80LolHkeVBcPUm49l3Cv05Hm5xKe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021877; c=relaxed/simple;
	bh=TfYChwOyhczP8H1B9Gfg0eKk2AuImiZifY7pP4IpvwE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pE7u0zTpBTtaULShi6woEIMsk3jyv6FDJPcAna4txFwzdr+7z75DgqgxrPtx/1SLzfubTTNcYlHnpcGtWt8Uonyyy28TGT33AzKluK6tnt87ij50qSor+2u9Z4XCpHKu71xDEO640BdlOZXiRLPi0hFgFmTTYKLEDIH0cvpBN50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qUgHXcAC; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+HnOZg+qi+Ec6CIAx4CH59ksPRT5irC9iNBwzU1PNWQ9vyu0E+iChP+wOzjark62XaMudHhhS7owYTyQK39Fr50WHc7tKuE31PBPWM6ev3LvDN4YrpLQdw7jKxQKLINxePf6Ab3qIW9mY/pa95TprCZoAUKGM6RH18yCntgzHoexKlGHA1p1jWFFtII3lqIk+dpNkiLAI29hTkzaYlqQ8cJ0kmG/El0SA0O/oyWhV3Z87rhf8uFU3UCSJaz7e9n74ADYb3u4F8Nm4769CsvCEhFbbiClVg7G4YrQzP9qBU3WfV8DJ1ZdkXkqL3ZUJP2VZ0e9NCVqFRpqzxFHhTBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSMCzTw7EZffuHb/QZxG++Z4zl2dAl6QF9dBAvgUDHc=;
 b=NdpxcqI7meAeLlm2OcYQszb9K0LKwDz7aKIuei2OqWECbf+VKVP1JDOarnAMXlTXPvHSSRGPFQxWKREoYhfZ0s0GpWS/nVucR+SFj5M+zOkt5B//LDdEIU49jzmG89H0ftWeh7aR6SHqxPmFZOkB3Tg+DGQHC/UvzmQw4JNt+ZjQiPGu2Vosl5v+j+mb+kOQWwZOsXGOTtKw5H/Aeofwnd4gXRfKstiQJLPBiEOxMawnsi017KR6D2f0kB/PBEOOD4pWrrOLeaIzfaJiMOwUP/xmabj+hv04G45XCDIE3Ixc2pMuO4ynwXGGWw413CzZSguqh4aoUVSp2UrnJNYf9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSMCzTw7EZffuHb/QZxG++Z4zl2dAl6QF9dBAvgUDHc=;
 b=qUgHXcACm/L4PqUauXPsZDjm/TKzxJahKQbm8Y0917WJQ4vZbTZx9x+5xQecnblVs216yNLRqM0CSGxU4iBK0eNt52Do/UqbXLSwxQmKedwH6LL7QOyWkISjW/Y6LErYMQNYqMJ5ESYW9RWi5thTI2U6bvvX6olCa/LP8wu7D6o=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11657.jpnprd01.prod.outlook.com (2603:1096:400:3b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 15:51:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 15:51:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 05/15] irqchip/renesas-rzg2l: Split EOI handler into
 separate IRQ and TINT functions
Thread-Topic: [PATCH v5 05/15] irqchip/renesas-rzg2l: Split EOI handler into
 separate IRQ and TINT functions
Thread-Index: AQHcsYzHQuhbcYvYckyloBhpYsux87W3J+IAgAB1coA=
Date: Fri, 20 Mar 2026 15:51:04 +0000
Message-ID:
 <TY3PR01MB113463C7A7897C959A82DA96D864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-6-biju.das.jz@bp.renesas.com> <87qzpelwnb.ffs@tglx>
In-Reply-To: <87qzpelwnb.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11657:EE_
x-ms-office365-filtering-correlation-id: 5eb537e2-7f80-44b1-45a1-08de86987e10
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ob85wXeOjH29k103WohOWiYUplRQ07X7a1nJ6q4pO4sWZu5AvuNfx0VMyf05vEPfDO90IJ7LlVPbM+YOLT2XeblE49x9WTIeoL6iFCeeYqOgl+ab7LmUh9Nu1xJgkruRAj6IdZ7DCizS1CCyZ5R4R18m8/32+4y/sBX6PBjfCtLrPWULkOvuNmUxZk4nKplJxPxB0ljrL1acGxdFyZNJ1nQOW4OuArfkKOCaZ6Uq5HoogjB1K3z6acM/maF+vVA/lrZT45f/DSpBtEMHF5fbdQA3xrZwo6IX9TgorJ8Es7wuKLSBRukNehwnG6nKdpPOPJkFDUw5uO3y3XtIzHW0M5tELtSAS0tTiDdvUN0SZ7+6M6vWD53rw4LliapXk+pDBOmneHGmqrbCFBbDsGsDPVn49tb5MZmCPiPA5msjtQTdMsOqXDT9EHAYpw0GCo9Lb56uyM30e4PcXGoMNAi/XMbB1amaPbX3GotHOVUWzcEOHrF8pXo1uq2R075rOSlRVlaCwjGmS6AjgmlFtqkZwJtKmbrxo6IoVa1bCtjUqH7K5w/Pio2E/g6a8EMlPoO1nRY+UbZCDCJJ2Cs2rAQXfnwMv2UcanRRiLLfAAOC6J+qbVC2pOHc5p6dxjP0ONtx3QDm/WWF+K3SAzvsXTwXHxyi/PkG/9QR++TiNDkwZreWgd9f8268oJganRwCsyqe3fNUmGVbC7EK/yAF3UAzM514mchO7o2ujyMVgD5uN6RWljgsawbhHuusT8FxZIsNI/drry6Dp0t3cpkGED3igvtGMMQnAPbDpve556vnH14=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LFVdDIWY2DiOTiQCwL3pRd0zFn/HsuhYfgm590/pxPhSgCKZ64hv+T5leiQ5?=
 =?us-ascii?Q?+zj3w5kMQXsr2NC1zO/4GmBJ2qXNxFQRtAC/uWs0bOTjpWacn73pT+MI9sxW?=
 =?us-ascii?Q?41KyfXjCsLTTzgYzv/S8TENQwUUrv2BBhD5qYzyFn+NAVTc4cjteqRDnpmUF?=
 =?us-ascii?Q?L/wgjHDpsMiukqNmaW/P0Lry+fik6DZQwPZQiSAbQC9UjL2+EqqTmyCsUN1V?=
 =?us-ascii?Q?8JVNgwLg6j4QSkt+f3cfDeXyIL79T1kx+HIXus4QxubnLMHJeJI4cW4gRN6b?=
 =?us-ascii?Q?MvFKsEVuGHf3RxILZ2BBLGFg6H2OmqrXKJH/CT2XXcl/1CJEFL+7Xm4F+NXj?=
 =?us-ascii?Q?VpIb6GXMXo13FjSlnrA4hS4OEMaVz+sg4cRMmyGm3UFx3EmvKmL1lMmUtaKa?=
 =?us-ascii?Q?ZpoUQ1DeuarqbVLrz6CRhH57vG35Y7Xja4UNALZuqFtdnUveH7Ne+Vv5CTOc?=
 =?us-ascii?Q?Gsm/CoZFL+An2hdPuR3X3J2VJl98qo4ezzcg6E6zIqE5x6KriceAqRqFEdX6?=
 =?us-ascii?Q?pgFeZ/JVv7BP+xt+6JM0weqqyBhcb47LUEZ894vZatPNNvaUojmosjVm/bA1?=
 =?us-ascii?Q?0n2RrzapHghT6sv/bZe4oUaWsX8n2O87mwWSmKQ8N0Nfh3r/NOJ97GYlQv42?=
 =?us-ascii?Q?b5irBXiF5nJoicsRU1JpSxs2KyWGsiiU4WpJ/NJLZTsFLv6RaJDx6MDJC+dO?=
 =?us-ascii?Q?asTfhmPvvBVvpvhrHICu7mgzjopCdLsXU2LTZ7gbr4N0NgRS7h6ChS13bklm?=
 =?us-ascii?Q?SCcRyoc+Eudg3VBkWNr3tLS4m5XLNUPMm4vfZYnkLC6bAl1dwc/U1FJ2IZFF?=
 =?us-ascii?Q?uRQxDCwg5nug2j4fi3Ihws85ut6Xx0Rbi20aPW3wLqYf9d/kgnD7RHSsHd7+?=
 =?us-ascii?Q?ie/e+PJy6r9sxIk82cWzWDdiCkS9+OqD8317hXBhL04PzifVp2IFsr82f/Vp?=
 =?us-ascii?Q?kY1OeflMXGCF/IU3bjt3HVGmbnz52dpi85RcaX59uROI/233dJqNR+PodR+P?=
 =?us-ascii?Q?pZhdmNVz6zjahhxv6bjt5ulT9eX4w2+lA9JbDfjZyH1wJQLqBxpfbx2pszt+?=
 =?us-ascii?Q?JM0/dmeJaXq3QpehdidHBToVJYov0G3tZS7ygZQ5Sr+mK/E5VINn3k2UT9UU?=
 =?us-ascii?Q?Ebrq3JAfwi4nyYkXoma4lr863Q3V5QJ7Ygi3Z4dDKAnoSMnQwBK9p7aRdpaF?=
 =?us-ascii?Q?w4swDQnJltge29Og3U3jGMao6Y+0eXFffwVjtlsuhWDJQXGfq0dX/WSOn1N9?=
 =?us-ascii?Q?opq8UJ6iQe3XcpZigfK4cunGPc3xMc+WIOXf+cZCzd89SpzPAnJSh31+Mzex?=
 =?us-ascii?Q?rI2lxdTSv7M+Xy7d+1o7Pd4msrgFBbbffbrp468n3dKUa98H7KpDH7Esm9W2?=
 =?us-ascii?Q?g/BKxohrKnA0mwg/5uAdX3ZmyjEfyj75N+egQsJcNudMPYKzup1HN/zHnWxS?=
 =?us-ascii?Q?OnuNODCM9PPP/+Qo6xGIGLtcFlkigia0rZRWmnkC5asz7/HLpSstxlq/tAwF?=
 =?us-ascii?Q?oxPg2O+h9n5SU4MBfkfeScSBKefW9Y+zZqmUVwvpfcaHJtq/pZJ77/asa7UF?=
 =?us-ascii?Q?KfbfAo3fhIWhTOH+LV1r+hpwh/hMsc8D/FWRlYi+hq4V5+G4nit6r2ODcNm0?=
 =?us-ascii?Q?q6DcrlPG9gWm1LVizQ6KaM/3vJmm/dbo7UodPJcwEwSg8lu5Yu8OUa2m5X2/?=
 =?us-ascii?Q?EUd2Dfuy4WFdnX0AsskRTt6QQFTHxlxYAHMDfjhtBdKEiVv4/oGnXvFkxLu5?=
 =?us-ascii?Q?ORpp0nkCng=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb537e2-7f80-44b1-45a1-08de86987e10
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 15:51:04.0796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVAvspA/Xn4PHPoMy/a9KaaBzn4O8SqAKCqK7pJ5Bv4asdx+rhf0X71voa+fR4bUmsLcJJa2wswQmxsPfVVnrm1jNe/6C82msfNxBfqFc/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11657
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30025-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44E3A2DCE50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 20 March 2026 08:43
> Subject: Re: [PATCH v5 05/15] irqchip/renesas-rzg2l: Split EOI handler in=
to separate IRQ and TINT
> functions
>=20
> On Wed, Mar 11 2026 at 19:24, Biju wrote:
> > -static void rzg2l_irqc_eoi(struct irq_data *d)
> > +static void rzg2l_irqc_irq_eoi(struct irq_data *d)
> >  {
> >  	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);
> >  	unsigned int hw_irq =3D irqd_to_hwirq(d);
> >
> >  	raw_spin_lock(&priv->lock);
> > -	if (hw_irq >=3D IRQC_IRQ_START && hw_irq <=3D IRQC_IRQ_COUNT)
> > -		rzg2l_clear_irq_int(priv, hw_irq);
> > -	else if (hw_irq >=3D IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
> > -		rzg2l_clear_tint_int(priv, hw_irq);
> > +	rzg2l_clear_irq_int(priv, hw_irq);
> > +	raw_spin_unlock(&priv->lock);
> > +	irq_chip_eoi_parent(d);
>=20
> Please convert the locking to use guards while you are changing these fun=
ctions. So this one becomes:
>=20
>   	scoped_guard(raw_spin_lock, &priv->lock))
>         	rzg2l_clear_irq_int(priv, hw_irq);
>=20
> 	irq_chip_eoi_parent(d);
>=20
> See?

OK, will fix this in next version

Cheers,
Biju

