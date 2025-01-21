Return-Path: <linux-renesas-soc+bounces-12298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F6A182F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 18:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F8B162823
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 17:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F3A1F5611;
	Tue, 21 Jan 2025 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rLTtRuQb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BA41B4F3E;
	Tue, 21 Jan 2025 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737480753; cv=fail; b=Hg5JcKbms7uzjP3mI2P6lLcdfKDf17X5SX/ZH/uPusmwdSf7UsMNj8bJU7aUR6o7nH0d19FRMWzY8oFyLW66mX14g8D5StscnU/8QuJ2key8TDqG+LWWdTmvVP6YEmKvT7Ca5gvV9kmN+C+fCS5SKYVJylmRhcmMJ7zWyWHW738=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737480753; c=relaxed/simple;
	bh=GGkYDHc1aV929r6jCcG9+i264iTJ+akXh445yf8ISlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V67SwN63NokwUikqo3JoWV26KjAuqa7tMlfRLbl15qyis9vxHcy1trmMlT6SFWgBX2ctu9q56aLCo+7G4TkLEtyivR/BJF4g7MTNZxl77PqlhCuYy1b6mfm6chES+AExBH5CgwbV5ZWWuLGmHQ7UZaCu2Xhs3IBwor2Y62VjXFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rLTtRuQb; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGnvYeckE3COhoaq/+7ldNvkUS8jBknqlN3pUkQNAV2DAesR85xgbG7/T/iZ+yqyFVSwslmI8GnkOZhb3KLhIYdKSTq50RQiyjWWzfl1Ieelp5fqNcz4QL2hf/2qx/dApnDIdaFCJ9qd31Iz5WQJ+0K1+BXYwtwW4A4reUPI0XYVvHs9SlH2ttmeckHRVjHGUAkaipADmJ5NX7rhONRvBBaWSAPQFUH6idCCwR7c5gSJk7py94Z7AeLBxye+w/WXmEAPWLRox0VbWHQTB62PWw7LYO/lawEZ6VcF/ehBp6VYRjoXFV6WLia3nkzesgCswQDr1ix2Vkp1os3Aoi65iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/oH+83HbO8AWIxLAPJbVWCxMsOAs5ZaseHHMHc+PS0=;
 b=IJ6EQiiahITCQHqW8O4uMKrNjZ461M/s5UFFA0OMXOyt6sF7h3baqiRjmZnSggy6DwaffXUrWHRz/2P6elfWWZwfrmYimSkl8nIlQl5b4XweThSewzMrLvx4PSJ10QqNxn7KkCAuTD4MMNT5SgflrplAKcSZ+XWkxSNrepJj9GY7uxAvqQme+5/xfahoepiWYeC8bm8E13KA27l6N5SgeVIPlk6P15c460POUJbnJct5zxHLtyTECP+YgevqVh90Xawu9RCRutO++Wp/NylBOZv7QlxBSB61toXOz5dTIoaDAPBOAfK+MwET/L2r0GYiSGChL6cHXDZ245lzyLyFpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/oH+83HbO8AWIxLAPJbVWCxMsOAs5ZaseHHMHc+PS0=;
 b=rLTtRuQbqYHCpuctNm3gkbz2UuvaDWwekruiyThAM4hOLVUBdlDW+U/eg79oDuKh2bata/bGzoQgPsiZpmH//b09uodYd4WiU8ZNc6AyRLfaIOKRZ1qhG/z/0io17MtWnq6rPDQDsHpHpXww1EEnynZySvwoDAS9KLd3ckC1c38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB6395.jpnprd01.prod.outlook.com (2603:1096:400:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 17:32:26 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 17:32:26 +0000
