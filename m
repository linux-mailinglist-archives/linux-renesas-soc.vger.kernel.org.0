Return-Path: <linux-renesas-soc+bounces-12527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C93A1CDED
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 20:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6331673B2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 19:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7EB15746E;
	Sun, 26 Jan 2025 19:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wwSyjMtn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1337DA6C;
	Sun, 26 Jan 2025 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737918015; cv=fail; b=Vam58Qic17t+0m1GBd9ugkJNKROl8NJZei3wzyCpYq706VDLibLy33bXdksaAFyk+BuPC3kWLTpBEmCPg2i//wvh/7CCHu5/rFX5HI56x6FXh3qBZcH70GtHFjXY68wPpXY4IJI4SOfajrvF4YlL5M92SLNMphi37b2F2xm9sOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737918015; c=relaxed/simple;
	bh=33729v4u1ASlAKssExZMPGPIogPaEVc+sgymCdQ93lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jb9XZPvPoB5mBkjwpci2HbxO8loNiLFO3f5/GIVoIkJ8Emqk3OhKXJ4fm5duyD6vS8nfV0Nq2lXNGhZhK6yTEPoQgAgDLrUwjhizk+BS5YQciyYmDTeQd8KfFokk3Y9SeTOF7GDNdnPlhRu3/wU0egz7qDJl2CLCkx5H+nfCK28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wwSyjMtn; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8OoDXKXIAQ9hLEmqiBeorZRBltwpLR6kn1SS9erdeJmqgNc95vE1xXbSlX+Oirb1CcnrArCOfl3BuR2PeR2ZlrZs/XFdLeeGVfJb7bYAcDVmdE3lTs/f3yCPRskHGH6cWoNGQNMbiTHkihNnct9MTZCoFHs4RuGEk46sXvVVwdB4qAJnxDFoCamDX+cxo3X6SIqNInOD+17sCZNTZ91EkptdfgY0eN2Egi9oI5+yqsMqk8XthBSaeJqTFmc86hrYpRMtUpe9XhCZRRmCcr9hwmILt7hsfeCTvKgarRgZKEArsHe2tciUa55iC3Oq9/VbVSONFOMxCKLRtsFOSpiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z34VrekWq1H6tZvd0FNccSjAb3RhjOUZmhN0VywTlfU=;
 b=OEcBkw/RdDFCzhy1mU5s3WNWBazyLE3Q3WOOBhMPUhpA4m4OFZVrNNOA2wjufLkY6UDDFNzDPdUerJYqtvTMQ/b5IyPmony4VA5b0620aGIdB9GmLifcFWWVXeKCgdr+be5TXgsz+w0UjsDIHsS/IYtU7ci+dKJ9CPVmUcgsrIDK5ZWCwaxnjuGeUqddgRnS4DmN5nD6xBN+k57x7UziZRvc6APdhbS+KbQhXSShiQ278h5NsZ/fQbbdFa59OaI2ZI8WDDzq8yo/z3WQzh9S9mVqTIoNPdtl802lPbrXCq94IjkzC0XkXc3Yof/YuSjWZ5jVOXQLgR8dTtMkWxHNlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z34VrekWq1H6tZvd0FNccSjAb3RhjOUZmhN0VywTlfU=;
 b=wwSyjMtnnPgNyXUdMA6qi8Mmw8BkJHbdEWkJQuAo0Iey4vAarqzalKT1Dhs8AKqNdN5X6HSepOqUUVc9PYsP0F1ubeL8/Wqy7f957QK1iNPpAu6Phv9zfU5fXRxnKJEAbrh6C4/YHnTewQAExjIDB/0wPUi59lDAg2oVWMIUiXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB12308.jpnprd01.prod.outlook.com (2603:1096:604:2e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 19:00:10 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 19:00:10 +0000
Date: Sun, 26 Jan 2025 20:00:01 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 3/7] mmc: renesas_sdhi: Arrange local variables in
 reverse xmas tree order
