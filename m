Return-Path: <linux-renesas-soc+bounces-27281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGPzNLVBcmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:26:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5568C06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F9328CC704
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 14:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C88C34E774;
	Thu, 22 Jan 2026 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="alpxUyaM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021075.outbound.protection.outlook.com [52.101.125.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C039334C1C;
	Thu, 22 Jan 2026 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092149; cv=fail; b=ClnRouXD5ALExJ4bjvptjDSYeWLiB5/5NC499TTMES6bgdGE7VpvDfb+7IWTsYdVMaec2Cwh51Ga/kPSHD0IXWI3Nif+Rm/ZQbxFTHRT+a/LW15Rf6/ASH1UB+eTg7AtfMdPhxl4DwZndzz0uy893o6ZFzISRXodDvOAMWKkbXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092149; c=relaxed/simple;
	bh=RowIM3b+fHgW1D2FU7k97DsSx0axmKNB/5p4e5ilzas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aUDqCPv1J2+G4TXgq/yXMEUIpQEjX8TpUgEPRKTD5ZQuvVVnw3s7eKYJmF5Op5bWNX7JSqjisC9JeD9hhiyZZNvA5qwzHzMNkoQ9eefyShYhbWZIiQ6slglTsW5EeCJcx0Vb/WaYZNtTmlEVVSm40OqBrmEgllqhFQNZJVe1eJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=alpxUyaM; arc=fail smtp.client-ip=52.101.125.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6QasVriUnNVW9xxi+wNikCk0iLAqVo4ZBnJKIjKC14MfsCOe1NUu7x/X7pvzysKUP5i2g4ORFdIELGp0612bLF4hq1fMGgEl6M2uVCoKR3HGgwiXStV4Ex9YayCdo798UQrZXnk8FPfZNPzOn3ScXoFODmgRaQFL0VZ+QZRhfH7+5iR02ZJ221sCfgenbA76rqRnnDiEq44+Go5Y8ebzPVoUQFKsTDQBvt+vLaFiqpqCBFUEac/5Nb/B7bNtMxx9WJAWAFAgKCANguFxEg+wOjtb4J5nwJjYyqw1XpN9x0RxVkoRs8oA0UUzKlCnuCJ+TEYrRH4WpRAqXHBenLNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcWOTR9grXcO++MlMUTXwjrQaKHmN3B5qcWWN3Nx6IM=;
 b=kItZxTpJwxFOALPDWYUCJkCFCyZb1LdfcmAKDb85RZnYMEYT86Ux++UKDv3y/BYCOfxiF6slGY5uFt5qriChB1osPkBBV/bJxNis/FKp2m+m7Erim6Ma5154dMzmJHv3PkUSJ8ZRCOQhVw42LUTM5BnfwwvmQxTHJqiDhAOxJaywH3jQ+SVrCG+hHo6DC5VxGqcAJCoVYxYkKST5uoH1V6v7pqnjzItghIG7K1R5K2ReVQ7ZJ0ufjXRo6tiS4veK2y9OqFrDKhSeQflgGiiKasUiJkhYe7rf82PDBobmLUzvlb2FdpTo8QK0hA0Rf3Yk2CnTyfpmpP+eZKd0hISKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcWOTR9grXcO++MlMUTXwjrQaKHmN3B5qcWWN3Nx6IM=;
 b=alpxUyaMB8vG5LDgVP4yHxlK9hABO+djvfJMcoImomv1/d/NcgFH4I6qxHHkhqYhOo8XOJOB6yrm45jwiZgmLkgFfsfaqUUSZOpuEeECbYrinj0Zop7ixgt/uAtdt0x16qcTBYt0gWxx6MM/eqgy7OUQQUK/53EFe4jiXLSC0Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3203.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 14:29:04 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 14:29:04 +0000