Date: Tue, 21 Jan 2025 18:32:05 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 00/11] Add Support for RZ/G3E ICU
Message-ID: <Z4/aFS4xGtC+tESz@tom-desktop>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR5P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::8) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYAPR01MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa8a0eb-ed54-49d1-ad93-08dd3a419271
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t5MZBDMaNw5o6sQdl2WS+vyvDvgQ/Nv7703PnnRkRNAbMO/7FJoPX8Sn1++G?=
 =?us-ascii?Q?c6jLpo94GigEzhi5gsaE1vqarZmmp0l9owwCajLXgY072+dv4ZglrROY0Dkm?=
 =?us-ascii?Q?iMHEMAz+Whr4L/tcFgNp+W1bhNZ5Z+nmmvMP4BLta8nqcMg1e3xCjYEDVxls?=
 =?us-ascii?Q?kLrpKFGZ+YRgwGzMqMccL/baUKKK5QpRh6ujED0LJq4+SLdBpH+v8o/UrsLF?=
 =?us-ascii?Q?NdY2YuAPyzVsUgqLc3tA7FkTOvwixGlANz+T7ccd2CljHXp7N+xkgi49Ww0E?=
 =?us-ascii?Q?s4axUiPnll9XptA5OEfyyPnYHSoLKw/CXIqD+5cBZCKsPuHfwgSWK+6B7k5m?=
 =?us-ascii?Q?W++ftmwmGQarSX6INEAQrFqVp/jWSzZQr5Pj0Hn7zN/1aSkSfkv+wzMOQkY3?=
 =?us-ascii?Q?MJP6gQaigf6GGiKwGIkVRJb0l5o2SCQYUmtLPxqyW5xkIfKRUS1P8Wabccyl?=
 =?us-ascii?Q?HsWb+Xo2WYa2zvxIULQJmmWHlNSyRxV4rPSkeDooFtYH5xYKxAokODifHze2?=
 =?us-ascii?Q?1fli9z825cAFkJh7yJsls0cIz9EmnGGiqp1IkWEIznXpeyNv8gWOWVOw/4ip?=
 =?us-ascii?Q?8D+3LzEmsjEmd86RndS2xsfMXKs5G2+nJL+cyYh9TU4Cfv2doZCrHRlj/dfn?=
 =?us-ascii?Q?5OlisegJQI3pNcwNqYvhJ9o0WjrqbY3rpYDXP/mKb+PfeKPDc3PTl/rkorqU?=
 =?us-ascii?Q?bkT+HdtI2K9l1NazsLkWZQbmH+fJfghllOLlq6cfVHBt/Yrv1jkIdAkmrxio?=
 =?us-ascii?Q?eEHr363X5Xiz1ZrnUwrisHa2P7s62knlPnyJnyFhANx08G4SNUaJp732ddlE?=
 =?us-ascii?Q?5UaeSlrnEgiL0UJuN1WEzbPtbpjnWgtSxmegN4eXHGshFRxtuf4pg5M1QHpZ?=
 =?us-ascii?Q?kISNKEwsPo+qtlTihV2LNtrygflCWC0KYezX6vSvtbipIg9J0KpB59pVRrrn?=
 =?us-ascii?Q?1OtuNSXbX8USXiSr0dYW5FkhOtdHk5EidA2gwtauWXa2lM6b3zoN/R300lT7?=
 =?us-ascii?Q?KAho0SfzdIdfvKihWB5S1aE63TugIT6272r1DIf2cLMp18UqonSXMG84OEIP?=
 =?us-ascii?Q?fGEhwTB8keMJ3HhAMTXGlQuO6qaBpdmMP8WGqrMQ8r9xHX1zf4fFUenZjfmV?=
 =?us-ascii?Q?8HR/0IWDCkWsTD86eG4CmndLf041272eWdvcMKfa1t3UNIvKlJYFKFfyPvY5?=
 =?us-ascii?Q?27BF2OtEQCYQa7728TcYR+QC2bY3/wtpmYQ3Q3S8sNeOy1k1T2nJYLP9YOPA?=
 =?us-ascii?Q?diRBkHcqpa47EaxgcKhkgR+ZagOAyqRXHqkuwy3rVekcx2TJjh4BCfUxGpnQ?=
 =?us-ascii?Q?hk4fC+Aorce/XkwERZEtWW98W1/mv9G1c7934teOzCm2YAILdzGou2dpd0uv?=
 =?us-ascii?Q?kA4Rzl+dJTvRk5TSOFipBtsBD0Xc8keZbbT0mxD0JeBjm9Ehl5pEk6+3tn8m?=
 =?us-ascii?Q?SBW0T76gpaTMqm/wqvbGFLeCtZbAw0pJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iQdxmo9bZvpPirM/g68iGsw0qn26qbpG1DL8MyFpMrXZpeZijS0lQp3VJPTR?=
 =?us-ascii?Q?FpUpd5obFIpZfF6SyV1K0Cy2KG4Lz6E1ZPQ6oHLdZXpFpYtLhTNL37OSeigB?=
 =?us-ascii?Q?T95Inv18EMKnTb4SCdSskscldVY2/BCEPyzmGC5+R9v7nRmLANQevTh3W+23?=
 =?us-ascii?Q?k4g/nSYTkUyiTF9AhOASt9LeoCmwarTvbAOP4J6GJGOmwvKAeDLTSez9vOOV?=
 =?us-ascii?Q?IGjbCdIRrnH8QA/w9XLdgUao9eJJsAJB3WU6WkQLFhGU0BJqBpqDXA9KfaJK?=
 =?us-ascii?Q?Nbup91st2gQnZjP8vDZ1M+Ywl9emrrwtpO63XdrwmpvZMMS2bFV7TrqfNHDZ?=
 =?us-ascii?Q?k+KHkXIMAG/in9BsXjnb6qEmMd/z0qJeFBRVE01x8HFIsu3sQfamZBPP8o7k?=
 =?us-ascii?Q?uTRk00ph9Ewh8BfxnjxXQ8/hiFqzkqhRMpji3yXa50V7jPpIbnq19qcJPtzT?=
 =?us-ascii?Q?zAIBs8n9QlsVIHt8XQbKDLuUhwnkVQUxx7qACvq5QIg4d1SvVh2eAMNP6kra?=
 =?us-ascii?Q?+A8aAKhJzuXtjp1B5dqNcSMA4jVE5jxNoBR4N5DbSPkuouJV6xOzlIjBi3b1?=
 =?us-ascii?Q?LmYumUH3gN4fiLluGZRaCSuGneGeOjHPwITQROwGxeR9S0U5MghNNsAAs+T6?=
 =?us-ascii?Q?gSFWFlPmzCiu+ajnvHApLq8njncXOq9STmJ8l9bPa6+YIllwmKyqQ/hbqQsV?=
 =?us-ascii?Q?jknOa285c00JOrw3kbBZBBfVaVj8YMLRYzIGAGa2UkSOUp+FtTMgjBJupFvU?=
 =?us-ascii?Q?vZcWEfHE7x4Y21q5RikY3ADjYud+By9cw9O4zKgsloqNKEKqpqS9MHsUOu1W?=
 =?us-ascii?Q?cAWIhv1hbcprXKEo5+73vazY0sUSkLDwOlaahlNEuZq19ErC5Sl1jxndp1vJ?=
 =?us-ascii?Q?mqOWTLR+rOoqxkdeyVcTrCdRlqOWiKZSNpMb+RGGYytbyhWSLBpd8cCtvvor?=
 =?us-ascii?Q?8aNz5043qw+mOsz4DQta7AV53jfriI/IyOSCmtmhzBLjD5r2Cm8bkp0kvGkD?=
 =?us-ascii?Q?RAsAb+0CSCavUbYF6AAT1sqMqHu1wsk5bvZAuG0zxhxj3VSX2p9dWeL1P4wj?=
 =?us-ascii?Q?S8TeEvE5K4QJzfrovtRgtT/qk9JeBXAzxQY/+gRTVvE6GLXBBs+ts9vFp3Hv?=
 =?us-ascii?Q?ivkYylGt4FtH9rUJjs6tHZg0z7WPWAdzYuLoiM6TuwBOEAjpR8ymO403PTUF?=
 =?us-ascii?Q?a7BcxzQ0OAmO1/a2mUswZjIalVwAQ/kIVylCkI42X1vErn7naFAbLYJ2Z768?=
 =?us-ascii?Q?QOT0cBBWdsRPis5Hw6I6fgW2i3GA5ovZWKSyQN73yqql8xIHK9FWn4fbGY4T?=
 =?us-ascii?Q?uOd6z9Xyt/S+3eBU4bJaGK+eseIq7Yv5iWTIx4ErTl3whTPqgCe62aD3UKN5?=
 =?us-ascii?Q?r2Psf8Skib2LB7YxAEzRfBYsuC3ihQ4HgjAaPMsmGHLtrTPKwjDumncq6Vls?=
 =?us-ascii?Q?S3NxEFDga7LOJ91kpLhWQLtl64IxlngmEuTCDxbvobpusuYpIkjRMaXI6Zps?=
 =?us-ascii?Q?5bjZpz6OVe60Ch3CW55daAdVzc2h+x76Gy06iviXFgG2EZCGKQz8nlrLt7Pr?=
 =?us-ascii?Q?jE3nH4hhwgnzqnsEnkREFxvmHFNTGbXEZ50O6M8TGnKFsjnsnxDE255iaRvD?=
 =?us-ascii?Q?rSkmWEnFkWwIBPUdh4lMiHY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa8a0eb-ed54-49d1-ad93-08dd3a419271
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 17:32:26.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w910jcHPEmv6KsfmqJ/ItjFaT9bPc2k1KdkZ1BmI4w/dbx9H55ImXcerskssA3ujz+eZHyVNjRTzrERNuhqPrwDuI2uCrTR35xSVjyoEmXLJ1XlwBHyXEaP0dzK8wQQE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6395

