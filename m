Return-Path: <linux-renesas-soc+bounces-28590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAFuMX9Nomn31gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:05:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA71BFDBC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 087623019E0B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 02:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EDF296BD7;
	Sat, 28 Feb 2026 02:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Jvm32nFn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03DE2101AE;
	Sat, 28 Feb 2026 02:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772244345; cv=fail; b=d5HGLJHcrWfrE6pelZHgNb5fO281L6wl9nmJbS7hAaJRXFahl5Ws0CNbVh5Zlp/Oqzc+vb7lYAxtpi5Gh54gkJ6z5dI8nHcUFhxP5A+QkgvtC9xkzv7NUQtxpVGdvSL9qiBHOVYXAPrgh6nSXkkiKvXvVbuO74qSoJdFSjtelqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772244345; c=relaxed/simple;
	bh=XnxQq0dAgHuAULs7bUYxH/w+gLY/7gTd5y76ILf77N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Cq8ixsfpgiOwvgd6YA2FoLceXZauob2OUVtS1Bl7PxuF/oyO6M6Gs7WIbLhw3QGjw+dRltKB1M+lhJs6ledrOZ4sSYrD7I6dZhY6cmzW/80KKT/MGNWjwQ13nGtyi9YF+rnG2/Vx6c+mSY28b6WtMoSBmHeXO283QxH8xAyjyOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Jvm32nFn; arc=fail smtp.client-ip=52.101.84.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrXLmTuAZNrYjKtofR9HFhWXnqwgBxZFgF5VSCQx+51aV81VZm1V8nhLckc0LL1RQ1mOMZXPun8xPaicku19e6OZfF4Z4j+61hZCicVA56w/VFb6KhCCKKYY7w4rCB9TcQafp5fIaDLtgFYELUW5ymQuSq/xJ0i+X2WZQ4Vg+cdlDuWRaEnJeiCbI6MWfBdnWoce52e9GrDpzoIDhr5UCtXCRijKUYVodSJSrwFajfZZghS7XaV9dCnTnX7NPr/u/3Bv9ruBWwxech52QcyTIxWF/XCQsqe1byij5pBumYtAU24HNlxDnLPYn8HBRTmdUjfVLKwP9l8iSZuIhwZV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLMdUZnGbDrqz6J0iY8xJVlVmtea+PHiVkE266wDA44=;
 b=zWhDQvm1ppu5KJAdPPQR9XiNo0F+RZaJILnfGKbrwkQENBaSxR33YrLyTyNbZba/zRfdkk+YTZ5oc21D5giHAEXPNXMqJoi+hjTBZQtSwf/qGQ7x1pHLBZ+ujX9ryi6HRnFeArmbPuQC3HoZ+J5diIfua2bVfJjJEK6Fowtl0x0XJLkgrfFN4XIln6uSOqkwiCi+jk5J2dskc54ndj5rJIIf41dk2eIPOR9uYIihohRXQHzuNkyED20tLHJqM3wRx7eV31W2pW/f2rq1S8ExWWVoPNDoJpCvKhwW5sHpYzxGROAXzCvu3Ty4Gb93XfJ3c3YYd/OtG9UeuNqackNbFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLMdUZnGbDrqz6J0iY8xJVlVmtea+PHiVkE266wDA44=;
 b=Jvm32nFnNWM8osAo9UmDym/7AxLK31NtvnJdc6fUIjrhQdx7i7/bXXxx+Colj0GFhrGd42auY3P+JVckJ0i8TeCEnKjPXmC/M+NdznpEWtKbdiDaRrdU9UO0cRFeG/ay6Xc8GNge3g2Dvx5rs0w1N7Nz5WlKb8bBHzPiKT9qdjO8fbhI0/u1d2nQh1EdgOMVXNDEyTRxZUgHRQ1bdpySgglhgdWYShiH+2BP24ceQ6Ad4Zh7yXAYiPw9uo20OH4X3qSRxUHwcAXnPN/HJj85Hnt2M9KGjrGwAjrwNKNNKQUCVWrjSKWm6QaGIjHJJ0kmq7lVD5xfgZNIwHPg4sCXZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Sat, 28 Feb
 2026 02:05:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:05:35 +0000
