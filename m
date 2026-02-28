Return-Path: <linux-renesas-soc+bounces-28589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDTONLo8ommq1AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 01:54:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DB71BF81B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 01:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCB00303AA8E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 00:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4403A23D7FD;
	Sat, 28 Feb 2026 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qhwvund4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012049.outbound.protection.outlook.com [52.101.66.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B663BB67E;
	Sat, 28 Feb 2026 00:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240056; cv=fail; b=kGbL+EL9mcNMM17gpCWojFhgQ7Vrizx9HvVnrAbinmC9rPJaRFKLCYiBPTnCBXuDDYMQ/zaJSNyrXlGIbhRc5NG27aXIE51guvZYrpO7BXhVUwBo+uGtmK7siKbuft3wCi/UvDL6PvdhtiJGz0vxF9SJHCVz5Pr7tW+XGQDARVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240056; c=relaxed/simple;
	bh=pjiS1jitwmGdmBVsnTmLXiCobWKvW5p6YJX9usrjT7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EpofqEU8DsvZ4CG537CQpk8j1ls5O7O7qAbcDboLRawBrIJ/pvlRj/bWSDl8+M0U4792Xsc0xARX2KLNp1ZM9sd1PDtQfDXOiKmnBgTouB2ZnNhG62XGwXsbPrCMVRHVmCQWLWu3NZMzs+vRVEKZs5BewnWpaL4MYgQk/523wk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qhwvund4; arc=fail smtp.client-ip=52.101.66.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJxsA2SWp5SnKjd9WIitzLR5uKPH0A+V2pX+qMzjogLYrxPEQsk5TAYtyElLOFtKm8ln9ZpAUtzgMy/55buHsNO1+PMZtrPJ2/4ZbCekM7BGMWWU3lXdAIoRlUOSabEu4+y/xVljO7UDEXY6rx7xwCcmvop6GvNx7DgdWEdPyHkMjSLh42T0phJdggYZEE/AntcSir7IU+19zq6sVEODeoUaABfv0wZOWh9gGc9PVIV3AFzOImMfb8UbznoyBhbKfMcQ7l+MHR8XvxHHH2xx6Ig5546cMWAIIh7WmWKRbFIipuXgSHnuFItKEh5RhcDmGYFkORsTx/PxMvuc9GzCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LA5/cHLgqF5UdTP1ya20OuOQjObbaBOtuyuP2d6unaw=;
 b=EbX0A2CsIUo8j8IDEFDYF3qgtLku+WW8++ivF15IUXGaqrUj4zQ2ckzXhXV2rk5q5yA1NdwBtw5x6JMP/sYewCo4DeRuAWh9bdK+iyFPcvdPtO9zWV96FXCYaiQb4Y5F8g9/BPVOYkueUcB2H8OmHpPUXBblNCz9ocwjI52FNXATog6CvsS8Zn76AkPjX7nqdL4hhWxlkC36QJAWzBU7OubdP1f4c8ydkCEPgk/skYUwUqKsYT7p4bKagKG6qZyzGb4D0vKkxdsAhrDNAwakMJ7eCnp9IN5cx+COCB33ORoQd8Lztj4ZxciffGomHW+W5oEnrvYvLgNKS+7mk3lFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LA5/cHLgqF5UdTP1ya20OuOQjObbaBOtuyuP2d6unaw=;
 b=qhwvund48p01sZ77EN/bi4BXkWuQlhmxCiyGwIX6m9Af7NeyzuQWcx4a+DIrMBV0rVfBZWWNn6ccZ+eNZp4Eb6W0OH83vZ5/UUYaN/isEbBjTYx7hTEZNRc8OXLokv+fiWwiijrgzTOCXzsDV/jufg9JkZe0PB4ouogWKqSmOmeea56z/O3VF1+d09NvkYPS/Gw6AiI8+Yxz/9fMF10NnNnY4IWz74IPZjNUMWgE/AKZFPL0d9ic5KYwShKcni16jvsPqWQjkdhgycCB/Psw59L/EaKxyHegV9NuFTXyem7OQpr914o6H+MMdgipZiOi0JnlSvijf0+laCIlkqNt7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Sat, 28 Feb
 2026 00:54:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 00:54:10 +0000
Date: Sat, 28 Feb 2026 08:56:04 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aaI9JBwWaMmfBbd/@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-3-cristian.marussi@arm.com>
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cefb6bb-37eb-4ed5-f2ca-08de7663e23b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	1sT7DDM1YUwJi7i8RNdIIJMT/hdze0+o5zBt+cWXjjbfYJioGGn1HM7tdLLK0tyDF4UX2YQ/vEk6oH7LP1iQdF092ACKSQINyyj802dmKu5oQLfp2nj6Y0gdTPp98OuROMi40uFy9wVNvIQiYDv2AmNbqyeIKbHXPmWjfAcOS2NKCoYLC+Lclegr2s7V/YMh42UeWi9ewZPXeFbuwWlNSVyI0+wv7yWsrTuooNAlLMz+6amFO2/mf3AFOPTaGl4QReh3Qh1FrtCsFCksqF83PklsxMMI3j0GSXjGZYi1EfaGwVB42ohgJOKPIl0Hgvry9lALJaJN+85NT4htQc+BverI3MFRigM1UYgc1J3EDrEPu9hue5uCOBhQNmmZ2kkVjLP0wtK9es3hhuTNsuT0ZIjdRp3O2W5fw8hYUSS1mlXeo9KNdMLnM4aE2dYSEXY2u6ZY2b/QK8iklhby4o+bgeDIvotskValsaX0JHHgyLT23KEYtunAId70H0c/Bc8liS0BqD24kMqlxRPZ4cCKoBsU456y/E6w/vHltT5Tf0LC+pepPSe3rskysrBje8iPU+pHcadJTq8j80sKAVz9gC2AWiZGw3AUkbj6PSWbVL9esc8KtWpXYUd70JN6hapBGMdU7hHTi3BOxc+bxDihgyrf1zTK0K5ucm+zlDB9rrAj8+nFObg4F8zR9K/txnFVDqiaX4rD01MSWlr1m6E99JhaY2MIex+NuAIqBl7pLI7S57nePaOIkLpukAaeK1WCl7PfBNIgIwn5QbApZNF+z5ee/mICxIWuN1Pj8Fm++sY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rhRqqrZ12+W4x9iXmIBOLQO8CH/CiCT6fc8PltNxcX91AitXAT+pjKJIyUOZ?=
 =?us-ascii?Q?hKtASMXdSbdng+IGhNTWTuK6EnmXCx+pb1PcguuTgiVJA6RX+2K8q5VTU8V7?=
 =?us-ascii?Q?lJDh5NX70gKGiq4lT6AKVY5lmPAVQGPU+cah6fo5Px7eZrn8sgcEPgBOd3kC?=
 =?us-ascii?Q?M6Uw4SDZMkc6kFL2cca7lRTYr0oXzZ+AaSMMygzdRwZ1y/dcVcFhTuUrB1LJ?=
 =?us-ascii?Q?8GKtQJsXJJ1mcebE9BCgyrmkPTs3grgymrRhbzpgCd8Dz/zPqvqiBoXeElzB?=
 =?us-ascii?Q?39eEsXXrutKRjk0DkHNmGDzW7gM1fmCnL3F4Wxeo8wcq8wbi8SB9OPuixuIC?=
 =?us-ascii?Q?irolkwKqBJHjLPPn9EEjk1TW3fyXXNZ+iJXhSBQlNwZyWE0bWAffgC1VSnmZ?=
 =?us-ascii?Q?CZEjjffbvCiNVzzbkHIx4n8cVNP+5+mTU3tnyxz3XCm3SFVHMvH400XcxMuB?=
 =?us-ascii?Q?TCFR0Ek4ZadsMSp8BQXbra9Mjw8iufu/jA6FfM+5gqdZh6ZousJl6bnZmxKS?=
 =?us-ascii?Q?Mm89h/8GgkDjRQdUgKlN65FgpTtgO12rkTpyHxXv23hWaTziITwXe4Yf0cxy?=
 =?us-ascii?Q?/ISxKc7nm/hpAqHmEoVx57e5CqlBZ9Y50dpHrgetN8mHLTlOzJpz9Z+t70Dr?=
 =?us-ascii?Q?PpTDK7T/aS8yB4OUW6Vm0UIQg9LYHKZ8gTkD2i2LGMwluM/B7cqhCrbkMMI+?=
 =?us-ascii?Q?KS/oi21w4ZadbHM6Gzj8QMkSszOmEtqdQbsFReFn6BrCpwLwPmvI59ZKuJ57?=
 =?us-ascii?Q?t4MQjDJ+zKLuB/tIF/65DLDw54fp56FR2+xiRF7ZGSqWlYZHW5XfOml0Isk0?=
 =?us-ascii?Q?OHoaGqYlfICod4Qj2oHGgo4CC1p0gGuEejoHLgsr+ziJe24MoQpzDjrNCo3J?=
 =?us-ascii?Q?PfRaDNagAnXtITigsb/w5zH2Xz96AjaK/CK2yXVEsXHc3uU1zajwl8msPi5z?=
 =?us-ascii?Q?zgz01ezzEGVjo7epgc0PpQErsf2tN5r9B+vauFYWA8kWlHEZv9N1LWq9n4gY?=
 =?us-ascii?Q?p1yVF+y4TQn5m3sELuE7QDz/g2qnAFBunPYQyXexXJEadxi6wpepwdTtuYl7?=
 =?us-ascii?Q?45+9J8jDgGGzRb35jahGO6Bz3fwfnmDWewoLj0l4sqDCzmqhS06WijVqdBLr?=
 =?us-ascii?Q?+uFACBmm4mTCmLRMotvNsZkMn/hPcU7VF/QO9ESbq+RafA58J/rfA3gPXZ20?=
 =?us-ascii?Q?sdXEUW3paYa4fsf9jOK9+8tHaSnsTRTjUM5gO5JjP2rRQ2D9YOXiIA6nExqY?=
 =?us-ascii?Q?YETplsP4ykbUwEz1oSFRZrTeEvU1QMbEoflXUd04WoQr6Bbkv37aXQodGQTe?=
 =?us-ascii?Q?dOnrjFPrXlMtbm2VJ2ZcgHZlegKc4dcdUUr38LA/ACqzgx8d0FuV+tB1LhrB?=
 =?us-ascii?Q?oD8kcX1HguUDJGUddIJiZtN8oZevVOpNQ/qtLW/Nxk5zc+oA9mGnnmOC/YDe?=
 =?us-ascii?Q?QJ2Jc47y6pIXDnN5Dt5nu65PtcImin+C9Z8Yjs2MdUPpxeIWaRU9wdGzPyhj?=
 =?us-ascii?Q?MMEz8d+J3/gSzGqC2CacHuuBzV1aerRque3ABkObSpn617OU0IXDHPnUCqZD?=
 =?us-ascii?Q?8kw8gui1Ul1WAgA8cHKyQVs8ASF97qA16e0cLMYd6XD2wDV74/D/CU736AfU?=
 =?us-ascii?Q?Kc30ejleOgG/btBXq2rUk3qJxn/5ob/IPj8GaqKCCEU/8ZnwvOS6YIatErLE?=
 =?us-ascii?Q?N6rrfUrNz6sM0ejEGpvcWu4xXF5OmDgXsEoRibmgVHRTaMxvNZM9MMHV6+fi?=
 =?us-ascii?Q?ij2+AH3HZw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cefb6bb-37eb-4ed5-f2ca-08de7663e23b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 00:54:10.4044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x43CnBvtaOcZqRon2o6i6vsrPo+pAOgfLvgvcuVav5AdzITgfMErtCDAdjve7iRTzedL7silwMDqazV4XFoT1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8510
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28589-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com,redhat.com,baylibre.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 21DB71BF81B
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
>Use the Clock protocol layer determine_rate logic to calculate the closest
>rate that can be supported by a specific clock.
>
>No functional change.
>
>Cc: Brian Masney <bmasney@redhat.com>
>Cc: Michael Turquette <mturquette@baylibre.com>
>Cc: Stephen Boyd <sboyd@kernel.org>
>Cc: linux-clk@vger.kernel.org
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
>Note that the calculation logic in the protocol layer is exactly the same
>as it wes here.
>
>@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
>such SCMI clocks.

Per my reading of Brain's thread, if ->determine_rate exists,
->determine_rate() will be used.

 	} else if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
