Return-Path: <linux-renesas-soc+bounces-31102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPhzG4ZY2GkvcQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 03:55:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE23D13E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 03:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 859FA3038AFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 01:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66155315D50;
	Fri, 10 Apr 2026 01:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gFqHKnUn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875ED31E838;
	Fri, 10 Apr 2026 01:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775786065; cv=fail; b=B0n2NjqpExMPcShCr44gx5qHVSYvBF7j26FIMCVnHmtY2H7dmsJcyWTb15ejqQf/web06gt8YuFnEATzAxrCcT9YMC9H63OoP8ezNygJXb9PyuE5D1SXPEZ3xNwR3YMhzVHNk4deT9HEZNll7CSPVodxZ0IncdYfsVk7Y5OgHok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775786065; c=relaxed/simple;
	bh=7jHg1OJQ9viUHJEIdZQoAIt9MBQFHEMaT9d6eOE/AWQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BIKMlfrhDw1EtaiZprIVGzgXjcxpAeEWsUmRcAenFyzuSmAxmaNMQtwK1wxVm698t5Qhsnotp0rop1GFWnyNEGI7m02jZnshDkloeimcc9LBgG8CVs3eMtvbR3ZB4G6BzYscnpc1V6dfxY8mVdznDaUbMzprD9mtJCXuf4M4kPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gFqHKnUn; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0iaPYXcy4t+zASDMIKhNiRHg2B/RB40vJ5JaCfFCbHNGHZ3B6v9DwCbPCyvVRzqodycEcuLS724C6EZNysCzo1GWpW4DvbKUfXCIPoiLws5+zvqwlAX5njFFEsEQSvceDnkhKVfdwoGMhhnIJ+Aisv3L4pABZ1Cnfe4g/B8VXgrtsw4rMUghHVjM7r9uyRHXey3zlK7O5LSouqiy42O3kVz2Cm924E6bjXrgZnOBQi2wyJhnDZxXhIDG5MzO1NbgRh+N3sy+3MFwnGp+0BVZ8VQctVEhvppAAYqaGhZOG6G+opB0z8TURp1zbErrpeVjB0mmNjn6OMtXUHhOBqF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0IjLgEdfdT8vsc1YUQhNjQJTNJbYECHIPFx60T0z8k=;
 b=ydYPshdzot5APBLF2ZP73Pq0I0HpGfGlqlOBWVCq2k2zNvOJphRG55LAQV8IG2F8y18PGKeJEbrc6BVBnLG0jlIAjYyiQX9zkk9K0kfzuhaDMfnfPohiEHKrQiGqhT1JiLyDVVHpnJau0xjSn/NMBwuyYxwxr9njhJwRi2sbXRRyefhra2ziTMJDEgm8UhqImSOEhrkiv9N+X0W9qgQIgipXH4WdgtfWC8VyKzEQzLjMSmhopliyPXr72cH95q5wCpbs0lAonBzpFwp9lvHV7ZD9crs3A0xNDAZsBvRGED0ZCWKFQTTAlJYdbIcsoNjS89SlgTNKqEWIQr54suSDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0IjLgEdfdT8vsc1YUQhNjQJTNJbYECHIPFx60T0z8k=;
 b=gFqHKnUnUqOgYj3IUZDbLa3zF1wzCJOjajpeqj75aJzzYQpe51js6z9TqQCawPg7c26mjjyKWzKQEDjmRZHZoVa2USxuMwiQYEZmREMZQ2fXc9CE9ClEisNzKA5KJinSALpNcg9ciSpmqblyEZ6hUyvX5h3WkkTebAU6Nynh0/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB16269.jpnprd01.prod.outlook.com (2603:1096:405:2ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 01:54:20 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 01:54:20 +0000
Message-ID: <87se93eg1g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/12] ASoC: rsnd: Add RZ/G3E SoC probing and register map
In-Reply-To: <20260409090302.2243305-5-john.madieu.xa@bp.renesas.com>
References: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
	<20260409090302.2243305-5-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Apr 2026 01:54:19 +0000
