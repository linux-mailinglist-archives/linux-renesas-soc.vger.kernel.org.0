Return-Path: <linux-renesas-soc+bounces-25335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E821FC9299E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 17:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 284553AB03E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77210285406;
	Fri, 28 Nov 2025 16:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hWG3upRm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146791A9FB5;
	Fri, 28 Nov 2025 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348186; cv=fail; b=bgsXRKvafmXlnH8fjRnmj6DMrRRWebe1RZTdHQLuDntXfV/Rmxi6Uc5GmSRk869YcBu7al1q/ZC7hGbEiNEcchWuoWJyo5Ste1PVAsnaOUIeZk4nEnyosN5g30FzjN+9JeypMkkTFXPr2TMG/jkMiy703EfGqpNkSOd9F8ZUUoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348186; c=relaxed/simple;
	bh=BWclbSHswna5BShH1kIV/DpyA6zIuDZletFE4bC68DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p2aFCBXrHp74Mfx4iQW1TW/KCHMs0SUyxntZyQIFt//iiYoOU1DchD+OtbWNABpC+R7pLGJgaFe4044twahVrmo8bAeaiDOfcF8d98L4v3RA/yRjD79lgWWXaN9ivMRX91/JVoL5zqWE8yksUMyUiEBCIYV5408u842EPxz/Jn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hWG3upRm; arc=fail smtp.client-ip=52.101.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZpVqpXWKt5LwcWMtudyr+U9Cc7bPRDjdgZ032oY/Nmyas+YQ0nDRPk+m10oB0Tc7LkFCnUspXX6pEIXIKGOtgWE55D4Dh8LWBQ85bnkEhdvQ8JfDNutgjm8tFEbDVbqwc+oEM4YGbwMhdT2JEvdDFxfSh5HtZT/3d+RFcvdBtfVn7SMuKyjSYJyIoobWlD4DPfl6kRgaITzmcE2BHNs7/9Fr37JFVvwvIQroFfuN8KqTrS0q+zrO5FIx0u+AvP8LCbWmLadcmSth0ptyzn0cApocafxvQHEAgLtmL7KzNr0UwPbwcSbEpsepzgzF5LW/BjCdehCAtYas95LzIVCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzfTifcbYdCdJZBa4ESaPGSU6PbM64pk9YqHmaHutD0=;
 b=YE3tLGH5ZvsE34sk9JKz3yV04MvKWPM95kAgY7a97+Mbp7IGJjk1prjKBkr0jr27PObKItL93ua3ZAA5f28j5US+bcEBD//GpCEugTL6wyxEVQ8QsO4J1udRe0Ts5ENVav6qkzL/42kcvgexJatBF2Tf6o1Co1CV04Sc6JtrqGnkO3f6wmUv/q5eNmdB7KhBCvU+OTSCcd1eVZTamLuARCSl91oHP23R019fYqRgKIfBSvlE4/7K0rAvssSO4IhcUEl5qKQcFZVy1SIPFxOFfaaNP0JggcstQl5Sf0m2nsetFtnOxrZXkkG8W3QckGGR0dGsi3mcr02jXWCzW2akTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzfTifcbYdCdJZBa4ESaPGSU6PbM64pk9YqHmaHutD0=;
 b=hWG3upRmMvWFA2FAyOhxY0sGHTPRk1ykDJkKg0HEuGLUZAs+AKWBj+TAHPD+riIg4IMH6fRA6tqkPEmb0mRimxl2pRgXTZrbM/LwcwJgqP+eZteQ2y4GBouintpNFLvUe4PFyRoHyGXBO1diFS5YpgZoHhmdiAGoQdR36BNyYgdw/+tRgoSFmkBlflOsRKH7GhfgitNhx3nj+/O+JRbehnnRat1cfK4RKdFmEO+9biMthewyirzUAZA+jGXqFZqO4UrxTZVyczqV7vU+Yv71GtUfgKXgIZNj8OyRDnEje8oEvlqICdNr+74Md8TLjNeGBg2OxJ08obhTNxn1yE5W+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 16:42:58 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 16:42:58 +0000
