Return-Path: <linux-renesas-soc+bounces-30680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H6JOBTjzGmjXQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:19:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D24377734
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3512D306977C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 09:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929B439EF16;
	Wed,  1 Apr 2026 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q0D8+X2b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF64F5E0;
	Wed,  1 Apr 2026 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034655; cv=fail; b=X8FaEI02T/Jw1ZGGRIP649PwPizfUSqljQpcdjs8cRhseUh1IxM5Cj5Q/pI6sFKOjuZhGuN7TDZBx/wF5Zz0ZMBd7hw4T6z5ufaJlRqOAkhyxPGbGX7iHkfAa3qA9qiv6L+xrd1fDPdcLiQS5rjnklecBdee4Gi4Eu61JwFIarU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034655; c=relaxed/simple;
	bh=U9tSWwv17Di56cxFGDHA+H7r7khDeopYIS5Q6n3XirQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YV9Pn6RIlqfsJodbjGgpDphmYSpiL+pxBtHA6Eo9aypjLl6WsJfy4hWQnMo2ndBDVrVCtu2wvREiLsy959+Mkly++lzgmty66S0uCCcgcr5uqPuh81K3nJSLjiMAM1iuAdNgCIwsg8D904BwEZhy0aZc6zA3QW5g2TBGFeiL5vA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q0D8+X2b; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+xXn4c7o2o855ZU80Yf/5qTDmtzVneFHegcUdVa5cf1Jo3tIAGqWcTNJvYojqOwH56iEpIgjBjTBYg6cxp5HS/MNa/bNqJdGbAkZ1/UPgdDyErhE7ucIIOQkfb8xtr9DVba9mnEzJx4Hq1nD4UWmXbn1X+UHptGvURJ8nIpXY0Jd9R+TYkJ5SpJKHCU8jOpb7IMjuj3pAKtH1tILwZDPp7q+FEYfVYUBWPIztOnVZbzzsg9tdZpJ46i8ddkQJNqX8B7yXCxFmmSTx0IUqANWjtYJKnR9Mu/mt/V2pb/LzGg1+5sV1EPKWTPqWQK9VMuxKLQPKH6Ds0mCLfTjQx0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOWwr7I7lgYu2J3691Q9Q7ourj7Ucy7qEbkAfTjVyio=;
 b=dl+9Nz9Inv6fAxwLFwV6RgXPVWwDyPu/IpFLELYYBNoB0+YquYP/2xye7ykaS/pL0XodcgfV8W9oR7Bl5snlLc/ukeHNLinyRYvvciwhwtvasOZb/h1wUeJth196smKzizocr+uYYqB1P3QxrKfBPiUiAxmxm8X3avQ7yf9VOd757IU6+zbQu+BgDLVn7Mfc17ZdPwqe/Yx2uRclCLa4YO+8MTUI3S9qNGA3ngcdZ0y46hCgrnHLIW5Xm9CPgXOawk9EgDKznfTU9GAlKhPgxX1wwmR11+qK76q0CUzFJdZy9xqvBrqcVkwzvQeIyuv6vLBzhjlVKPb6WhxFHPZvzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOWwr7I7lgYu2J3691Q9Q7ourj7Ucy7qEbkAfTjVyio=;
 b=q0D8+X2bwlCu8LLKKCyu7CaG+9QkaZ9dtF89n06r7iqO1O3aB2tf9+1VkvxWg9Vo2ltTLsapcvO9TzCpor9UQi/lGQEmux6kPNsnVC6KwXH09ZxTHzNfy0C+xBDgKPTzkkvr+vyuHeR5eackUt+wOx/m1mc4mAh+16xpIXkAjfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13641.jpnprd01.prod.outlook.com (2603:1096:604:37e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 09:10:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 09:10:49 +0000
Date: Wed, 1 Apr 2026 11:10:32 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: tomm.merciai@gmail.com, peda@axentia.se,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 5/6] reset: rzv2h-usb2phy: Convert to regmap API
Message-ID: <aczhCMdmi9cpkGkM@tom-desktop>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
 <0259040014396ea03d58a87c2ce2a3f9eff2b0b6.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
 <283a6336658045be8906ee219620c994e85c7fb8.camel@pengutronix.de>
 <aczRo8HVUFqXKfG_@tom-desktop>
 <0bad9579a953cc069e17a7075a45c9eb9c7a6d8d.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bad9579a953cc069e17a7075a45c9eb9c7a6d8d.camel@pengutronix.de>
