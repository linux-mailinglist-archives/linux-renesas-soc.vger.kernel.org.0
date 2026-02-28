Return-Path: <linux-renesas-soc+bounces-28593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIGDFo5Sommo1wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:27:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B60DC1BFF7E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C4703065048
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 02:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A59132BF42;
	Sat, 28 Feb 2026 02:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zhc+aUws"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142743A1B5;
	Sat, 28 Feb 2026 02:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772245642; cv=fail; b=d+ocGHaf1IA72S1L+ekW8JF3AF/0QTMYp/aDHbWODsBQ+bTM1Krs1PN6KMAzk7T0UUMGv+cpPDkhwHCE0JHloSavuoDZftbrXL2A6tehw1GSuJg8CURb85Ui8GhDwLLWnxypB4EIkYF9965dBnFaT9ztoqNaQ2/nmoCpFVbI1+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772245642; c=relaxed/simple;
	bh=bGNuNlG4CYXddloiNS5voDMxzFnY1OPS4F85yy1egfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=trcnMWgQQiV+J9YOcgbxdHOKMmzQ9/ywIzm9wJLfXbSQvKCLOH6JTuafgG3GHiG1FLZUV2Hf+zzkZDogY7jI4XdFX1J8HZYmZNnThL1dZofB36nbBLQi/VNNMXP1wpWYpcw2+x0rqE7g9VMqes72uQQaZmLFsJkBHr4Bs3Y5DPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zhc+aUws; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFIMXU+0SIaBPh/apdVoABL+OF20mBXwXvoUKJkDWYOs/lvhAgKzkcSaFiL/fbU9b6eyYC2L17Wduqy6qCltYL/jFhgJxld7NFSBLSp5Lcf6W4lp0Q3x+2fHJDNwrBZvM7NU6YBWBcYUBRZCU8gZPBZ7H/datGItS2JtoDacSQB4qPxzHw/td8g6seWm/Wi12pLSx47QUp+B1VwyNCu+rXo8H742K+Tzn74AWDYJyy1HWqJocG/hAnAj4S5hO6lvwYcD2FjxXCk0BtA4w0p5URFj0TFMecjgO4i6zLKvuUCBaK0o0jCR6zK4+4iCXQdVCwo95CgfWLBwMgPcKmWa1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6buVD4gWZ6lClPVMiyhsI7/rfJ9OXfASD9XokRruvk=;
 b=Z8vU9yEgND8pagX8I5pVQLuFJxUvcde8ASplwgJKbXt/rxB45ges9YMHVhzFOxLhKmt2pX25arxdyabTBdYr6BQSV88jqSCDl5Cr8iAIALfNUc7UpHMeFySkCuxwgxmeJG4HXZFzP4bqa//FP4gNA1sTFroCdQyY7xWdD0ydaOvia3u/xYCXX7Qp+3n5WThG8Am6vC0+r4DJvPFjWVZYu5NhfvKUZAmLoC/v3YvVxmVBc38QQ0BovSpgHWqgzG8+P06ppXGw8VyDNoQX2uy6OoPu9fujvFNXWnR2coB3LMiT7sEWlKSH/oaWPsfFzKf8YIKJCYgYoIYKyjfjsJWZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6buVD4gWZ6lClPVMiyhsI7/rfJ9OXfASD9XokRruvk=;
 b=Zhc+aUwsdVNgX54mHuvXeIS2FMu3BJozCCbrtFmMAMmE1etf6OYH5Zj74j/iJG83/1vmPKzm7Hwf9vhvQgsKjJNhb5QOHbth0vY10KQA0wxUyyh7MoEC1ak/1wb4ktzOAp3c+TxJYVx/8jJi0kuq0LFXHvlokOxXIT+YRpxcV2Y8B7U2N64ecSaJiZ9Y78NmBOYzGF6IgLVkj4rumX10qptXamdzBFJ3vWBmAHzmCjYb/GCQWQCLVyZ2VQV+J2K1Z2HILVmds/CDtmffRufB9xx8Zd4zN0Roh0M0VgXndIHxTjkawZm85gfzJ8D8tHvz9mnnVRVaRLN8V8QBqkhNIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB11664.eurprd04.prod.outlook.com (2603:10a6:10:60c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Sat, 28 Feb
 2026 02:27:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:27:17 +0000
Date: Sat, 28 Feb 2026 10:29:11 +0800
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
Subject: Re: [PATCH 06/11] firmware: arm_scmi: Make clock rates allocation
 dynamic
Message-ID: <aaJS9x5lZ9xSEu1V@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-7-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-7-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB11664:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eba9e7e-1c08-4191-e3a7-08de7670e478
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	UTkmSAfviQGbQlpMyTfgnmLjuAAQeJeLUdVMr3Fp5dJC5jC9JdwlvT017RTnfwXj1sRhWX0YW0WVSAGqfIsAV/RitkcJTpLC+i0ckIlqay0x3XAlYWw+jsIzCp4xevXgbeLtRkwP/KhBkAHAjh6i9+5XsX82LQLhKykq1V64exU0k0C+0T9pbJAvmKmQ9xMC3acd16l7PhT6OrDlEKRKekZL8FOyNI5MoN3shO5Jwgj+Ab/WvamEbyssvQ5ZRDGdtr0+zVbkh/Dn4kOgChKnSTNQa5gwTLDzY89r9BCotz60ksdIAI3eKdq+UjKTs9n4BkUCmKYIQ9cRwcieXVjscC5gsb9D2rf3xvAhkQbAsG60/mhGK1PS/b1SlvNaXHoPESAvDp9kbPS/HzCfNjBJ6F8KYbSnVz7FLOUXqNU40UqLQLh7fwYcQsBlrWL5mG6tRba2uJFDfYGokQoVd5HuWa/S/LgPepqR9rP1fCJwX3cPH57jTLUTog7RrYYdDRVfGktjQEe1s+3s2nfFAEUxvaqrcxek30eEeD6v5dHAl1fa7WQAB7GrupxCqdl+4UKai6PBJs9ltEQWTU8zRqclR2C5ZlBRl+DxmwcEZUnddOFdy8sRy4j6NwVkPFYLgiU+03t3HbauhtZxYGhVUU9+6HONAkcX++zW3S8KEf5Ew8ANV9Bc3sOeiPwUevZFZRpJgvheITvIqWveItZhfDfwt65KuVH2ZbE5k4LgSXsLWV7rxuZrW021RKUHKMoNg7HEsoc/3uVcFWWc7zyt2H7mhttRPJS5m+uO/YBf9rJKhJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n7pffXE5gH7AmklAiZYOJfFRbqTO4AqdmD5mcbkSwqL3PUS6jFx3GJRP16aM?=
 =?us-ascii?Q?IY2IejWT98JCU3vZ2KmPR1YDOq69iEOwBmJLGhWEknbXgmZivYUUFhW3qRqR?=
 =?us-ascii?Q?kT66USA0P/z5PWOo+GcYhOy70q7pj45xXuXXbjJsinjbhxa3OogORTmNY7EY?=
 =?us-ascii?Q?LwMICgJHCFYtMD3SdQxGVPVAMAjbfp1WS9aoMjz6uV3s+AT3To1+a+gnd0Ss?=
 =?us-ascii?Q?FG7DtCIDQAiw2BT+CS67h7X/veLCbnjDpfGGDNjiMelvrvS3H8SOHOXtApnl?=
 =?us-ascii?Q?TVUZkn6PIVKn0Tz/pP+MyvYaSIrVGD5o+Ee0Rnw6fiuC5zAnnjx0Nt1T9i0n?=
 =?us-ascii?Q?s6Xnqv5q5xq23WenhjMmcfFUHE5SCmRRrvLu+L59Am+BMGGNuUMWlZ7XjNv2?=
 =?us-ascii?Q?+wbspEazXthfMuEKdV/hUbC3Q6hlc8XRPTOp6CnuTBFPc8drq1XD4c4pWjAW?=
 =?us-ascii?Q?MMNeHu4PFxxF0eszIqlU3S8hBR0Dvt2ocBA54Y9DhIVyP2huBD6FuuChFIeq?=
 =?us-ascii?Q?sYzC3H/c8CPHsfblN7bovgjUpEnsEyVaXnPCgpGI0fLu6zz4kyPLj5xhDmUy?=
 =?us-ascii?Q?Zv1wBS3KARctL33wqHkcMBi5n2KhJx3iLNyRhcNMx3v96HH0k61ajR8y6td5?=
 =?us-ascii?Q?nfU0q2FkIOaLXd9LwPl6WmuCMncBsqoD5ci1qI7XschnMkWzsTlt7SMmfF9x?=
 =?us-ascii?Q?NgII6aVVTRADGWvA8gkCLnmgqaqgd+8/aD0OTmdkRYhj4DBenyOSF8J8okrL?=
 =?us-ascii?Q?fNhvwWkysD3hG0yplQIvhqC5/gBaincaffrLLG7IKqX71c5rTdSsyEcGn2pY?=
 =?us-ascii?Q?v5fuXghzPWNWfpyRFC7a6S3nwTgvk7Qavuch4EMBWJplL/mH0XmyYanOR0pf?=
 =?us-ascii?Q?N0qOfoq7Atl7mAQtD3Tl0vgVY57VAZYxhuBnxvNNYeFQr601xrClcE8OK3In?=
 =?us-ascii?Q?c/kxpRQxPJxhmvnoyxfxYKOOXBQq6ZIV93r9+1048k/vCIJAEOLKjuxwucRw?=
 =?us-ascii?Q?NxpyXbOTse+ryG5Ugvp3EhGD1peu68vwiv9PSUC4slCi3BeveZ1WME1Z5R1D?=
 =?us-ascii?Q?Ox8QlKYx09Fkm+XymGi8ojmIWYS2j9JQDzFdG0M+u69lJrXGfNs3WcSQw7QC?=
 =?us-ascii?Q?V/SMyDEsG2WKtFXQ2cifuXJFgB1nYXb2SMxca9PHLIR/ecYwytQMNVB/DTbm?=
 =?us-ascii?Q?S25HXFRXAfM9EllJfjRvGU2Y5JeIYXCB9s5IT5vcOO9WGJlijfrWf+75e6JO?=
 =?us-ascii?Q?TkCdVUrGkRaFlTUJElRFbLLGx1Ww0p1La+3E3JWL4QwKLemWeqXFX50PDDfm?=
 =?us-ascii?Q?gQgfKm24VJyhsBjYNGKENuGTyoV3Zkt/vlndlsCDquTDz+cHmwWj9+F2B6lG?=
 =?us-ascii?Q?Emu86EWK3FgTswGQwz0Ue+roDdr6+0d1guR6NMfJn9OQczYlGwUL/a9q/pXh?=
 =?us-ascii?Q?w0MVPlav1JKwBeRAq8xp3qaQjZ+ORB0QyQ1D2D72RZ3yBdPrRci3YvXAOmzo?=
 =?us-ascii?Q?mXx+oo2ErT3Xn3NnNk+zrXAu+26t4M+Bt9yjCggPRYx6M7y7mUmTIqDzLo1u?=
 =?us-ascii?Q?utuPrDGrWINrgJTvrIFwXLfce5Y2BhtXO/spCIaPxggDAEmPNrRF8jG7Nv2I?=
 =?us-ascii?Q?IpCgvr1vYPp0PJ1kAVd+VBJuj2hpRvD9A0lSDwu8ycflnKRIT2SUQkn3uK96?=
 =?us-ascii?Q?isqeNcOcW9NM5RBR+vW246HkEMO5up3k6Wcdi4Vk2jk0/H0XV3Ynx7ArmnNE?=
 =?us-ascii?Q?ljvac3d/jA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eba9e7e-1c08-4191-e3a7-08de7670e478
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:27:17.8208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJ4jfXa6taiAPnEvdatn1LHSak0OO90o7WRuMR9mOY0Lzuxv9fTK28WUoKr36kIfm+J0xnuLz4PgAdq6m8zOEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11664
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28593-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: B60DC1BFF7E
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:32:20PM +0000, Cristian Marussi wrote:
>Leveraging SCMI Clock protocol dynamic discovery capabilities, move away
>from the static per-clock rates allocation model in favour of a dynamic
>runtime allocation based on effectively discovered resources.
>
>No functional change.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
> drivers/firmware/arm_scmi/clock.c | 19 ++++++++++++++++---
> include/linux/scmi_protocol.h     |  1 -
> 2 files changed, 16 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
>index f5d1c608f85a..d0fb5affb5cf 100644
>--- a/drivers/firmware/arm_scmi/clock.c
>+++ b/drivers/firmware/arm_scmi/clock.c
>@@ -161,7 +161,7 @@ struct scmi_clock_desc {
> 	u32 id;
> 	bool rate_discrete;
> 	unsigned int num_rates;
>-	u64 rates[SCMI_MAX_NUM_RATES];
>+	u64 *rates;
> #define	RATE_MIN	0
> #define	RATE_MAX	1
> #define	RATE_STEP	2
>@@ -480,6 +480,18 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> 			   QUIRK_OUT_OF_SPEC_TRIPLET);
> 	}
> 
>+	if (!st->max_resources) {
>+		int num_rates = st->num_returned + st->num_remaining;
>+
>+		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
>+					      sizeof(*p->clkd->rates), GFP_KERNEL);
>+		if (!p->clkd->rates)
>+			return -ENOMEM;

