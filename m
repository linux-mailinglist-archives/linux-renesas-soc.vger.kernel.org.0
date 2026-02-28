Return-Path: <linux-renesas-soc+bounces-28592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPBPGMhOomk/1wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:11:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4021BFE05
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2996C3052B88
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 02:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B300A2EBDDE;
	Sat, 28 Feb 2026 02:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WELXOdxE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F1B243964;
	Sat, 28 Feb 2026 02:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772244677; cv=fail; b=H3US9ZukXUphCl4wyVigsU9CPQIvi/KioeP3lBKIbAvMMjlR+xc6ZPZM+lOLwDtYT8oT03XXDUn5m0AYfJPg6wxRCuU4GGC6xbSCOJ9rDwEe/pG82a0r6Vun7CEdZY2Q4Y9xRWAKWjx/roffRCg8hdYJSLZcBV5KoYErQFpf+ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772244677; c=relaxed/simple;
	bh=qXlFB+xqqZjuQ8kXDrW8zCQwx3qCIGS2tQ7QMaHrdPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hci9aKHBzpJT4KTvucPyQZztbSXd/kdKa8SFjyFFgXf5r9x2A/Gi8CQy2cQb+zGzaZD2519OM0oaRx9m62/kRlLxM4rgRoVPEq3AYGzQLMaaIguUKB3dm1HPQwYgINu9z5h5pDR7Od6GRJolg8bChBstepBAlT/2ash7Voqy8kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WELXOdxE; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=er+uYb873eGO6VwFNMJ5e3fpIXn7V/S197dn/h4s6uDJo6X8QE80E1LG0G+8V6AnWA/HmqJqXH1dNu65BFOgztlrYKoGflxDeLjiDIt5GbHk69uz7DT428HSauaSgaTLW1QPxSvY0MQhDQbhTaNVMa6X4PS0kObb0SXDuRjSn3PH+SYxaH9wof23cT5jcSQnnSjls0bDQzmPQZxCqUUZFiI6zB5Czt13vnaxkZKbnBf/o+JLmI8sRIYyiZDnCS13nPhBcWJ7uqWEmXcqgZTxTwZZPXR5Qk0POhE+4f097IszVAefS25X/6rhxaybyDotpEhRSjyzErXgrpo+C/5O6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXlFB+xqqZjuQ8kXDrW8zCQwx3qCIGS2tQ7QMaHrdPU=;
 b=O+KJUlgYt1KVaxErpv+XS+I0tMTxwHSBQwc6N4sPcMLGqywYJbQotAG9hnue9qbXzO8o2tJp7QXpA13qUsl83Y6WsBytA0j3IDAzhLWgJemVMetESmQJ+dAIr3UkupfdN+2Pi1PqDNM8kBaY1wTWMyiiJIT5mfRjSN1Q/zPjtNjWh2OxMKjToZY91sofUQ8ghYer9e4E6T9neAxgJK6QvwKqoPaD1o3vhn9NITHzuS33pGXtyPRDuO2SYRnbUIIJvLyqda3VxaKqJEfRh7J2GvY+s2DdtGtqfQtC15GsEA6rzQPVwzqYkBANe0Q0HyZ0NQCVxQaVt/HQmvIY3Sd2UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXlFB+xqqZjuQ8kXDrW8zCQwx3qCIGS2tQ7QMaHrdPU=;
 b=WELXOdxEXWj3qJdeqSEoMWslmNGXSZAlbBfNZEXXQUGEiQUcjjt9w/VfKmGIHG1haUn3nGPEtuC6F9NMWNSYcBRkp2Oa8JkgH+C0xT3KR+rgAeBYtnVgQfEvC/AoiLi03qhw+gc7J+3Tsgz5gfsFKeVblp4gi+vidWnAHVRhkhPFn/LKtUh2XvtwsYLi1iZJpBE5/vReOZMoETTDbld7hQlFu/MsjeO9p2vhxLrdr364R5vtZf7CoCZx3/X6Gjg0zlEEwNHmVNleawpsBuhfgKUxFIeNKpFBH8Yle4D26IXhN5nOqQ+ihq1BKDOHnRTHGK+HR8AJ7Vgnw/NElYDNMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Sat, 28 Feb
 2026 02:11:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:11:13 +0000