X-ClientProxiedBy: OSTPR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:604:221::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB16269:EE_
X-MS-Office365-Filtering-Correlation-Id: 289ed968-a7b7-4036-3259-08de96a414c0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1sy2nXmVch69QLzdxXXtHhTYto8v4ol8IjgtK7G5uBC46BkM/qe4uZ2sKcC6X6Y1sJh0nKEYHb8lMs0/ALm17nCECbwjzkXQGJNU6sE1YwLNtU3ytJrrSeM8enKWtAJJ0lf9qO5E9KBG5pkt1dRJvmETu6uASeQxdLhQPTOJIEsSrNWsPuxs5CIEkDhH4PFz9gbu74VdvaAlX4gO9y/awiy3Kl9s9DmhcWr9Oz1p4PVBAe6SkPP9OqnSKdQuG54D1eDqa6dJzFYhOK2BdHLezj9m8hK8IqazU4jR450/r2RacLMTPloDoI3IF3ymiwPUrzf9zAUoH3/Xkji1RJ85JEPN43C4toP/Zqv3keFHSfNr4XT94M8juM/ToO6RQOCGHa339/+UX2gT+2pDlS4SUJksQxbui4eRayC7u6FshYxPW1tBj0nHGgsv/nwpG3d5ebLsUhfdvJN+22y5h9bdNMRxo1zsh3NovNSHFIdVrSEpvSuNORc3zcMFivHUaScuIv/IjJCsMCuUFVn45GciMoEtzb0asgkwDWvGADz1qjWmIn1inHf67NsQSuA53XzUuY1LpDvoiJWUjD8LLrST/wgivcAgy7y8AEKaGuV9BrVxLfML23wcoMgep5xgTtm+PqDMl/3TLwRQWTUMFxzoQ0Cmzl5wJev3+D1pFGFZdmxhgYc31CCnIicQEP/BSjPaxCGOou0w4bKkEjGouob+iyE7TGieVOcikbcEOxmv/UYWvRKxsc0ENB00DLOMS32uWff78H1hT4Nlq4Dk3t3D9/LLpEIKwi2dB2lA1gi0vEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nOuJD3ZrZQAOOOYyXOGWsSzQnw6Y9RWq+aLHxO0w8zQTlCAxS0p7bBA7Y8Ry?=
 =?us-ascii?Q?1x1nDKurJGljiFTnErRCdJZI+o2MnH3fZoGRf5o6CagXaybFtxk1Ss3aSGPX?=
 =?us-ascii?Q?KVAcdGq7kMv9BSLDjMb1g9YJ1s0VQ/jXk4+7U/X/yY1bNIv64MW16u0Vgy4j?=
 =?us-ascii?Q?QA4if/u4IB7Lv+aCa+pWREdlCq0QrfDyat5pQOaMntqUw5GzxwJfsD9MSLtR?=
 =?us-ascii?Q?ME7JFjldAI6Tw7GWYVcPeLdtrPSKhuZaj6OGzcoXZfq8yK6+nDcUSMuTz8fF?=
 =?us-ascii?Q?0X4RVKf1z+Q0pq3hcyYlOvuBnHMXDtUEGOwYYYO7afJs/C8AZEaJEjk356CJ?=
 =?us-ascii?Q?ayHggaI1BdPUFQNugac+k9kpK63ScJrFln5/eX/CDhJi4GypE2NLWek3Z2T7?=
 =?us-ascii?Q?xOhuyx4sK3sYXVBCFfJJ5k64smQfZ4k/pyNzr0nvOw829kO/ImuCAThLzcxr?=
 =?us-ascii?Q?25X2MfU9yPLgZfe3xYacMlMuqCJ7H/skXFEQV5ZD0XBV6kdjxXjr3u5FC2vZ?=
 =?us-ascii?Q?OcQAWE/JH4TT3dqWp/nMa4ZhtJOArcqNMKyX4KSYg/MryHQ10vWXzSlU8gVT?=
 =?us-ascii?Q?XmBZZ4yTs91UkOAywgIeZN/j0UPDwaIxQGmO3osMhDSvE/5rB0oZO2ml92Os?=
 =?us-ascii?Q?XutoTcQsPhtXlKcoYTqoli7VbR8uQv9J6O83r8AypgLTKbv5fGIxnB3W3lrQ?=
 =?us-ascii?Q?ha1vCPS94pgFvf6cyww5vAdDVjN9Wsf5godOMcJoTlBQC+7ur1nFtcb21qGR?=
 =?us-ascii?Q?3WuFn43gGVJJjvdLucM8qzphuPL+Qm0Tmc7f2HJGF49GzIVGDaTizfamLloI?=
 =?us-ascii?Q?kJi48bR8uU8GdjSE8jnZIYrSOdNBCkryPp8wnhqR3eMf0cJhXYBioz/tYX2U?=
 =?us-ascii?Q?eKQ+gS/IFCo+6SFLhOdVYYIIgof7SJwt9GL1rJh3IVQ9H1hzGHRpI0TiR0br?=
 =?us-ascii?Q?csCYVxZZtmoqTvrgxBJqRYFQTOeLeAjk0X1gHYUHGiCiD7CqlAkJTFJwY0gx?=
 =?us-ascii?Q?RKg66fG7K3oJJQv4q2Sla/KCyVIGcSFTwQwgOjVhl1O/4gWh4VESnieDnz/S?=
 =?us-ascii?Q?U9RJe714i6kbDU7cl3MIvmjoOJL6/UN4vVIqguwjM5cyaV0hKWzQlvrvO8B3?=
 =?us-ascii?Q?tr+QpssdxMQm0SUp11SsWggyM/kSkVnNETzn5Kyeu3yo3PilxDD8qalupbFR?=
 =?us-ascii?Q?WCDf1SsZObn3tix7bcJiLFCUONCDup0pX9/vDE+wyQK4lTeUGXMbynj/EM5b?=
 =?us-ascii?Q?S2lvC5EWUstVhwPOirviDMvmCIPodbrzfhVn4wm2ec/MvP9EKZMyPtfT8xaN?=
 =?us-ascii?Q?+CpLQ+Fhw1JfDvGbAd91hLHsKnZseYeuUWqwPgFEUcBq1c2lpJvXVSCw67iV?=
 =?us-ascii?Q?xzSAu9X/pP62UmSK+uc7hlKiYWqttWDjVs9c47epmMg2R3mx+zEHvTuo6HpL?=
 =?us-ascii?Q?VRuSGTlK9GsnhFZyarv9bopVeAWf4ar41h8cgSggDtW7PpQ0gaBkOG6g/Fjr?=
 =?us-ascii?Q?ExKu5/ulWhpbtpTPodIvFvauYXBmhto3wsPTcpHrvfOwAs/yHRIsTMjt1sZ+?=
 =?us-ascii?Q?l4SRkTnkdF2lx/9KiDhELL0LDsO49XDqzDdnbp8QNzIV0bno5h3hrObL5uXy?=
 =?us-ascii?Q?jWs+L3IaacUxPes8sZ/Oev2rxrGaoMx6T22Tl0W78F+hk1cNJDnZDpSp1nVo?=
 =?us-ascii?Q?SGPRltyVu6LoGDHxXDUg2OlClsbStSpi0nK2Aw+4dSCuzLBwA8eI3AKnMzEj?=
 =?us-ascii?Q?t9J0Nw7QamlIrex0PR4InT800G/Ehgxfj7OL42dpB76JF6L4PO6A?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 289ed968-a7b7-4036-3259-08de96a414c0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 01:54:20.2183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyjT9QKUSByc3Oydu9+Hw1o4aZMYIUd15eWEsy1Uky3wli6c3jIaoFecxK/hIA/uM+XTd1D4eEMerCGBSZUdGzrsJZmlqw8LCjvP9LjyEJ5fwiL+JC14LTEwqK1Kxn0p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16269
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31102-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: C4BE23D13E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

