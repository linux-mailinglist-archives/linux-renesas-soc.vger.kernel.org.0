Return-Path: <linux-renesas-soc+bounces-12529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 441BCA1CDF5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 20:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C56D1632CB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 19:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF6F17C20F;
	Sun, 26 Jan 2025 19:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="j82fA3YH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C3185B72;
	Sun, 26 Jan 2025 19:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737918096; cv=fail; b=dEGxj/IGwr1iFRPr3trISM+TQAel88xoVVJguOrwpPHzFMi5jqoWYZpJQDeYafGHEMjkIKtrrcDtZFWqgSxj7Y3MMuELsFJrWm4Gq10/4YEu/9N2OsvV/MT+x+BWTJHXIXg60f22EiNCY/dNx+xu8A+UPtuQmUzWqBAdbAdArGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737918096; c=relaxed/simple;
	bh=dv+56vGoS8UU022iiXIqQGsddkWLJj04ycK4gTL4oSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZMMza/camsJwVIZPNs95fnS5nXXxopm4DMBKLiEVNMzJTVg3A/ADCptJNClZFBJGbiSbGJZAeEFmuRLWd1bNODz1siP8g5KWxwbf+PCQKTbtvga8Ro6pB1HU4SEr+gkvjs5Z7lA627Y854cXy9pXV6gHyy2fADe6JWg64qUQ7jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=j82fA3YH; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxYcfvr+qoRjVFHvEOi/Cowi5QCLBIg9vO8mn/1QdYQTgkNTgDqEOGjBwkNeyD3SppsVqmsg4WfDJzAZa/XtFfKdNp8eNjzze/mhpilEiqGJSQSjLfeD/Sd8kVm04n9o8W0w3BYhkH3JrgB3JCSDre6pU55Bg47mMvBIkvKwsZHWcQKQ/7UQuTdJOv/B8DQJNIOlIQfoVPx0jEZO+GurF8ZxXDiECUnRwmtcop+eX4/2C3r3WIVKeU5a0H3q9dHtOjo5z2JTwnPlHwrqrXX/tWiPUNw1/TDX6qE7kgp8evk8FgwAfBEJTjKm/dC0drbYTBKceQaVel+m1KFolrBoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beyiWMisKWDaijUlfmgF2Iamuth+5W05DOVZNld7fjg=;
 b=FUF9QQ60+ibMWZyUKan1rkvbQ3E8/GZsFk+4HMRkHcja4kjrDr7cmWTWtriILUCU4BypwL+d7IhGJ11g6PZTA73SnuOzC2FmMWFSOy8BYXIw8t828+W3CxGJsFPZNqmJIoDzkzTlg3lfvbSCnMtAm+qwjBscKu+7rj2djOCEKyzwlToTMoIdZD4DcicFBpIZn9cMqVfhDDhY+/+C3rFXWvKWdA6IJpT3kIWImxVOarLaezJZsTaho4UMQwYkBfW4eObHVr7UNOCJGp2GQBlx1yXb8456M6QuYeUukHw2f+DKa7D2Njde7HHUBb0Mntg44ANUzCjOWP23w0tto2uwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beyiWMisKWDaijUlfmgF2Iamuth+5W05DOVZNld7fjg=;
 b=j82fA3YH4S33AyfX9cbaPmV70Bp8bGNN6Lguws5Fck4WP0PjhmCDEo4AEVlnN9gV1ezq2/Ufdc4F0g70/V0MebvwzI9dPl8u19W7THxOgy4RWvQINsk3F87r3reigzRtAb0F/T3cPHBZmM/oxVjypHNxYo2CdtZuC1/YXCvzoyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB12308.jpnprd01.prod.outlook.com (2603:1096:604:2e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 19:01:31 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 19:01:31 +0000
Date: Sun, 26 Jan 2025 20:01:22 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
Message-ID: <Z5aGgmmH9vVW2YYl@tom-desktop>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-6-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126134616.37334-6-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0423.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB12308:EE_
X-MS-Office365-Filtering-Correlation-Id: 6522be6b-8a5c-4662-6e7f-08dd3e3bd8b2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PBLYZqPDZwRO2BouNIR9X3A1FV2Lh7/MAATuNor8ESgG5QGAo7OiiQfBmd7O?=
 =?us-ascii?Q?fj3xyc60KLqafeUFjWrO1DmsTUsaoAZVfPlAtZ2/G/Xw8YTl10e0QONV/8io?=
 =?us-ascii?Q?63QeEjKE3Hw2aZZMuyvdSfvz7bZPHrBxVPkjJMaLJC5RJkp22zEWzElq4RyM?=
 =?us-ascii?Q?p5/+u5Ksao0EKXc+aAfnwrnLVc1ff6WKdG5/hM6s8tOAeioQbXt1jtRwDFy9?=
 =?us-ascii?Q?JKVM0GSaEOlUoZNlUVmpqQaFPAfF/cXrHGHQtk+kWH8aV3tPLp4VQoHSZRg/?=
 =?us-ascii?Q?9A5O4UE1ftlWae8oC9R0ZAvG5IplB0AVJXr55AzLtAiknQcpzZiotcicMqnr?=
 =?us-ascii?Q?5c4NZj5F/TboT6rl5jd200lzP8VaGktNHRG4UVKi/vClhxq5Ied+BTZxUBk8?=
 =?us-ascii?Q?Sk25IFGmWsi1pnEnMwjYWijAbOmUBhSbJx8JaifYyLtQltVSdomUw//lRVeE?=
 =?us-ascii?Q?zcuHb0njHPFooo2PJ+BIClqpQ1FyDM7SfvxqTNi9jb+kyHpv51D895sKy2su?=
 =?us-ascii?Q?7ptOur2rAMy74Koxb5qj1uEBxSjKdo2GxOQQTHdx9vxvjFKEmkEuAaiQMoPe?=
 =?us-ascii?Q?oK506GNmjf7s0Y4pdh8nOhFGpxWeU4bDy4z1KdLPT0KDMOaAqU1kl6n8Mgeu?=
 =?us-ascii?Q?ihJfM2jmtysEXr9tLgG9Y/M+jqDyVkOHw2GH/tK57u36vOvYZK9mvrXNoe6A?=
 =?us-ascii?Q?/BQhSyh6YPNAFofBumffr4RtoMmNTkHYTpjuvE6TNwTBWQJpeE99UFp6XNRY?=
 =?us-ascii?Q?17m1+xSbKkboDBQ94UbD1dv0ndJCOnnFllb+sOwXN3O77KSv3cRMmWDS8UrG?=
 =?us-ascii?Q?GdlZceA6DEiN1QnXBa4mhd00hdSLhNj5bvK6qHx9rCD7HBPMC4442ZIa8RVA?=
 =?us-ascii?Q?LidqySl1pPVMYEXqzrip7sKfPsc2fPV4e2/pr8GMZwhHsw3GHao5Un37KWI+?=
 =?us-ascii?Q?Bpscp5ek9u4FUxjZ6xnaKqekLKCUHTyR7H52gk5+nKd5GL8jBJKqNBqH5FGI?=
 =?us-ascii?Q?8oOy8J2JtdlFyKS2oOGSSq6xuyfcwdF6hyFXfvPXia3xROxdT0oNOFEqkhhL?=
 =?us-ascii?Q?jPsYfotCu98j4eOlbZmKXY+n4ibyOOBmpFC5yuO2jmPfYXobqKVF+vWcq1XJ?=
 =?us-ascii?Q?HT4rm+VFAQ1/2i8kH5BrmQyKBYUeAXPdbqZE/228mskYOfQT/6IBYX+WJ4rY?=
 =?us-ascii?Q?e2d5Aa2cTp5bj+6HGKwEMhYGcuKcjtKy6jR8Jql7couVopnaGmghvHpQZ3Il?=
 =?us-ascii?Q?XAU3Pt8NoxohavIf5zG6NBiOuf3L5tx7+vmtN5SBV+Bn/CWoDlLt7If+USCk?=
 =?us-ascii?Q?QVXaPm4564x5TMofoFU99NSdl3LXo6SLUzBEaukoYK4DWOdcZDlgVQRMc5eS?=
 =?us-ascii?Q?zeHwwbP7kUuS0LlVarW3bHkxRrW3lm6ku1uelBeLf4ABvu+Syw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mkRzQaT+Z27wen3TwAV9awpU2OWAIsV+QgXzexnF9bC2FK9E5Kq4inwV05kX?=
 =?us-ascii?Q?ars+ZNxFJXweNLdv9J3r7KrEQxz3tXXjy2figq57swRgMSqd5GRJ1NjCpBFQ?=
 =?us-ascii?Q?o20AH8P5QAjf3DxBVAxJeb5IefmFJCzYqNzM1EWszplWj+QRUj9pFcTYyDqR?=
 =?us-ascii?Q?rcnVKejJahDNLd5pgqVe4XE2b+gW0r4g/CD9gbOfoLnl7ErAqazAK2uZ6QLj?=
 =?us-ascii?Q?DmjAw3Q2bT2uAbGTDzmavYqCUXQ/eh0HvwLJgQEcIuAM9aRbnCJmkIEgp9CL?=
 =?us-ascii?Q?RzzSO20RF7CF4Y6QtPwfMSrEtlxZdG6pvxCL1Kl1j7VfYnIVLM/Idrsvp51m?=
 =?us-ascii?Q?2aRurCE4O6zy75mqkz1lci/uEn/3qMX1HYJdcARTXTsQmYoo8yfekZccp7mq?=
 =?us-ascii?Q?uLWHeU75so6igVJ1fRkKdWb5Zt0PbIm9nBtaA+wdPqO94PeCs+OWM9NDtuaB?=
 =?us-ascii?Q?81yEKjuO4DSex8KBVJEBHU5YqJPJzkwOvvYdAv+3+aZYrlPj0D1NvlmEY3Xm?=
 =?us-ascii?Q?u6DStRQzUJFcrAHKYcchEVCWFUo9rNjif8KgZ0OMpQZnKzG6tu1Y2tsRVBKM?=
 =?us-ascii?Q?LkJowPs2RJSifHcVRU5GDnHg34zHkr5J3GbOaEom5+yxf14dfwmzyrG+LtfL?=
 =?us-ascii?Q?f9s0PRE3qRYVqHjy3C13za5HVSQFPDi18JmdDPRQI+ufEynxhCXVCmYXPPMm?=
 =?us-ascii?Q?ogo4AyULd8fnBTocFDCOJ1izbd8kmqs0U0gR+HpGUHV1U/nT/Q+vF6TG5XBJ?=
 =?us-ascii?Q?mAryjDBKlPJI1LyY/tVRyC4sDVE8MULJv8w/ATSEDL9D4E0VPsbn48UzmoqY?=
 =?us-ascii?Q?a0WE1zWEvsCv8UnMdjjtWKGu5u92qOTw6d8btLg+Rju48ObeOqFB1vJjBdVM?=
 =?us-ascii?Q?VDC38i+fG8elf6ln6QC/hXiIjQzGkGlOjfGGdXqD+FHa3eLAr5qhKwdobcUe?=
 =?us-ascii?Q?YGeXcU+1bOZwzSL7vQUu/hvGlpUteV3IFgwQQGfy91cV5+g2AaHEXSPM1u9L?=
 =?us-ascii?Q?6fcawG8AtEYblq6HgweERnQViWFtXuRkzH+GejSulDcmfKK9K4gF81piU+fz?=
 =?us-ascii?Q?DwUbMWLGnd846JbmlznHxVbyji6D4vr/dw7AiOz0FXazRqf3qB7fyYQ06a04?=
 =?us-ascii?Q?is6Dy3M8q5ULN+6qevep+vMb2w2M9j/rq31yfdhRlPepDWd+/bRFb88sdNE2?=
 =?us-ascii?Q?veqMhaOogFHMvG4jQ3+osJrWLb3275jpub920pH9E+7nYMxK/SQDtd1idzCl?=
 =?us-ascii?Q?LVT2gHbfnCqFukM9kIJub03wM75TJBHUEhN5NXkyiRQ7rDn+KGl4Ybwhv86r?=
 =?us-ascii?Q?uAXQPbindgVHFFkf88BXqwlhzFj03h4EOk9NbCVYKWUmPvAK4uNr4HaYUWZT?=
 =?us-ascii?Q?M3o+GqZOULpcTY7waJqvg0wLki23+L4Ld8e4Wlpm7WERjYEkmRhVIZJjsXDA?=
 =?us-ascii?Q?1uThwtrB+OUMmSrUrCW5eWaXFdHDjqSf7WeTwaT18dH3329M32yPWimP2U8w?=
 =?us-ascii?Q?kFnY1HwbN3UrmJSenLcZnxrje90FjbYHyGCmkOF9dDaRpcaFra+oVnrACFkQ?=
 =?us-ascii?Q?/4A+eNg3MBdGnw6OzCPemVwDn1/TAzDTblhFUt0n8nlz8f9sGdRCGFf6agp3?=
 =?us-ascii?Q?rhXY13G2VRTvaWtF+HWtXZY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6522be6b-8a5c-4662-6e7f-08dd3e3bd8b2
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 19:01:31.8975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrghXjqAJq4KORN5IgLzJeB6zU6Pxl5jOjtiZCi+z64+bhOAqOAo8DHjzxESEPtJ8sL4Y0iD3lkQUl03pOHEWaB3nLDXjrsXpXvmWJ09nbhd1nKb231yxDmYaMa6Jfo3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12308

On Sun, Jan 26, 2025 at 01:46:07PM +0000, Biju Das wrote:
> Add SDHI0-SDHI2 nodes to RZ/G3E ("R9A09G047") SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch depend upon [1]
> [1] https://lore.kernel.org/all/20250120094715.25802-12-biju.das.jz@bp.renesas.com/
> ---
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> index 2023f70d3329..099d13b83f18 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -518,6 +518,63 @@ gic: interrupt-controller@14900000 {
>  			interrupt-controller;
>  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>  		};
> +
> +		sdhi0: mmc@15c00000  {
> +			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> +			reg = <0x0 0x15c00000 0 0x10000>;
> +			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
> +				 <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
> +			clock-names = "core", "clkh", "cd", "aclk";
> +			resets = <&cpg 0xa7>;
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +
> +			vqmmc_sdhi0: vqmmc-regulator {
> +				regulator-name = "SDHI0-VQMMC";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +		};
> +
> +		sdhi1: mmc@15c10000 {
> +			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> +			reg = <0x0 0x15c10000 0 0x10000>;
> +			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
> +				 <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
> +			clock-names = "core", "clkh", "cd", "aclk";
> +			resets = <&cpg 0xa8>;
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +
> +			vqmmc_sdhi1: vqmmc-regulator {
> +				regulator-name = "SDHI1-VQMMC";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +		};
> +
> +		sdhi2: mmc@15c20000 {
> +			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
> +			reg = <0x0 0x15c20000 0 0x10000>;
> +			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
> +				 <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
> +			clock-names = "core", "clkh", "cd", "aclk";
> +			resets = <&cpg 0xa9>;
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +
> +			vqmmc_sdhi2: vqmmc-regulator {
> +				regulator-name = "SDHI2-VQMMC";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +		};
>  	};
>  
>  	timer {
> -- 
> 2.43.0
> 
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

