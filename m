Return-Path: <linux-renesas-soc+bounces-30906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNI2JnNT1GnhtAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 02:44:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DAD3A87F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 02:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AEADA3007AE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 00:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F63E1DC9B3;
	Tue,  7 Apr 2026 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Bpzh8Ao9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407A1B7910;
	Tue,  7 Apr 2026 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775522670; cv=fail; b=nIOHjmw+yt7NvXRW16fE7Nxd87kKxTPgzWbSuUPIlCUNGSaOZaOHTDE9z2aMWs6S03sWFLZMKjmKQNxOzmaa2XCy0C9AdPWLFuu4FIHCPoV1QH+TlICtowj//OzfKVreXl3pIkKiGnF6eEZuK8gwdr5LKrDrzUBg8anxXP0jVgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775522670; c=relaxed/simple;
	bh=oMGY1VGDNQKNcx4+ijVMIhF1WkwnEFcG2SJpGNkEEkI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cfNmiKn9fxw5rtGpNEhHgjlyixvDODXGIOEkO/lGIzKL8uwwJagrOpPmDR65pWvqJ6bxKJBjUkAJQI9iCznZEf05cJeGh0juiAfI3RMM98AY4Q1r+EoJl38EkjzmjaMJJ6tGArduvOa3vUAXFyz4WSdme/ZUl7pkwsTJAau9/HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Bpzh8Ao9; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mahch9imX6w4ANR/a0vuV72gr5VYIePxpkoUBeEtXnu+ap0ec/3e5rPKQFjBfC7bg55PidPfxv2W3tnQGNTrXYzM9VAYfUlrPu6tDH8czrxA/Lvbi4n9cagtcjCuxBW7PTpC7lnw5hmOWkmV0Da/IeKFzBt3wJgzS2dNsgij9OpAboDVY3Fev/tr/2oGyz3FsZwm43wS529gRCtpDuJUxIGaBqJ39uL1ZUnDfhhLn5x/fuW94N1qXJKg6asz/7NeAyZrT2fLO4CvXFczdX1NiiACjGHK3jg3MMkAQJ5nEnufT6Pg70m8pNJWkKTqQIS+K4SjfD7/A52h2GujE5G6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FicrW9Okx8TlNmp8nOTgb89GdHkrYg9dsuYmI2epYbk=;
 b=P6jE4OaCu7qd2DPLcsR2FetKfPVxz5nydj1Win5G3K3BzA+MTB6UzZwtvEUauGuXiMoHfWqUNByw0InlwhGn5VrSk1fEoPEESRgrhi9vZ6Qu6PHlMh48MwEmkJO4PFLyOxnDTQW2jPo9vzs+30vEtPuDJr11hEjaLKMYOxnsxOIMcA9IwOQXqi4ScysBZpLOyHPETh5lvernt3GzuX/TUOZKjmjEKfvHwwLnGzyvndZa7xVlDrKQp5MZvspFdzQLYT0FhwsuglkjhlMzciJlBvsZqRIJThFa5W9vO5W1dzCd3sy3wtrwFkmXGRxTf52hjAuOlEuS0G9P+MMvrv3mMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FicrW9Okx8TlNmp8nOTgb89GdHkrYg9dsuYmI2epYbk=;
 b=Bpzh8Ao9SH1IbYmOK9sRvIZdQGLpvk8s9e9d3wrzAlsLYiRFPLRFRqb7XFL+clhehQgpWSmBzA7ZXAb/x7yNEvn27+MkqSTzIZ+rT0oBzfoS7YSfpizE/vWCoB95Ke7AL1+j1xPTZ2G+FKyZAzk1+VckdudT8WGUsEuj7YR41lU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB7312.jpnprd01.prod.outlook.com (2603:1096:604:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 00:44:25 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 00:44:25 +0000
Message-ID: <877bqjtx93.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Tue, 7 Apr 2026 00:44:24 +0000
X-ClientProxiedBy: TY4P286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da6986f-46dc-4918-cdae-08de943ed12c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZSS5EOEkajhEZ/hbQ2EjyRdlz0ZgbPY1jECuSmldsRt9T35Ik5+ZtVVnA2bOQweGJloUYxUpsqRVYaJbrnNcnxs8T+DziCpGv3UsmhW6RzpNf73MarOzTgxKFRQ6tfvqI46qQBEm7QqyTB//PGkiijEvOGq3Z0vo6YbgRJQHJ20IsNvkp6HCPoUv8LSLns+JMiC7vt7hQJor39dj5nZE6FpAHSRSvybcsyOqsLBBMkxTRK+lgtQ2D94O30zuBUMIQqqSMnp00ILYtfIy5aTeNJ+Lk13GdubhT6DaXoazIslxqAw0PNanOWpqrRttw/q1QNfVFx+ThjXDEHzBKf4HQcE8056Xdy30K5P8CfdSWsX4hrdS98c4lgbHb2joUL1yKsTM1VRxEphBHlBP8G68sQ8+BsiLoqSbl9qkgJanUpcpAIAEgFN6+jCYWuPt7dcjVyKd+o3cZaw746xIHhiCw7zdtMopKBevCiQ+Ed+yJmH5w/WiDTthP/JI2rDBXt+1O8aBrpslCgXlfA0iQaG+doj8dmIU0A97Yq8kHwqkEPVYcBplhudvUG8+UaV+LKv2f6h4lpb2FyUsYpdaA7WDB3zatp4wLCOlveLKF9JWX00wuQ9DYDP8GtyDFLpaPgtjJOzaNryyY2C12QRelR835Bne6Sl5yNFNt7Eq0aGmSH+2AYmrYi/2ilGB5nIhl3WvC3NqZ91pQXoArs6f388GPlquZ4BY/6j0KFOkNGlRLk6l3+reB1ET9Ml/KsDoDs7nNeTQVJ76ydpeeiY+EQsM9vH12mlcftNSf6PgHiK9+P8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?21Xl2/3hQCBrK3XcrF+L3+VuooWLGu8RHkCnAJHnzB99pX9c7XXJXjFU8xm/?=
 =?us-ascii?Q?8SPV0xEVi0SZED7SK9H1u4Nu5zBfV/8od8uEBfBejeOvl5P0eI94uDoCARR5?=
 =?us-ascii?Q?PcOfeMc/FHtkg/iN2Gw8PUArky8yJAXYIJhV9bXboi8PFb2fn53/neBZ7hK9?=
 =?us-ascii?Q?EL+nXtSJv397tFV3jhNRYFR4jXId4O37Bys7PmC3OqBBDybrn7HaZe8DVENL?=
 =?us-ascii?Q?8lCmdkIJMFkO/MrHURebfi5bmrxdtWqVftGp5Y1stMnS4ZnTCwYFvMn4cAXp?=
 =?us-ascii?Q?0SwGo+2IRVtKOoEK6GzFOb3vT+P51l8tYvsIxwyZ2pA3zfKBJVH9X5mVTP1N?=
 =?us-ascii?Q?Dv17wIgsSj75JdwXK6vfa06Y+nujbuTMQODB2uhRfizMBUFhXDOvkpx8TzOH?=
 =?us-ascii?Q?4/Ngx8cz4b09PqbCa8cWFGgPw7JQJeEFHdLenpo/yvts/CyrfiHFVJZMcNvb?=
 =?us-ascii?Q?LLWE+/ilr+qe1SK3UD9XWrGqu1+xi8O5TBYWnE/KmiqnU1nHxfL5pQXaFaML?=
 =?us-ascii?Q?s9eTNhkXID1jWwy6iwaWOMSpZYuiK1qjCkqNFIF7tq5YMvxS9+SPlsNsIdzs?=
 =?us-ascii?Q?mPUmJX68RY9IKN7xSzeA2Pbogy3LQL7aede9XJfED7pxyOzKLTmiM0UNTBwM?=
 =?us-ascii?Q?JHIOnLF7HWpZ8HjiHfirqUhj+vO013lQtdifNmYmWZenn0ZP/HW4/YjTskG7?=
 =?us-ascii?Q?gZKzCPDuX/ICF1h6W2aIltHST7GgjRTnUI7h97JFX3QyF/+8RixvhpoMMgt5?=
 =?us-ascii?Q?uBsHenZPaRYRmZWHT9Vmd3VeUx61TNT7CgHQ2sSUiwQA2iL+Nw0iM4rV+mHB?=
 =?us-ascii?Q?bVAP3a6DOSuQSVSC59J/10XmcefzFqjq+dH4NSWPBmCsMLDkmRJQOOuiH2eK?=
 =?us-ascii?Q?wRbMCfyXBcNdlsaL7FCAckz0DeNzool/I6GI13h0utQUo+4H/4wgZjNrjVRu?=
 =?us-ascii?Q?hPIuFJikq58WOlMlgSpOherTp1bbkaOUhyFI0ZeKTM/vqyAe1mRjQBu1jN8m?=
 =?us-ascii?Q?raH831DBL92ZMhJP02s9C/nDvn5mJC4a/rYZH0NyCXQHe59VsLLJHnMnVa+r?=
 =?us-ascii?Q?n6+6WRIeDbNrl08BN6+hiscom10Lm3LsSzMk+o22O4SAVTVh/3mzbK6Z02NW?=
 =?us-ascii?Q?QJ0hz4W5mW491Oow0FTFeSAYbkP6YF9Hbt4/ZTLISQ9lLpvM5Kr9U5prQZdL?=
 =?us-ascii?Q?0WXtH6WZ4cYpRJu95uHfd4EAQCaIixooru1YNWVRywPerJccktr0RezgPQ/l?=
 =?us-ascii?Q?S/UN6mPtzKpjMm4PMpWoUC9ehIIGqD0z8XydwP54Z/aOXjhON0JiAHBJrZHP?=
 =?us-ascii?Q?mBTbpKlqKvnjSM1hupZiw/wI8zEZ5Htll9whxeLBJtZV8dMs37iw1n9aHYVJ?=
 =?us-ascii?Q?2nxR2+ehtt8A4OuFQyHeJS2kEIA+jZhzI/m7ykSTCQXYMSzBacjBEYZYl4mr?=
 =?us-ascii?Q?p1wz9g6FNHgJ2bsBWIIVzrBjKgbhssUBrtOMUQLZdLNQZPwJSQ6U3W5P5E9M?=
 =?us-ascii?Q?Q+87tPUul3h56z0+SP6QsNm6TpqZ0V0R/Mn4B/LV9VfF5aB2sw1ZARcXhCbv?=
 =?us-ascii?Q?RYXa5n21EG/ICSUsAe6bu03pbkZ01llaqxH5BN9gUgJwwEtYttI2zXqxDGgk?=
 =?us-ascii?Q?VUcEd85/ENO9gSiZnFU3rVdRYVIKxlIjrvnOa982EUPj+puScVPQlGvWANUL?=
 =?us-ascii?Q?HCzfb/2xutDuVwoZRjS2X/eb7LdqR24+CnhAF0nckMp6/2yv7FTh78ipmZ0B?=
 =?us-ascii?Q?SGqMM7iqE8ymDXjZLZAMSt83A5srsvHekEiXg0zUv/Vdb6MbHG3L?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da6986f-46dc-4918-cdae-08de943ed12c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 00:44:25.3267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWtdTAkiUoWx1litxzYkO/zOlytXcAGS0xXtiToMgqO6IoWmDCErPpBXciFETp8vkRzy7p180BmYqd8ql8rirPLedL1MP0lv8K6PcWQygu0DIC0ZgHHpGzWFo9/46sli
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7312
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30906-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2DAD3A87F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John, again

> RZ/G3E has different DMA register base addresses and offset
> calculations compared to R-Car platforms.
> 
> Add dedicated rsnd_rzg3e_dma_addr() function with dispatch from
> rsnd_dma_addr(), following the existing per-generation pattern.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> +struct rsnd_dma_addr {
> +	dma_addr_t out_addr;
> +	dma_addr_t in_addr;
> +};
> +
>  static dma_addr_t
> -rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
> -		   struct rsnd_mod *mod,
> -		   int is_play, int is_from)
> +rsnd_dma_addr_lookup(struct rsnd_dai_stream *io,
> +		     struct rsnd_mod *mod,
> +		     const struct rsnd_dma_addr tbl[3][2][3],
> +		     int is_play, int is_from)

