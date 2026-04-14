Return-Path: <linux-renesas-soc+bounces-31255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFktAJqP3WnIfgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 02:51:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 083DC3F4A4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 02:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 930563007280
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 00:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF8D23C4F2;
	Tue, 14 Apr 2026 00:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PNEOeuhQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C96E1EB5E3;
	Tue, 14 Apr 2026 00:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776127891; cv=fail; b=ZcyZM1k0dmQ6bUWHIiisebXLjy5Z99eiGFUUd3dvZKE/62zFs3OZZtQa69bGwpZWy2aUt6OMHlYaPcWQqPh0XU7E4qtoegC5BZUlsik3ONFiO/TycF6gBV9fuOwOWPWykybkkTOzzd04ftXIbYSjwtvghyADHI21+mQsqXNDfsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776127891; c=relaxed/simple;
	bh=wGzyQ9T7K+aufyLbxvjdMqZwdXy2fP+oCqnBdwssKv4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OR8Co63/dFHWhmDZICCkSHx7SgDFOI6kzzFkK1yRpbUnEQb8KKh+n6MpL11cCx6V2DiIjv7yiAvAM5ed9OqACkpgh5NZrkzs4imNwjLd5GLKqswK7Pta3MlyJ4DSpYETRMf59Qpv6s8UxtUZp8180Lwia2cfYHwOOkjlyRPEsRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PNEOeuhQ; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ip6iVtU4UZU3nsXxsCuNh+e+ESUjvAlOLpef+cdNIEE6M6Yxusi87o8U8wwKPkqcSe1WOHkLfpbDS3y2jqbUNUkAfMNbrxURh4e1xMl3QX2nJp28+tB0NPhNy90PJJB21S+xQEvT+h9b7GGYBZqV0IwV4yUr/+r/kuDfEa24mK0jidStnFBDsrU3XAuZ4pYbGnOH//HredBmAAo+WJ/ecySfflzQkq8U7jf+x0WGqmxDGbN17iA3Jgt6CB+gKHvG47IXFsBsHfDUWZ0hPrurYaHCil32N3YCDXlxJT90eKvyVa8ovdnX3hffy0IuDYGRFJfGsgefWA8LJ6mwZe33pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XWZg+Bt+zzznVMqUe8GuFdAJLQlWW+HVdxvCEzrc/Q=;
 b=pbsWutTxLhd3VfB8OuRZFf7/904K+uf38RL6AMvRfx1fZiDrEMkqHi06cQg8zrFTJBbeYb6lNILSa/JK6JJSzpKd2EVAaPb5COqeSi06EoLlppzNSRYKA34m9w4C/qyy9uOopEqMNbaYLP2RY/ULfJv2NQV2WZfP4l0bGAYqxDOnqbLQ9SKekdtAZDzyqzzShGWgXFpfc/E1X2wS7tDrA4zyJbkEDf4QUpNBiTFrt9zW7c6PHTtZorYDptedD+XZL1VYb/KSyfSDVYdoBXBL9Rsbj/kdPSMhsogHH+20WOVcgneDHFNkcCDYbgmyVd/Q00iKPkva1fWHadcfgM6jfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XWZg+Bt+zzznVMqUe8GuFdAJLQlWW+HVdxvCEzrc/Q=;
 b=PNEOeuhQPYs2jZdu68fXCDBjoXpDR2pKn36J1kWOPGodWdtR1HeaLDTb9vSrtZkZ0d/wgWqJqlxO52XHVfmgQi9/u+Cflk6ww0QtqALOW5DI06bIzLDBcU5dltsu591dHAgSqmq3Tm9HZYBKc8hRL4hSEzd6yJnhEWTIev7dbOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15460.jpnprd01.prod.outlook.com (2603:1096:604:3c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 00:51:24 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.044; Tue, 14 Apr 2026
 00:51:24 +0000
Message-ID: <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v2 4/6] ASoC: renesas: fsi: refactor clock initialization
In-Reply-To: <20260413100700.30995-5-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
	<20260413100700.30995-5-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Apr 2026 00:51:23 +0000
