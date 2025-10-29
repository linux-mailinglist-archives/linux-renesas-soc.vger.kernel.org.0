Return-Path: <linux-renesas-soc+bounces-23824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A74B7C17A39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 01:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83AB23BA775
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6602D5922;
	Wed, 29 Oct 2025 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kTXzeOQH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37642D593E;
	Wed, 29 Oct 2025 00:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761698968; cv=fail; b=oNUQ8zlgYh6MNDK0VcdHDuAmRnllW4jaZNy2Y1DQZScMUdQrJ2A4z3wLggLZCNCIno7MavHQHnukOdNWziCd/4BVgHNJ0RHeprb1EN2y6CExDgP9gLk+QAkWwVZu2Nud7GDVwcWLmP01dt/hwa43xpUazua6lIA3ec+oV11geuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761698968; c=relaxed/simple;
	bh=9Vq3o4JY5VxHWXCgpDUCqFErWVYmBNyxMBFQ1y40Acs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Cc2kLffXfUIzm53aVBYe379TutE0crOnz9fDlClkLJpyZYRg9I6g34F2e6e37buFvNxbeUvzyZDt4OUd/BlYn4VQ1/aD9Vd9AOUt22d9LBSmADHPRSJJ/bM2oDy2L0/NsvyB8SXYgOLqN6OuJ6Gmy5fTCPSZ6vCZbTdn2WfyapQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kTXzeOQH; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfwkhjyJXDt1Iu4WvpkJwnKOvKlnWhoTknMgY9w5jB07UdptREwgl4CMdWfn3TyQYvn/jWu1i/BusUip+URIBCC7EmcbZW6r83KIt+4noD8MJ3u5Mx9FMNyGzlxC2bltLAq5nG055f4ggiHBXkOB+OxtjmuhfUSjF5kl+Dg8Q9oT+w7OEAWX1Gdak1cIL6avVdaq8VjZk5zn5crPnxdnpSBIInQMuSTcvjJ4XwPs5T+HIcImcDzBjfUXLTi51lnXmaOxAnb3xXruN7+LvAysAPOmxT7cw5Y2i+YkNcE9qvXRNVbY6hvHki1HodGhzgiyPKLMcOCAMkUzrDpJ5RoiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVRxTIlCmfx5FkH8eufROpZBb5LV1t3uMwsDfqNjCck=;
 b=rGyH/ys0/OKTipY/At2dPY8YU5vWPh+BCXi+HVktdm5sb4Aqq8tqKY+DvbA29gZF6mYBlCWsudP+98AKma192NPtnnNkESzrDd5hV953zeJHC6DYe7UxOhu2H42cbeBGm3WorOdYcAVBHim/YyQ6tOyJaWKyLpptaBj6WDRgavshEwy5BwDpTm8FiAWHQe3mCLjPso5/9s9506wna05Qa41LCxirgQqlI+fOm/lCYp7R+hJFc+Wzu1i2i7+vNYIl1jEX32JLZ+3BxPnsxZaYmQs7Ayr82pqpcTnGmyIrfmGusn3Qc/pFVUXQUSHPk7zedYQwOQoxRdq3lsXmlDOp3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVRxTIlCmfx5FkH8eufROpZBb5LV1t3uMwsDfqNjCck=;
 b=kTXzeOQHG8uhXhycSawYOp5m5TcpoZsETOfTvjZRRzFuP9DSnEg67rMd7sbg0pWu7sM89EAVPxktwHgNRRA4SEr8wAIxBFTVRbVxj1bcrkl7FteExDcVZLSlwGC3Hhe2ON6KOE+eTBDMhpHnO1QWU5z4AJalhRaaPXm545+C8kQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14232.jpnprd01.prod.outlook.com
 (2603:1096:405:20b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 00:49:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 00:49:22 +0000
Message-ID: <878qguv8fh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <20251028-pastoral-efficient-mandrill-c4e9ca@kuoka>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
	<20251028-pastoral-efficient-mandrill-c4e9ca@kuoka>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 29 Oct 2025 00:49:22 +0000
X-ClientProxiedBy: TYCP301CA0060.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14232:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f008d1-5864-4f81-8af9-08de16850050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f9lEtVFCZSGvqrqyoMkwdPVzxbadZgtEJRte0/Nw3KKoIA1KaGEZ3zLBgsC/?=
 =?us-ascii?Q?TVQ3o7V7BlT34DbGs2a5qxXKVAHlVE9jhRlX5THKBakl/mX0VwznwofX+20F?=
 =?us-ascii?Q?HIQRNabrckXV/9AHYgWEldInIFDNte+gBPxiEIx/9mlYvEeGhqzT8ETWIC43?=
 =?us-ascii?Q?liOZ+L3Je1M/L5JqgqNciFE2g4278UmB9CBY+ILfkFnymxQaClDrqWNDsFeo?=
 =?us-ascii?Q?LEKUZJi8EgkCUNupLR33MW/LRu+DzGJ1PwUFJYi3/4LhhyfWRyICz+EjhtNM?=
 =?us-ascii?Q?3n+vMmGTaJqOi4HiIf58MrNLQy8xIILtPnGa1NWNufWGtdf42l4Dbhxpzlq8?=
 =?us-ascii?Q?MxqrgHpQ/iuozXbuzagW+GeMOG8b3agreZ7/hhi25ogfAIXcpmR/Gjg9ITrk?=
 =?us-ascii?Q?5Uf33zfEUcjVMWH64ERBN05pFmgJi/iz/x+lqxTdzHsSjYnZTlezpkIs+h6l?=
 =?us-ascii?Q?OUC+zTerCW+g7QG3gU/J+uLGvvejPc4VjElfOdmf3LN69+y18t9uLR+LsY5f?=
 =?us-ascii?Q?MkL9pOOMAhlVgu8Pci4oUw2DWeBqD49JKWL+ySHnzqBS5sLvcC8orCs0yEh7?=
 =?us-ascii?Q?PIm7K0Pm/VnXsFvvUdvaGYLBx+X/sjjH9cT95gD8zVGsDVAy2omO0zpfijXh?=
 =?us-ascii?Q?fIGoY79Ma87Ys27J8oTpmboE5j6ihsKY2C2CFPtJMi9w0BrxmW8YvRqfWfM6?=
 =?us-ascii?Q?N2sZLFMgmibyzkoTCh5iiw7n8tv6oRA5X56cVsbTPrCIi1Ze+A+UwMKOdZ1s?=
 =?us-ascii?Q?EITb4TcSA6h2tCS87omMpEipRXb0DXJ1lvTfRfyliz/KdkL7i1i69NfCdkwg?=
 =?us-ascii?Q?F+PGMFFT3P5nuizu5ODPoAvXMMc/K0X44GMn4/yDOncZLk7Zq+K2o5qpbUoH?=
 =?us-ascii?Q?OI26iT51ujxzBLYQ7iaUhlqZ97WkZ10D9kHgki6dFMWKxykGsw1pZi3w9dQu?=
 =?us-ascii?Q?FlrfQQ44dzoTgOs1y/4u4GDNsMISzAgsZIwcgSUmLQHi5LBgk6Z1vNu8aD+q?=
 =?us-ascii?Q?IycG/r7B2J++fjhV+p0SDI3rBBQUnTytXWgLfoQkErHi73rp2l799kCaWWUG?=
 =?us-ascii?Q?iKBCYu7ON+on7NaPdU/KW3RCepXWL+pOTXEd4Oqumwvzrw47xBuuRNE62mKY?=
 =?us-ascii?Q?gAGryeRiHR9RvVoxQ6b8b7XkIenIBQ0nMCbnPvqVkws5cAKK9Ptl59xHA0NS?=
 =?us-ascii?Q?NHOHXNuLGWq3cNZB7Hw7HlCyfCZi95DETxNS5hn9/LUwWnFkJS1r1Nzvp5L1?=
 =?us-ascii?Q?JJqUfF/Dgt/xExWFhV9PjaydwfANhaaPJ7VfjkkA5y5M9ENwLt6+bSjdeXXJ?=
 =?us-ascii?Q?gRyWXkPzG/wrTyRMDd8yYKp1vpbqh8AhF8YllcvmTIDTCi5kB1cQP7hYfcu/?=
 =?us-ascii?Q?fD2FwjdO5A8szfWCd694xYrvwr53xqsdW5wOvITkOotY8HXKDeeIyjRJhqAd?=
 =?us-ascii?Q?KDHdTITsgPr63QwzLIwtG4uhq4D7Z25+LQsOyCuhf92ECzFgQKK4HYuCMedE?=
 =?us-ascii?Q?hIBbyuTDUC0gLY6y4eZPPrQ37zAP7Pa1FK7D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d4QiF6pYPeqHmZ2PmqX/B+zyio8v2VB8k21I3ZWIa1vtwSjbxehHBDOV9Wm1?=
 =?us-ascii?Q?3e3Jkbl1ShjSMmogbyJEk7grIJ1/wzF7m5VZX0mfk1UgFl7aCVS+hWa65F3C?=
 =?us-ascii?Q?/3+ne69i5pqBqqxGEVbEnpDbCOY6F9Fwnkl1ad+iW4vlIlBop2QJUgNYgRKX?=
 =?us-ascii?Q?LBFyNlLtw7WdwEWgSdAeqW18zHpWlLDcnkyXcnRrsHWTJmwFAmfnqTvl/87B?=
 =?us-ascii?Q?ZQ/GfBuGoMhHv4dNT0FWibRukLuAhiOKgtNMpIZnabtiNvkQC0vYt3Ff3iUW?=
 =?us-ascii?Q?Xysn1NpBAigRrrSe03BN8xDzd0AKffOPPDxaNYqe2SUFtpPK4bzmPbANyOIH?=
 =?us-ascii?Q?DLJFS3dPKUoJ7ffzq1qB0a9NFp0v1Dki+o7R0shrPmZwMeaJEVyRglMp21Uk?=
 =?us-ascii?Q?tSJBQRgu4E0C6rsTE86Iw+oROb8HRnv6xPKmOkqcxh8UhqN6psQK99vIX7Z3?=
 =?us-ascii?Q?O/7s57yQk2gN+7i8KDjYgJHAFPQxC/7bSrCgYlIyXJn+cUxaKhfgk5s7rtTi?=
 =?us-ascii?Q?JGtaPVXzk8OADMOV39vJYRewnByhJsfOWyUiDPPiwZV3Bpti0stu7b6sRTLp?=
 =?us-ascii?Q?5gl1zmyPyi9g1sO14J3qLI9YLQvF1pDx6qxmS+kuQC0mVHoRqx/dS84o5upV?=
 =?us-ascii?Q?lGBGIZ2y1q6xzDB93nikNDyDchF+nhTY/KXFFKkSvSgw04TareuBG7P1xsia?=
 =?us-ascii?Q?0be60fFpZvIsWUg9P0LOcuQC/2UOVC7jb1JaNFmxLiqPnNkgs+uQ0VVrv/wE?=
 =?us-ascii?Q?gxsoc2VY68k/aJx3xT/BtV+0Dn0gM21Wv7/QXg73h1LnLbfp6meg6Bgj8ssH?=
 =?us-ascii?Q?O5S4/arp1/IPJqxtulgrP9iJi0C1BppcQiXHW0l+phZUJMmpueRzjoRoITi6?=
 =?us-ascii?Q?ADMJ335l81BLUPg/fLrX0tNLJKnI1/6aVbQgDq04J02kisZNQF07S3GDTLLN?=
 =?us-ascii?Q?AWRpeTekGlJKbY60hAC/NRXRtJLaXhcSjpkKHdpD7gUyvoeNdiIRclzjzTDc?=
 =?us-ascii?Q?+gOikl5VnxCg686XEppxSL2DKvbiGne5T+P25CC2bSIx8eQONrL0agKGfESD?=
 =?us-ascii?Q?d5I/PnKVjpyr31VnWGdOG0OUumcX6NT6wdKeFOltkcERbGgpM2+Yf92Aqww7?=
 =?us-ascii?Q?40qMVd4C1nZFMGufoSOovFcT4oeE6cVlDTbdUGBtoRWB+o9X/O4rrvt08PWG?=
 =?us-ascii?Q?TCxQVYtib0w1vWckhLFKiNCmCJ809y25gmnLASGFrRRfTOO4g/oeEHindxBy?=
 =?us-ascii?Q?v18Nc/wdR2yXwfKyk/F+S9yKRmFkmB5aabHqUQGbdXoLu9dX9g9fNapi7WSC?=
 =?us-ascii?Q?2GYOIzUSHe4BgV/VepX+CkTsYv/j//lM+O0w4l/amcZB9FpaS2H/Bhq84zZP?=
 =?us-ascii?Q?CypxV+Jm6edl8K+aZyBLq7th+qq2c7911K+c6KzJ5tikH9MxOV5gdUQJqisV?=
 =?us-ascii?Q?tW5xZHW9F4YT9FBSPLeV22w5SEdQWFNxsywyFyAk7B9EevZLgRG13MS77/WA?=
 =?us-ascii?Q?+UaUfK2JDTDzjz57QpJVQu1akzp4GepuUwmya4oh6r59hcyV3r+D9j7RBU2K?=
 =?us-ascii?Q?ZFjrrz84IPa0eymaxKRKUOt8so9ZJ5lcQR8i8WdIcYSAKYaBO8OqJUSYUeum?=
 =?us-ascii?Q?lD9nMv9fNC7gFn1LaprpBDs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f008d1-5864-4f81-8af9-08de16850050
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 00:49:22.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHas2BSYi55O6KHIUO8CG184N+F6mB2V9ZraNz+JDndpT9vWve1el2zgytpJgf6SjH+bgsPnspmtK9WEQu60N+NKPfwr8wxz7QFX7pk3sIpi1aIY7V4ThVCl5fM3qmnz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14232


Hi Krzysztof

Thank you for your review

> > Add device tree bindings for the Renesas Multifunctional Inferface
> 
> Typo

Oops, will fix

> You still have mis-ordered patches. Please organize the patch
> documenting compatible (DT bindings) before their user.  See also:

Indeed.
I will sort it in next

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml
> 
> Filename matching fallback compatible. See writing bindings.

I think I rename the filename again, and it will be

	filename: renesas,mfis-mailbox

	compatible = "renesas,r8a78000-mfis-mailbox",
		     "renesas,rcar-gen5-mfis-mailbox",
		     "renesas,mfis-mailbox";

Thank you for your help !!

Best regards
---
Kuninori Morimoto

