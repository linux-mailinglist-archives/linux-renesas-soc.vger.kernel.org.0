Return-Path: <linux-renesas-soc+bounces-31253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDfOImuK3Wk8fQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 02:29:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A93F47B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 02:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CEE3301454D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 00:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0D41E9906;
	Tue, 14 Apr 2026 00:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LQ847uDv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA768460;
	Tue, 14 Apr 2026 00:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776126447; cv=fail; b=ZX4fGTNMhvj+kDcEdIxObBicRSzDhx5u3/w/cFuEwrD1bV+IeSUYMEUTYMrtQbQp6zpZKmlnQndD6pQWKcFv35+S6ziEhY+aAoGyjgcfcIjhjsCNCEdcEBdSCZj9sRycoejZexC974Qey9BeaJQ9armtUIXmkSiqwMv2y6OnY4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776126447; c=relaxed/simple;
	bh=RxfphmCYkLtyKVWLjbVNStrdxRNXtkyxRllRXrEpECU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TVncqN3zmZhiGwyt7zlhaKBlIAsKmE6n1q+g7ygorqQ4mAY2Y7YdUUB3fQNT/PA1uVkuk6Oifo0DD6N4vHpVsi0kkmvfhs5aPIXhfsWGXwNJx5R8PZztJVTL0Hatx2ElkKFcF29hjP7mY0oPaje3vfb35zoScO8g72eR5BdX/ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LQ847uDv; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAyNAHAl8y3Taw3T+YA0wE+Mwnsl5xsF6EJbs/tmRbBXupCz1ilVZVyiTAXogy38dkHjcy9o7GisjfR+bfq+kjMQI2IdgfQLpKsTIprDH7Vfw5UhV3fBPazg4eqoUSpMXdgpYOQhpEbZ9ojf8hNHeFCoaLyzsdSnAWTncaODu78wlZbqha8BBDEcDwwoDYmXcufK2xDNz93psP/WtMhhQ9KtJ5PTVa2BlsQfAB3zxFKGVJoJy+F5j8YQqMZs7cWKpga51odsD5IXWjEoSPAT0p+MuPPzzQYZXE2lSjvRNR3F2nKsVE3IQcvYVZCxoc7+ujJiXHoCDP0vRySkiUZZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5sDOTKcxmIeElQKGXbpeO2Lntzp3qra0LulJEPpmUw=;
 b=CHfrBHBzkFngDeC3X6fFIYoQkTRuHtEPEjK7e5sY6FVBFWbX14ej6pZdXVWnfghKXFLIQRWStxTAIKKW1GDABrDH8s4+beCt7N6XeVQQh/Fv9KbgFRE8tpq4dVSlvGj5AzPZ5AYrQBiJYJN9Eb+fbfVV5c5x1+FSoO44pSdj47R1l4MOZrGhbCjEUHXqTdrUojXXtf1Oj9BmfHa9+Jo2jVxLOMggsrbdJXQAnINMDISVkJCn00k0Lnzq+cEFBt6T3Pq8NjCv9BOADIKfIHJpGl5WspnZvz/DyLfoI1BVrjtnpFYKubT6tZuSuSxayvjR0pv8/1xSsDpBR9cIWJNF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5sDOTKcxmIeElQKGXbpeO2Lntzp3qra0LulJEPpmUw=;
 b=LQ847uDvC5JOeY4sQhn/5NPwWSzcErSm1ko+pk/ge5oKJ8k1b2A7lGSgvuK1NgWq6FsMu5RwDbvxQSmExb6Nhcf01DfJuWp1cKFyhPMGSLvPt9tLtR2PpZ9CJTvpsolTIyuDKoceZ6kaXeAL8vt6rsDLsoUGW+ahs+j0lqR3gPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB12625.jpnprd01.prod.outlook.com (2603:1096:604:33b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 00:27:21 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.044; Tue, 14 Apr 2026
 00:27:21 +0000
Message-ID: <87tstepes7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
In-Reply-To: <20260413100700.30995-3-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
	<20260413100700.30995-3-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Apr 2026 00:27:20 +0000
X-ClientProxiedBy: OS0PR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:604:26::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB12625:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a2ed83-4522-4afc-24e9-08de99bc97ba
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3MkK44BegzTSK4Yew9u9LwBomXi8jQBY7IV71wsaSMGc6eUjhZnKC9Ug9sTaIsE7mFS7zKeD9/TzprXXx5iUODDsBJLO5DOfjlDhOcq/lRtYDpaKVtrTiuS3vCdNv0O/A66o6JiyT4c5lCUg25M5MRj1A39gl0NeV+RNp/DqEE+M4JNeGlt0s8gYmtPqHTgiI/XiQxlWpzB3ZwkzcB2KnKQgg524lx2lwZ8B/T+y1UuHtdw5TUDRAPonkdFvMmUh6q7zaHwuQo3Le4YTPsskpY5+xL/xXXl+1nPAeYtIoeHYEh7sHmhbtoQfFqPAMk5VqhBre3GkmBmIxjRw8xbMVhFCWy699KXr8fMaqa0dYcH3MXN6nWl/hy9dLKUmz6b/R56AxX/A71e0lcwHORQ6k8K7nu2YOisXHaifmAnBmb4jWTWOD6C5OC9428ES2tfukuaZW9850XvFLJO1/YmkMEvF2DMUklWjoK84u/HO8G48cVoFKp1eItK2m2uu9tbN6IkegzlNIng0PL+MHtLcRJC/qrwZgThJupM1pLwHTPPiLLqWVCJl+OI3F/Eb43nzMAbDSurA2vwHldtkVdN9qKcZ7LyuOs5dDz2WFJ0JinFuQ0gwNADIjkC09WFyRqCG87GervWxJ/bL3SuBnqQaxt+WFB2IPIwXwhmCDmTuJ8BvRiZYu1JcVdhlS1JhfZ3geQ0soWy6u9MEwh2hAQ5VPFJ1ZpBfZD1EZ5KdNQT/UzUBidLsmnc8HvhZsWtSLMDc5HK3gzU4Yeqoqwj4kJSsHjmvIbzU6VRkLbn9pUXUIdU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vode15hn7/WeuxQCQfzzDEcN4zb0wkzmLcVGK5lN0zTV61bL4GowsDEQAxa7?=
 =?us-ascii?Q?5DwZTIs+9wdZ4sB5yOyE9opYYZKF1HiXt6IdXcUWHcLNCgw52+J6XLjGcr4T?=
 =?us-ascii?Q?6JZazl7uAWp6rMD8HD/i+xqNCbqquY6OPVP5dXvnP2tM8V1TRBbLGln+RJKQ?=
 =?us-ascii?Q?unGE+/TahS/PWAj3rcy4sVLMCnq1wzmG6CLj4ZaPvDW5Il9ZEyf6+VObG/xk?=
 =?us-ascii?Q?jhwBlX4JEZ6ywGMBjw3llBBSdI8jXer5arvGg7ezqLnFd+jTq0G5eeDd7a+8?=
 =?us-ascii?Q?Ojo2vJ+4bisHrwr9o/AVlPVj4WNNwxQ1oFoPG8V8y7LxFVz6fy4D3e2c6ASU?=
 =?us-ascii?Q?eIvRUI36UEYr/9IxKkKHiriYKiVeAW0E6wLyWzxMn5kV/Hzz7/5vVAIKvooB?=
 =?us-ascii?Q?LFo+heZn5Lko4PytEd82JYrWs5UUxhfpXiOZOe6YbC3XedJvEc/642os8VDw?=
 =?us-ascii?Q?ySCPQUIhM0I/7hnJ1uudvoGbc8dQKLZ5MvnxXsiFXK8wkGVJkffsx19IacW+?=
 =?us-ascii?Q?JdXy8m8CX7L1wPSP9LMjC2z77LojOi3G6jYIx+azIj2ls/cdD1cIcqXfTqWU?=
 =?us-ascii?Q?R58KwgjP+JaOKdBjfy81Ka037vBWTKWRlmbi60evcGgMwYzmmLTNVbOXjGtj?=
 =?us-ascii?Q?zTFuSBP7wZCbOqAffTRQHqvBG9CTmkg6vXKVB/uY+uH/9tvJF8GZPUdCCO49?=
 =?us-ascii?Q?1C1kOYC5pQHzYi6mX6C/e0SWquqOfOT+8wqmvdqpTL4q5YPnhDdKlxLz216z?=
 =?us-ascii?Q?CVQwcHu5ZhUSTUsEniULSLlzo+tZ3Wz0jiq4XKRKyUSIGrW/u2JeS9oN8wsJ?=
 =?us-ascii?Q?0PIFvYD+/LjbsKjmLcO8BVatMs01y2X+oC7NvPrcq1m5zHLyWkyjm4jGyeRy?=
 =?us-ascii?Q?KikOJXl8eKAAtVP9oTtl015/owi9SWXdMxDZDDDkiWonPMWpyxF19r+Wgssr?=
 =?us-ascii?Q?uxH5k9KTLXiroVKp/XLbUuh0pu24YGOy4wZgS96ME/G9kl8No34HFwBo3v4j?=
 =?us-ascii?Q?IyCTfSRleQObIJ/ug+sk21y1elCq0RU8wjd6coNLmO4mJRjAP8aUmetYAFjH?=
 =?us-ascii?Q?PXzFn8hjv6rNKKAAk+Q61HLufIEcUT3quNPLRmG7lrQe/CNtpjZeEQKihjfs?=
 =?us-ascii?Q?YxDCfDsbjk6J1D27qdd8clDlWtrq/Psj6JOhgUiErxx0lsowcEjeZLY5QDMi?=
 =?us-ascii?Q?yqOATyELo+XVic06iR7dUaJ7eAWqhXNWmiAMkzzPjkYprDmtH/ujg9QCQShY?=
 =?us-ascii?Q?OPABJgPxK37ltS3hf3mEUQwZKHH+Wpb1DjevpQ9cMr3OOflW2cA8QK682oho?=
 =?us-ascii?Q?rEHM4NgQVgWzEMhvw8XwRFTwqDOijsh/w1HOEPoQePpw27Q9WcMx6yZoIkmo?=
 =?us-ascii?Q?CsldG9eUcd7+ae5V6sdKnBGCmQbbsh56UXXnkfcpkqa+4AXfbaIii3C+SpRx?=
 =?us-ascii?Q?0PMRYR9nSbMuIYElC4b3H4niIvWF/VRs2R3gLWHhF6UC3LhvASN7V0ajSEbh?=
 =?us-ascii?Q?ee/zIHwmPH4TiKko6OuKlDxtNqWwmHLG6gTg5urg7YcSeZ8tpykf0BZzOfrR?=
 =?us-ascii?Q?9STVebTZIfpU/YGMZ2RMM4b+UfOshr4kO+mBU0vpUCaECnySjxMLc5DC3mFE?=
 =?us-ascii?Q?24En8pajp2BFUvgI7E1X/fXNzMmylJr7pqRWHCg5kmvvNS8XzpAiDEjgShzd?=
 =?us-ascii?Q?AQGlu8a0spxI2aAVB1tqdOXQftB4sOqTRsjgCrrcrA1ahvFDbBURdnczAvMR?=
 =?us-ascii?Q?Sk4klXiQ56Usv6Td2TghMZy1eO4WbluOJYMQbYYTqORToxpPS8+s?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a2ed83-4522-4afc-24e9-08de99bc97ba
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 00:27:21.2871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTDgLxXQUl/nwwB47eFIsT66jM2jSZT/5A1vT9rXA5mQzXs7iyEbYJkM5UGcXjHvb53PokvbMacvCUDmvgA1XYvjrgxrrnhTdSZVwMfOKPt2O36zIkDXrWVjoURj0U/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12625
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31253-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 075A93F47B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi

Hi

> Enable/disable the shared SPU clock in hw startup/shutdown. Without this,
> accessing FSI registers may hang the system.
> 
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
(snip)
> @@ -1492,6 +1492,18 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
>  			  struct device *dev)
>  {
>  	u32 data = 0;
> +	int ret = 0;
> +	/* enable spu clock */
> +	mutex_lock(&fsi->master->clk_lock);
> +	if (fsi->master->clk_spu && fsi->master->spu_count++ == 0) {
> +		ret = clk_prepare_enable(fsi->master->clk_spu);
> +		if (ret < 0) {
> +			fsi->master->spu_count--;
> +			mutex_unlock(&fsi->master->clk_lock);
> +			return ret;
> +		}
> +	}
> +	mutex_unlock(&fsi->master->clk_lock);

1st, please insert white line between "int ret = 0;" and "/* enable spu
clock */".

2nd, besically, FSI already has "lock", and using it for several protecting.
Please re-use it, and don't add random new-lock. It makes code confusable.
Then, please use guard().

3rd, I don't like above count inc/dec, and mutex_unlock() style, because
the code unnecessarily complicated. It can be...

	int ret = 0;

	if (master->clk_spu) {
		guard(spinlock_irqsave)(&master->lock);

		if (master->spu_count == 0)
			ret = clk_prepare_enable(master->clk_spu);

		master->spu_count++;
	}
	if (ret < 0)
		return ret;

I'm not 100% sure, but I guess you need to count up spu_count anyway
regardless of clk_prepare_enable() result ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

