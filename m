Return-Path: <linux-renesas-soc+bounces-28588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJDaK/41omnR0wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 01:25:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C84281BF696
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 01:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 310A1303ED99
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 00:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9CA23D7FD;
	Sat, 28 Feb 2026 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gio60ip/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4367D24B45;
	Sat, 28 Feb 2026 00:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772238329; cv=fail; b=TNdgjbEG/ASiI/lcSxWneziQTvhd9R8nFql7nW8NLjnbCc2lbpAW7KUAnOqHK5aQhfgQ7xJ0GwD3/G4mKzs5hRJ27v/rHZgqdlc9OjLHeNxNup18jTlkHZQODHbUtWltC7RLt17t5SKyak+HY9y18h3umL3dwBc35FeHXltvjx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772238329; c=relaxed/simple;
	bh=Kkgaz5uC5x4BgHzeWPe3NPq9J/Enb9IKKQ/nkN5FzQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IgvPNhcAKC/yLkbxHCLPPsq6vRsMWWcUaJ03iUgqzCqlfyLIdizaS7vMBIaT0/mqdXm+N7kXnklnN9E9B3UWJwwECi2lb31qPraVyq/wLHiA1cC06ugQ6eO31S09xv9PXBWNUsK8+/4ZUVjPOWzkQ7IE2Zwtd75kZbr2j0bwyac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gio60ip/; arc=fail smtp.client-ip=52.101.83.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isvs9ZKHK8yURgp0pF8JO5uP5NU8VD52+hBKVFDOGhbH3ONx4SkmpxTfjCPZXi47rWPlNyQ4GANK8gkAT8uNJbXmUbEiiKwuYub65ULoyjEjCDKxo1dqGNW/hVP7Z5SeQ/Uz3Z0eHQ1bFcoAHdr35brLhtFLr2mRtlHB+92jbjrJHsWTtmWVgh3Dtpsv1ZPRdi30s/BHmgrf1cSTAF8ZKmJk3QBfaelRQ/prCrSUscN4CDQm6skThKtfzprqUwBpfhaq/9lQy+XEUacX4lUilTv4haMej4MkcVbiyvcneIrFZIj9i8j5Mz8Fi4isiEUI+9OidhAVrJQq7akOROr8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qacH+Q9ciAKndVpHtY1Zlaz2hXg9vVNCcAbgJQJ7KmI=;
 b=XuAsZ20zVnt7PNPh8QwNmBWi5dWF+Y3sI/ERIPvHLDFneMkxt+Er7Kfgwb+wT2fHDk8v9t0nfnKd5aRktcV6CWZvpvqKk1mq1X35YKsw35yIT983go93Ki0diNEB8Ajz/tEf8nIE9i22eIiaxfeS4bUHTHU2w0MWr7udzvQ1ljac8BJ3PjFetuhZHyCEQA2mw1CBS5gnfvgtitnu83kXjPCDiaoTahVfsrgqoz3TLbXa7KlKrClHgs22USExZ0mFQ6IweiFQD1nkDpZ78iSe0gtTwj/q/gnxGzLTJZ+CjReVzYHhfoLi6otuerB/k19p2JYcw4CYYPzGSQW7MQpBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qacH+Q9ciAKndVpHtY1Zlaz2hXg9vVNCcAbgJQJ7KmI=;
 b=gio60ip/NdmgrVCWbqpL7/JaFC9bMJQqO5GovlZKl0BpfGqgScdnv/Wtq/2wGWGeyrmoOJXhX3ITcdXXFkJYGWW8ySLBfIY+LeeJQkD71oKFP14ox9YLb1d2ocREvYXeY4icxDAWOcudvwa4Kbgv6ejw/KL7avQyIjxlh8Q5VF5GOTfaJRVDsigefKodCP1NUFuNQ2EHsBNENObULtTfXaYFgSXen9IdRSRymiPrXFoHtMdHEakHPbC5XdyzBkz3TyvjUAYQk0EGzI9b4PZLHykpADMq1Av6tpLa+/6JJ3Lmd8JVinAWtKXWZGBoNfWhCT0nL53AZCxWgYeBwsLXBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB11218.eurprd04.prod.outlook.com (2603:10a6:800:29a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Sat, 28 Feb
 2026 00:25:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 00:25:22 +0000
Date: Sat, 28 Feb 2026 08:27:11 +0800
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
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <aaI2X6qnGabtW1t0@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-2-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-2-cristian.marussi@arm.com>
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB11218:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d668875-f795-4df7-a1b6-08de765fdc06
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|19092799006|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	qGKLAjlHI7U7sI8sN4iOpPsX0fE+3zNitvLNJ3LrQMi1+A+niFu8ZAjQrB1eVcdFBr2Ml2fdxV6mzpVpN5VIray3WrVE1W9wMy3b7fJl+TdNb0lS7gIFUGXIdRRAtalxama5Nenm4Snb9sqWjtfAnnqVMnQpnmxbhEo3h+hrod8p0Px2VBEf3JSKetrWc5D13LsA+X4bW5pkF3ZMKqgGIbqpUGCDStXKuZmB5uKIqxq9EvL/g3vsnQq51RCsq80QW56hHhLXLuhGTMpr7bjIu0sjY20JvzvkHvin+ho61NYuqxLIHupHweq0o879zuQ/HoGUwkc6BlpCKkx2wMPZSmLev5o5aexDTxdSZaD9AmzWfPkA3cMWuEaR33oQHIy4+xMw9Udqyd+StoZh5xEBZg0JalIuFxZtAaYdwZTsGFBMpEhe+9qxTrTae6pB3q0fdpqF2a0zIUu26t6dZh5TXDw4UjAq6CqZFlqXQA1Ez25Z4Ys0IiaDboOuf/H6i+dOwpv3kItvuxs5P4+EeT2pPT68XU3uSiWYqhtHjkrVF+ykQRlqlSmFuib36oe04sv/xca+KhJLBIVm3eZTI60+Hxbnvt/6vxZrgraMz6KRXjqiVuIvAbyWum4ZJkiUmMsoEG+7C+W6nmyo+tPvI6tWXzMvuz1Tzz9bqn55lC70nc7EiERUOoFnU3VXvYJmt8BrWXZwjRPcy8JOcwdAN5borl9PWpZuM5+tOFsGb2TEWw8mRuE1vnhEAT5U0kP2MdwvZ5fmx/nmBFAVuD6NJlWXmiLxWQoe3t8EHnpLL8kCK/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(19092799006)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OGYGqVZVAJkXPY8CG2Ikbmd6qI5Rt0MSnn1ii/s1Bf9fb2NNaNQNe/waTscC?=
 =?us-ascii?Q?wv3CwZslXQzIGXN98TUngw+T1sjVBOKQ1nU2dj/cQFeTCgh7BSAd2bVyoLlE?=
 =?us-ascii?Q?ONe6m4PpiTz8elGzZ7xC1sfxzb/bzY7MzzjRdYKrTyLyFmyEks0E4irbZcaT?=
 =?us-ascii?Q?K57CB9ftKnmi/u8+x80z661ZshBeFett4ARRzX5L7YKM8ZI/aWDTKeA+558m?=
 =?us-ascii?Q?BS78i4BPJCueWpWIZZgc+jSNV5DAQApU5MOi079pfvP+lCtxsBHFEycaAhwY?=
 =?us-ascii?Q?xGxKHCOr2E2iD5i1ALxKhrTawiKm9SQrdjOxpmguecEO/gkjQSUw3MW1aWaQ?=
 =?us-ascii?Q?DYdZ+8u7TvqwAGuZNB6O5Z5xuSpF11ZsM2pX3KTHNHWyARAYFSqy1jkxDcnl?=
 =?us-ascii?Q?a/BFZXuXQLd+46Yaev2FemBfPMmaEg5OZpMCzUnd9EyUKmWUejhvQ9p4e/VU?=
 =?us-ascii?Q?2ndJ9gHNYBoB9eUMSxDnh2BOexECT2MqIF2AvFwCTb9g3amGlA+leUrwXp63?=
 =?us-ascii?Q?ZTBcTdmSiIaUvZ7GwmKeAff7FHHh6kbMn8BZ6mjn3DEEh+hiohhMOk0PbDf8?=
 =?us-ascii?Q?ur7PBESFlwSypiC1GTuoPlr25EC0texpiTEq4wESF/aG4Q0hl9xQQ0pKJ1kl?=
 =?us-ascii?Q?1FlfbJLU4W4Y6bPb804K2+UQJ/KIulK66b+8kpm/aLRLXQQFCDaGbNy7K3+9?=
 =?us-ascii?Q?0Gsv6y1K9T9znZiHmbqGxsyyowVcu0XIUBkiA/B9ahUrhjN2rWBQ0bODxCjw?=
 =?us-ascii?Q?i+eE9WO0ZKfRmf3VwLmvQLa79XTzqc1sBYpW0DpNZtn9CJqg3noz8Z2GeLny?=
 =?us-ascii?Q?LDzUPh4RxfxIrFDAxx2TiZ7DF38mWmgJqf09X6Cg1+EznK41jGwvSD/Kye7f?=
 =?us-ascii?Q?JFIGuwRa2/mwCRjTqVMyZLxv4+f/aeRKE5Xj+nZ+cBlboRbCE9CutAOjG/9k?=
 =?us-ascii?Q?pQGnCwfgfO9oZP5gSBSBVpyPPXrxapoKW8y0ydqwx7YYcaVvW7vbhvFb/bUG?=
 =?us-ascii?Q?8RNhx33PdacpuCBrxxLd4j3kO44FQwYyYpPtAIaULLjq3fS4w50BYrbrpHc3?=
 =?us-ascii?Q?Ue6I0yAbr+awKjQ3KFjDqgYGI7Rn42RFfwPvHVNR51VbYf+4g8N58At+3zuX?=
 =?us-ascii?Q?eDeDKJdj/Ti5lYJrwGQKIApF/vcyb+VvCeO54cMiMorFyc+gqjMTEzAewvf9?=
 =?us-ascii?Q?DNQ+pODcEPFNhVmJ0UW30OVbdjH+nIPgN0v2wzgtFTmDy5WRh/j9si1uyzsR?=
 =?us-ascii?Q?o0lSqAAlA3OZSKi5NlvjoW8sCOh75ROMyHFgTp2lF5vyKJH3WNpNz0Yd9gyj?=
 =?us-ascii?Q?aheEPROdevdpdGKPxChTVNE3WvHRhpSQq5NKsdHOEf3ftHhQ/jgkBtiQFR7A?=
 =?us-ascii?Q?nYx5GpaRfKJDrGeFetKwkRKq0LXuzReBbP55STLM5/VpalzaJ4ZzavqZiY3Z?=
 =?us-ascii?Q?EGoCP8aZpKEDXpfQpzgIiIdP9vO+sXeK5k9779RhlrkZb2gcGgAUVcudSLVC?=
 =?us-ascii?Q?EruB2/uOUslNJR4v9bJy8hcoNs3EZo8ownb/r9qNUni0o1/Y1ZJFGwY8eeQb?=
 =?us-ascii?Q?xwxSqimiZOtWAjEO1O28TX5LFeSRrnyo4ae1Rkk78ALUAIaP6TpZl7uMyNug?=
 =?us-ascii?Q?1FLpxT1ZnYmKnv3Kz4KHLfPXrI2hLmwg63QXgBdQQ9j19Q8GoMmrWwt+AYx7?=
 =?us-ascii?Q?FF1ftRPu23ZYVqhsijWY/Tz4n0zMI/8sYULE54h4+5QGkm3rNXIJg036FHgG?=
 =?us-ascii?Q?Sxol8UgA8Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d668875-f795-4df7-a1b6-08de765fdc06
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 00:25:22.2450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8YSVqlCEhp0kpA4mwd/i6xiLqtQ8C3qoy5iovslM39+PGAI2/kxYCVdOh7re+6/wI9kV59P6KDJU9G/QprKKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11218
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
	TAGGED_FROM(0.00)[bounces-28588-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: C84281BF696
X-Rspamd-Action: no action

Hi Cristian,

On Fri, Feb 27, 2026 at 03:32:15PM +0000, Cristian Marussi wrote:
>Add a clock operation to help determining the effective rate, closest to
>the required one, that a specific clock can support.
>
>Calculation is currently performed kernel side and the logic is taken
>directly from the SCMI Clock driver: embedding the determinate rate logic
>in the protocol layer enables semplifications in the SCMI Clock protocol
>interface and  will more easily accommodate further evolutions where such
>determine_rate logic into is optionally delegated to the platform SCMI
>server.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
>Spoiler alert next SCMI spec will most probably include a new
>CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
>so this clock proto_ops will be needed anyway sooner or later

Is there any early reviewing version available?

Thanks,
Peng

>---
> drivers/firmware/arm_scmi/clock.c | 42 +++++++++++++++++++++++++++++++
> include/linux/scmi_protocol.h     |  6 +++++
> 2 files changed, 48 insertions(+)
>
>diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
>index ab36871650a1..54e8b59c3941 100644
>--- a/drivers/firmware/arm_scmi/clock.c
>+++ b/drivers/firmware/arm_scmi/clock.c
>@@ -8,6 +8,7 @@
> #include <linux/module.h>
> #include <linux/limits.h>
> #include <linux/sort.h>
>+#include <asm/div64.h>
> 
> #include "protocols.h"
> #include "notify.h"
>@@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
> 	return ret;
> }
> 
>+static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
>+				     u32 clk_id, unsigned long *rate)
>+{
>+	u64 fmin, fmax, ftmp;
>+	struct scmi_clock_info *clk;
>+	struct clock_info *ci = ph->get_priv(ph);
>+
>+	if (!rate)
>+		return -EINVAL;
>+
>+	clk = scmi_clock_domain_lookup(ci, clk_id);
>+	if (IS_ERR(clk))
>+		return PTR_ERR(clk);
>+
>+	/*
>+	 * If we can't figure out what rate it will be, so just return the
>+	 * rate back to the caller.
>+	 */
>+	if (clk->rate_discrete)
>+		return 0;
>+
>+	fmin = clk->range.min_rate;
>+	fmax = clk->range.max_rate;
>+	if (*rate <= fmin) {
>+		*rate = fmin;
>+		return 0;
>+	} else if (*rate >= fmax) {
>+		*rate = fmax;
>+		return 0;
>+	}
>+
>+	ftmp = *rate - fmin;
>+	ftmp += clk->range.step_size - 1; /* to round up */
>+	do_div(ftmp, clk->range.step_size);
>+
>+	*rate = ftmp * clk->range.step_size + fmin;
>+
>+	return 0;
>+}
>+
> static int
> scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
> 		      enum clk_state state,
>@@ -936,6 +977,7 @@ static const struct scmi_clk_proto_ops clk_proto_ops = {
> 	.info_get = scmi_clock_info_get,
> 	.rate_get = scmi_clock_rate_get,
> 	.rate_set = scmi_clock_rate_set,
>+	.determine_rate = scmi_clock_determine_rate,
> 	.enable = scmi_clock_enable,
> 	.disable = scmi_clock_disable,
> 	.state_get = scmi_clock_state_get,
>diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
>index aafaac1496b0..28579c145045 100644
>--- a/include/linux/scmi_protocol.h
>+++ b/include/linux/scmi_protocol.h
>@@ -91,6 +91,10 @@ enum scmi_clock_oem_config {
>  * @info_get: get the information of the specified clock
>  * @rate_get: request the current clock rate of a clock
>  * @rate_set: set the clock rate of a clock
>+ * @determine_rate: determine the effective rate that can be supported by a
>+ *		    clock calculating the closest allowed rate.
>+ *		    Note that @rate is an input/output parameter used both to
>+ *		    describe the requested rate and report the closest match
>  * @enable: enables the specified clock
>  * @disable: disables the specified clock
>  * @state_get: get the status of the specified clock
>@@ -108,6 +112,8 @@ struct scmi_clk_proto_ops {
> 			u64 *rate);
> 	int (*rate_set)(const struct scmi_protocol_handle *ph, u32 clk_id,
> 			u64 rate);
>+	int (*determine_rate)(const struct scmi_protocol_handle *ph, u32 clk_id,
>+			      unsigned long *rate);
> 	int (*enable)(const struct scmi_protocol_handle *ph, u32 clk_id,
> 		      bool atomic);
> 	int (*disable)(const struct scmi_protocol_handle *ph, u32 clk_id,
>-- 
>2.53.0
>

