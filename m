Return-Path: <linux-renesas-soc+bounces-18868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562CAEC16F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 132947A605E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9732EBDE5;
	Fri, 27 Jun 2025 20:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zy2MPGSN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97551DF738
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057209; cv=fail; b=L+cxHttAkO0AfWFr5Ub98ir8Z2CJIfNfCW7rL3GmS2MbSPxxIgHUx8pV05aCmldIInAjrvNhX1qziz3+p2G6wGnq4ZJchQwuOGkzQqFq13wJQWmQdev3CfqEYxHHXjc90E7VkUvsnvzlj+m1HgWjiouzOnLCi/zVz5ysWsVcFFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057209; c=relaxed/simple;
	bh=Owgp9+WDAYS9T6jSPIUjN94hOtDj8snxPm2I2o5MTYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IcUicsDGpiZGd9vSphr60VJR01LtL2lLU2+4dDblx1EgpcrFUdhxwHFLks4fvjf7q7jW0hJTDROCC4oief02AlXZKyXGCfBzyidIIZ5uplvaCSoaBrRnD8k7i/CNKGEN23iWRUkW4LGoWCGxx8pWJ5h0/CqP6cg5EdM3Uj7/MJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zy2MPGSN; arc=fail smtp.client-ip=52.101.66.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrNPUExiihQuJhJhQ1psC2RLBTT85EPjKE9qSIpHPoTyBjKlIpCesarIhyBzm6efJOIeY8HYaVaK1WnPE9IC5Dnc30XnOZv16GsvMqohI8lStanyxBfiTYv5kbgXdQtZolstTDkWRiIvLr/sc3rYlPWeKBXOe1zpjaJhqiaN2mrm6RB39e1ugzHP3zqjyQbYdW/dEDzj/UX/smv185G2Apm9IfsxVi/MhkuwL7I2c0h8rrgwdGZ7fwFO5uVFmA319rtVcebETc2TW4qqIjd/AT9y/o210WOzBCZU0fo9F2HFfsIRYdKNd9/nsZyKfbzp67v8jmX+wQmQcpeGRlGbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQSbSTDMPR+9dEK0RCPLJqmZIM4gNSgOZCxkzeA7gwQ=;
 b=cz8GbFku8d2GsCvj+xqOQvV8QQDnxiT0Mr+WOhaykbzPIlLQKsdsl+9iufciDpOti1zir1Cs0WDFdm3oI3w5k2wGSwpWgmxNGTy9gAOYtEE7+6+mypuxp288GkNKwvvCRmH7GFWuVTqWKsg1DzQ7+kMJ2ofNZ0brwmC4YhjkwtyG71Q25edsW4InSvt3ndRRsA0NQhonJpoBCxpd7VjWnsDBw89UizzW/ITIn9MITrm7H+7BNz1zWBUwKQ7CmfQqGF1Epidu1IW4q31sr20FbOTza2fIJ5HiYSP+qfa7kegxY3L2m2l3h8oa9zEd3Hl+s7XIUeIFw+6dgHbv9BRc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQSbSTDMPR+9dEK0RCPLJqmZIM4gNSgOZCxkzeA7gwQ=;
 b=Zy2MPGSNQS386s6fZAzPbZ8ybft879lHe8uR7QpMrk/T3mAu8mo5K3hiUk40EjKcRCDQjvDO/+UIQzvkhV1hDhx53imN88P3l/gvx8dWom3UnDPSnBiJWH368qkbLZEfI3avWcY5oH5Rp8r/oHQkyoTRbzzBE3lKCMOeOlPnQ0oCfevHJEoo+PAU/scvxD40MVsgjEDUhcLEuPLMI89q2YIuN2ggITdfc02n3CoLQ5hhrxPHPtCmg6n9cttPwM96om5sp6KwdW1hsIUq+/GxXrwVdnNvSeSoug4jUDYcXRtyQzpkwDFg9eIRspm1ZUhjpDdMaIoBiZ8GWbPbIqW2Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10966.eurprd04.prod.outlook.com (2603:10a6:150:204::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 20:46:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 20:46:40 +0000
Date: Fri, 27 Jun 2025 16:46:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2 1/3] i3c: master: replace ENOTSUPP with
 SUSV4-compliant EOPNOTSUPP
