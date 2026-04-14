Return-Path: <linux-renesas-soc+bounces-31254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGkrEvGK3Wm4fQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 02:31:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C6A3F483D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 02:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EFFC301953E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 00:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5A31F3BA4;
	Tue, 14 Apr 2026 00:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cZQHJsum"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE91D5CC6;
	Tue, 14 Apr 2026 00:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776126524; cv=fail; b=ZTt4YcJKBtYBhzJZC9fRueJscocT3PZJer/MXJFpBoaEJmzAkm8wYXNG8BTrhu+tpmQjUswgJQbk6FTun3v8LOfMuHDk9l9W3yvnFhb30ZfPGXkI9Fz0DL0JDmseWYSkrtUJZIL5S/po3mFThD/916HcNd4eO82USlmTyJ5jm2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776126524; c=relaxed/simple;
	bh=7gJSMcnGP/o6bareTM3kgRtKUw4L8RyHU9DDQ3LaG+8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=F0c++P4uPlI77p7G5PGnzgbkWF6EgOdu1Hpxv6eFw6OEL6VIe6ZHhB2S9na19/rTBV2eZtm8mjvUzLZ2RdZNjZhoD+Qpw/BV3/NuqPmwTANLoxQNMF1bSSjdVzEzzg6Gbae/K7GrGJfAJ0r2sXP64amPRb+bBpzTphMx2H/IN6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cZQHJsum; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uiy3k71UjcPXy4tmDOgEetiQNKnItfUtYcGKEN1LIRt5XytWC8nonBpnvwjoveaKv/r5A3CB0uIhHkB8Vx/LVpoX1b1uh2qriTWK7Fci0IE8wJ+ChNQ7QWWpd+POCPa2yO2uATUexrOwPrDTlLQeDuTRPnPXPubYzLXWeIrbVJd0W3uMjvL6QvYgnrZvul4TrmuvgO27A6ohy8uM28lDKI1TQ/fP+3vxLrbDkek10H6UbCstGBKWCia6DZOUu4d8xjWJgcJicwBbtbkTiMOX5VOZc6wLJBbislvAIxYyB6USoOLwARuqFtizk+Z/tGlfbEbZx0vLfYUR/2IGkctdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTE3vto55m9r7JZTVLNfacm35QcG7z+nw0T5AGzfQo8=;
 b=Xo/lXJ6NLua7L5HopwMMl/S+7KJhBpCuVSQiZ6qb8TvM/QA8t6MjfusSSc+qCAiBZ0mO0ejQNjlM4XQt3Kcul44lRDC8lZysaPBHEyrcPXr4KN5pRTN5OxQUmSS/OeeLxU6BfqVUJ5E+csy1PJM/rms8x4wkBfDoj4ssoIQgYopHJAF+qG0i6sDgVCEET4gAK1El3EFmuXxUfVB0kXXqmvZy7K6efRRCkQ7TxAToY3KxceRPNJtO/l+V3Qa6kmu9bliRVm2e4MKXV7OyciwhYivY0rCtmNXT06rqwc9CeFBvwHt0FPov3sQfgWzYwxcaLJjI4FXRxBzgA2Iw4FJ9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTE3vto55m9r7JZTVLNfacm35QcG7z+nw0T5AGzfQo8=;
 b=cZQHJsumcBd2lng2jEIZBQg0ac3azAU+IkLSOmQvSX+ptr4i/vSlSbczekzhGihMebRSwRr+vLyt3NZH1pWpe6mzDD9qZasS9wAZj2WjrmS+oK9EKKc6BBYjICHmKVaSBdKtnbvvCHT6wm3LXQEfMtIut0qbsPpc89Oytt1ZBd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB16845.jpnprd01.prod.outlook.com (2603:1096:405:339::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 00:28:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.044; Tue, 14 Apr 2026
 00:28:39 +0000
Message-ID: <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
In-Reply-To: <20260413100700.30995-4-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
	<20260413100700.30995-4-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Apr 2026 00:28:39 +0000
X-ClientProxiedBy: TYCP286CA0163.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB16845:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c70a5c-f975-4ab0-7be1-08de99bcc65c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OvDtE9JfUKUsAv00Xo0pnCvZS5KUSG98poX8HpC80s6TYgn6n7K7EyBhHjeB4joaQBprzwHYcZgylHiRfd+dUTWdIVUhizaRUWMujEr9lw+EM1MX8pbgXQNFGYLjb4kozsaN7LUuy7Edla7sayHB/7BfB0t0dwk5ldXdPx/g8vZx8qKkdIQ0m0bjWfZ0akjkJloD9UkxT8tO3Z+pSbl9Mz41TWTEbM+GHcsb30mB5uo4CZavK9gP6wdx5nox0V6Hg7n2xeGfQVUx3FsDEsOt45eNKLZ/pLThsDu27y4kbkYa8NlnhWRrqq7NyFUx5Blj66oMzJmXZUBBIy1DalU+biYfvdnsK8443NayK/GrwGLfeKUVlZTL2V6O411ib8esGiFIOqipzlRPVLHSsoOyNZS3oDqhScq1/2IQx5Ou3j6KRDBBrScIVcYUUDeC2oxJNeFD2iqu/MgkkWu6OjI83KDxOQSkVssMe0xkRgfbApFfeWapF68GswLnJfQM7cuMfhdPMXXif2XJYsRQDrIpgcxIzPE0FFKNi6R3iNcPnBj3VTXW6qMOYbtvzPaw6RBAdrKjYCiyaITx7zgT/FG2gxv2F9Ni/ozAJmUoYzrEnzTm5EkiuBUrRIRAkMzMahzCP0/7QVNoBbY7ZMTDIZHzeFU0OMGeu4yK37p18jee/3zPrDWfUrhYgxk2YXSNtY/RxjKusd4CgXOVp7NwhnoIextNpsROPjCjSMgDNOmVmqwRPbvqyq8UOTkIRXEi4Y340HmSPFmnFmxinyzIglY4DErTBS3N9spC8jBDk/4lbn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sQJ20iAIksNHVaRsrGgUZb89/4G3SDKilHIo4ZIRWS4txenlZ1WqYR/16Q+E?=
 =?us-ascii?Q?zuuTCM7kIfF20FXvGj9WXlA6SZzw/iB+SOyKfxOB58Vu+r4htuVFz8wWVmGI?=
 =?us-ascii?Q?iJpiOYJYoQRlUtIESy7IzSMLpLMgJlBUjQIuXmisQfI5tcrjpMFGDGZG/Aea?=
 =?us-ascii?Q?rSaUqOjfpWoRYOKkOy8CUKIGW93GfiHMLE/r7ZTU3BBQ9sP09S4DLnN+CjcI?=
 =?us-ascii?Q?mphQBT3eb/BnuupkEns37UMq6f0EruMKdqDaQjOcEU0vvv63528gF7BPPBeg?=
 =?us-ascii?Q?4EwPv07365CwOIb+LwzJ0tijyh861UVUMW1DOhcs8AlddHFrWOggn/q2+yDY?=
 =?us-ascii?Q?ujNsxKap3aeVyEHw13mPZN4g7E5iY0fEcR7yLISJD4mBwGk6xlky1vZCO/Z4?=
 =?us-ascii?Q?Hwc5MTmklz/ogbMZOIvW1Mq1esq+/hgPWbP/TNgWsJ56LMcD3DAEGjsAU+H1?=
 =?us-ascii?Q?38B1z6vwPfB5wDzISnR4G4wNTf1/5m1/VXtaTIbAzse1jqcxqRSIdWhOSg0O?=
 =?us-ascii?Q?FBAlkVHJ+pbFdHUuYIn9MjHzfqTH8q3BXDj4z1tZ+3CMWrZye5YvJy57WUNx?=
 =?us-ascii?Q?vzSS8jhE7z+RnlJVbF6hzGcT7FO3zLjfdTNtbU82FN2zlTKIKyCcxZyqHBts?=
 =?us-ascii?Q?IWMFEjbKcm2gOeuL1E6eac74xeyvoo9gqDdntZGAifAB+O66MGvu6jR4eXJ8?=
 =?us-ascii?Q?Ro/hbyT9ZHqoHP8p4Tvsqxa2VsxocEGsICjrysQrW2qAKQryi4FZefhizaF7?=
 =?us-ascii?Q?c7bHvulfvCEKLlRDRC6raUhzkVBhhlp6EFd7dAn125nPdrrGkA9tR+RDsdfY?=
 =?us-ascii?Q?O8cKtAN1z1LYiYHq/nQ26r+djsju6ByxaQ3m31QDYNBD5hT9qY+y0ynkizzL?=
 =?us-ascii?Q?63Vuk6ve73s6TsfEWCHyyP4dqxhS8HS4o82fSpSdklT+pgXv7edZkAeTDuO4?=
 =?us-ascii?Q?/QZOlXGv7qbOBEdgir8GOLkqc3y58DNQx5Oqin7Kp9oKVfQIyD9E9hZJnXvJ?=
 =?us-ascii?Q?WCOjKeHCbbn0hUA8hXVPVtVROcgsQJqmhMz0XkJguUwuwPFDxwtmo7uesFyv?=
 =?us-ascii?Q?u15Cny+IzOabmrj31Iqoh1UZJ4FIlPQEi/rx5g6rD+LQ/XjJ0ka86YOhFXcU?=
 =?us-ascii?Q?nKu9uRrn03XRpsaDSH5M6hnS3VO72xCAORhQ/sWG3C+l48nHifQI7Bi+09Qu?=
 =?us-ascii?Q?PLYf0J4s89vCJPUI1XVdNPLNEfVv5yvs/xxhOFscc/ZxQSRH37O+LKix35jM?=
 =?us-ascii?Q?gU+CyGi/fib1p8/fPBXDrpdUsyFp7nhyTkf9CTBIlZR2Y4JxK8OVsZIkQCRG?=
 =?us-ascii?Q?7z7KNu9a0HY4P++QB6zW0IK5PkDobfvJ0IKzF/+yh3SEVRxPh0Ruv87nj+Qk?=
 =?us-ascii?Q?+R4+bsIeLJyLdYMzIvddsNa1mrXP3C+esls+J/J5A2J/doH4aZ2tL6zlyZfH?=
 =?us-ascii?Q?e6cUgE0lzaHl/06IlisWDJxPHFhUiSSpRPB4UkJX2se0EYWrSHCkjsRT4/Es?=
 =?us-ascii?Q?CiowxSi7t45uDp9+P+oeum5acHDLUK6sXgam1e67YWZx8x9NBkxH3s6Et/F0?=
 =?us-ascii?Q?VfZQpuNvK9Y0UKr2fiJtEaOWgLgMwMkO3ssDJKDEk5UHt1NoU8wdQiPhGpBH?=
 =?us-ascii?Q?+rM5Be0CM/TsZZ/Vi5o3+4OkMrXE4nxWK/OmRZ7dF6WfsoO8o4E7AQZMN4uW?=
 =?us-ascii?Q?rwpQXmuTfymrmICjSwAuurmR/xS9Cv9iQ5v3mOxZR/6rjt03/x2GRLPQSbWd?=
 =?us-ascii?Q?8+wciyIjJVGFeUcgI7waN6zZBUHDV5lDubx26FFbwLTepnELoR7C?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c70a5c-f975-4ab0-7be1-08de99bcc65c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 00:28:39.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNj0+oP181r4NAghsnbq9HJD3jepr4r/ZocnZ+l1zqZSE6RssfXk35cQBLxnTUB4kzsfb9EoW44NzZkxdsrRn0Q/9m9gc4rhNHrdeA2uac6nOzFFMSQ/hGcpAbaYb2P8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16845
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31254-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: A2C6A3F483D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi

> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Reorder calls to execute fsi_stream_stop() before fsi_hw_shutdown().
> This ensures that all register accesses are completed before the clock is
> disabled, preventing the system hang observed on r8a7740.
> 
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

This patch should appearing much earlier.

>  sound/soc/renesas/fsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 109e06b5f32d..9df3e91ac79c 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1606,9 +1606,9 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>  			ret = fsi_stream_transfer(io);
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
> +		fsi_stream_stop(fsi, io);
>  		if (!ret)
>  			ret = fsi_hw_shutdown(fsi, dai->dev);
> -		fsi_stream_stop(fsi, io);
>  		fsi_stream_quit(fsi, io);
>  		break;
>  	}
> -- 
> 2.43.0
> 

