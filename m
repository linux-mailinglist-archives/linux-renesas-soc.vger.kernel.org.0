Return-Path: <linux-renesas-soc+bounces-25414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 721E9C95B6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 06:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 992E3341D7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 05:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1AD1E5B71;
	Mon,  1 Dec 2025 05:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="WH9RBTW+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE701C8FBA;
	Mon,  1 Dec 2025 05:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764566086; cv=fail; b=j/T5/xzAb1EzasTl1pgObozn9P0th5/8P0txMvkLEzUdf5WY3xTvNczob6OanxexN30hJplWPY7xd23NVi1+WK7uvQ77nL6TbGLCJp9yM2lKVsmfsMjLbsDp2UZEjrvIKlBB7ggWUos7OZ9h3ffCbRmR/te7Pz8cWt20F7uIFhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764566086; c=relaxed/simple;
	bh=u0fH5DPGpF3R7ADivhUZjUMRJVr2Zib3vwLinENtqYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f8L/92MRbNBukw3uJ8IXt/XN0zRpI4eGYRx12fYkZYf56HGKlKf+LmHNmieHsgapSeuvOuqNjFWMhaHlaa4QjdjOFARbtrhehK63VGgjiDCWq7N/CQrQ9YLK2R2szyT5RzDeYBTvDRPhJ6GbQs3tF9Pm/8uISESPhbHitURO150=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=WH9RBTW+; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCfkxrmoupvrWVXZD/v+yml5sAZNLwnaEwQwLonc91JuEuzCiuBz6qfWZqIM7SkuLg/Ko+Mq07TLoqrh+R3y7qZDQX5kLMIZZH6JBCjMj+XZtsWO+OszUBwt4M5yUdGr2q+0sgZJbKFzOXc2s+q7nH6pK68taLUD2tG7YM+nxhFscTX/wATrV9AyJoQmjYm4om3Ik29LgnhBsV1lsurmqZnxpMK4k+mB8EliyKKuFWRIUrYnbd4i9tw2CahYkktlKsa8J17SLEj9WVhuTCLjavGowTkGyF3uSS8dg95I3eHseF9mJz0UiBfZ7tWU+DnFFGJtiUjoDIpoYeVvs0qXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRgUdfrxy0T3zK9sGy4pNiI6LrO6TLcsojqApvGFV1A=;
 b=fZDtLiwOdOIhK7zr6GSEy15URgJSVIHioBPfWG/9p0j6jexQ8tjgCJO5Z3PvJGY1TJn6F6NPtuszFOCL0O4kSkd0oW0xT/rYlgdRKS+6Ko0uFVikf6rOOlK4JRmISUaAG+4P3wjVeCOmv5shlRBSpY8Wx4Z3uQRN/hWPMNzIqKQF6D+TrgIZP7yTbX2zCJgN57SBiS2Y14Zp9+CzP4ACa6ECBgPNFEm7fMmF1sQioOY/HOBQpNp9ozYoHu4q6L9A33kQIeG35SgwAXIWHJzEZ3+nNSUahqOFGAiouN3lt1Mgmk0+HfoVlmVLm5hesCER95RVROYUoGsjsbpfg2Qjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRgUdfrxy0T3zK9sGy4pNiI6LrO6TLcsojqApvGFV1A=;
 b=WH9RBTW+IUOM+GEqcsLTUeXXLxMBsAmTITcUe3h29ylJH+LDaBGjh6LuilJ8g667DBEok6u5tf4akcB3YQnwi8v55Pnpnvo5hxZpy07zwAW8fyd3zHnRFYGy+gLsUzqfQj7+05sHKcBGGj7NHZdnboNxQSBDSQWE8MaJCoWvOUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:24c::11)
 by TY4P286MB7232.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:368::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 05:14:41 +0000
Received: from TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fb7e:f4ed:a580:9d03]) by TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fb7e:f4ed:a580:9d03%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 05:14:41 +0000
Date: Mon, 1 Dec 2025 14:14:39 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: geert@linux-m68k.org, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robin.murphy@arm.com, 
	will@kernel.org
Subject: Re: [PATCH] iommu: ipmmu-vmsa: Add DMA controllers to
 devices_allowlist
Message-ID: <7sdiaf6svneam6svxu2htqsofswjyiia5kt2pu76anp4ppblhd@i3qbt2fn6amq>
References: <CAMuHMdVtR_8OZG2XrD5PHY+ybaH4dudya4VXNXD3iHktdDyF8w@mail.gmail.com>
 <20251103085612.42134-1-ryotkkr98@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103085612.42134-1-ryotkkr98@gmail.com>
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:24c::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWP286MB2697:EE_|TY4P286MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: ac011d9f-e89f-4a10-7c7b-08de309887ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TDloeRVv6MNtiqkMYtpCPGKwOnjcw8RZlsvi9P30VM66TIOYa8pbLHQZJZIM?=
 =?us-ascii?Q?bfW3HacGK3ICVmWoBSTjH8+Mwepsnn75A8FwaMCbEqCOr0eWU4i2ZhGmVUdt?=
 =?us-ascii?Q?ftwkyNAcyod/galDn3K/D9O4Brf0msbpWhxVdPe21tMJXnU38cEYxWX8PQyR?=
 =?us-ascii?Q?jkEsAZaSNqYIJXTF0h2glhx8AQMzw5wo7uGawm3c868YQZKBWvmcZIhPBUVt?=
 =?us-ascii?Q?RLPCeEj45oYFA2LkiHa4w51VWsTGFJ6HwnE6jCNZlRyt80LHzU/OhAQnFQ8g?=
 =?us-ascii?Q?imHfT8XKDkuusKzOQNQRv4X7cHl+mIolJ7ZENipxImdD59Oz+RnLNU7n+iuU?=
 =?us-ascii?Q?Rz1XMZVw2HuaAgnZSEPiHvaoW77GOXYOw6sbys/MP5Qq4stqkiOvNh5WV/kd?=
 =?us-ascii?Q?BtGErZiVy0qo5T2YSVwAl0sr2oe6Lu6jhkGXCpXpemdhgPeuJnufD+e5HV+G?=
 =?us-ascii?Q?wqLp2dyHIgimJvvRrMlknP/Cnk/HRNO9oUyBjdVxcbulBCHXm/3fqwrqmGiT?=
 =?us-ascii?Q?c6z7OLoIrO3HwUlHa6ocYxx6HREalba1NZmWqn7QgdF6V9uzgIOlFzGzCnCY?=
 =?us-ascii?Q?orZVwAe3YYpPYmecmAWHIoKsiS8K7YoQiWzVFoNRn9GZC2PEN0v6gO9wqYPu?=
 =?us-ascii?Q?qDBTMLzzL+7wBGXRoVH/9wxjK0MNoTBeVcwuLVQMCo1nDZEqMAiqVlx2w2t3?=
 =?us-ascii?Q?L61rlEzQhTX7n2o2Xbd8BLSKXuBPYcVuSCGkPVxH1y2YvDn6GXGn5C60sjfx?=
 =?us-ascii?Q?Ze0r1BOhhZ1h53I3zSDpRtnROUQJmqjrU+h3Z3ABUKM7Fmklx1pEKpt1Hyj7?=
 =?us-ascii?Q?ovAHnNAKK2LJZW3IjS6aS7Q9bUBC0/3ugcf+bEi7BcltjhXFwHSANx9+TZFU?=
 =?us-ascii?Q?UtRuE7LmYkRTKwPsl+4BWC7ety0VWL3wURqOMw58K9TACPoibsdexwYtQrlD?=
 =?us-ascii?Q?N3P/REIqct/6XgfWYWdvqO0/frhsM1ehOeHlmE8wwEbZlT2mTKvT9FYDIPQ3?=
 =?us-ascii?Q?IFyrXFOgFqBvZKnsxWUIRxAXcl9jjDN97Bvaf0Q9NCiLr8YVM4MFXwCYIirY?=
 =?us-ascii?Q?48k7hBJYrPmG9FBu1qknQY21GPZlZWrJqLtZjR9P9Td0W/WXekH6KwcWQPU5?=
 =?us-ascii?Q?jSQ3p8FllCLSuvM1MYs83TWhQMeyIWO++AOHr3PxjOLl8C+XtfxdiZ2DY+JH?=
 =?us-ascii?Q?WGIdfRt98NJAdYq3GDEVlm4g8rwDEOoSWfKqWH51IHv+akgZmqSkF+KwDBtB?=
 =?us-ascii?Q?YgX96TsuWBVvd7riwqY6IP45zN/rAALCFKEHbPZQSkTs+os7+axhRMdEU0wt?=
 =?us-ascii?Q?UuD3HRZe+DTaoINnfqUUC66lXTuy4shWqfGTJOjTGZ+PGFoC+Vc5pqxM0I+H?=
 =?us-ascii?Q?v3BwGdwqBm/MmllJhxOhvvE/ng+QTxOyLndhZReL9lRwRYs9dmGjvwEsA3KK?=
 =?us-ascii?Q?0NGQyOKlGVc1IQMnFx2DhbuNMVISCHGAq55VYxQJ8/PwX+1zTLBWdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?adxOxlB+KmbzcMyIzs3lJ7NIsn79WYB8ztw/HFdibSoT+R+ZEQBpVG4oOwq0?=
 =?us-ascii?Q?zAXO7Gk4Q8wraJ9dwMpcXRP3CcycWVp0RRsrwcJCy+wfL1AgZVebvQZetdH5?=
 =?us-ascii?Q?cf9QZTpDEFsFf0wGoJn796bhbZjsaj+DLOHwF5m8XOyri5NWclkLkWpxzE12?=
 =?us-ascii?Q?QD6Iy32UptpZqBbzBqp2/ZvNHkJwZgqXBD4hIWIAbnknvvVhpe7gM+KyX4yB?=
 =?us-ascii?Q?dL0OX/vDhqZmUvtQt0sEq5FEciMIqomZ2krhPJgKaywCH4nKxi1gJkU0ShRu?=
 =?us-ascii?Q?Maj5t1u1JdvM5FXsUdysvisoSu8R7xufUUbnt0f/8iKyCsw5wRSz/R/X9LzR?=
 =?us-ascii?Q?OTZJ5kPHutaahmubbb0nU0Df3F/llnhy1eQG5WR/cNj/Tll7qzbE7iQmHNhq?=
 =?us-ascii?Q?OemDJjJZb5kzL5Wdtt6RdH0cL1NBK7fN5Fm0ueJ4CqXjIAdl0dYpIJt4yG5k?=
 =?us-ascii?Q?rbAMEtKx+tDXIvOkiGuu32X39AdRysoSFmpDkRv5tsw9STsY0URKhOqPvfAx?=
 =?us-ascii?Q?2w/Dl+f3iiaA898k/n4+LBNpJjUJ/xewXYfhyKVyZEJXHIKD1BTJxPfmi9hK?=
 =?us-ascii?Q?6UrbyVxmUk7aP5qEF1CK7aqBa7RPhM15oW0E8eFNq2yUtW//Z6m89uuwAqlP?=
 =?us-ascii?Q?C+MpvZ2QsJprmwV/QYQNIk7RSw+kCERfl1AwdHVHEXwKceZ5ysWC7TtffKNj?=
 =?us-ascii?Q?4qQcsKmUhkgwSGFQbTJB9p/ojNYKwJ7O/XRziH64NAH/WXeocxvopI1wrpv0?=
 =?us-ascii?Q?wGrbXZFw5IYyYfbk0+OVWGNH2LHhCMCjB7oqLY/t/WnJIqlP6ZXwLP+sCfFB?=
 =?us-ascii?Q?y48BllUCmRjUYp0yzJixWqgDGIvgxW3MMxfTKQVtu0up5jOHeUdnwQNnzpxN?=
 =?us-ascii?Q?wzPORMEVO22Eqpr/c6B5+OUm8zAe2Rfus+lpLYCGRr9GzbbSydSIEhtYX1+y?=
 =?us-ascii?Q?fiWZyA3tAO6k2d8HJ2w9hj0+gACUeXuKcOELHVCmeywaEO9DWTbQHvvaUSuo?=
 =?us-ascii?Q?oIU2YuwxYDEMCOKgwj2yW3H8YKcnLsbufyOppJNpvGBYYCzOYyz0IG7g85UX?=
 =?us-ascii?Q?4TMauojD2vEtSQVcOZqj+VbReeiSqkkIUWD0jI0gpdmI6yoF4RcAfZ5YuRPe?=
 =?us-ascii?Q?NPSuCxxvm1ngjCcgtV/9JmkpCEkgB3WfzNam+w1VIapt3S1e3dh1jtkMMyoj?=
 =?us-ascii?Q?Rrz2T8CY7rfcp5bYfHsX31YsyzuBwv085OUSoIiO5jlH9uuotDH0ApdwSonu?=
 =?us-ascii?Q?0AHeI+Pzy207K/nlZBMYc/KlAY9wPd3AzC4KylTrSzLX8eosuwnqyfBeFui5?=
 =?us-ascii?Q?FXyybiqc5mz3jbr/Ro1OEyeFCPDbmrHS/c48ZUYfhKYQXA4tl/PEw06DskFm?=
 =?us-ascii?Q?YJZ1/aiL4SzeQTEwkmrtl1AvO5L8LAcV8xR65IjteAzwgGXA2KScJpOFM6ch?=
 =?us-ascii?Q?leIbpntQfDS+OErCN/taTqyIlAUDGI0+55ShRtGOn65vVCiN965WakkvwpqS?=
 =?us-ascii?Q?v6XG3ivlse7e0MnCRdRxB0IUaUmFwbPFWLZQtFQPfadRzJuUpNtSwmiuwVgh?=
 =?us-ascii?Q?rXfypr3M/ZiU9jgSww7r5DjNNUzaPcifkd8YCP0gWnRrnx0RQzCPHR0j1cWk?=
 =?us-ascii?Q?hRNtaeFu+XPH2ETdaVDl8zA=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ac011d9f-e89f-4a10-7c7b-08de309887ed