Date: Thu, 22 Jan 2026 23:29:02 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com, 
	s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
	jesper.nilsson@axis.com, heiko@sntech.de, srikanth.thokala@intel.com, 
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	magnus.damm@gmail.com, christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org, 
	rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com, 
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 4/5] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <s6bnqkbuugi7oio7ybekdbk3dokpbe2bui2wjltdwajxix2app@wosgmhrfsriv>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-5-den@valinux.co.jp>
 <aXHsd7-WWAGyhy_w@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXHsd7-WWAGyhy_w@ryzen>
X-ClientProxiedBy: TYCPR01CA0077.jpnprd01.prod.outlook.com
 (2603:1096:405:3::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3203:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d2329b-83ce-4137-174e-08de59c29806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|27256017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W62h6TVqgGXpoHCcKl7FlrvXA3gJJrbN6QVcg+8n6BsRQlRdOvRZ2VwiefAl?=
 =?us-ascii?Q?FPvua6Oxqb77JDh8aT4U+EsNxG0SDWMvL0vTlf6QlQEeXaVu98Ow3d6drTHs?=
 =?us-ascii?Q?YYLoLSnIRzoKVze/pQDZm6NdhszZ8BBO0TPPi6K9lhdW2sRT+wHVmbZvutrE?=
 =?us-ascii?Q?YnbEwGLBjofuqVSQKvK7rA4iGsaNpMmZOHYDMwduRfX6VPIkYHHU0t/u6oaJ?=
 =?us-ascii?Q?jE99EiYzLqNm2R4XSTSXZv/iNTBg7Y8dtFBq1Zn7Ckp0gZQOEeIWhzMInuoS?=
 =?us-ascii?Q?uSqbVPl/CYLg9Qd7wa1UV9D7/Gc0xixVo4cUGEh40TBo+A5ANOrQkpeGVjND?=
 =?us-ascii?Q?j8MPimMtEpp2eMJBa6KycNDEvCWeIACm78aUlf9XNIc2DWPtHzfAFAAx2gpB?=
 =?us-ascii?Q?t52hLqd33Ewuq60vxKgmAMIjTF/0E65x/cFfm76zR+tBywkJE2X+pjZayxpA?=
 =?us-ascii?Q?ZrDByOh71piT9Xn8K8J6+8u6lB1F5dblYr8062qUH2jY9vD8bfTgvBNmMcvc?=
 =?us-ascii?Q?jTqc4pfq/6yiZNl9hhgEZi5QeinEjtemGd3eGq/7JcNiDPtVKqThE0nWZLou?=
 =?us-ascii?Q?8wBhi0hrwn5NNXQGxuiec9BFuFW6IEGTTCvN3m7wZpFM5vYwf0lmE+0jvo/8?=
 =?us-ascii?Q?JVP5dmkCQsbMylCpypDDea1zpnZWJ0McYzWRgGDRHPYVsVASHhYlS0U5nu7C?=
 =?us-ascii?Q?RxjNDdD5QLqRVfAkTwQ3UoNtEY9l8+A5Golhp11NLZBkZ9GxlkLJGbLyGtHW?=
 =?us-ascii?Q?gRGpmIrtR3BGs0J3y6Z8ESrTNBOLm+2jWIb9rRI/qqRAp4eJWDf9o3JgFu7U?=
 =?us-ascii?Q?wRf2GLwW65jbCvfN3IHOnN729YHmY+6ejL5xxiBQIMBJCutGkjUs0HnXZkPa?=
 =?us-ascii?Q?6ivQfLYB1+cMqdFofjcdKvNtsEJt5OVRqE7mg25tMcIg4V4jq/5rCPDyJEzz?=
 =?us-ascii?Q?h19EsbNtFA7ed+hADVnNu6LMqAZzxBtM9WoBYTZE+VzcrE1aJ2N3NtuxPdCU?=
 =?us-ascii?Q?zXiw/Cot6u7rQl2HT7bCLGrbvwiBONjG8Q58FVmS35eraBcS405zXAvq8+vL?=
 =?us-ascii?Q?24eReI7u2TDwcHgNnbis8y+zTfSbjt1fOYMITep8zv8RLbtqfosKfkaTDMsr?=
 =?us-ascii?Q?Yji4jiyrJLrA4dfZBOCRItXgr9Lzk0yQiU9C5MvikWFCt3+7TYth2nFgdVpw?=
 =?us-ascii?Q?7GtzaLr2sG/851FWu8iRC+2VrDW7UBVnk8c2IB6T+/839lHP90bYh8yRL9Uh?=
 =?us-ascii?Q?tRuUPSOA1WPGerpnc29USQ5DXmxp+cW4d8sBFhGG4t6UTQjnvdkqkAsoHJc7?=
 =?us-ascii?Q?j6FKA6qBdk82La+tE2uxUj8QbWGlnV0z16P+WFBcVPhmPqMKpJrJ6V/oc+bc?=
 =?us-ascii?Q?6UXCQyfLrTytyOrmA/3KdHdI5CAH15WOf8n2vz00CY5rLpzf8FaDjCfJFai2?=
 =?us-ascii?Q?cl3CkcMg1gQZh5kAB6aXAGqZyYVSzxk4gGziiakNKUryIW8qK10L+7ansgrS?=
 =?us-ascii?Q?SVOB5Iytfvxc80b6BFbWG5urIFJawvP8yxwhfi86seyAnGtnvZjwkwbgyh8o?=
 =?us-ascii?Q?h628IExQ/gauiTZ/+O7Y3xAzaXO8b8ZE7Ebxphp5hg/iPTBoHV/l/4xWOCKd?=
 =?us-ascii?Q?dWS2mCFXZjFzu3Q70yUx3iw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FN+kTGVO0fJwFeaGZiKd5L7OQxqbcslOkGIyOpDcrwPWCEhI/oLnUGwoEamf?=
 =?us-ascii?Q?RmuwXXUkh+i0LvMK1B92mlzpS9c8jFyzUbEub1MhSNW9hn9s4B+AesG84gnE?=
 =?us-ascii?Q?RqOPJeSj7uf/CzUlN2VEBi6s3+694sSq6+zjuQNj0r5SQ/y8EtfKRWITlJMd?=
 =?us-ascii?Q?VprrUGZsYrs+LCvIvyx851B49gcj5jGGLRpprdBOtgc6vUE2VNJ7rSRPHZF5?=
 =?us-ascii?Q?RyILBMSaPeydz/hpJh9//YtW9nTQQE4Sd2PwB6l3v1XNxdIGBoorL6y9lMWG?=
 =?us-ascii?Q?9MJhFA0+qpvgaLRm2Du+GSszbCAWxTfNuSt6YCLdo+n1FO6PpEtpnTCdtP31?=
 =?us-ascii?Q?VNPIDRlllIhpYUhdDRcym0b6zScoUIczIX3ift6Mtwu97Min+DL4rnO/1pet?=
 =?us-ascii?Q?uUYcCAk25aYPjjWGt4nOYMt8UoJ61zvBSj7MZbT2D8O0i5gxgIDuOvlbODVG?=
 =?us-ascii?Q?M3z/FetA+rOuh10vIIy3Fnnapib//LyqMGRSl0fBqiVdkMRh74GGoKMbdiqp?=
 =?us-ascii?Q?ijRD2LsWUnpUtDMdRGA+/0MyedLMiTQLmuU9eU02oXYk2FWbwZBF4fW3uzke?=
 =?us-ascii?Q?D9+aiPOH4jqty5mN4PlfKxAHKnlzULVpVCCEfe6TlvZo8+bzV3OpgWdos/vs?=
 =?us-ascii?Q?fyoMmf/cd05x5AKaleW36Fs5C72tHTmU5qq1Tf5roHWWdCXNMqPXXJxYMB7Z?=
 =?us-ascii?Q?6FwvDLW4TZ5hBPWsDNfNPv8uxfrubeUYFESjknCmUNg4TiKjHpycAVx0w3zu?=
 =?us-ascii?Q?mRMxkvF6zh63KB67G3S/08Rij4BCcNpSy9Ok7HWqjAjMym2eCK8JS+LRicLY?=
 =?us-ascii?Q?b7W2hmFSnb8YMVETesKBWO2Atjfq/67wuKdrT7pnhV3kFh7VGihsDTQRh9ck?=
 =?us-ascii?Q?fBOo/W8iVLgr6OE0utrIyheic5gl1IiG2FJLxX7kK7xHC6kuuG8IgUm60pn2?=
 =?us-ascii?Q?tCEsSSV/XNYBARUNiDGeriNhV2OSvg6tNvIBRYDaFBCvssW4DiXJVZKaKKo3?=
 =?us-ascii?Q?d/DHfvLgQLcIo0htdTMUUjKEQkNdVwedPwe6NAFbTkuW7UII7u+xcprPSpfZ?=
 =?us-ascii?Q?jOTE5vu0i2BNpdsxssn5D3qc1JYWd9FK5nEa17XoWqir5eZRg9PR7HpZ0uK1?=
 =?us-ascii?Q?8WiZHpyn4rhLTa4zVzzhtBb3xUq+/Br+0td10/pj828H2MtNF+trVmP3lghX?=
 =?us-ascii?Q?2Akf1T2sNyT/fBX82I1Jpb7V7/zYTP7IRLwMZXS6SvwMUCRMhVZQzWZQks7L?=
 =?us-ascii?Q?SONe7x0JjsXJXylTcVnd7ci5X8R0+w4IKxL2cuIkEQdUE7Dm+G9bFaSYciSX?=
 =?us-ascii?Q?bV8KlPOCSqcSEiuJnNZ21FNKhogOLDwWTjW6Ql5LbPNmG2KBd/8eeTKYokUK?=
 =?us-ascii?Q?kV69qejAhwZS6KVpXdfUSeNU6dYZGt7zWN9kHwk5+oFy8erxy93ZaGWWQM+3?=
 =?us-ascii?Q?fBidFBsBIqUNsZd+bGOKetYw46e4eb3mfUwZzkRGeS+67tcxS4Sc31JATGu2?=
 =?us-ascii?Q?/vI+E2IKkOPIjQaahgf/fiDgmBHgsb4rtYXEqdBCGHjtP6B8m8q0GFHbhFEM?=
 =?us-ascii?Q?zv9GwZTYxA9vKFDvDAKHQfTCVgGVVBbqeknwlTOpUuR54+Q4x7xxIZg13ONC?=
 =?us-ascii?Q?OKdL9zxFW4DZP2ST0ORpjZFaRoAn+Krk0W7grYvd5Yi+C4ThA5GADTAip5fs?=
 =?us-ascii?Q?5ANq+6M/bYwMWPsXWcOnPRwpBFwwd1DalUcbsJU3CaPsGBLLEPLDZSt15rOu?=
 =?us-ascii?Q?Gah3pu0tW4i21us+e0EgfKkv3JZDRXLcpezjB5UrUwRLtpzOvpcu?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d2329b-83ce-4137-174e-08de59c29806
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:29:04.2837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6TiSe/Up9g8J91Wq2g7UF4+gw6IM9klaaGfXXbn0zIy33Alh6LOfQctMgmEsToh3bPjcrz0+N9n+RjdbAlY6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3203
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27281-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,ti.com,nxp.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[valinux.co.jp,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_GT_50(0.00)[53];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,nxp.com:email,valinux.co.jp:email,valinux.co.jp:dkim]
X-Rspamd-Queue-Id: 40D5568C06
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 10:23:03AM +0100, Niklas Cassel wrote:
> On Thu, Jan 22, 2026 at 05:49:08PM +0900, Koichiro Den wrote:
> > Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
> > subranges using Address Match Mode IB iATU when pci_epf_bar.num_submap
> > is non-zero.
> > 
> > Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
> > introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
> > num_submap is non-zero, read the assigned BAR base address and program
> > one inbound iATU window per subrange. Validate the submap array before
> > programming:
> > - each subrange is aligned to pci->region_align
> > - subranges cover the whole BAR (no gaps and no overlaps)
> > - subranges are sorted in ascending order by offset
> > 
> > Track Address Match Mode mappings and tear them down on clear_bar() and
> > on set_bar() error paths to avoid leaving half-programmed state or
> > untranslated BAR holes.
> > 
> > Advertise this capability by extending the common feature bit
> > initializer macro (DWC_EPC_COMMON_FEATURES).
> > 
> > This enables multiple inbound windows within a single BAR, which is
> > useful on platforms where usable BARs are scarce but EPFs need multiple
> > inbound regions.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> 
> 
> > @@ -331,6 +503,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> >  		    ep->epf_bar[bar]->flags != flags)
> >  			return -EINVAL;
> >  
> > +		/*
> > +		 * When dynamically changing a BAR, tear down any existing
> > +		 * mappings before re-programming.
> > +		 */
> > +		if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
> > +			dw_pcie_ep_clear_ib_maps(ep, bar);
> > +
> >  		/*
> >  		 * When dynamically changing a BAR, skip writing the BAR reg, as
> >  		 * that would clear the BAR's PCI address assigned by the host.
> > @@ -369,8 +548,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> >  	else
> >  		type = PCIE_ATU_TYPE_IO;
> >  
> > -	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
> > -				     size);
> > +	if (epf_bar->num_submap)
> > +		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
> > +	else
> > +		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
> > +					    epf_bar->phys_addr, bar, size);
> 
> If someone calls set_bar() with a submap, without having called set_bar() first
> without a submap, we will still call dw_pcie_ep_ib_atu_addr() here.
> 
> To make sure that dw_pcie_ep_ib_atu_addr() cannot be called without already
> having a BAR configured, to we perhaps want something like:

Thanks for the review.
Isn't the existing guard in dw_pcie_ep_ib_atu_addr sufficient?

        [...]
        base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
        if (!base) {
                dev_err(dev,
                        "BAR%u not assigned, cannot set up sub-range mappings\n",
                        bar);
                return -EINVAL;
        }

Koichiro

> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 0567552b784c..fe26b7f7b212 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -487,6 +487,9 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>         if ((flags & PCI_BASE_ADDRESS_MEM_TYPE_64) && (bar & 1))
>                 return -EINVAL;
>  
> +       if (!ep->epf_bar[bar] && epf_bar->num_submap)
> +               return -EINVAL;
> +
>         /*
>          * Certain EPF drivers dynamically change the physical address of a BAR
>          * (i.e. they call set_bar() twice, without ever calling clear_bar(), as
> 
> 
> or
> 
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 0567552b784c..8aeaa6fe53f9 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -475,6 +475,7 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>         struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>         struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>         enum pci_barno bar = epf_bar->barno;
> +       bool use_addr_match_mode = false;
>         size_t size = epf_bar->size;
>         enum pci_epc_bar_type bar_type;
>         int flags = epf_bar->flags;
> @@ -510,6 +511,9 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>                 if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
>                         dw_pcie_ep_clear_ib_maps(ep, bar);
>  
> +               if (epf_bar->num_submap)
> +                       use_addr_match_mode = true;
> +
>                 /*
>                  * When dynamically changing a BAR, skip writing the BAR reg, as
>                  * that would clear the BAR's PCI address assigned by the host.
> @@ -548,7 +552,7 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>         else
>                 type = PCIE_ATU_TYPE_IO;
>  
> -       if (epf_bar->num_submap)
> +       if (use_addr_match_mode)
>                 ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
>         else
>                 ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,