Message-ID: <aF8DLbPnxLJVDn6t@lizhi-Precision-Tower-5810>
References: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
 <20250627111755.16535-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627111755.16535-6-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10966:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df97570-4e10-4b1d-fe25-08ddb5bbb7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qbE/mDGk/rPBnIB9g0Ii53dbNNoYNMbqWakh47WX1q9GfW0ZdYTLdNTAnRoe?=
 =?us-ascii?Q?IJPYSt6Bm2q0Qv2Nre7wfUKVrEu3R9XshapHksfsN+Zp97ZGuFkHjSJBWxvW?=
 =?us-ascii?Q?ENkIePCvkL0LGWVnirRVcUOoeXynwP6pL45M5o8scjC+aN6FTVSef0h3D+xC?=
 =?us-ascii?Q?MjN07o8E8ED7qlvJqArLz0mkTx1rgD64nz6K2/3R4TtiVATDKFD+8cEJatqL?=
 =?us-ascii?Q?ZuuR1l6ozToPaBC3ZqOH4L25RKSEfYxTT62VI/FswL619mcDOZtagtrIIF37?=
 =?us-ascii?Q?EJ2BZXM3/bQ4BHfYe6CwoJlykb1QI4LoNVDV6rd3YabUPfbITQVrHMlsUDiP?=
 =?us-ascii?Q?jI8hbT59PiMmemZ0wE6R0MIySDXp8Fuc9LdaaXHxmT/Z1vj5DKmrTQ8fDv/0?=
 =?us-ascii?Q?EDIqVCO5mRrI3BkCDsxTDiXjUgoInZfh//7w4W/0qUph6sZ9KinGO4qXvgMw?=
 =?us-ascii?Q?KXv+Clh2KsihSpogXc4SHWVKH0ZC8bOxTof3B87gEaw19r6sMsv2s+7iPqX1?=
 =?us-ascii?Q?G2QcwhOoonW0SKWEEURXAhDehwIaixSStVHolXxE/TechFp/tkz7/Qc48cJI?=
 =?us-ascii?Q?fVkfQkrKcHdwBYvHd0pqBrMDnK6stUcsxWAr60fh5j/5PWnU9jPPQGoWKyOD?=
 =?us-ascii?Q?deOq/AD9BlPbAIl7PBRC8+W/tjW5wPNOCzlyvFmEWfleFdZZkys9J9M/w2jk?=
 =?us-ascii?Q?z3h5bGD+91X5Q49RUY3M0bXTZMMC+GtVMEODZpFLNL4i7UL8sstCArFFxmp0?=
 =?us-ascii?Q?HPsEvGjo4DtgYLIryKymwvEcLlFCjgtPDZd+0Vrfwh0l/G7RqBqmxwR4/lhG?=
 =?us-ascii?Q?U65m3r1YJCnQBfNTzjzlSRJW9QeovyOTFBmMiIR6wOQdaGd8+t5dH4p62hEf?=
 =?us-ascii?Q?G2FerDp7xB7wypFQc4k4alT4STauCiQWbR5Mr3DUCxr3tTWnMD1Q5BCVTDGR?=
 =?us-ascii?Q?+vLtXmwwtRcz/j/VLWC/CAP+eFLfSr4YlSZaDrAPEO6ODsedso+31yQjaBb2?=
 =?us-ascii?Q?gPei58p0rCYpoeHoeq2Wp8IQPEW6KTTWkpDBviXUUCnPOOymZWPz1GArJpHa?=
 =?us-ascii?Q?mfu207B+YgsfHhddNouHhQ6KUTavv222oK+7MSzQmK9+Otwg6MhEvKLjOdBV?=
 =?us-ascii?Q?iYAspW7IBbl3ZQw14Vj69R33k1gIfI/r44THr2qSK6HjKdNQp7C5/vJxqQqV?=
 =?us-ascii?Q?zPPUIw4KowAz3rYmvForcBJ9IHe74dPZ5Z//tIvEC0TkaQaQv3TATHOq3V48?=
 =?us-ascii?Q?hOTFNUrrn1O48327f7eJWE+lA/9YGAKyIveigyoayoCqStdHLWN0X6Nrt+tb?=
 =?us-ascii?Q?bDp3NqCI87GA4Q7fwDh5Uo05qEIye9XaxrdR05y3z4C0DrRlXy5AlCeDC5oD?=
 =?us-ascii?Q?GnbRQhbGlaJ7MfUnAffruO4vrE/PX6iFkr1SVsJGCshhNMH5zQveqksNNGV/?=
 =?us-ascii?Q?45wNYxoWzxtc6UbktlvNNQx3Q/NOSEupHuWoqwFUEinNOCwwxmJt/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IgglXlU3M+gx5jqxZFPDlqr5NS/oXGdqoaPYYt9XaG6+H3qzkPfHVkYk57Zo?=
 =?us-ascii?Q?AF+LUJ4GUDpCnTZTCvt8oOw6glKg7eA8ewUyXfiVvN85YQUszHdL693iq09K?=
 =?us-ascii?Q?E21p8ofw4VWJPrw5u+uhjj8rIKzvGnsYt0M6qeKnN0DrExOvJEZTLxXs965P?=
 =?us-ascii?Q?JP3b/RVaOITFyAi6xVhPADN5sAAO871dfipzsCKYP19j7Hzr+gNYzzqRAk/m?=
 =?us-ascii?Q?GtHguCuiYW4XoE02Tch81Lfx7LDJ8JrAZzWhf0y0se/Wkl3zDzXNJtYwtnmF?=
 =?us-ascii?Q?HIa1ohW82KcQy46ZrMHvzmf6rQe9aNoaiRExd4AUpCSnL5C+5IwxfWyYynV/?=
 =?us-ascii?Q?pVk9I+RlO1a8Prm2QueiNauskl42aodt1kZQYwrvJ6fPDm8qT73Dm46jm5pC?=
 =?us-ascii?Q?JrFkNdIhL0eL089+cJ17AE27G7ONvCPE4MhrHKG12tVDxAtMAhoynqU4bteT?=
 =?us-ascii?Q?J6nvM6luv7zXZZgvfh16PjnnRMqfbOsAwZzVXCS+88bTstPe2iQevbeVNDN9?=
 =?us-ascii?Q?SAUryPP/EGVAcX4YNNZcvg6iyN9pl9pI1HxTgCJ+DhuSJmUHcdHIU9jXhstf?=
 =?us-ascii?Q?9+HcFcQWIEyG/rt9f7IR9JNKXq92AVuxKRvy7WBB/F0rp4fOHE4l/MV3r4oK?=
 =?us-ascii?Q?hckyQ+nj5tVI6KmaFXOWQ0h0cWvC/vW65thmU5AHRyZli7vyaOkRtl3XK7jL?=
 =?us-ascii?Q?o9jLw5FdJXoY81TemNOGjp2eE34QrrGVQ8r6WjElUoQz1EIeRb3q5raF74r3?=
 =?us-ascii?Q?PwmbBkpOL4vR/R+XHjnKLdSs1srTt8uPJ3kTJueythEZlPHb8CN1REutQhdh?=
 =?us-ascii?Q?jGrAaHQU+Ply4tu1We8Hz+1JzOzUPlgVTkxAmavSjR8O3UZbk4kH5eLv75Nb?=
 =?us-ascii?Q?bQUE6CbIh3h+0+j3KXNZjcerlNkLY5Yvkx3l6VHbXL6NN1dO8DMWTizQYDa6?=
 =?us-ascii?Q?Zw52ZaVK1SZSLAZJln10gPtsOC1MLkocJ5eQ9RURfv4Ktfn7QlJ1QWiVK/EM?=
 =?us-ascii?Q?Z/IGpRyBYaD8+RSsi2O82ZyR2SBiI0x2M7f7dyneC0NMOBzd+0MjHzC6+566?=
 =?us-ascii?Q?7hUVrzCCXJTf+pU42g+if9IXm6z8H7s6kM8OYgnFZzBO371UqoXfg5qp/GDP?=
 =?us-ascii?Q?KO4VMsp+8lCePTTKV0T3jyEwZj8oOv37ELImJG50eQCMXGCXkZ+vsi6yrnRP?=
 =?us-ascii?Q?NMCDU5XyuvO7gHQn7sP8S1VwXRsj5GyMMHnTiGJe7ADCVWHJj/Ejy2g7zXWE?=
 =?us-ascii?Q?ighVBnqdGnxxX8jPsQsBs2v6Uk8TjQvY2IjC94DDtmEJD8ii17P8mIlf8L8F?=
 =?us-ascii?Q?co2zTzcWoIEUBM5ygNt41LJLqhYn7n10IU3Y73kKFz/8TCf/MpOYMJ54osxM?=
 =?us-ascii?Q?W5Y9n3MIAn5K5nU6g6g5PsKxgtpzV1wtUmVLkfl7m6Ts2o/N8y4O7S+iU2GS?=
 =?us-ascii?Q?0zBbA/NkifWY3W2VgrqOWTe+9fcPTvEJtO3FYW+RXPnnvFmOlCxwJjFJzw8W?=
 =?us-ascii?Q?13Xy7jAr81buXfjW1aFZy87+XKNBNA4jc6qPNk9P1a0zItCy3CeVW0PVhdEA?=
 =?us-ascii?Q?5XZKPvGq7KNQbBnUY8PyWkM7810uJr7zYkKG7+Qd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df97570-4e10-4b1d-fe25-08ddb5bbb7fa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 20:46:40.9320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSbSdv82TdrOMmOXs5L4ztjDkrdZnht1QWg9NxyCubaA+U81f4xYNtm7HdhF8/wyBL/w8oXMBNspqMk9uzIokg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10966

