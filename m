Return-Path: <linux-renesas-soc+bounces-30098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBgDCusnwWmbRAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 12:45:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D72F167E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 12:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F55C3018AFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B022138D008;
	Mon, 23 Mar 2026 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XpQedull"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F638AC8A;
	Mon, 23 Mar 2026 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265721; cv=fail; b=mCS5eoqa6VqV39fzJZJDVBJVtU6qQHc6RDudNEDeCVh1z4UpbZzL8J/tI2ZV6jsn1sX8ZqWUclHbEbyW87OlHiMJqbmmUDcqZnxDIL54LFwrfG294Mmxb9153oXKe+ClQUrNwfZqUcB5dj6ioZQp9x7o2dF+9SLR/7ly5tk5IVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265721; c=relaxed/simple;
	bh=d7CMWhEVYNK9e/voI8WgYWv1upe7jGxirS65Tv6NUt4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CsuZ4/Qwsqf3sUEsgNrT9VucFvVKBJPkmC96uFSIRCmogH+L31xUDqIIW5Myo1EqXn55k2iYi6gRDlX1H/0jeSwrmb3f5yJHq/JebnjyyFAPbC2xU2AsV8d0ULCI5+0BNlwMCF7YDbnt2kQVjl/ls4oO/CPdj4ifAe2JAqrnRZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XpQedull; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coLEViPAk3C9dXT/yoBayOo91t+nc6ZXTtynTKkhrkwlRDtVsPl6LGEt7lPp/B7iKLvHIL/NoRbgjn6XqETdW8PHsxbvtrUEWwut55yG6i+5A/hpexI1WbGVjLoeHWhtxakaR4+5Njfdym4RZ7/wTWv8FD/xXT9bJKO5Qtk5S1qMz4TKrcG4BOfIjiEejilPiZ/pKX2B4Q5XcKZdk2QZw8I3BhoyraBUyLV1iLKoLhOQXFy/14UDiWsFNbQjsUViG5dYaYupUXQY94kZim8tRuLB2XdN6XkIxdaLMZs0e/JU9LFBIhpIgKeOJyr6BdQM1/mRxsKftUfUu255A7fGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doYmDz2z7HAYdLAoiEPfe+kcT9AAkDwP/zyORWKW8VM=;
 b=xF0pN5tCq2b311vLW8O8D+mzZBYYyz6nD5U05xUC2v5PLxZvL6aOCs+BUjaF9ed/tlG5kysitfby3CSSNPkQzihk66gfLufpS57X6airwZ9Jd2UMinnJ35B1KhTaUn0HuUFnEkDj7Au/OY6G6bYwPy2z6q1rBr3oApyhPWi9chjGGPIX83dHN73WBGE56sa6BTPTHKGVjAtoHXEqSOEEMMwusjtj+ib9lO6ZgMHTn2Oi96CUc7dxk/gCCxqBwZIEiN6z3Z5towl1+s3+ghJ9RrMmvab/gNWCyN98VAAKEb7sRPt7y+yAbHyFlvMDbkfC7H+HLDM+m2jzNTF6lPVOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doYmDz2z7HAYdLAoiEPfe+kcT9AAkDwP/zyORWKW8VM=;
 b=XpQedull+I2+P0RZqvgn0YUq21D4WmnfaSG43X5P1v5Tc2FCZkZoxAzsEnoqZrhhUIe0nOfDf8js2sscy6f7qOETMrzJ2LjlC5IiASbTZmJkPLsdfSYFqjm9evDpkiq8Swu1sa6U9YVe5jAuQZNeRaImpAlpBX6Ui8RsXU5n/L0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13180.jpnprd01.prod.outlook.com (2603:1096:604:354::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 11:35:11 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 11:34:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Thomas Gleixner <tglx@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Thread-Topic: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Thread-Index: AQHcufbWvLxNnJaYqEqQ+5P1a1g0vbW7/Oyw
Date: Mon, 23 Mar 2026 11:34:51 +0000
Message-ID:
 <TY3PR01MB11346FDFCDDE7A79F93FA6961864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
 <20260322122421.132474-16-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260322122421.132474-16-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13180:EE_
x-ms-office365-filtering-correlation-id: bb885941-a790-4820-6fa0-08de88d03280
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 vvBF0pmgCK69FKXjq1uHZVOrAWKE1RyDfFaPwbAwdkC1UpykOvPxKqXW9NzTwJv4ug8mxevuU0Q4MWKRAzTm9UTNjnl6tz63cr2PWptiti20NulwuKxb8YVvF1QCZWdiHBxrE6zMWqUb9i3yWJ9mIG1uT3G/wkSwgzimd5LCPFm/HGMPXezQeb8r/toaIGxxzw+sl1Ibagxn/pWsxhslHXkk/xarDTeC1Jokp4omjXduBS0KI09V9Lag0wvJ3Ht6sOKTxLEt5inGu/YQbjjD01aYLbEs02UUNCN3t4NPY5mG4QsULKXplrVLkFVNIjKAMA5oiyCwG3CFSuWfUAvsRYbKFOTj8wzBb72xZ/bFVu3zIa1nNGSpcoyKzRs2W4L4m0g3rqwBcyAeK6XBhAFdRcz+hHJWsJVeNvn+aHy5+3+XYGuoBEhPLbWueSH/7T8FpicsHM3Rp+C5ablPXStXlZhQOxAKmt4+0KfbwNQSPsRAHR/k+FhsVOQGEqoecnMabCye3qYxe/hVtUXMiakiYhxvZ1ZHOXvme5NfVGYGpA042LthbZgBJ8Nas6hHop1IQyS2sKzTNa98tjVSwjUovaKSbLs15/v+lam1T4SoI+8cDDO9+ffBc+EvJszjZ7gC7PgxZBpHZ1sNepix9oxZ5RTvgpqHVxo04zkO66I8FXOp2Ff2c0KUXe6lKy1TBSlUwBkPiq9cWucBrt0mlmZkGwQJNuCnHBpC34fvSNICoJ70s8RKzV4kXAq1NRM50+hW9EbhnzSt1oH3J69hePz6uBi1hFYkc7dnyPAwsOpuBIM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MjdvSMctMG4u1oKXzv7tqzVALQSuvGKmpGcK/TPzQvqZHxDO0rbd0SYw9Apy?=
 =?us-ascii?Q?qlDbKCVqWBQ2PU+rxh2O/MTihTBE4U98VqSojwnHtY/uJwKEjqsxKWoFCBqO?=
 =?us-ascii?Q?I9Abvx9hQzhkHjLdWlFtFIz5WHpKlFbrg1NbzfTYVacOPqBvXjt6MYrCCWBR?=
 =?us-ascii?Q?jtLS3LdowVIiJSvfxxWqTErGyacTYVaFYvgtBpatKHySh+dZvNvIbIpn8bhk?=
 =?us-ascii?Q?Ao3t2xNw5ZY3E0MWrain98SeSPRGMKMVG4/B2ak1luTOwhScFAr7VTX79UvO?=
 =?us-ascii?Q?GJKmdA18utTlh15KkbhSSue7bu1/o1j8TCTfI3djldkwDp0kJC/IRRy168hD?=
 =?us-ascii?Q?k0FhyLtgN0gaKpK4S7qCrMfjrPTmXGw5oc5oC49KwRoIGwxO7mlvuQHRoh+h?=
 =?us-ascii?Q?AjONBHB0g9dEBR7gj9sm1XcimuzA+tHjJIqby86IbouEkYXyad1+R3zOsDcD?=
 =?us-ascii?Q?PmWbAxjIxa/i2VsUjVSc3eZS0hdwO7PJaXvpv6QISLsWUrkZ4d04Sri3ng0Q?=
 =?us-ascii?Q?feHkX6HRUZVzHkJMZWRFVHjYbrC3A+96cT86mo7zk3CfK/lxL/A5D0irUOHE?=
 =?us-ascii?Q?Jhmz7jdNwxBhGlCgDiSH9fIoajPyLEeOP/4VO6OsIFpIWMAJFr8ULaSjTfuF?=
 =?us-ascii?Q?qX+5xY+RRA4175ncSqaVDMOM4BVgpDwrOSz5zjHoOR5OCaPKc30YEMzsAVhr?=
 =?us-ascii?Q?v7G5poDbDXhKgnROdcG6NMVhwbGt6wK68r8Ma41GVobGmtiGSQfFJW7cNZSM?=
 =?us-ascii?Q?Vx/LEMKmXwnLD8FHmwdCfwK0sXX66NH7QylGOtar2M8VRH4IKzp01Rhjvl8x?=
 =?us-ascii?Q?11UHCwsFNc1Hl9yIivYGcO4qC32F2TEsjW9kY3sVeZOshBWTHLRU+Au6/9zw?=
 =?us-ascii?Q?NuTsno49yR6ajTZgq5AsGQiP3kDfsk6xu8lbUK8xC78y0q5ycw8/qHYyshye?=
 =?us-ascii?Q?tNRIF6DbbJEoYz/4S3sAs4w+8aUIRfox3fNEBtKjeINgVlTftVhfvSFQsrZp?=
 =?us-ascii?Q?3+9ouHHNDzuP2kkmulJ5Zhoyg8DtJc1sEW32wea2chS0KAQePyl8xefwE3Ux?=
 =?us-ascii?Q?QR6j/J552IRlrmnm1oTuAYvSeawjoRqF05OtESYcxEf/z67oqut02ThMHDMc?=
 =?us-ascii?Q?xozEPTdRyMiNeJSNlB4WeDjdCY3PjMf4u5HByrzi5j81lY/RU0EIRxgKugfN?=
 =?us-ascii?Q?L5MT7sGN3Jp+aljw61ytUZU6ZNG7f8hplc99kzFCeBTN8h2ZNtkCVhyBBBdG?=
 =?us-ascii?Q?5LqxxJ3JBqRf5KVPfI/c1gQP7dNIGvUm//HuHEu3OFamW74Zd6Od2onDgxJ9?=
 =?us-ascii?Q?bHd8LxXetSNJsb4O/mz5n7VAapQYQWVQEecwx4Ch9BnUf3ebVK3aHXJeTwEt?=
 =?us-ascii?Q?9I/Xb6EaMXuP09xk4WHTPgDVujX9Igk3htRYVO1qwj15sxHswBkmapPVp6Yy?=
 =?us-ascii?Q?DmzGqal5CTi2rlC4Y7BC8ufTooq4zxmXur0teXqP879Yk3Y3qMLbkOmiAuWh?=
 =?us-ascii?Q?vPrx8MPWMdOM//EMDrFD98s5ecACyjsdms5hFpVByezPpIqBf/4a89pRket5?=
 =?us-ascii?Q?iloOsaXfBxy2aDyVMNli1xdUZU7ePUd5KD957LWSnr4zJ8236bD0uNtbN7dz?=
 =?us-ascii?Q?vCfvSLOipccAmjF5BHp1reQrXrOQVVKy4zBWHFQSTMElZ8IL9KLZH/RnoU21?=
 =?us-ascii?Q?7fsRvURAMdUDiI5w29nUvmMDOrYeTM1qT3X4voSaWF0d2triQO2PoiXtC4k4?=
 =?us-ascii?Q?bYfrji+T9A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bb885941-a790-4820-6fa0-08de88d03280
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 11:34:51.4715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YjS/2jYHKb/YHBGYPL31WJS5otxo++R9id7l4i8fG3gW2e3bzAUprQfcPMAmPXjKHuDLUXU3j8KtveeU1f6dcGPOie8czR20oRlqHKJq+FE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13180
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30098-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D5D72F167E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 March 2026 12:24
> Subject: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt sup=
port
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC has 16 external interrupts, of which 8 are shared with TIN=
T (GPIO interrupts), whereas
> RZ/G2L has only 8 external interrupts with no sharing. The shared interru=
pt line selection between
> external interrupt and GPIO interrupt is based on the INTTSEL register. A=
dd shared_irq_cnt variable to
> struct rzg2l_hw_info handle these differences.
>=20
> Add used_irqs bitmap to struct rzg2l_irqc_priv to track allocation state.
> In the alloc callback, use test_and_set_bit() to enforce mutual exclusion=
 and configure the INTTSEL
> register to route to either the external interrupt or TINT. In the free c=
allback, use
> test_and_clear_bit() to release the shared interrupt line and reset the I=
NTTSEL. Also add INTTSEL
> register save/restore support to the suspend/resume path.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * Updated commit description.
>  * Switched to using irq_domain_ops::{alloc,free} callbacks for mutual
>    exclusion between external interrupts and GPIO interrupts as using
>    irq_{request,release}_resources() leading to irq storm()
>  * Dropped irq_{request,release}_resources().
>  * Replaced the macro TINTSEL->INTTSEL_TINTSEL
>  * Added macros INTTSEL_TINTSEL_START, IRQC_SHARED_IRQ_COUNT and
>    IRQC_IRQ_SHARED_START.
>  * Added used_irqs bitmap to struct rzg2l_irqc_priv to track allocation
>    state of shared_interrupt
>  * Added rzg2l_irqc_set_inttsel() for configuring INTTSEL register.
>  * Replaced irq_domain_free_irqs_common()->rzg2l_irqc_free() as
>    rzg2l_irqc_domain_ops::free() callback.
>  * Replaced the 8->IRQC_SHARED_IRQ_COUNT in shared_irq_cnt varaible as
>    the same macro used in bitmap.
> v4->v5:
>  * Added callback irq_{request,release}_resources() to both irq and tint
>    interrupt chips.
> v3->v4:
>  * Updated commit header irq->interrupt.
>  * Updated commit description IRQs->interrupts.
>  * Updated shared_irq_cnt variable type from u8->unsigned int.
> v2->v3:
>  * No change
> v1->v2:
>  * No change
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 104 +++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index 1ff1c0efed66..97bbaaaeedb0 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -22,6 +22,8 @@
>=20
>  #define IRQC_IRQ_START			1
>  #define IRQC_TINT_COUNT			32
> +#define IRQC_SHARED_IRQ_COUNT		8
> +#define IRQC_IRQ_SHARED_START		(IRQC_IRQ_START + IRQC_SHARED_IRQ_COUNT)
>=20
>  #define ISCR				0x10
>  #define IITSR				0x14
> @@ -29,6 +31,7 @@
>  #define TITSR(n)			(0x24 + (n) * 4)
>  #define TITSR0_MAX_INT			16
>  #define TITSEL_WIDTH			0x2
> +#define INTTSEL				0x2c
>  #define TSSR(n)				(0x30 + ((n) * 4))
>  #define TIEN				BIT(7)
>  #define TSSEL_SHIFT(n)			(8 * (n))
> @@ -52,16 +55,21 @@
>  #define IITSR_IITSEL_EDGE_BOTH		3
>  #define IITSR_IITSEL_MASK(n)		IITSR_IITSEL((n), 3)
>=20
> +#define INTTSEL_TINTSEL(n)		BIT(n)
> +#define INTTSEL_TINTSEL_START		24
> +
>  #define TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
>  #define TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
>=20
>  /**
>   * struct rzg2l_irqc_reg_cache - registers cache (necessary for suspend/=
resume)
>   * @iitsr: IITSR register
> + * @inttsel: INTTSEL register
>   * @titsr: TITSR registers
>   */
>  struct rzg2l_irqc_reg_cache {
>  	u32	iitsr;
> +	u32	inttsel;
>  	u32	titsr[2];
>  };
>=20
> @@ -71,12 +79,14 @@ struct rzg2l_irqc_reg_cache {
>   * @irq_count:		Number of IRQC interrupts
>   * @tint_start:		Start of TINT interrupts
>   * @num_irq:		Total Number of interrupts
> + * @shared_irq_cnt:	Number of shared interrupts
>   */
>  struct rzg2l_hw_info {
>  	const u8	*tssel_lut;
>  	unsigned int	irq_count;
>  	unsigned int	tint_start;
>  	unsigned int	num_irq;
> +	unsigned int	shared_irq_cnt;
>  };
>=20
>  /**
> @@ -88,6 +98,7 @@ struct rzg2l_hw_info {
>   * @lock:	Lock to serialize access to hardware registers
>   * @info:	Hardware specific data
>   * @cache:	Registers cache for suspend/resume
> + * @used_irqs	Bitmap to manage the shared interrupts
>   */
>  static struct rzg2l_irqc_priv {
>  	void __iomem			*base;
> @@ -97,6 +108,7 @@ static struct rzg2l_irqc_priv {
>  	raw_spinlock_t			lock;
>  	struct rzg2l_hw_info		info;
>  	struct rzg2l_irqc_reg_cache	cache;
> +	DECLARE_BITMAP(used_irqs, IRQC_SHARED_IRQ_COUNT);
>  } *rzg2l_irqc_data;
>=20
>  static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data) @=
@ -464,6 +476,8 @@ static int
> rzg2l_irqc_irq_suspend(void *data)
>  	void __iomem *base =3D rzg2l_irqc_data->base;
>=20
>  	cache->iitsr =3D readl_relaxed(base + IITSR);
> +	if (rzg2l_irqc_data->info.shared_irq_cnt)
> +		cache->inttsel =3D readl_relaxed(base + INTTSEL);
>  	for (u8 i =3D 0; i < 2; i++)
>  		cache->titsr[i] =3D readl_relaxed(base + TITSR(i));
>=20
> @@ -482,6 +496,8 @@ static void rzg2l_irqc_irq_resume(void *data)
>  	 */
>  	for (u8 i =3D 0; i < 2; i++)
>  		writel_relaxed(cache->titsr[i], base + TITSR(i));
> +	if (rzg2l_irqc_data->info.shared_irq_cnt)
> +		writel_relaxed(cache->inttsel, base + INTTSEL);
>  	writel_relaxed(cache->iitsr, base + IITSR);  }
>=20
> @@ -562,6 +578,72 @@ static const struct irq_chip rzfive_irqc_tint_chip =
=3D {
>  				  IRQCHIP_SKIP_SET_WAKE,
>  };
>=20
> +static bool rzg2l_irqc_is_shared_irqc(const struct rzg2l_hw_info info,
> +unsigned int hw_irq) {
> +	return ((hw_irq >=3D (info.tint_start - info.shared_irq_cnt)) && hw_irq
> +< info.tint_start); }
> +
> +static bool rzg2l_irqc_is_shared_tint(const struct rzg2l_hw_info info,
> +unsigned int hw_irq) {
> +	return ((hw_irq >=3D (info.num_irq - info.shared_irq_cnt)) && hw_irq <
> +info.num_irq); }
> +
> +static bool rzg2l_irq_is_shared_and_get_irq_num(struct rzg2l_irqc_priv *=
priv,
> +						irq_hw_number_t hwirq, unsigned int *irq_num) {

For consistency rzg2l_irqc_is_shared_and_get_irq_num()


> +	bool is_shared =3D false;
> +
> +	if (rzg2l_irqc_is_shared_irqc(priv->info, hwirq)) {
> +		*irq_num =3D hwirq - IRQC_IRQ_SHARED_START;
> +		is_shared =3D true;
> +	} else if (rzg2l_irqc_is_shared_tint(priv->info, hwirq)) {
> +		*irq_num =3D hwirq - IRQC_TINT_COUNT - IRQC_IRQ_SHARED_START;
> +		is_shared =3D true;
> +	}
> +
> +	return is_shared;
> +}
> +
> +static void rzg2l_irqc_set_inttsel(struct rzg2l_irqc_priv *priv, unsigne=
d int offset,
> +				   unsigned int select_irq)
> +{
> +	u32 reg;
> +
> +	guard(raw_spinlock)(&priv->lock);

This may lead to dead lock, so need to use raw_spinlock_save.
Driver probe and eoi handler executing on the same CPU.

> +	reg =3D readl_relaxed(priv->base + INTTSEL);
> +	if (select_irq)
> +		reg |=3D INTTSEL_TINTSEL(offset);
> +	else
> +		reg &=3D ~INTTSEL_TINTSEL(offset);
> +	writel_relaxed(reg, priv->base + INTTSEL); }
> +
> +static int rzg2l_irqc_shared_irq_alloc(struct rzg2l_irqc_priv *priv,
> +irq_hw_number_t hwirq) {
> +	unsigned int irq_num;
> +
> +	if (rzg2l_irq_is_shared_and_get_irq_num(priv, hwirq, &irq_num)) {
> +		if (test_and_set_bit(irq_num, priv->used_irqs))
> +			return -EBUSY;
> +
> +		if (hwirq < priv->info.tint_start)
> +			rzg2l_irqc_set_inttsel(priv, INTTSEL_TINTSEL_START + irq_num, 1);
> +		else
> +			rzg2l_irqc_set_inttsel(priv, INTTSEL_TINTSEL_START + irq_num, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static void rzg2l_irqc_shared_irq_free(struct rzg2l_irqc_priv *priv,
> +irq_hw_number_t hwirq) {
> +	unsigned int irq_num;
> +
> +	if (rzg2l_irq_is_shared_and_get_irq_num(priv, hwirq, &irq_num) &&
> +	    test_and_clear_bit(irq_num, priv->used_irqs))
> +		rzg2l_irqc_set_inttsel(priv, INTTSEL_TINTSEL_START + irq_num, 0); }
> +
>  static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq=
,
>  			    unsigned int nr_irqs, void *arg)  { @@ -594,6 +676,12 @@ static i=
nt
> rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
>  	if (hwirq >=3D priv->info.num_irq)
>  		return -EINVAL;
>=20
> +	if (priv->info.shared_irq_cnt) {
> +		ret =3D rzg2l_irqc_shared_irq_alloc(priv, hwirq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D irq_domain_set_hwirq_and_chip(domain, virq, hwirq, chip, (void =
*)(uintptr_t)tint);
>  	if (ret)
>  		return ret;

If this fails, rzg2l_irqc_shared_irq_free() to be called.

I will fix this in next version.

Cheers,
Biju