X-MS-Exchange-CrossTenant-AuthSource: TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 05:14:41.0306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQMCBWSHPey59lbgSvBHOKHaLZstB7sQ5dUn9DekuuiKB2O0ymcwiStuCkBWzlDaER5fnCocootRzH+o8Z8gqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7232

On Mon, Nov 03, 2025 at 05:56:12PM +0900, Ryo Takakura wrote:
> Hi, Geert!
> 
> I'm helping out Den-san a bit on the issue.
> 
> On Wed, 29 Oct 2025 17:08:07 +0100, Geert Uytterhoeven wrote:
> >On Mon, 27 Oct 2025 at 02:26, Koichiro Den <den@valinux.co.jp> wrote:
> >> Add Renesas DMA controller devices to the devices_allowlist to enable
> >> their use with the IPMMU. This allows DMA channels to operate through
> >> the IOMMU when enabled.
> >>
> >> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> >
> >Thanks for your patch!
> >
> >> --- a/drivers/iommu/ipmmu-vmsa.c
> >> +++ b/drivers/iommu/ipmmu-vmsa.c
> >> @@ -741,7 +741,9 @@ static const char * const devices_allowlist[] = {
> >>         "ee100000.mmc",
> >>         "ee120000.mmc",
> >>         "ee140000.mmc",
> >> -       "ee160000.mmc"
> >> +       "ee160000.mmc",
> >> +       "e7350000.dma-controller",
> >> +       "e7351000.dma-controller"
> >
> >While your change looks correct to me, it causes DMA mapping failures on
> >Gray Hawk Single and Sparrow Hawk when IPMMU support is enabled
> >(on renesas-drivers-2025-10-28-v6.18-rc3 with renesas_defconfig
> >+ CONFIG_IPMMU_VMSA=y):
> >
> >    rcar-dmac e7351000.dma-controller: chan1: failed to map 1@0x00000000e656000c
> >    sh-sci e6560000.serial: Failed preparing Tx DMA descriptor
> >
> >0xe656000c = HSCIF2 Transmit FIFO data register.
> 
> Thank you for sharing.
> I was able to reproduce the issue on Gray Hawk Single(r8a779h2).
> 
> >With "#define DEBUG" added to drivers/dma/sh/rcar-dmac.c:
> >
> >    rcar-dmac e7351000.dma-controller: chan1: failed to map 1@0x00000000e656000c
> >    sh-sci e6560000.serial: Failed preparing Tx DMA descriptor
> >    rcar-dmac e7351000.dma-controller: chan2: map 1@0x00000000e6560014
> >to 0x00000000fff82014 dir: DMA_TO_DEVICE
> >    rcar-dmac e7351000.dma-controller: chan2: chunk
> >00000000e5110c20/000000005e0ede90 sgl 0@000000000d8c5440, 256/256
> >0x00000000fff82014 -> 0x00000000ffed6000
> >    rcar-dmac e7351000.dma-controller: chan2: submit #2@000000005e0ede90
> >    rcar-dmac e7351000.dma-controller: chan2: chunk
> >0000000025f2f66c/00000000e5f0dd15 sgl 0@0000000064f1067f, 256/256
> >0x00000000fff82014 -> 0x00000000ffed6100
> >    rcar-dmac e7351000.dma-controller: chan2: submit #3@00000000e5f0dd15
> >    rcar-dmac e7351000.dma-controller: chan2: queue chunk
> >00000000e5110c20: 256@0x00000000fff82014 -> 0x00000000ffed6000
> >
> >0xe6560014 = HSCIF2 Receive FIFO data register
> 
> Does IPMMU support handling FIFO registers?
> (Forgive me the question... I'm still trying to learn how it works.)
> 
> If not, with now dma-controller backed with IPMMU, maybe what
> we need is to map FIFO register directly like it used to do?
> 
> >Comparing to the CONFIG_IPMMU_VMSA=n case:
> >
> >    rcar-dmac e7351000.dma-controller: chan1: map 1@0x00000000e656000c
> >to 0x00000000e656000c dir: DMA_FROM_DEVICE
> >    rcar-dmac e7351000.dma-controller: chan1: chunk
> >0000000096396eb4/00000000f35357b6 sgl 0@0000000013546bf6, 74/74
> >0x0000000489ab5000 -> 0x00000000e656000c
> >    rcar-dmac e7351000.dma-controller: chan1: submit #2@00000000f35357b6
> >    rcar-dmac e7351000.dma-controller: chan1: queue chunk
> >0000000096396eb4: 74@0x0000000489ab5000 -> 0x00000000e656000c
> >
> >This confuses me even more: why no DMA_TO_DEVICE mapping in the
> >latter case?
> 
> I believe the DEVICE being reffered in DMA_FROM_DEVICE is
> DMAC rather than FIFO TX register.
> So from DMAC's point of view, the dma of DMAC->FIFO TX register
> should be think of it as DMA_FROM_DEVICE. 
> 
> >>  };
> >>
> >>  static bool ipmmu_device_is_allowed(struct device *dev)
> >
> >Gr{oetje,eeting}s,
> >
> >                        Geert
> 
> Sincerely,
> Ryo Takakura

Hi Geert and Takakura-san,

My sincere apologies for the very late follow-up email. Unfortunately, I
don't have access to Gray Hawk Single / Sparrow Hawk boards myself, so I
have not been able to reproduce the issue locally. Takakura-san does have
access to them and was able to reproduce the problem, thanks, Takakura-san.

As an update, at least for me, this patch will no longer be necessary due
to another ongoing work, "NTB transport backed by remote DW eDMA":
https://lore.kernel.org/all/20251129160405.2568284-1-den@valinux.co.jp/

Given that, I'm rather inclined to keep this on hold for now, unless you
have any objections.

Thank you both for your time and support.

Koichiro

