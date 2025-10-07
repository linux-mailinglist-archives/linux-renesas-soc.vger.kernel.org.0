Return-Path: <linux-renesas-soc+bounces-22728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4763BC028E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 06:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A5324E1DB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 04:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526D613C914;
	Tue,  7 Oct 2025 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mx2dOO3+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD74F5FDA7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 04:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759811885; cv=fail; b=RePOQU7VTtRZvT0FljW06h3SAVh3VdTszcFcAs4suJSgYBm9wt6DvGg8LcIVMEdVQmbfORsfJYjyecbj9GkYWWwQHzfxABTBnqKrAQ7ffzT14KfeajTHT7lckhTZmP9yjabm+/b1Qi5RLOIGJItQr7BYpCOvzeqIDkSa2FCc/LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759811885; c=relaxed/simple;
	bh=VXCqNFdeysovg88x/5aRSzNTvC8XVZHwdKXPC53MMVk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=X9VmiBHemtCQ1tg+/H8FkzDlm0sk31Ada4MAAmh1OwwWyZt7hd0BSUwVECbLpEes7SI7dIdG/hvSghTYcmyT2XNrHvrDvrg9aUhZQrVajP/zpALj2zXJjqTjujHRwWuAhM6R8cOgPQAWx+ApMsTEmk9FVM6+p+h2GfwU+adhR7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mx2dOO3+; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9+b7ReucNzIw1JYe8yK4BgRZoFvct6QZbd04izvZK1GRkOo75tD9jNAcBK/75NPr+PriMKjY6dfysngYFN8UPc4lBtcYaQ6Si/Qj5L739KWvuB0FLsL2GomXFQVwnNLDk9sRKAiNeJoqhddJC7jrE9eVd9OCTn2jGOmI4q99/bXFO43Zr0Pa7RWUHD6DowRbjYqSvdaQG6UEqBkSbXV7wa+/tWfRDjwLdlkD9G3qNKYR72yyrLDwNVdWdp+QzXGt9Fh5dRN0c3C/xShuKUHbYlPG1aqbWadcjYODZY5udBcagRVbo6gdLVKw+Xul6DYgf9YRbUpzrNqBFyvKf1JYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuM1mfGm1FPA5YxxYmHOXywkhSHTo0ggixjHg07JZS4=;
 b=M2eQo7phdXmkGTfL1GRl/mC7/4XPtNXyoi4EIlnsJCPPi4whr9DOMIIwwLT4IUe/8gKkekmtz21VeIarQ1H3Wvw65IFgYv3jmN6y+jNeJ9enKsNBE2y/NvZop/3hDzT027vQkyP2p8y8nQ7b30k3xko2QwRNvKYtmALXE3TC1B9s0KBDmcTisDJimVjQAd7AbCvTgyj3DDmEoQB+oEHzzpPeg8EVaqI8wAOqqRXZbYtQjbWyY8iIviBsMsG54/LlUjvqojDDFV/X1pu/R6wJqrcGxqeQlamo/b29XNN/tGreSWUZy2vATwrWYZWaVURxbl5t8NXFdkG7Ho4oebl5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuM1mfGm1FPA5YxxYmHOXywkhSHTo0ggixjHg07JZS4=;
 b=mx2dOO3+1sC4YZwWmE3Cf2DlhBzLcz50NK9iYxukVWyjRSxnrdpzGIjak78sHh3cXqUtNUnL7BAfM2uvmL1hwbccK5acGq2k5x7j9aPeFluSvhqLjko6d8bmyx/L0bZZw98GUlhOm7Jza+JBJPnloYYQrfgOHpOPJ5BjKz7nwwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11711.jpnprd01.prod.outlook.com
 (2603:1096:400:389::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 04:37:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 04:37:59 +0000
Message-ID: <87ecrf5ntl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/13] ARM: dts: renesas: Move interrupt-parent to root node
In-Reply-To: <cover.1759414774.git.geert+renesas@glider.be>
References: <cover.1759414774.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 Oct 2025 04:37:59 +0000
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11711:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c73255-5ac1-412b-5916-08de055b4b0b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NI+NeU9zLjq8Tpq3EAIpAuToT1UHmpi1RekNAmw7gy6pZ+s/GtBwWvqWAbQC?=
 =?us-ascii?Q?NGN+ubwK5tmRztjBRuwtikOKtXxw+3uraMwMi1/Wj9PJBMV0/3Pk5esyxf/z?=
 =?us-ascii?Q?aPpEpKYbcZ4lIDyJbe/AqBaUUyMT/V/3f23sn6P4lNcV2MHEbLj9FBjek3FK?=
 =?us-ascii?Q?Parc96XBDRit349qL6QOHf6Nj1pQD9GSxbF2t5sQUPRCyb0jpbHtV2lrW427?=
 =?us-ascii?Q?rZcrCi1XsZHfGrXZxA8DNICuA0l3EhGNajw/eRdNQ0h2U8Vpl8O9i6oYNl5r?=
 =?us-ascii?Q?4eti4E5pBvJpYIUbNdHbMr9bF9xCd9Y5BOtH8rCkN59pI/HlyAepldWHtZal?=
 =?us-ascii?Q?3XKB1TyV9d8bqiAR9kXk5e0FO6tR3yw5gfYYaG6S5isbBw9vEJ6T2fwFPmJX?=
 =?us-ascii?Q?5nj0aFUEMq9yUyYRVHW5h4zzvLD7nOuEZVvr4nVH21b1aR9wFD+uNDxHYDm8?=
 =?us-ascii?Q?tl7I2F9kxNgvWtdBvid0DpmEqq4zswCbwwvGFiGHHakjLGuyAxt+g0IqU0Hq?=
 =?us-ascii?Q?tAjf4Yjv5+2VTrATPaXGAvXVX91b/DUe231grTN1xFV1HnL98WDAZh3g97fK?=
 =?us-ascii?Q?hgUOrz/CsqwfTxZsNLh6FZkMunLDgFfteO5DFFs5mhACkqzGdmxB6OcbGgEz?=
 =?us-ascii?Q?3O6WD3O6Ha1bBbR4ZQYUR8UkrMxWVCPrYbaH+hEUkG5gmcC9KVXWeK6Z0Hbp?=
 =?us-ascii?Q?TKSrigiBNatFY7cKBcOzUi4bj7Rw1FZMj+WL05hwBCtt8b8jeNgZBFqI272/?=
 =?us-ascii?Q?JMhVNyFdHFpX4dfLz2a5ItytapyZuMYGI8mmQeQVZhdTFGgfRDTOuTMPWQZ5?=
 =?us-ascii?Q?+WZLYTqT2UOAzJFqq5uIrcun3syaPZLN6RzWZI7Lq+dS4uHzUZI5asSl8xtL?=
 =?us-ascii?Q?/TIb0efXbZ73hR1btqKLVkj9AcWwiuD8xlJ5QCD+lsovR7GQT15HP7VoCBtB?=
 =?us-ascii?Q?2D/ilIYw6Tg63/0JvK1Kkjq01uuzMRDIFwpjmC3twO5ox68tuQf2AlP/kvcz?=
 =?us-ascii?Q?YlahOON6ePfOQiSTnByCIz5vnpG7AWLpVvl3Effv0I4aU9nFcMiXb6awg4U2?=
 =?us-ascii?Q?H96jIOxKlOUFFbpbppbEw2fb9r4iza9XA3umWjp+lnK9iWqDXect3VmlZffX?=
 =?us-ascii?Q?16ZYKwvAI3kgMYuFxjYEi8VBBuu1hqvOahARq+lbjjxkJIsQBk05tLhzbNfr?=
 =?us-ascii?Q?Xri10/5duQL/gq1nbPnpRdBv1dzj2q+xy7VWkXUnnBQNbX9L4HLcB/A/8D4H?=
 =?us-ascii?Q?86Mjia5fac3kNnnC1IMiTwvEcJ35vzx5IL4XrfqKzKdn7OdR9WHljTduTYPM?=
 =?us-ascii?Q?baXbHzmOgNMU7NgeooeMva7+CX8TjCs84/ND4WBm1RG8w6admVYa47ci1SNj?=
 =?us-ascii?Q?Ga4oF5NWARqR/8lWGgcqLzvHU9yXxDejU7+Wv2It5I3AiiCf7lLN4wSPD2p9?=
 =?us-ascii?Q?elxYi8x+xZDX6ELemAGR6hFuZSuVc3RGQbEb8iRonZp0+IDR8zYpKL+KJher?=
 =?us-ascii?Q?zw2HgwdAnq5xIHOaFMBFxvI7W+r9XB7HG2j2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h6+Yl47/YGgimYsWwkcTYLDYUYn8PMJEGaCRt8HkkBeel1x9X6PcsVC4w+cQ?=
 =?us-ascii?Q?bPUaAgVShI/4lLFeMPW8uh3nOzBD6rBMRybeT9CF/Tb4wIQMjBcP+AOKYmbV?=
 =?us-ascii?Q?0zciVqWLl44UfXbJF/5KYidM6qbDs4BINupmJbbG00E3e7wZBpjA8YOSRZm9?=
 =?us-ascii?Q?fR+5jtpWO/ukWsaprXl35jKct2UXK5NeDtGhIaQdsngmCDwsF+yqrhm5o0SL?=
 =?us-ascii?Q?WGm+PF640rXGOMmc3yilXmVj24e+iznh76gMEfw5jtuGVHtJy5BLZB4CKlvc?=
 =?us-ascii?Q?SqU1BIcXnkTd5ja36eJTKdfF7O7Y3xHyNtKlKR4GpX7VwNLajecG4JC4C3t0?=
 =?us-ascii?Q?xnmRxZ3VQSEYS2j6Uti9ZPEYWBchrdAwtfjdYMbFeHc5GqSaAKcCGA2PjEUd?=
 =?us-ascii?Q?iOECWwqh6yiSCdH6KOlmfjYymc1W7BfGwZ9F4MJ+3VrBWcnSfIf+/st2CeIy?=
 =?us-ascii?Q?p6Bs2vRySl3rueOYOuC7ZOLLcO2i2kdYB+w4uEHqF9+gpAqO9yUALZLnB92f?=
 =?us-ascii?Q?jffCv5uJI5uPdEkJBJfDUIkwNw5lq0lrahdSHoOCLU13f/4ACqObVh9CHxsB?=
 =?us-ascii?Q?ivTVbedXHDzV/BMu6N1xVnkMfJ3l1CHcbjjpVYM2XB+bmojiCn9hS8JNlMSj?=
 =?us-ascii?Q?jjBRbkZnRlRzuGTcHUt7MqhKhWU7CoXL31yQ+z3q6C3P7+uAkjf3E521cFDt?=
 =?us-ascii?Q?jtH7sxP0eYZZRTWU/GUZcaktNJPSgkQyftDhDZ1rSYLN1OwwPbvkljqVRzmy?=
 =?us-ascii?Q?BpBDslpC9UtP12nEeV76ul65iEkl1H6bxijQFwb0T6P6wy2KSPUo6qsQhFD4?=
 =?us-ascii?Q?qA17dfkcB8I6435bwMCJj0WNC46Ctgb1EEMv4mukbOKMVkwT5jvaCivihCvV?=
 =?us-ascii?Q?/9JCLwqexxDZP6v8cOD1Kq24hBy4TY9zd5otIVTWi85RrfQCbs/RzcBFG2IZ?=
 =?us-ascii?Q?GS4fXazTdY/Q9CT+ZGGh2hM9ABXAKpoKO5Gpzl/22S2r4ICYMKNsZKqMRmVv?=
 =?us-ascii?Q?HAX4/9ttkFjUkasBnsNZYv8GLICNh1w3TyA7JxT/jbSWtC0YX0IBC+8ml2/7?=
 =?us-ascii?Q?HsnU7PZze4ZY7Oyf36YD53oTXTMXMvZhkcloLW7DjHh8xPWzQH3bDopKPXsH?=
 =?us-ascii?Q?Oq+PNQTO2ztJo0KuL3tc3eYpN3ATjFvCKjO1kgsJV8IBkO3V2PHVuoTNbN/R?=
 =?us-ascii?Q?Q5cr3k0OM84NcQ0Hgt9jxZKP0DoQwjon+14azf+bb2tOqxMh49KVciqF5eQ6?=
 =?us-ascii?Q?o70bzuyXK8WC/hpQ4qNEtloAIZoNtb+y7OiEQoNh+YroiqK3EC0DPBjTa5hP?=
 =?us-ascii?Q?Azrv6+6muOLNEMii2zVbNaHjqXkYb/Vyo0vNjVeGcKinLc8LHetpI47PF7yN?=
 =?us-ascii?Q?qUceaGb4qNATe14lhvMRMPFhrpE6XtWV9iJt1Zi5+WfqlD1cP1kTYKKArkfi?=
 =?us-ascii?Q?KSQdz1/aGeUmPWbVYR3kmY31uDOFrzh+aWnJe9DSsnadF9YXGQrYX3pR/qOW?=
 =?us-ascii?Q?hVn/C3UlrANuj9bYCPl3+/Z1YMMqg1MbfJXAo51ZONSsi1RbHk25ac5ghmJ2?=
 =?us-ascii?Q?cmuLZZlgQUprLjuJclBwoWo/VoedNmipf9gt+C8XndyqbVlhvdbACJL4krSf?=
 =?us-ascii?Q?/z7vgbo+PBKlMsgnTUYfOI4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c73255-5ac1-412b-5916-08de055b4b0b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 04:37:59.4355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvskJ7x6LA5eHxVRcEbdsPJ08dmZhoMz5aliOxYK6PQFmZ41O1rGAYTbQXunXYgm5fPDYn34SHGNSYDA0X+xpazI618oggkbLQ3kbT7mH8X4YmjiA5/N/676ZKI1W8d5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11711


Hi Geert

> 	Hi all,
> 
> This patch series is a follow-up to Morimoto-san's series[1] to move
> interrupt-parent properties to the root nodes in Renesas ARM64
> SoC-specific .dtsi files, which lets us replace several
> interrupts-extended properties by the more concise interrupts
> properties.  This series repeats the exercise for Renesas ARM32 SoCs.
> 
> Note that several .dtsi files predating the concept of the "soc" node
> already had their GIC interrupt-parent properties at the root node.
> Of the modified files, some had duplicate interrupt-parent properties.
> 
> I intend to queue this in renesas-devel for v6.19.

Looks good to me

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

