Return-Path: <linux-renesas-soc+bounces-19341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD3AAFB891
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 18:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08A8D4A165D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 16:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E9F219311;
	Mon,  7 Jul 2025 16:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KjScqVJl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293DD155A25
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751905555; cv=fail; b=ModVL9xJ0WDY2ExsUHIrhp6dFg+tSehA8k5xiMYyDnPZjbeqxF1e5N+FxyoulGWx3uqRE1nNlW1VUZecuoZqA2GkCD7HnRjj0S4aNyqi3jxdUjHhHXvi7S9F/Hfr/vJRMn2cziTDun8MvMn6xOOI+3k1LnfWUWZDpu6UXytOtlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751905555; c=relaxed/simple;
	bh=iCvtRES8PWjFaA071Rrvp5Bagy4NAL+cZqzcLTB7Br0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VgLI5deJoAW0J8+ljx9ZKzMrF3BHOUT6iP8hGMPOKiU7FtuxtjFGpAmg3/yrdR+rb47KXJDc1E95iJdSQTAq7fDLUuGDnCfztDG8KiDBFKUhmL36xP1PdFeAKRynX6Pot7RkzZsSEyIrPSb2UdkyD2At1TjGJc2wCfShb93LTZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KjScqVJl; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfXwKKiIzXzug2GxNlqh9Ea2Qq2TXHRsPaIOStHU4GZ74JW11OhZkiy4zTzvooSWAbPtYlyA2QD9xS5BXiroTdZlmFkQtxXWnSoltR0u+y7IJd36ckxj7Ey+gmSKlV3XWbdNoBMJPdFyxqhQhfghNVZpmYhOpdomwDVnSzkxsMB1Qv3ACzbh2Vwj2J6SPFjwA6l5B3O0kCmnLqH4ymnuUMbQKF6ns6TsuU8gHrJQoWbx35Q28951f6vTFkOoqY8ERJNXOv+Kbl+bChF8pyeK7QXQLRv5BscvJTMWDbIJBugmy+SLdJ+CH1YdkKH0r3JeITBe0Li2yL+NnCh+QyM1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tgNdZ+XSbCpuNU+JxaVyXwoTSbmKjSjbn2SkhNjOSc=;
 b=WE/c2nT09z+T8UT20Fvd0GetNRjAZ9VyQFYloXl28hETJle028vtcXsnaSc6XHKGRtcsu5Iy25oGoi/OY/dCu1Wz2DshrICiFggEMeYHAsaneiQM9Qi1skv6IRAEtzd/0PR3pc7SJ79XBvQqvNu5XNM+N3v8YGqVsEsPkCQVTN71+c3V5va+XX5BINIybaJ8Q1k8We8V4YYMYnCusUT8WFGwr26T1cq7QcAZaJx9Gms7cNPp7VmiflCu7h3LdlbQLVmPTY5hQuN8wVixEF5tj1DxzA2CNAqwV2k9/HoI7vHbADxbT74yXqHuz0Nod+keOn9OI7kWzJVJQDeJwR6P8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tgNdZ+XSbCpuNU+JxaVyXwoTSbmKjSjbn2SkhNjOSc=;
 b=KjScqVJlREUudqqYwefktspUF60mLo3sbkji7FOTD988zVaQEpMKM7z+ypMMEi9Zgpk9xS2U8VMfl/wo30Dwk+EKoYE9TdmPTxu6GjJnSh1fZsgS82ZE9LwXEX0OQjf9gxIfZB/XE845cvkhqYkBG9jCrgBS4xjX5Gg6iTL5eFigzjsJIGcT2eNnq9ORbSO04PV9ryFO4eTso4KflYVtfDo7fCg+B10Tunahr+wywZ56k2qpERgdzDRDIchNLL5wpLcTc2tqLDwirrSulsKZbKh84o3FGiKHhcPBoySpmBtY9yLhdJjhfHXpofyNvV8TDv0nBcXEcZEm83mbNWh8FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8163.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Mon, 7 Jul
 2025 16:25:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 16:25:50 +0000