It may be not related to this patch,
I see scmi_clock_describe_rates_get() does not have return value check
when being called in scmi_clock_protocol_init().

So if devm_kcalloc() fails, there maybe issue without a sanity check
to return value of scmi_clock_describe_rates_get().

Regards
Peng

>+
>+		/* max_resources is used by the iterators to control bounds */
>+		st->max_resources = st->num_returned + st->num_remaining;
>+	}
>+
> 	return 0;
> }
> 
>@@ -493,6 +505,8 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
> 
> 	p->clkd->rates[st->desc_index + st->loop_idx] =
> 		RATE_TO_U64(r->rate[st->loop_idx]);
>+
>+	/* Count only effectively discovered rates */
> 	p->clkd->num_rates++;
> 
> 	return 0;
>@@ -515,8 +529,7 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
> 		.dev = ph->dev,
> 	};
> 
>-	iter = ph->hops->iter_response_init(ph, &ops, SCMI_MAX_NUM_RATES,
>-					    CLOCK_DESCRIBE_RATES,
>+	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
> 					    sizeof(struct scmi_msg_clock_describe_rates),
> 					    &cpriv);
> 	if (IS_ERR(iter))
>diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
>index d97b4e734744..5552ac04c820 100644
>--- a/include/linux/scmi_protocol.h
>+++ b/include/linux/scmi_protocol.h
>@@ -15,7 +15,6 @@
> 
> #define SCMI_MAX_STR_SIZE		64
> #define SCMI_SHORT_NAME_MAX_SIZE	16
>-#define SCMI_MAX_NUM_RATES		16
> 
> /**
>  * struct scmi_revision_info - version information structure
>-- 
>2.53.0
>

