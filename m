Return-Path: <linux-renesas-soc+bounces-25081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ABBC815D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 16:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 220EA34A2DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 15:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DF7313E32;
	Mon, 24 Nov 2025 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q7nEjiAL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3D4313E24;
	Mon, 24 Nov 2025 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763998131; cv=fail; b=rFA2AzBnRy56OM0HOz6o/LLurJZScAFE/3aP2q5+5KB+ieCYd/Vv6R90md14rEKggu+dn/jV+zhgVDUQ2bw9alLBd5Lt7CMapGVsMXVrfr3moHeENbgXR423PIoLfCIOUb+CfcLqlLsB/1Jn8Zg8m2uRUCaFarsT+0DOhL31B9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763998131; c=relaxed/simple;
	bh=+QmPuExkKAgxt4i3ukIy12CZASdHg2oD/Ui5R1WTfWI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KApmfRjBdlFfaWPpkkQ3iyP8xeEWeBFJZxZ6PxJgozkIIkf4otWWPXPqDK9hXIVI0S0KJZmnNgPtiK8vhEOnsxZluIrHgU+79MWz+5Me8Gyl6YWuU0QT4V0Us5u0CD6AL5cnGtn15sd5RT6901QAlpvtKLhmK/BDPbmjCz9xkFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q7nEjiAL; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GF4J8f39aUB5bcZV8nZ2QH1+QYOvXLV3QGfu3tARRyzFAjQFF2himAs4AUhxRtPuJAWp8QbnAlTE8/Zf4j48Q6kzS3WV6sLDN5UJiq6EcirZTA140ErCtaaAfe22eqLlhXpcKsBtANj/1Xccs24QD6/Vjrb7BfyLNgxCed7X7S4U8OUgc4E62sBknR6i29Iou2yzD/WKmRCgfsNepuptjieGe/ONhMqvaZu0yPGc930fQ0/5kUMf37+zf0WwrGxYKQYin8ZiIU/QlJx1l7p60mJm+EhOQ9dWeHjubKNwF3gFwOYSEITw+rSyFyXICU1d1Yf1pvsXuBntwRhQqjA1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toXXFLRrP7F++GjnO1VKL7DdkGISCsvQBvJMcgX0l/8=;
 b=R0sHHHHznBQBqzSb/5PV+mrk5578GNJrBw8pBoLSiu0qCC5oeHStYdhHPw1v3py66/2uwCAVL1uIBWin7cWAxKYFwErdrTgq+nsaa47AKWk0sVqdYu2nbMwGvwXCI5T/30jhzK6+H75s8R+2Err5l8E2uFg38lF4SbrX1a60+YvTZQGU/PZWT6va3bjZbE0bTe988BU8Of4U5XsJSxNvC0/+w+w3ytP98zTRkd2TO/OsCtWt1Lxp8qRJd6JWFeqHHvafv9ZtGcOkKsPXGVH/Dzv7RZwgEN65Io3TZonKoPXWySLnBj4TaqCM3nXeXzSLnD/LIoLzI5tw0SL9bYxS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toXXFLRrP7F++GjnO1VKL7DdkGISCsvQBvJMcgX0l/8=;
 b=Q7nEjiALJ2rUrLUGT87pVwf6pD8PhgkZnGTza42GH1zb7wdkwsXDLyiAcSP7Ah0OwzvomxTYilJQ9H14jnn0uZGyAcvAZLhmORhYYTCfZtlB1l2GoZD7gzNgpKySi/Aj6hpIR8vNj6oJR0l55NspaaCLKougVLcFw3QbjTR3MkA=
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com (2603:1096:405:1a6::6)
 by TYCPR01MB7920.jpnprd01.prod.outlook.com (2603:1096:400:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.10; Mon, 24 Nov
 2025 15:28:41 +0000
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29]) by TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29%7]) with mapi id 15.20.9366.009; Mon, 24 Nov 2025
 15:28:41 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller (ICU)
 driver
Thread-Topic: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller (ICU)
 driver
Thread-Index: AQHcWtghbawqYjnook+9mPCVu+E0SLT+2zEAgALiuHCAAB6zgIAAF7uA
Date: Mon, 24 Nov 2025 15:28:41 +0000
Message-ID:
 <TYYPR01MB139554C11AC25646D5503985385D0A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121111423.1379395-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <87see6hxjb.ffs@tglx>
 <TYYPR01MB139556A313B1377F9306A7F6485D0A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
 <87ecpnilqw.ffs@tglx>
