Return-Path: <linux-renesas-soc+bounces-29538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D5OBV8CuWmEnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:27:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1575A2A4C73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A2B5301492E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 07:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82C538D009;
	Tue, 17 Mar 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MAHQ+vaN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692738CFEA;
	Tue, 17 Mar 2026 07:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732441; cv=fail; b=g7FlWWQWd3eZYObAp0OA++1cSV3yjf6zIkKbFB04+FQuDzYS+WsEyZDgYPGc7voGtynxg21mcPlwyVIKTDFSlDOMaYREdm62d6i2idCXvl9izCYBjN/AG9tm8UHkEvvGIsMjIng1sHukyyEtQrDDrn0I2OEmqT7buoF0+e7HINo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732441; c=relaxed/simple;
	bh=BbwlIWIrt4YWJ2cQAErCtoj72+fB4aWoOEE2aa6YOo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h/Jnxz9SCIxvBebZvUULO9zhEQGm0t5UjXs8K4Ew/na10S0X/UfcQfY8p5f3ullXs4RONxpedhCl0wpwdcvY9lSQ6ZJPaJHlwikRupkir/5C70N4rlFDgy0tXpXnbuv8yeZsFsfDrp16sJvTKWadcR6ajAvZwm4NYJoCVUt2bZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MAHQ+vaN; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUFqPdNV+pvVqXW7ST+QZ7cmv1LTC1FxV9ch5OXDfinVWvuT7wf1d2qNOkwvef39y8l2m1MwDYTajeGPYV74vnXugzgF0ZuxZB+YrSEuHfhFwoA4oeFeC0SrC8HFRDS24ZvBvBr7gVwJFpPlFKw92DeBhe9uQzLmDp1ypr0AZ2uNndX3ofojxYd4rKUt7XQpXgmmaocqraKkILm2MjeRgJhqfc8aX4HY3ffPDwbfZoTwPDe5p4mKiO3Tbv2mnJeiEhqgQZn63r5Bl+hbZdDSIT37ioiZk0Mzx9f2uhCUBIEvWDcanEdNhBjJ4qtUhr5l39GgLdcSb0C4RV93R3q2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbwlIWIrt4YWJ2cQAErCtoj72+fB4aWoOEE2aa6YOo4=;
 b=RFqd+9mn3HM2kDEdVCdkGoKLOED0jBIL8tQfPzIm9aQk1rRhTboy88L1IIfgaNB7OLVGSVj0gyWv01s5SsnVvtz69tZu/GfWzokugGrA4gi36IG4WcNWqBgtJdpq6RWL7W56K+ZqgDmjdxYhqezFLXV6zGYgNahvflKNgB5m1Awz6RO7SPN4PpI19h/ScKGeOH1WZwb+EomLxQrDelkboeRrM02A0qwDYcaMvJ/r8G0Fv6A+2AeOgJdTdV2ljbj+ISJp5D4xHsnzE5S0rCS6cuKMYcZfps9H4pmdKZqMX6ShOeVYaHsXHVplVlF9p47+nzQnwvWNVn7lSJ0wJkmA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbwlIWIrt4YWJ2cQAErCtoj72+fB4aWoOEE2aa6YOo4=;
 b=MAHQ+vaNt1Hx8qV3oKTLpOGTfJQdUJinhmdAzZeNnEImLfQfnWTLNi4kCFx8NKyIuCYMCfua30NvPP33k4PSVJ8TUnpwWDkp59XnY/57gMANPnuRRQ34kIHWDvGMzvCiVt/WQCfB2VttyaAM9W7YDnd0B20vP6dOV/n0PcpSFL6WLJEW0fVkqc4CzbRTwS588Xj1gZBpnATYiv8o9T/nlTFPZlKIr4ZAg4UxOptTC3DLIw0RYrwzxPNR0JZhXyWK3fZMwkJR05WI36rHi0S+8FPNUtab0FAZWCSZQ6hLtXJzXh04qqkgnp3rElEONB0JptvmiyhyDZp5zGmGPNqOtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 07:26:53 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 07:26:47 +0000
