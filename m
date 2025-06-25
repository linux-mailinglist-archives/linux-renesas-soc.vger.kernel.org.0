Return-Path: <linux-renesas-soc+bounces-18738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97785AE8801
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 393707A1FF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4F92D322D;
	Wed, 25 Jun 2025 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z5KqyBza"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC02BEFE6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865105; cv=fail; b=OxpkDVNJUq3G7hys3ZEpZBLNBWl09tJI3I2XMvcdI3whlw/wfaxE527JeMLN466Z/yF0J0NXHhGfQb23sD1pwG2q2UuQeHfXauA6Th9lhYV+6BiAmOQFp6J+zqvjAyMNCa/6rDJZ7U8+3kKNif0W3Re8p/esTEgBmc6rdaFwRXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865105; c=relaxed/simple;
	bh=Dm0BytxPl2tOh0Xxa96J1gdO53IbCFo+bUM4itKU/p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=klKLZGdftyQj5f8fOXDDskceUkMkAObISRVUkafIqcpV4r2L1dtsskwimu7+M07zeYjRXhrAju/D6BXbMw4JhYmKQNWqaEuam0XEbHKVV1BQ5spOc/hhWi55FLTm7K7/TSJMnWirT88dqwXr3avX4UPxMKg8MbLZ5Y+ptIR2xvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Z5KqyBza; arc=fail smtp.client-ip=52.101.70.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAl0sP3IU/cbgrSVRreBs88Dc0UHMs0PhIT9Qftl4I1SJo8qF9r2YSKSSx05LXXMvjaI52jEDuSbtNghFb+G7F7ujW23ol5da7QKcofk1PMl4HJL/iFX8kXNwyeScDJsf0ok67VFfjpJw/H9jtRkAvWAR2r9Tf9KhnMKhFo2dEdyV6Qz9WFpkJJcvW7l5peX9OpjXZy1VCgTfj3srp195caHeelq8vI1kRu1ceBj4yLf4ebpx3zk/vUenKZeqnxkQuKvPCs+nHLBFSqVnXJnRJhPTzyKiz6/svbA5A8zBMZRUAlDTBLcQWpNsqXd7Omw3RcOltzF+QsPrAO5t1I9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozys79Gj3u2XdDl1jFdLHKDFBg1OAdKy1J4ANgIuRRc=;
 b=rSF0phkTjPUcx8lFXH1kPuHE9QDKVc80DnoKCy3cbkx8KCIltIeO0rHJOAJ23uKvKei3CcE7l2A8XNOxUFbrTcYRcCw8ki/hoxrhuV3fKAbcx5u/3/H5gcG27xt6mKsG+PBoAgw9MhK1hqKoEd01qhtpAjSWj8WeTSO81fiQvqu+OSAcxgGaFOSEB188E+4tigKFDSVHqs3XnrV05+q1u+96Iob4YDVTiyRtE5rly7Yj3mECiJLrUDWFwcpPNfxUJRf5Xs2ehUSZGuObwNindyLiksyP+nGe7Ygz5maLhTnTs/wLROrJDDPaVkZoBaZ8jbFvZAEQAd5yd6Fdeesk5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozys79Gj3u2XdDl1jFdLHKDFBg1OAdKy1J4ANgIuRRc=;
 b=Z5KqyBzaQ4WVaNuf59CmcxUOTVnP6Dxf3fOoZK5MvrLKPEHsKbTCrDjL8Ksyi2xawrQb5vXblBNAcMUVC8LxiNfwAwydejrdzrTkkThHfYMH7H/dYua1r5AfHw3eSr084UVwqy340tG0UEmsAX/IIz8EGCmaIConwbNPjrW7mQLtF+agxAK1M4TPrXcogMEN217EZOI5pXbe2D1qSSDxG68mbonF27v8nhVMk6ft0QVq8znpVya2RbHvjrckHmC+WlHa/Pk2T5+7hOhJ6d4TbxEZjhuQkfLDu7D7GToQ8TM7Fdy3tXwawv2StY1XhE8YGNoZBpEEjmz67C7cGXTF/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7469.eurprd04.prod.outlook.com (2603:10a6:800:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 15:25:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 15:25:00 +0000
Date: Wed, 25 Jun 2025 11:24:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Message-ID: <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
References: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AS4P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: c3840f4c-ec49-43cb-93c7-08ddb3fc7340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?498B8qZjQPz8wWJKXBli88twVzgjMBpHRkVWnLkn/mmw+utsoH83y9LFxW7r?=
 =?us-ascii?Q?Mrn1oJi8vf5t1nviw2LRs3zjDygJ208LB8ia0KQddP3kj5pPgkQWcMU3qXQ0?=
 =?us-ascii?Q?xcXmRmJUmwNvroJLxOwmOUG04uXj1Kwe8HpphvE/sKIaNbK5beqLr3hIkBBT?=
 =?us-ascii?Q?4YeHe42KKYs+zq1Y1lhgEFFDKASZSFs0trQOTm9HqxkTng9L1Bed860wjq4X?=
 =?us-ascii?Q?Qzekqx/0Tt27q1Ar07yZamgy/HX3C1DAqfpENy4IcxNRm5xoioxFzlFFLX6p?=
 =?us-ascii?Q?OpFWJ4WcSrZVt4xzDBzCSanhuxXCW9ck6Gyw3Pgqm1xEhA4u4qMDBfaQLK0O?=
 =?us-ascii?Q?TiFzpRTmGRiNXZmf2OB3bWBBZjVU15GJnjgjvydBGRQidUQH17Z+zL9g+Wnp?=
 =?us-ascii?Q?rFQL6CxKbe8EkIKjXJOich0a/7I7WysuJKgOMdOy2UwSNVq0uyr3ktOZ4X2v?=
 =?us-ascii?Q?SZ6Zw+FOTsMbMYhdQNW2zXOD6I1cHRbVf48jrksvxhLXwofistXmzFiHCsKR?=
 =?us-ascii?Q?XvlLYWUCnKwPmqouTK4znktQQ4niHY7WwWkTw32cWr7ovuhGpveNKlZaaGXa?=
 =?us-ascii?Q?dXGfMkpys6PT1Jx3ZB6os6T0ehh9v/FNvhgReS/xQtRadKQ9Oyae8bibvz5W?=
 =?us-ascii?Q?hxLfF4bTLFOqOw3LPhwOXxeLLMly30RuN4tvFHfd51ZFTO03nESqnEUE3jqO?=
 =?us-ascii?Q?bpNjM0+BH+OztLfjkaneI4qL1/VQc7m5XnO50npjWjB8RUdpiejGx8vltXjN?=
 =?us-ascii?Q?1fezTNZ2GmWag1g/hUwyBUBe9xQyxGtiDItYJ/t6m5SGbbiU8oD7Os0bcLDd?=
 =?us-ascii?Q?9q2F3O5Q75eeOjda8Nr8YR5RSn4Q6kgpVAOmKhrSlo/rq8rmiLNCnlnvtOu0?=
 =?us-ascii?Q?Ikjsfh8Vqt41C6fx9uMhvubEKymgpuaOGKuI/E4pLmbxy0qxjG458Q2fuccX?=
 =?us-ascii?Q?ScUf/rDo29JX0oHMnq4SsTy96x3K3PylyTboNk4eCfG5YXnF3v5hyrG6f5bj?=
 =?us-ascii?Q?EIW/8W4bzS5/xdG68F30zlYtMD+0Z3fUhk6vE5uwODycQDGE7q4PLOZ3C9/3?=
 =?us-ascii?Q?WTiAF9aH8PmdZf8ObeKTZXPt3mZqLfU+SFnjJ2iLmu4pn/xVY08nDFbI5hmG?=
 =?us-ascii?Q?1gkJnUzY/Ac8xNDl9Zj68JPyp7qqiri56g+QGxg6AcPHgIFVRfELAVXmdyH9?=
 =?us-ascii?Q?WM4CdjQmQOJRCOSy+NrCrtRgqPxhRUeyowrarDVTMjTO6x+wIiwCGRRAPJhV?=
 =?us-ascii?Q?htBoMTKg6YPiGl4pdwtUThh4APOuD4JQVe6j8mZ0vvSmmIhb6fUY8BxNSHsA?=
 =?us-ascii?Q?R3fgVyR6WQXBvx8mRYnMpJu2BNTMvIwiUHJ6+70TJ0FA1Bf25BuzDV4XbjPG?=
 =?us-ascii?Q?LPMgtoAzDFVRegOf3YBjDtODtTCkvOggHz83t2oesOdabyNNCfSe7liIt5+V?=
 =?us-ascii?Q?ub5Z0Z3uAovqx3a6hfDrxfiLMEhJ/jlBfb8fSYVdFXI8w9tFQfYUpsq9/IwI?=
 =?us-ascii?Q?oV0Q+1Nln57XZ7E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o8ZzLwhL3+2QaNd6i4syz19B6XiY9KRUO8nsnApPQ08ZQEyVdrhpXsSht3u0?=
 =?us-ascii?Q?Q550/cipHnqyeIne9/hIa0x/UUuK6AE9MYiYZ6ZwfQXGFEGeLwss6hyMJZay?=
 =?us-ascii?Q?tOmgoIIMx5T8V3Gy3r8ABBo6dW8DJSYn/ldyv7S9rRxKiVHsFtQRemFwJapJ?=
 =?us-ascii?Q?1DDkQddbPCTF+MQ+XuZYgTVpRM1CogoDjySLTZsYu6lI4tHPLDq48TR81E5V?=
 =?us-ascii?Q?A/NqyGJ3VqPwUzynMVCaF2e84rAQRFGFQ1tC+37HWXMPVUvWq19NsKY7WOET?=
 =?us-ascii?Q?s/TC1gsMLXZRPq0wZW9Ca17XEP/s2sXKZcaxU0TPdT++lDJQ9dCdORo9kf7d?=
 =?us-ascii?Q?CP+KzqOZvWKZbwkbjL8pQW3yNIveXk/jdi1NCTLQtykug4zLe9mlIPJUXUlV?=
 =?us-ascii?Q?BqU7cIsTsPyLHJ8asTkCJoDxGfwd7z+92NSIrkI2PIPjlAsBc5iwPbthdjDu?=
 =?us-ascii?Q?KR4MUy/i9Wtawu7gQgtW9m1u7tolvcMZY//FYEm9utU5r41Zt94LFVvorHyg?=
 =?us-ascii?Q?NDfp9VBBQ1DMiO1GPfBcXxO01d85sQr56sRxQYnAZTyMAwNclgQGA1D9XYiz?=
 =?us-ascii?Q?HW+vJGdp0YUF6EbwBRTRohzZS2jQs28XsMaalwS5oKNI5YG3BpvkNNCuOVCa?=
 =?us-ascii?Q?uNEBmDwWc5HZO1wDRr0qjM4F/NlQEqFLdiRcXHt9Sptw5tIXCmMFX/QLiSF+?=
 =?us-ascii?Q?E8oyhEFoVa7AB5C1dTL3zRagrvqyYX58uL35S0RlzcWssDXyjGJz8fi2jwgN?=
 =?us-ascii?Q?x2UmQsRqT4dEno+8oDirvKjVtN9hXJ7mpjvs4LEZPeVF3dHY2v8KcUwKS7UH?=
 =?us-ascii?Q?klWEZ+GmJMJCIBBmi2pAm0tgqdTN9CPY+xUcZdWyAfGAfwXykueimtRH/nDy?=
 =?us-ascii?Q?feAu/VuDB8YXVU+VHhqPBMYg9DnMGYGGb/7dRbN4NW/Ca86r9GzLak+7Fcsj?=
 =?us-ascii?Q?Y8uL8ZLdnyYXWVVoSD7fdkdMEpih6lDDCNTtpJRI8zLqJztUxLBktkS7Vy4M?=
 =?us-ascii?Q?BU10SO6+0VOjhK5rTlmbZO3FkGUAooF8JixXfbTxaIdhQU6wFdxqM0AyPKGt?=
 =?us-ascii?Q?scM+WiV9oKIaZ+UH/LScR6ceqls69EKBnEemLNYxf9ILSXmg98+CfRd+jNaF?=
 =?us-ascii?Q?kWEfLvK07V+md9Z6zNpgOO16lPr8yA4IRDv7ay52MNdSJ1wBxSf5AXBFlMps?=
 =?us-ascii?Q?qkWPuY+TCAU/D2rExWNBBlYDIv1koYD2ML4F/tEa54HvCFXRy2/xSGg3siMJ?=
 =?us-ascii?Q?FEJYdUBUyhmCjol5cXoqVJ5X1SBggHInVypeuLcnDQE6hRuJv3P/sNU37M70?=
 =?us-ascii?Q?rx3yZ81UAIOkeSiClzpQEj2SMCdH3Uucf3y1iuFuO1NjCTYNPU0VV4OnOxMd?=
 =?us-ascii?Q?yPhZrGxptfOdclQH40wwRt/Dcj0TQzXEFQbiB3ImTiqssVWoRJuyjh7KzEGA?=
 =?us-ascii?Q?u3sX+0Tw9h9STHRmPZTtKda9K2dxCx5OpELCMYbEQ0PiZsW37gdhZP63u341?=
 =?us-ascii?Q?6WY8szVcIM0okfWoVNXUeuE9zqzpNzftbvYooM+Ca1gewSRVH9y2nrnrwhic?=
 =?us-ascii?Q?dE8DS+UQ6flngN0VFQczf50/HPoK0lp5f88Lsmyn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3840f4c-ec49-43cb-93c7-08ddb3fc7340
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:25:00.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxrQHQlJMV0ZU6vMNIhMi+LsSrxldn64Hsk4gFeJTIGIBzRnbFEE3MnAV12DOuYyCd2ccqPMWBsj2iXWjcdWyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7469

On Wed, Jun 25, 2025 at 09:34:52AM +0200, Wolfram Sang wrote:
> If a target has the HDR_CAP bit set in BCR, the core wants to get
> additional information using the CCC 'GETHDRCAP'. Not all controllers
> support this CCC, though.

Do you know which target device support HDR? I3C master API don't HDR yet.

>This is not fatal. We can just skip it. The
> information is not needed if the controller won't support HDR anyhow.

This is not fatal and can be safely skipped, as the information is not
necessary if HDR is unsupported by the controller anyway.

Frank
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Found during the I3C plugfest in Warsaw.
>
>  drivers/i3c/master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 204b96e6be1e..b6b96cf9e4e0 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1440,7 +1440,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
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
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