In-Reply-To: <87ecpnilqw.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13955:EE_|TYCPR01MB7920:EE_
x-ms-office365-filtering-correlation-id: a0d6100a-f71b-4d11-7b1c-08de2b6e25c7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Pc66fNvtyfof+fYqqiByT59MLqvL4cpEHQDtwZqhdOV1y3ub9/S0ByvQLUVH?=
 =?us-ascii?Q?zXZCXchpGOjAp+oUeo6CaTCpVcQXfiV+9w5dE+Rdbsbev4Rwlw1L6x7K5CWn?=
 =?us-ascii?Q?pGSmEtGoyOPLBRJSU0nGKfqfCFLWdG96ER+CUyb5+R29F49SPyxLqwoSWCQO?=
 =?us-ascii?Q?iR2Zcsx2/ogMa60Dst6i5JixfVuQks/A9z5hqfLdgCp15s27Bh5JzBndg0wI?=
 =?us-ascii?Q?oV9cf9i+UfbAA6gT7d+uxD7HFJvOncNI3ac/eAJKnlkdRQZEmZEYYZmwXqZY?=
 =?us-ascii?Q?0Iz+nGTTzQkPSuBbzFuvmYe1sZaVlHhpGjOk8p7+o3FFdaaH/wdC0ZfsfuY3?=
 =?us-ascii?Q?iAi2rts2gvYawJRZFMSifCHPLWoPkH31Tem+FbCCH2mYZIWJS1kfqR+flRmX?=
 =?us-ascii?Q?+9Z45Ywv5o/Qe5jRPtytvp4T+FKeEzUTlWMeOCqVyXXHEUvU7+WfpDVfwjbF?=
 =?us-ascii?Q?X68RpsdRBBxTfidqPAu1A+02ORRN4MiKaYc/xLgmrGBF1whuUq4R8uI5O5VT?=
 =?us-ascii?Q?+b26gV+HDPIu9cO8KO/044jv//j7K0xJgxJgMNnrricwUB8xD5XyinDOb4y4?=
 =?us-ascii?Q?ge8o6446mjsm8ThNzP6h84Ha4tJwsUCxiZGWhscjhBsn/ng/dWDNh7DN0Ukc?=
 =?us-ascii?Q?0AR/sNBnhsWIfMZQbwqr2YOhpcGhCINRJXA82d8lql4ozLtJNqcNldKCJSg2?=
 =?us-ascii?Q?6uBXhyrQlB/DtkiLV4K1b5SP1pXr+KYwd42BuBn5mFdcmFMKMd3UEApGx/mI?=
 =?us-ascii?Q?ipFAfp40AdokvpvGC35ftXwQ467CoFVH1qKpRoO5t2jRJVO1ywh7IYUmPpjQ?=
 =?us-ascii?Q?IS//XLxST+jUz/jBffQzO3BDTN/LB2z7CQrQ2TWYBWgBjhZSQSUJsr0kQKTq?=
 =?us-ascii?Q?mCOlHi4rFvUvq+G171H3kgbLG+f1kB6u8qFKksEKdFWcNxDva45HTHG5Bvp+?=
 =?us-ascii?Q?FOL7XffDzYg5rc/lmTFCSOUn8E8q8iKHT1LF6ALPHjkQ/yjS43jZOGijMvKQ?=
 =?us-ascii?Q?yJ7UHpleVj/AdGPzcRQO2o73TzaVaJwMNAZkI/2SqO7GFW1l3mIY4jW1Si7h?=
 =?us-ascii?Q?vDH95KJ/kiJbyDWNLIHHO1a/zQYVeOw6DFlY24XkmN9DGmdAWc0dr1lTpD87?=
 =?us-ascii?Q?FetzYvI9Wdb1ru2npIAqoj69Xbv72vtI3lp/Fy2u/Tv5gGHEe5/P5gsVZCMP?=
 =?us-ascii?Q?ZXqGcWAi7/3wxS7/YAVjbJmy0MvYtFYUKzyWq8QSiymZfVHP6moyGOqVt7Ac?=
 =?us-ascii?Q?qtqmGwJaTIsfrhqfBW713pOaQrr/lzIPuKfL0bErPx1OsnwqHnXgTE5j6c59?=
 =?us-ascii?Q?un9lcmbblU8Z3HypFVQorFgAJ1s650e5yryybw2jYEyFFTYW/SaDzpfpSArV?=
 =?us-ascii?Q?EyiP3JmD8CVQO9jK7z8rYpLGqtfSvlIWLeGZ0XS21ewF556YU+xwwpXxM0Ja?=
 =?us-ascii?Q?CxoTJD1A2fh/RSKzylEB5KKX5lX9FgKTNV8fY3eNaU134gQANzSwO6aiFk/d?=
 =?us-ascii?Q?nzIew5oSL1L1Bffh5i6y5A/ixW7xhL6yy9nA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13955.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?X9AGpQB89H8sccAcu6N6dNH9NXcTeSlQucuejfS8M7CKiPcYHikM5M811O2V?=
 =?us-ascii?Q?RFUpC1DfNMGjJ5Fo/w2CVEGi/ESEqfD3dkQiyuJbGw92YO43ZSc4yXa4t8ep?=
 =?us-ascii?Q?Jm9ynSiJeaiotEk80RyO6T26A2Zp5K7k1qo0Np/pRGWX2ovK62ZF2rFrQdnV?=
 =?us-ascii?Q?pnuHgH/a3yohCGbY7gRsba9Pt9r0GEiyP3VhDeFm9O7AokIfod6lEe82NMtu?=
 =?us-ascii?Q?16UKZP3aoDgPBQpH/2eaGcuOeFIl0bW59zSVcoWJMhsjn5f+W0/IHBMbuKB7?=
 =?us-ascii?Q?At1maZ0KwBa4vw5D1jLbhOnpLNyw+9WPqhy1VS3tv0Ksw77+0KmHeUBU5C2x?=
 =?us-ascii?Q?wg+Lqf+W2H6Ia8RhsmuCSoRmzafra5qD06+LOMXxuNjzsA5hjHSGG9lP/PMS?=
 =?us-ascii?Q?nRj7vsEj4pXx0Gg09uIO4ikwEpurY1L5Ik3fnTQj35FPXPIvu4P7cfn37/7P?=
 =?us-ascii?Q?ejqyjmt6nj7sg9mIkLOe716TTjDeJ9V9dxi+qLVBpbM/lafZABC0chWGesHc?=
 =?us-ascii?Q?aM8kbYbcoI4b1hdTetBsUD4fe0teYzxh1Pz22ffJFH11SIu4q555ai3RGs9n?=
 =?us-ascii?Q?MyrnRrQNVD1a+vUVLVT7FWBtiU9WvlcsaeGoZg9w6cwaditrkp1h2MfebPeG?=
 =?us-ascii?Q?s+XzXPI8MFl8mpWv/8sFNyZQFwrfUd483cThDwisV918JbeQzcQFLQ9XE5c3?=
 =?us-ascii?Q?Oz9hjxOrqhKA8HW1o7Au+y9RRB0COeQ+BnxRec0V6/dRAULXm3APzQHqtryF?=
 =?us-ascii?Q?6UxBSO1PEfO/CDMxMeT6Cj0IVGGetOxLugsVQaDsoLMDVKVqoISDDIbvfcpz?=
 =?us-ascii?Q?sL5QV9ud2t/UXLeGRI8k9YuC3nx19YgVs8Ih0tQhKul6x/OBSZh9ptMvTwJw?=
 =?us-ascii?Q?KCgn36CPKdtx7Y8X1rirNl70tXET8maSVYE+RjBNGhiNXQrUmLw9G2fOo+qg?=
 =?us-ascii?Q?GJ4DW8pvfyLAN5K5+4QHh0ZLxpNH4RjHYy7fInzvgqYwCVfLCYJ8z1Y8waxH?=
 =?us-ascii?Q?/78Rwojr6R4+qFwXRTjjd4F35RRNfLMWe0BLAqFgILZW8yq17HfRp/z13y64?=
 =?us-ascii?Q?3HpIDVDCB7b5kunOtLfOu4smwUts8bBZbTwuBxoalwojbLZtmccop9hoPpAR?=
 =?us-ascii?Q?7UA1vF2FohHx3xv9FToxEoBHfzA9KFs8shS6kFe7BYhzDQplSQfmZFkYPMw4?=
 =?us-ascii?Q?2Yjl55Q2+Bpna8JiDVH4Q+fGfl8ae4ocUuIHfUxCwvP8SsxEoB4mfEy+S/8u?=
 =?us-ascii?Q?OUSAqA3AmUejrjhzd3/E2VYpn+H15Nc6SCxbaQ00cgVW03a4IGliEw/AEk7j?=
 =?us-ascii?Q?1wi6tyqGE/pl513TNKg413M86R6YR331B8+gRpm/Wi6tv84+bMJpq696Wo0n?=
 =?us-ascii?Q?iPzeuVLrNZty+dZIaQtonn3N+h2kcqw7PgeFoOS32GH8aM4HpoFFzbyVALn/?=
 =?us-ascii?Q?wiLGPI/eHpAXLAz4V3i4XtqPfGzrDAk9OJxwWPv8yefvNjtQin6MNCTX2u9l?=
 =?us-ascii?Q?n1HSM0pYgjZzlDXEVKY61h015ifbWqRcoR4HJ6ZrR7GtUWnO7D3ty0ac1oET?=
 =?us-ascii?Q?FCyAVDsQSjsFpeHi3V0bjTOK44AuDCu/XhMv9ElFhxDdCIqY7Ex1QH+jYRgU?=
 =?us-ascii?Q?6ma1f8aokrowRVfkMEXG1mQ=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13955.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d6100a-f71b-4d11-7b1c-08de2b6e25c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 15:28:41.3008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vp5chyo1pqufMvacdl/wD0ew5CEf7vfKV2D2slQkCKm7grnFN9ETt+Bm6B2aVCDKrXmuiXD7FX4HmAxF7toUtRqt0UKUqW8xy9Yh/ljq642MS0Ws1dedqMDffkOXxec0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7920

> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Monday, November 24, 2025 3:49 PM
>=20
> On Mon, Nov 24 2025 at 12:50, Cosmin-Gabriel Tanislav wrote:
> >> From: Thomas Gleixner <tglx@linutronix.de>
> >> Sent: Saturday, November 22, 2025 5:56 PM
>=20
> Can you please fix your mail-client not to copy the whole header into
> the reply?
>=20

Outlook, it's unfixable. I can remove it manually each time if it's
too much noise.

> >> On Fri, Nov 21 2025 at 13:14, Cosmin Tanislav wrote:
> >> > +static inline int rzt2h_icu_irq_to_offset(struct irq_data *d, void =
__iomem **base,
> >> > +                                     unsigned int *offset)
> >> > +{
> >> > +   struct rzt2h_icu_priv *priv =3D irq_data_to_priv(d);
> >> > +   unsigned int hwirq =3D irqd_to_hwirq(d);
> >> > +
> >> > +   if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_NS)) {
> >> > +           *offset =3D hwirq - RZT2H_ICU_IRQ_NS_START;
> >> > +           *base =3D priv->base_ns;
> >> > +   } else if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_S) ||
> >> > +              /* SEI follows safety IRQs in registers and in IRQ nu=
mbers. */
> >> > +              RZT2H_ICU_IRQ_IN_RANGE(hwirq, SEI)) {
> >>
> >> This nested commend in the condition is really unreadable.
> >>
> >
> > Would this read better in your opinion?
> >
> >         /*
> >          * Safety IRQs and SEI use a separate register space from the n=
on-safety IRQs.
> >          * SEI interrupt number follows immediately after the safety IR=
Qs.
> >          */
> >         if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_NS)) {
> >                 *offset =3D hwirq - RZT2H_ICU_IRQ_NS_START;
> >                 *base =3D priv->base_ns;
> >         } else if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_S) ||
> >                    RZT2H_ICU_IRQ_IN_RANGE(hwirq, SEI)) {
> >                 *offset =3D hwirq - RZT2H_ICU_IRQ_S_START;
> >                 *base =3D priv->base_s;
> >         } else {
> >                 return -EINVAL;
> >         }
>=20
> Yes. Way better.
>=20

Ack.

> > One more thing, for the above cases where the same macro is used twice
> > in a condition, is it okay to keep it split across two lines to align
> > them with each other, or do you want them on a single line up to 100
> > columns?
>=20
> Usually single line, but in this case it might be more readable. Up to yo=
u.
>=20

Ack.

> >> > +   if (!irq_domain) {
> >> > +           pm_runtime_put(dev);
> >> > +           return -ENOMEM;
> >> > +   }
> >>
> >> The mix of 'return $ERR' and 'return dev_err_probe()' is confusing at =
best.
> >>
> >
> > For ENOMEM, dev_err_probe() doesn't really print anything. ENOMEM is
> > what other drivers seem to use for a NULL irq_domain_create_hierarchy()
> > result.
>=20
> That's what I was missing. Now it makes sense.
>=20

In conclusion, should I keep the bare `return -ENOMEM` in both instances?
Just to make sure the next version is proper.

> Thanks,
>=20
>         tglx