Date: Sat, 28 Feb 2026 10:07:28 +0800
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
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed
 interface
Message-ID: <aaJN4BSVB2RhICWK@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-4-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-4-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 612c1a43-6d07-45ac-a252-08de766ddbf4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	6TS9Bd7ZLQ4fByCVYufytXK2UB1XIDH4a1kfOYE3bN6L+ZnWX1t49mPNmEoWZXXF2Kcyj/sSifKqTID+nROShlypM0ia233MYZmbxK/6a2m6NOwl04EVy99fQujclj4Iuoz5LOq4uuE2LYvXfisSNLZ/qFXdHJTerD9G2Wm5zdnyQRldjgYyJDDYeO88InM7D5X8ZgXk+R+JbHyhRJ0cAUyrbSmK5/ECpO7TSemh4cEsyTdSkJx+Omca7i4/1E4OOCLSVCAufw23veBrydKrbVk+ebSUUawy5sItPwlGYQun6P3kQZVkteOU38JxONuU4t6iCpYio6wBT/RUFBINULX0K2S/PKxB/KjM7cm8Xx/tUzijGEJGJgcqgNBtCINAlyEaTJL/g4NT5Gs1vStuB2kjMZl7nxTYYJVdzKEG43FWgqfK+PgmwQAJmX3DUTlIibsnnPIJ4xRkR6qnf3Iq2piVAvV3D6N/K01O+upghq5nrTVqUnDh+BKiOILWEOwr3ooN3FfmThWv7OINNQZFqbPFOhWUhF9PEaQVNUa80FK4tR8ZnEhdMVWODKPFsujoONjB5qKpDeODMOxy55hwtBxx4diwLFtcMYWtFfRT8WwylzE7NPxRk9g0ZRYSA3hIssSdK2YeNxF0AYwjOEBYutpuUwrzqA2DpsBCN3GePt9Uxg8bphDi5nYFy2bgZ50/4Sg7LEj7D9KIzb1k4n/9FoL2BsnKobhu7NgIqEycGBn//JHcW1Ac4PFy4R074HixG29QQBhv2OF3OsZ26XRF4vxyaUBhyFNNBpFBgyP5vGg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xIzghiWTviZM09v/WckPF766iCQAESWPxIUAmOBLHRduQfR3fQ/pmQ6drqnS?=
 =?us-ascii?Q?A4FFXrHTUsP6uSsz2svGY50a0AF4FxqYR4aQEndOm6lozSC/XLMr0HesKtcT?=
 =?us-ascii?Q?kU9Fn53Fklmec5Xo/Ft923qIydlzw0YErRYxK6S33jGotGLgqdTDiIl2P5Ic?=
 =?us-ascii?Q?S382rJgh6E7sl8IhXHkGd45XOFQ0BICdLw5m+5cqUrjGRQI3DPHd6uWbWvs6?=
 =?us-ascii?Q?CLBdpo5hEwS+EpgvLkZj1rvggun4dyJ+kza2fGhyHeBLLQqFM4KvqH44ueKK?=
 =?us-ascii?Q?12P9u9gN3c3raJZATllkH09xI4vEycreWUY4iglS9MxYE4Ji6bBfTyWp6Tab?=
 =?us-ascii?Q?1BWRZeUJWbNYmKWSP/kCZKR5kZ5BdkJKC0vjgiTLqLBYaaZJwv9FJ9YVuo6t?=
 =?us-ascii?Q?3diq6/d5lQnlRKopiJNfp8M8YDTOJ2eal1MTgEUhbnpoAnc63OEC8MOH6dJi?=
 =?us-ascii?Q?lFjabBU0PuZZKRPNb6vf5bQ9MQlXzcsphGHTIGKkEvsU1U544L2qojIpqxMn?=
 =?us-ascii?Q?0mC9KzpGVHKSwcr1526fovjCZNaFpjQ42Ro1z/4G4GVAKXMeEs5lWwSEj1XO?=
 =?us-ascii?Q?tNCm/5aEIv6Ru9LF1NjjhTunJ35wn9YUO8viDgohlTQeSuaqkZ+Ud7Q9UHsk?=
 =?us-ascii?Q?F0rNTeXxIrRG7dcBVEX9MQfbZ+JFoRh9+n6bX724wRfeVt3+eYLIMrFuaXUG?=
 =?us-ascii?Q?Iy/Wv8s9XOir99r5OyCWFFSfX2R7cOi7s4a8JIcvZV28YqA21tvVN1w5VlIE?=
 =?us-ascii?Q?96fCf5/vUPhKTwblBVj32r2CxQeSxWL7Jom1c2V9UW5YFjj0WXP+qg+z1N61?=
 =?us-ascii?Q?+oyySDOFJM/Jlj3+Ozsq6NiLrH3NK5G44+VhHy7Z9SFOodDhSineoVYLN/F2?=
 =?us-ascii?Q?YRiwrdZU8Zrq/Q7AMr1n9U/lK2clHRHxuvLGoO2W02uSq5OJANzFKly4nPqy?=
 =?us-ascii?Q?3mfZ8MGEEgypw+iEK1o2kbgMjDlgMJqmirPcGE48HFhTi8Gg4ZVdA/Sip4U8?=
 =?us-ascii?Q?x3Jz7Vh6hM8KbeLEpKYXJ/h1Dqv2EWnoaqqBhHzBBT8T8xuvxGaiW1oX0urM?=
 =?us-ascii?Q?2ewGDPiTlcU/7DnLOmC7Wtn6/G495j9s/WXUDEJITw52am21w+rVJ1BH5uxJ?=
 =?us-ascii?Q?zSaTb+m85vWtAS43Zga02InqUwnseGtESNlAV1SDaIMN0eKbYWCACI1VL+4r?=
 =?us-ascii?Q?A1qF5Q2OdL6p0UEjUpAqcaqCvVjRsvfelcQtQmLPrTYDq0mKI899VAgRX4aN?=
 =?us-ascii?Q?rl20BzP32Hqh7SlqBlyspWM4cBxY7l0pbUEiCZEyJzAEtAoxd/eb91CB73zp?=
 =?us-ascii?Q?SspiviBHrXCqBaH86KQR8EzYYSRNfUrueKQ0Sgw2VKYWmiJTVH4JX2RpusYC?=
 =?us-ascii?Q?kpFPXUsDm9trDoSGl3XphL0fNyEj958d+uC7r5UcNk9Atb+O/kOgE9MrN1tY?=
 =?us-ascii?Q?usriThydwiKCbMjPny8V1fPCpxkcNDmXQYcWkJRwEKYzuQgyxAFDVcF0sDhu?=
 =?us-ascii?Q?6Gtd/h9zKXTmfYiZ90Y9lEvWOe+cEP9xFp9VsPI/gl0l/JqjFvD77GpcrbiC?=
 =?us-ascii?Q?QyZJGzXyPox9QX0WkVGDNSEEDphtoUceh+qOLjwlx4y7fXXXzBI9ov5T63Vt?=
 =?us-ascii?Q?9+8xxRMMfmSa+WGno7b7yQmw70+fvobllvyQw721oZbIlANfB7v3iHOzsSpp?=
 =?us-ascii?Q?2Umm00ebazexz6i7XF3VVSbHyJYGr5S4TrJFClcLkXyCiq2jcLOwxL7htXJw?=
 =?us-ascii?Q?ds8aiJrKuQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612c1a43-6d07-45ac-a252-08de766ddbf4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:05:35.1834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60vF0b2o9fR1D+GQk92UfD0tTzPkVrkOsw7boDviJfgbCfshZtjeuvjP8q8Kivz0ERlamgS2z2u6GndqAEFrKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28590-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1BA71BFDBC
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:32:17PM +0000, Cristian Marussi wrote:
>Move needlessly exposed fields away from scmi_clock_info into the new
>internal struct scmi_clock_desc while keeping exposed only the two new
>min_rate and max_rate fields for each clock.
>
>No functional change.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
> drivers/firmware/arm_scmi/clock.c | 145 +++++++++++++++---------------
> include/linux/scmi_protocol.h     |   2 +
> 2 files changed, 74 insertions(+), 73 deletions(-)
>
>diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
>index 54e8b59c3941..f5d1c608f85a 100644
>--- a/drivers/firmware/arm_scmi/clock.c
>+++ b/drivers/firmware/arm_scmi/clock.c
>@@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
> 	__le32 rate_high;
> };
> 
>+struct scmi_clock_desc {
>+	u32 id;
>+	bool rate_discrete;
>+	unsigned int num_rates;
>+	u64 rates[SCMI_MAX_NUM_RATES];
>+#define	RATE_MIN	0
>+#define	RATE_MAX	1
>+#define	RATE_STEP	2
>+	struct scmi_clock_info info;
>+};
>+
>+#define to_desc(p)	(container_of((p), struct scmi_clock_desc, info))

