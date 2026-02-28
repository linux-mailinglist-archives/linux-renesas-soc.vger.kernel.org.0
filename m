Return-Path: <linux-renesas-soc+bounces-28595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPrCKRZWomng1wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:42:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C01E1C001A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5917305DA94
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 02:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3C33382C3;
	Sat, 28 Feb 2026 02:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="II6HYAhh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8FF336ECD;
	Sat, 28 Feb 2026 02:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772246546; cv=fail; b=P5rnRdlzRcbXzAoYbwR/7olrgPj9KvchU7aWGocmvreRKtlYeZVFV/+RZWNJkIpOAHEcfPgCeRjR98e9BtsS1eOh8oVf+o+o9t+IgeG2EfK6/vAK9gr4KmcbRlSStA30zkoet8ziqoR3lrSJOtr6Prm6Xoj/voPdRuviNQKOJzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772246546; c=relaxed/simple;
	bh=xKU9CJSHnY7QPG0bYuZzZKNgPjMwEACKuXJIlnsPyRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kb1qsoDKpbmT2yuqZxlP3EGdxSD/RBuBdTIr0C9h8i9T3uW7z/S3bC8DfAmLhmA+ygNNb7GVAvtvqm/95lzkHbfOgge5GcjDn/dEbtLHuy2vvaPJWrQYevF6VmZyq3Q0AjxStU9VFPauB1t/CS+CXZ/tktenN28wKlFbrGz+f88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=II6HYAhh; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTMDt7kCXs0F2MEcFX2KevBJp+qx+qPrDru9J6Y2d8huehcfWuFHM0W1RS1hhnVFirftSwxMHfku6k7wb0b079IFFznNPFiIhSPkSGiXLZ9DuG4ygh3Vt5XiwcJtrDN12u6WVfkqjgLkDtGDpKJwU4qSnm0IJkQb5s5g1OnRXG22T16a8vlcL9U0noq4sfMsXW2Q7lViwECYW+X5tYf8fYXMsBp2aSneNw1u6LUv4bZXpeYdl8nf6b59ASgtumWpRuuY5YzQ01bwb9PvEXTI/Dgy4dRHu8Jv86SgFTyQ2q2I6k6eZXod/9/QbAD9EjYL9JWfWheLv3gO/EThi6Goag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot3FlztXVE1ulm3GhlvBW5fAmaqmsrQ4lFhaFWADuWI=;
 b=nSZ6b8h7OrdhgwBc3m0+ar9reP+VStvgVwwfDenCkABP7Kp3nD1jw/hX/ogQnnLDN50Qqzlt/POdJEkpfKznGzKkEinvmxZcjqN5Y2xnWLuV2kg0bAlD2lw8wB2/z0X9EO0BQFaY2RYi5V4rmOprl/kgu3kmfajnNXNi3vmGDzqcktaKJkJNEJG1HHrrhI7b5BB8QXYYhk321UJI3L8Tz4k8Q8GpqWLnY9rQd+PcIZneq6gBBF/uZq6/qSqJS3bWwtguOAt5QnLbfuhoYoPiOvB6WU5sh48dnlNdzL0sbNQLo77WZ7izZIr07/a2XRJ1jtO8m/i4jUP6JB5YI02FRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot3FlztXVE1ulm3GhlvBW5fAmaqmsrQ4lFhaFWADuWI=;
 b=II6HYAhh1A3bULBhgpxjv7TkTm/T94SxYWZ5gsmd6wvG83Ls6b5ugBtDT2BTuUXDdFXlsVpUgmlzfkToSDaPKQGhRkslr7VLh1g2WHxZzCGZooDmBrWwezUzU6DRvtA2kRxPr37REpfAV7yUAyOgApCNQgFSYfn4r5QjScRWqqWwvxDLnX4IPE2CAk2kXx0hH07C6aAJpbLZzYHPbZhhyCfMZrdP+MqXTrrnRxgPB79sPfo64njzSrzkrsoGDRFfR+ABUhFymnA2pgB0SNKORzTTZ2xmTqXKByGx6cDc7F1qFn1lW5KZKSS0VC53MJezNqnJm+UZAcT3lOPPeZjzkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9384.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 02:42:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:42:21 +0000
