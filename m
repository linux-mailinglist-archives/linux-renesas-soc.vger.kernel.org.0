Return-Path: <linux-renesas-soc+bounces-28615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ABzL1g6pWnt5wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 08:20:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD641D3D00
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 08:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE97C300EA9E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 07:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE69B273D77;
	Mon,  2 Mar 2026 07:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LVQiTJt+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C328506C;
	Mon,  2 Mar 2026 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772435805; cv=fail; b=bup0Yb6Nnuu6G+rUrUkUcfush7ueX5/hVIYJPa1h+HvDkZdnaIZDajgpWqwHEkFDMhZFcVOgSd6fKzwGRpu8vf/id1HN+gNrsXngN4holLnbbrqkzKvYSEBz3v8aAQ4o2TjN/D7j8lD02sMsx8n5gueEp6+LnWv+sCOhqYaQ/J0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772435805; c=relaxed/simple;
	bh=cbgRKusR9lM9NLuJTBEDhRQmcgt6srijTGbtDaqZOgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ok1K6kz5XVKYlItIL7tNXRhvBO1PuTGBBoTX9VyVZ+TLYvq5w2GdhA+t8txwbwYmGO356xBYtAAQWz0v5P/2GUv3LPNfswgGNfbzY3FIgePbKjbsb9x/zIBdlf4N1pFBDHKyObDsqdFFMJg/iSrc55Iag4qqrEasF31zIXuW5N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LVQiTJt+; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vfh/YZ4VffHdjX8wPQikGSh58oCjHeY3gPAsjCmWpSLRYlfKdBivNdp7Aoa7vTGd18zZW4ddatvGN2UnMO2ktI6Ilw2nKjE6t4hDkdVdHmrOIUWWpy6BQwN1/GR7BCZfyaMIGu/f1qN3/fr10TEwztxU4y1ztnZACqppEYbwK6PRmU948zqIZ7zc7yVA5awOoYjMPNSmbFv+TE7uriWPYzmzwETnGbePI+CQ6ZKJKoSXUHrIIAnHvPrn7c8PawBR2GKbq0jkpo+rTB/yfBiRBL9sBwN6FsakAokYIBEwTFpvZEBo/m/8HTjOdy9e8VTHGXTqIfLameYUqeTIpEzs0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+lbUZ5UQ+iZxCColnI/UaQ6A+AOA8xuZuJmQ+4bEJk=;
 b=XWoU6gC8FDHTX9tNGkKhrZJJ9L7k5JfhXIQw7OiVmKAVfSgeBQQSpmZ/kKCOpL1df9R1+HvDM037ADRGRydnrPcA8CXHqWCuErCYiYIsgFQFo21CAGr6RP9iwBItA+QDb+tDN+bhzU/1gJOqeP7VdQ9KL/iuntBUiEruHorlSd0YWc/XnLn8NwEd/U4JVJCdszB2ykqkm+lx/1nu+jBLWjNmrtIF8YO+ID4kPfnh5e54avv0TFRggRp/tVwviEZKTZDJme3bp95c3P9FmNSMBsDug0OJ4I6L2XBwiOChU7qM3tyXvPX8Owdthb7Gn/fulZ+cvhLWfOpJtHyv22Gdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+lbUZ5UQ+iZxCColnI/UaQ6A+AOA8xuZuJmQ+4bEJk=;
 b=LVQiTJt+oDEk1Ne9CXfLwDTQdjlp/n+tQRRsHjwqslN50Q5yHKbc5JUjQY9uxGK6/tYv01LGRuprJAwVXTqBIZm78Z5ETfEvAY4TvpA44EBVEF9kX9VKGKuoe8xMeZfNO5FwVJDNwdNjPhKTzkIn0iJFoAXWgCuViUuvoC1bRg4z9G/O3kCgZOMMNts5x9fG2nIrysfFx+JQRxscq7r/iAU/E5iwu0LMlaipqhLdrzS2YJHtym8FoL+WgzFki7eKsFiGTvoy9c5pJl4Ijli7rDPq4rIf3ye6/agxuB9y8yMRjAR52Yj6QjkVJ/MypQmydN1kB1u0zwp4A4Onbxdjsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB11393.eurprd04.prod.outlook.com (2603:10a6:20b:6c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 07:16:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 07:16:40 +0000
Date: Mon, 2 Mar 2026 15:18:30 +0800
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
Subject: Re: [PATCH 11/11] firmware: arm_scmi: Introduce all_rates_get clock
 operation
Message-ID: <aaU5xn/UlHeAhdxk@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-12-cristian.marussi@arm.com>
 <aaJXy2V7oI1tH4Ac@shlinux89>
 <aaLHuHFpcxdyqf9P@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaLHuHFpcxdyqf9P@pluto>
X-ClientProxiedBy: MA5P287CA0280.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB11393:EE_
X-MS-Office365-Filtering-Correlation-Id: 667328f5-bfdd-4d57-29ab-08de782ba686
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	G04oLzaG/M5sZf4uWq+cijHLVXGL432hl5tCeeyTx7rPlNsLPhIHAJjEgRfzk2KMdEqp55GN5b8nmZtXCvyuQ+Q0xIzdrSCwo2w28cTrI9fapdJBrsNG9pXUV9qYMZPs0L2XzkGyn+BSIULckR60v+lj6p9BSq78t5JVoC3SqIILtjYQ+ojbcWJkaVJa+h+OjLE86aILUMj8aIwt6mYDfqNK6Q+8sTXHersbpeklouEdBwtCXMl+hCYZG1oYICccbq+rgns/ljv4WUYOiLw01TbpoIXbeGrIYN/56S4C0XpjzkpPECyZscQSojoqdjTfSw8CPzVt43t6HnY35gVy9LoZusk5fPxTSgARrc0Wvov9RDD2lVDqdFzwi+ElAupSr47JSAnUbPLvzrkSIcWaQozfV+J/aERIYtRcrzofn4LN4VRewFSNWsh3PoESpLRCCcKm9DTR2yqn79G7Tn5HNCuuD0y8ZMj2OH/1u3S4kYQgx/lDYXai4BgYKlBfy1RpPs0lK8GQ44c8E/hS+MTmFKAVi7230m4g2db0Fi/Z7IsnrCr2f8bDKHoOxucYBuL1zIfLYdXmMpQa+itWHt2B/7QZAQMBWSpVioQ6R0dnNylCxr2nK4H+QhTZ4vaYijJo85uUSXmix+1y4gsDh5Jz+WkmBZy++jwqIzxztUdoIIHZhtAisyufHcWZPwu0c9p08kPoEg3+aoyVxI1IXUt44Dg3QSfv//JNg6rEY3Q4iwhQB8WCc6zPaHjXk208GJHo6l2kIko4FOGPLgVpYMUsGM7jsiOFcx6d9G7xTokexrA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?afTag9UR7WDL+6X1A06/BwSNcDkaGBI0ciMbfDl4zCXzeokWd5xOUwENnom1?=
 =?us-ascii?Q?gGaqjI0kAz9HqstueohP1HeiaLBc5i4d9Wj2zZZVfV1CT2aQmaENhudNOFVv?=
 =?us-ascii?Q?UJrU/b3ZEuHAhYxjk7Plv8FcAEO7T2akZ+OmBsnYhuFuiup7D7C6BQqPJeLb?=
 =?us-ascii?Q?Q3PB2gvva5cFpMXmvidrY8xTYqFCFHxxLExMvq4kge27HhWHEVkehnTxKxol?=
 =?us-ascii?Q?B1+hhNGnj2TSIxOXgbJn+5xQcesJ3a63dY0J+b5rMQS3AETMBZY/BvFwV82a?=
 =?us-ascii?Q?MBYdvc7quy0xOre/H3sqwxiOIQUjq+XFZhhtHM6rVnIQ+xi8dQ3T/cb2QS2Q?=
 =?us-ascii?Q?XTiqMSZhYQ+3dmD/IurTNm6cj0qqgMZUiLVAaGuK/frfoHI3XgI2jOdrQHg+?=
 =?us-ascii?Q?1YfIxRrZN7o2XtLacBgjPSIPDAJjhg5G2rc3BiprhjYNaWDm6u/4grV134KC?=
 =?us-ascii?Q?fqgtoSisy+44Gs5jyW6WSCrHda8Pv2zuKBCyK8QBtuOEZWackK9tZaoyeQG7?=
 =?us-ascii?Q?27esHwAQdTV82OCMgRVJCziBBUibULApsvB09TzfnO3hV82LpfgPRsTw6GaC?=
 =?us-ascii?Q?TnXhXInVcmjmY5BoGy6yHNoUFwXetCxN8lYWgVGcjdX2X9Gul9Lovo/6gIza?=
 =?us-ascii?Q?j45E3p/CTtX3W7dAIWwOCx5bBn0mAhMp5hkdvab+3gnKvf47p5azVEVzKFGv?=
 =?us-ascii?Q?FLXkrrS86ri/Gdd04yx8ZPNda0lyyXSRatgeYRzyZ/W9wXAz9Yq07nSsReEb?=
 =?us-ascii?Q?mxpo4+5V4L4WTeUKXuQhGB9KNuFFmszQRY3D7MtRik3toc/X38mSre67ZXki?=
 =?us-ascii?Q?dNUnhrA7lEZPhLMyr8ZxxDU9TSkXsAzTIKP3u6lBAlxDaZPzdCSvQRoEBJt3?=
 =?us-ascii?Q?a+CNLM3qh4tJYntcwgRt4oMUrODBLTus946fZ8olxhI6/vBffAE6lzNUa2q/?=
 =?us-ascii?Q?j51P+ol85SgZ/92ghuBly4fFdEmS/HAJz6GV8rVGy+hzFmXvVPNFt59/ARtQ?=
 =?us-ascii?Q?hzMMXng9/olvoKko7kDsDBtwD5uJUfsZbeRZby1ljD4c6MNS7qnu7vo+LnFV?=
 =?us-ascii?Q?VA7KKc8Bi6jwTFj0gGh7Hihd77ecc7ak0rpc7fJkLG+jg+67pGOrNw+T9zqi?=
 =?us-ascii?Q?utS/ANEzf2eoeD1Xse67c/sZSw69FY2bQL/+VTCiiN36JVRPc0cQmEmSV5d4?=
 =?us-ascii?Q?otE/+ww10R2z9HHXnQMZ3j2snwGq4j1fDbvgFhqlvTy0juQcArKZraUe9rqX?=
 =?us-ascii?Q?crbohfWz9TF04ZPkjKT2yRK7ZF6UbagJ7DYaJrV2IUJHk1N9UkWt2rK8Y861?=
 =?us-ascii?Q?1v6BvQX4MUTrdLRuJan/dYbG10hnrax9JVrQkssiXyc03HD0/eIwJUPhDoje?=
 =?us-ascii?Q?8l4l0tXcnMelGLtMmqrKJZH4qsgYcUFbsa2hxYulF2WP9Q0m8/DMLuCKUSiD?=
 =?us-ascii?Q?KuZBXpsW9ShSRUtynZ8vEzuHhqN/dW6HswVt0RvWXvfcyLh+F1XuIZuVxJpo?=
 =?us-ascii?Q?w/Y+l3owvMDxohBq5Ignz1FWrRCtuXCMbKk59Jf+BgQxaAreic9ZQPaCSqBK?=
 =?us-ascii?Q?COF10B8XQIUGC6EZyTOcMRAF/8OGYJonCURjred3qJWB7wm2/h1ER+ZUjzUv?=
 =?us-ascii?Q?yov0V0M19pUKKjd0YWKKVoQoTt4XlHtY8vy8p7D7Ds/wVIWNuXM5+Tt3GCek?=
 =?us-ascii?Q?hz91M0grp5jW/SVQfeFdarkHFd6A9KJxiBgkvVXo3i8K868YENsMRADFTrNr?=
 =?us-ascii?Q?KoSjTYuUSw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667328f5-bfdd-4d57-29ab-08de782ba686
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:16:40.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E/OwOjmccPS5R2DQI4grqaSw3zQm9Kt4Kjy8Mc7aUZI2Vp+sN6LKByN3ejEEPfz2iHo4fYvCJjz+r/XAfZqUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11393
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
	TAGGED_FROM(0.00)[bounces-28615-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:url,arm.com:email]
X-Rspamd-Queue-Id: 3CD641D3D00
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:47:20AM +0000, Cristian Marussi wrote:
>On Sat, Feb 28, 2026 at 10:49:47AM +0800, Peng Fan wrote:
>> On Fri, Feb 27, 2026 at 03:32:25PM +0000, Cristian Marussi wrote:
>> >Add a clock operation to get the whole set of rates available to a specific
>> >clock: when needed this request could transparently trigger a full rate
>> >discovery enumeration if this specific clock-rates were previously only
>> >lazily enumerated.
>> >
>> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>> >---
>> > drivers/firmware/arm_scmi/clock.c | 85 +++++++++++++++++++++----------
>> > include/linux/scmi_protocol.h     |  9 ++++
>> > 2 files changed, 67 insertions(+), 27 deletions(-)
>> >
>> >diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
>> >index a0de10652abe..c2fd9a1c3316 100644
>> >--- a/drivers/firmware/arm_scmi/clock.c
>> >+++ b/drivers/firmware/arm_scmi/clock.c
>> >@@ -159,10 +159,8 @@ struct scmi_clock_rate_notify_payld {
>> > 
>> > struct scmi_clock_desc {
>> > 	u32 id;
>> >-	bool rate_discrete;
>> > 	unsigned int tot_rates;
>> >-	unsigned int num_rates;
>> >-	u64 *rates;
>> >+	struct scmi_clock_rates r;
>> > #define	RATE_MIN	0
>> > #define	RATE_MAX	1
>> > #define	RATE_STEP	2
>> >@@ -469,10 +467,10 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>> > 	flags = le32_to_cpu(r->num_rates_flags);
>> > 	st->num_remaining = NUM_REMAINING(flags);
>> > 	st->num_returned = NUM_RETURNED(flags);
>> >-	p->clkd->rate_discrete = RATE_DISCRETE(flags);
>> >+	p->clkd->r.rate_discrete = RATE_DISCRETE(flags);
>> > 
>> > 	/* Warn about out of spec replies ... */
>> >-	if (!p->clkd->rate_discrete &&
>> >+	if (!p->clkd->r.rate_discrete &&
>> > 	    (st->num_returned != 3 || st->num_remaining != 0)) {
>> > 		dev_warn(p->dev,
>> > 			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
>> >@@ -486,9 +484,9 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>> > 	if (!st->max_resources) {
>> > 		unsigned int tot_rates = st->num_returned + st->num_remaining;
>> > 
>> >-		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
>> >-					      sizeof(*p->clkd->rates), GFP_KERNEL);
>> >-		if (!p->clkd->rates)
>> >+		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
>> >+						sizeof(*p->clkd->r.rates), GFP_KERNEL);
>> >+		if (!p->clkd->r.rates)
>> > 			return -ENOMEM;
>> > 
>> > 		/* max_resources is used by the iterators to control bounds */
>> >@@ -507,10 +505,10 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
>> > 	struct scmi_clk_ipriv *p = priv;
>> > 	const struct scmi_msg_resp_clock_describe_rates *r = response;
>> > 
>> >-	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
>> >+	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
>> > 
>> > 	/* Count only effectively discovered rates */
>> >-	p->clkd->num_rates++;
>> >+	p->clkd->r.num_rates++;
>> > 
>> > 	return 0;
>> > }
>> >@@ -531,7 +529,13 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
>> > 		.dev = ph->dev,
>> > 	};
>> > 
>> >-	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
>> >+	/*
>> >+	 * Using tot_rates as max_resources parameter here so as to trigger
>> >+	 * the dynamic allocation only when strictly needed: when trying a
>> >+	 * full enumeration after a lazy one tot_rates will be non-zero.
>> >+	 */
>> >+	iter = ph->hops->iter_response_init(ph, &ops, clkd->tot_rates,
>> >+					    CLOCK_DESCRIBE_RATES,
>> > 					    sizeof(struct scmi_msg_clock_describe_rates),
>> > 					    &cpriv);
>> > 	if (IS_ERR(iter))
>> >@@ -542,12 +546,12 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
>> > 		return ret;
>> > 
>> > 	/* empty set ? */
>> >-	if (!clkd->num_rates)
>> >+	if (!clkd->r.num_rates)
>> > 		return 0;
>> > 
>> >-	if (clkd->rate_discrete)
>> >-		sort(clkd->rates, clkd->num_rates,
>> >-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
>> >+	if (clkd->r.rate_discrete && PROTOCOL_REV_MAJOR(ph->version) == 0x1)
>> 
>> Not understand well "PROTOCOL_REV_MAJOR(ph->version) == 0x1", I may
>> get something wrong, should use ">="?
>
>I have NOT double checked BUT I think fro Etienne original patch, you
>can assume that clock rates are returned by the platform in ascending
>order (already sorted) only after Clock protocol version 0x01, the first
>ever, so ONLY when teh used version is 0x1 we must perform a full scan
>(no lazy optimization since we cannot assume that rates[last-1] is max
>AND we must sort the obtained list of clocks...

Per https://developer.arm.com/documentation/den0056/c/?lang=en, SCMI version
3.0, CLOCK protocol version is 1.0, I see:
"The clock rates returned by this call should be in numeric ascending order".

SCMI 2.0 also has it. But SCMI 1.0 does not have above line.

All the above specs are using CLOCK protocol version 1.0.

It might be overshoot, should the "PROTOCOL_REV_MAJOR(ph->version) == 0x1"
be dropped, so always sort the array?

Regards
Peng

>
>Thanks,
>Cristian

