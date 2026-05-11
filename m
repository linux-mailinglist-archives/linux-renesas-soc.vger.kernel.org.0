Return-Path: <linux-renesas-soc+bounces-32332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAA5Ij45AWqxSAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 04:04:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D243D5071BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 04:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0738D3009B10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 02:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791E8242D7B;
	Mon, 11 May 2026 02:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jNIa99IV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03A231842;
	Mon, 11 May 2026 02:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778465083; cv=fail; b=hSr1PrZ3/IYTBsj4FQJQHkmX2+Q7Iuo2XrFojay430GL6C1vVvm37TqDNXy4LBkm2N6XslXn81E0dHAQK38mKMekvsv7eurX7GkKPyaJQIiB/vytuIfZuI+hvD6tScAbMugFyDOY9uDS/AQBqECwY5AGZQo05+nJxtF9PfLsekY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778465083; c=relaxed/simple;
	bh=6uMoY2Pydc6Z2AdEaTfWzVJ4KAT0aJ1bIY9bqzBUzt4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TFdOED41T5VBewLAWjSBMFdFCUkPafNttyMsjgWHRBn0zZ55GGj+5uHj/LbhjYPpVNxhlFSKGYWzPnYPIaEx/D5hZn8pcMONPVaUE9o05IkEcYrrB0s2ngVs35r65GDexnBhYaK42cGiHa5Q175wnmByeoH98hEcH6vAQyCrXo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jNIa99IV; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoWTuLQ0NvBh2ywcbLbG+MInciQW9lYROlFAX3k+EVq7dTpI2Gijblty7/0ydjlX/yjhFhiLRuTL/fbpiur9Ugz+K9zDAwgetgx99K/cGxjx17lRm/WsDCHDIw28bBaRJ/tTKH76BGr5kpXdo9kChE7TVHEQ4gxyyECFbXRxyMBApIpw0F473eeqVLwxTb0fNlXrjFVK3wiTTuLTmkbZwyyBI5srE6kVA7TgwmIf4HXsKtiOMm5FE3gP5dbf9cd2OlIXoMjyKL+uYdqqYyJuImoEpls0p3/j2aDkASdBOI6camoxhoPdBCSrQl40OFRKGIfxXD7NdDRcEIwePzQgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4Ww06j7QUxj64SbXtFBOoMyO1Hy74qABS9sMEfsI6s=;
 b=LdL2fby2tBXkZvuRdAdk8jhibihFHVbYbIYhZabGLPAHSNPeMN9WeURKp3e6Q7yRydzk4npXHPdbqjW4bwm+QXCAfXcHd7XczkQeEEkwMsa3C6Mgwp1GssY13Ur1O/xdj60RlnRjJzWtSnZN4Mv0+bp42/hsvglXcctEFjjnZheJ28y4WAow9tDNjOJBynmZfliS1MB99sVceDPsVxZwY00JW6oqn5BNbmCKUGLOXR4G2DTL6dprYvxbuC50VbNxQZIrMM904lckjMaalCCUDzeitAlkoMmwDidG655NE/NEAgHvJ7vuyzrDZFpuh0x2zTS0/UM8LF8MVjLBZ15SfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4Ww06j7QUxj64SbXtFBOoMyO1Hy74qABS9sMEfsI6s=;
 b=jNIa99IVF2JV4r5f6e73O6Mh1Sw+Azu1A5D+eJzGd12hDfhRH6itjtBhuurwHx0ydmbOpuayyhPsUEt+xxR535jDl4pw6JOwTYituQQShoNRj6KstP+k0AyRcyZs0RMpPYQhajbKmFw1oHKRmXYpedjfY66mju/V39GapSdJ2Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYCPR01MB12110.jpnprd01.prod.outlook.com (2603:1096:400:449::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 02:04:38 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 02:04:38 +0000
Message-ID: <877bpan1l6.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v3 09/10] ASoC: renesas: fsi: Use clock prepare handling in startup/shutdown
In-Reply-To: <20260510084303.122426-10-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
	<20260510084303.122426-10-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 May 2026 02:04:37 +0000
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYCPR01MB12110:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9ba9ba-b818-4ae6-b3c2-08deaf01a808
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ReH3m5wvNnoJ+AV5aoFfRYPtbHcl+Qhc46MonKX/p9Zt65WkqzoFYAu1GVj8VPZhnQvOUi3Pd/0HmuEMbb9sjMe45ifjgCabDvzfomGAYoRUjb9gRZNu1G6LU2vbWSSDmXTVHkZIkuKIahAZUrE4NOhCh1b/t/d92rmhBkfXLcW4m6Vk3x9LmdyVAyDv/xZjXM4q6qRtJeIpMTI2hjhJwqBkEwetUiRacP3hrUPP+kJ/NNH1XTPs8d4dx2VxlG+yduu7Q63HxFjxdbUaW47e5hvwlRJWUDr/i+QICppApOt8kFrBbzCkU4Whh0pVXyLN8+i8wBMmKuTl/ZoC5QeXGA8TDnLZpRFbJCovd8b8e/29cVmrpPsa/lt4WLhuMwMDPG3b2udcNcUqtiRburH/W7fowFSKbkhyg5/N6s10I10X5iQv+55+EEv2vQUZv3eBIpU2DaGMv1nO5FCFQzrYaoG1vWTwxjEFtzfObHLMseDv3l+3Lso1IPJm7+4MSFPv9oFdHYbE4q27WL2POQilGtMxqUPTBL9tM7N1XbLL1YwyODTOFcbcRAKwnjy1EqzTGseFDK8MCsMdILL5UCERU/W98owEzpqggoEZvMVoVLSeHfNbjvtKHZgJQ9zB7vKb8uauE3MTSiqDPqCTypkS7749235ZRl6JvQSQ4gWZfBEPAPeCqC7LLjYYlmJ3mW2x5uOBXYh4HRHUTPz/bAt/m+Pw5osaXjjN5BV8/6tBE1nYf/LzjSWZpWEVcCPgg1zt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0N2K+kTFchA4ouKs8QhYQpgEXBcMRhZyYw1FsZVzBCn8ktnh+/5T4qu1aF+1?=
 =?us-ascii?Q?HE0Y8FoIlSu+rIaaw/HXQWOcknsYgdE0uXShQMGiYno7i2LXlJp9fML3wJdP?=
 =?us-ascii?Q?Ju1aclOuuy1Ms9Y4gc+licMnOpwagHmAN9j9hLC9A8ghCizc1lCfPTDJwjRS?=
 =?us-ascii?Q?EPRPQvYbEcJFvn8JCtGXDfZ1GyUMTtSRF/AR2Wz6X++osSz9FWC7A/Hfdl91?=
 =?us-ascii?Q?shjO6toCWHid/cZjRRQN/kDEYOXfdWsZ4ks9MK+HZitNkEc1yNHe2ZoE6ko9?=
 =?us-ascii?Q?U+r4YWyhIxzc3ZYwC08NbxZYZhCihwMnnFGNR9C+VNOVhSgAgnr+xLDdHsM3?=
 =?us-ascii?Q?MSmtA5WU5AdZ4Xd9OiyyjxxYu8ppOdnoUp+Ln9GkTFDgiBZftVmtNR6yLFt0?=
 =?us-ascii?Q?sFDA/T07C9UUyY2mZ/zZv/uyW2pDRDg0RrjC+cQ2MaQKX311rrRXeyEjcBSf?=
 =?us-ascii?Q?7IAjSCmyFWIQXcr8iHrt/2qcJ/M6HStBMhaRQjL5+XhdQ5Y8OKOABotgaBSl?=
 =?us-ascii?Q?n2KLumds9M3raRkiWae0lHch+AaeISXRRYn0HyEKe4fQ6zcAM+2d4kRiVmng?=
 =?us-ascii?Q?09HNFJFAbixjnHu6TPKDTRZajC2nOeBioQqeetNKR9Nig5SAqtO/m/xfr61g?=
 =?us-ascii?Q?JLb5RNvoFYu/QqpMM2aW3L7jsRr+XXH0EbB/N7yTkcoPdKE3xrPPOWxUcqCy?=
 =?us-ascii?Q?lQvVEJ7RBy5w4ooRGtuCzEQE8Cy/dcFFiFb4UQ6335IJck6INEp6oiELr+kZ?=
 =?us-ascii?Q?i3UGQI74jHx9IfGYBV3SasYIwrz3jWhwF+7OVFM+2GPKor0Z9j4Jsu6ntfmh?=
 =?us-ascii?Q?Rlc8xs7bMfbbQwqKH/HR4KaTWSD6wwTCt1LZvx3bCq+mJzN3ntJ7OzEH+Gu7?=
 =?us-ascii?Q?eF7+2hq+6bYenEt8gNs4jUrU7i1QouRDzC2Arhy8d10973tF0lYtT4/yMnZT?=
 =?us-ascii?Q?f6vA4cF5HmIdLrnXwB04KtHtZyhLXXj3rHAmLBOTKWiZIzLtR4cryQVmXtfe?=
 =?us-ascii?Q?Gbmvwi+gJPtGgSSfNVmyKpDQ1SL26xu843VuUP813E8Q9nkbKl0vyzaua5Tz?=
 =?us-ascii?Q?OYp3CUnQk00bDaDTO8G4Ou6ISpaVd1UtQbWzaHpXBgRt2rhh/L8EN1MMesQf?=
 =?us-ascii?Q?d2YVHyZfp57pAWFroXInE0QOUuVqXe4tDHicvkI0+ia4vl9ABFJ2+X5qULht?=
 =?us-ascii?Q?XFoo8189Tm/eUeBPcH2eNU3VJEGkRs4O0mwb2JHsEuwdLjGibpp0xpArDcS1?=
 =?us-ascii?Q?Gzq4GrUcAfaWPGcVlgiMc4+fUDBTOudWBfGIKS2L0hRTxd5ThOEgc8VfFzIs?=
 =?us-ascii?Q?x8Lx5+fnHJcJjlhRliG9MMZ3rQh59BZBE8HJzU7QMpWXwVe+K3014pR9nk91?=
 =?us-ascii?Q?aub0aax18AQFU6OCA8ba1s0yrrheReGkOm8zQ15kn5gKjvRLQVZqsBtSmpmn?=
 =?us-ascii?Q?0+l6lfBUWXqMDPBqDjiuvFXRQr1EQDIAUCWAjGLL3BTdsg+lhqvqKv7kdy8t?=
 =?us-ascii?Q?aevZh3hcIMklHgnAMOQ4rG4M7QoDntl2oQIwk8RCXXD3pijXynaBvLJtUWSd?=
 =?us-ascii?Q?cZ1rpGjvwSBJVB/Ua+JcgPr2w3ef/EqTh24Wdq0jm3gQN2c0pHyhy93ravu+?=
 =?us-ascii?Q?eI9lFFfw0K8SImCUi/UvqtoaYzjFtjbRXgvE+8ccpbOVPRGspMeI2stoDGmd?=
 =?us-ascii?Q?nZIfUceuU1j2i72G2PstinvO6WO4nVUOra9sugjZ6ZHaC2XYqay+GBihoYPH?=
 =?us-ascii?Q?PLxNhq3HQTYdk/GO5TzJYDgXN1m0yO96yTa0897aeYqjdCYF33sU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9ba9ba-b818-4ae6-b3c2-08deaf01a808
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 02:04:38.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNM233Zto2Kjfn4AcloKRxypIJKEfERqZuZRehKUdZaXFKmxHUeksGS/4KaoNddKHzdOEIMFO9oGEA1WIzIdtmLtYUs/yv9QblQyqkgYOGrYx/37r6P34peuDvLo8LXr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12110
X-Rspamd-Queue-Id: D243D5071BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32332-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:mid,renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


Hi

> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Use fsi_clk_prepare() and fsi_clk_unprepare() in dai_startup()
> and dai_shutdown().
> 
> Prepare clocks only during active audio streams to reduce
> unnecessary power usage, and ensure clk_prepare() and
> related operations run in non-atomic contexts.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
(snip)
> +	if (fsi->clock.count == 0) {
> +		ret = fsi_clk_prepare(fsi);
> +		if (ret)
> +			return ret;
(snip)
> +	if (fsi->clock.count == 0)
> +		fsi_clk_unprepare(fsi);

fsi->clock.count check can be done on fsi_clk_[un]prepare() ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