X-ClientProxiedBy: OS7PR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:604:257::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15460:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a83185a-9b73-4b65-84f9-08de99bff3af
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PCjV16wQI4PFh4AeOfYiS2GfJPvRteQkVIpudQAuS1NruSd8fYQLzcpLzgy6CVrfiwixvY55A9u7qnPAn0XGXB1wfq2ygjAOYGX6AGBsuaFmCttG6atz7KkKgW0Spmzc20n7dIM2FygOvZ6e7X7J8iEdFY1izNGUeEMRFQ9MbCT1V2zn8A9bYQxcFok7GtvZSpBrbNeIeYqEnbbRktpQ9LSnenhL8WWqD6KDciMMsnenLqBZTGRN/Q68ld4bmr8ax413agN0CihYiog3Ld9rqEJRKj40urhoKaKVVbpURCux3gFDa5/jH64EiZ8li6h61VKLUIa7Xedx86O7aMyh9sdB2JEU8xYqhvjmWuq1j0daqc8zL0B/o3G/saH21nmDi1vYYkydJ67d66SfLijF4OrgFqkYuRkrpU2TlGiWGKtt+aLZcm9Vt9IwygBjbu4YsXmQGnJmumcqCM3C52ZnlqreY9jNjOweGp5bTljjf6QVVco9pRfZ2RjywlOykyquIsBi/06mvam6zQfmjYB237eoHkWRHXiDOgNvfd0ioIcRpBVOeOJw8U236M4m3zqV4B4mCI38sTEZXA3LMUQlWAHkxgyEIRDdZkRBsLhXJFcewZhQMhvXpwJHMBrUz36RktCDkznyj9azFBDTwFQurrHsR/EMDhEeYfXnan9Gz1yrYtWzP94DRNrPREir3g6/3gbOioFcH1P7o9fJ1/nhLU3teculjhSvh0kbWrOrRwnJlsTUpQGZVw9YPs9cyfTWTnXnH36P7juuwai6wGM5dbVdUg8nUerzmX8sWSQLnuA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?txwdYIgpJvnzU3pggGB37yRvQKKCZfqaZJE9skruZOVUoLxObh1S4uQu70/U?=
 =?us-ascii?Q?3Jpuojsl3to7M5V05ItD5vZIwXZ6A2t4qa7Nwl+lSnA2yqfg+d9VkDI1UFP6?=
 =?us-ascii?Q?Kg5Q1Zvk5NgSkYjtdu0RLFmWwwta5iY1N1fquy5haAnXf/mkvCwxuHMhZWMM?=
 =?us-ascii?Q?Kc0VcpzIp+wG3HzPOvaUoJAIPyffdhLTm1mmHf1nNim51BWHTpzJ8r9cpq8d?=
 =?us-ascii?Q?0VGbqw1d31jQgTLJCXePbd5wXTtqJezHQUgIzNpDXtUCbRju6RsIsiISJRMZ?=
 =?us-ascii?Q?prxeO8k7TW4gsnglB/XN2rubUF7KSR9uWmCkhjr4FfyiO1uvS8E2DMR1ba58?=
 =?us-ascii?Q?NHifSizn2WFLtiIMWk5BwKbQcgBeozQ5UV8WoQFlQSl0eZuWpKZ9ksIpDdyq?=
 =?us-ascii?Q?UP9ifGEBT7KYlkkSSbLgwTYsB1nSXv1R9olf2YvbTc7sElV8GWXOUXJ0YV3Y?=
 =?us-ascii?Q?JBn1Nl8pfn4XPquofz2TWANd1wyu9nMqFslM4/bUpUuswpJkV56mIpZLlibn?=
 =?us-ascii?Q?zumOrZYcfHXtUYdEPl4UeI0h2uwXH2mhS13lFrZG9faFyT+BskeeKZA+EI5u?=
 =?us-ascii?Q?JVOzbE65QOOgnEKWCZqWbR7KuYdcEcsYIVPpYS6SeL4bbK6nY/nyUWjms0H6?=
 =?us-ascii?Q?+/U+XgZdezhP6i6CBCtJyOQBh7xNlYjkgjQUSDAA5uDuALJwkiUxMqkMF+EO?=
 =?us-ascii?Q?Oubc2rsDNIMCJUKI/t/p/88oWkqFeOHVzIFbu0xw01suX6naLl6JyIEdRoJS?=
 =?us-ascii?Q?Bxgz+qp/OW5jBrcCnHAWPBGVzi2Hj2WqKDMwiGzxG86zHKMawTvvjCctYbqx?=
 =?us-ascii?Q?8oYubpNqvUbv/eOwqcJ8wvqiWD0nF5WnmG0MmxfUyX40uxj+dWNQtki0+J04?=
 =?us-ascii?Q?ea5vsaLYwwdXS7sGcxsa2XiBpw8nuTa0OqDhDQsTBq1LxEuVtM2pbONtPXn5?=
 =?us-ascii?Q?Rob9bsDSmFSyDeYg2zipdcKQATHEti62evTJ5iHhUc1vHAAHRTqhkKGJ7Dd1?=
 =?us-ascii?Q?IxuSucQXUiJfJdDQoaWnGEAq2bF6b7pFGaI6UVj9nU8XuXNYJDau1phhKTU0?=
 =?us-ascii?Q?6Svbt/m/w1cE+uNH8UwfagTe06GbD3kt1BpXF6L48Q6LGpjUNxGGpq3sv8jN?=
 =?us-ascii?Q?S382E1/gg20jPamHbj+A0YSFfP+7p3eddk4SYKlyuyl+ypyQtrPxr3+K9WJr?=
 =?us-ascii?Q?rpCrLsg1rssS3xdUyDmaQKN5O8LiBnaoa5STXX1PSUyVGfrY2RpfRx7RRZ/c?=
 =?us-ascii?Q?XzfDZ/vD2YLQWY+zhbkDdZYWiiFBviMHsiksVYlXU+083H/pGa27kc04eabB?=
 =?us-ascii?Q?MX6GD+vmyrCmoP4L/8g4CkThraRuKn4P+EVPFCN4Au8LylgDwKQZkbW6sYLp?=
 =?us-ascii?Q?yddNM0SIzuUG9zNrz0B04UgxKDs4zy1E2dvx31LgBUSY9RA3OHA+ZOdoC+Sf?=
 =?us-ascii?Q?PRJ2OSad2bH5H4yqz3d0VJtiKWnaM1jPuwRS051yMHpLJydq0MEJfMY8VDj+?=
 =?us-ascii?Q?jL8z+260aZOA0Xac1eKJNWyKXWONENt2VEImz4EhGncAoM5nVHDwcqZ79HBN?=
 =?us-ascii?Q?TtQZ7EkCUCpJqfoR/O4sQJHZ9Hvs/ZRI2uBrhcNeMHYZzG5c8aqk1oWDRcuv?=
 =?us-ascii?Q?u8UwI3O488KesjOAIhG88te+5s/4VB8FIA4XYaSdfy6jfrdMlN4TqiRKG4s/?=
 =?us-ascii?Q?n648MUnSbsgKMlA8Hw5zrFKE/3He5wmTNKRZn7KQXZhBiozlAOLiVSz2JiDg?=
 =?us-ascii?Q?enXm6TkX9zfW+X9Qyc/KW520GSmGYWiWwWc+VhuGo98xPE++RK30?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a83185a-9b73-4b65-84f9-08de99bff3af
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 00:51:24.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLHNrlb0Frr0rPM/uGd+aTBG2w2WwHMRjBwFItC99cCtNfBoGRnpIo6cfVZG6lBZnPoooND8Wqbtc5VuPiL7e8Wfw4KdVfsb04DHidCOpUVjkRmvhtydugZY7TDegqt8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15460
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31255-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 083DC3F4A4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi

