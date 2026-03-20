Return-Path: <linux-renesas-soc+bounces-30027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOqRBvVvvWmt9wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:04:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537F2DD085
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6A5E3006F2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 16:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DCF3CE4B6;
	Fri, 20 Mar 2026 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sSYb7N4F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22633AC0E5;
	Fri, 20 Mar 2026 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022595; cv=fail; b=VjJcR9RgStoYow1jkNYLAq4QaWDYBO2HYFNAkaHE+OujkEPUbrsncXft5ytg7jAZH5+WsFDPNu6SjXq0dF0on2mRzUMOGFv4RDBoGTLbf/HHgSPN3MCPO/D9nChF0yYanEKm5FkK9nHZ0ctcApABM4Z8Nj8gTBpuioSYCWmoO84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022595; c=relaxed/simple;
	bh=7HU5PCwsC7Bxh8uGKiZoOOzfJ5oaa31L+byo9GmgDB4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AVSi0XcEe9FwYETcgtXiVf7BCPz+yRiD4CbPi3a0Wv1tjuHN70OHewAV5NZfVvyFRV5V395XoPxfx4KASEp1u+kXo3DExUr112qy2RqYufTSYwum2JxprV3IFc9sWcrgOunds8jSoz+hxYGzTSZBdTtkazrYiTmZCNS2X4zPVjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sSYb7N4F; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOWRksj2j3miX0lQV6yjZUPfNey9Xwzl9Jpq5xFgoyXuxNSIYriOS5jg9z259tTAIIXrGJPIUuMZ9gJu7N0v3mD4nDNg41IYV40Yeo5MsLRXDqp7BcXTXTZJ5foa85yAL3OU70qedAEydZl/7bHEElCBRcBkhNRtUBGmZ1I1a2yIz/l9iV7xiWSyOuMQGtDjjHNC4rQ31wFqQ/fJN4nWmJC6JXmNHxFz1Dea8cFnCeeWeISTnZjGXvsuJF8dG8lonWErGBIootje/vWunUiLfeHLd3M4ptnyqTEghwzpoSBwhSl+gSRke0qp0aFvbiF7pQrMjxNgDr31zCqoqEIUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ut+HrwA0cPz5I5HvZ7az/4OBAfCIGxtT2wLOlvpk3A=;
 b=AOqDbmc6KKRdvk+wl+9v0QN6UtvBQfwqJKSCVbAcHEeRZV2ax5W9zB7HZXB3egMh+i/VyQ4JZdVqbUYw+QVE1+TlVQmNl4eiR/ee8fkV0ESONqvzZc8/xw71Ad4ssSRauVq9nQ3m3KefLA4rrDcDLhcE/Tk8/b7Db0Cvqifs8xN0u4P0jSqHxp4Nlm1WA8v3jNg7Jk6FwQEPu+XchlEs6Aw98CCQe0hieExT9SsjEtUqf+tZfmcUqc2Br0eTtHfoBPmIh8UXJJu/JVGW/kUfsKgQiBpTyRhI6MaJOlcYkWP/dIyvQ9okyCtZP6/PdtZqcCsXId/JLe2Yo7tjW31dBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ut+HrwA0cPz5I5HvZ7az/4OBAfCIGxtT2wLOlvpk3A=;
 b=sSYb7N4FB7blkwznLObin5pxxeHNrlIY/UhMXiTZXgTRqW2mixAgLVjo3waELPPYPvAlTNS3OvM0ILGiMd3TSAKFehja2MEl+4tccInHH0UOXmy8vaPpcqvE1nW8SknXmAO1v3EwQEPQ2O0Q5K0toVwcoGkOJJroz8wZGU204qc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16913.jpnprd01.prod.outlook.com (2603:1096:604:408::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 16:03:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 16:03:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 08/15] irqchip/renesas-rzg2l: Split
 rzfive_tint_irq_endisable() into separate IRQ and TINT helpers
Thread-Topic: [PATCH v5 08/15] irqchip/renesas-rzg2l: Split
 rzfive_tint_irq_endisable() into separate IRQ and TINT helpers
Thread-Index: AQHcsYzJbz55fmKogk+8POhP93M2fLW3Kh+AgAB4rIA=
Date: Fri, 20 Mar 2026 16:03:06 +0000
Message-ID:
 <TY3PR01MB113466FEF343E2A6FA97C2709864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-9-biju.das.jz@bp.renesas.com> <87ldfmlw9y.ffs@tglx>
