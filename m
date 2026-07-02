Return-Path: <linux-renesas-soc+bounces-34666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id utnXHLaHRmrEXwsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 17:45:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFAD6F9989
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 17:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=i78yTgw9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65E6C3006160
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 15:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F4631A04D;
	Thu,  2 Jul 2026 15:45:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9173101B6;
	Thu,  2 Jul 2026 15:45:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007154; cv=fail; b=cwfPRf8d/3hS4FGhpQlxhJEM9PJafEeWLARXDRAHbX12/nupBHiwFDrkMfLKM1Sx/dY/2ERY1+krrY6RxoyQNR19Jg3RXFVKt++90wqapOH5FnEeo0mcVqLvi9YCFuUzZEIulIxy9+YMWM+I9NcdpTuz6llDkMRa8FVS4E3SV/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007154; c=relaxed/simple;
	bh=O6qmfC19Jeu97/Eq3DGuwqsyakaiDCK8baC2OTOcofk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q1GHSZMIFJJSWn7IftOvkjEvDcVvshpz9dFSeiayVMwCw8fYf6rtnquOqWuudUBLl2y2yKArdl2vo6AjQutL5tjgC8INZyZzh+p46r0Q7EFpR9vVIJzgVunRKil61fYQ34HHs96IDpfszDlyPEuaD6SZyxrHQrMIRCJhr5Qz8tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=i78yTgw9; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6i98ZCPm9mMJtTJXRstIrtTMJFaP16Zz3Xz6mLyKWC2yj53zoWbdyRv28E/1Bwkf0a/b/ZYCvX8/XERM5RgyfNmKbuw1NfS3EW7C/5K791luOpJYrR2wlpfuKSIXG+ieh710ZPtMiYZnjhL/UZIX9sm4FBEu77eyEm50mCsNsDbqrzrlu37DUzmiuC3u7bndKK9ahJerfV1fykt2j7T30r1XFGTp5cUkoLpBBickEaQ4pdzkXw3FL9PSq2vCXX5AehCrdsY6SpnIfRZ7wW8nsnm7YFEG0cuKOYYu41/NCJTU+1OYnLsgxh63zv2W4dUnccMiQPFeH8ISklc6TcAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRF7X7m14zbIAofdeLFpaolJ2NYixw5+jXV6U6uSFTg=;
 b=Mx2F1Q5jdgnO1L50KFdU2BQZfNlOFmHQrCtMkThD0TXOnjBTR0Tx9VTx/cM+E5/rOKEzt0cB9XTTd1VUBSMbFS1efS1UCb8x+pJiUFNEeFW8TAmb5f9zsqfzqzRR+nLlymSAYoCIqu98lafn58ZpkRm5zRa1Q52STxbat3QbFblnLQD5YtY5Rd7MXzUsdPSbGCVfHOYFLP3KEaPfollvlwOU3Qjb6Q38F3T39ZE9jZZ1XGDtswtNtOGjo+CVJrFVRRg6PIGwKOMSBRwbwdLdkKd6FccCjBWWg4tJJucp+nBruhFqZ1iSrtLMVJybeBRsxh3HfGd6bAYz/nmOo8w41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRF7X7m14zbIAofdeLFpaolJ2NYixw5+jXV6U6uSFTg=;
 b=i78yTgw9J4CPiY9hFELwI0y6J4O3VFopW7AduGO/o424KNGzwYtdZcacebXDNiLPaHBAeQxG+ugC6F329JcOkIlNLqaZIhYY5dr373o09iKN+NQR4h5DCiiArgXUim5peK29FA0Z+RsXt8UpU4IT5vq6CFgHx2JdXSJ4xFzeSzU=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB17301.jpnprd01.prod.outlook.com (2603:1096:604:43a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 15:45:47 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 15:45:47 +0000
Date: Thu, 2 Jul 2026 17:45:28 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Ignore missing VBUS
 regulator
Message-ID: <akaHmCoG6d3bCher@tom-desktop>
References: <20260702125855.3157253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702125855.3157253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::12) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS7PR01MB17301:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4b503f-4b07-4d63-db64-08ded850fbe6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|38350700014|11063799006|18002099003|5023799004|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	UrqVKHPt+FnYv8VIqPEgAg8DOTt7LNyWNeDjvjjji7w/facv8VwGObPG/Ykl3VrKA5h6ZAPdG0pIGap2Ctb86h3UFIhGBvRc/No2+/Pm8sl0n1LZzmgm3rfDihwIYhMnfwcxy+CBHd9uuO3Q+CY2IqekgofESWfWojaR08Szhb5X6E7RMvjqoiRztNyOaRf7yFrikQx//j/iWwYofTSvuzwKCGgIW7yWYTmZdh6OBA+S5CzrpXia2qF60PcLyo82VV4o4gmEoiXUVW0fEK0l+u0Z+X+31Ylbvz9zTj35abFyGM6gWSjGehiQOAnrN7zMiwBER3PxrL8vle09UrlRO6/pm7WEq4nkt0EFHSUM3tPwFZStyQlJeAobfsPtdzTqKHdDP1qEVEKuMyolqpSMlZH2b3WSpBui7UjAPAuJxKxfBXhuKjL3aoh2L4XD93VCx/b5z+dPBD4lW/aq/G9Ok7M4ABuCDsU1zZFnd0zyNwZY6TnNfCts1I9B+aQNEOBtyqthc6+nmzED89w2llFoTQT2BwqVR8zgAFIxQtS9v2idHA6SjGTVPcy+7xo7pNizpiEIcjVdsk5ToP8RMTpWaKmuysKiunyb52dz7aiovEJWDwR/ar5EwwV0gDpygc881nt4MwwwMzJb/okerynoBdRA+lcibt9VQjlPymYLjGzLGsPbp2EOE/8q0e4haFR5SjxDkLyW4ni+NIRH+s/3OSpfXmV3ZTbPuTWV/HNjUkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(38350700014)(11063799006)(18002099003)(5023799004)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fRyN4rtAIN0OdfJ0dM91Po/FhD4m59pQbI/zgkIWU11vlny07UGVRv2w/vFh?=
 =?us-ascii?Q?oWDjvLnZITDhMAvsxFcGyVLrvTg2a46YMJqdfrtDEhr7/T8AnSfHmfAo5Xzl?=
 =?us-ascii?Q?11GvBE9e7W+cVS/ufyd6TTP1N6IcBeMlXFgCijA+kPgjauQ+gi1TRTQWb+lQ?=
 =?us-ascii?Q?57GD+iObh1RdLAEPVQ/BlgCvsO9wzT1s/GCgQZ6V4Uv2lk0vGtiqWTdQSJl8?=
 =?us-ascii?Q?JDK/wTaipXNZiTZ1/TNjNHq4tZy1DjSh9Jgs72mhkyuxeZCxA+gCPHCFQIcM?=
 =?us-ascii?Q?Nh5ZV+2259oAsPLW4J8CaFMslt0TCYfminMigJK6MvqRh/i84HbPovOdxUvY?=
 =?us-ascii?Q?QzVM9Qp2LZJzYRS8aTnxd2ShlIcL83CkG7WVb5rjZhQCxK7chB2p/+Pp4zXW?=
 =?us-ascii?Q?kkneqmHTTzXmsaGW7746XRPnVnN4cowvl9NH+VuYMiZHmqHA+6A/ckHGms64?=
 =?us-ascii?Q?lJ3MaRO+SXGUqcqg3lzVnGIcd/ilt+5MqsGxDWR5v/OWfKiloKNAe3WiGuV3?=
 =?us-ascii?Q?1c43o2+zIk5kb85D9doJJ126df6d21GRTVcf96GEtAIhxm1xGM7QxONlUcbu?=
 =?us-ascii?Q?qz5mdvWdwLxqvrt2zEHfDsdDhbSrg2ueAT2RJY4KyrIlu36I9+AHO1NoGVGK?=
 =?us-ascii?Q?wsxfGKs4I/6zxuxH5tV9OXx4dmGVi/Z+eMwxeOcS9bwaaz80+krBqlXKDH7y?=
 =?us-ascii?Q?leB+HIrW9yCVWR2Hfni2LtZFVKEHIVk9lCujlMP8RUTpLWv17d1OCa03C9vk?=
 =?us-ascii?Q?iyLrxhu+uUtgT5BQzY4qnv7Vgy0u2kWlgsltB7jcyxmzvI0SNTFlFrGDLta6?=
 =?us-ascii?Q?MDEhf1PcudccHprheZCn71wAiC58Cr+fD1PEhnGbFji9KyYgw7/Q5oXT9hSv?=
 =?us-ascii?Q?lnD3DZGcXEbTB7hzgK3umQHUI6WUDC6PxurKP9A4kpPIZmacvxl94zvJBrx5?=
 =?us-ascii?Q?msfpFYWTH7Wlk75iHvXS6O0DHGkBdIGewfR0xIK7RFOOoz9akt6VGNSNOT/U?=
 =?us-ascii?Q?uyrjWGfmL8Y7wf5DRzJxDJmqy1P/xAZ8LdyhF87Cdku42pzWRGObGVWudDu6?=
 =?us-ascii?Q?ll1MU2HZ+rt5vOffgSu4u1a/56G/C4NIEvnZsLK3gIxR00/LXCNgHk2Njj4S?=
 =?us-ascii?Q?P1inL7XJN69nc41tk0YFcY/GQGVg01Sb/PYwzinxOjhnNoBfjNXwTqDECHLb?=
 =?us-ascii?Q?CyrrH1sc7O5pcpRP19aFonQv2vCp+OMccJe0DFA5qRiEDz8Nq5WY7UzF/WeZ?=
 =?us-ascii?Q?sqvYc4ziBZDJJUAwYQcmlbEgrrBt9GHHUX1av9JRMHZQWaardJoIGycLSxWv?=
 =?us-ascii?Q?YTkj/ogIg2dya4HwqP9swrmImh8LkY1UBokbmthdlh4kGnNbaRIkMYLDU/lP?=
 =?us-ascii?Q?XU9gQj/ctWWooYsiey70i9HBwdAiFLpSdu+1TzI3DysmvtEOPFHXs6VMBYrX?=
 =?us-ascii?Q?ULsEM4dPSSaX1JT9eFoBKs3zRA3psozs7by9ObfKtdq0ZpVtvThZBPL3JK/w?=
 =?us-ascii?Q?3a2tCghPFWfOIIZpuJiq9lnk+TFpP/6s5gQ4n6vOAbbxJ7VeD3Z+lR2TwwlF?=
 =?us-ascii?Q?NryUMGfMmR2dI1VU7Ds+fxlP7Obm4HvBsrdMop+5ryirLMw1ny4RXO+MgKMJ?=
 =?us-ascii?Q?6YNYKmTkXDNbnd09eNOowqvbWXFPHLeYVcNeOyV9RVase464xxeSSR7mH+k+?=
 =?us-ascii?Q?6bJPQR/W2sZmMWAybe3bhjcykYaf5J1CUI2oJLc59Je/xVVuiqHqnfTT3eTf?=
 =?us-ascii?Q?efVlhGJc3EvDPhiisOvgGRw0RJHsidgzC9fD83W7ZTCIdd3arsvB?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4b503f-4b07-4d63-db64-08ded850fbe6
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 15:45:46.9572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcyX188ccmz3cHIQWZ6266339FzkEB1M80El2GS29YXSzzz3ok4LcoR7JMWsdk9VtQTSsPvKNWyNlmwLmmih9kvLaWtA3Wkg3Qpczwz5iIygiqAKRabT+YEBmpWYaga/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17301
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34666-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,vger.kernel.org,lists.infradead.org,bp.renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,tom-desktop:mid,bp.renesas.com:dkim,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBFAD6F9989

