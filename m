Return-Path: <linux-renesas-soc+bounces-30810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEouBvAYz2mTswYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:33:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D5390119
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 421323008288
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 01:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B28B280318;
	Fri,  3 Apr 2026 01:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e0ZhMjXO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFE8248F62;
	Fri,  3 Apr 2026 01:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775180013; cv=fail; b=QOFS7L0Smhp9Yo/lySKNlUfq8FIi2RsdO37CV/9kdeRckiZEehzngO9I/nBSZefELu6HR07bRj/6DaInE9dowmpZ0OHpWYzJI+GzncTlZN2og92qw7ZY6CA1S5ZOJbHtjVxMqJczfK6BzYJlN63xt72hJ747bSHLOSXQ9OEKGK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775180013; c=relaxed/simple;
	bh=mEKvYs6myC32CRU0dn5/n/xpRfSLT1zaTI/q5d0tBLU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rV1usZOJt09dSEmgyH2/ZAigw4p3cCsy3/45L+nu+cMGS3SAJ1gLhp6bbQUjJ4dBCLhfm+qrDDzD8nKzd3tob/DHZermtWmsLP9yN6Ccscn82vZlrzgVeTUxHnfGsuixhUQAcjSPB0Bu3fC/mT3OiTfjJRQxjLlaaWWaakxkTFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e0ZhMjXO; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0uWrNk6gGgUxUDrMPVo3RBPNfRtNMdn7itx8sUFcSdJbPWPWS4wcTbRCIrQJNYO7+4aV5KaKF06GAxvZxCMjDOIAEks/R5mcfxfrlFWbPCpx+MFxcB54ZGIgfjI0Xu0e7jCeC/DwTvxzNOU8686/GZnDo3CxKQUgCv6OxGWsPK0vnJ1U/mcY1r7Fum9OnyuCAFF7ChwatyP0rHueV/sYUAzPDGwbm55MJp2gr3KgbaH/tUQnEi7yMBfPZHdiRbH2DYzhXU6uCI/u6rse8TYgBTlrhoUccGOAOT70BK2rJYJu3njahpfWJz7HPLAAZqcWok00EZ8bPElxj2VJp48NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCVdzl8cfS0H8PedXuncBcYAIbzXO8NM97cBCQ6lb34=;
 b=Mr2RzdyfbO4DwnB3J1KpTfbN0Hk/8LJDGHlD3Jew7zLklZCT9gfuIkJSAjmV+LIbdXaBsvZHlsUgr4imKtqdgedFVNCIOKcDqjBnJ1tDhL3SR47yc0shr2FCHNLpM/ihvRzqNyiDtij0RaSgoiRLOVr/hIkCZgCYKWGOFywJNzkd8KDFpjuRZHqVKg3tr57tgiR4pgDnwlDysgta5G1RUMmk01jOdgCr+dpdBIICd0CEPrRhLVOFWwe2HWR0vHM5u06sQ9eldl7n3PDSzjeVRqMXnaCYgi1P0LwwMYUSJVmg6KYipQ1bd/fvUHjp6YOISoy5DAARuHMJz1cIjqAXzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCVdzl8cfS0H8PedXuncBcYAIbzXO8NM97cBCQ6lb34=;
 b=e0ZhMjXOf/4Py9sRCJRO71INBqtTQcOc17NYFrw/3gOWiRMTB4dVFRa6Qmpmt9RAbU0Tq2bJy72Ygwtjl92JRvBsIooQ37+aiMx3gmAj9eR+yecerP7vNX7od23Ev8x/XXVFTiDDEy3428hzNw1N5HyFjFAK2ddQkJeHpq2wI+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB8396.jpnprd01.prod.outlook.com (2603:1096:400:177::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 01:33:28 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 01:33:27 +0000
Message-ID: <87ika8g74p.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
In-Reply-To: <20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 01:33:27 +0000
X-ClientProxiedBy: TY4P301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: b912500a-ec24-4dab-2fb8-08de9121011b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	V8lTOVZKKmP5H/VRa+QqtSp8ouDqubowT3SRT9CgquQLlJMqgR1loKea4WhTEbipe25q37P5uibCEMGATuDXKyfnkA0mbGeKqKRq9kXML1aZX9bGysDS6RPsM7Vm5eEZIpjqeviERPYhyp6wcduq+yJFlJVT91HzDkUvoTXH4xq9JWZNsSEX/rwWDZjiQR7EoZRDdZq3eoF0VqVaC0jl/te4Ybj0kBwN/1SBS7UoK/jRtovIzpdGGaIlYj0EydQACvkKkwP0N1wua6Q4Kj8mg4hRo0rXjDKMK/tnMKfRsAYyIiwLsewpPBP7upiKBbGEPaVRTdiVYTUNYlC7jCr+qvoNWstJBns0xE1NE50eE06m2W0Gc+qS4FeEcMVcdNdLY/z28ULugD5U6BVG0yjhCQgmnmKy9XzgOU7iKRdLVvXfDyKCoMImRpTLQaA51JzkxlPn4Pz6doNh5Y82uzGol6EiQtmANFYDtoWdPWqgeyoPeCcYICvZwynDhubg1clEMCSdQE9qIQpDeBP3au7gwFp75MjC4wvuh21LO5jlSgAo+UECHbOxMvQBzDrZnjN3+jZ2bEkTc4g0HONuY+vqKQyWHIC9XFDTaTsHbgFRLe3iWK0M2MJaIs1onGAGeSVDLNGjz25bP5ab2jLeLYS+BgPORfhVufUVQLfTCWr4mpcNXjcTj7Ye0eB+QoNVUy1ymkkUytZ0RcHVT5AQwlBTveAtscVCbMHJuky0BzHmGTX3SPPHREUPZq8qblvl50PA5m2ViLvdomzqSZefw1pyqr4JLuBC0cnP04HKsoXE7N4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B8YjwEhnbT1szkXYV3IA23m/BP084WcBKeB+1JYy8cJym+NfQUnxZfvP3oab?=
 =?us-ascii?Q?JeIFJttxMk3L6rG03M2vOfpo8KCkWbq9vpZFnSRvt5QrJQUGCsW7pqy0/5ue?=
 =?us-ascii?Q?rfXV1Yu1jMnLpq22p7ILl4pHSENXj4fvPGtIv/z+Ihvt5PJDvZjZiAVk5/Ks?=
 =?us-ascii?Q?gWXUPXFucYlAM06YIqOIqg7KI0Yhluqfu3jGWsuAAKgEcuysfH390nic9r98?=
 =?us-ascii?Q?3NcqM9UdXX/OxMGRC7+r0JtXJtgtf5qQ+59vC1zwmGyuaDJAXpJPwY+Y0C/o?=
 =?us-ascii?Q?95zCmH8FxSBOqSWmC6/+qBRyGg0zqSTa7wsu0+TMXmLIibSTgiGCEAJHEfCP?=
 =?us-ascii?Q?UjY6bNGVghOxIWW+bxr7NwigbNOZxtqqUWLpycuMxmBWFIyQhiVTiHWK3OgV?=
 =?us-ascii?Q?yPKywY6wuVozG1teFtakfIfGzJGRwIr2AXRlSTDJUzPl5j6DKqFQAD/9wN0S?=
 =?us-ascii?Q?hGpVypbCW6TQQX5yWMVs0z/cm8h3p8vd0wnvUFK1BupHVONirh/O2sbT+QBC?=
 =?us-ascii?Q?2bXSPCj2QukB/HinxEepKH6os4hYBi92RZsV+glEAo/QSqi0FxQ3XkiNBYYw?=
 =?us-ascii?Q?IeWYba9QoqXtOAdwup8o9+AzusqVIf6IS1srlb3r6fdAT6NHNf4erUC8mwBO?=
 =?us-ascii?Q?6dPQh0u4t6cY8bdGEQqA+MtcBu+MreKZbxtA/rCLEW2oOTa5Zo0Gjh7DKnWi?=
 =?us-ascii?Q?86Qyvy0EmzfeRDEEyEXeMe3Q6q4N4OxbixlzTDdDxi+k6N2bweCuI/sjUqC0?=
 =?us-ascii?Q?XPp02VxQsDqqEEa6D9mgR/s5zUV7LyJKXKFmnoySzc/fcANoMWpgmngPo682?=
 =?us-ascii?Q?0EJeB+Dhec2FbXgKQte+/BPCL83JM8nTHYHqKkLM4U2dBaVtQWywK7DX+yOX?=
 =?us-ascii?Q?P3qUGM2kx6ICwU7yk0wkqE8g/i9stqQbpoxy21OIFcv0Q3Q/MMIun/CIe44w?=
 =?us-ascii?Q?jC/2d1PwGZurSTlQKMspcbJgTrp2HYxHKUH7BJsMi0wXsAqZvDSKPVeyKyH4?=
 =?us-ascii?Q?cQsgNvCVNZYGxCMIP9DZlB+qipSD75JtXoCNAwoxuxvYVZPRJalzese+oHgo?=
 =?us-ascii?Q?LNWxY7CrC6ObtgZ4B118BbGabVDkbEjY4EBD4I4ELkbqVJbdjTIdb3hhhFQM?=
 =?us-ascii?Q?+P5UkSKU/pvOV0X7b51hnlUJ5hgfN3rYk+OghCl/fRQ7w3xQcD9p7zD6eMT1?=
 =?us-ascii?Q?6UwJhczSW1IdZR2bDmbBpso5PySM0OkzdHh9wgGQxAOpeeY9HRfhGAneST+L?=
 =?us-ascii?Q?G27mqIc6LAX91c3c4lgE0MIHgEGRBJgHtv7zwxZhIdz7nSHdg+aaYPeow1FU?=
 =?us-ascii?Q?BNORETA13Z/AUKA7xHBGTTcSkVrYv1EW0YgtBK7d6/VfAb4k4yOA0o/Q/TIX?=
 =?us-ascii?Q?D+b7yWI9Tvmr0DyOsmpy8sZ/b9XpyIeKnvc9a9ZavdrT9uGIdsB/L2yhvgyT?=
 =?us-ascii?Q?qV5ByanXKfXRqOHqEr//APi3FQZQqky6WjzCxkDyA04ItBWMDKFMpuQGsq7Y?=
 =?us-ascii?Q?FLST/AlsuSskil+PBN3bmj3JPtAaeYX+vGSRW15Q260xRwsqK+r2+KrS1A6E?=
 =?us-ascii?Q?MG5364a2R4IzFlO2m8M7QCV1pi+KYXDuzfPDLuABhmxA8Zh8aRTBltA8gKzF?=
 =?us-ascii?Q?evihdYbbzG+8MrCDqGInkcF9uB20Gx48GUic7+cSVGNSmI7CkcdwW6ggjXqo?=
 =?us-ascii?Q?5BDFolcLl57DReoloOVqvG9vnImii9fJwn1fjzYYLLc7o9n0HrqvpD9jwQb4?=
 =?us-ascii?Q?loopc9ad5g+ABIoWWyJyxs+ZzvKU/cbMOjMmE9XoMLGtiPlrkp0x?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b912500a-ec24-4dab-2fb8-08de9121011b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:33:27.3509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8197oe4gBc+9QskYejY8HN1ZUkdudZnI0jfRZyq6idLgRdqIdhCVTXJLCaHLsUQvjfrpuZiG3b+4wyDHkUHgyoiUemvXXvMG2Km6zlRoxSBcq0eTPwxo3gwQu7/nf0bF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8396
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30810-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 880D5390119
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> RZ/G3E's ADG module requires explicit clock management for SSI audio
> interfaces that differs from R-Car Gen2/Gen3/Gen4:
> 
>  - Per-SSI ADG clocks (adg.ssi.N) for each SSI module
>  - A shared SSIF supply clock for the SSI subsystem
> 
> These clocks are acquired using optional APIs, making them transparent
> to platforms that do not require them.
> 
> Additionally, since rsnd_adg_ssi_clk_try_start() is called from the
> trigger path (atomic context), clk_prepare_enable() cannot be used
> directly as clk_prepare() may sleep. Split clock handling into:
> 
>  - hw_params: clk_prepare() - sleepable context
>  - trigger (start): clk_enable() - atomic safe
>  - trigger (stop): clk_disable() - atomic safe
>  - hw_free: clk_unprepare() - sleepable context
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> +int rsnd_adg_ssi_clk_prepare(struct rsnd_mod *ssi_mod)
> +{
> +	struct rsnd_priv *priv = rsnd_mod_to_priv(ssi_mod);
> +	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
> +	struct device *dev = rsnd_priv_to_dev(priv);
> +	int id = rsnd_mod_id(ssi_mod);
> +	int ret;
> +
> +	ret = clk_prepare(adg->clk_adg_ssi[id]);
> +	if (ret) {
> +		dev_err(dev, "Cannot prepare adg.ssi.%d ADG clock\n", id);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare(adg->clk_ssif_supply);
> +	if (ret) {
> +		dev_err(dev, "Cannot prepare SSIF supply clock\n");
> +		clk_unprepare(adg->clk_adg_ssi[id]);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * RZ/G3E: Unprepare SSI clocks - call from hw_free (can sleep)
> + */
> +void rsnd_adg_ssi_clk_unprepare(struct rsnd_mod *ssi_mod)
> +{
> +	struct rsnd_priv *priv = rsnd_mod_to_priv(ssi_mod);
> +	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
> +	int id = rsnd_mod_id(ssi_mod);
> +
> +	clk_unprepare(adg->clk_adg_ssi[id]);
> +	clk_unprepare(adg->clk_ssif_supply);
> +}

Can't we done clk_{un}prepare() at rsnd_adg_clk_control() ?
It is the function that ADG is calling clk_{un}prepare().
Performing similar processes in multiple locations makes maintenance
difficult.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