X-ClientProxiedBy: FR0P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13641:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8fbf32-d248-4b69-392f-08de8fce9125
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6CXh2v0FTwENBgLEJDZVJ1YnIF1cb+ui5/DBHrmj6h3bxSrHKd/na+eJkPO1DZdrFDxdgMvF2AoYt8hlvJe5hMchHEvS4abABLvyPCERIAtiklP2F4R5AtMJBtDfWX159+uqWaE3DLs4T6Jf9zwucs4KZuAq6RcJo5BrCM6I3iUBCpKShcQWmxNl1R6HZZhy0ynnQq35gmCmTr/h0z83kuCq0Y0XFEzTyWpQKi6yHzc3iYs7Q0hH9O6TtetFTQ++XJmiRuKWYOnynNTH3A3EgBjZfxfc0uEpiUJPPrUgu45Q1NJIen2qSy1vIQdv0f/4nH3fn3YGaYmD8N4psVUFYxXenZbrvokkbqVw+rQljet9SX/KsGHAlojGAqUTI+VoGq6ewYc47PycBOXciVS0joEl+EFP8k1CjVlTntnZm8j1vxmmCMAf9HVlXV+U7d/cAU2wMxBEf3HLVqay0pDovNW1RAv4byJ9IUVIJ4L5wdrXbv4/S8hctj5uIE2QKOj18PUxXN57SVlXMXmsIHAfbcpA80rX5GOW5E8SizuCXFsGnKyATLpB/iR5S98z11KnEMKUS6UnzdWSVPd49ntt+QzTL3k1BtQf66xw1I80eo/yOwK4IT/65SypRv8AOnH9G2X8YXjDa6eZ5PHc6GLPCxLAgqpBUdRm3XysVMZx1lgZ3UwwGwIbzcdKcBLOH74mPMeTdyHfrrmPfIoavzbe3aFVbqI1WfXKV1TkiAmeLc41Dix7R/U43lDPOoBKfpxAvXhe0DDzyXNsRvQBQIAceg9YZPWwCdHpRX4JTXcVS3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?32d27Fw8/XhtORVpGAxUnaKLR8nU/gPAauTZkYq+ic4IV12JtfMP3IXdO3ZE?=
 =?us-ascii?Q?d40NV55t3Ub8UspEAu7KcUzmAn9MnUkYMgDtPnrNaeF3hUpXlmY2DV38sQj8?=
 =?us-ascii?Q?DlOzu/h24EuIhSHB3FOYO9eeiY3cd7UnYqt0SPgWWt7gqQdRlBpuDYdCcozo?=
 =?us-ascii?Q?gQsN1TFRtzLqhummwzzCkZ9k3weri8Wzg9/Q8Wj52/xFFSeNYDAuOKm8yjJb?=
 =?us-ascii?Q?sWtr/W8xENCNb1wVTniyEN3Ce4ehmADra1vbzFjnatJuM22QMrfFkrCClBsD?=
 =?us-ascii?Q?cZICmClDg+oJVwALj+9kKndX1M+u3dIeoFQCIwKCpYigk1L9QGbogNPZu/Rk?=
 =?us-ascii?Q?uA4t+oXB3ESDSdwvIX3Ybr/CUsQ8TC9Z/FsEbPi0WqE878Bt4+nIgXQf25Af?=
 =?us-ascii?Q?VCARayZhONsEgWkHBmaTbq5Pel6bXU7LaGcvjJbnj3YJozrGyS+wKEy8S59D?=
 =?us-ascii?Q?AaZ7cn3w6UARmpsxLvLX9GpaHZdv3xZEbFinNDPG4PV8yPFBng7/w5ymi4a1?=
 =?us-ascii?Q?x2b3UfaagBbyyQYTM2eB+D8zXxVxp+jJbpQNxNKSR34JYYi7rUJYCUsIJztw?=
 =?us-ascii?Q?ac79gMXPIcBVu8jjeZG0xk6EyTcd09vkVKlg/uIriTf+nLsGtoZG2TNJVL1R?=
 =?us-ascii?Q?1ulzok9nOiLZ3M+eQcvo1JStkQogRVdesCtTua6ToHUf6KORjpKFS8FDs30U?=
 =?us-ascii?Q?sxQYRx/Y+tnhvqxpJlpi8Q7XQwEHCt9aaYhfqGttTAFWGWK+ZxTeyTGA2Dja?=
 =?us-ascii?Q?vFFeZXSYRSWPBBPqeQBMFR/C3nkmrhRzUn22sDMvxRrTtg+vTp0gTC+lHz3i?=
 =?us-ascii?Q?T/B3YBXM48+lfciym98LNbIZReEE+HYJ/RSxKLMyFdYBiziyvQES8lbiC8Ey?=
 =?us-ascii?Q?q3znpHz7R4I10lH6oHP80u0WDYO1GvBP2xsCoSvcPRN4NI6CEunW5aLjxzxX?=
 =?us-ascii?Q?/mE8YaRiSzYdZ+JYCsrI0McAhaHSTkXI5Ewgcy/TEPw/7uePlUi8ktim3+Dq?=
 =?us-ascii?Q?GcJUUprXERPk1zonRgr2EYgYK0dYBS0RyRiZqNLXTrZM4dKwlVxr6mqT0NDE?=
 =?us-ascii?Q?8K949YBAP6R/zbzCLgRTtGBSuW+nrMcoyh5uKaTT9hV64HqoqGDskCnVsYPM?=
 =?us-ascii?Q?vQw04H2NTO4a0BoQfJSaR4lOawmdeW7/w36Zho2H39Ueqhxm0DGvL7seShY2?=
 =?us-ascii?Q?CGo02JDbaowCzJux1g3wFd1IiQIoAgZOWBgMk9a2aIXdTll6Fd92bGtBodqQ?=
 =?us-ascii?Q?36HipxHORFxrkRFekOFuU6dZnMzlyTQBCb/50eOdFZQ/QEZ6eBnS6fkz24RT?=
 =?us-ascii?Q?WqTQyLyc+aR/xTJSH6zTugcKPvezJ2yzFAIXVdjJBqgkeA9jeaEYsFV4Xlem?=
 =?us-ascii?Q?q3EwsH1IXznqhGwwVRtzUrqbOD9QhsbRgNpqMkHkUdon4KkjDST7HhWpl0/e?=
 =?us-ascii?Q?deQgU/col4k2IbXSNgcBUd4XjHnysj8WgKU28hITQpqn0nn/5dGwh3LafiZZ?=
 =?us-ascii?Q?TtcbXhp/qWoX8bTujpJeAcJGuClx3vPDT4mHRe93kSfrCzqH5lo2v8siZA/v?=
 =?us-ascii?Q?YvZutKl/XjfqKCG9PWhXV1Fj1is3xC32elt8VJpuqcuUJ7yXcWpvEA0F1Ls0?=
 =?us-ascii?Q?oL1GsyB9i5FGMcNsz2acVqvkqvKPURgNH8tQFz1IacIh9f40+8acyERowQbw?=
 =?us-ascii?Q?tmFKC3HOeHoVKQ164gCCSkkOeeia15JYx4zSq+3tcAFHt3tQHeYWmkUc3lmo?=
 =?us-ascii?Q?fOc8FmGMCzIDxkmFgDu+EWoU/lHegbqm1LnsSNjpr2Iv2KsYFGKD?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8fbf32-d248-4b69-392f-08de8fce9125
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 09:10:49.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLfhxgq1eKrtWH/gWCYEgMQjpzWD6A5baaIcDELtoCsP510bnYAtpp4hEJt0GTUFVvCJ4jja3imVtsEVJiduwkUl38ItKPwII+Wi16PioWZ1UEr+7T/U+memXn9BtWu6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13641
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30680-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,linuxfoundation.org,solid-run.com,linaro.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 43D24377734
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Philipp,
Thanks for your comments.