Date: Tue, 17 Mar 2026 15:29:22 +0800
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
Subject: Re: [PATCH v2 09/13] firmware: arm_scmi: Harden clock parents
 discovery
Message-ID: <abkC0kGeKPvr3F3o@shlinux89>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-10-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310184030.3669330-10-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5P287CA0273.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::15) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM0PR04MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: be58c39c-d18f-4900-9663-08de83f68c23
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|22082099003|56012099003|18002099003|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	KY5jwiwzW27gCkSzwTMFs8VRriEv3LrbYQKa2XJ1Vb6z73l562UHl2RNI9sQwA2qzcteX7ZkuiUPUYUrJr9dMc7Tj8WZroHKuL7GqryysCrBZ0SUeT2knsxUfZppNsK+qFETh0mByKIBLSHzMV3cyvgV5l5U42s4YIJ2ZMZezOkTsxnVisvCBvyjV6UDQOexPnS6/a0fJTRP1tGcNGg4Vpehf0gE9QOFi9jTaGg4YnJY1JKAG8Lo7QrJiZdvsOnHeih+aVlnQOm+M51ADAZhp0aYFAdzWC4QSaIjrGtDRzVSjcC+60l/PN0P1wrcjqPm2Cpk1Ri4rriHCJ6yRJp89MC9Pakqqw7bBUyu5hQBXA4yGsXrBBM7tswVZzJVVAf1SLMaTKId3ugXLvsOvvneM++KOxqCq1KpEZfscKtcPDBhZbTlSNB+puuxuVycZl8vvjcewJ3Lvo+trcsNrdYHa7KqYut4BvpKRfnVZ4TFxcvEeQPjfJTs7BF804gQMltWSPs3xXcgEj/xGUM/8YgeTbQC9xemnXaoR5xIwRU3lpMV0bsb5icsDo/d5zckGBAanNdvXWp01y4u0traBVgGeRQD1/a9RdT0Gpe5ODIQulmvOKmOIW1K8Hn6mWsCWZriCXvTwjpZUgjL2FBsXp5YXrURgO6t1uPBukUD0ZujK3phSySc/Q3rTizUR0PCqwfw5ryK29i+TEwxW9Rdf4lkDVmh7SPFq2+WfPPlprOQoGqpbP+hVp7GGJ84C/znXTNH5+VAG7PVUbOdhXvih5sEho3hXjLB1sx1tzO7RXlrtrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(22082099003)(56012099003)(18002099003)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F4+dC40zkHaQCLc7S7kMamUj04ZQY+/W/TveJ+akcjN/bnU1sNHjIOVyOLAT?=
 =?us-ascii?Q?RA+SqjivtYRUzUnyftDwV5AfPP+E3xNQbmilKwUQ6VKCDq3Kjn+UFFN3ZRvn?=
 =?us-ascii?Q?O4rddaboNblZu4ja1AXMUrK6j0dnQcNgB8e4txIHmbagNi8ON1rl+Ssyz4WJ?=
 =?us-ascii?Q?dGzVtTra2qoMxY7joApp5rlbvWp/f0tSKw9Rbyd0xLaF70aMe3n+DVBB8IXf?=
 =?us-ascii?Q?GUf5n6NqH3GmLawImA6gQ7oxNVfvsbS5sxH82/GrQ+74UR1vOD21c2N6lJAL?=
 =?us-ascii?Q?i//9lAuISoa25t/RiFPhCpT1dbdauuSBalGdwQAV+gyn2jN/4OeZnU3tLhp2?=
 =?us-ascii?Q?C+yLNsn5NoEAmTrpYKzlZvAqlqL/Ux+aR86jqZtPN87xRZzz0RPTNOh0Uo/n?=
 =?us-ascii?Q?0bM99G93ooRyjsFzGsNJsG7UW6PejQZw7RmhGhv8IoaSRIGUSStpetobvEDE?=
 =?us-ascii?Q?qzlFnkfBm3doFyGSEtgBCfZilLeMn7MomGjUKdRTAqnvJc4f7F6nKGzPWQ1b?=
 =?us-ascii?Q?c3AqA00aAFQvQymoHbgBKclrK+ppxezi6lXojV4LKQ0lPJrnW8RWHYEcD+Yr?=
 =?us-ascii?Q?cdkldaUwrcHvi+PfAZtVCfCq8t8bJDDF0nAtPKWyMRbrQ5Jf5ltclNfU1n0y?=
 =?us-ascii?Q?VqVnlxdb7STXEKAE7ucOFikFdnjQSkQY8xH8NMdc+ueueXGWRySKowr2YzhM?=
 =?us-ascii?Q?pQOUarB5MWE2mzhN7WnRwwxxsAFI9cMmrTR0IzJWF/gew7AvCe59mnERnQBK?=
 =?us-ascii?Q?7ePS8ZPi7n1v2uC2SJGA/IMEXGyyrBHhasppGnoFwaq7PPhYAD+wa9w63iBa?=
 =?us-ascii?Q?YZGRcg47f4PmseSbsYNf1iSOEU1towfh2xiwMw936FgWOW3Q9GS/68/nOKXT?=
 =?us-ascii?Q?xNP0owIm5RvBRF8OXVvC8szfBMeXFuWJiS3ySuOQ65piE9osHQUe11RiHUYy?=
 =?us-ascii?Q?tpIRZiwnerm2v7lZH4bo0HcVFqeCHcffe9qB2EfR4vNe8qjG6oN6DEGv53Cz?=
 =?us-ascii?Q?H1UU7LgT9VIqKLtqO8DLFR8ePe/OOjN7+vUkTvuow9BvuCIVv86wPPShLOSm?=
 =?us-ascii?Q?OwzAQb52GAJMK+qqx7/+WT8Qqr7uZuPrwbEEXSAedOoIWkYZMvByk3j7DMce?=
 =?us-ascii?Q?ubnjLX0UNvioim2sNUiHaSARTNmCGXBemtX93hI/9GEPEHKS5LN8Tni6cK+b?=
 =?us-ascii?Q?8Ixd2Gw62dvLiMXFWMEQ8jc9Nl82Xe4eTPty5pQUGZ8gRGsAqc6O5RUxvPe3?=
 =?us-ascii?Q?xtbFOOADPvCsiUhhM8r1pjAl6/0s6Lq+qtC1gfszP+oMK/ipffOlyZK6zCf9?=
 =?us-ascii?Q?Y/BNBTykXT1ksr8jUIHIRf3bnjlJNZiaMbHty1kZofUYhvM/RxBxtbiGIUB+?=
 =?us-ascii?Q?YTlHgYPXGuPCib9cpTJH4f5es9cC4+ChClrvnSMCIUZSjKGM55AEUZ2nQLDp?=
 =?us-ascii?Q?gJaiVelWVlGKlHe9QbqeTT7lg6IRSQ8Bcwzj8S9z3dQdIVrXhfX6eAUt2gFi?=
 =?us-ascii?Q?31+ziKIFMTklj0pgtXfu4eZALei+GAUvhoypqzRz7Kn9DYQGp0wCWFzoU5Qg?=
 =?us-ascii?Q?UT3wdi9SemL3otf1MhzXBBilJNyq5pffpRZ662CBT1e825DOdkZz32W9Lfkg?=
 =?us-ascii?Q?qmLlfPfssa16OpYn+H0oFCg7vspajfmnqbzetBc1iYa+n1Ai7fXivl1uO7ng?=
 =?us-ascii?Q?4O+bJ1bppMYkOfa8RlL2XIoFYp9auIC+mV9jLJnLhh2q0DSHvT79dQoO4cyL?=
 =?us-ascii?Q?UVPvU8owZQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be58c39c-d18f-4900-9663-08de83f68c23
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:26:47.1962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zsY4Yg8sUIIL2Q7MwF90vD8CAl7YEK60GZue5Z86YULjKHpsDTZy8ET9CY0zFoKX6uCLIaF2aEAdEWx1W5DXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916
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
	TAGGED_FROM(0.00)[bounces-29538-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 1575A2A4C73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 06:40:26PM +0000, Cristian Marussi wrote:
>Fix clock parents enumeration to account only for effectively discovered
>parents during enumeration, avoiding to trust the total number of parents
>declared upfront by the platform.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