Date: Fri, 28 Nov 2025 18:42:53 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
X-ClientProxiedBy: AS4PR10CA0028.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::13) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|AM9PR04MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4a644d-278d-4705-64d5-08de2e9d2fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QhfPGgTWakZuCmVMKF7jWB1HaByJjlXkteLItiv9hah/k5ijcMavTHY5dhqV?=
 =?us-ascii?Q?Rl3W+LKyxppq0QSTtLY0V9Iw4vcxnH5zu2QoF5EJ+zPrX+JYPCytCxZQIyxj?=
 =?us-ascii?Q?unPYew8E5av5M9QdhWeSOnxitxzV9CYv2vWTgCSAfDp4BKRwzb8XoBtaRDX7?=
 =?us-ascii?Q?lfSz2F7kpE2O2duYEk5S4MuDKJEkbrwXlnIloPk5uOGSgWj7fgY9rjYgy6BB?=
 =?us-ascii?Q?OKAbvhK0W5H2/dnbzCcOCii+AF7huu/8yhB5DppLS3GmldtloOEX1pIqQxlp?=
 =?us-ascii?Q?t8QzpM9MYU8fCZBQZfRfrg6HAGAZQlSOnMdtoJkDZPCJ2Ejpbtj0UZbqZV7/?=
 =?us-ascii?Q?gnP2f0Rn++EiJaZBg00tNB3/90RjL95f6ruSP7m+bIHj+daYWOn8c05OVfA8?=
 =?us-ascii?Q?t1t3sx+1C2tmNlsBzAPp556VQl8MBk5jQQITsEBt+M+HfeJwyi/d4qY3P/3b?=
 =?us-ascii?Q?8yDoqs6LHFKIjsnRe3o/rL+yPTHjW4tDVHHYYMoKmeNA/ZF069YCThoSApre?=
 =?us-ascii?Q?KemRZsUqwh1lxGQPT5tEMUB6N59EAQAAUn9jRQkK6JatrJRmd7j9UIXI8hmd?=
 =?us-ascii?Q?cH3lJP1qNCHPoJ+hhSI1FwL84ejDGfyqyu6sBBF0Ru+9yHGeicmLyE1boNls?=
 =?us-ascii?Q?5rugo8mS1XpNbqbiiQasQgVtPHytcw09oE2LcR1kHe1G3sZ/L0TI8EqSnauR?=
 =?us-ascii?Q?ziBjhtF1v1PXJWRXRg8SLokBM9q4gAWtIjoC1v4j7po12oGP8hEzA+8ZLEoE?=
 =?us-ascii?Q?LXaN2vCssoHdahm9/SSHr8ABMzGjSwkLUX/SYrvxL5QKaK8zv/EEHFHqkDzH?=
 =?us-ascii?Q?1a5sfAOlrVoSezecGLzg3gZeXAJh0vbzYliKdb9GWqy3SXrBY+YTn7tMyjGo?=
 =?us-ascii?Q?o94ngReskx3V2dOCAzRtpRz89u8rKaS8LthOsTVMcmOw9k068uz0Bk9BSxPY?=
 =?us-ascii?Q?JfT0Jmkpw1rje1i+dKBhNVSjWK8Pe3MwJmIY7LP3W/hoqE1p6bHMsfuAnX+a?=
 =?us-ascii?Q?lUeby6JzCfSTXy7rCz56FHUMte7KU6fYSV7k3iqTjm6/QtBDKWUn/P0ybCKt?=
 =?us-ascii?Q?Vb7nx6KoaKU3fxpFGCal6LsAZXkk+hht3gc7AYGCAwyoU7zuxRXEpVGHxj2F?=
 =?us-ascii?Q?Tug6o7wEoLGO4xQKvGsh6KNrXN4rj7YRDQ2QmoMcggqo7dOf22imnTSkaxil?=
 =?us-ascii?Q?uXo3x5Zdnbc3gEbyWw75MxxXe/44BJeCiCKOijOgQK6oqO2lZlkiy2gOMZsC?=
 =?us-ascii?Q?Eos9IHqm8FpWq4Zvz9XD8tmjrBRV7Awjrt7GYoLPOaNJHlKaHrDQOp7iLIFR?=
 =?us-ascii?Q?hS47p0H82sYXhdfNGktpdn4X9EWjemQAFqpb4mgWwI7OAW2+IKCa47RZ1H4V?=
 =?us-ascii?Q?fdrkTKGEsaIP7AdABVRr+CFBh+yybuUtwRGCeert/xjVoT+SJrkdIxMPnjvV?=
 =?us-ascii?Q?6VGKxbxetBig9oj+ETQ1C5W55j+ykHtOH1+huwmVyDA8xyo1ZtzcaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZiE8rX3c1RYZ8mTW2w/CUszSwzwM8YGgt/91rmgeKo9LKHxjACI0tIpGJlzx?=
 =?us-ascii?Q?bNzLHyuXZlQYmmpWaRjL6AC5mCHZ3i8Bu2NsSOgpY49LAMWksj2zLAUkcAdI?=
 =?us-ascii?Q?7wz+eWZgJNc20xqHYt5TLF9QfJ6OQSVr9ia7Ncn2hfw5Z4cvz8FvLP5davaU?=
 =?us-ascii?Q?H6s0aRyzZKxs6p20q8ZzbXHMO+8tVsY0eUTvETDayisFXOlER3oM2j7KB7c3?=
 =?us-ascii?Q?leH5tN9/8Dg2bCNH4dGjzUqOTpI/aweCHANvLAM+TPteQ89g6axtC5h0fhdi?=
 =?us-ascii?Q?GL05aHfzERSCftNCep1OEBIOPo+i5YiQSP8jo5W3Z8EQFyLYXV//Fk99LAd9?=
 =?us-ascii?Q?P2J6geeuvj09Uh1nRH3jfTitgCxfKncVyQdNzG9sCRkJYS8K7/BIqIRV4aI0?=
 =?us-ascii?Q?1evPjsL+DN/3DOqOzORR4oRZ45243yX3dvjCjer/xQd68+zrN6SgRAJ7Fy5w?=
 =?us-ascii?Q?HLk4oVNb7ZrpbMX2ZmLJN7YwTBsiH4fe8TPiL2XWlvtvEKEaAbl0X1FxWfEf?=
 =?us-ascii?Q?X7rDAgiWlfYrq2pGRvLulZJiyB2KPbyZ6WEmGBulZVRMB0+FcyoKkzGMsdd0?=
 =?us-ascii?Q?zzLZpbqeyoRsbBeJHYjPlqpzYLbyZkExt5+8BVxbIvwKUHybQUvG1l16Z0Ez?=
 =?us-ascii?Q?ZjN6BZ9C449anDfusQvcN9XC6ppiOTNFuLFzqN5+i0QJ155wRukHbaY4BSch?=
 =?us-ascii?Q?KW6/805A5INJNGTzHL6uU/BWHl1IMkIKmUdxQ6u3iTiXgdW8keGQPnNXNTkr?=
 =?us-ascii?Q?3+WqnWhXNckKDYvC9bt9QBRmdYTD/GVmIt0BATCjUdpd/XCpzhYXGVTp5HKv?=
 =?us-ascii?Q?10hrljD+EGbV5GXIqVq1Djf0+DajV4n3HFGf/JU6q+O73MD6M0Nc+n0Cwli1?=
 =?us-ascii?Q?tXng+mgxh6/40MdgR82SGzm5WPsW17dD5vxk0Oqswv1S7nq/glRcwViFjg6t?=
 =?us-ascii?Q?d5Gioxq8YV8Q2bcAXiG1RG0FYfYrIZlqosDIvKaPtOe8+6lW9NERRzFncwjb?=
 =?us-ascii?Q?s4/KkZjjU5zJjDXhQ0vXDD0XHG760palmcI7Y0dvhJaCnMra4c6/IHEQbsw/?=
 =?us-ascii?Q?QcxIpef3rfqD9RGczJgMD89eU1bECfg0xA+XWXmY920ZOJKhKh1fmeDNek6N?=
 =?us-ascii?Q?rrJJiAbJtF35uoQoYURjgDb2oV3tVKr1CBBMjnuyLuLi8arHcMxhkfqZOi4F?=
 =?us-ascii?Q?3CT3c8vbCMdScBuWaP/7ld7vTjV35IktkNSwMyhUULai5xLziZQSE6vDfZqv?=
 =?us-ascii?Q?XSeTVHEW40wUx/eHskxXN0DH+D4btCH/gof6nzhd8Jt0WbMyBkGfIwpFCbf1?=
 =?us-ascii?Q?6q0EPcgWfEUFjGjg5B5O0u10KRIVtjxEp3D/np3O+jYHvVRSCDvP3gVtCYgS?=
 =?us-ascii?Q?RGvCawTlZ03299WKD5sL1kpM4oXulD4KbdL9ZtZ3fQdsKIu52cEAyrKL8uN9?=
 =?us-ascii?Q?Z7+vgTzVl/MXTEjbFrpbM3HgqD51VzrHWFb+56pHcslb25eg1LCFxqS4CoJ+?=
 =?us-ascii?Q?C68CYUDGZ+39z5Tcfr9OVSpcnKOyX5w302eiJm3F13VL+AfpPkMhSa7csKmo?=
 =?us-ascii?Q?IIn9FcjBkIe8HceDPeTx7W4qExsq25G7wcNGA3Rh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4a644d-278d-4705-64d5-08de2e9d2fed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 16:42:58.4460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQNPLRhK+EA9n08OniJkAtIbzIaOOSBUP6qtUUQxcEyu+xEt7mOrK9+oajlP9E0ytNS8Z5ekTW7VjeJTYrB0ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668

