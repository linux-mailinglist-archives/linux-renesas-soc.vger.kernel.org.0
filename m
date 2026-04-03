Return-Path: <linux-renesas-soc+bounces-30884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKlTCuom0Gko4AYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:45:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A093983D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 120A7306D8B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 20:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921403DCD9D;
	Fri,  3 Apr 2026 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YnXVb1+3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC653DC4AF;
	Fri,  3 Apr 2026 20:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775248876; cv=fail; b=IKpQsiM01S5KFI7jsAie1zsN+t7HtrPn4dN1Pb3mjClJqerA49t2fZdsgfMnQw0VoBOO324+qncRahh3eSQahtUJVhPGIsO27lkoqkHP7XREj1djE96YcKRIgpEVPS9TUiaeARcKesObYIEkQKu2ivphJG9Qg+wRSeNW2O+Cm+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775248876; c=relaxed/simple;
	bh=e14G2BlZ2z4PwTys2dMVVDG56WxNwSq8cfZTiZuLS2U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pz/1/dMbmf3KoITOM93dk/K81DKdL54TL9wKXwJ+eulUVMADEkvAdNVTGXe5+/UY1oQb8fVBfzuxaDmZmN4tgtLZnrnOu68VL4QjRvxbqjF2TV5Wm+N/Hbmx9eVH5SXYLRk0/1NbQmdieb/MTSmKsUiaGLZ9/qfRLDMl6kvtgTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YnXVb1+3; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxT/pErLc8JqDty6G0lFHsfwoTe8dvsQBbyoOFxPULE3WZKdMuBFL3aZ4oMuHHnOd1pwimw0dTpwfsiCmNPvrVH0zDXGl5LdRWYlfhUKPber7uP0As2VkuK6trG/hOuzyl0/mGoi53RsDaVSFMYNlvDIsLrcI7t7TaCuxHfxQbXOJx5IMoLPASH4BbhdubEHsgG6wo6TBFrOocIm8hIJCiuYFmGjmDzjCC7RyYxx6DYlnxvVBzTe+P8qEPvZu0S94gWCqHItOkWhq0yIcYvF6HXawcLbCoq+CiygIAqlnwBWkFx/zb7cvC4PbYoZYMulEasP8lksTmkbgGhpWgAMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e14G2BlZ2z4PwTys2dMVVDG56WxNwSq8cfZTiZuLS2U=;
 b=MGdcxFiKQnW1rcfXOPX0qNDStgKp5B+sevWpgI/08kRwcV5VLCZLZR+hA2zYs48OqAfHhA5U5PkZHVDB88+E5Y5PYPbVGFx1nqRLQhy0NNpi2UREZa3Bf6L8tTwGQH5ERwmvyhVQ66P5YDYXbAt48zhOKjt/1g6Gzb2AKEPpTJt7sMJm5sqwtnEoqmnkW2doe2GEU0gLV+QMh2pDVIv0bcH1oj2SyJ0BMIGROQikRcZeudcNBjG6fr1amtkG0bRaxotcfO5b05bXeGTuZfzYqKnBuZpAN4lefc5UyzizOx0RCDFtR3npzfCHe0MSxF6qvdDQBj0nWgvUvvBFKsAAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e14G2BlZ2z4PwTys2dMVVDG56WxNwSq8cfZTiZuLS2U=;
 b=YnXVb1+3YYqTnbQLbRtJQ8OL88tn+2t6QvoOb+TQI/2/2BYy4hCKnVj7Lv0FHEs9fMIxzFUtPaC+AKK4Hd/WXDVlFN3dh7tof6Y/s6zFMxrXD28V0haotc68dNdjJHO5MKPxEaOoTNN69odL+nwwuqsRBOaIHztN9hr+kVDtxYE=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB12354.jpnprd01.prod.outlook.com (2603:1096:405:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 20:41:12 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 20:41:12 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 13/14] ASoC: rsnd: Export rsnd_ssiu_mod_get() for PM
 support
Thread-Topic: [PATCh v3 13/14] ASoC: rsnd: Export rsnd_ssiu_mod_get() for PM
 support
Thread-Index: AQHcwr1y+Pml6QhYKk+m888QRJmR9rXMlaYAgAE5HJA=
Date: Fri, 3 Apr 2026 20:41:12 +0000
Message-ID:
 <TY6PR01MB17377355DE9EE021DB644953BFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-14-john.madieu.xa@bp.renesas.com>
 <87cy0gg5wl.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cy0gg5wl.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYYPR01MB12354:EE_
