Return-Path: <linux-renesas-soc+bounces-19628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76127B0EE8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 11:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57F2E7A4BB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 09:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E0E2836A3;
	Wed, 23 Jul 2025 09:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EMXMaGGF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A9719C54B;
	Wed, 23 Jul 2025 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753263370; cv=fail; b=NlvTxbb3enEzEEfHzjh0fNF0xSuaPz5CraNfbrVvu7Lxarlq8yflHNqpUMcvSdRa1JA65UoJz0e2ESw0FTToEKbckX/fejhjg/Lapt6Y5sy8Kr3f+F1pRFzT4CzoLdusFDYKNfFMR2TYY+DbVGjOVKODgkjprg0oWCw8dvOj4S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753263370; c=relaxed/simple;
	bh=P+88GGg3B9SGV5v9Ma6F2VksT6zZoFDQnHXQCrPVFng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B80a6fj2+KhlNrXw1svvet9eqEiQOmlZTwgbTW4cCcY9cIL2i+U1v860Dt748+LhkjPhKH63IGyqZuq1OkBT0bFTDJcg37Sxsv5HZeb/ccdc/7+J7pDYOQG59fi6SWlbTqWq46XXmyLhD3L9LJ80OqWPE++Pl6ypkW1JbF9NEhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EMXMaGGF; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOAy61SDLD1PK/yiutXYx78DKUOrtDuZNpPMQxEdQFXiYl82Gx78x2aEzpkE04+3/vHy2qZH4FcIgc85upimnW+46xVgBGb3HD727T7fmAYd1Z5WaqOe6WzCLOS54FeK1eLTqVIUU2zdZb0ymfN3nAqbdUjkXiEVX66cEwnRSsNrsbj+lzgBx7azDhMxT9wlSsxKf4KXHwT2f398Ekp1Uvssg0/wq0rP1M4bznoVLuk5C6tmtriKZCZJFqPUt6SI1zRLbUVuAB9bQDwxNMHj0RWIpTDzgAWKpOwudrmc0gFY9fw77qXWuycDy8pX3H9ItwmqCOiwajNW3afZeKv6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3teEfn++m0F0JltSCyMofCAj9+JHNbLSHMRP6Na9r6M=;
 b=yWYI4Vt9vLZGvul0S8vJAGAHiz2Itsgu9EwnA9Kp1GneaXeYN/EciIpse5dlYX8+bRUn24BQFzt3fMSIRqZbTz1SJBaga6ayaET0lw8aWPaUY3XQttJj5O3V+ZQtbvIIL+3HqHW5lTEcm3hDYC0WgJ/kEGwKCtr/SfwGR6CESFh1mxIGPneKxqh7eMpBU3YBBTXx0hpao70MuDmWmHvbatrb1eNTqs207IPnAW5vSy4Yo56TUHUIz6S1GZqY9GrE4jdMWK99vI9LS6ReGm5fz+MFYTgxl4hvqG78iLxjnKtAFlBJPdqfMrDtPQyg9uGAwrrycCE2tYc6jcm9BLqS3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3teEfn++m0F0JltSCyMofCAj9+JHNbLSHMRP6Na9r6M=;
 b=EMXMaGGFqBs50rZt9FwXAKQ+9TiHdFsQLHttkvZf7WAxvjzR2xygpczrd8pRdUmBRv0JbVGHrMzCSux4ttqAi/XRpq2IQOYrzcUO2RJjYTeK0E3T1fUlZMvm9Yn6/DeziuD+8mjQEGEPzoM8Xlxebrm/0eKHf2GEffPcJIUx1vA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10)
 by TYCPR01MB11418.jpnprd01.prod.outlook.com (2603:1096:400:3b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 09:36:02 +0000
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0]) by OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 09:35:58 +0000
Date: Wed, 23 Jul 2025 11:35:44 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org, linux-i3c@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 0/4] i3c: add support for the Renesas controller
Message-ID: <aICs8JmAUbxFxizc@tom-desktop>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: FR2P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::6) To OS3PR01MB6657.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_|TYCPR01MB11418:EE_
X-MS-Office365-Filtering-Correlation-Id: 533a81a9-015e-42d0-20df-08ddc9cc5450
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uq87vgV3HHkR3DGmER/1wPAAL9BJf0K00FnV6szRflz/5q1MiZ2k7WW3qLE2?=
 =?us-ascii?Q?WJavNbVeXt6ROeywupbJRHaut/j1b8eoo1E0F/gtB/z6yLyEF0cwnpaaoi0O?=
 =?us-ascii?Q?ZgshruOw9LOMcflAFBPrck9N/FZm+Kjb+62Pf/Fi8VYQYXDeJx82aVbbE8Wp?=
 =?us-ascii?Q?F6r6dmpJkbQ8q4wo4QzUHELfPueN9EO2CnyDakj6sO+wo/OQlZr42xsyAo5a?=
 =?us-ascii?Q?Z2XcAIXuq/RsBoMcWQqf+v6kFRnbnm3GsQK05cJbjCqNT1MIVIBKeFdNH7jD?=
 =?us-ascii?Q?2QkKHYAG+O9qj1ObrGmNUgGxQ7ytgQIXP5UUi1f46xeLGLtVFkHw5CM9DA8w?=
 =?us-ascii?Q?hBycxHhD7y1KNHdRnsZqXrbcMTKjC6W62k0/OSe07X1tInsnBVs8xJaF/JOL?=
 =?us-ascii?Q?2EF/2NYjOlhT2ETl5GIAFFmoQDAq8iOPcwIbM2e+WehmzYdE/xNrortuwEpV?=
 =?us-ascii?Q?1Et2Gs9MEXODFWyqG3K7attMeNfFa7EZaEzROAO43QTwBUfKw1XuswerA0Ig?=
 =?us-ascii?Q?O1WGeSqE1YJwBw1bOJ0vL6/MEEEx0BoQUDuiQfRJCWHJL+dWjiPIZauubZio?=
 =?us-ascii?Q?L1HSqn3Tcq87Z8CcoRqRNhrvWXBU0ppkVNS+Qea5sDXAhReO6+UBIQVk8lFE?=
 =?us-ascii?Q?/rk0xrVPrXCkZXlUFssltxWwfEuQ2QQ4h4OZaVRM1rBD5SEKtEE9mnALyIZf?=
 =?us-ascii?Q?a/qlb2HcmZSWbfYBG2zN95XSj9k1AaFtJhN4+6Fk7FwUOHK7kERvTzFJNieR?=
 =?us-ascii?Q?ZzWZsIW8+zpHkonb1v/MdYDMdGJDj2i5k1j+9tQLeR25qnXFRSvZ4LrXPlYJ?=
 =?us-ascii?Q?1y0nqJGjzXnmX0qKbaQgTLVE85le4FACAkvVU2bRTDRGpLDoKd2e+cWkjrzf?=
 =?us-ascii?Q?v09FZyeWAYZbtg6+QD2NrohvLe9tsXwRCLMo0wShYXgpfLpp49wtM6TA9TOM?=
 =?us-ascii?Q?DSoxkx62IyxpSiQBkspIxm04bpXbkFmpxJDd7zo9L18C6XY2i06qAgA0NMPN?=
 =?us-ascii?Q?Mw+4CVdr9OJK3plgTH4dVIuaU/IM5o+S+cChkdFxBqqO9zqToNOss/zQXke+?=
 =?us-ascii?Q?5FmA13mahhtwTbarMpVV954qXQP97+/hDk54CInrJfKW/q+Lajt4vmbLaE7T?=
 =?us-ascii?Q?yfp6wCsFDQXXGXpGDujwCW34jb99YTERgwQ7YRHXkhe+JNpSeX0p6hhPjLpY?=
 =?us-ascii?Q?yCmCblLozfqt5t9Dc7YpvblBLE5T+A+GJOg74SFufVjzx3XGb0qBsree9swD?=
 =?us-ascii?Q?1cQ8XvBXxUXj7ozfpYQQ4Dm2XXffGI2Hrg3aYygaEHSViATC5G68fSO9aZPj?=
 =?us-ascii?Q?3AY+LCQcFtTiRp2QVHfA9EriKFCaZZIYCm9Eb5FOYfNqd5/LVLg4Oj4D/Crf?=
 =?us-ascii?Q?SopzLbDpQuI4BnmFqDjCiljL3hd8QRUiE++IdI5afvQtRSfj8GC6LKkWctCg?=
 =?us-ascii?Q?KWg2r3EO1vjYo8xC3ip83ALG7EGxv/DqPQ0xbo0X1SHJ2B0LAwQZLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6657.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?97UK+JTPO0kRhlG7ngAU97WOpc00AbUh3MK4gsnNVPCPqWNEReXl8As8RJ0n?=
 =?us-ascii?Q?h2qQJAYFmCbafPXRznfGf03s570d+6ZZxPqpum8jMqcaIf+9Im/jMDTexILE?=
 =?us-ascii?Q?xwN85C0bgSKPaZm7bu5unosBtlMLkMxhBYAP9nVVj4TSfoGDpWHSQvVUm4LK?=
 =?us-ascii?Q?2fcvNo+4MF/zA08XogLM/jWU0OCA7KCboMfKcGR0X51SlqgALoblpsDUrgkP?=
 =?us-ascii?Q?cCtD8j4pq/5hKV5lUKD7yNl4/CrS4c+gtgLQixFpjSySFVYUMeEdHsZf0NdA?=
 =?us-ascii?Q?XSE8+C+T3DlYm5py2Lihp9jTJaTKlVsDP8mXauqvGxda9pQdbQqTSIV0NoX8?=
 =?us-ascii?Q?lsEHVXVUWHGhM1yDJXR8AKNmFNvcCkPuNMsYA+XAJS8FA1ipyEqbUVhWsnOJ?=
 =?us-ascii?Q?Q7g+gTPRCnLEJEf4U6msFypeb2Tw6Uav48m2Su9myGn4LqWD4dGZ8LJ2ZvwO?=
 =?us-ascii?Q?7e/wKcQ3Ar6bsOrCfw/gmM+bjhXWJF/ynE3mAjS0VuZgt/P3aIK7saUsbTtj?=
 =?us-ascii?Q?1KfCHZuI4Ahht0LRbk2H/oK4kXMLq/cbw4GFLZDgWcJ0EC3mb8SsdJlcL6a8?=
 =?us-ascii?Q?y1nQ6/QbiK/90pN7Q8I1bdYyK3nuwTXHNxBl359BQ5h2XzjeSdnHmSiRjpGm?=
 =?us-ascii?Q?g+xUgRg7ipo31Zbl7/LuFBjQox8JezBaMjHciCvTdVEFBA94Wi3iarla7oT7?=
 =?us-ascii?Q?ZcEygn+r7tYqy2MCZEWRj6YyxnfUiqWU5INe+AuNpOg7Q5Wr1apA6X+9Lnxo?=
 =?us-ascii?Q?+wSZ3JNkKBO5q1nQlWxDKide22IfDYMLKT3JjxLp7Gdo/3Vrlbi5apFcd6YC?=
 =?us-ascii?Q?WuM9wVu12Flbhu4bkTueImQCkyY12tIyYo5Lx8goCG2rUQDvs4M/AC9BqtLb?=
 =?us-ascii?Q?TUKdsoJzLDy2/0Ew1ERPuLiRl3Hl4ZDkKsnOL61jO1ulWqx6m3BFfDZujqxg?=
 =?us-ascii?Q?dtaZL1if2ZFbJk47vXdYtfva07oULRPopsE1yScSTc0IfPqpMkm0IXb37VfX?=
 =?us-ascii?Q?4ltjuz522OlougO2KbGpu8QrFKmiZTiPnOc3RRCi2gxs+0OEGFJ/w3MrSSd/?=
 =?us-ascii?Q?vQe7IJknTEBOtEQq34G6nilkyU+Lt3+0aWci2BZjKlTYt38yE2hf7EjkcK0l?=
 =?us-ascii?Q?Kb+uxtTqLCnvZEd/qRX1UTzm4szVXwftYzlwLQdtTVYk7iv8snRsOOTjf78g?=
 =?us-ascii?Q?qTEbPRhAhak06h3VRqPosVJuBdrAiYW/1Jpwx16CUF98ZxEW9Ggy+WoUl41f?=
 =?us-ascii?Q?Cv0HbCeetLo3aoQ5wOAOMFe5tvPfye/tAQwCCpBOi/3CiZA/El6nbQAKq3sa?=
 =?us-ascii?Q?4dXyXmp1syW6kDssftfDy0c3mDJz/mahQ3kXBYAR5kb+DLbEZYfKqM6Tngzo?=
 =?us-ascii?Q?CKh92RK0pHddNkFi69FEDbTrD/MAE/K1UYlrB/nzvr1t+gfTpufww0fMPZ0B?=
 =?us-ascii?Q?+8v0GpMoeNAr606dwpN1xdgqFrNouq4Q5ydUzP5PMy50M2gGDk0XrsI92JtW?=
 =?us-ascii?Q?bwmTX0TELrkUGSEaztxGttMhr7F1xLLOwJLKM6rxcVP3RPKcSA0JMWLgaUx+?=
 =?us-ascii?Q?ydeuBk2jWfLm0V6p3tRPUcYGDxcl8vyw5o+RUAVfFrPDjVWncC/Hst6GAhfF?=
 =?us-ascii?Q?4vSuID7ewW4Zmg3ybQ/Kbdw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533a81a9-015e-42d0-20df-08ddc9cc5450
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6657.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 09:35:58.3620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09kctioTp/yPyERU34qBWPHZYq8a3YwDQtppI94dYFMZW6Cqj0ub9RZutLp1GPMmg0mfUPr2VTd2up9wP7yKAH0iy13IaIrW6CDjT/+PeUkTuGbcnCJwPVCmT6tIUZic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11418