On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> The Devicetree Specification states:
> 
>     The root of the interrupt tree is determined when traversal of the
>     interrupt tree reaches an interrupt controller node without an
>     interrupts property and thus no explicit interrupt parent.
> 
> However, of_irq_init() gratuitously assumes that a node without
> interrupts has an actual interrupt parent if it finds an
> interrupt-parent property higher up in the device tree.  Hence when such
> a property is present (e.g. in the root node), the root interrupt
> controller may not be detected as such, causing a panic:
> 
>     OF: of_irq_init: children remain, but no parents
>     Kernel panic - not syncing: No interrupt controller found.
> 
> Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> parent") already fixed a first part, by checking for the presence of an
> interrupts-extended property.  Fix the second part by only calling
> of_irq_find_parent() when an interrupts property is present.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> v2:
>   - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
>     controller handling"[1] to relax dependencies,
>   - Drop RFC.
> 
> [1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glider.be
> ---
>  drivers/of/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index b174ec29648955c6..5cb1ca89c1d8725d 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -613,7 +613,7 @@ void __init of_irq_init(const struct of_device_id *matches)
>  		 * are the same distance away from the root irq controller.
>  		 */
>  		desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
> -		if (!desc->interrupt_parent)
> +		if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
>  			desc->interrupt_parent = of_irq_find_parent(np);
>  		if (desc->interrupt_parent == np) {
>  			of_node_put(desc->interrupt_parent);
> -- 
> 2.43.0
> 
>

This change irq-ls-extirq and commit 6ba51b7b34ca ("of/irq: Handle
explicit interrupt parent") does not help with the issue.

This is how the DT node in lx2160a.dtsi looks like:

	extirq: interrupt-controller@14 {
		compatible = "fsl,lx2160a-extirq", "fsl,ls1088a-extirq";
		#interrupt-cells = <2>;
		#address-cells = <0>;
		interrupt-controller;
		reg = <0x14 4>;
		interrupt-map =
			<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
			<1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
			<2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
			<3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
			<4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
			<5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
			<6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
			<7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
			<8 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
			<9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
			<10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
			<11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
		interrupt-map-mask = <0xf 0x0>;
	};

with the following being in the root node:

	interrupt-parent = <&gic>;

Ioana