Here, it is using raw [3][2][3] array as param.
I think it is good timing to create new struct for it, and use its pointer ?
Something like...

	struct rsnd_dma_addr {
		dma_addr_t out_addr;
		dma_addr_t in_addr;
	};

	struct rsnd_dma_addr_dir {
		struct rsnd_dma_addr capture[3];
		struct rsnd_dma_addr platback[3];
	};

	struct rsnd_dma_addr_map {
		struct rsnd_dma_addr_dir src;
		struct rsnd_dma_addr_dri ssi;
		struct rsnd_dma_addr_dir ssui;
	};

> -	} dma_addrs[3][2][3] = {
> +	const struct rsnd_dma_addr tbl[3][2][3] = {
> +		/* SRC */
> +		/* Capture */
> +		{{{ 0,				0, },
> +		  { RDMA_SRC_O_N_G3E(src, id),	RDMA_SRC_I_P_G3E(src, id) },
> +		  { RDMA_CMD_O_N_G3E(src, id),	RDMA_SRC_I_P_G3E(src, id) } },
> +		 /* Playback */
> +		 {{ 0,				0 },
> +		  { RDMA_SRC_O_P_G3E(src, id),	RDMA_SRC_I_N_G3E(src, id) },
> +		  { RDMA_CMD_O_P_G3E(src, id),	RDMA_SRC_I_N_G3E(src, id) } }
> +		},
> +		/* SSI */
> +		/* Capture */
> +		{{{ RDMA_SSI_O_N_G3E(ssi, id),			0 },
> +		  { RDMA_SSIU_O_P_G3E(ssi, id, busif),		0 },
> +		  { RDMA_SSIU_O_P_G3E(ssi, id, busif),		0 } },
> +		 /* Playback */
> +		 {{ 0,			RDMA_SSI_I_N_G3E(ssi, id) },
> +		  { 0,			RDMA_SSIU_I_P_G3E(ssi, id, busif) },
> +		  { 0,			RDMA_SSIU_I_P_G3E(ssi, id, busif) } }
> +		},
> +		/* SSIU */
> +		/* Capture */
> +		{{{ RDMA_SSIU_O_N_G3E(ssi, id, busif),		0 },
> +		  { RDMA_SSIU_O_P_G3E(ssi, id, busif),		0 },
> +		  { RDMA_SSIU_O_P_G3E(ssi, id, busif),		0 } },
> +		 /* Playback */
> +		 {{ 0,			RDMA_SSIU_I_N_G3E(ssi, id, busif) },
> +		  { 0,			RDMA_SSIU_I_P_G3E(ssi, id, busif) },
> +		  { 0,			RDMA_SSIU_I_P_G3E(ssi, id, busif) } } },
> +	};

Thank you for your help !!

Best regards
---
Kuninori Morimoto