Hi Wolfram,
Thanks for your series!

On Tue, Jul 22, 2025 at 09:07:42PM +0200, Wolfram Sang wrote:
> Detailed changes since v3 are described in the individual patches. A
> branch with enablement patches for RZ/G3S+G3E can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
> 
> Old coverletter:
> 
> Here is a basic driver for the I3C IP found in various Renesas SoCs like
> RZ/G3S and G3E. Missing features to be added incrementally are IBI,
> HotJoin and maybe target support. Other than that, this driver has been
> tested with I3C pure busses (2 targets) and mixed busses (2 I3C +
> various I2C targets). DAA and reading/writing to the temperature sensors
> worked reliably at different speeds. Scoping the bus, the output from
> the protocol analyzer seems reasonable, too. It was created by merging
> two versions of it from two different BSPs. Then, improved according to
> code analyzers, cleaned up with regard to coding style, and then
> refactored to hopefully match I3C subsystem standards.
> 
> Looking forward to comments,
> 
>    Wolfram
> 
> 
> Tommaso Merciai (1):
>   dt-bindings: i3c: Add Renesas I3C controller
> 
> Wolfram Sang (3):
>   i3c: Standardize defines for specification parameters
>   i3c: Add more parameters for controllers to the header
>   i3c: master: Add basic driver for the Renesas I3C controller

Tested this series on top of [1], using RZ/G3E SMARC EVK board +
SMARC BREAKOUT board connected to P3T1085UK-ARD, using i3c pure bus and
I'm able to read the i3c temperature sensor:

root@smarc-rzg3e:~# cat /sys/class/hwmon/*/temp1_input
25875

For all the series:

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

[1] https://lkml.org/lkml/2025/6/24/581

Thanks & Regards,
Tommaso

> 
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  |  179 +++
>  MAINTAINERS                                   |    7 +
>  drivers/i3c/master.c                          |   12 +-
>  drivers/i3c/master/Kconfig                    |   10 +
>  drivers/i3c/master/Makefile                   |    1 +
>  drivers/i3c/master/dw-i3c-master.c            |    4 +-
>  drivers/i3c/master/renesas-i3c.c              | 1404 +++++++++++++++++
>  include/linux/i3c/master.h                    |   16 +-
>  8 files changed, 1621 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>  create mode 100644 drivers/i3c/master/renesas-i3c.c
> 
> -- 
> 2.47.2
> 

