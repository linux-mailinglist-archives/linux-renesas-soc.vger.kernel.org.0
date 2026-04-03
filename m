Return-Path: <linux-renesas-soc+bounces-30807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EDOJUkTz2nXsgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:09:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3738FDAD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FC7A303A5CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 01:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E29271A94;
	Fri,  3 Apr 2026 01:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RuNOugCn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5127466A;
	Fri,  3 Apr 2026 01:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775178540; cv=fail; b=H1AdRjUmiTGbCDuoRiPG76uyLnyEzdM+bPwH/cTAReifmmz90SuztxAqbnuRHBGbg/jBnu0SDxCZuB/aUkiGTccJ3hLPinNeVA7j8VPCoULvvZ+vMEUJt7E/Kq2UfMDd7FDzGad7qjuCMMN3Z8R/zNd7FZtZ+Ax6h7Etzojr+xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775178540; c=relaxed/simple;
	bh=THUP8sLLM4/LHcz6CnqHgubTXbmDp//+LVQJ82TVX3I=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rsnfBaWZ2rfXTCd12Nxa77uWpt3iXB2v/RB0q2gBbZhezSTSWMIBXZwGoXcu4x4LMQPNRa7+VsytlFKQ3KJmNdlW1gxi7OGk+qr0CA8YKQm3ceNERTa40fK4L1wYaLpzeLhJla6pvDR5pKVEjL2hipyXJCghejtx/1be0bPMQ5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RuNOugCn; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnNV0ORzaNRaOmYwIScCAxto6kNXMzt3QES52I87MsJC8UVhz6NPgnxBGO9eYYKmOxO1bhXgzrDPoKn6znvg7uEETUPRkLgcZBfb4XuHOiIhDp33HPAzYnL3FdlA10MYHzCPJZVdlzb8ICkAAQqW0FiWzagYW9FaPD4AvJSpxeVKEMklK105qHKPPoklMB1hUiNpZNL3C3InzAvqRQ8fxffuo0YD4aJ/YLpNiBXYO6P/GhY9LYek3xC5mO8A0IeFZN7rA6+fTY27nbVHHUK0oN+yYLZRFmDOXlJrOjMTzzBLpVivLCvgEuY7RZd+dBtxUshasuZbDH3pBrYiOqVWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFKSc/x/hWoxIFqzagUMWP10PhlUSh5/sNwVKdQEzQI=;
 b=m5DvQGPXXwxK+RBPONwhuurRK8rocXR/4+mk66wC1q5EXE+osl3CSYp3lLneyKv6SdUt7nBfvYZayD99v+nYIGg9oDz8r/7TlSr6Uy0odU1GNBtePZ/RtKbSWNPaeUR7XF8HeA86FVIBfUgQhIFzsD0Nue+hsTXjhai7ljI6xAoI3WVG/t/UA2zIH0xaCvhB7a30ieuBb8nfTJOI2fAILSnqEJ+EFVrMajwduNU0QIoSyAbnlmQPaTxbANwTr3QoyeIAwdgMw2vQlt+NfH9oL3+ZdV9DE2WZP2y/RCX47WDl/lKqF/nydzXXdXh0UJicLbd761+0PtkS/VgTViaAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFKSc/x/hWoxIFqzagUMWP10PhlUSh5/sNwVKdQEzQI=;
 b=RuNOugCny96aVwnC4DhN+d8mACn27qPYY7wUxAyCBFLzGDjKVHUTJhfFxsmk6s4yyzfB1CfajpxAXs0Vlgfr83R4FfUeryrFnJYWoaMFaDrgnLtS+6RQ09GrZFOWEU5ZW7kSdBTO+YMyE3Uws8N+Jfhqy71F1Qz76yzmH11rLeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYVPR01MB10798.jpnprd01.prod.outlook.com (2603:1096:400:2af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 01:08:55 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 01:08:54 +0000
Message-ID: <87mrzkg89l.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCh v3 06/14] ASoC: rsnd: Add RZ/G3E DMA address calculation support
In-Reply-To: <20260402162436.12059-7-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-7-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 01:08:54 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYVPR01MB10798:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9879de-f9c7-4933-e315-08de911d9378
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FkbgoAiz0kONMdK2WP5HRcnLobjASJD3+ebzRT2fekSPHm280/rzyAgzZpO9vbulLe88w5cznf3ljYZZ6XjJU05uDZ0wPM9y7KeZsew6DXmUGabW8/QcAvXkDWKTzQWxr49K8PuuyDwmS7YlaxplG6QLY2e1gGEtksu34nnL1O6T00C8eUUmxq+p61XkM8rPgWWOcd5mY++LrSt+R2JrYqHmjAUDgKVv18uyzQIwF2RcBxqn9DWtinFWxxmsoQIPaV6WD4plt3n0Dc24h4R4Y5HFFU3zDBUZgUypjDbQYQ3elfSqpV7o0HGM9dGHuE0PRxt2FDXZMMaLS7/o1y01zCeOFiy3vYcsNDa2tnvwqlnf08fW2XjzQmo/grmjmFceIsEgQl1cSdp+TRj1vMUiYmZCsAsFwqtwDqEtZTP5lFyfSVacogRBfxNSrhvVyax5+t8kUuo2HFUCTxD1QHH9OhcgE217PXb0/hT5htFq6I9FtUtH0NKlFhLmA2GaopgnQrOb4p2d3leYhAhf2wqsx5FSa7IBgegKYVteAtjEWrfrlkC9wSUpLotQ7f5/Scl4LFT8uLX8QVnw6DxcnUpOkK/BBM+mFBumTu9GSeJ8B4484Uzw06aj6urC7KHBhmfN1s18F/HmreCkBIrwx5LuQV8yiZ2bQ9SdtBhw15VeWK79Jdfc+flcnW5yp885hfZFArmd8mYjLcdkz24GmEVBkMgQkdDOTF2CjtIdJZtdiWtp0C45rHFoHFlN1Zu3Rhhu4jl6YtcKfLYr7RLO5k1zGxL4pOceAxwEre8+whMYyLw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x5GdUU8uvc26Tq7YS0ZezDln3eI2ayTcoOvH9Zvyuqox+CZTNbjbymyvALNE?=
 =?us-ascii?Q?M2VQYXfIYpiQ23TA3hrD9wK0RaG+yeFCCTh3URmRogfqm1af52jUwI/Xu9FO?=
 =?us-ascii?Q?/dub1Pg6p94yMn7lwSMI0D77Lk9s9bHVQzvPNzFg21ktZp58o6+jEaSIYrhZ?=
 =?us-ascii?Q?0EMxfb0AE9NOdhYI7Jb1ejZut/MUP5AyPUninmEPZH0gCnAXdWzVKJ8Ga/Dz?=
 =?us-ascii?Q?8ASdzpNT9UBQl0RWGgQ4aRYu51RLRcXEUCpdn2rtEi6xQpHPxMFdM4Lj2iut?=
 =?us-ascii?Q?2Z+V4LOUr3CVJuvzEpbmXZXVpQWqRJ0utCwT0w/+XFgC8+NVWlsPyl1q2CD9?=
 =?us-ascii?Q?Jdxt0V2xMJ0KdJMjKCRQEvdx3bPRbIcqdsHeMR5CLCirduMO9fkFagS6zlBt?=
 =?us-ascii?Q?bN0Dg3zNyPPYSzW0SEEUFnl6JRO/mv2fh/kWAeZq9xhyKRPOB68Wl9eHIpHX?=
 =?us-ascii?Q?Q3h8uUunAg9K77KDGtmnMdRRIdXnovbjkUPSlaugMXlN/CmLN/c9SyCw5MLD?=
 =?us-ascii?Q?8zdnv6hAehbo695Trq8qT1M4MFLO/AIds5a7SNgqi9Dpxn+UdZmHIyKG8UAI?=
 =?us-ascii?Q?vr7VN6d8uR0LhCAJC9euu32mubnyTbg8FL6pLtbv48clv2Wb57CUGT8XZU3U?=
 =?us-ascii?Q?RBE8+wVtGf+1MckKCHuZWy7zY3Z1tZy0gAmjTPwx3kus/RZi1erjVod4Tbq/?=
 =?us-ascii?Q?fZA4Lbzmuh1wy/7jr2HSqM1OYGQ5mjWUT9kIynVp0TfzOcezVoNp1RX1R1Kh?=
 =?us-ascii?Q?fiUD/8YDBsu1mKKnEWqusvbCYsjxRNorlvqUXeJNieiVzGWG6NG03/X35Oks?=
 =?us-ascii?Q?8MJWJvZkSlmcsYqVqXkHEEaIDVUuO67AQjciBwMGG+P8l9B4YP03UayO59wi?=
 =?us-ascii?Q?N9us73F4Pf1KPQZNwYYiFn089A4NweF5rKPvpQ87q45NdHZsppDCb/5o5s81?=
 =?us-ascii?Q?kcy2pKR/7J9cuPHROfVfZtvngdoaoxlVEUHoyUbUTxu+2ssq76B+lyQ/UlP3?=
 =?us-ascii?Q?Hp5DxpOaSlELwi4kameZPyT5IzNoB5ltFYAyLUJS5R4MMvnWu5G57DRtCuwS?=
 =?us-ascii?Q?+JlmKNDz1zo9iYvnXuZAhvHiczCLQ4o4LYSt+EOLZ3b0tdik/fhzUez9kBr5?=
 =?us-ascii?Q?1sZPF3vtr0qEw376E20xKSya3MwIoyhVmua3mrjaZd5X8IgSS7qcdUbltTPB?=
 =?us-ascii?Q?A4WXjh5zomgCyepo+w3resgYeKG6KYv5vm8ZjgoHLktOVrCcTEypEeFuAj0w?=
 =?us-ascii?Q?bnlNaAkHCV6IcGGQ81tQmJwon+QV4XJPekIbxRxFAw//EcIj+Be1iJT57oJh?=
 =?us-ascii?Q?I9x1A3VTNeHOsYelnv2qvy8i5gyQ+kxIQHsj+ieIzmVuhkyIhsk3vd/wrgJH?=
 =?us-ascii?Q?x6F0nIRl4XIjri3uZDhtBZQiz/6P5OqvasRW9j0Z3KlPmQSs7Qwr/0pCg57V?=
 =?us-ascii?Q?bEHf2OoptzEsFhB9FXG5nnXDB4xLwgiS4xP0QJVTygDlNhcmGsSb1I5kDlv+?=
 =?us-ascii?Q?F09keHf49RW4UsVGknnwQpjMWD7dzNQUqNQKbns17DFeJ+d7StHQznXYBZaA?=
 =?us-ascii?Q?rcdM8qXxXyiuBRW/O8+SmdVzOPFobFd3jPpLS7MYaJ3ddt9AwzrtFpw9qQmq?=
 =?us-ascii?Q?IfPn+bK59vizD22wRi5aEmziP5+RZNN7e5zZ0MaJE3JPUch14sCz7U6tpCXB?=
 =?us-ascii?Q?CrGPGyTQNQ5iSLa/P3h174ymgl+ZjlgRo2897wYnCb7dsVCHhJcmmWATSQhY?=
 =?us-ascii?Q?/3vCQB6dJu0LinSN/E6v2KqpS2qdZdGRqXhV+er0Ss1LLYC6CCD/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9879de-f9c7-4933-e315-08de911d9378
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:08:54.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8hi12eiwv1/RuPU3P9xPYABfR0RD2OuPG7S4KgCDibI8f142RVDmhNsKnUEI5lieXYTdlgCqS/BPvFD66Ras3YaKIV5u4VWZGKZZCB5SgRQ+Fw1nxSlExxKYH8DqTo1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10798
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
	TAGGED_FROM(0.00)[bounces-30807-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: F1D3738FDAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

Thank you for your patch

> RZ/G3E has different DMA register base addresses and offset
> calculations compared to R-Car platforms.
> 
> Add dedicated rsnd_rzg3e_dma_addr() function with dispatch from
> rsnd_dma_addr(), following the existing per-generation pattern.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> index 0afe4636b005..5b63206361ef 100644
> --- a/sound/soc/renesas/rcar/dma.c
> +++ b/sound/soc/renesas/rcar/dma.c
> @@ -496,7 +496,35 @@ static struct rsnd_mod_ops rsnd_dmapp_ops = {
>   *	SSIU: 0xec541000 / 0xec100000 / 0xec100000 / 0xec400000 / 0xec400000
>   *	SCU : 0xec500000 / 0xec000000 / 0xec004000 / 0xec300000 / 0xec304000
>   *	CMD : 0xec500000 /            / 0xec008000                0xec308000
> + *
> + *	ex) G3E case
> + *	      mod        / DMAC in    / DMAC out   / DMAC PP in / DMAC pp out
> + *	SSI : 0x13C31000 / 0x13C40000 / 0x13C40000
> + *	SSIU: 0x13C31000 / 0x13C40000 / 0x13C40000 / 0xEC400000 / 0xEC400000
> + *	SCU : 0x13C00000 / 0x13C10000 / 0x13C14000 / 0xEC300000 / 0xEC304000
> + *	CMD : 0x13C00000 /            / 0x13C18000                0xEC308000
>   */
> +
> +/* RZ/G3E DMA address macros */
> +#define RDMA_SSI_I_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * i))
> +#define RDMA_SSI_O_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * i))
> +
> +#define RDMA_SSIU_I_N_G3E(addr, i, j)	(addr ##_reg + 0x0000F000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
> +#define RDMA_SSIU_O_N_G3E(addr, i, j)	RDMA_SSIU_I_N_G3E(addr, i, j)
> +
> +#define RDMA_SSIU_I_P_G3E(addr, i, j)	(addr ##_reg + 0xD87CF000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
> +#define RDMA_SSIU_O_P_G3E(addr, i, j)	RDMA_SSIU_I_P_G3E(addr, i, j)
> +
> +#define RDMA_SRC_I_N_G3E(addr, i)	(addr ##_reg + 0x00010000 + (0x400 * i))
> +#define RDMA_SRC_O_N_G3E(addr, i)	(addr ##_reg + 0x00014000 + (0x400 * i))
> +
> +#define RDMA_SRC_I_P_G3E(addr, i)	(addr ##_reg + 0xD8700000 + (0x400 * i))
> +#define RDMA_SRC_O_P_G3E(addr, i)	(addr ##_reg + 0xD8704000 + (0x400 * i))
> +
> +#define RDMA_CMD_O_N_G3E(addr, i)	(addr ##_reg + 0x00018000 + (0x400 * i))
> +#define RDMA_CMD_O_P_G3E(addr, i)	(addr ##_reg + 0xD8708000 + (0x400 * i))

Please add RZ/G3E info on top of rzg3e_dma_addr()

> +/* R-Car DMA address macros */
>  #define RDMA_SSI_I_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i) + 0x8)
>  #define RDMA_SSI_O_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i) + 0xc)

And R-Car Gen2 info to gen2_dma_addr()

> +rsnd_dma_addr_lookup(struct rsnd_dai_stream *io,
> +		     struct rsnd_mod *mod,
> +		     const struct rsnd_dma_addr tbl[3][2][3],
> +		     int is_play, int is_from)
>  {
> -	struct rsnd_priv *priv = rsnd_io_to_priv(io);
> -	struct device *dev = rsnd_priv_to_dev(priv);
> -	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
> -	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
> +	struct device *dev = rsnd_priv_to_dev(rsnd_io_to_priv(io));

Creating lookup() is nice idea.
Very nitpick, but do we need to remove priv, and remake dev ?

> @@ -574,20 +671,10 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
>  	 * out of calculation rule
>  	 */
>  	if ((id == 9) && (busif >= 4))
> -		dev_err(dev, "This driver doesn't support SSI%d-%d, so far",
> -			id, busif);
> -
> -	/* it shouldn't happen */
> -	if (use_cmd && !use_src)
> -		dev_err(dev, "DVC is selected without SRC\n");
> -
> -	/* use SSIU or SSI ? */
> -	if (is_ssi && rsnd_ssi_use_busif(io))
> -		is_ssi++;
> +		dev_err(rsnd_priv_to_dev(priv),
> +			"This driver doesn't support SSI%d-%d, so far", id, busif);

Very nitpick, but please keep dev on top.


Thank you for your help !!

Best regards
---
Kuninori Morimoto