Date: Sat, 28 Feb 2026 10:44:14 +0800
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
Subject: Re: [PATCH 09/11] firmware: arm_scmi: Add bound iterators support
Message-ID: <aaJWfq5HRQHxk61E@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-10-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-10-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5P287CA0251.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9384:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c67613b-6c24-42de-5145-08de7672fecc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	VQNUwnQeGjmAHY1gFrqWuCwZiNj7xKT6/oUrCWLPsMv5L6Wjgd4CtGwovmYUqDtc9ViJmDU+JNQ4XyhTikAFqOFtok464lIf7RW9cpX1yz7vjgNyNHXxAZO02ejweY9VIbGXiUYpX/wK8TnTz5kYWmrjhgnWiF01k/9qGzCNZMbkC0C8qzVBZDy545t2gPbv4Kr+JHrn8sSgLqbiP8OIgErfxGCOca+v3eIXhYqHuWl54oT1tVyBL43OsExlRwrWzvt196E3A2DYILWK9le4lhzdtg3jiboYEWOyTG8Pa+anvNVpU8BNbJd6Qx5H5m28laf0d50J5xIer2Fz50F9UQZLrnHclyWzCQzDroKDNWOn7WPiWe4Froc2vidwsqfeTlsT+81CIiawzY/oPaUraG7c78dAVW41HXpgUN5c23VPKGD6StGzKUI+un5+dPYMKt1kX6O/wiXtiPPBl9foNtJE58tPMpGz4p2x7v4E1xbULcKrbbCoEAvkuQpeq3eboNOSmgORZxkbomgsUJMoDaLMURy9bbXt+ngqKdzSfLhRIolMBv75kKgZnJHzUlgR2NzJqqrzgt/F2kuFjIwjJS7KflPXJwYhYLVdyA+3njgWcQM2uzUYoG1ujpPdGZgiwnHGs5nbs9OkbvaRRAT4yDXTkeui5Vz/BbfIR48cnuPxw7lTBitpi/3scQlc1M4eMI7hVPDe+odceJtsRellGVpbfi3wt3Laf/cGz6X2AMNTOKew6oa1FD36RT/7AFFejkkG9zBS8kJvVyQ2XKAV/MRS/QAbmjz7Ot7BXBTdz5A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zjm2XQn7FfUdVfVIKaHdaDWD2X1onDg798rSbsKmTwJZ8ew1NLCiA4XJHGBV?=
 =?us-ascii?Q?AqVMD3e2j0NlH+QhaUE+T2FDLouJCFCxw8nkN7qm4fvrcNOsZmTzZS3RB2s+?=
 =?us-ascii?Q?GqUrpcGecVPf2eDD9qVl/+xakbzPiwxzwWLLXa+ZLmF6HOYwwMOIplIbwpTM?=
 =?us-ascii?Q?56FNUV7iQXu0qX+Da4vt1K6H2EVeM8v0G8WqN7n7MH0onZtynlX26a0SiQZv?=
 =?us-ascii?Q?274S5F3NshVn1c83jcT1RsnYAK2g4zHPDTzdy2Kvc3pIfDJhlcoOiCkuUq0h?=
 =?us-ascii?Q?ZsQccM6Np1F/onVr5FQfyZaSKOCQ/IzLwoS1S4fRlb8rYtjl0cdvsD4HYTHB?=
 =?us-ascii?Q?vT61i/Y8N62rzm8gduI7Vu1vN6D156m8VgO6F3d+9N0aMoc/lBQPGt2C09Jr?=
 =?us-ascii?Q?CKMA5t8C9oADy/D52x9ruOUE7N9vVtSOC8I5y4T9gh9v1u+vSFb2ZQ1kVVpW?=
 =?us-ascii?Q?ccPhVJg6yqAGqq3YUo8A6H/qF/be3ZWI9pZdaIYXsEwkp4KoHuCWyLhzy2kO?=
 =?us-ascii?Q?LDqR76KiMylQVPxdGt7p7Sr/toEWaTJ/vH/3LMVAJrKihlFHyV5nrf0pJ2nx?=
 =?us-ascii?Q?gID87LxpKm6NQGNKUNCXc4HD/SGMGrBP7+rJtPqRUng9YhSYPQGhr8k9XrQL?=
 =?us-ascii?Q?4rjjZyU2i+RKuplSgvPp3FY9IMacExvyETVdtW8YNsIxkaEu8bgnZkDdldZj?=
 =?us-ascii?Q?yd3smVEpX27cDhTC2XAq6v4ioORTTisecv0CdnJO1Pk9n8BGCTavQmq6qFv6?=
 =?us-ascii?Q?OoYySHMXf1WHC0T2w/SwWuKYHN9yrpSZNKe69yiwivbyTU0T9y49Stk+qYV4?=
 =?us-ascii?Q?hdLWkoBdX7YPpK0dA360WwZkSS9CsXkJilsLHaNkv1Uz/79guAjX67oky0TN?=
 =?us-ascii?Q?LiKfBihr7JOrZxc8u/2dILDeeemuE3V0RGSBKw/iLG6wJ/huMXRMoJ9i09bi?=
 =?us-ascii?Q?F2tMYLbsYlm18mCd2ITJwfZLC9qs07roZvQk94AgZxf0farWVHAcVuoFPRFI?=
 =?us-ascii?Q?ltOnXV0uTq9bPqmtVPKTQP9YIBbdPpw5SDJhL04vFDEefmt7uwN6gOOrv+hT?=
 =?us-ascii?Q?KdmSnGjcDyiI523u+R2f3YbqZMW3XzPOmQBDs09aK2g43jsjEj7iAFH6iGsX?=
 =?us-ascii?Q?psP4Jsho+lUNkfe3vSaoT+E/KP7TEh8JOTOmdR/6iM8rKFyYtpkL3EiPIh9A?=
 =?us-ascii?Q?yznjKWTD1sA5iPjOjM9sNxuUarX7rf06aODxK8m+FG+N9CuwFVq5UEZstLQm?=
 =?us-ascii?Q?G4zObP/lnvsTAMnsfpCoRyul7Z8C7t3kTSEUT6xlc8DxDRmR/Z37oHGa1jCO?=
 =?us-ascii?Q?hCGwJPxhHzNtk86c8+G6QDadDE4PhL2QuNTfgRtsGxxiaQ9qgYs/1Qzj3qd3?=
 =?us-ascii?Q?V9/OwKLtXveJqsF8MXBnLxihyp5cWRpxu0d5bSaHc+SRvnYJYrauOBciCXJ2?=
 =?us-ascii?Q?KPtGRrhd2HPFiR2AjzBGWqRiXXcD2+TGOXreGgcVI0nfnv5VoLopaKf+4ooM?=
 =?us-ascii?Q?SSlV31q3bBJz65inCt+nHFbldB0aScmksp8T5b1Mm/Fl+RcmpcjdayuN1OUy?=
 =?us-ascii?Q?Ow7Upj3Is8SeEdpjv6yHE3Hq++KVPtYoA1GeA4T0Ox6Z1cMbKaxhbOLUClFY?=
 =?us-ascii?Q?7KvztSzuYF+qAjXmxs6qRH8iHZIelLgmJcU3zAOEKf4d9ZRkdGPa6pnHXjJ0?=
 =?us-ascii?Q?sGg18qljuTq4ZhgO3UqBz9TFjzDuqa25L2apQl/9nYpytBNRk/CMcdkXQCRK?=
 =?us-ascii?Q?ZhW1QRsJTA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c67613b-6c24-42de-5145-08de7672fecc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:42:20.9571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tieaowVx/Mv7GgoUxtFnviCp4Y9B3hYsTmcbjCtdS2oNg74CBi8O//MwOZtq1VCAfmvtcYvIU30hjl0MSHcTJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9384
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28595-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email]
X-Rspamd-Queue-Id: 0C01E1C001A
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:32:23PM +0000, Cristian Marussi wrote:
>SCMI core stack provides some common helpers to handle in a unified way
>multipart message replies: such iterator-helpers, when run, currently
>process by default the whole set of discovered resources.
>
>Introduce an alternative way to run the initialized iterator on a limited
>range of resources.
>
>Note that the subset of resources that can be chosen is anyway limited by
>the SCMI protocol specification, since you are only allowed to choose the
>startindex on a multi-part enumeration NOT the end index, so that the
>effective number of returned items by a bound iterators depends really
>on platform side decisions.
>
>Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
> drivers/firmware/arm_scmi/clock.c     |  3 +-
> drivers/firmware/arm_scmi/driver.c    | 58 +++++++++++++++++++--------
> drivers/firmware/arm_scmi/protocols.h | 13 +++++-
> 3 files changed, 55 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
>index 15faa79abed4..d7df5c45836e 100644
>--- a/drivers/firmware/arm_scmi/clock.c
>+++ b/drivers/firmware/arm_scmi/clock.c
>@@ -505,8 +505,7 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
> 	struct scmi_clk_ipriv *p = priv;
> 	const struct scmi_msg_resp_clock_describe_rates *r = response;
> 
>-	p->clkd->rates[st->desc_index + st->loop_idx] =
>-		RATE_TO_U64(r->rate[st->loop_idx]);
>+	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);

Seems irrelevant

Regards
Peng