Hi Biju,

On Mon, Jan 20, 2025 at 09:46:56AM +0000, Biju Das wrote:
> The ICU block on the RZ/G3E SoC is almost identical to the one found on
> the RZ/V2H SoC, with the following differences:
>  - The TINT register offset is 0x830 compared to ox30 on RZ/V2H.
>  - The number of supported GPIO interrupts for TINT selection is 141
>    instead of 86.
>  - The pin index and TINT selection index are not in the 1:1 map
>  - The number of TSSR registers is 15 instead of 8
>  - Each TSSR register can program 2 TINTs instead of 4 TINTs
> 
> Add support for the RZ/G3E ICU driver.
> 
> Biju Das (11):
>   dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/G3E
>     SoC
>   clk: renesas: r9a09g047: Add ICU clock/reset
>   irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
>   irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
>   irqchip/renesas-rzv2h: Add struct rzv2h_hw_info with t_offs variable
>   irqchip/renesas-rzv2h: Add max_tssel variable to struct rzv2h_hw_info
>   irqchip/renesas-rzv2h: Add tssr_k variable to struct rzv2h_hw_info
>   irqchip/renesas-rzv2h: Add tssel_mask and tssel_shift variables to
>     struct rzv2h_hw_info
>   irqchip/renesas-rzv2h: Add tien variable to struct rzv2h_hw_info
>   irqchip/renesas-rzv2h: Add RZ/G3E support
>   arm64: dts: renesas: r9a09g047: Add icu node
> 
>  .../renesas,rzv2h-icu.yaml                    |   6 +-
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 108 ++++++++++++
>  drivers/clk/renesas/r9a09g047-cpg.c           |   3 +
>  drivers/irqchip/irq-renesas-rzv2h.c           | 159 +++++++++++++-----
>  4 files changed, 229 insertions(+), 47 deletions(-)
> 
> -- 
> 2.43.0

For all the series:
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

