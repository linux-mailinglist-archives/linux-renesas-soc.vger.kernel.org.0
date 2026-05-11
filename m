Return-Path: <linux-renesas-soc+bounces-32328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V872N202AWonSAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 03:52:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F9D5070EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 03:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 044F23001FE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 01:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B94239E75;
	Mon, 11 May 2026 01:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LmLjpIK3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F8922A7F0;
	Mon, 11 May 2026 01:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778464362; cv=fail; b=Ng9QPFAH/bpPeEqmFIa3zkMJviHJ/tOYPuCwcPIIqW/pYz1gMwZYjYk86VDEWbije2Rnsz787HnOlK/IjRR+tAxRgaB4yoFKTGzDG6dAnUlZmKc4XYIL/uq8QkKMwB+MeIdfgXLMUEkOXBbR7fTdwlJHnyP70HEeJaN572iXf4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778464362; c=relaxed/simple;
	bh=qcr4iANQ2dWAhS64GAhAeS9YeumQolis2Mt3KQDiQiA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kjqXdJGL2tn5CXqMIthOFlbmLM0GGFsjOFCFyyWke0vgi0QUolv85fJC3oli2GpmHiyaUJ8nFZLwd3fiCnuNcnTaP8vPy/TmBBN2vjsFIWGE+WKmc0bH05gj/OmEs/vrlOD/p37iSa0+Kz61qghFy+zgwse3xX3oHHMix4iMtTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LmLjpIK3; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAbI+EPaOwyKJOUQipTBlIU3orf+yqpTaPJ6Gp0GB6AB+znTbLBnlG2OO5hIk7OSDnKjZEr9JDHKg9/5MMGECUmfd4B1bOgFsW0/pvKx4euLJXy5PgmK/r8sJ+/0z4qwhfrR8WEVmjqodC2IxoQTughvQKadtz5S87TlctviTx2fhuFJyE70hDSyy41dyl64/WhgylRBv7ODpkcPKVZpg+DFphscJlLpMIArVRV9b8rd/XIyUJWlpcFYqKfq7KsZpXtavElWOBj45kFnrSVBWfL8eMnaRPwSWi/sZcrooe+GdPrarXMEXHBV9UeZdBmwI3VF7lHHAevRNo8r8TYPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ghr5vuV435RDM9boXRBQt4Hbb6iUBBlFq0+v8kqDO/A=;
 b=XFpgCtvS8LuVp80pBEZX/mjDQjzIPRFGSEn5K3orKPTkLZZcHVSutuZfTJ8AkwlAqJ5mmm2s6g3wDOoK3x/PfUrUVdG1Ny02tezo+TtCV+aDx+A54HEXWQNGYnUqwVlpv5yunVTNZLUthl0mWlMbKFNG2lGovNDSFKssWmD06YVTwDOTb3IubN236uYymR+gfIMI66EaR5JUxCZ/tEt4sRgstSa4ZEL3DVSJhx8XMIEiSamD3zZGLJ9p9hjjD/pKxtH4vMseUm854kru6WG3DltRlj+tW+7fzrnVTSSGs+0CAE2qQyVI80288bqEBr1HZ1J5dxUgXUu/Hz0ddediyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ghr5vuV435RDM9boXRBQt4Hbb6iUBBlFq0+v8kqDO/A=;
 b=LmLjpIK3pE3u9a7grNFbZp0TQjZJheed4m7Pp7fwc3VliVc6DjSLqhDr0GugEYs9Mpxdlrsyo+yBFXYl3MKJ4AR2ULA/cf/x0d4QBTOQIVxGqiRC5Jaqy2W9sJEnxVynPgakpbGmqBMk9eZ7ja3XOu5OfMZagw2pD9Sy/shT7II=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB16416.jpnprd01.prod.outlook.com (2603:1096:604:341::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Mon, 11 May
 2026 01:52:37 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 01:52:37 +0000
Message-ID: <87cxz2n257.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH v3 04/10] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
In-Reply-To: <20260510084303.122426-5-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
	<20260510084303.122426-5-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 May 2026 01:52:36 +0000
