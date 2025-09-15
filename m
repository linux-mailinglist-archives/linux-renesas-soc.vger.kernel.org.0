Return-Path: <linux-renesas-soc+bounces-21880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D3B5889D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 01:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8159C3A5319
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 23:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2022DAFDD;
	Mon, 15 Sep 2025 23:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P/wJ+OBk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2049.outbound.protection.outlook.com [40.107.113.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD12582;
	Mon, 15 Sep 2025 23:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757980325; cv=fail; b=nmt7kXD/nSxnrPnpXgSovLeqmxifaYho8nKdaBwqIoT4gYM7GfUcv9663Zn/Iu1bbc6wQgiEVb53nPqLxkhFwUEyM8lGqElCNjgEu3m6Jv+RUSwfEKwtQzH161K8N1ZLaRGq6O9L+TEXiPyOSKLq7JbgrVLnRBKvMDiPt+lorcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757980325; c=relaxed/simple;
	bh=XfTgL+6mr6hxbhfBFy9cpEYY8nUKbhK95tMtp/013AA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DbUkAWMbAVQlop6pMHlregszD5AG/7C4ZN+t7joEUmca0o0a9u0PabipK2UBhkui27O+WcF7D+z3cEpAn+/rqkIUt6eaz66CG6n0u8KUP68HsIArsAK4eYMf7Qp0DA0RPFcgMzSNvJ1MEkh2/q+an9eirJmz9KuDHwQx6e2E/Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P/wJ+OBk; arc=fail smtp.client-ip=40.107.113.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YydEifM7nBrJvONCW7bZzHktxkOfadQWri0rlNzsGRG28Mf4d/lMZe5iHKoGruXTiUjh1GgFFyQZ77bV3KALgQQdGbJQvSxqkA9rlHHjTnFYmgT+1BPei4KRusOXUVHlLlEH4AvUmLvtT71sQ3scIJDeQ8mypXs9PLcVGf1yWj8yC1Y451Md1PE/Jprni6CpjaxWLrLEKstJ4CgQEd/35+6pm8BTNXbEHe9krsAnDraObgPIlJjgeOpq/v/5zrWIXfTiEwz7GHjFHjfiTlXqPstTDRGxlLSYay0nOzBgyd6rAqQcAhOQREpaeh60W8KiWI/TD2AqnhhuSgfNF0QvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=553RYV0s0bULzWXB4KMfmVlM1lZ9qrp/Zr1UXgWCNgs=;
 b=jorDWyVLR44MLpc2iqL8oWsdyV7GcZUNa3qOItq3/Z4vPtffjRIuFwsjAwz6w+EhNGAzIS0lOTA81CVbqD1nGaZnBpxwwuRtHwnz9+VwuFcnejeRVBr0qmgZhNijiC4he2bcUlzuGTicTKnl3jKy2hYtllRIcMAJGxJc/avGScDLiIkpyKTpJ1W4HZbB1mHkqAsLq5XXjZyhUZnqlxuOOYNGBPtS97UXoUepzCSg2nnyWa+IBQIXhI7DM6WsxCjkD6CsGxddsWF06fN1yQ5jP5L8OqBTbVepfmti/TTz/hofyKAs+X5VVE2w+8ltYSwGs8s4x9Fz5kSs3Tf1ljL+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=553RYV0s0bULzWXB4KMfmVlM1lZ9qrp/Zr1UXgWCNgs=;
 b=P/wJ+OBkXtEqad13GByc+rYaVdMdMfsVG+yi3o+RnzD8gVUshfTVaxzIk4zhV9Yc6FfvCNzMpkrcY3WCONnEqk9Q3YWhsSQQ6BkcLuhV1c+us9FHmJxpD/tLWBk0YpQ+ci8ZvKN97JDdw+oRhAYnYVQTm+811TuiqOtl5rIRaYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9747.jpnprd01.prod.outlook.com
 (2603:1096:400:22c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 23:51:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 23:51:58 +0000
Message-ID: <877bxzjmub.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: <87ms751z28.wl-kuninori.morimoto.gx@renesas.com>
Cc: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan CHen <chenyuan@kylinos.cn>
Subject: Re: [PATCH] clk: renesas: fix memory leak in cpg_mssr_reserved_init()
In-Reply-To: <20250915131214.3160-1-chenyuan_fl@163.com>
References: <87segx256a.wl-kuninori.morimoto.gx@renesas.com>
	<20250915131214.3160-1-chenyuan_fl@163.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 15 Sep 2025 23:51:58 +0000
X-ClientProxiedBy: TYCP286CA0080.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: 76159f22-985e-4c39-f76c-08ddf4b2db8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YYhuXqneEqOSUMEZZqIeG4jynNJx5mG8uy+XL+BOtzLwI1z8JNT3F7VfzK1H?=
 =?us-ascii?Q?5SH5mVY9y8uDE18qzQpZosY+Iw0ymS46tm9tn9D9ou97X/4ABv07/tteixqV?=
 =?us-ascii?Q?AmrRg1eSOEjxOPvuMig3a19ZWsyeD6LYJO27j0iezuMc6OIB3XfomrnSEd5x?=
 =?us-ascii?Q?PVAqTtzMbutFTYN55NnZ0yOyF6oIG5Gfp4QZGztXJSjxqu6R2xbstzn57Zwh?=
 =?us-ascii?Q?VOFCvkdyITbe5XLYiPKDYqgkKOcKUPhU/0deQ3wvHd19Z2F7qsVO+t0WJTx2?=
 =?us-ascii?Q?dbgWWWdLK6fDuJcLIgneAiiBySPKLDxqsrsCcaBKiy1qKv6ihgbq++MnRkUd?=
 =?us-ascii?Q?BozrOrFmStw9sCSsNQzmdNf8uD6ksDc6+J0AUa6UbhiOBgO0wCbuvC5WKcrp?=
 =?us-ascii?Q?7Nq2gOOfmwgWDHndKyqdME8g60cQxZJ3Y4/LlNQSCmjMytNz4JUeggf1UOXD?=
 =?us-ascii?Q?LVMtj26J0xRWNPnSuYgxvutbmCSVbBu7Lu5P2aTG5xzRHtG7/Vkp043OIKhJ?=
 =?us-ascii?Q?Pw7uzRk62qbKYrYj9ZDvI++K0gKkHM3cdMJSbH4dAmMNa5imkNmIirjzr8G+?=
 =?us-ascii?Q?9alItDpWYPVYwSl0si/vcbigD4N5e1ARknOTlYiydo/iC/xzX8NM7gPWBlo+?=
 =?us-ascii?Q?5dUIrb9bI77xnnMAMjTD5izgtvj2qI0V7PswuzfIq+esbqeKY8zJfR/DwLaQ?=
 =?us-ascii?Q?H0spH0U6xp4b1cUdLOaEEY5hmPUktZYliXgRD0MfmrWRGnuJp5LT9n7HFtWt?=
 =?us-ascii?Q?pLYuSv17u3thz+mAhvbG/NqTVOhjH3TqDlDKKQ14Kkll10tBA5Shr+IXzsqj?=
 =?us-ascii?Q?tyGo80k0l+oKjxk5Sx6rNOUFfBhkXwVpGGD/HL6Aq0DRHcmlwva3W+PugLvy?=
 =?us-ascii?Q?AN7B+TZO7Pat9wwVpP4xujApzkk7LF7u+UKzDf9z93IuliyWKjKg1oHego3f?=
 =?us-ascii?Q?4dTXmF1OJJzXTnX5WF93wtMBndHoaujkP2rBQdeBH2KoCIQSAoAJpGIwYBnP?=
 =?us-ascii?Q?N24Rnzsc2yVAmIYNyOzm/EWZ6eAMMqOHoeuv81rjRHn96lAYH0aPInrzwcdg?=
 =?us-ascii?Q?NKo2BDsEeAlUM2b7IOP5FNrqao9dHOYWa6z1YU1SMznC3iNc8/7XR7YJPm03?=
 =?us-ascii?Q?EVUtkDssrpR2z02pomOCidQjv0lV9fbIl4Y3hh2noIH4pxadtA1feLlj3x92?=
 =?us-ascii?Q?3VaOLGiJm0NjyIuoBOyxMuuVlpzQq2c6gUjtxNAfKC3H/n6JOUUaNx3DqKN8?=
 =?us-ascii?Q?uOKLPb3/VLKUBpyKkEuPpsbBG5Tmt1vvshjrglJ3qHc60istKYnTO4JFO59x?=
 =?us-ascii?Q?HyL2GYvXQ/8lxSyrX2hKT7yXaC3EIJudeP7PIql/S9/W9TIjFrIRHuWMJDfE?=
 =?us-ascii?Q?ht6C8osAB3sPQ6Q++5qra5dItzjcJV78jaw+7lH6Lvj1ur5Gi6yQ3zdVHmkI?=
 =?us-ascii?Q?dxuRirrNA01gjHrEhS32i9VyGJRIjuPUEHBb4QRTi/wH6xDQsR1Qnw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?voeFVMUqOnlLtilW1F2GXYjpP113Bir/PAmMGrEuZOLgL0yI9546Jjz37Pia?=
 =?us-ascii?Q?TjyHor84Vv6EJglYsbiJwhc4hiE9CIB1ybSOwJ+cd8A2joD7Azitv7M4BA55?=
 =?us-ascii?Q?eogp7vXjTwYrbYmb16Xk9U8QkpVwux8zE+brpXSfvj3hRS7Ppzw2Ww31hbeG?=
 =?us-ascii?Q?8kaxYN9OzzmoWtlFuRUZr1RKdz+BZLXmnzcJVumHhOAuwLbHZjTZoT5a+X9l?=
 =?us-ascii?Q?d9nwbUH0ksYxAHFpZlL6M9xv8g5ZHXgFbt36m7lYhAYlDoVPSBE4JfwS2mG/?=
 =?us-ascii?Q?kOKgrs0p8Ki+1NWWHUWKrYXK55Nbxsk6Fp5hEZjxgQp3al87wCinGvjMW7j4?=
 =?us-ascii?Q?kTzonryGpbzz7ymm0kusAYvBGcLDN9ZFIXmO3Faw82/MhVTHGdxeiOZM7p33?=
 =?us-ascii?Q?47wecpH1QjwCMPrFJXaes1PDnDwEm7cvzk81JGnIbV7U4J1cKhHh0qggDjNw?=
 =?us-ascii?Q?6DWCL8QJwsHw45VjgdnIqLaU/9XdwEsqtXlPTq+mmLYMQdP6ZRfEillTs2nO?=
 =?us-ascii?Q?sbi4j3i2DJzd4LV5sCNWk+q7u5hJJu70ntchIC7dpylx+QRbpzNKNkZ20VwN?=
 =?us-ascii?Q?mJ9p2eXKf0TUOZpWoYJk6aXuRjDRT1t75nkOyQ5MJwAj1MUibVpJWKe/jOqv?=
 =?us-ascii?Q?CZYf/TlvP5KD4fho+g2Bx7nQ6Auye4j1lMkTnyXxNzN4o+MA2BQLpMRiiRVy?=
 =?us-ascii?Q?pctT2FOjW2EbsdBk8kBBQjsgaPUecgIACRRjcQXS0K0FOSXRg8O/bQNGxdtM?=
 =?us-ascii?Q?421u3mczBg9T1Et1X1Pybx+Fw4D4sYBVhYoKd+KfVXhSlf6hWW3Gm0OijNlM?=
 =?us-ascii?Q?nRdDE/Xjfxokux1QeGt4LlRQ4Jxt2/4+opQX8FR/CS3PnkVT4o66x0JbMQUL?=
 =?us-ascii?Q?hTlaO/KMnycVGDQ9s0lBjWUgd2bmXbmAkMan8cwHLFYD7THON0E99dNHUXrL?=
 =?us-ascii?Q?nShdx+Mj1DTmksyADN+c8ySLL2uXQL2b9jpqtMIsZY4IgXmfeQhhgKL6VFnC?=
 =?us-ascii?Q?9pzs/jAOWQP62vtcM1qBS0M0N4lG25b15ohO+O4VadQ3EEPi1A/49u5JU+O1?=
 =?us-ascii?Q?bzmKmJBZJvyRL3mHiwWX+oRFZZJwsgqNG1rEj/znCFH1Nhh+rh8gEf7GFZ3N?=
 =?us-ascii?Q?xdpvVkP3x6qtvwfmETWTo6lp7nXIuauMIEXqOs5CSEsFBYFMk9l2lSETzghi?=
 =?us-ascii?Q?UckNO3eYxLw2pjCgV/1AZmEi/yuG5WYXOO+jlN759XSZyOAVVlhhMjBynbuL?=
 =?us-ascii?Q?0YA8y0dxFBIz3mDpHsc1utLyx5o7n5G72Z5d0Y+00sXzNDZgMN6NhCoIBn/Z?=
 =?us-ascii?Q?PZL5PMFM2956PeqreoEao+Ni1ZRHNA+wHEMlraFwr9WxjpGT2icZQFCmhusk?=
 =?us-ascii?Q?PFF31ZWsCup8e+UP5bUE2Ko3DA98Pt/l6Xn54INvKXL/u9bLW9k2wVxDvol8?=
 =?us-ascii?Q?lWKwXeC28/SBeTV1GQtu52hyVmf77RAtk5R+aBluVXfX+qfxKDr15CoZhfsQ?=
 =?us-ascii?Q?alJhmg8DIbTDhxbSr/WgdySFwSveCw9znM/ze8wgkLmwh1QRcwZfq7FRGHnU?=
 =?us-ascii?Q?R9DOIghdmFaJ0/yCu39eqoNS+HGOT/Ko75SMkjYOzFcJ2CyaWe/B1xdKlu9V?=
 =?us-ascii?Q?lgTZVyGx9gd9hdmpuuDXot4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76159f22-985e-4c39-f76c-08ddf4b2db8f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 23:51:58.3166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihR7mDukGWh5qjXaIbUUnibsMmmKALOeYh5F3aDU+5wfTayVtC7F08RCs671HcfR9jSOt8aONKpa7jbk6AiVOUTjQe7DvzMeVe09hD/4vKtIkzuStJdAmIY6QbE1lAO6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9747


Hi chenyuan, Geet

Thank you for the patch

> In case of krealloc_array() failure, current error handling just
> returns from function without freeing alloced array. It cause a
> memory leak. Fixup it.
> 
> Fixes: 6aa175476490 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
> Signed-off-by: Yuan CHen <chenyuan@kylinos.cn>
> ---

I think Geet already applied this patch with fixing git-log, but

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

