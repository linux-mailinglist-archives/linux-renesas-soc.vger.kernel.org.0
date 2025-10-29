Return-Path: <linux-renesas-soc+bounces-23889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5CC1DAD4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 00:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 816334E4F39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 23:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714882F3C34;
	Wed, 29 Oct 2025 23:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="S4TAtE6H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44B5299AB1;
	Wed, 29 Oct 2025 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761779873; cv=fail; b=Cr5MrxogyuBkUQTQwl07XpezgAySG32jsRvNh0grZjxTB33tJsh5B6eel+IeEnkCWqfJ2BD7FBBci9z0Gu9ThLVDDK7KP/ulIL4Ix8PPaYgWcxolpxWMbBPiVeqvlT+qEku6jHOT5G3DAbq4H0Ck1USTY9ZslIn9LZzYUrA18rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761779873; c=relaxed/simple;
	bh=exlWWCrdUE7zGuYvSSkRXXH7ws75OnKShF8ZYpDXzjo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Lx7C9lR4tExYJ8l/+xQLoYA/hIzxnyH624kgTgBA+2wGI1ePIZCUxaYnhzn+sEjM7Q2+BZlSblJK/6zOfeLTL38RMIPdIjkas13nh/kT0mK/wBOhAw23je3WL4CkdNvuQRn3Wk7LX72NqVBtQyn9Aq+s3lWouDGrdsyO34KwizI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=S4TAtE6H; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orr8dDQA4GpHxwBjMAhOomTSvklhvuhcl5aFq4/i20XCMCc/I90Zjc6y+S2Li93N5Pbe2J1DOQR+C2+TGSOj5pUtiLqbEHCU9m9vaG9ol3Z4+xZAQP/DmwQ2i2KKX8qWTHwa6DPhmS3k4KktSLPI/t4jtxAIVCJJJQnAs5MB6apqswPPD3vjEJj96kfIxrfY86Rv0NQZHK8TiSx69boSHlxqun7bvgOluk6Qb00OvfMT2cTWHSsDTtKmw8xtNSXeL+CWYY5VO4T7zXiiLPH0TzWY66oJAJC9HT5UelfE2qeGBcrL5zZwhkgfJxcZJMfY3MfS6z1HPeV/tcv5Dsi99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOSkvAgK6S8GMwMd6Ly5MWMXhBCh8o6iLzsxKTfaubg=;
 b=IUqUED52C5EGXxIbUr5ykwnrjb5WFRWJv8KLzhAuGKpmm21vHAuPvX5wB0knozJwlwdAUag08Xywyap7OOqKB1F6cXZeZo8avThIphd0ihytw6lKfVtDQbAbbYp226Vj3+WdLpT6XuEUE8ZCDqeKi5QVRS6B9PmR8pNVy2lQBnKzOE/ma6UeLSBvyAAOuIKdxxUE9wypyNWjG0ki6oUqcaixki8O8rAjqq5oi/jvWWpptc/koAb85owMb1jR+F59E01v7WCGRDZZyttzZaAKYRsWghPvRk1nhGBOrZo7ndfVa2zoAKNg7sl5awOIZAcuJGZI1zOYkqOGOqCf7HhHlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOSkvAgK6S8GMwMd6Ly5MWMXhBCh8o6iLzsxKTfaubg=;
 b=S4TAtE6HYjpju42Xl62g+ECJmVQ30U05wGApbvfe92x08NDNkB1Dp5Ii+aGqvB4VXirippXg8Lh2p90zrBQGKur9EZm26J4GLA6cBZI7UNrkT+sa8PlD9sk9l0AOdOpHe5BxKXN08ua+fmP2g/Ov/Kbv775UUXgUpucaP62FmLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9905.jpnprd01.prod.outlook.com
 (2603:1096:400:237::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Wed, 29 Oct
 2025 23:17:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 23:17:43 +0000
Message-ID: <87v7jx2t7s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <CAMuHMdW9sEcKprPjiA50QOWm7b_fwoEkuJcLLKg-srQxwJX43A@mail.gmail.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
	<20251028-pastoral-efficient-mandrill-c4e9ca@kuoka>
	<878qguv8fh.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdW9sEcKprPjiA50QOWm7b_fwoEkuJcLLKg-srQxwJX43A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 29 Oct 2025 23:17:43 +0000
X-ClientProxiedBy: TY4PR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9905:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5a0adf-442c-42a1-2022-08de17415d23
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GP5ER2NnxuD0C+6qb5DHujBaDrubIH8QtAv97KaYS6anFHlcRZ6cN4Jn6KAO?=
 =?us-ascii?Q?O3KUH7QTi1k4rbUmM/hPWKQ/O4zm58JFPHusfn3iHGllKoXLdtlk9kQ2Xltq?=
 =?us-ascii?Q?k3xhbs6jnOo+8Q4+xeLXHFvjPrkN9MVoaAUKuwQDSk+HJ1fSOvkc3w/fAIbz?=
 =?us-ascii?Q?/5P0nISTYvdR8g7VYSUR3r/Qoyq507g1hwAY/Y7MbHuM99BDuaNSq1uLYgTi?=
 =?us-ascii?Q?VaKmYbUgYEpdCf/zfDQjcnLigO20PkbHtP7/JrqQ2ZHJVjoXGmZqbfqMdkRz?=
 =?us-ascii?Q?bSoFINM+HeYRsdG+ItwOVbiMfhu6xVwlaHhf3mF9QNG0pcwVw2vsAl4oqOpT?=
 =?us-ascii?Q?cg3HGP4wbaKozk+BjDU7kHj3irrCmdQQdUUSIsXTIXJHt4pojAbZ82GxAyZv?=
 =?us-ascii?Q?Vc1DtzShW6FHceUwCravXZbLMKoTh8l6GbSa964GEvijHxj52/EbQreumqzg?=
 =?us-ascii?Q?+5TP1DGbfJPRbV5ooV5tcKB5fxJH2BE7F/sRUuI/z2Dr+TUawN3IxYkBn/eD?=
 =?us-ascii?Q?mUiBuQjc4iCE3XBX3RR6ibpryCsglUfYbv/q4TTo8OxIZa6heP7EJ3ucfYpz?=
 =?us-ascii?Q?qo9Ds/x+wgrkcWpjxcpPJfC+4Z5lk5129ppoxxV5wLL8pQOJgOtmBfCWnvkc?=
 =?us-ascii?Q?JO/pr96Dln+c9HNZOvhirK7/dDJDJoIjQw1s2MjKMpooiM7+/ZMtACX9zvmJ?=
 =?us-ascii?Q?66vu+36C1JK+QnYrbDN10iOcNT4ZFfggpRPpybOQxESu6/VBXsuwnBfof29f?=
 =?us-ascii?Q?fVR7e/cAQV+84hY2zaGQ3EXut24aTV7wrJAiBzKXW0XnH3zZMLRe6PjshyQH?=
 =?us-ascii?Q?/p+N5wtAXaIR2fHAFmIa2TD5R+XTbOdOf2TlaKJeDEzDKpFY8NRmdV9i0U3n?=
 =?us-ascii?Q?dRla/auxb0agAAYg8mEMe9CAtzZW1I3qlxBf2Oz6t3PEFeWJOneMcBV7sHpG?=
 =?us-ascii?Q?H+VSqhYn4rH9NJNgzrCWDPJkbQpjPjhBe/pL+oDQ1kaFhqGf6xOmDgbwk1Ez?=
 =?us-ascii?Q?yjMP/pWoYvUCOnmM07i3mLM8xmbXh1aSEYs7aegeOmXircWzh6EoGQw3Risc?=
 =?us-ascii?Q?tXtbwVmiSTPrartOSPSu3B+sTxb2tu5UPUfGeG3pWqXOhJ6Q7nzZfURBYL1n?=
 =?us-ascii?Q?60ZinxlIRakWNOXxgJVGCWTLbmGQCu3Urq9LZV83IjzY+37Z+DHOS0yFI6TX?=
 =?us-ascii?Q?8LFVmSkdUU2DRjBLte6cwuKsyAtbr0t+2VaL7NWyoaL5QofiBxJ3n9hdq5XK?=
 =?us-ascii?Q?yImjHSOWYoOFYQMkw+ArbCj+Uf9yH9Rcys5K5kPt7bP2B83/vBeOSSNOQLG8?=
 =?us-ascii?Q?jXfqnprG7IlP6iENr8YT+MTkKDeZMl1Jhq5JU/i3hxbgolMg1vAV6i2d/ONz?=
 =?us-ascii?Q?ER5ZslHNznyiQ6OC2LItKbLp/15qqHrKKqhv5QwU6HCJI96ZB0JSyA00txD+?=
 =?us-ascii?Q?JbsPgrnpyULBWMQrzneLIXXSxK7gDFpFBDftSugCPzj+guHRK6QmH5U7A8NT?=
 =?us-ascii?Q?CwlFigfWq1UFO4TPQ5GFm7wfH/02/Vtm8CiT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T4uA/ccxnBFp08kQlypJDKz8R5gg+8CtrPIMKGsWPo+WuQOBFwVxlcz5yaBt?=
 =?us-ascii?Q?f6Ortjpj7OOBoXZL35MTGSqWgzTZyacYDy28YFc5a1kNKsDyC+Xh7jItvgdq?=
 =?us-ascii?Q?U4A8jk4sxyf3WkV6Vy5urx4MndOz1oCR8ntXow6cpTK2QM3N2754jGuqNZgf?=
 =?us-ascii?Q?qjaMY2VgS88DPrwUaHIo0Ixj5AiKnuz0rv2KG8608Me0xVSPkZKONFoaDluP?=
 =?us-ascii?Q?TTNagKWYzW3P1h9s94gu0zN9TChE1p9GVuylWKGrTHSBe9OlyWMHurGpK8EI?=
 =?us-ascii?Q?k+umsz3zTOIYtSAfgqn9GRRiDG0JGCC0KSeLBe6j9bf4QNcFiMkR5vOiCf5D?=
 =?us-ascii?Q?LcEU3nge0vTiER59vG3AqZtLv6JAqFN9i9YDRuPJS0b+ok1mWInX3DkAgckZ?=
 =?us-ascii?Q?/WuOxiS8YXU0qy4OK2YPPkLFY3s7oJIE8PcRsnRTlPFHBhCpsV0Pl2uFEQ1R?=
 =?us-ascii?Q?I/PzW7nq7EPPY2GJUHC26RY0ijuGoEz0gCCmT1ukMl62ysS3NVDWTFe7VIrS?=
 =?us-ascii?Q?AyS8In2BaVgZX7MVG7kE9FNqZNAWFYU5qjdU6KVhDcBx96tCAR17/Rts9eai?=
 =?us-ascii?Q?tnBtCDy6xnL/khhpPZKv0/3Up2yMsZ5C29hbtA+bbjFwuQqEh08d+mzp3UL1?=
 =?us-ascii?Q?f68fW2AvonTqPxelR/7gDCMltC6L+NT8Ug54JKPSftV/NSzsjet1sfKIXm3P?=
 =?us-ascii?Q?GVrmTUfFbkCdKwVvhomup/AI2JWZy2cFgLccRLPlC/OGAuqRqptNvRxFleiK?=
 =?us-ascii?Q?xxKs0zPPRmI3zrTKMYN8xRdmyQY+QSrBuKWCQ6MnsJbC328fSeHMNPRUhvY3?=
 =?us-ascii?Q?rQ41E1/eSNEESHIb7J2DH2NpEiaMlVoAWIFZOHBXdNGQV4+/3rhy3v7Fda2c?=
 =?us-ascii?Q?yqwZdLiWKk4Evk45h9AIuXOyIH2KSeuacyL89iH4LgcvCUPPAnklCT7pdY+r?=
 =?us-ascii?Q?ak9tuPx9XTa+PNCK3wf5zrDrSOGkLP8vHRrjpCEUvzKKzgy2RwjsZ0ryzHk4?=
 =?us-ascii?Q?nmaRxNcKP/5F2pKR1KB2DEAfIj6O7e3vo50iF0VEMcxSsJYgW9Y3nMy/+NSB?=
 =?us-ascii?Q?ns9RPSthgGjqWhNn1POPviSZmWPYHGI7GWnowDSBpWYcSF0wzj8pouIcP+xF?=
 =?us-ascii?Q?6JYPWZL/Ye5J0q7q8P1wrVcGmH9FiZCMc2MgSv5nMpzragzrw0bvfUyGOtcN?=
 =?us-ascii?Q?VVXXro0zZNlrBe8R6ZFsLBl9236GNPtyBfaKDQk4XrjUNZsL9BlP809TAgxx?=
 =?us-ascii?Q?L44chKMGziEwDsEsDbW+xe34qjvBbZKhsq1HgZvonmhleNURCQabVtzugXwD?=
 =?us-ascii?Q?Rsm6G9an8cg7h/katZhtDhDluOQfk5WbEBDq6sqGGH0TgbriDmFJd6lZeLMB?=
 =?us-ascii?Q?XaFmjt51qqcJNoSM2ksWXaFAxHGYUbOm5GihqsEYlFPnfCRoD0mLGgMk/ojL?=
 =?us-ascii?Q?RGGdZNSowTDc9EdPz8rdy97KRT28eax02T1Ia3hxUIhf35S7FQIDMmNEFYsl?=
 =?us-ascii?Q?EfWYrAJ+0edJ1kurBv9jZfkEFfhDqTAiwFTYMj+mIn+QDLlBT+vw9PTUsuWN?=
 =?us-ascii?Q?pSOePpzV+4rneXlNll7xNZsOz1SpyJoDXB3zP6gv2vXNRBKwXEqpkXf5+ClR?=
 =?us-ascii?Q?ebNIwRzcs9Uubl0QrAodk2c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5a0adf-442c-42a1-2022-08de17415d23
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 23:17:43.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qilRDzLk+DuCaK485NWFrgnjBn3AxWrKtnYzJ/RAiQsCpLxAIyFoFCdlP5tgMBAdZsKYwxDtCUjHB9VZkM6FaZgvjrhJIaPZfm1omK7giF5YprJ/VUBYxP0zyDyaCeJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9905


Hi Geert

> >         compatible = "renesas,r8a78000-mfis-mailbox",
> >                      "renesas,rcar-gen5-mfis-mailbox",
> >                      "renesas,mfis-mailbox";
> 
> Please no more generic compatible values like "renesas,mfis-mailbox".
> Especially in this case, as we know the MFIS mailbox on e.g. R-Car
> Gen3 is not compatible with the one on R-Car Gen5.

So, it will be like...

	compatible = "rcar,r8a78000-mfis-mailbox",
		     "rcar,gen5-mfis-mailbox",
		     "rcar,mfis-mailbox";

Thank you for your help !!

Best regards
---
Kuninori Morimoto