> Move fsi_clk_init() out of set_fmt() and handle clock master logic
> internally. This simplifies the flow and aligns with probe-time
> initialization.
> 
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
(snip)
> -/*
> - *		clock function
> - */
> -static int fsi_clk_init(struct device *dev,
> -			struct fsi_priv *fsi,
> -			int xck,
> -			int ick,
> -			int div,
> -			int (*set_rate)(struct device *dev,
> -					struct fsi_priv *fsi))

I have mentioned in previous mail to just move fsi_clk_init(), but why do
you need to move it ? It works without any issue without moving function,
I guess ?
This patch 1) moves fsi_clk_init() 2) and update it. So there are too many
diffs. Difficult to review.

Note is that the comment /* clock function */ is not only for fsi_clk_init()
but for all fsi_clk_xxx() functions. Here is that position.


> @@ -1684,15 +1696,6 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  		break;
>  	}
>  
> -	if (fsi_is_clk_master(fsi)) {
> -		if (fsi->clk_cpg)
> -			fsi_clk_init(dai->dev, fsi, 0, 1, 1,
> -				     fsi_clk_set_rate_cpg);
> -		else
> -			fsi_clk_init(dai->dev, fsi, 1, 1, 0,
> -				     fsi_clk_set_rate_external);
> -	}

You removes fsi_is_clk_master() check in new fsi_clk_init() ?

> @@ -1992,6 +1995,7 @@ static int fsi_probe(struct platform_device *pdev)
>  	fsi->master	= master;
>  	fsi_port_info_init(fsi, &info.port_a);
>  	fsi_handler_init(fsi, &info.port_a);
> +	fsi_clk_init(&pdev->dev, fsi, !!(info.port_a.flags & SH_FSI_CLK_CPG));
>  	ret = fsi_stream_probe(fsi, &pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "FSIA stream probe failed\n");
> @@ -2005,6 +2009,7 @@ static int fsi_probe(struct platform_device *pdev)
>  	fsi->master	= master;
>  	fsi_port_info_init(fsi, &info.port_b);
>  	fsi_handler_init(fsi, &info.port_b);
> +	fsi_clk_init(&pdev->dev, fsi, !!(info.port_b.flags & SH_FSI_CLK_CPG));
>  	ret = fsi_stream_probe(fsi, &pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "FSIB stream probe failed\n");

Why don't use fsi->clk_cpg ? And why you need to call fsi_clk_init() twice ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