Date: Sat, 28 Feb 2026 10:13:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 05/11] firmware: arm_scmi: Drop unused clock rate
 interfaces
Message-ID: <aaJPNH9o3EvUGLV3@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-6-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-6-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 268233d8-2340-4e7f-7b08-08de766ea5da
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	dWRmPVWGNZ2IZ+JRPSCUYDdcbDG3jfoACXO2dCruGv5IRHk80oK/z1NKij2sWoonLKWER+KYAWh6+7AKTfeZ6U7aLncPW/64HR+KTZrxYRq4tvPrw7alLL5eTmKG2C40H8oVQYnJjEAx4c8u2glyTTJyleNaGsHWqmPVYcjbQ2iShke+2cds573YszLe5a7A5OUqMZOL7kn52fajU/saEWL4/+IZAr8MeTjWc2Fq3T1/9wHRUqF7t3hGc1KYqqubAeTN3fkgIdn1K+zw6kv3+V8pru6CXxxwUPAq6fjVtM3d1mKbuUOR3qRTBO1SNoT9sxFNUsvdUQJlbhAGNVY0HFsK3q2wz/wsXSQfT8T+j3HV7plT3Nd3tLYAhcYppe9tkVlTXgqsqDtRfLqzOZ1uYvduI/8GpbimWYKKTdeV7QkH7f0pIcpXjERa8pMK7J+N+5UQYoegSU7kgGAAUDgtxblcCRedT/6cEIMboc1EA8hkF1V+a2RTWm26f9OTAvx1cIOO1TaOj4ryj99B9/jVvp4CnA/ds1Dl3q7TsYpeZttwkQBaXL2JVhVZJDpp+iLAbV6zEzSOYhQxp2DI0maOVAl17Og5wZpt/qH8A/ldL25k9mQsNQcIVHyRWz6xaav/L6R+2pv68kCMH3jVXgp6JKdG5HyTYIEzYc0XZAkcld0lUDDxd0MHJTfmr7b9i67F//l/8bqo09OPSEXr5kFz/dxtIUi7AHoGWHbC196uGrl3iaAtGwoVwTGIfu+Jc2H2YpkOUr5qXx0vk5/jXtSU7YluzF5cvPEwusqAC16x0SA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CjEAT1U2/RaJ7u6yYuDw6LxgRjjLxCWS/fFKBmkLfwxbcUCThEhRaODcNR9d?=
 =?us-ascii?Q?dLhu3Ysek0m2k10M1pXGEi2mNN+SxKKz3BQSJR5mobdfOms1sta0fXDXU0hL?=
 =?us-ascii?Q?4ZI4Kzsijn8S28v9TGs6RUEOJ307wF+ZnpAgFOwP8zsllh6TFa7JbjB0jNOW?=
 =?us-ascii?Q?cuHcAhp5nFVFVo8X8LAvroxx89Fq3mlfmvBXW3y0WUvZb39rs0tkKfBaNQbn?=
 =?us-ascii?Q?hTSxsMykyxTnvHmEUwx/5V73newUfgxWO870F/02QM+a0sOHfoiXB8Jd2GEi?=
 =?us-ascii?Q?mFL5SkqkbHZnlTVOPbsmPZZQaZ13lF+Q7thONid02ZAP8Jc91UeIIxSWibwt?=
 =?us-ascii?Q?6y1OeT6w6VP7GkQcrvih9ObRP/eKHoANJTyYZd3/0llBsbySh3XGsNyKRl+q?=
 =?us-ascii?Q?5weGHE7oL+relBpQQvSqigV5kuZ4F1AU7enQ6xLhay5S4geEa2JsK3vJ5PFN?=
 =?us-ascii?Q?3aMpdK7d3f5KoSgyrcIrJVdrt7wS8LXXZAKLw9+W9dYQhwSnHdpd4iMd3/BL?=
 =?us-ascii?Q?ZLhr/xN3mT4EQBUSCs93CEOVy9zZSn9cLarIrLNhhkmaL3OQ4Ix2j6hrLG3P?=
 =?us-ascii?Q?xnzGCxg5Ws+5p+UQQsRkEQxiU08GHUp+TmLGRe6cH1ylai3CsZUTQi+5wu4W?=
 =?us-ascii?Q?xKBTxX9WVoYFpCEOGEs1xu0fmS3X/ZC0xCBWEQ1lAtaY25wlQeu4ZkYSYkSI?=
 =?us-ascii?Q?qgBLHN1ytzIxJbyRDanC+qykD5dJf0WZd2yUWYlK1n+Z9fdQw6iq44MLPkXS?=
 =?us-ascii?Q?XCtEB38a26u6S2BeaQTHUG6uEYfevDf2BAzJKSubWZn8ywIwkZpkTamcJBBK?=
 =?us-ascii?Q?tYx1FtkPV4NkMj3tBMTEhZbgHzJbmfBBkbIo7kCAvdTHfEJml1Vb9qiEbqwo?=
 =?us-ascii?Q?DDMiD3LPXsddpVS5H9PwuQFBbsMJhR03cOZWqTtQ+gnfr1sd3jEGYY3hFC+3?=
 =?us-ascii?Q?aWFE0HY6mowFfLzODN7HteCg61BcwK+mR5O3FVK6m0cLldrn9uONYl42eYBn?=
 =?us-ascii?Q?+/07NyP2S2GMrZ6qFQ3QkW8aFAshSngmi41oCmqbCTHZsUxCeaiio4hAagpf?=
 =?us-ascii?Q?tdaF+MgGl/Qn5KwvzL6BCK140SraV+Iq7oWA+RtY9a65isGNAoLQy6RfOxpT?=
 =?us-ascii?Q?JrquFnS2PcSFkbgmTDDhVmOqFWk1GEm3GT2YipA4C6s6+OT3Rhe4koWOLuG/?=
 =?us-ascii?Q?Xjb6jrWD2WIOjjtJv0s1d0oMUZhBW8rUcHp3gYnB3r0WaF7r9z9aalqj7Wl1?=
 =?us-ascii?Q?BChX4bgKnGz9KEkOKtV5Lo1Tggt4lPgXTTtXMa8J74bdweGTkUF47AD/fqON?=
 =?us-ascii?Q?rCrEX0dG3ppQKSSVF1yq0oDHvP4QQ4YwNciCgpdEKUWCtYl4Y3beEZMk2rs0?=
 =?us-ascii?Q?qcqbhx1BqqshBvmA6GwJRTj0HD5+D3VjNVGLhHbg2QZe0cnkQFS2b5Z/5x5N?=
 =?us-ascii?Q?+wTPwudID8lIWkheEOUasnBmb0IGWHtxibZIDoU8jF0m1Oq4fkSjD8tecwbL?=
 =?us-ascii?Q?Uh1K+LV7c0OhqbiUHDrabvKFybU6HKOkAUT8PBhOwDv/2hZGcBQYHTCmBIoB?=
 =?us-ascii?Q?NetWoogJSx9ddtsR7SK2BqL+V+JLBhP/JlvN2MQvddBTjwx4JaxCXlkSBCW5?=
 =?us-ascii?Q?jCmWHLoxk9BiOGt8k//hWCawOGNqadLqtgE7gVRL/wQgucSy4fMk86wJpOlW?=
 =?us-ascii?Q?p9BnbTSuo+bjrx6WydyE5hGykRZ0dvb4hEIb1mvVY/v/i8Mtp0xCe31xG6j8?=
 =?us-ascii?Q?fvM8rLbXvg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268233d8-2340-4e7f-7b08-08de766ea5da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:11:13.6913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXnoj4ohqakLmmCh6zXIkkveMt7SjrQOMR16inJ8z6xFA+YDcF4PgYZZrqtJWfc2Bm7yWJXzxC76+VuBQa2v+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28592-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: AF4021BFE05
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:32:19PM +0000, Cristian Marussi wrote:
>Only the unified interface exposing min_rate/max_rate is now used.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