X-ClientProxiedBy: TY4P286CA0134.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::6) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB16416:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1ecded-330a-4fd1-5b17-08deaefffa0c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|22082099003|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	2ChPTcUeX4UA/aGVZjNr3KD9oXnpB3DZcLIkkGTVjIvJd6thIYOpXKs8ecFysnqHlmEU5ceKCP4/SNYNbKmgZSEZv4HsD9+2WjFpJfmBf68pb7YWl6cq4btiOF15odBbUmIuoXFar/Q1qrhfz81PjDdnMJpZzcqx4igYmZre0Gfn0FTQqEVX6JRlEC6L/yyWCj95CsroTOABKirIqI6EfWZLjZoD5aI0RIlzQi8YMZpBQY73WBouSOVqTLyYCdqEDm65E08yAqfXURBpYSzADLoNnlLfI9a7zSnCq2koqwdle5GIKxbjDUzv4XQidD8otXTNMZUyihwBZtMRD9miiX4bRGWt0c7rBmORuIO2PdJj0enNiC8B8GhWyHCDu4AMd8OuS6TmDPhhFSkfiRbIp6Z35i1x5bSIno74JwoIbpk+tnUq6gyaoPeHTWLkON2k+RTeWpDNb24rt6fH5KzPyJaEwkVA/NlSIVRCDnTH4c0OPu/712I5Bk8gJZwWZKaVDtOq55IIYOKGGilzH/pc1AZg3cKYj9ky/pDcrpHiO58U5GLC9J5DWM2seWgTtACaxLglf16vJZwxGTvZ2NdVb9zt5GHZhl62uwzMm0x2DYKWb1FmebtRdsdoceJ3biXvHxHdKfjNwGSSiFTMqMqpbORPWUYHDElLNzDlZRuPdzOlqM/23M481Ui7RArvNAM4KqAjCI2U0xXDHCAUx+yd4D/COjpkLENCOdxhSVh9axTAVCWuHSqctQ/wEOIutPk+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(22082099003)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wC1Lfy8EGbLPXzyQvrGgVBv7yuMTOtQoTcJWI1TP9oAMzCgspE1Uwp8rnhTG?=
 =?us-ascii?Q?zF64fUPSXgcOD9ggA+xrILxlf801pIJwb31DbhE2agUjcTfVNOMi0AMgEd9V?=
 =?us-ascii?Q?L8fuOXoNYlrvhSCVULfcMbI1UilI9uIhI7UU8A/ru6ik1823mkZqbmpZUGjV?=
 =?us-ascii?Q?LJBht/FYJFdlTJbmEAFacrzEVgxYO1dxeZ/7PyGiC/UQijwYR1FW+BYrmSSQ?=
 =?us-ascii?Q?FLZiro6VLyCDFpnNYOy/P51GnrMo6Vkx0NRh4hJQeLtQPJZAubzwc1wIfi7P?=
 =?us-ascii?Q?eLtDo90+rqqubk/R0NIhNWWEVfgJLWQ443tp0EwBP47gp2d9OEJUx3LwwYqS?=
 =?us-ascii?Q?HrsKs5DbJDve7vmm9jJcZB6ssYBFHHintcO1I/LikwpFpmAczBX6sB2PX0ab?=
 =?us-ascii?Q?+Rva5gT6lzwLYbFACCtZhOYZO7ulocB2Kq4FA4DczdHEcxc4a9B4RUiIUy3R?=
 =?us-ascii?Q?7FAJ8vVUu+aTvYGbQfd9+aUuG2MIIOLlej/FEE75GCnZqqG8B6MpjpsG+7eK?=
 =?us-ascii?Q?/61xUlvh5hVpcls5fnxX0GKneZFFx6ErqimQEZz8ryJcguIROWETOEs3e/Ia?=
 =?us-ascii?Q?gCCcjekAFDTsoz5aS2ExKcSeZ4joZ+nY+eg5MpMp1bmgRrzs36gNE8dLsonr?=
 =?us-ascii?Q?MrQm780sdgLxGAVpiv8oINetxBhedu4FAkSbWWTJ3Xc20ly2vUrEN+zzKOuC?=
 =?us-ascii?Q?L3v0qJulIESVL8iczP80V0Aev1pqGf1kSR1AboF78kEtq4h1pzKS3OZeh3iu?=
 =?us-ascii?Q?FhY18gbbNlcoZk1t6tIakOQhBjBxVqCKckMV1z0DKqV7U4+E0w3CcpTft/Vv?=
 =?us-ascii?Q?3eti9866w6vLSPw9REmwjidbdKuly9S7eP7GAruhfGtyi72A1h2P2iAp0w3A?=
 =?us-ascii?Q?xBPVL3BbsSzZ0AfRGSW0pOBjy7cJTyakdYB8IPkhANGyxaPipljS1YWSEuTR?=
 =?us-ascii?Q?gvGyB/vHprNukYnKFk7I3GqfZ6824M5rrkv/N3Oc1AOGjtnI+vG0FSkjOBZQ?=
 =?us-ascii?Q?TMcEW0iM98sC21zO3JADmSWZYRTTjEo38hj8Hsos9tAalUVNbT7Zy1eoZRtp?=
 =?us-ascii?Q?WMxJaPQukDC8S/7vrbTpVx5Hd+tE6lMVMMay0Yhdt8SkOOSnyYuStZ9feGhd?=
 =?us-ascii?Q?UKd2X8AdFFp5ndk+9E/S5XkIi47MTcT1qHPgnM6RWQOFNxl65n9zC7VGDatX?=
 =?us-ascii?Q?eWm3xEErcwvT92RcY8le8ge/WV+NRC3caZUv+cQ8FnF9SAgRxI1D2P7L06+S?=
 =?us-ascii?Q?4PjNIK92LYkn4CRFC+R3lQhNpQFxbIWDQ1tSmoLhk7XtZgPq5/lUox2oau9f?=
 =?us-ascii?Q?O9ze6rsEcW6dAWKGNEmyK9v1tEARCRoNEO//Zw40byQ0hC5iXDxoftWHAlHs?=
 =?us-ascii?Q?kQREfQ8WPy1Ki4fK3rzLM2awF3vyL68sAXbvAaA1T7RVIHnKzlfioeqH+59y?=
 =?us-ascii?Q?hQtl9bG6tqDE1J49Qvgmvz5KKDZ3yXep2bKmuTWjhCtDi2hL2mRL9W80LDY5?=
 =?us-ascii?Q?AD6jSUAYPDHcgwNoHrUsXu8s/y+AHDG4yrxRVPcFdLFZWSL8efa59y8ifyMK?=
 =?us-ascii?Q?OXua5ucAAGVMg3oDx+5X8bwOmoHTqK8HeWTVOM+aKDNfibSHUxkvtr5eTQzz?=
 =?us-ascii?Q?DjeL1BnKqJq569I+ZWQk/Gk7eiwPJhCXb31jEhF2QIxe+YZAsvIxX8djOBkQ?=
 =?us-ascii?Q?qKGcc6lFAL5/LGeMQcLpvPsqLqrjRmmJ5GfWChqbndCwVYOKzBD47ZjZYyHX?=
 =?us-ascii?Q?b1dAUDmTN8ukIxUd6tt4a9P1sUixVBwpotH0t96PGe9jXfXq60se?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1ecded-330a-4fd1-5b17-08deaefffa0c
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 01:52:36.9949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqSRrZRITeh+iCWsc9XcQAbl5xoRS/9wl9KHSJTJ0gweX5dDSOtDOKi5sxLuAEOjHqpqSfbJZJU4cmZ68rEeMrxb0DVO001BRVbN0ewaFXNqSP3m9Dx2TNWygUpkyV6y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16416
X-Rspamd-Queue-Id: 96F9D5070EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32328-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


Hi

Sorry for my late response. It was long holiday in Japan.

> Ensure that in-flight IRQ handlers do not access hardware registers
> after SNDRV_PCM_TRIGGER_STOP and fsi_hw_shutdown().
> 
> An IRQ handler may still be running when the SPU clock is disabled,
> leading to register access after clock shutdown and causing system
> hangs.
> 
> Prevent register access in the IRQ path once the hardware has been
> shut down.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

fsi_stream_is_working() can handle that ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