On Fri, Jun 27, 2025 at 01:17:56PM +0200, Wolfram Sang wrote:
> The checkpatch warning '"ENOTSUPP is not a SUSV4 error code, prefer
> EOPNOTSUPP"' is correct. We never want this to slip to userspace.

what's means "We never want this to slip to userspace."?

especial what's 'this' here?

Frank
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i3c/master.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index e53c69d24873..354fef4a033c 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -837,14 +837,14 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  		return -EINVAL;
>
>  	if (!master->ops->send_ccc_cmd)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	if ((cmd->id & I3C_CCC_DIRECT) && (!cmd->dests || !cmd->ndests))
>  		return -EINVAL;
>
>  	if (master->ops->supports_ccc_cmd &&
>  	    !master->ops->supports_ccc_cmd(master, cmd))
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	ret = master->ops->send_ccc_cmd(master, cmd);
>  	if (ret) {
> @@ -1439,7 +1439,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
>
>  	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
>  		ret = i3c_master_gethdrcap_locked(master, &dev->info);
> -		if (ret && ret != -ENOTSUPP)
> +		if (ret && ret != -EOPNOTSUPP)
>  			return ret;
>  	}
>
> @@ -2210,7 +2210,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	 */
>  	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
>  		dev_err(dev, "I2C device with 10 bit address not supported.");
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>  	}
>
>  	/* LVR is encoded in reg[2]. */
> @@ -2340,13 +2340,13 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  		return -EINVAL;
>
>  	if (!master->ops->i2c_xfers)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	/* Doing transfers to different devices is not supported. */
>  	addr = xfers[0].addr;
>  	for (i = 1; i < nxfers; i++) {
>  		if (addr != xfers[i].addr)
> -			return -ENOTSUPP;
> +			return -EOPNOTSUPP;
>  	}
>
>  	i3c_bus_normaluse_lock(&master->bus);
> @@ -2766,7 +2766,7 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>   *	    controller)
>   * @ops: the master controller operations
>   * @secondary: true if you are registering a secondary master. Will return
> - *	       -ENOTSUPP if set to true since secondary masters are not yet
> + *	       -EOPNOTSUPP if set to true since secondary masters are not yet
>   *	       supported
>   *
>   * This function takes care of everything for you:
> @@ -2793,7 +2793,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>
>  	/* We do not support secondary masters yet. */
>  	if (secondary)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	ret = i3c_master_check_ops(ops);
>  	if (ret)
> @@ -2954,7 +2954,7 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  		return -EINVAL;
>
>  	if (!master->ops->priv_xfers)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	return master->ops->priv_xfers(dev, xfers, nxfers);
>  }
> @@ -3004,7 +3004,7 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  	int ret;
>
>  	if (!master->ops->request_ibi)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	if (dev->ibi)
>  		return -EBUSY;
> --
> 2.47.2
>