Nit:
no need parentheses

>+
> struct clock_info {
> 	int num_clocks;
> 	int max_async_req;
> 	bool notify_rate_changed_cmd;
> 	bool notify_rate_change_requested_cmd;
> 	atomic_t cur_async_req;
>-	struct scmi_clock_info *clk;
>+	struct scmi_clock_desc *clkds;
>+#define CLOCK_INFO(c, i)	(&(((c)->clkds + (i))->info))

Ditto.

> 	int (*clock_config_set)(const struct scmi_protocol_handle *ph,
> 				u32 clk_id, enum clk_state state,
> 				enum scmi_clock_oem_config oem_type,
>@@ -185,7 +199,7 @@ scmi_clock_domain_lookup(struct clock_info *ci, u32 clk_id)
> 	if (clk_id >= ci->num_clocks)
> 		return ERR_PTR(-EINVAL);
> 
>-	return ci->clk + clk_id;
>+	return CLOCK_INFO(ci, clk_id);
> }
> 
> static int
>@@ -226,8 +240,7 @@ scmi_clock_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> 
> struct scmi_clk_ipriv {
> 	struct device *dev;
>-	u32 clk_id;
>-	struct scmi_clock_info *clk;
>+	struct scmi_clock_desc *clkd;
> };
> 
> static void iter_clk_possible_parents_prepare_message(void *message, unsigned int desc_index,
>@@ -236,7 +249,7 @@ static void iter_clk_possible_parents_prepare_message(void *message, unsigned in
> 	struct scmi_msg_clock_possible_parents *msg = message;
> 	const struct scmi_clk_ipriv *p = priv;
> 
>-	msg->id = cpu_to_le32(p->clk_id);
>+	msg->id = cpu_to_le32(p->clkd->id);
> 	/* Set the number of OPPs to be skipped/already read */
> 	msg->skip_parents = cpu_to_le32(desc_index);
> }
>@@ -246,7 +259,6 @@ static int iter_clk_possible_parents_update_state(struct scmi_iterator_state *st
> {
> 	const struct scmi_msg_resp_clock_possible_parents *r = response;
> 	struct scmi_clk_ipriv *p = priv;
>-	struct device *dev = ((struct scmi_clk_ipriv *)p)->dev;
> 	u32 flags;
> 
> 	flags = le32_to_cpu(r->num_parent_flags);
>@@ -258,12 +270,13 @@ static int iter_clk_possible_parents_update_state(struct scmi_iterator_state *st
> 	 * assume it's returned+remaining on first call.
> 	 */
> 	if (!st->max_resources) {
>-		p->clk->num_parents = st->num_returned + st->num_remaining;
>-		p->clk->parents = devm_kcalloc(dev, p->clk->num_parents,
>-					       sizeof(*p->clk->parents),
>-					       GFP_KERNEL);
>-		if (!p->clk->parents) {
>-			p->clk->num_parents = 0;
>+		p->clkd->info.num_parents = st->num_returned + st->num_remaining;
>+		p->clkd->info.parents = devm_kcalloc(p->dev,
>+						     p->clkd->info.num_parents,
>+						     sizeof(*p->clkd->info.parents),
>+						     GFP_KERNEL);
>+		if (!p->clkd->info.parents) {
>+			p->clkd->info.num_parents = 0;
> 			return -ENOMEM;
> 		}
> 		st->max_resources = st->num_returned + st->num_remaining;
>@@ -280,29 +293,27 @@ static int iter_clk_possible_parents_process_response(const struct scmi_protocol
> 	const struct scmi_msg_resp_clock_possible_parents *r = response;
> 	struct scmi_clk_ipriv *p = priv;
> 
>-	u32 *parent = &p->clk->parents[st->desc_index + st->loop_idx];
>+	u32 *parent = &p->clkd->info.parents[st->desc_index + st->loop_idx];
> 
> 	*parent = le32_to_cpu(r->possible_parents[st->loop_idx]);
> 
> 	return 0;
> }
> 
>-static int scmi_clock_possible_parents(const struct scmi_protocol_handle *ph, u32 clk_id,
>-				       struct scmi_clock_info *clk)
>+static int scmi_clock_possible_parents(const struct scmi_protocol_handle *ph,
>+				       u32 clk_id, struct clock_info *cinfo)
> {
> 	struct scmi_iterator_ops ops = {
> 		.prepare_message = iter_clk_possible_parents_prepare_message,
> 		.update_state = iter_clk_possible_parents_update_state,
> 		.process_response = iter_clk_possible_parents_process_response,
> 	};
>-
>+	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> 	struct scmi_clk_ipriv ppriv = {
>-		.clk_id = clk_id,
>-		.clk = clk,
>+		.clkd = clkd,
> 		.dev = ph->dev,
> 	};
> 	void *iter;
>-	int ret;
> 
> 	iter = ph->hops->iter_response_init(ph, &ops, 0,
> 					    CLOCK_POSSIBLE_PARENTS_GET,
>@@ -311,9 +322,7 @@ static int scmi_clock_possible_parents(const struct scmi_protocol_handle *ph, u3
> 	if (IS_ERR(iter))
> 		return PTR_ERR(iter);
> 
>-	ret = ph->hops->iter_response_run(iter);
>-
>-	return ret;
>+	return ph->hops->iter_response_run(iter);
> }
> 
> static int
>@@ -352,7 +361,7 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
> 	u32 attributes;
> 	struct scmi_xfer *t;
> 	struct scmi_msg_resp_clock_attributes *attr;
>-	struct scmi_clock_info *clk = cinfo->clk + clk_id;
>+	struct scmi_clock_info *clk = CLOCK_INFO(cinfo, clk_id);
> 
> 	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
> 				      sizeof(clk_id), sizeof(*attr), &t);
>@@ -394,7 +403,7 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
> 			clk->rate_change_requested_notifications = true;
> 		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> 			if (SUPPORTS_PARENT_CLOCK(attributes))
>-				scmi_clock_possible_parents(ph, clk_id, clk);
>+				scmi_clock_possible_parents(ph, clk_id, cinfo);
> 			if (SUPPORTS_GET_PERMISSIONS(attributes))
> 				scmi_clock_get_permissions(ph, clk_id, clk);
> 			if (SUPPORTS_EXTENDED_CONFIG(attributes))
>@@ -424,7 +433,7 @@ static void iter_clk_describe_prepare_message(void *message,
> 	struct scmi_msg_clock_describe_rates *msg = message;
> 	const struct scmi_clk_ipriv *p = priv;
> 
>-	msg->id = cpu_to_le32(p->clk_id);
>+	msg->id = cpu_to_le32(p->clkd->id);
> 	/* Set the number of rates to be skipped/already read */
> 	msg->rate_index = cpu_to_le32(desc_index);
> }
>@@ -457,14 +466,14 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> 	flags = le32_to_cpu(r->num_rates_flags);
> 	st->num_remaining = NUM_REMAINING(flags);
> 	st->num_returned = NUM_RETURNED(flags);
>-	p->clk->rate_discrete = RATE_DISCRETE(flags);
>+	p->clkd->rate_discrete = RATE_DISCRETE(flags);
> 
> 	/* Warn about out of spec replies ... */
>-	if (!p->clk->rate_discrete &&
>+	if (!p->clkd->rate_discrete &&
> 	    (st->num_returned != 3 || st->num_remaining != 0)) {
> 		dev_warn(p->dev,
> 			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
>-			 p->clk->name, st->num_returned, st->num_remaining,
>+			 p->clkd->info.name, st->num_returned, st->num_remaining,
> 			 st->rx_len);
> 
> 		SCMI_QUIRK(clock_rates_triplet_out_of_spec,
>@@ -479,38 +488,19 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
> 				   const void *response,
> 				   struct scmi_iterator_state *st, void *priv)
> {
>-	int ret = 0;
> 	struct scmi_clk_ipriv *p = priv;
> 	const struct scmi_msg_resp_clock_describe_rates *r = response;
> 
>-	if (!p->clk->rate_discrete) {
>-		switch (st->desc_index + st->loop_idx) {
>-		case 0:
>-			p->clk->range.min_rate = RATE_TO_U64(r->rate[0]);
>-			break;
>-		case 1:
>-			p->clk->range.max_rate = RATE_TO_U64(r->rate[1]);
>-			break;
>-		case 2:
>-			p->clk->range.step_size = RATE_TO_U64(r->rate[2]);
>-			break;
>-		default:
>-			ret = -EINVAL;
>-			break;
>-		}
>-	} else {
>-		u64 *rate = &p->clk->list.rates[st->desc_index + st->loop_idx];
>+	p->clkd->rates[st->desc_index + st->loop_idx] =
>+		RATE_TO_U64(r->rate[st->loop_idx]);
>+	p->clkd->num_rates++;
> 
>-		*rate = RATE_TO_U64(r->rate[st->loop_idx]);
>-		p->clk->list.num_rates++;
>-	}
>-
>-	return ret;
>+	return 0;
> }
> 
> static int
> scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
>-			      struct scmi_clock_info *clk)
>+			      struct clock_info *cinfo)
> {
> 	int ret;
> 	void *iter;
>@@ -519,9 +509,9 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
> 		.update_state = iter_clk_describe_update_state,
> 		.process_response = iter_clk_describe_process_response,
> 	};
>+	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> 	struct scmi_clk_ipriv cpriv = {
>-		.clk_id = clk_id,
>-		.clk = clk,
>+		.clkd = clkd,
> 		.dev = ph->dev,
> 	};
> 
>@@ -536,16 +526,23 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
> 	if (ret)
> 		return ret;
> 
>-	if (!clk->rate_discrete) {
>+	/* empty set ? */
>+	if (!clkd->num_rates)
>+		return 0;
>+
>+	if (!clkd->rate_discrete) {
>+		clkd->info.max_rate = clkd->rates[RATE_MAX];

Not related to this patch. Just have a question,
if a broken firmware returns RATE_MIN, but no RATE_MAX and RATE_STEP,
should some sanity checking being added?

Regards,
Peng