x-ms-office365-filtering-correlation-id: 44a52525-f15b-4bfd-86cf-08de91c157e3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 mrlQhIzXxlgQRqghVNG+kr93W3wprcGNSGTmaFsbHBL8xmCcLqS3LsYAw8EDEyHQ237SUg+wlLl2QKs1cvaksEhpuG3qi7szj2S6RIe0ttnE3gQ1hA0TEhJVkif0wjDPws24XDI5uEylPPS3mVIkpfOV0etRApE3R2mB+LmDJxJhks+sXxIlrS36GhLSitWaFkvnwdskMgdmBLMuuvhIrZK8W5M6jYb/j20WgtvHEyrZ8R/UmsFdKJy8LWlSYuS+INWY0j9DGPyyE+7ME+FhptVPc5szzUl93628AEfkydsIRbaZ28GbB5i4EaWg+i2PzI740wshBMt882mK7sR72AkB4hz/Il7l4sTjQhDAncVRpyQZvVGdkxZx3ZA8PlVp9fLYHeaYILK1iSPfb1u3NNjm4mcsDAg1i0e0hmtdiGJtldSvYsF/lk1Q6XWU9zGak66uBm7gyP2tlOMdQnfbRwrCr2rAae0VFeLBYD4YrNNP6o8UV8tt631iAXeX45Ppomy2Ho5aJ6z9wYKAqL+yVuS7LZk4Mzvt77fvyDa1NySE4DlHY2uCZBNtRv4BBYqDy8TWN9ZSaI8K93iWWI2LRYNXVl+pDj/xtkHtI/iz+Z0sNrYGGnWcbWhUdUy/LN1t3rSteTjMPCCM5EfC6gsp0McmkNLWXHvPxAn3N6rLd/kNJfLlYKVHLYooZ+QExWII8MspqBtdH9dZe6BvxFPqvn+tmREadJVkgRioIwJZuQnWOyXSKA40+aFfo/XKc62qe6DvqkBNLMkZR0MIH0pAow==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OOXEfXJUt34rTuni2NMVci8uMOruqug2QAzeaoa7ofB6gWjgUdgeImzIw5uU?=
 =?us-ascii?Q?t658u1LM4+/d4EY2Dg8P2z6p+RfTiKc1mk+qJ+zJGzKg/vphDwYSi/Pp5oJI?=
 =?us-ascii?Q?NOChNFLZGKDCcac90xSg52WNFknvkYguLfWHOWU3a/E8RvqWKKeSdtaKxarL?=
 =?us-ascii?Q?kwBmVfK/AWPxBkNIamXD0MW04P75XvN7BreyV+QpkrMnUVn60frTvMz6PcAr?=
 =?us-ascii?Q?Q8dRaILHkd0s76qKDlew+HNADv4YEwiTNUDZZmxqfyptixM24JL9LdbwGzA1?=
 =?us-ascii?Q?duj8fpFVFK+ufcjjrme+jOklirbRGZBLLj9SkukZrylSyIGs7Ih4M3jFYsnq?=
 =?us-ascii?Q?dFAGe8XBiTSlhgQQ/wclCFZsOUzyam7j1Jn39PWGtR4T7meS7tcE83Yvcq4Z?=
 =?us-ascii?Q?szpL/jrrgOGvUGef4jnKIEqpJq+H50UWr1RvBIeDNeR132EyhzhIZCQhKGHY?=
 =?us-ascii?Q?c5Jcg184PFT9jWy/P1ZecXpAZxhll8OootbEE58IRTwRwHaRMe3Xxuiy1rhv?=
 =?us-ascii?Q?+9LTwfKNOCE5MP+Mi6IQ/V09+iQAVcv7R3IlwK5AgtfosXt1JeDQuGJ3lrNM?=
 =?us-ascii?Q?MONVEIyo6Qk2+SUg7p90mo+L714VINyc9ubft21fjliaVxqsR+MIZ3wX+Mwk?=
 =?us-ascii?Q?3pFKH61i5SGM8MxbNSi7tn+IGDn9zcKMww6X9u+MQSab6CLKhPaiq5DNpq2v?=
 =?us-ascii?Q?bXlEC8Z2yGh/JWTgu7lzlk+PABB2hX9pUU3ZBPDAx/8GW1IEcpqQc0sivyUt?=
 =?us-ascii?Q?zv0zPNglFJdSNR1jXU4fFBPBcQZUprc0D+rqt86S4nEv8oc9oPNDRUbZ/uek?=
 =?us-ascii?Q?ZcjVnL3ObIjvuZ6LE8cgZutg78tD+M3PVbjPUCgi1Y3l/WYUmpam9j4GLgDu?=
 =?us-ascii?Q?fHATjH4UkQpuyV30yqEoU6KF5Xh0iTtc2EFf5vL44YpoKA0P8gWTQ0tccCz/?=
 =?us-ascii?Q?RF8AFw//2U4FDOcwa7X6cgnlm/L8xAIApj63sVWfUf8N2Fmf7W4pTIPbHCjL?=
 =?us-ascii?Q?CD1ETKzBbSCdCLThfJBWQofzn8ivVWLJzE5t/P2Atgmw45x7mHh7trSewU89?=
 =?us-ascii?Q?QasZbMsW+ZCg3cwrKEi7FGzqkkNz493z1JBHhvRBbNYz2FTV6myvZ+OcyOYu?=
 =?us-ascii?Q?6J0D7lKftFy+ATzeyBUYO0ZenwVWdjJ0pvKVFgFDDEyFLyl262rZRsHyKlpH?=
 =?us-ascii?Q?nT3EIZ8lya4yPp4d1czt7ejQxPf1iqkkChpbYwKdxz1XckQj8D9zL0CS2213?=
 =?us-ascii?Q?KBphGgj/0ryimyIFpdVphxL4fr1T4rhsYtf39NBJVk1XnKYp0rxvHgySnkD8?=
 =?us-ascii?Q?0/xAl1+AW/H2vR9gSyed18j9ObjA+YLdg6v9j/qrE0GJfiGwYU0SJXZmLR0d?=
 =?us-ascii?Q?NbhkRQzjL51qKfnEp6XtCB0Rk+ZHwAagJq/WCRjZf+Pz+Gkm+OxARzfXSwB9?=
 =?us-ascii?Q?piyp6tBjxxOOCjNCVuRcX2f/OomZ9JBtDAPC/kSYN55UcMVlgFtlezk5MC4m?=
 =?us-ascii?Q?ejZHKn1TRzTIYRv2QA6ruzRaNliRJHNADSAMmoBQ+A3mZhEeTO8Ib/wFu6G+?=
 =?us-ascii?Q?Er58M+vqjSanPHenBhoB4IdORdrzLmiOUiZgnXmuCDKJjMFZcvV2uzCtL5FG?=
 =?us-ascii?Q?v8Uyqg7cstxavPF2dEFug9iVyIwVUVqXt3qAiCdgdxEIulJHfy+qSNBSHgAA?=
 =?us-ascii?Q?J10w3mwgiGCBrJGfXUB77kcznJtcP8rM60kQMlMhp+T1XYa48oWrU3MjQm3S?=
 =?us-ascii?Q?S787mAwCzon0s2YKUkmm38uuiSAs5so=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a52525-f15b-4bfd-86cf-08de91c157e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 20:41:12.2110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TlzbnHBcnF53q62yTQIXFQoLr6iXJWPpKuxpiJoFzYoPhuDNEXBPziAfUnKLBE7I6rYLv870uVDnOXNdtkR2L2xkayxNu0Jh8hfwH22zVSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12354
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30884-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 91A093983D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuninori,

Thanks for your review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Friday, April 3, 2026 4:00 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Cc: Mark Brown <broonie@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>;
> Geert Uytterhoeven <geert+renesas@glider.be>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Jaroslav Kysela <perex@perex.cz>; Takashi Iwai
> <tiwai@suse.com>; magnus.damm <magnus.damm@gmail.com>; Philipp Zabel
> <p.zabel@pengutronix.de>; Claudiu.Beznea <claudiu.beznea@tuxon.dev>; Biju
> Das <biju.das.jz@bp.renesas.com>; john.madieu@gmail.com; linux-
> sound@vger.kernel.org; linux-renesas-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCh v3 13/14] ASoC: rsnd: Export rsnd_ssiu_mod_get() for
> PM support
>=20
>=20
> Hi John
>=20
> > Remove the static qualifier from rsnd_ssiu_mod_get() and export it via
> > rsnd.h.
> >
> > This is preparation for system suspend/resume support, where the PM
> > callbacks need to access SSIU modules to manage their clock and reset
> > state.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
>=20
> Is rsnd_ssiu_mod_get() really used ?
> I can't find it on [14/14]

You're right. I'll simply drop this patch.

Regards,
John.

>=20
> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

