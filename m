Return-Path: <linux-renesas-soc+bounces-22811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65758BC6F70
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 02:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 17DE84E371A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 00:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F0C33D8;
	Thu,  9 Oct 2025 00:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e6zXcmqW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F438D;
	Thu,  9 Oct 2025 00:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759968200; cv=fail; b=nEfnAawEYiKPu4VS24zVLNEAIdQKvK4Rbou+OQd4320KCnOwlMuXrNShAOGXKI4rDrV/Htn8yVYktf4z084H5rovGG6G9mz5EFjAQWCE7/1XLO9bSVMLRM2LcSgOPIsejQW0WjIYxSkS65rqFPI2VKXdDf4bwqPe3puZ0eo5QF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759968200; c=relaxed/simple;
	bh=rxfB1rZwn9ga/HpwWb0NsBuZTKO+1zHZ4AorECcUppI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HIYeRM7QJd7XUkQIaTercjRHzPN4PfBTZOQJ87S4glpogkLKoVDM8gCLLvAUZtqfxKIFYpk69nb5Mg/CV9e9DgE6Qv5ypUAr5BRwdd5akVXWDBxkLKw12ETJdNog5WZB/FrPjIsHOWDQPn05ahRsh0yC5Zo5TpDZTENIVCoVJhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e6zXcmqW; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkaVpAeivsLZn71UDUuJ4QKHzwzoQCwk8Js7P9nYYWkFXK7doRmJRpSZ5Ns+nbx2lWpCPOcJfCks4dYhRcGJSvX5RKf3h6E7ggF/71b3gC+3lOpu7JNO5UaD2wF3To3wBfyhGALo4+rkQDUtxet9lKexI+R8agW9KoD7F/d32zidmGQ2r+16LGEQv794n82EPrcDUB2oRoZXWkwHaz1Lk7m/HIleolXJj9dU8e2lBLT9XexNpkFeJhaPyEvtHbDUjMSTWG93fYQuz9Ctco1lPZShYWL7PrmFbmBUzhZgmwv61rfEjyC58kamVf8lvcLqq/obMj+jlNhxnGouaq11fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvbnbwqpO7aUrlUlpL4kJ/vgDQ66O7425LM2AA6rZfQ=;
 b=kpxGxbyodI4/NyUl0iFXmXdu+WT3dx1yfKvkwWAqNHLhITl81F3Je0L3rwT6vfDzaK+haKKk2+ZLenu2IelnRZr5b67QZ0oxM5uYIi0mceW4yMi1Av6//Lg4Jc6vwHlILW1JrFefZqT0XVwUOkA+YlDeFvIDsx/PR/GvXy71hq9ohJ0IqWXgj39zjgeJwV0IgjW9XM7ZJhclMGU8UmpIjCk77DHR5Cw/8m+3JFiGvgNoui89YSHI4X+iKgduU3S6bhhbuBqQUMdrr3Ty2fWNFe+nzT4R0h/mAp5AbUIDfOR3HhadXCSg9TjiQweuEr4snAPZnLFcBgK4mhiQ1yuTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvbnbwqpO7aUrlUlpL4kJ/vgDQ66O7425LM2AA6rZfQ=;
 b=e6zXcmqWExfkiYFidJHI3Msb6z4+k9ZYpWCBbQzTtT+yC9B6yDcFTA8gnTT+6oCQTbrukU5+L2FL3LO71PkVWcHu6KKA8Mnu3hp4M43+Tultii3HBaQyWrVp8U2PNsll5QNKZBvbeNPYuN+09wctWB6fvuuIyl4f1oH+QGvbW6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6833.jpnprd01.prod.outlook.com
 (2603:1096:400:b4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 00:03:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 00:03:13 +0000
Message-ID: <871pnduekf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: sh-sci: Fix r8a78000 interrupts
In-Reply-To: <09bc9881b31bdb948ce8b69a2b5acf633f5505a4.1759920441.git.geert+renesas@glider.be>
References: <09bc9881b31bdb948ce8b69a2b5acf633f5505a4.1759920441.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Oct 2025 00:03:12 +0000
X-ClientProxiedBy: TYWPR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf2397d-f785-4de1-04c9-08de06c73d71
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5oFiukfSLcP219XLYhT7jDpETie7osV39DuEfKIIuOFCJF9mFxAqjjiKfO6G?=
 =?us-ascii?Q?naomj3XJqSOaAtQJJwyE/wNeeAk+ihEqSZsNwiauQ03/djBLQwMVOjdVEXci?=
 =?us-ascii?Q?2K0hvh1giy2e69Yh8IzxsH2vFbQ5fBLigVFzqXo7u8yVk74ukY+SOytHlhRT?=
 =?us-ascii?Q?v9N64mAFEsw+i14M31Vrs/p0gB+6siG9FtCqsTInJynzVq0ADTjG3wzB3H79?=
 =?us-ascii?Q?kSPX8zAh2pK8GHRPvTrfC5woqRdU0kVL/vDyIHlHdHOTyUVCVm/qUkMQ8quP?=
 =?us-ascii?Q?XnKESX+AJvNFVd6idYElpivrZfbXr7cyCUXgv6k6TgpNg6dGGHACdvxRC/Vd?=
 =?us-ascii?Q?AF2EAoPNNFYwRnypz/CiO8DUdfP9fOZAgZHwOoHM0fAhSlT0Je2G5PAeSAXd?=
 =?us-ascii?Q?2TSzQ/p/VA6y0hWrS/pTa5IZn59/F1MJK0qi6ivpbUo+O4th82S0L+CZxV1z?=
 =?us-ascii?Q?9aq6FRkwMQ6U3Wa5T2hmkBZ0hqaFLiBLFQGWDoZlcWbiiiN2FMqeOF4IA7KQ?=
 =?us-ascii?Q?lBfB+BCxT8+DrPR2+u35rEIlp8vuy48tbFz/QW8t3d6H7bnt0N2boG2UFfXs?=
 =?us-ascii?Q?+D8hbT/Lw88XZeRX5OmLdewNA3X9HoUGU3YAskKdTr+jP/+w1wOxowfGJhU5?=
 =?us-ascii?Q?TPtyLAgCvBvFZ12fhIZTBzaNzUjWdddqDTKjtGkjhWryCNU/0/FxVGH9wig+?=
 =?us-ascii?Q?4xyfoQf31+tXa6VNPQ1Ufos+D5DPtCJ6IRVZztYKt24xFgWOuoPuIhBOV0EI?=
 =?us-ascii?Q?4ykdLf5fYmg0MO/H/LGZQl5EP1NiYYpYkZaFETuVce/b370EJZiPoobwXm6d?=
 =?us-ascii?Q?yGgFjyiQcR1PrjjIrmH34AClo8tqkDd1iJHzFFq411ieuFMbyUazWMhJnyRn?=
 =?us-ascii?Q?3ZTQoRqaFw8ZVJ5uQyHMzKNApmfGIccWcNMcruc8ZBiZk+dDjzJb1ROwAUZp?=
 =?us-ascii?Q?U+PSPpy5yZOkCofrFmjJc1ATa5Sp5KmyEPPUQr4xJ9ICElBxi7hA7Plx0OwE?=
 =?us-ascii?Q?OAhMDuS7j4CtZxndH0ixAPAAHXGfl4ooBmISycgPK3ZNFYPR6Gea5YJGP+qF?=
 =?us-ascii?Q?skuWhNg9XJonAYKAPnCZLJ+NHeOK4hQd+XUOr3TC13fPwHP9nuPH4pYWcs8a?=
 =?us-ascii?Q?hGpz1QdRxps81ZVjsr3WSGvGM1VbeNkBZiod6dEuR9Aiq3GyFlw/zGIyWK8v?=
 =?us-ascii?Q?0a3EA80Hj+l3Z89aj3fP2FjrU5EtS176b65sWWwuY28sx0HyMlx3ZzpOazFM?=
 =?us-ascii?Q?gUopwVJ+2oyZmATlmGInT9WjnuaI9vg5Cglpmcz6zv2ctKqlNMohJ8mqjxCG?=
 =?us-ascii?Q?YpBf1tyr2z7QfOF1JeJDTJWDRCrmXo8CE6dQzxTd+QeiEeKqCxjWANZJ3lxP?=
 =?us-ascii?Q?+d0JK0hhJ0Rf45XeZGd6Vu4CUafXj2VybTt3bH4mL147nVM+NiokbbZRKFQP?=
 =?us-ascii?Q?Rqkc/8kUzxcYXrWyIs5CPFjNlUyLIw8k1ECgOgX/tzH1954KfRV1tHh3SWAZ?=
 =?us-ascii?Q?CBRKvjLIXs2wpgiwN9XZjgT2LIbuTY+UVtSS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WpbdVH/7YGwk6fl5XnOLjmIfkgarLjEVFSh6FDiX6eAPfn74NXXbEn2oM1xH?=
 =?us-ascii?Q?j644DWMmj3/V7Ww+BXsxntXEvgxBDF9muxe8PKuCZ1ZAZZSghASD5hVwqFUW?=
 =?us-ascii?Q?QVdvYl5QBfPm/MyxmVIIhkX+32e9+CNHxOH+8vbTSMk3d0oPCgPLlMHoU8MT?=
 =?us-ascii?Q?09hkIDTyY04Wfs9Waf7V9358CPdf3RKX0n75Icm8E5Wx7Cz0IS027Hs9N16t?=
 =?us-ascii?Q?xdv2R9Fl71z4nWBAjeuMRVJdIbGWCQwuXX4h7ngUnbZmgL2c+gl29XOXnoDy?=
 =?us-ascii?Q?Sj0RHde6PmuW73r4rxsKH2wuMElCs8iDYy8ufXAGIIY4XPGA1tEqawaYWMRT?=
 =?us-ascii?Q?gR4d6KCo0C6Nn1OzKHfwt+DoakLOE9ePanmYKn1JjpIWQAThQvx05hK8LOGN?=
 =?us-ascii?Q?Z71CipCHSuxbJ97tfjAH8fsirc6N5JUpUt+44tRMiw/wX5BNOwwizoZof4cP?=
 =?us-ascii?Q?/cruSVPX8uYBnGh6Gvi7TRlQHUBEmQcOgLDa7xMKnVDTYBPAw1ZWQT5R484B?=
 =?us-ascii?Q?/0LPsxiMUhD3Hw0JI6UwOj7C+vnajGZI3goQoXxJ3YG/AkAHkaS/KNVMnNm0?=
 =?us-ascii?Q?BaZ1knH+mcdJxnqeztG2zvF1KpJ6Gx3LXq4D3Cgl9Zd79cNYZSVsshlE1fay?=
 =?us-ascii?Q?fsw/+Y/8Z8K3LzBBZVshHSDv3qfz1WVk4PmJAd+UEMIJ4NwXlGPRIomiqdrA?=
 =?us-ascii?Q?a43zczcrcyhR0JGrd3ZMEqlO+oOpuzKdRfdbX7G9z43pDn0IkgXUO18PLFAf?=
 =?us-ascii?Q?ern0nYu+cxTuFcIlAuKADj/WnnbqORmnettuMD/8Ye8kkfuPr33+NYsajTfT?=
 =?us-ascii?Q?h0xDOUi3Hr6OC/URF3cVUk8q8WZGYqeuDOwARqDCLNBQ6v1ZQOrqNqM8CivY?=
 =?us-ascii?Q?iwX+oGT5cVK6imHarTp9ATSoIHhYTOEHlCgIc7iWt31OtbDG5FIaKSZj0d9Z?=
 =?us-ascii?Q?O/+K0VTha/Zb5QeUme/mYtBmamJzYjVk8L0hQl7DTSbJg/9N6i3iwhJW1ymP?=
 =?us-ascii?Q?2KrQ/VjYoabcn7/XnZrZps0HRJ5GA1kwezTZBl+3c66hHEHkQWPladNzd73F?=
 =?us-ascii?Q?cDxMMl6QAZjPO8CsIyoxv0WNxwG9kScxE5qdN8NQKJAA5dwTSPc5VSilTldb?=
 =?us-ascii?Q?LmosR7+1Lld3CBoCxdh6/kn8wes2nM17qaaM53j/FVS1odIS0knl9Bd437ee?=
 =?us-ascii?Q?ikBLiIujN8BvhNyB6crkBJ31x5Gkgs+Plj/Dqvm/7aoQS55Oyb+FgpnhuMHN?=
 =?us-ascii?Q?AP39bbF4kqJJLme4YuCOktCmNiXmKrORATL7GUgf4sd70Rl1SmX/+nTesGEY?=
 =?us-ascii?Q?s/xJ5eiFJgxqs5zpduF7D7gTBrpWKk8INi87NnT6QrXF2iNcbEUK1IGj2Thj?=
 =?us-ascii?Q?2TGO/OsW5t9m+OLolm3HEf6lc/E3LgoMnBtps8C3N2NUwc0dS/WInui6PmTO?=
 =?us-ascii?Q?sLK2MIxHr9zxroCqx8q7Ipb6+7LR7k6abxgZgaa8kad3rth6enibxK/CyEIj?=
 =?us-ascii?Q?U9Pm4wpDvmeY2Qx2IkKniimzYqlKIPNR2H51LfnU3grQFOJj/eRvWmhNBMcC?=
 =?us-ascii?Q?AKLc4+6njRzvkdoYS0HyrnKOHNY9H7bSpqq0yQjGzYBP6A50IShYM+FgIZw5?=
 =?us-ascii?Q?O0MqZwRAE9Pv21juqupMaBo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf2397d-f785-4de1-04c9-08de06c73d71
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 00:03:13.4484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viPxa2gvo78yLzlSVUrzTUH/EtSEGTM5Al/exlJIeKp9GpqLFXvagZE6CLoZSfBl4vRjLoNlpIvF/t/W1vQujsW1ERMdr0E8F+d7L6Umc/UTQBF02rH8pGzaYilPrqtT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6833


Hi Geert

> The SCIF instances on R-Car Gen5 have a single interrupt, just like on
> other R-Car SoCs.
> 
> Fixes: 6ac1d60473727931 ("dt-bindings: serial: sh-sci: Document r8a78000 bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto

