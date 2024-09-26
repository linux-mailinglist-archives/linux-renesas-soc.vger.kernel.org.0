Return-Path: <linux-renesas-soc+bounces-9100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0C0987B92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 01:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06D5828628B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 23:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C5C18A92A;
	Thu, 26 Sep 2024 23:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kLxOFeYI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C28157A41;
	Thu, 26 Sep 2024 23:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392725; cv=fail; b=dzuqLVvBvsVdPwRDKv3bj/4UbLhdhYhDr/ykpIV52P9WrciPJCux8dlNuDThw1Qb6MyxGk0WhkpEsDgLuSi847HzmgXHwIweYiNsVgcXuTbKH8PcjlNOCk0h39dSgaAosyA94WVk+TPIWZTAFnj/pB+ImPXpNhcygpvK8o1O+Uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392725; c=relaxed/simple;
	bh=Fbf9Ral9zF+M3P8TQEH7L6Nvv1PC3diL8v30/MBKMOg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qsDpZUFFM2MiSmKuCdeSLby/wYvT8jqBaWaSL8Z1soRuXHlxPRUo8oSVwKRFqEdk1H3ebaSUMduHwl7w8HR7sOEEED2kd9hfyW/Vt6SCuKpdyobM27B22PD24vHy1fbiDMmhxWvZY2Z4VW7ZC1pnGu07SEh5qDm8Mu0C68K9Y+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kLxOFeYI; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAS14i+NQkF6pF444DORt6aamuoM0HUemhh86U5d9Omib8htj4+hi9Tk7Rq/p59gBhNlmLxicZ8REaMsvvlQ4XwU9nYs4TmqAGOKliVeZOkH/6VEUgcn2QFgheI61IWZc+UDzZWJNkQa5jiSuznXuPhCez+WejYnxBOmnR1wl75iNWkKsr4uUY7hAECL2+rQP1NeUslPR4F3067gymBaluUp5taiqk1WYvM//6mf2M+dnxy3HpTbXVS0BVIzZaRxlyNGKUeAmtrOxCn9TIYLWsX/7OIwIRjY0j9QdoSAaBdluQFBVIrj1IEYqxZLU8zMHFiEdcEsFHIdYOymAtV4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZFE90K4gQt1SSjwF3C6g470VsBNDwFUI4ygQv9Wl/s=;
 b=GBDReIgcjGzc4l7bg2dJImy82W49e2L5AfdzW+gqiB3AdTpIVRQmS4DTIWXW+V8USYXEDsBKnq1J6X/l1VcJmykbGaFiZaxeLiuaCYfXhuSqlhP9f21Kz6lDfj6vwU2YMS3MQQPd+y7LhH7KONgWlb2kR3opFHq1AAx2T/PHWlCmhwf9XgfPn4QMVg+PI6e9A5+4TFv+iENllX4+AcxxysRfTYCOQ4YD4p3UUvOqKSq0lWDeeky7WJj65GuNeLtcFScMYxfC41QK/35eMicTaQ7TxXhDtCjeMNpYZFxXO2qVEjurPUOcbtpMNxz7LDhz+xijJdVxj5Z/UF2psElKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZFE90K4gQt1SSjwF3C6g470VsBNDwFUI4ygQv9Wl/s=;
 b=kLxOFeYIkbIgZQyBRY4Ef0R0BBdOrfiYUV17SuDgjKup/gpbQueT7WNQcRl1KwVC0YHnSQP5T4FLzg90KQm/ktJ93mTZsrJMai5EeEG9BQqDnxuVeVDaDqmZ/HnyIW+2fE5+UHoew1jj4i2Dr2dgbK948yRwcpJt5kWv+k7pBIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10236.jpnprd01.prod.outlook.com
 (2603:1096:400:1da::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Thu, 26 Sep
 2024 23:18:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 23:18:39 +0000
Message-ID: <87ploq0zso.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rsnd: correct reg-names for R-Car Gen1
In-Reply-To: <20240926113241.24060-2-wsa+renesas@sang-engineering.com>
References: <20240926113241.24060-2-wsa+renesas@sang-engineering.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Sep 2024 23:18:38 +0000
X-ClientProxiedBy: TYBP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10236:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd5c08a-b96b-4691-8bfa-08dcde818dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uF9N59Kaq207PRnAOP0rNxrKGC8wPBDSuvY7uMQ1yHGqbSSkhVDD+fwY5swQ?=
 =?us-ascii?Q?NTUePsxHFKE8B5MFxOlPSNShDMXWwAYqrZT5rY9VTARSfwDWLf21P0HeXpyU?=
 =?us-ascii?Q?SNPl5vclxDmcG54ABqkjMFaWBKYNSvuT4mfV4LdjnJgpSKk6jcEhcDfmhdDs?=
 =?us-ascii?Q?qH4U+49eKQeVmwF/bdK63TyZE3eJNT7WgRZkM77aSp39kTRaeC3a0sigB1j4?=
 =?us-ascii?Q?o6Z6TQdqrQq5TW+OZanSeGAChV1avgnFmVkaXoeV3kRguU5TxRWrWTgXT5Iz?=
 =?us-ascii?Q?G8ISSAoiimksniHgzy8DUOKe/XG50jD7+pb1t1OH630d7w8XbxqvcDQ/nN10?=
 =?us-ascii?Q?QwWYGAkWmm4MFZa0m06MINp9HD0gN8TzeBKsb6UcF5XILQZPQ5PjtXzaDHWv?=
 =?us-ascii?Q?U0v4N2+oNk113Avs1tFIZdl2WtzNQsqFk2wuRdQ2/qWEJaC0Yz6wqGkpZaaK?=
 =?us-ascii?Q?H56y7EOsIZsCjFWpct9hGPrwYqqhAUhS87fcjFN7epaMNYJY7xuwzci9ZLdf?=
 =?us-ascii?Q?SOCtq+D8HGjg5oUX/vG1hrMFvhdr7x+eqXWbzEwN28elY/Qf36NYX/CdZVzb?=
 =?us-ascii?Q?UN4/6YbHcfdCFAKh8J3bPOLsfhMP/6s/tNUU+C463GTp93/qQa6D+hBnbfUC?=
 =?us-ascii?Q?ff0Va+jVDmoloCyx0mRn6FPvgTaX4sChYIPkztkxa8nXjQ5TlWNjOyU159nb?=
 =?us-ascii?Q?05UKo31ksFlW1Dk/uBkFaM2czgBlYDor7WGtj625omjBCrs90qmphpD3ivSI?=
 =?us-ascii?Q?yMOFABAw/yaXsnXxbRre2QSFzIpOvciHclbI/CuUEbWH5VZSS2S0a6sx5pIk?=
 =?us-ascii?Q?i18ItN8cBXO7ARaI/AZ94yvaGQ6wA1RCfzoFpEc9rP82eE2vMoKN6NHUfX6h?=
 =?us-ascii?Q?eVu0ON+sMZLmvRrUWvGHWjLqExJvHbcnH929yFxJqoYxyGS/3b2ZWSPhza0d?=
 =?us-ascii?Q?BaDZSI1gZF0mSkFokb2dfDR7oxsDQdA6Yb3EqeFQqqK9q5zil1GMOoAIuaeP?=
 =?us-ascii?Q?oB7NQe7ZLvYRlLs1LzU63SAQE3nh7J3vUfFqyIDLCS6araiqEG635ZIfAYze?=
 =?us-ascii?Q?MiIEDi1S2p3VpGm+ukCne9v2bRSL1hoXjy+pyhbrcJXTZm/e+eLxJr0o9FOG?=
 =?us-ascii?Q?kFfi8mb+cucNVMTnmrxgXNZhO5VOL1FFFnpZZeJ1XJlwrLd4av7kNO8U8tK9?=
 =?us-ascii?Q?Zv7VoJbKh2ksgt0SAlk8yFfL426sP+1IMREUH2kAB+1iDwI+lNbrVgiMLblJ?=
 =?us-ascii?Q?8FIW84bzYWttKV/W7E110nZ6po3MKOLsiGl+I+NKt6cqypNXyYLJa+6U+qa2?=
 =?us-ascii?Q?waqswj8DLxJ7DP7TiGuwbsTB8iviV/RWpUaJFdti2CyZgg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P76CGLqRkUsRw11lPd7n8ymVLqLLvMljxLPZP2UGezYi9NW89ixPXWsfDcoO?=
 =?us-ascii?Q?nOw9bsW1yHXvWwwOpvNfHMq+8YKZgcXEmm/z5p+FMKDwNmZbSxj0lLn58Zyk?=
 =?us-ascii?Q?MMjUKBB82hPg2MC0ZnKZzMXKM84yAsURosGz8KyRVL6bZJR7sh6SU7XU+Pbd?=
 =?us-ascii?Q?DRdYUTTKi83xclVDuS1Q8rqZD6WlIeWPRn+J2e9fMp8zIh8OUprJ2K0dTyM9?=
 =?us-ascii?Q?t3W8jLdMs6WlDLol8vvnV79BA7UG7Vey2+ye8OsK4fpiYCVMIL/cOjbzxNNB?=
 =?us-ascii?Q?GJQKST7HxJAXvebmARkva+bOxsEn6pPlFcSJGWxoEC5uRO+PA1H/GKJxVRm1?=
 =?us-ascii?Q?hKKJ1amPiZMsOm30EdKPpfaPlAoQjzNNNKFUIq/S4Oh9JCD4k+jm/qz5/LZz?=
 =?us-ascii?Q?Rk1o5k+9TcjUGVnS+8Kd7+HiAGcNKpDp/CdlpVvsSbYyvc9qTO8AUx4sPsqZ?=
 =?us-ascii?Q?y8cu0QkavcZMU+57SXllsyi//cC4M92nCm1IncyZHXY6VzVWX39AojCd/qIE?=
 =?us-ascii?Q?oJU3Qwzja2PZC3XFnpT4oIX3COSMX8ZFdGbKFK4yG2XaISuKcVz1T9syZjmj?=
 =?us-ascii?Q?FBrBxLiMmKFCOHbO3ZF2mJLLnITATu7BHvCX1E8X8S8Bc5HXJrgdsMuFXXOO?=
 =?us-ascii?Q?oVbVebqtM936XI6MQYNmSCJOoUH6CG8lxsHhJ/7cBa+vWfVHrCChihFpTrth?=
 =?us-ascii?Q?Lq22gNA9Re0Uxyq35g1Fwu2wXuBa0APtPlg6sru4mZhqL9I8gJYMPiLdlHb7?=
 =?us-ascii?Q?U6OQoKdXzSSLhXtCbjusd/yCII+aluDGCVh1qSaCM6J201GyQ3txk3azcxFf?=
 =?us-ascii?Q?Rs0JvheOc66Jw2i9FTEbvryjru4zR8uapV3p4NjVo/SxqO6dNdIq8kAQVZe2?=
 =?us-ascii?Q?W5/xTXgKccfjCz8++nl29/a5wvK0zjM7VyFt5gg4J3ZQ32gdVq/SB0fjTDOz?=
 =?us-ascii?Q?T2r5TL3Z357wsdnvQZ6CdI0TtGEGdJFlJ78Ri5yyGiT+hKPM/awE6/KKkuJ5?=
 =?us-ascii?Q?RZsjlylX9hbAJRuLzJz39h9ufYHD7doekT0Lr3tFRQj8ys4Zvr6wG18AZY6y?=
 =?us-ascii?Q?EJ6ciT9K+/gaIpxJVZCGBJCe9jEgkvO4s7xOv+Ajm5rnNl4zS7zN1m+Yct/r?=
 =?us-ascii?Q?bN319wKJUm0cWSVBxvKGPJjBsk2SkEOgNChsw38aWkoXOCeirZVrxAkvFQPw?=
 =?us-ascii?Q?XnPNBP63ReH9LbwIMFqAAWJGK5HH5B906ffcV3Z/bYy6yIeRDpEnqBGudTja?=
 =?us-ascii?Q?EDoJ4PkmabpoMgeQHNsBiKWEHf7fDr7r/BCl59TD0AUtCaMotdquA+J9aAki?=
 =?us-ascii?Q?/1Xl8vA8vgY4eGtehuxbldWWqc53sGGXPaXTIDcJ1yQN3clp+mjXRTg79kcR?=
 =?us-ascii?Q?iTwZfQxo/S+4v6BqveZmOUadfgYp4nIRddT3VMvwKNenBepx28Jvna4RpXae?=
 =?us-ascii?Q?Dr9H5DZwK04QcIuEW+KmvAlCCnVTZWSWCBOvMXaiCS/ZOD91TnHbcxZelvbM?=
 =?us-ascii?Q?TEUadevemB4J192taHGlC28wNqX94ylUz4MA8lnKe5/yXBusP8Z0dZicsakm?=
 =?us-ascii?Q?NJKBqdpfbH8DUvigG7jjCOghTn7DNPexZysMZjhrALpHgM6kJY2734Gzqtrq?=
 =?us-ascii?Q?TZCo2VFvWXFaiNuWGpcInQw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd5c08a-b96b-4691-8bfa-08dcde818dbe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 23:18:39.0922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weavhfTe/jdJcM5EBsJSkEfqF5uWZGP0L3MKaAsRLTcW+2iic7LOKALuGVOmpgpJLGvMfsjmCL/biVVlUBOKCTiTYvWLQbFJfQgnq6D0yN+uGzrumPwPIZ+y+M3kisr0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10236


Hi Wolfram

> The device at 0xffd90000 is named SRU, both in the datasheet and SoC
> DTSI. Fix the typo in the bindings to avoid the false positive report:
> 
>   sound@ffd90000: reg-names:0: 'sru' is not one of ['scu', 'ssi', 'adg']
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 3bc93c59535e..6d0d1514cd42 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -302,7 +302,7 @@ allOf:
>          reg-names:
>            items:
>              enum:
> -              - scu
> +              - sru
>                - ssi
>                - adg
>    # for Gen2/Gen3

Thank you the patch.

"sru" is old naming which was used for Gen1 only. It is called as "scu"
after Gen2, and driver is assuming it.
But sound driver doesn't support SRU(SCU) for Gen1, but this setting was
needed because driver get resource by using ID (this was needed to for
Gen2/Gen3 compatibility).

Around Gen4 support, driver gets resource by using "reg-names", "sru"
setting itself is no longer needed on SoC DTSI, but fixup Doc side is
good idea.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