On Wed, Apr 01, 2026 at 10:23:51AM +0200, Philipp Zabel wrote:
> On Mi, 2026-04-01 at 10:04 +0200, Tommaso Merciai wrote:
> > Hi Philipp,
> > Thanks for your review.
> > 
> > On Tue, Mar 31, 2026 at 06:36:45PM +0200, Philipp Zabel wrote:
> > > On Fr, 2026-03-27 at 19:08 +0100, Tommaso Merciai wrote:
> > > > Replace raw MMIO accesses (void __iomem *, readl/writel) with
> > > > regmap_read/regmap_write via devm_regmap_init_mmio(). Regmap
> > > > provides its own internal locking, so the manual spinlock and
> > > > scoped_guard() wrappers are no longer needed.
> > > > 
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > > v8->v9:
> > > >  - New patch
> > > > 
> > > >  drivers/reset/Kconfig               |  1 +
> > > >  drivers/reset/reset-rzv2h-usb2phy.c | 42 ++++++++++++++++-------------
> > > >  2 files changed, 24 insertions(+), 19 deletions(-)
> > > > 
> > > > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > > > index 5165006be693..c539ca88518f 100644
> > > > --- a/drivers/reset/Kconfig
> > > > +++ b/drivers/reset/Kconfig
> > > > @@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
> > > >  config RESET_RZV2H_USB2PHY
> > > >  	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
> > > >  	depends on ARCH_RENESAS || COMPILE_TEST
> > > > +	select REGMAP_MMIO
> > > >  	help
> > > >  	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
> > > >  	  (and similar SoCs).
> > > > diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
> > > > index 5bdd39274612..4014eff0f017 100644
> > > > --- a/drivers/reset/reset-rzv2h-usb2phy.c
> > > > +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> > > > @@ -5,13 +5,13 @@
> > > >   * Copyright (C) 2025 Renesas Electronics Corporation
> > > >   */
> > > >  
> > > > -#include <linux/cleanup.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/of.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/pm_runtime.h>
> > > > +#include <linux/regmap.h>
> > > >  #include <linux/reset.h>
> > > >  #include <linux/reset-controller.h>
> > > >  
> > > > @@ -37,10 +37,9 @@ struct rzv2h_usb2phy_reset_of_data {
> > > >  
> > > >  struct rzv2h_usb2phy_reset_priv {
> > > >  	const struct rzv2h_usb2phy_reset_of_data *data;
> > > > -	void __iomem *base;
> > > > +	struct regmap *regmap;
> > > >  	struct device *dev;
> > > >  	struct reset_controller_dev rcdev;
> > > > -	spinlock_t lock; /* protects register accesses */
> > > >  };
> > > >  
> > > >  static inline struct rzv2h_usb2phy_reset_priv
> > > > @@ -55,10 +54,8 @@ static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
> > > >  	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
> > > >  	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
> > > >  
> > > > -	scoped_guard(spinlock, &priv->lock) {
> > > > -		writel(data->reset2_acquire_val, priv->base + data->reset2_reg);
> > > > -		writel(data->reset_assert_val, priv->base + data->reset_reg);
> > > > -	}
> > > > +	regmap_write(priv->regmap, data->reset2_reg, data->reset2_acquire_val);
> > > > +	regmap_write(priv->regmap, data->reset_reg, data->reset_assert_val);
> > > 
> > > What is the spinlock protecting? acquire/assert registers being set
> > > together, without another acquire/assert or deassert/release register
> > > access pair interleaving?
> > > In that case you still need the lock. Or use regmap_multi_reg_write().
> > > You could even directly store the sequences as struct reg_sequence in
> > > rzv2h_usb2phy_reset_of_data.
> > 
> > You are correct. Thank you.
> > As per your suggestion I'm planning to use regmap_multi_reg_write().
> > 
> > Plan is to have the:
> > 
> > static const struct reg_sequence rzv2h_init_seqs[] = {
> 
> Even though the struct is called req_sequence, the whole array is the
> sequence. Let's call these _seq, singular.

Ack.

> 
> > 	{ .reg = 0xc10, .def = 0x67c },
> > 	{ .reg = 0xc14, .def = 0x1f },
> 
> 0x01f for consistency?

Ouch, thank you!

> 
> > 	{ .reg = 0x600, .def = 0x909 },
> > };
> > 
> > static const struct reg_sequence rzv2h_assert_seqs[] = {
> > 	{ .reg = 0xb04, .def = 0x303 },
> > 	{ .reg = 0x000, .def = 0x206 },
> 
> Consider setting .delay_us = 11, see below.

Thanks for the hint.

> 
> > };
> > 
> > static const struct reg_sequence rzv2h_deassert_seqs[] = {
> > 	{ .reg = 0x000, .def = 0x200 },
> > 	{ .reg = 0xb04, .def = 0x003 },
> > 	{ .reg = 0x000, .def = 0x000 },
> > };
> > 
> > static const struct rzv2h_usb2phy_reset_of_data rzv2h_reset_of_data = {
> > 	.init_seqs = rzv2h_init_seqs,
> > 	.init_nseqs = ARRAY_SIZE(rzv2h_init_seqs),
> > 	.assert_seqs = rzv2h_assert_seqs,
> > 	.assert_nseqs = ARRAY_SIZE(rzv2h_assert_seqs),
> > 	.deassert_seqs = rzv2h_deassert_seqs,
> > 	.deassert_nseqs = ARRAY_SIZE(rzv2h_deassert_seqs),
> > 	.reset_reg = 0,
> > 	.reset_status_bits = BIT(2),
> > };
> > 
> > With that I can use:
> > 
> > static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
> > 				     unsigned long id)
> > {
> > 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
> > 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
> > 	int ret;
> > 
> > 	ret = regmap_multi_reg_write(priv->regmap, data->assert_seqs,
> > 				     data->assert_nseqs);
> > 	if (ret)
> > 		return ret;
> > 
> > 	usleep_range(11, 20);
> 
> Specifying a delay in rzv2h_assert_seqs[] and setting
> rzv2h_usb2phy_reset_regconf.can_sleep = true would have the same
> effect.

Then we can have:

static const struct reg_sequence rzv2h_init_seq[] = {
	{ .reg = 0xc10, .def = 0x67c },
	{ .reg = 0xc14, .def = 0x01f },
	{ .reg = 0x600, .def = 0x909 },
};

static const struct reg_sequence rzv2h_assert_seq[] = {
	{ .reg = 0xb04, .def = 0x303 },
	{ .reg = 0x000, .def = 0x206, .delay_us = 20 },
};

static const struct reg_sequence rzv2h_deassert_seq[] = {
	{ .reg = 0x000, .def = 0x200 },
	{ .reg = 0xb04, .def = 0x003 },
	{ .reg = 0x000, .def = 0x000 },
};

static const struct rzv2h_usb2phy_reset_of_data rzv2h_reset_of_data = {
	.init_seq = rzv2h_init_seq,
	.init_nseq = ARRAY_SIZE(rzv2h_init_seq),
	.assert_seq = rzv2h_assert_seq,
	.assert_nseq = ARRAY_SIZE(rzv2h_assert_seq),
	.deassert_seq = rzv2h_deassert_seq,
	.deassert_nseq = ARRAY_SIZE(rzv2h_deassert_seq),
	.reset_reg = 0,
	.reset_status_bits = BIT(2),
};

And I'll add:

static const struct regmap_config rzv2h_usb2phy_reset_regconf = {
	.reg_bits = 32,
	.val_bits = 32,
	.reg_stride = 4,
	.can_sleep = true,
};

In this way as you suggested we can drop usleep_range() into 
rzv2h_usbphy_reset_assert() in thi way I think we can have
simply:

static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
				     unsigned long id)
{
	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);

	return regmap_multi_reg_write(priv->regmap, priv->data->assert_seq,
				      priv->data->assert_nseq);
}

What do you think? Thanks.

Kind Regards,
Tommaso



> 
> regards
> Philipp

