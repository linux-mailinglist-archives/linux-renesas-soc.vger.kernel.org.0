Return-Path: <linux-renesas-soc+bounces-9974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 994919AB9ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 01:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 230F91F2382B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 23:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BDF1CCB4F;
	Tue, 22 Oct 2024 23:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wbraqi0s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F2130AF6;
	Tue, 22 Oct 2024 23:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729639230; cv=fail; b=rp0rnb033+rphZg4zDnSmJrd05zyfa3yxwyXrVNdw0ONkXAZ1q15Z4IghFaUBOKgqrkU3hNoEqXM/R3JTiVXdmfN3lLvbVDAUAq0UPUECHqN4PoncwgxU4yDTFOahF2aIsyko4cYKyBMZlAybVjZsBTR8B1+zvEdVlKPyab57hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729639230; c=relaxed/simple;
	bh=I5LPu4hOeSqaXOSh8QJAKfxQOCKBY6eTFBWGyCplBoc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sHc5gWePXcME2pvrPiDq+tpgs5ZJV/WcmW9t7rxrZOGiUlaPHQsjWB/qWjq1ef/Y0NgsnLsblOdMWJOTcnshjQRzJBn39k+oChw+4gLQaPzbEMLtfDnUyR2r7f0ZXSrlieRc46ZplX+BQtCpyIYFghW2tzEgT+gbxYEnN+pSSUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wbraqi0s; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyQqvoUD9rpfZCSMqoNH667RIzuVHNjrPPxWP16NJdgsuENkSQlvxq+vsnFeKqksDFYFKeVGGmcVwYfko9RftwZPjRneRxUAmVgRQfJqkBsfQ36YkGD6cMvbYPbRLyyIIiOA+9gYPB8gaqhu0BFzj8ywt8dUMZPvJMsJc19xlwrggI9gxyKc0qy/UUZOEmGpNkkY3WCvyxdARgbcml6LuG8DgCX4pE9jVqkWOI7LG4mVABztNldyD/jmXjmeayD9zbDDZ1OBzvowVtPXWinZT62Kzr/jt93L0Ou3rXUdXD3FrGvOx3TjGdSNCxW07CUN1dSNfr54BLWPLSldCNkhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7whneVSYLQzn6OuLmApQ/Vzrt1rx97bdDi1czJ5VIYM=;
 b=sDlE1MuBobGUPvNbWBo/eYxAv5SczJhV3B8G3IgQN4id5MJ0VUWMhVmcQivafrhdwSJd4WFeqdmGC2S6Zdk6dH3tJKe2hAkStdbDno67Ifw/tYs7JKsgU/7H5tilxTzIj/Sn38sBqKamTFSeZFpZyGOw/Fq2bdsNX8d9dKlHnoVmdF3OxNsZ94/5V9ua5x7UdOq6jDO4A4tX5s0pxYWwY6zgAo4dnsWD1lmvsoKl7d3Npq1xxwFAXfJaykl7d9NN8Rd4j2tcnFLZLbaDUzEcb3qKEpBSknBCIEddyE7AUQYUcitAEfoH3UvWpL0tKsB1uohNEcd1sa79lg2NSDqeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7whneVSYLQzn6OuLmApQ/Vzrt1rx97bdDi1czJ5VIYM=;
 b=Wbraqi0sAHwy/YnjJ1L0zwQgY+kvOyt8JnJ2zbTKZE2uDmREN2vqAqzvvFPickL8z+HjU7Sq/tRZOgvtAgcSoRVSaqhMmwalLpFBiMBOBjCPsZV2hTB5uvN7CTNDdZCp/dt2EjRW8zBxe27E7/Z7bHnq5P03PIko6yD3m+eazZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9412.jpnprd01.prod.outlook.com
 (2603:1096:604:1cd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 23:20:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 23:20:23 +0000
Message-ID: <877c9zybbc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC drivers
In-Reply-To: <20241021201349.395022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20241021201349.395022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Oct 2024 23:20:23 +0000
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: dcfa66e1-d25a-4196-6ddf-08dcf2f01abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dQToKQaEzs32vk+5a+Z5wp1tFKuYPzd/NqQ5DrxqodK999Zarbn3b72dPNqv?=
 =?us-ascii?Q?Th6tm3it6EEtDwcdVq3O8juimJLlRtEbfbEo6Bwctoj6SOG78JItFbkacvrd?=
 =?us-ascii?Q?dzcIVMG8fygM/HBZO/u6qPGfcTi1LeR6Ng89WP6yKThP1rouL/ctPcXUErGr?=
 =?us-ascii?Q?fz9vdVo9NR5AHlFSpwxqtdVKNoztxJ2vjmAFrP4u6vAtoDtFflDv34n3qfEz?=
 =?us-ascii?Q?J0fbo7TXqO0z3RwdQLWlPZtQ6+xKvW4LrYhaZahJoPsOMqXBFEYZkL7qX6pa?=
 =?us-ascii?Q?ZzwlBPb7pSu5uT2CTZJPff4J6iE/1R9fNi/NlhVtjbekOQy7AciHdXv4HrkQ?=
 =?us-ascii?Q?b+g+/+pA1OvZeMrrSz07EOkcb3clHbbBhk4fj2D+FlOOWJHNeUex/M3UOUh/?=
 =?us-ascii?Q?/CaOnmsf3J912kG3naQkTsBMoAkbxDWYvDu8p2NASrPdEFkniOY19I4VBLIK?=
 =?us-ascii?Q?42Pon22pa7JnuiDHslI4/J2957/0gNdW8f5Y6a2RmB1iAOkjFVN1GfnCf2KW?=
 =?us-ascii?Q?hiDx22bN08p8jIfcQMTDWxK8kC74MPixf3SysF1JsEEyDI/oV1DSKwrVS/vf?=
 =?us-ascii?Q?2WJ/t6MR+vpU8zvW7mPVgVNNNhNzQF2ynyjXzSZpQiTrxX3SWsm72YPKKuZg?=
 =?us-ascii?Q?VGinYTirsKvbKpDUQSBtjdVl8+L6WUzj0XnsoumqljWt92958Yo7AQPoIIFt?=
 =?us-ascii?Q?Bvkj3AHEPDwDt3PvkQctN91tEI8eMaPbMey9fYvnY4AmWuVJ50lM+gj0MEOR?=
 =?us-ascii?Q?y8XQWwe3ZxmTkdZEXtsUCXwvu5iqdkES6/3kNiaxVZI0BGFOnZZri/b6BdG6?=
 =?us-ascii?Q?Zl0Lb+UcIM9TM7/m6E8LnHJ8sjkjWjQc/8lN7QJdHDpIUoIKeYwKj5PAQa2U?=
 =?us-ascii?Q?MdNihxLvVCShvHce6Disx72A4oCaGxel6EvqyHz1ToOIOiK2sjJcJOZ+HExq?=
 =?us-ascii?Q?oVJ0EBP8q+rH9yBoOdKxSFzFD6/odhrym2XTQ/5lAz3TKUwgYlJ2INFb/Z52?=
 =?us-ascii?Q?rP6ejF8H0jG/+IR+xzmswSb0rSxkrnccWk7LVqutEgoaWA2friksDT4P5YQx?=
 =?us-ascii?Q?PZ9kdgBftA32+fX4KHQZPAqzZppFchgvPa18qR7uqcZZPL+rIbP+FRnGk0AB?=
 =?us-ascii?Q?Dd4uDkegmhYK5Yd0JnusspzLFb9VVMUxuK+4AzSSPziierAf4HjNbnMm/vz5?=
 =?us-ascii?Q?vwpjyXRGbTrUY3LcB/B7sdNKW7zk5GVoGnY8byBXDLsPOwI/sfESEbZ1CQXJ?=
 =?us-ascii?Q?gv6wHA80pw8uogPqF++n0JMcN1R5+Zj7LJCCA/bA7+S2KOazW0wCbVQ04Z/Y?=
 =?us-ascii?Q?Vk9nlvfyLtr9GP6Q1PXKy9Kz4bqMn4uROX1EMyPSCSh47l/zftQ6F71T6u8f?=
 =?us-ascii?Q?F3XD/OU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yquV6fmaTCHbw3q76w3Vpmt3lXSNi/pnerWPW4BKLr/Mor9bmsq19FaKnA1K?=
 =?us-ascii?Q?SObdptXAkgJ8OyzPQvWkBa8HuMVQ2BmDxczfgEBfRso3HCeTLCkk5SpirPEW?=
 =?us-ascii?Q?ILQDu67BX32bPX0wRtxFbLa7HHLY3yAQNvrbT0gaRTzr9jHybxH9ZBFnhvUJ?=
 =?us-ascii?Q?UHIwWxL9KKjL6utWAy42da5IffuZfbkf8lKaq7mSi/eWGMALI9uHVlY8dwIT?=
 =?us-ascii?Q?33FXoSQ9xQGHpz66iynqk2LMXADQGvG5tI+huRSRIv2UzxtWynnCn2VR55F4?=
 =?us-ascii?Q?K40CeMd3OBSRd6EMHphosa/1SSukKg0NxhRiZ3Te2Z0jeBrFzuvp12wj//xM?=
 =?us-ascii?Q?/0+tR7E3Q7nAwkVo9cEeZ5iEwprZYOYTbFsuJ4PZEflBojsyJgtftm+QFf02?=
 =?us-ascii?Q?QFMQk042G08r4CaLzSOsyYlmSkowJruk4dRF7i6EU5M1lkXRvPfoM/C354fW?=
 =?us-ascii?Q?eTW1Hq6BXre53s3E0hFXMog+nd5G6nUtQsCXMQoefDKIyax+U4EWDyXi9sEC?=
 =?us-ascii?Q?AGnULg8GMlv8XDHmTRFwBDvgllLqlWoDct8OM9kY88mDsLf8OYatXKmREnbs?=
 =?us-ascii?Q?wdcvGr/ryI7AlD4vV3lLP8UK/1C2ZWOTIesbtBRo4tb/hzVtU0QejQ/EQTNh?=
 =?us-ascii?Q?TMSIcfgkT4mRoR51VQ8zIgP17gU45iphazX1M9zCrlTU3ssf5lCLDVjRidfm?=
 =?us-ascii?Q?P7v3J+oYuSiaALOKGT2JgqSeZ7bj1eXj44iWA1BZAT8qYQ9fgG5qnk8G0LBT?=
 =?us-ascii?Q?KTyh5zJdweZ1FiCvBQdZNuuWuGOOjUZ9ocKCkyfIY14vn5L+yHebAgX2Mtpc?=
 =?us-ascii?Q?yIIq/VFIDPaPWOxySv57nau97sDWxKYk2zKev7IzfBDYaTVYSb+4v3/j7XGY?=
 =?us-ascii?Q?8pELoAeC//+KiLVUrHzSQCNKN11V3iaF9CUwfaqaoAzKJTBc/4Z3GrNYtLwT?=
 =?us-ascii?Q?4u1CvWKssIU8RamypZhpW86A5nDI2y5kJlqClX1tw5NlBpDIRSsWFsajtjcA?=
 =?us-ascii?Q?Qa9U1tE60VkRHG0kugA4vaBME0dDbMPXqy1lAERmxEF79JxjtL4kdYMnKfjA?=
 =?us-ascii?Q?Gn8oeOpq8LSyqxpRpocBL9giLud7SfnSeFZha5PEk3q7Nd8C4ltrX69W/UYJ?=
 =?us-ascii?Q?XSi/KU5EqQ6uNGyrNbR1hxgxG3GlwuPTAwmw8ps3gWLiHs/OnehrOf+2qHdW?=
 =?us-ascii?Q?dyqQtRNwdQf9oy2WlgNuVsspc/MUjXeTP4Okal4sWmI0VbIfqdN4ZiMy4Z1i?=
 =?us-ascii?Q?aVi7xHBHhyHM+BP7yTKMQBMES1zOGkYomoBv+Je6uOJiUJD4H10LtUMmmYzJ?=
 =?us-ascii?Q?cZvSGf4OJO+WHm3plx8GFCA4Hw7PYiNmiQCy4HTNIpClTzJxWmrvB07BchF8?=
 =?us-ascii?Q?d18ZeLenRan1mzffYIS6pr26a1/XS3QTxVzJbCw9LmuPs+goD0XBsovVkR4m?=
 =?us-ascii?Q?Xa0PMJJBe5hmF3X+UJqjgISnbaAdD99Z3Rql6yhgbsKixNL1yGBdhUpOIsaR?=
 =?us-ascii?Q?zF8tHFmrYP/G1NNHQJsXQj6vyAlzTaWvtqHMiTryFs82Ov9Tx9dYXGuQAw6R?=
 =?us-ascii?Q?c3SLyCFQOixYvoXKKBZUMd9ArYub1JkgPQp0Huv+Fyww8gy/+NHPKPbPNHr5?=
 =?us-ascii?Q?hvxP5necbRwnm3vWX7JTQz0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfa66e1-d25a-4196-6ddf-08dcf2f01abd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 23:20:23.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYfVBqYXlLMOKuZKeOjYBKR/coPwj/xGgaXNnc8U69qGmsBBiJCzGQJmdeQNbnGjuAL8aJFeb/G4IfCIqSFH/z4Bz3OdfNO65Q7UGnn+/3mPdxsvExH9Fyzi0+RymVJw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9412


Hi Prabhakar

Thank you for your patch

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a new entry to the MAINTAINERS file for Renesas ASoC drivers. This
> entry covers the Renesas R-Car, SH7760 and Migo-R audio drivers, including
> the device tree bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
(snip)
> +RENESAS AUDIO (ASoC) DRIVERS
> +M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +L:	linux-sound@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/sound/renesas,rsnd.*
> +F:	sound/soc/renesas/
> +X:	sound/soc/renesas/rz-ssi.c

Unfortunately, I can handle is "fsi" and "rcar"

	F: Documentation/devicetree/bindings/sound/renesas,rsnd.*
	F: Documentation/devicetree/bindings/sound/renesas,fsi.yaml
	F: sound/soc/renesas/rcar/
	F: sound/soc/renesas/fsi.c
	F: include/sound/sh_fsi.h


Thank you for your help !!

Best regards
---
Kuninori Morimoto