Hi Prabhakar,
Thanks for your patch.

On Thu, Jul 02, 2026 at 01:58:55PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Commit b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for
> OTG VBUS control") introduced support for controlling OTG VBUS through
> the regulator framework.
> 
> As part of this change, the driver started requesting an exclusive "vbus"
> regulator for OTG-capable PHYs with no_adp_ctrl set. The lookup failure
> was propagated unconditionally, causing probe to fail on platforms where
> no VBUS regulator is described.
> 
> On RZ/V2H and RZ/V2N, which do not use a VBUS regulator, this results
> in the following error:
> 
>     phy_rcar_gen3_usb2 15800200.usb-phy:
>     dummy supplies not allowed for exclusive requests (id=vbus)
> 
> This failure completely prevents the USB 2.0 interface from initializing.
> 
> Fix this by allowing the probe to continue if an external VBUS regulator
> is missing. Only propagate the error if the internal vbus-regulator node
> is explicitly present, or if the lookup returns -EPROBE_DEFER. For all
> other missing regulator errors, gracefully assume no external VBUS
> regulator is available and return 0.
>

Patch LGTM, tested on RZ/G3E.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks, Tommaso

> Fixes: b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index ef38c3b365d4..9ae9975d3255 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -902,8 +902,17 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
>  	int ret;
>  
>  	channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
> -	if (IS_ERR(channel->vbus))
> -		return PTR_ERR(channel->vbus);
> +	if (IS_ERR(channel->vbus)) {
> +		ret = PTR_ERR(channel->vbus);
> +		/* If vbus-regulator node was present vbus regulator should be available */
> +		if (channel->otg_internal_reg)
> +			return ret;
> +
> +		if (ret == -EPROBE_DEFER)
> +			return ret;
> +
> +		return 0;
> +	}
>  
>  	if (enable) {
>  		ret = regulator_enable(channel->vbus);
> -- 
> 2.54.0
> 