Date: Mon, 7 Jul 2025 12:25:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2] i3c: don't fail if GETHDRCAP is unsupported
Message-ID: <aGv1CdufwRnYmWeX@lizhi-Precision-Tower-5810>
References: <20250704204524.6124-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704204524.6124-1-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AS4P251CA0018.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: f62325b1-29c4-455a-4e84-08ddbd72ef94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qfWj1mh20DHITG8XhKD18JryPVm7k08KDRIisEQ0CUfcjDa5MmaQobIvcgbJ?=
 =?us-ascii?Q?D2XydB/OKE65cHUyqimjZSKpDXe9fB0DPy8UCyQGQAEyPPTqFBS6bEeVUqVI?=
 =?us-ascii?Q?ZDCYP06JMAnmxdk/xVS4DMxL78fqzi5zBvMZATAgVX/8ggrAQtwTJuysvLtN?=
 =?us-ascii?Q?30INZV5JowxFxQgkzKRrwrbUUE0NxbPnjpSBZ4LOtO3XEsUMxAZdP99rdbWs?=
 =?us-ascii?Q?wGmDJZH0Ake4gZN1x9bEcEt539SP2JuX6aMw4h+8UApKSmT9HnXldb39DgsS?=
 =?us-ascii?Q?LEf44rSaMXrJnaR3/400yiRVvQU1BoqH5uBKRvXzdeyfigJF11iKXeqkxa/f?=
 =?us-ascii?Q?MRVl3qow6IyWJCaiF9kHwSL0Mftd1psyqm0hA72FxgL7InO71oJ7nk67LiZb?=
 =?us-ascii?Q?z8f0hDV1izQahMYA5WqoBVn/dJN/BwwaJVHCa33yAYgSSuGkGEiCp58PSgp/?=
 =?us-ascii?Q?+6DnZ6+oPG/GKmiRXQ2ZMQsA1UYDSa/pM8qe9I2kiLRb/3lzFlxFELZNokh9?=
 =?us-ascii?Q?RmR9/99Tg0f1CuVNXDFfUupE3nWN4tTZe98v/VNz6bm8SkqYtiFi+cv3cu1C?=
 =?us-ascii?Q?x3XiiA1ifWgpd1GVVXwAXYTYJqFsWcwvV8JzDo17nqq4WJKOa4qJo8JwSkD/?=
 =?us-ascii?Q?xW1MOw4yjD1kvq0IANtZ1zOj6V3lNSFkMhTNv+rZ8Wr0s1mdJEKFPU23RFKs?=
 =?us-ascii?Q?/sTEx4dBC0yUKuiD+Lo72F42qNNJO6XYgKfLuJABTV9sevPcVx4CkfQTtpu6?=
 =?us-ascii?Q?xcjOvVidxX4h0+LJiX0AiMMEsJXcGAfl01tfh6rL/h74aoBQUwKsVG7jrP90?=
 =?us-ascii?Q?r2nIxOY7tUuB6qmYDe8cTJ5EG5h8OrNeTblJwUGaBaBZYDL8HQbNnp8HySER?=
 =?us-ascii?Q?ErCOfqjlV+w/Zryw3ouxsE/eKvSbAIJnCYUfZobn1TmDxNgECHd9B+WEOHYi?=
 =?us-ascii?Q?AzwV4o/4AwNNZKscyL9ZX+GqTRXn5EKIaTde/s5Tex5Hu/Y/NN8WzEfRZKwd?=
 =?us-ascii?Q?bF9b/3gN2YrblycG82pIKo6MXXEe/URvDpki17MXXnmbYDr3V52lkS5pSCjO?=
 =?us-ascii?Q?9n3cHVYqpSVG5MLUYpmZj7CeQygRgPjXWB1rLW8y9RpoOB8Oz7X9SnuTOUqM?=
 =?us-ascii?Q?yr5BPNAQEd2tev6jEDjYCjhHsFzWluCYLvuidmO3PAHRu/r7k0eurHH8ithr?=
 =?us-ascii?Q?yKJLX21yiEZJTcxOMuXW+f7x3XjyymwS5bSFb9oWQoLIXvgHOulwOdylMSVm?=
 =?us-ascii?Q?MD1x9rtNV7o5RBDKpKN9ljH9/6zqJW06/UH1Gz7JSfCiGEPqkR5gVzbHecKy?=
 =?us-ascii?Q?io9xJTMtWrT/g3MqPQj1HPapWzpS6edyGVTpRbTuiSnCmvC4gis7qxvEyNtW?=
 =?us-ascii?Q?k+zoKsdtaG5dL0o9oiQiK8LWnTLgc9EWUwM/Vrz/g7ZvBtczSV9MziT/Wmx1?=
 =?us-ascii?Q?jD0B/kDQh0vXDPHcYWas0SLamb/F9sq3TQs1LJ3AxdIu5nJwDnUlbg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+iCQnMHikHY9ytGzp9GRtyKP6M1kXZNrHXk8YvjxlwOOJvFNrNvZVLYl+TEJ?=
 =?us-ascii?Q?JSz4lj0gQarMjkQGVaEFdnGm990ACYkQPPuC2O1yBaW+d2dbxbywAZD/vU8D?=
 =?us-ascii?Q?V6WMmeVKXRPdalJy+sZOwYRD/pz8ByVGka7QSJPNIzRlFaQYz0m9yIvIsqfO?=
 =?us-ascii?Q?s+ABRxLL7pQQIsUvSHjEoQM89rGI2OgqpqXh2VDLw7CxLK/YeUu7Hn0gYaXU?=
 =?us-ascii?Q?VTkhBPmw9tq8B7GLxtsbAaRcwr68YtpeZAq4y5rGvjOs/9eBoKJC4nuyfG2F?=
 =?us-ascii?Q?wNQFtm35sPHD4BTICw8/e92r/kgkj93ETwhu6RYV0WJAn+Q53kRgAxbUsh9u?=
 =?us-ascii?Q?dGj/1qfq93MbfqdiG0bd9yqZi2QrjPUiyz981boF6y/fNNEC8dwkDFmlazMz?=
 =?us-ascii?Q?faxe5LreoRdlBSy7hEW0emj8INNZKjs6oIxdxeiiZZASzMAlrf9Ki0qKZsei?=
 =?us-ascii?Q?7uyyWV76H9DAXjiRPl7JzB2q5Rr6NeeXlxs1CCM8mudMLFW+kirmgfjoWnS5?=
 =?us-ascii?Q?XeMaiGxHzPjhZlWy6C49kYMBfS7rLElr44C1211/bMVdywGeHLZtC+7hpnu0?=
 =?us-ascii?Q?CDf5pbxw1+1HhImGca0pF3o09ANs9Kp2t3n6Q5SD5Et1UVSEFdvZTE8y/y+X?=
 =?us-ascii?Q?3Iuran3ssNAZ7qPl29bVd4bNunHLumHHtNiklc9jvgIkIiVy+VwWN8Y9CMbh?=
 =?us-ascii?Q?AkEz0TlHOA8O5hvwlHpevuzzcd8sMrTRrRjkbLS2CuS/4UkGx6Gn2wIINWj0?=
 =?us-ascii?Q?QmQM78liISQ1WWVISxm39OH2Bvdz6w3h6Ylocp5ghtQCHyxrQffkkORNQQhu?=
 =?us-ascii?Q?BYyGqi6sW0JpGauoS9KqV3SB3RyvixAX45jVcm7BwNtRgKEgPXu+mPyz+mf5?=
 =?us-ascii?Q?UMU9wgbXqqMuW9fzXsejsg/ifqyzqVLIsbSHuZzTKCYP7v97SnxmSNQAc+Lm?=
 =?us-ascii?Q?a824xnZf1srZyVc6JXZDfYTpG9CTneILd9EDAeQ6XnY3bFJM7lxS9jn38WHw?=
 =?us-ascii?Q?k2myUoGFoYTaqRzjndbIF7VWlPpA221FOWE720K9v35nOmrStxPqLKb8xA7J?=
 =?us-ascii?Q?SHVLWjpgJAcu7YQbNp05PfQwEnMZYRS+wCw+TYqH3RKz9h7kWrVooEm/6JnI?=
 =?us-ascii?Q?7coBhBgs2UamwnxSTVvfuJ5E0lMzmD97QW3OuQtdpR3SPd6ykGe5WOohXBRO?=
 =?us-ascii?Q?gma99TIQZXSPwqgeB+SvUm8KfhDh+dak11jVZ/BFjGmdx8H7cRvgBWMqpoa/?=
 =?us-ascii?Q?w4yYC1Ov4JTLbXeMHXUDz7RW/Gax6O+4TAPpu/pPmkf93t98NKDyvXtHBiIt?=
 =?us-ascii?Q?3Xdoz2hrSrG9dt3yzDz6OzduR6+dAGSsCF/bVA/LHAXzOy2RBctH873XHcP0?=
 =?us-ascii?Q?4BWhH58/mPndohhamqqGWtNy+Z0CEcGuELX7KtQOmylfsKFF07mFOhwFbDds?=
 =?us-ascii?Q?xcNxiAfSuMU2qpFt5b6gvK9t+zZJk1Uga04CUjHWiei40c41ec4Hx7h+io7J?=
 =?us-ascii?Q?fWDYgoF7U9hgZTUJyP4MHU5293pGohIXzs1L3cSc633Vjt159V1/dGciRDBr?=
 =?us-ascii?Q?cLZpRq5XXcQqVEj0m+0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62325b1-29c4-455a-4e84-08ddbd72ef94
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:25:50.1572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLXuNcYJknhtMjS79BlrWzzUnG8eS9rch9+zZADZoCt2Unpf+ZIQ1+Sadz4RTeNsiPibCbTSOGmvIfB4uH/u4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8163

On Fri, Jul 04, 2025 at 10:44:32PM +0200, Wolfram Sang wrote:
> 'I3C_BCR_HDR_CAP' is still spec v1.0 and has been renamed to 'advanced
> capabilities' in v1.1 onwards. The ST pressure sensor LPS22DF does not
> have HDR, but has the 'advanced cap' bit set. The core still wants to
> get additional information using the CCC 'GETHDRCAP' (or GETCAPS in v1.1
> onwards). Not all controllers support this CCC and will notify the upper
> layers about it. For instantiating the device, we can ignore this
> unsupported CCC as standard communication will work. Without this patch,
> the device will not be instantiated at all.
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * updated commit message
>
> Please note that Joshua Yeong was also in favor of this patch. Sadly, he
> did not send an official Acked-by yet.
>
>  drivers/i3c/master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index fd81871609d9..e53c69d24873 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1439,7 +1439,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
>
>  	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
>  		ret = i3c_master_gethdrcap_locked(master, &dev->info);
> -		if (ret)
> +		if (ret && ret != -ENOTSUPP)
>  			return ret;
>  	}
>
> --
> 2.47.2
>