In-Reply-To: <87ldfmlw9y.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16913:EE_
x-ms-office365-filtering-correlation-id: d0a22a65-7225-49df-dc42-08de869a2c90
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 up9AvuP0MFqwvczL3if9JyPUfJrird4FqXvj5+QKvVKpOh1x7lNfFpJhaDciLtDcukTpPiwf3xuwOfWbitxC8e7Li3/4PD/2Ja6s5RRdoHdFobQ6Cfns0Tafc1qWTuveaHXLygv6bVRZLYHb1SYEPA+x13SY8qRy538pqmE5noz0dUgcDUYB1lki0B+smagLTSXReYalIaCKJIKOwWPsRe6IcYDlAHCj3d/SwyllIjdIVqByxGFBhJGmQvJFh5JwKOfh7ZhFEp3DUsEz+rL/YC1OhPROhbHoVVHNvboU68Iv37pUZ6ArrCVAPPH6Tj2+UmprRszo6fXwJgKvT4Q7bxRG5WUUixYxeSQhWNNWNLnvybtzqWamzuXMnZJJgFE4w4a9zLM6DYlqbIa3l2ooeGTOHejNbTkcCFA+UEs+p0pTkwEaur4pMlKzTHUeSzKQggggzOYep+SlNf/4nL3QM9FppUqgW9xsgs2LD74Ez886P99ePlbT4ou1yibclzZEKiVcq0j7gCqMgS7RoCTbvN902JaEsb8YmUIgR+iV1DGjcOorPTfaeU266f1fkpCcj/M9toRElS2DlfgDZjZAVWgyKJrHrEnjulF3zYkxNhs8S0lN3FuOBc/Wocu6h/CXHVnfzRqC/tQrfVc69x6+fBC1KGCzSF/i5vnwE002q7BVFecSgz6IEs3je4ObAgaz5Wdb3BJVnmcL/0fJNB8GGVy/qMpl2udQTcH5qAczzTlq8Sk87G5P3ZDW8KsG2uyJZlD7G96JALpy6riQ6N9ifaV0ZdmDWDkaigZLfKc3n9c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oaCTwxXEqjNb36TKM9OxMpt/ElhDSXZid7jrOAxs3hNuGwZmNYxYCIaf0fX+?=
 =?us-ascii?Q?04oLHNTmLMy6HUfveLub7Gscydu0yKXBPqMjweaRApym/bFcQmB2VNpMG1v1?=
 =?us-ascii?Q?+BVeKiewedxm0HBmYPn8K/KdI9fXxa9MQ9WRnohMb2DjJH6AdnzbGcM6g2y/?=
 =?us-ascii?Q?f03fpZMig/9VRAnWMYTSU3E+cDflS9NCQZdH3EvdZPmA39+KjAcgJZc3V9d4?=
 =?us-ascii?Q?Cjh+g1DlTVR1lxa7HPH80HqHyI7eVbGzss4h7+PpiSQnI+175Kx4w7WcCJqk?=
 =?us-ascii?Q?gg1PbSoLDmQijYbwHQ7dVq6DhZKB6hK/jaanqMdJ7sKniNA2rstklk8G2N2x?=
 =?us-ascii?Q?+5g+88M4TH0TipynbZOGqu+fKqKSmLm5pyAKow0jFqGYu1r6swae5Ehixm/1?=
 =?us-ascii?Q?h8m6EWDoWMorgcZF9LTwyGZ9hRrWx5jsbedR1AGFzOn+LcRCdN1XImwxoweP?=
 =?us-ascii?Q?qAuSB+Iy3687xemJJ4RVj2AyT47O3sBVf1+xCsRpi6RgsHnyCOLsOI/4GB88?=
 =?us-ascii?Q?Zd6afpoU/TZ26A718PF/XVH6YV8+zFljDL0HdEFb1W26zIMgQak+/qKciVGA?=
 =?us-ascii?Q?2XeskSkdsErCbHiBXRVXYutvD5oOrScj3zjL5lICA9DxJbG8W2wy2j558b94?=
 =?us-ascii?Q?VGWf6/OJeEabcCeSuraZ14SvpTuUM95uNNwTAa0vQ+yj/aU1ym1R1s/EC3Cc?=
 =?us-ascii?Q?7UV73CvbaU8YorYCaLR092zcyoDQkGhRMW+9OCBNBQfORboI5SiiisW0IaVF?=
 =?us-ascii?Q?B1cbwoS1V+HJxMOICCTI/T+0JEX9m32/64+DKy1a7iuZFTYo7EFr7Js0F+d8?=
 =?us-ascii?Q?qtK1Q8dRaBWMdBAhUBoWJcnu66HUYXBZ+qpGSAaE53gInCzqTStTPTwRjODW?=
 =?us-ascii?Q?Cya7HUeDLk6yF/LEJ8rzGslMNdhslLOOXLSQ+iIULZljHFcLC5BS7tUNfGNY?=
 =?us-ascii?Q?XYaFeL7EgfAObpTWYKZ8bbWdjK+9Vb398dhovvTL8DINwg/tBma1rM0t1/n+?=
 =?us-ascii?Q?+0vfWXBkprzBHvosQBsXJT3JP32XvUu+e63/vvVOwMH/nj3myzlbEtSMp6vz?=
 =?us-ascii?Q?4X/kJgM+Xyj7iigTmuVAECyyd0lYP0SfnEssYMkReQ8FvNw+Xu3ZG9C36jOG?=
 =?us-ascii?Q?PWq95f9BEgIhvj8pqU/pmJ3trzJJ7wTjQa3mPGMTwHlO6tnlA9Fx2heMBrfS?=
 =?us-ascii?Q?XRDiCOGqZSuHOlKS9oA//nvABF35vg4L+o5QFk+1ieWB0oElLsLU4s130DYs?=
 =?us-ascii?Q?FRempeeWaNbfw2ZypwBTasxZ4kzPOjXhQ/2c88V1/vQMvsy6ayuAxlhmf4qS?=
 =?us-ascii?Q?BgF5XSrce4rmDNVTmKwVZ/ZE1/iAhKYnNhHGNHbq1LZV8EqwRuBlPs7whuMd?=
 =?us-ascii?Q?oQSJALo0Mx9JHZlCyx790hiulI/BmPrgYR08vUNohN6f8n+oxGJaXT5VDDPh?=
 =?us-ascii?Q?3ar3IPoPrQs72IJGSHH78pnnouqnp0MFekaZ+C7zn27+JIah0kVNFSZcsrtn?=
 =?us-ascii?Q?oASMwpa8SlSe3qgQqzySIyD9fabKBfkAGKrqkMge9edThi6/v7dQnSvL4JuU?=
 =?us-ascii?Q?3mJ6SAPUsQSNu1qqA5iGwJ/3RyXJNXj4mKOt+v1OwdgwWUMaCGrhD21ZPkd+?=
 =?us-ascii?Q?6l7JLYMQBBwIr2Q1/HEIFFImyLgvL/apWWPNr9JJy/QlcPqGjvwmnmw6qhJ4?=
 =?us-ascii?Q?n3VOECuxZDTIxQuVbd9//9dqMk8fbsWkDKkVBdQfmxkEF7c5zOieZAYUorx/?=
 =?us-ascii?Q?VaJc8r7+4Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a22a65-7225-49df-dc42-08de869a2c90
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 16:03:06.3888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N0/oFV9WB84n45AzBAPTp1OOuy506Qc3sG5VyFkp/Gjf4R8XvOtWFzapI2Ih+0xA/xKxxlT3WrYJUbhuiV+J+WV5rlsojUhNwa0Xm1gShnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16913
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30027-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 8537F2DD085
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 20 March 2026 08:51
> Subject: Re: [PATCH v5 08/15] irqchip/renesas-rzg2l: Split rzfive_tint_ir=
q_endisable() into separate
> IRQ and TINT helpers
>=20
> On Wed, Mar 11 2026 at 19:24, Biju wrote:
> > +static void rzfive_tint_endisable(struct irq_data *d, bool enable) {
> > +	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);
> > +	unsigned int hwirq =3D irqd_to_hwirq(d);
> > +
>=20
> stray newline/ The previous comment about data types applies here too.

My bad.

>=20
> > +	u32 offset =3D hwirq - IRQC_TINT_START;
> > +	u32 tssr_offset =3D TSSR_OFFSET(offset);
> > +	u8 tssr_index =3D TSSR_INDEX(offset);
> > +	u32 reg;
> > +
> > +	raw_spin_lock(&priv->lock);
>=20
>   guard()

Agreed will use guard().

Cheers,
Biju