Message-ID: <Z5aGMYTL0Noo0uTf@tom-desktop>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126134616.37334-4-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB12308:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc9c73b-726c-494f-7d22-08dd3e3ba80e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?isZCmG9R/48GBMNV5ljgSGHT1cu6nWkrEbTseMg3Reuo8gpyFLxH8A700VOu?=
 =?us-ascii?Q?AtkmwL2XTBum/dg8ItW5y43MmkzS09vbS3c4AoywR611zlHdj9UyOpKq1XJ3?=
 =?us-ascii?Q?cu9wToXtdSPXHo05szkQBnXU0N7M57kDvDZup9xlBk0i0LiEMIDtJwc1r/M8?=
 =?us-ascii?Q?riuZy3dhg4ER6yq3RgVniygy+GLzuYqb1PUYdZp7WSGhVErumS7S6AK8zmot?=
 =?us-ascii?Q?HMHVvxUZE4k9e51oL9/DlfBNNayijU7y6EoIPsRRUpB/BxVYmAKeEX3AV3sj?=
 =?us-ascii?Q?vcCApeQW8Tdq7V5pWperjDi5F4tuCSNozqroV1C+oMGL2N6VlTpFfynbQz54?=
 =?us-ascii?Q?eQLqufQTn4KTSB6pdOSgrqAcX5/QxuArJkV/sagU5P6VtaLgMSRZHWlw5gcS?=
 =?us-ascii?Q?FuNFvOvAx/L3V/w3GzMIa/jYNpLu0GpxGPc+gK0QiGM1uGbt8ch1RZJMyWLb?=
 =?us-ascii?Q?vds4lFMN1JyrTalqF5EUCcmk1xjjjcoTnGbnp02p9x6w9b4yEqrvOEjLflI+?=
 =?us-ascii?Q?ahkKcKmeFGidbk4iwtvvWqih2WsAsLzStTuulRSiIVqBSUvvDNohcPINcamv?=
 =?us-ascii?Q?/EgHCI6VImL8df1NchV6ajWOL1XTRg6lZ+m/4aM5Ab/T6PmIpi2y5loFU1CV?=
 =?us-ascii?Q?QCcTWc+vKrze9PeSgsjx1hGggJf7nS1x0Q0uwDLhUYh4lkwCEmR7oibFKQSr?=
 =?us-ascii?Q?LxM9kboaHVX28zY0IJ8l6G369PdWoWnGfzvF3/X7mgGNbOD5MNofyiW4A681?=
 =?us-ascii?Q?1wxoI4D4WxJ5NrHiCq8F67Osmi5orQ9JVuE3+Q/7o582U2hQA/dmQXHCnuea?=
 =?us-ascii?Q?h3NcbNcTCrA3JRdqbWg30UEdQb04+gb4a7o/9GbqFYuZH2v5gs3Hli1uV9iu?=
 =?us-ascii?Q?OSmqGg/r2hZbIR2YGBMMbpx8JyxQvTEjfVsskqM4hFeb+w79oHqJ6NLSl9Ak?=
 =?us-ascii?Q?eZ9r2IydY00z0seU3CtyrTwaF9gFLuRAUUoN/uZ/2T65OP8Pae4VC1iRqNa7?=
 =?us-ascii?Q?rDZABMMz1DMkB95eiBnUV7pi9XNEwLeYrJieV0/CpXMwFQX3GtFClyJAYkIm?=
 =?us-ascii?Q?kvOxKXBcgVBxFqZG/hy9sMgda/6Aok0OIo6pe1r5h6CDuwEtuqJDhKwx9xMk?=
 =?us-ascii?Q?MI6Ajp0ln8luPBSrk09uGwKUFTGa+5/Uerm22vnFsFlmZ9yzr1rbKj+UmXdj?=
 =?us-ascii?Q?aOCWzX9RXDJNR8zMd4q9EoH1o1gxQrM1+12qvi0+Ga3dnCALmrK/qq5lKXOd?=
 =?us-ascii?Q?Os+9t6MuIrVVBl5rNiLXvB0+k9TLvODFH/RHKUqp57d710vzsQD3HJaD/LIu?=
 =?us-ascii?Q?5OENv1FxbUUgjSre9nIWPJlz9HfIOlEL5W4szCd+MA5WQepfg4b9l9TZ8y4H?=
 =?us-ascii?Q?A2tv3Y1P7PjoEI2HY1lpscjpcPpDimaZlhwOkFUCIX7IIAIG6RXiNVVjQd2D?=
 =?us-ascii?Q?nbBitXnwIkZTkyT5HWKJ+p53LDqaEOdT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xje8/925/nUM4VxhhXmwr6apRvbIhY21KfQmuy3Z6/9Qar1Nu3dkF4wmRpSr?=
 =?us-ascii?Q?cfjavE5H4AlJlJDJdOB1qTMLG7Asb7u4pIZavYpL5oLUtyx7UQEY6SjXt1TO?=
 =?us-ascii?Q?qfwqW2gtwtCCDj/93abnld3y3/Z34uXyrMlxeyTX+GVg3Xd01IxSocF+tZo/?=
 =?us-ascii?Q?8gz1LSVfX7tc7eqaj5YM2FklCX3mVlHfsURb2KwWDzHbGS9CSX/U2Q5OzQmh?=
 =?us-ascii?Q?wx4bC2wYfms8cncXJHBt9M4/6c1eMlFQid+RDuGy3WDkjv+S4JMGaEa+IvCw?=
 =?us-ascii?Q?MDQz8DcoQ061YVL6cPpfHSxXy3AdCsZXspD9mSo1XHsRy+OHgDzMYP/FfNXo?=
 =?us-ascii?Q?Di80/vX2fZ+sPKurjBefUaXpk32WCpJLpmYBgfzC9F5tEzj1wb1mH2h3wIzi?=
 =?us-ascii?Q?Ojy65qRv7MJNaFIRg7b8JWd1F0zwT3wnbw7WY+vPU080kVyD1f5/k9/QPCL8?=
 =?us-ascii?Q?bDStxc3wS3EVrp713lJ+Q4EUZeGj4L8Unn4ekRnryJsj0lEXfpq60/rxkaSP?=
 =?us-ascii?Q?AjDYyeHNB5/FpnuILoG1xelYbFMaL6l6bjdzQTbUHFRoAhY829E3SB7fPVl3?=
 =?us-ascii?Q?/VqdlBZaq6t49iYG5I4PTDO3b3RR+u1iePhOPPcvoe3Bq7fR3uYKAeuWh0yg?=
 =?us-ascii?Q?opcwwnhxwlTD4/JjqrMZMuQSjpqlgBKqeBDNZRHin2Sbr90fSyJ/apU4k2Dq?=
 =?us-ascii?Q?NEoR96H3zDZRfATjXVPXXOged25fMUF72xqqfS8q/jd522Owegb2igmLtzxR?=
 =?us-ascii?Q?yJK5mTQuoVzMa40q4qMcWRwvsZXL/fIF5PcWZC3eigZOG5a2sQ2VDYa8qenk?=
 =?us-ascii?Q?vAzwtfpB7bYPYrm1TFBkfC8WKhPnk7uZFWYK+mv5kHfCPEK3arWMApmAodkA?=
 =?us-ascii?Q?xcmCfGjzL8veJ3lVm9/rsMDoECTAZAgPR/YO+SwqcRnhQVZXpqOrT7M6h5aT?=
 =?us-ascii?Q?r2qltMLvr0mcoIShRlKxIGM8u5Gpez11idBJi+R5kmvpP5wct5TnG0AObwaI?=
 =?us-ascii?Q?mNA0M0qthOvipJ4Sqdx6IAKnJ6fvLBO9kehAehb8C8sJ+vVV6Z/dBuUhIhQd?=
 =?us-ascii?Q?fD/SD0n9vhwLO0YPg8ZOBF4wNWJCf6OT2/kfv0Nnt2w5iPRLAAzLZxAjy62O?=
 =?us-ascii?Q?mkzMl3Yd8s90IE0LYF+x4VIinh/Z4R2BMwTpIl+OTiGdx/ajeDkrOXkXhlmT?=
 =?us-ascii?Q?9yH8QlVujWoGcO9kSaokz5rUWi3QjFwHPl5HWwKABttpV8l9CT45DayMuDQQ?=
 =?us-ascii?Q?x3YWy5F32xiUc9BwwF5HzmOSnvt30ewNSjePGr64ewZCi0Uu7kgYdBOUViIM?=
 =?us-ascii?Q?HTP85Tzn2BpEL8jtu/91XXudfe9+5pRQVx64JygCRnLAnSjTvFlxxhYHnB0b?=
 =?us-ascii?Q?Y7WnSJzQupBAX185h3Og/15qsgz1isiilzwaHWO+vae2dhaJw2vTgxtiyu/N?=
 =?us-ascii?Q?v05DP5pxrJW4EuKZ0CshPUh7Qxv0MTAVesq76fEdoERuuJoApomTtbgQs/Iw?=
 =?us-ascii?Q?muaNiUrE74t3ztyRLr3wGY1j11QmkN8Hi3Fgrpm9OEu2U/Hsh9phKUKI8ad1?=
 =?us-ascii?Q?v72fk5Gl9MrR/l91q4xMMlt9Clbd2A/Q5m8KJdvy4Wy8xchv6bk65e+1gZTv?=
 =?us-ascii?Q?oFqTQYlhKA32GqmJRA2o1a8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc9c73b-726c-494f-7d22-08dd3e3ba80e
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 19:00:10.3061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLKKB/jVH/PWB/x15WOcSafHmOeFs+SQN5zEJLBiPXojDU2G/q0Sps2kvevGXoSuOoJs6uafkxsl+2FgO8KS9GMzmKUgXstsB1qOxj9NjTE4CdW3Pce5l0H2gFgrY+S0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12308

Hi Biju,

Thanks for the patch.

On Sun, Jan 26, 2025 at 01:46:05PM +0000, Biju Das wrote:
> Arrange local variables in reverse xmas tree for probe().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index f73b84bae0c4..6ea651409774 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -910,8 +910,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  		       const struct renesas_sdhi_quirks *quirks)
>  {
>  	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
> -	struct tmio_mmc_data *mmc_data;
>  	struct renesas_sdhi_dma *dma_priv;
> +	struct tmio_mmc_data *mmc_data;
>  	struct tmio_mmc_host *host;
>  	struct renesas_sdhi *priv;
>  	int num_irqs, irq, ret, i;
> -- 
> 2.43.0
> 

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