+	} else if (clk_is_rounding_fw_managed(core)) {
+		return 0;

So unless update scmi_clk_determine_rate() to something:
--------
if (clk & CLK_ROUNDING_FW_MANAGED)
	return 0;

return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
--------

It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
above the check of core->ops->determine_rate().

>---
> drivers/clk/clk-scmi.c | 31 ++++++-------------------------
> 1 file changed, 6 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
>index 6b286ea6f121..c223e4ef1dd1 100644
>--- a/drivers/clk/clk-scmi.c
>+++ b/drivers/clk/clk-scmi.c
>@@ -12,7 +12,6 @@
> #include <linux/of.h>
> #include <linux/module.h>
> #include <linux/scmi_protocol.h>
>-#include <asm/div64.h>
> 
> #define NOT_ATOMIC	false
> #define ATOMIC		true
>@@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> static int scmi_clk_determine_rate(struct clk_hw *hw,
> 				   struct clk_rate_request *req)
> {
>-	u64 fmin, fmax, ftmp;
>+	int ret;
> 	struct scmi_clk *clk = to_scmi_clk(hw);
> 
> 	/*
>-	 * We can't figure out what rate it will be, so just return the
>-	 * rate back to the caller. scmi_clk_recalc_rate() will be called
>-	 * after the rate is set and we'll know what rate the clock is
>+	 * If we could not get a better rate scmi_clk_recalc_rate() will be
>+	 * called after the rate is set and we'll know what rate the clock is
> 	 * running at then.
> 	 */
>-	if (clk->info->rate_discrete)
>-		return 0;
>-
>-	fmin = clk->info->range.min_rate;
>-	fmax = clk->info->range.max_rate;
>-	if (req->rate <= fmin) {
>-		req->rate = fmin;
>-
>-		return 0;
>-	} else if (req->rate >= fmax) {
>-		req->rate = fmax;
>-
>-		return 0;
>-	}
>-
>-	ftmp = req->rate - fmin;
>-	ftmp += clk->info->range.step_size - 1; /* to round up */
>-	do_div(ftmp, clk->info->range.step_size);
>-
>-	req->rate = ftmp * clk->info->range.step_size + fmin;
>+	ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
>+	if (ret)
>+		return ret;

nit:
"return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);"

Otherwise:
Reviewed-by: Peng Fan <peng.fan@nxp.com>

> 
> 	return 0;
> }
>-- 
>2.53.0
>