Thank you the patch

> RZ/G3E audio subsystem has a different register layout compared to
> R-Car Gen2/Gen3/Gen4, as described below:
> 
> - Different base address organization (SCU, ADG, SSIU, SSI as
>   separate regions accessed by name)
> - Additional registers: AUDIO_CLK_SEL3, SSI_MODE3, SSI_CONTROL2
> - Different register offsets within each region
> 
> Add RZ/G3E SoC's audio subsystem register layouts and probe support.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> +	/*
> +	 * Flags layout: 0x....DCBA
> +	 *
> +	 * A (bits  3: 0): R-Car generation (Gen1/Gen2/Gen3/Gen4)
> +	 * B (bits  7: 4): R-Car SoC variant (e.g. SOC_E for E1/E2/E3)
> +	 * C (bits 11: 8): RZ series generation
> +	 * D (bits 15:12): RZ series SoC identifier (e.g. RZG3E)

Thank you for adding layout.
But "(bits ...)" and last e.g "(...)" are not needed.

	A: R-Car generation
	B: R-Car SoC identifier
	C: RZ series generation
	D: RZ series SoC identifier

> v4:
> - Fix RSND_SOC_MASK to (0xF << 4) to avoid overlap with RSND_RZ_MASK
> - Add comment documenting flag nibble layout
(snip)
> -#define RSND_SOC_MASK	(0xFF << 4)
> +#define RSND_SOC_MASK	(0xF << 4)  /* nibble B */

This patch should be separate as bug-fix patch ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

