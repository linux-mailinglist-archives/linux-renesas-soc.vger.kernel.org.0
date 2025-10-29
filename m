Return-Path: <linux-renesas-soc+bounces-23825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B9C1873D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 07:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C4AFB34F79A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 06:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3190630276E;
	Wed, 29 Oct 2025 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jTynPsaI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B5313FEE;
	Wed, 29 Oct 2025 06:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761719183; cv=fail; b=lh6xjGvm0seq2Q5Agr3CaK51z/FOkkwmM9wAkTm9DL+n2rHcNwgcgCaX9w8K04awuFdmuKLng1/UqIimCKet/SMNUJvdkxblvxBEjiVa3VaBJw8SJozTNqbzuuG9XWuDqwH3Vc4hjtsAGnu48U1OX6LXgCxNGnyULzTAopVRk2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761719183; c=relaxed/simple;
	bh=R6nDUSSYfb7xY5hiUX5HhwstkArLPOaTwGjKh3Z661E=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kQBwvfATe6TGcmtG+ehCmhbEWMszMXHij55n9OCW7x/1Gcw+ErGz61Ugst4LYiRO/AO5z3kS/bX7knAlZZxzlQ7lZuzwQUjAbteBgikVeaYyaDqDb6O8ztt6m+VBXqHP/ki93waHmqTKct7W08eZ4GICSciJ1AOhJi0CGVif8p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jTynPsaI; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdtFU9/c2XcF0D2RO29YIJepYb7AiAxHwfUStitAis7mfNfe30xjyfOMLwmRgma4zN6KWFQq/2m82zRsM7fDzUCBMsoYIFgCAg3EZvun6w9Ji+xX50k6MHMN8QBJeUtrEwROG1+MPCBwUJZ5p9KCTlG2ILIeI36NboUAu0+KgqrPpnqblbtgzRyypd6OW+piXvbBi3rUGsONBMobDNX8LWNlTNArawWNkNLK3VEJwN+P/7W6fVvn1FpWlm75Q4SAHKIDmNgigb3j/4CSzM4XpT0AIiPZX502ZdQxMeFRFPEEqC7vW3Ycff5EeszIkF5nBdWUDBWWzp6+ichpUhvppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7No+EvM3aZDTCRDpLi1OsIXClsrW2GcQj5U9F3oawQ=;
 b=WiXBBxVD6uVQIfLowywOdqalzdE1ygrTMYlArx/bA6uoMxk0sbn8r+pWsa+MA7EtUK3ql/9Xt2EtoffkSY7j5UdgIsh6V/ppLkbwMXxf3PVFXNQ8IdxD2r0pIXbIT0lc7xlzxRx5rUOyoFzMARom1UmVt7Milb6g2Vizj+wrL6AZqkD1YBzb+Br37Rz5PZgIvHhSCh2HaAojqaKftGCbI4XZbY6/UUK8bWa7aNyWOFOjAJ6TVwbIDCTQEDLt5sLoGOB8/AVbXWKeMf8y7rrDILhZnm7YgjxFvizGO8wt1o/rxjmYywWoe+97L+TxzALMjBXhXN7TADvrpS1nrBUIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7No+EvM3aZDTCRDpLi1OsIXClsrW2GcQj5U9F3oawQ=;
 b=jTynPsaIjQDXsWATS+mdr5CQhFD+8gUy4XIRoO9YyZzithfoY26V1XVy1fiypynuLv8VS/7CIr+9oIJEsI6fnbwuoU+pPxfx2SRsi0VCIJQ0Qv/OhQJNdLVHlKV5FtSN75MLBahJgfA5HiwqP1KeUZEIKT+bmoejHLWGNGwVceg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15674.jpnprd01.prod.outlook.com
 (2603:1096:405:28a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 06:26:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 06:26:16 +0000
Message-ID: <875xbyusu1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <CAMuHMdWu1GemaT8vQv=vnsMvyK5t7+rAspFEKi53oWmyj1kZAA@mail.gmail.com>
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
	<87bjlwn7j9.wl-kuninori.morimoto.gx@renesas.com>
	<176129066419.661728.14767654389778601283.robh@kernel.org>
	<87ikg1gcwx.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWu1GemaT8vQv=vnsMvyK5t7+rAspFEKi53oWmyj1kZAA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 29 Oct 2025 06:26:15 +0000
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15674:EE_
X-MS-Office365-Filtering-Correlation-Id: f18c4c9e-1096-4155-bbdf-08de16b4106c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QyPtx2cS3GLtYMCImmrQ3d++qY0H2BSftHTT2McaBeoYS9o4fdXYdAUi6grs?=
 =?us-ascii?Q?1/2mNkdkCWsGmfUfpOWVK3Q/fYSyUFDwWeaNf2OQIYhZq2mYB1kql5qt41xv?=
 =?us-ascii?Q?x53ORQaEQw26zo00qGgfSXN4h0SdqbUwAIe9t0Npsymq7ZHEIjpM/DUf6YrG?=
 =?us-ascii?Q?o9zY0vVxwQV5X/FzodKgEFMyhPw2Gry3i0m1qwiEml0sQi/H1DvkO0XSHCKF?=
 =?us-ascii?Q?T2sRLAu7kdh3A3aWph7+pyk/aHAr8kODyVZ97NE1J2bc/j5IbekCc5twYJK0?=
 =?us-ascii?Q?eXC7ZVGIgCjm9irEVeULAp4lw/Weits7pBpdaduTqZx9QV8Ca5f2YepUx5iQ?=
 =?us-ascii?Q?ixprsi5/XMHqlxbtOmT5bu9tXI5JW3jWcdrAIUIWWcchJnGl2tbVydFIljXc?=
 =?us-ascii?Q?IHGTDQIm5RMcob195QvXTrfZzKk8jGVu6BrjwzXwkPde5ahnSUaNLqXY3mv8?=
 =?us-ascii?Q?rt2eaRceI67nY8ZxK+RoT+lXwICCNvkXElUYoKIhzHPDizsWQPt8nGbYFz7G?=
 =?us-ascii?Q?jxz+shpUb1EbgFN3UULTfOOCpd6aeEiX7Q8YfIHPXy9WIPC6UryJIGm9+UpQ?=
 =?us-ascii?Q?XgD2rlK8DIgPU87MoWwPx0770aCTfe9nuVdKNGELHebOLAZc7XRk9MxU5Aq/?=
 =?us-ascii?Q?FMDFDCuDPdAhbnEnI8v3eQ+bFP+PpocGTTo5rjIl7wEe6uBk66dGk7bM45r4?=
 =?us-ascii?Q?23pMliuXLSmKQ7eJYrEBqmLcaDPaT6jevjUT85AhZgrmctUP+5Fa06s2QHJY?=
 =?us-ascii?Q?M12wub3xzu7w+mTx6EPfQTpLHV8MLTj2h5WwyydyJtYgSYNMj++pFF44jR8s?=
 =?us-ascii?Q?N1H8C98idWPuKMPSDvUFK7b3el9ge6O/+v86NTrqANKbbRo2smPOA8jpcayZ?=
 =?us-ascii?Q?UXZye1awDab/RjoH14xu+kAGJKaYhspp7OtiWCozdwxUJgtdaG9O84qDzpoq?=
 =?us-ascii?Q?yPkfyCYJKLa8PYBPnEl9QHhDjEqlCJ5Y8kPrKyxAOWGJGmV1cLe2dgnH+V81?=
 =?us-ascii?Q?vTR9qrpT9jusN/h0z0c3FO5NQ+9jnENzyMzRuMOQVIQAavh25Sc0uD8GhjW/?=
 =?us-ascii?Q?Q4rmwI2zLzScJg6qPNgGe8z1YE1wFZlX10A44r18lxKtLx9qDuFC2u6tRihP?=
 =?us-ascii?Q?CYfEG+JbJ4mdd5F/4swHwwN3coGQszk5rwXA5xh9dbBHm1q9KmRHKrvmkgl8?=
 =?us-ascii?Q?5p+/l5K0Y61wlJmRU8Bchf6b7b0AATfufxd/fKqna4THxgnWXDk9gIcRHasD?=
 =?us-ascii?Q?iuQUexutniBirLbJXOtHxmhoFQR8wEBuxTBvZbUmfrLJO7z9WdmCSUM0s9OW?=
 =?us-ascii?Q?M6mImf9Smc5LtNePI5dGSCvP6uVJd9+CGNuFTQtCMXdYIC8+Zwr3KJ7wLeau?=
 =?us-ascii?Q?nURctwd/Fme+b5fh+B/SDjG82B6zesyz18vKhwTUAKNtnva+QKDyWy/gswRH?=
 =?us-ascii?Q?7Q1MJsWEFyaN6uwt3ufHYUG8zpusbCF++vB3LNoLtMiMaZs8gvpab5hKIhUB?=
 =?us-ascii?Q?aDVHecHZad70XRfxgzmPk+5uOuEuGSFiWia0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fImDkNcgjRIivgpejPKUKcwAH+6Xd4iqZiPcdOJJvZoyYSGaHdOu6zx0fRm6?=
 =?us-ascii?Q?c8P8klK5zMPP8XIBkk+x1ZNw299bfb9A2TZCg8AvA5LVM4AXiqChssIA2iGd?=
 =?us-ascii?Q?7h7/+kyjpgEy+4CWIafvtSPmWAmi90a6/t6pi1lCLY5rnnnhyMR0yiobYWAr?=
 =?us-ascii?Q?jUtJzee7P+TQiCT+kYf2SJUqeWp+JcaYXknBEB4rXTq5WziOw8gEJ3CgbAUt?=
 =?us-ascii?Q?Id+yFxDaGxhqElnw09EWMuRXAbBwjDMepyAR9ZzaBRXpY5TvV3w9ivxiNKLa?=
 =?us-ascii?Q?I0TsUcQHmjmkc4DZBdgQJlA+uwa2FW5ga+PyxHIcPS7pcg0lqt9BWmDTH5O2?=
 =?us-ascii?Q?BornIrPCJYZ90eG+z1SS8uVD3wCNaVhf6+ku/pQrYfxbwf42AG90f7ND2eFw?=
 =?us-ascii?Q?IEqHJa68t9mmtt6fFqaLXTjiSQ1pUSsmySLxuoLphwKLGHqCjjqRmnXjN1EZ?=
 =?us-ascii?Q?9YE91mFKAp4gfODfdNh/J7wN8HOhiVF46B9a5iigvSwJAYpnkoVb+sE8U9E4?=
 =?us-ascii?Q?ET/pA25yBSJloORf4oei9w9ujDVKd5+2XU8JxjnDnkX2SgeiFugn1bQbB164?=
 =?us-ascii?Q?TF4Obp7lRuK0tucZKbBnuTYvHt+a+lPnwqRhahn8NMjdRhmxQGoE1lEd6hzF?=
 =?us-ascii?Q?NJ2pPx5Yy9KyTkd5KihPqZWcej1dAy5rikepgwy+VgItBxJuOziuL0zI0bnL?=
 =?us-ascii?Q?KvY8eGr8GxOa1VlS8Fq5U7J2fmMg6Q5FK6Lpy88jeEGHSNkf2RlZqqBkS8N7?=
 =?us-ascii?Q?MFV0IEl76z6s1l2SkBzzjuhZraNAVXMQcD7njGcrOojVrvfuBPha+qvNPHnb?=
 =?us-ascii?Q?ajuqtZiGtmV0veQPNBk5dr1ZZE8IW3QIEJdtgsxnoudxjH5EgvNe8vMH2Ow4?=
 =?us-ascii?Q?4HQJRTn5aESYt5flxqklm9maBdtxQSToIUD+BQd3inrYLN+JNBbDYd4p9PJ7?=
 =?us-ascii?Q?NVE8nCK770pKG0AbouBzjqjBZjOdQSet1ipFAX7161296MRyzQQGt6loIJdV?=
 =?us-ascii?Q?X5ihCeoR/lfV1mOVBNsCZKaH2c+HbTS1ztg1ePGwXDS44zVOK+0ZIfjwNayu?=
 =?us-ascii?Q?H97dX+8n3FA1AL+T66PoeIYAcTVwDwuW7uwKIO8c+Nd9zDNfl9mdMKAXilO3?=
 =?us-ascii?Q?B0HkZaCMsvk41nqd83zZA20HCCqMo/BONIYyc3qAF7ifb1dDBBsKOribXCQH?=
 =?us-ascii?Q?YYVjgQKaQs7RzV+2gix3F8W5OHO1YPKOb/oVwVuWNBqjbexePuhJdaBxVsrb?=
 =?us-ascii?Q?B7vLFcxbp8JbeM9ywGZNWKqVUtzEiXoWJe58RgCEbxAYw36ZVPrxxd4oZNpV?=
 =?us-ascii?Q?g1x+FuenNpfTOcFniYQzXtIHQ2OHjLp1R85x3cAtTz7ypzrdmJGZy2Zmess6?=
 =?us-ascii?Q?njLpW3BoQi/9ixVxSBnNimD6VC/wY2iJOmeQ+sCxYsp76Z1nKqhwT/MCUl81?=
 =?us-ascii?Q?F4+BWCBr0NGvFo3h3d/nZ8rCrsJmuRZIu6q9CTMQY0mkTyWkLsGnmaDSKNIQ?=
 =?us-ascii?Q?XfwimiPQ34Pz6ZpPgzoRoGgrDWmQyRsRXugQseuQpc+Irk2H9oISa442h77h?=
 =?us-ascii?Q?OHLaxYLsZDjYzJ5ew1rjfQNkdVWUlKpUnnGQU2cbnqwKwYUQk1FmwBqY7T/W?=
 =?us-ascii?Q?VtgXbHt3PFD+z29Q+hIWwuo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18c4c9e-1096-4155-bbdf-08de16b4106c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 06:26:16.0989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCi0v53ijWaMyLgx9yYPr0Rxu3FPD5pTmphznrqnGA7s6fHCjBTbFXyTgEh8q7b5Sn684zvqKGA+/pmnDLhnAWOelE6HMvcwHFmXAmlCMAcmkR3u3iteCa2rsJFQ86SB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15674


Hi Geert

> > Hmm... I can't reproduce the issue. What I'm missing ??
(snip)
> You are checking against the wrong bindings file.
> 
> However, I cannot trigger the warning by passing
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> instead.  I only see it when dropping the DT_SCHEMA_FILES parameter,
> and thus running all checks.

Grr...

> If you are 100% sure you do not want an SoC-specific compatible
> value, you can fix the warning by adding "renesas,mfis-mbox" to
> renesas-soc.yaml.

It seems I need to.
In this case, should I create separate patch (= for renesas-soc,
for mailbox) ? or can I merge it into one ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

