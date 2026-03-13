Return-Path: <linux-renesas-soc+bounces-29379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJcoEktHtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:20:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D5628801C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 530D53015EFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80653CAE69;
	Fri, 13 Mar 2026 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sc6G0P8l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF3D386424;
	Fri, 13 Mar 2026 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422209; cv=fail; b=WAwsr78sN8UDz3mo3gNT08TBa2qSCJTv31LY55sCl0CrZ6oMQ9kwhN9soFCE5mDhDQ8UeXFndmhwXAsmD6CSa+KFjtaopqs579oclDydRmzl0E/msL11li1W4O78YWFsa9VY4CNoB1oTGiyvXrZulAhsjEy3WyWfkzoypo60gN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422209; c=relaxed/simple;
	bh=csoV1vjG/C/B13PsxNDOcxxXufvtLUdSWdvBFuJN4Vk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I6cZb2V0Sm9p5qP4YUG5XbpWju0PeGdqD6MN62Hl2J5rsfc+3/0BOAqVYdoUiWCsIHhJnf4GF0TERQde6PxgmnMHD7rcj8xEMin9VOsVGrsHah8UxKmgSVqJdmvrv0kkbWHZIEASamREw88WVKWOvq85CdN4zBU2I3LHoNwKLhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sc6G0P8l; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyoG6SZu4fSFd87eeM/oFKWnr94b6jOh846TIvkNCfdcHTn+qnLGmZZYo4aM+fTCAZSCMm4/XqAg/GGfgYOpT30XwLiljHyu/ilPZchaYI0TuSpA/Z4Ar31hYRU0wL+xn0MWgxIe6WwwCEscLa6ck3NSFePFUG0jaVRVwDFOtCszLR4MisjDnjmA1uVFLqauiHiGDEDjFKfwF/829NHMGFCczYvt6Bh8I2I9JFztZZgFyWA2vLZImaL0iHGDxGLXmWkMGkX4dZLwX4VR9QZ+xOMRRHY6ysrVN0vgWPQ8U7cd1jozrfkrr1E2lSsTqmZyEgYn5EflDnuqAVmBkXAXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeFMjrmeD5sD85jfV+AAm0iFGryK5wwW5I1q1pAoG4A=;
 b=CeCC3XUcol9falUnpDOLHoMfEHk34JmVI3cADhMDa83cUcNBHUNzD/qbeIACjVJnHuYHguPRiOBLtS91JAY88RQJmO99XD7wSySW7TMzwJPy+BJMmPUyXJJe3VWdurB507vuW/4q+jrn7HNUwPk/cjS4meK7EzKoL3z11QPuJ+WeYPJ9a0D5PXS7NwGEqw1GM7GcJe1iwEw9WIH6f3AzhHwqyXw0XnTl/yqSVr1gAN0vtxd3RnJU6wipxtay/nMMlE08xp+jYWJWtsW/N1FQMiyncV+xgWc+GvxEQr3Wfv6cxuJ0WuAu5BZmjaGRofgv6jNaF3BmJKIJNObWff3RCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeFMjrmeD5sD85jfV+AAm0iFGryK5wwW5I1q1pAoG4A=;
 b=sc6G0P8lZXaY2Ce5+vvF/6/06oDdgOo3lStyVcXd+AMempL9ienytGv5cqY1ggKnAEdZX+TSBzmweYiIaW07qWbRzMLazPw/vxJrQ+dRDQKNw9BN+7NCn1DxoVANcBLZ1sPo/OHAE+m86zX2JLv+8MfTUC5nRIaexZHKNja/yvs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY1PR01MB10754.jpnprd01.prod.outlook.com (2603:1096:400:31c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 17:16:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9700.017; Fri, 13 Mar 2026
 17:16:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, magnus.damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus
 txdv-skew-psec property
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus
 txdv-skew-psec property
Thread-Index: AQHcswgdmJumhvZ/r0uXEmF8FzKIfLWss9Bw
Date: Fri, 13 Mar 2026 17:16:37 +0000
Message-ID:
 <TY3PR01MB113465D11CF77CB9C4C871E058645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY1PR01MB10754:EE_
x-ms-office365-filtering-correlation-id: d298248d-cfcd-45db-c4f3-08de812448f7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 7VcTw9Vy7+KDNX8AAjkJnuQNEQwbd3DG9nsDW9UBN1n8xtbQ/9LCK4lN/w3/JYeIU6ZCeyjQgBzeGF3qHVkkzp3GFN/hewZaJ/5/sN0kuL3wwmpbMDYjexVjqt2YlXeEOQyFYG0EXiHBlr6P3Hl/CYxJYEXUKH6+9IrSWNdF7I1LNTkGD0Jl9rH7L8OpSnRE7W7f/eidoIDcWPUUkHpGRMQBqb9aWNvhRIijc0qAD7WXCmS0S+6Mf1z+KdLinUhtzFET7k3ZevQ6LZdw7AVA2UvbW6l2LQYjel6NH8p5DZ+TKGuza5nj0ZuilWX/ZyyiD5YnCqvcmfSIBTy0lBMCb6ouNvlbUqtYWQlMZX9lGCcs0nzhi2eZmhtJ6UAdnJE4khSqCwgpjmFtmPZYGEJGpsHvHzQ/g0sYWnDHK1QwaW5Qf1RjKuS7VlWLqD91taOr2NXeWgCXj9MIG7fZ/zSmRMVTqGRbNJniJPCAglaqqGnAXCjGII1gHraKUJCLJezh0t8VnWGBNd5QHlHBWV37LyvIWEUQhYg1JDB4o2NYFSWG9Y2mgwODhe5GjHr2jLQ9K/fmb4twASQDfa3K5z995tS5Lvo2uahjS+nLHSE/ioZvEoAoB6X2oKIeQvbUr8MNE2i6KEDZv0J0JF/PkYFZSNFNdYjQHF3ZlMaPX+61aTOLqX76m/hYw/kfpu8aO7j2hPL8HKrusig9Vzl85qtaXtPkDRyxMwLaY9tXe9eG7Z2hzKZoNY/lIaJkEe0YfqJsojNZaLXk9ikQupaSBTqncFs21CY4ytRC1KVSN+jm+Ns=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ov1sb8Fu0zfpVoelNtrbnilc9uL9Z515to4a5EXTIcFJC38bPpbklE6cxaNM?=
 =?us-ascii?Q?MiftwZWxn6WLb+QH9cBsNPUOfjVAMZKX9LX8L+oNMu3QjALRjZljxBAxDsbE?=
 =?us-ascii?Q?eoOVb4/EwIb8iDJjWjFqMglsOdIz+wSVJcIVl8woUoDyZjNCkbdjZzpufTUr?=
 =?us-ascii?Q?2IjXxCo0GOqT+802MopVF5GwsZdKzvVP3QCGdLJkC2IVnORLH7UE2sUSkPrR?=
 =?us-ascii?Q?cbjscWaWunbfnxbEHfzAtu7TkkdGTZK/cWxE6eraIKZSEoqUUIHESRXn34aA?=
 =?us-ascii?Q?QCzG8i6u20mixTci90Brk7iw37EpEWWLH7av5AF/O3EzKhJb8dSQSdMlEMy1?=
 =?us-ascii?Q?sJ1/IeziqNZOOzVY7krRisrq8iTd2TNOiUZKsU7iB/wwSxzVlwmC6oPDaS+0?=
 =?us-ascii?Q?4auxsRUyQ0erhBFaHV0HP44EoYGl77b3H4ahl+gusLNwDP+yXTJyuXvj7hpM?=
 =?us-ascii?Q?ALOYBmo25l/Bk0Rl1OmZIZqYjEnZA1TQbLLZ81eSl0Ng6FfnCOGe7+32Orms?=
 =?us-ascii?Q?ch1pFuJYnWsKH5bDMSvw4yVTIiwxVbnkzqN8eKv3R0hrf4SR620cmN0kijm+?=
 =?us-ascii?Q?Ly+oonOwXCH9hJbpg6R7iN9DhL+1fsatOphHP6C8fHiDUtc/E3XVMsz2yBEV?=
 =?us-ascii?Q?LI7t+EFMc7qfkXNDLh+rI20ScnkrZwk9SENIeFwyMIwKH0sw10DSlDn0TtyK?=
 =?us-ascii?Q?dR38H+TyyJ8t4qQJrxLnddx13k9uM43VjkOB/SU2Uqaj7M8ZglX3wGaO8UOr?=
 =?us-ascii?Q?bnDrZBDBu4qaxsYmIqkS70jrib5k5o+KZXsnLdLXOPI+EwBc1iNgSUiNveHM?=
 =?us-ascii?Q?7DLG8pzoubNhh0UbsK2q8fRM4Nx+QTZ93f7dwGjNLuG2YEINhQCO6K3Fe+r+?=
 =?us-ascii?Q?mtfYL3AeAjk5w+Hw/eMCXUqhI8AypDDHmDQr9VMGu0KjQPp8u4imnoVlPgER?=
 =?us-ascii?Q?WxpIBXPj2TB4I0DMrID8Azkg3iHol+1Dp4w4cHn6maxkvKkvsERbSHN7x7KY?=
 =?us-ascii?Q?JskATZi22IDO11GBnIA+lIkvb3s+I6sr7LOfZkGQZyTZuTSG4wuxokAyc3S6?=
 =?us-ascii?Q?HSIoFj3X2NVKiahUKuuQAsPPQC8bKdYbS0Z0wIS60EToiTbfsUkMiCJs8+cb?=
 =?us-ascii?Q?IgVv5MSdF9tsgi8+O5FDMvLpQuyKVW5gl5bM8iPQCjzt8Z+tfXLT6uzAM4wD?=
 =?us-ascii?Q?K5nOrEOkfMktKmFym1W5i04Bv5o/LYogqgicbhBQKBnySzNnrtlHYbYoyyad?=
 =?us-ascii?Q?wBFLWewaD7WM9PJV2Ot2/QhlJqEIE8DPB/5chr5Ua8rOLOdsaqNpN5RjKMVs?=
 =?us-ascii?Q?5SQiAWe/DCHrZBhJM1tg1dOrqEQ8cyxxkYItryeTj4a8gdJd5sRTFHasgMke?=
 =?us-ascii?Q?5U8h7wLcYhXJi0sZplJkgzr9dnVZpG5KDxIhRKITutarghKzsqoiI9ml/3qH?=
 =?us-ascii?Q?dtiS4WnaFgPgpRT0COemErUlFAx4uVatXYKtvBIp7+WIqzSbKIZ9VGLrL+kg?=
 =?us-ascii?Q?cm8NfyoHNpRQORX2674jeDrbyStFkE8tLXkg+6sENIUHwHdRlZMg8Ue/9nhP?=
 =?us-ascii?Q?wxunmhkYr1kUmE5esW5ksk0dPsUl4isjgMy0+Jwk36QvZzSxFHVzzuxBW9oH?=
 =?us-ascii?Q?464lXdwtrr+5U0qS+6gvl1QENGfR2Cs9WvMPy+adFdNsoTCYubnd2KkQQDbu?=
 =?us-ascii?Q?fiu44h3z9w/N5ih3kSP+fNP+5yDO2GLHVUAP0hyGb4CENlwYjavPeL+Zx7V2?=
 =?us-ascii?Q?6yyB/knE0g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d298248d-cfcd-45db-c4f3-08de812448f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 17:16:37.5973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0bto6OMz57olln16snh1UQKzpGF/oerqYb5yu6mn2aVsyGhA2+01Uf63ppZMQ2n0k+hduNpVXspF8lp4yantGA49i8Cjwgw2VLc0lqQfOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10754
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29379-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49D5628801C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

Thanks for the patch.

> -----Original Message-----
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Sent: 13 March 2026 16:39
> Subject: [PATCH 4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew=
-psec property
>=20
> The KSZ9131 schema does not document "txdv-skew-psec" property, neither d=
oes the kernel driver support
> this property. It does however document and support "txen-skew-psec" prop=
erty. Fix what is likely a
> copy-paste error from the matching "rxdv-skew-psec" property, use "txen-s=
kew-psec"
> property instead of "txdv-skew-psec" property.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 4 ++--
> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++--
>  arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi       | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> index dd5e4b13f0f86..00e5455ea5abf 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> @@ -265,7 +265,7 @@ phy0: ethernet-phy@0 {
>  		rxc-skew-psec =3D <0>;
>  		txc-skew-psec =3D <0>;
>  		rxdv-skew-psec =3D <0>;
> -		txdv-skew-psec =3D <0>;
> +		txen-skew-psec =3D <0>;
>  		rxd0-skew-psec =3D <0>;
>  		rxd1-skew-psec =3D <0>;
>  		rxd2-skew-psec =3D <0>;
> @@ -284,7 +284,7 @@ phy1: ethernet-phy@1 {
>  		rxc-skew-psec =3D <0>;
>  		txc-skew-psec =3D <0>;
>  		rxdv-skew-psec =3D <0>;
> -		txdv-skew-psec =3D <0>;
> +		txen-skew-psec =3D <0>;
>  		rxd0-skew-psec =3D <0>;
>  		rxd1-skew-psec =3D <0>;
>  		rxd2-skew-psec =3D <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 8ae7b6e3d712e..4643c61cf06a7 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -286,7 +286,7 @@ phy0: ethernet-phy@0 {
>  		rxc-skew-psec =3D <0>;
>  		txc-skew-psec =3D <0>;
>  		rxdv-skew-psec =3D <0>;
> -		txdv-skew-psec =3D <0>;
> +		txen-skew-psec =3D <0>;
>  		rxd0-skew-psec =3D <0>;
>  		rxd1-skew-psec =3D <0>;
>  		rxd2-skew-psec =3D <0>;
> @@ -305,7 +305,7 @@ phy1: ethernet-phy@1 {
>  		rxc-skew-psec =3D <0>;
>  		txc-skew-psec =3D <0>;
>  		rxdv-skew-psec =3D <0>;
> -		txdv-skew-psec =3D <0>;
> +		txen-skew-psec =3D <0>;
>  		rxd0-skew-psec =3D <0>;
>  		rxd1-skew-psec =3D <0>;
>  		rxd2-skew-psec =3D <0>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3e-
> smarc-som.dtsi
> index cb5066443722c..880bd3fc9da18 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -142,7 +142,7 @@ phy0: ethernet-phy@7 {
>  		rxc-skew-psec =3D <1400>;
>  		txc-skew-psec =3D <1400>;
>  		rxdv-skew-psec =3D <0>;
> -		txdv-skew-psec =3D <0>;
> +		txen-skew-psec =3D <0>;
>  		rxd0-skew-psec =3D <0>;
>  		rxd1-skew-psec =3D <0>;
>  		rxd2-skew-psec =3D <0>;
> @@ -162,7 +162,7 @@ phy1: ethernet-phy@7 {
>  		rxc-skew-psec =3D <1400>;
>  		txc-skew-psec =3D <1400>;
>  		rxdv-skew-psec =3D <0>;
> -		txdv-skew-psec =3D <0>;
> +		txen-skew-psec =3D <0>;
>  		rxd0-skew-psec =3D <0>;
>  		rxd1-skew-psec =3D <0>;
>  		rxd2-skew-psec =3D <0>;
> --
> 2.51.0


