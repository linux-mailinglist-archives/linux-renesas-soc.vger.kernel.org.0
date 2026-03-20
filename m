Return-Path: <linux-renesas-soc+bounces-30026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOfwJiBwvWmt9wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:04:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1592DD0A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 071C330C2968
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 16:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046D63CCFDE;
	Fri, 20 Mar 2026 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Lf7ol9lk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF31E3AC0E5;
	Fri, 20 Mar 2026 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022542; cv=fail; b=OE0lfzudniZGRNV6N3ylNTmlL49NM7rmDJ23KWEuD7oNYXjpjRH9b5n0exWYms0ZLduKzMrlemitPsf9pipXWlrqJN6rYnGKCUlyBqwnJfnt7xMWBEjDaoFOeuOlv7KDRQAwWyKEMFfJNTDDYT++GyI8990VjExE1MbirEBe/pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022542; c=relaxed/simple;
	bh=HoKNGaFbYPDqllbRPLIW84//GprNV6RWCPjMefb2jcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ksXRIAoIOAPRGvlkFzonpnCOs+Sjt/btbNczfq3lTs6C4pojPgRYHXwHhkjCpGi3omLNfc/o3pqRLnYhAcfwgcTX45md9fYOsp0+HyBRLXbPiXCsnm67C3hfthXGjOQ7iA551fUQHTNgki00m+5T4vg4fZTFsFTN3MpqhvX1pHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Lf7ol9lk; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+VsGuUGRgjntu2rhsMOB7BLtGbCMIVFb3MRCz5mv0BJ9BygYFQeu2TnT5XbS1WSMw0SzfjNcOAIr4Thv5YQnxr4IXOD9hlkyX+b0fyU/gH6ilCkBkF3+2sepHZigtr/o48BdoVjyl32kc7ztOFlqMkRHCHpuYJwXNPruq71svk1D5rKfXIbnwiDUJqcIMOjSlar91Fd9HuNaDhvkPcJR25neb1sVDXTStxIM/wHCf3O8WIreHL/HrLyOWNVWamGZxVNQy/sekPRV+500dy13mOLwK7LUUtjmgHZoYzjLL4GkY+U4GfCHtT8x+2zHcW99t9YAoHhkEbjFSPu7eyZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjh4vBxFyKDrSSkHYodZmqC7zUJ0H6yBeWiyvzpRj5g=;
 b=QQbX5AN6hSft1DGwDUFzf2QfEUMrOVOLyplQzyTHHnbkkZ8WrTYMTpKr45e9R4FUjFcb5mYN8hSYE2SbyWwdm/CBgobFbxt/mryMIxf2kl1mnWYJQAIIOqTVDNtGAATwCKdzaCQefdPuHBf5yXdZg5r3LJ57Z3zuyuTlJuZzRydpRTtWH0Qs3/ok1yj6rNkgvW7p440vrtgePdXkSjqgOLAKWYC7wjSfGGNMScDMBwUM20DbPRHSrUkWCd0OJBn5/u0N8BrZiY6201laTdJMaCpPCFFnyc2KXYhtkwZUZY8TTocJdpKAJ0w5Ipoch3Eh3D8wvKcbmDPAZR+JWIiIMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjh4vBxFyKDrSSkHYodZmqC7zUJ0H6yBeWiyvzpRj5g=;
 b=Lf7ol9lkmrnke7LY5ADtdJ16ZYenGX3qG4OlQbuM7VixfP8j2Cka6fiiZ9Ez3kzrlZgyvAsvM/sG+yvZOFzAzyly+zKmUfCaaAchSrIL1bklG2mQ+DnYo1UKvoeSc9gV88azOD99AwgwVVRWk2VfYfjMCX1bi25KuBu+D3Fnnzw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16913.jpnprd01.prod.outlook.com (2603:1096:604:408::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 16:02:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 16:02:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 07/15] irqchip/renesas-rzg2l: Replace
 rzg2l_irqc_irq_{enable,disable} with TINT-specific handlers
Thread-Topic: [PATCH v5 07/15] irqchip/renesas-rzg2l: Replace
 rzg2l_irqc_irq_{enable,disable} with TINT-specific handlers
Thread-Index: AQHcsYzILj7tIN1+5kmo5Cnl520xPbW3KZYAgAB2GiA=
Date: Fri, 20 Mar 2026 16:02:14 +0000
Message-ID:
 <TY3PR01MB11346C4EA7A2AD794706634ED864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-8-biju.das.jz@bp.renesas.com> <87o6kilwd5.ffs@tglx>
In-Reply-To: <87o6kilwd5.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16913:EE_
x-ms-office365-filtering-correlation-id: f8bea0a0-0760-49e1-21e5-08de869a0d62
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 Je+IH739E4FH3oWlrK3QglKGh9ZdI5JT/CJniIHo7NaZCyrGbiONjx1wlcwaN5/CYr9bePfM0ZXbHqBYwjcSfR5mTxnR02euQz0Dyno/rKxfpC7N77mkBAp45ikvfcUklBQIA5R8zbgFDt7iNDAA2TbFZY93/EsHDlNmdApyN+VZTzYGf/tv9jL4fMMOMzULhF6lnzHk7p4fM6dei6jdBsFDljM9rslSIFybdfPzHexA/0YMxk6NIxdjmKyXfnqXhemlUKDVPpgpicgRR6Ng4hkAItnk2uEBiuSTSNA/Hm4TRtxYK9cXVqZp5T3ECi9GHdXChJt17ewTJxNS1ovv2b+fSqr0pI9P8kVxh2VGrq854pWq7cSunyQKW+WSeDM/Tx9mHWuuWvyRRRUdhJzv44utvVM+w9wpEoPjv/jjXUfwRX5iJ9elwI92djAgH1RgP9f+m+eAt3jYDc9wyGn7813Jw0f1+EiC99iP0OCxTu2mFurPwVwcF+8O0eQhSb9DeRgbpD5ZDUK8rJ3e833hx5SFJncNTnYZio8cddN0xh5ezhjikekP6mYOrE53BFosfWBHJYP4tAxigNBkfwMJIVJjVQTOaw/ZH53SgbZ7uZLervBD1VfHsReUAgo3eIq5v8mSt3KZjFZqTRO3bZrbn/snx6Z8191xvMAcYixNQ+Y1BbAPYwz1TeChqaj98wg5M61+ImvVhAdzYcv6vikRVw0o/VbjaTXU3L7WexwAN3TUruWkXiM0YLrP9PvDcQKxOHDPmhrWkeBLdr08M+7yoayFW0ouwmdAQQYopLE8ByM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BxU53TzpusgWhe9pdLNKMwKTMCgq4CoNkMw7vfTENTGGnBJGzb7YU8Fq1TiO?=
 =?us-ascii?Q?5yrZG/ZNEQHTa6BM+TZdczxxWo567rtyr4o5e9N/dGAbIUiLeDy0y447lq+8?=
 =?us-ascii?Q?coFHG3DdYZhIvw2zW5q1teER8280PYiceJanUKFHzPHtT4k7EFNZZJcWtSzS?=
 =?us-ascii?Q?4v9r2ZO2r1QEFatIdnnHuzznWDaH95rO/6SS/rmK9cc8PCRVq+cDG/AVfCiV?=
 =?us-ascii?Q?RjeeqXIAdKoaBrEfcOp/+bmSLMRU8FDSxCzK8k5PuToeSjZWp5V6s0TQ02aW?=
 =?us-ascii?Q?sy/ZU1rJQ+cPJDGh/xYUOiWGxmR0cjXVxj8FzZ56YIh7O07PRRvawI7WZvga?=
 =?us-ascii?Q?zVT2wX9swBANiZ1lt3xNdPkee8FZcHQujph+uEwhE5rOrQ3U2LMsuJ5JC7YD?=
 =?us-ascii?Q?78miTy3pcbkEmLmN8mgTY3TGu+qBo0G8xkZp9wFa2QUy8lKrFWEWo6PHSy1n?=
 =?us-ascii?Q?585cNe6jDuJLip/TncFjTN1rqR7PUDtShdUsl1IzFSmxZdujrY+KkJPcAmpI?=
 =?us-ascii?Q?WESnEWRiQC0/zG95/oC/TDyG1+in/gsfDcrb874AXbQdyit8lMXZHgbJzAkD?=
 =?us-ascii?Q?K9xtw/U1w5ia0J6FDvUSIM/koqu5LXhvvQVULoXq7cC+Pic/9/R+I83p6/eg?=
 =?us-ascii?Q?zPJXZ2bwLBalVyoHJU6oEKGJO4emy4gdZpUdtKconCjLwsbqo0kAAqN0sNut?=
 =?us-ascii?Q?Iym8/WBc1i21pONH1s5MFdNI8KSRI3ia8m3K/RWeaBlADEjOMEafV2uIv3Sb?=
 =?us-ascii?Q?sqOtfaV4Q3LLDEq3eQjonBFYYeRuMjXkTCtMdWPeNkLABJOpSqZKfms7Optn?=
 =?us-ascii?Q?IpFcWNjStPVzVRoaudhgFlHQwMcIMxIfqxCWUbzo7AeMwtvUYAxFv9/KxVcs?=
 =?us-ascii?Q?eI2C51CfIIkTb8nR+KIjUzTcq7Ghue6msXpkMDDh1sVWSeKW7vSE53hFsFO0?=
 =?us-ascii?Q?1v2gcMWrY0nA5j/Ye9ZRajgwrvpe/PcfLgAxXuxqIJqnBUAPK1f+5Ir2eHUf?=
 =?us-ascii?Q?HJDxitnfVxOf2Gw37sxdpXv9x4PiYTNk+OqNE0BWXLWG+M5Qqg1OkuA8BZHk?=
 =?us-ascii?Q?3bEzVY43WZhJnh12hDOxXaLmFnU5IGOKNS+CFD1ZCdtqWEe/zDxXCABAKh2a?=
 =?us-ascii?Q?KKj0u55QPQojh8+RIFBxTUqIsywp+RenF+6VIuj0hbYL9Odkzc482BrThAbO?=
 =?us-ascii?Q?WUrh1FknkafgHOTDRSzNcasxqe5VccoG0cyUeVLD9Dj28Pm1gBqTLpmT3YfO?=
 =?us-ascii?Q?y6VAwmUiQBq3naDKk2VSaGB9+wXi6caEx+Kei5MZnIc9Uh/gbullNTk7WY0I?=
 =?us-ascii?Q?5psdyCageKLExby3KB9sfyxV7Fl55jYBPrnCv+/2mpMPn0IH9Z7nEL/LsV6Z?=
 =?us-ascii?Q?SeTtijQXon3rnxnb39/UpcwH/Y6/MJgI1qHjkSTi5Wl+a5OMtvFx0Xbt5lWd?=
 =?us-ascii?Q?NX+8unekRtUPvc+gwMAmD22e2qLtb0QdLU8H8VOVuBimDhYHJWnl4qm8FlIm?=
 =?us-ascii?Q?TqNBtDm4rFB3wHLoL9161izWqgeLquSLCqS3TLzFdDMq6oMdK0NhxjWxTxGf?=
 =?us-ascii?Q?J4WGImx/j6n+HD9IP3Picf3L64rDAUAD5PbsoPCkwliK1Q7RvNIVrbQKmsCz?=
 =?us-ascii?Q?rEgjdjeyiiVkWdg3MVbeAYFBWXTd/D3klJVX+oyZIVwcSG1TdkRjMyaHCm/c?=
 =?us-ascii?Q?b8FM/5BFo2FJ08Y6qB2QBoYJcNH2h4E7T75VLDOPnfFH6Dk4jqO8ZorB0UEi?=
 =?us-ascii?Q?ha77sx6eTA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bea0a0-0760-49e1-21e5-08de869a0d62
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 16:02:14.0723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v+q1MI3yZTqTESfsB0Ps8c8XwvDTJ1QrO6hjRwe6skbb7iMoro3dBq5JKU8rfbdlqKaYXO2csLcF9ukB9rL1xTZKPbaULHCAyFWkRJVvgtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16913
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30026-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.955];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 0D1592DD0A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 20 March 2026 08:49
> Subject: Re: [PATCH v5 07/15] irqchip/renesas-rzg2l: Replace rzg2l_irqc_i=
rq_{enable,disable} with
> TINT-specific handlers
>=20
> On Wed, Mar 11 2026 at 19:24, Biju wrote:
> >  static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
> > {
> > +	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);
> >  	unsigned int hw_irq =3D irqd_to_hwirq(d);
> > +	u32 offset =3D hw_irq - IRQC_TINT_START;
> > +	u32 tssr_offset =3D TSSR_OFFSET(offset);
> > +	u8 tssr_index =3D TSSR_INDEX(offset);
>=20
> u32, u8? What's the point of those data types. We use uNN usually to expl=
icitely denote that this is
> hardware related. All three variables are just for calculation and can si=
mply use unsigned int, no?

Ok. will use unsigned int.
>=20
> > +	u32 reg;
>=20
> This one makes sense.
>=20
>=20
> > +	raw_spin_lock(&priv->lock);
>=20
> This one can simply use
>=20
>      guard(raw_spinlock)(&priv->lock);

OK, will use guard() in next version.

Cheers,
Biju

