Return-Path: <linux-renesas-soc+bounces-29066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCqUCBX/rmkLLgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:10:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA923D6A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BFCE3015B9D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 17:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984203BE170;
	Mon,  9 Mar 2026 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E2KeOkiU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8925B3CB2F9;
	Mon,  9 Mar 2026 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075967; cv=fail; b=N8TsfTcHc1IRr6BF6Acbs+6Di2avjNnHikVObTcSCoRqjfWnusNWOyjSZNArRG1lzpiYMizfEzrvqYjvZJaQRkMNFXtOTTUZwOebGPuh65yV7tm+0QLu2Pfjpao7g+GkxnkMjNExTzmvfXW9KJby8D/F4k8QaqmxiEedUTOwVjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075967; c=relaxed/simple;
	bh=k8vsZk9e59MtTk7FkUg6JNfZLBkVFlqCaPPEBpyKsMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=gG703jrfPS7oC8M4NvoeKpxq1FDU2V0NA2hdzJLVkE1LVVUPLYkRgEJ02jdrblOC7xz5huB0bvSqttOwScIuXrVyT2ILmYk+D92G51xy2ahcVdzGFR4MF8zUcPFvFZgnakAEOPmBo0NOC/Z6tLUAlH+lSsRpfNmItIiiRxB22v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E2KeOkiU; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZ+/RvyDhf1jfb5FPaGh1Cvxv3+CIQe5Fp5RbzNOQfeHG5CjuCxjL525ufUN6irjG1e3sUFXUNt8rG4SuACyfMfyboF21pbTDTi1vK2F1VrQdL41vss0xt5YXc0Qtvu/eLgDETsqfkw/o8LrzNKoG1q9lqUbn7GV/JuQSvFF0C5Ate4uUViCldP/cCtegkloArwkkcTuiZykLl6/9nZxrqU2kmd8Xi//JpZfK8A2nqjri8r1r9KVCF65m+i9FqIuHGZJYGGc7LK8/AB5Ru+PPcxXsFKGwWyNU0lwj/AuxjvR+BPU4N7nHfzp11EdNMrpAikwxmLXKNyPlgfLKSns+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2UVRm/ImFraOl+d3LT0onnMZcS6zkb8mZVB9OXos+4=;
 b=xg6cjC4ICyzP+5OnknBOD4MGIvS+p+zloqiGPN0kgjzxNN/m/5lyc4wr3YL8qF9zRVwlxzbtUftUZhtrdxV7tanzlM+uQOsTubLwOCJdHY8SYcAxBj+9bfqzN4iMZbjNhtkKQPat6jfVuVRPQj2md0dpce6aSbLK1xdmx2KJkujFoOkGaNUp9sSkNwggH17NboATk5xjicDNk+LeDr9ZBI1sy7v02tLa3gUYqzLccoO4rGYCl2bM85aFf818mPIBsO5SkFNtd4oKLC2CoB+ewbwXvoW7y9IghMBvjgbsCvHWzfvNZTfojs5ZA6RjUSaS3eLBzbPW1O6C5arewvtUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2UVRm/ImFraOl+d3LT0onnMZcS6zkb8mZVB9OXos+4=;
 b=E2KeOkiUs4OAN1WrRg4FRaQutHUqWO/bitatTkFIVmEwHE9C/2SNgjH58Kv3LoPKfg7yPeVQh/s17retvR1tO/ea9+U+4UgVGi/Zkp0NDzCTdw1p4a2jLhPXy9fQaezJcT5OCAh1w1x3pymuwfijQeVH4REJ+WnP4KdUDlYZUu+WOCA/4Ac1hSNlaaO6DIP46nteq8DK/xF4ax3MRhvQwzi7XsiDjrBKZ/2gYYXOWkIawPZLBvl8IYKyIddTwv/6jXlTxtfe3pHs/6CUiez2oqnPhK8cxjD2GrR6lG/n7Vq0vNoxTODaMUZp7IF0eq40A3pqTh77dW6LMDaYGrL0ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB9009.eurprd04.prod.outlook.com (2603:10a6:20b:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 17:05:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 17:05:59 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
 Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marex@denx.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
Subject: Re: (subset) [PATCH v3 0/5] Support TQMa8QM
Message-Id: <177307595569.1726944.11310104344388663928.b4-ty@nxp.com>
Date: Mon, 09 Mar 2026 13:05:55 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1P222CA0064.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: be0206fa-32fc-4cde-e108-08de7dfe22e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	BbMCrBPgU5WmU8nJQGGXEOtgfFHD0mbaa8iT+iFEv9xIXVmvNpBLynMj1YZ1qMWjjsfgTIrYQ9xWUx3ZxiwLj+zxnz4vQDVJBUjEyJS5kYHe8C5FJhnz3GbDxsfHmZhLGoRlpK/atgKd3VAXUE6W4broLWNH459JjLnPWzMuezaL/NZhLlvZqCGZRwQ11krUzaChuS4Qnp5wnCA9EAVBkUz4R+c35gDzQtyo6kGtPv7wubu9E5En/xJOEm2L9LZw29+bq//fwWOgsFHugjJeF0rfXRUPyIB7LTjsWZzvWA/TLAz4rZB03DR5l0J0VA2dqwyVma1+QcEySCMddj9i0PiNdd6Q489kJ3vr6gMlCX7eTqj2KILdPKLBSk8LpUpO6FTTYxvRPCuppj6HpoquApXKlqT1EQgA/w9naC3mTu4X18YjFLquiuAj5HShehJEhEaAkHvqF8BVQBPkZqomnXovGV3KO7cYnhm2YsXRTuD1rCz6VapqKpAPPV6UoUm56/w+1vCXZopKEfn5WJ3dX9AQ0FQS57sWf+LTKz0wvn49U7bELlQ6CaiTMr7IiGNARYxXA6Ugc7EyZXOA2QkkFlAZ2JtmH7luIxwf6knnIWxXrdKz/COCCGet48Na7gNtNKnjBtuQYRZ4dwtGQdUy9C3joutpGx470a3up0wMMIa2yDxoEdBfGx56iYbcdAVXNKhvdIkrc8F9YVrKid6LhF9tn6VBMZoSp/QlX5ZmVc3KeJoPYLMrJ93pg1jEdTTxJpKl389Yh9rYx/Snw3P6H0wDDRP9JBfpda8wYlAv9fM8MBA/tS2FErK5YQM8vH8H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3NSa2FkT1E4Wis1WGxGcTQ0R1lQMHJMb3hLY0N5UUdiRXN1dXJjdklJUWZn?=
 =?utf-8?B?a2l2QXFFVVVRVnRsRkRJaUg2eEdVbllVY2FFSWJVZWlCQ1hLRkdkZHpnTGcw?=
 =?utf-8?B?R2srQ21zVzhNN0s2Y1R4a1NOZ1g2akswNFpGZDJWVVdWblBzTTZ5WDVPTklP?=
 =?utf-8?B?dWdiU2FCaDFFUTZEZjJnT2xRRWlFSlpPd1ltejNrRE81WU82UmJiSG5lWG1W?=
 =?utf-8?B?aU0wb0dzbXpzNG8ySVdwd01zNG5NNWJCU0pOZkVsVjlVaEpjM2luVnRYbnkr?=
 =?utf-8?B?L3orNm14Vy9sNDZZa2VHbG5SVmNYeEFydG5KTnN6RlBsM1pabkp5dm8vS0dr?=
 =?utf-8?B?UVQwOWU1NXVPZ2JmV3VYdnF0bDM1N24weUR3eG1DeHFHM0cwOHo4ZnJnYVNn?=
 =?utf-8?B?Q0dSZ01TQmVKc0wyeGlkZERKMkhKczBZU1E5Z2pQTEw5YmxYV0JTSG9Tamg4?=
 =?utf-8?B?dUtzV3ZqbS9ERFdVaEdQZmdjV2p6cmhIU0EvSXc3ZWtDTGxDWk00V3cwNE9B?=
 =?utf-8?B?M0ZtWjVRV0EzV2laZXNiV3lnWDFZYXkzUU9lQldZM2NRUFJ5RWlUcmJYRDVH?=
 =?utf-8?B?bEhCM2pIWVNQN1U3MXpHbzgxWXByTDNhOEY1cGxRSituWGU5VHJIZnduaWor?=
 =?utf-8?B?a2FBd3NQaDV6eUR4Uzc0VEN6b3J2a0VuNnU0eDBKQktVL2lJNXBlWm9kTVlC?=
 =?utf-8?B?Z0NXdWMrYVd4WlFCSXZpTFg3SGxOTURIRjhUNDA4cjF2Sy9EMEI0T2QwMjAr?=
 =?utf-8?B?YzNxdlhMbjc5UHdZSmh1clJsS0RsUEdEMC9LVzY1aE5ZcXN4QldOWXkwZVlF?=
 =?utf-8?B?bEdvSjZBSnJQRFY0WkJEdWo2MWtHVElhMm9vUzhxZXpvRlNuUHZFZlMwVWxm?=
 =?utf-8?B?aExzWDVQWGlqNXRjdXRzcGpmOXZqdjBGKzBtTktmODQ4dGJDc1ZhUEl5MTNn?=
 =?utf-8?B?U2xtUEtjc2Q5VDhzOG1yUlBGenRPelFRVEhFdG1zay9YendjcUVqR2JweHRM?=
 =?utf-8?B?cVg2TFdYakI1YTZ4aEU2cGFxYWVNMDU4dldLa042cCtCOVRlNDFYaStFNzhl?=
 =?utf-8?B?RWJLbkxoT1F5VkoxT3lkWDBoak5aVzlDTE4vOW84N2ZsdW52Q25kVmJUckpZ?=
 =?utf-8?B?R003cFNBTENrb2FsSEFyL2htZFI2RHlBZmYvVkZXT2gyZ08vRGVZNUxhcU9t?=
 =?utf-8?B?RTJFR1N4aXNRdkZ0Vi9odTdrZ1o3OEptd2FmSVgrS0xpeW1FSTNMRXJPQ2VH?=
 =?utf-8?B?L3BkYm9zekl2amhNbFN2T09GOVlnVVN4OUkwVGVMeUZ3Zy9YaXVYSy9HNFlW?=
 =?utf-8?B?NmxFSkNiWWFRMnlXeXhvWVpkRTM1d1pZV1p5VmxJKzBPckRKYlRIb21zdjJv?=
 =?utf-8?B?YXZCRDN2Y2ZpLzhZYUhyREVsZDhkYnFmTW1zZkF0NHNrVlBsSnJuSTJKK3F4?=
 =?utf-8?B?TkR6TzF0QThCWDVuTGN6UnJFaDlnMUJ2NFhaMFZ4eDdOU0lFVkVDOTM5ZHQz?=
 =?utf-8?B?UHhIUHlwdG54eG15eU84Y3h4c3BNRnlINWhBZ1cwZHZaUHhSdDk4YnhBY3Ja?=
 =?utf-8?B?N3hKUzdsaVNrSG9GbTN5NTJDN1g2dmFNQmhYZ1BWTnp3RnpxeEhXemk3dDls?=
 =?utf-8?B?cVN1UHExcWJNYnNjdFJYWFNxc1kvWm9JZmN5TDdBRFFHcHlETmw1UEpEbk9a?=
 =?utf-8?B?YU1GVjdLc1NnZ2FKQkc3UHltOXUxaFgxR3JOZGFEOExjTFhwdWJWTWc3TVlu?=
 =?utf-8?B?UlpocmVCZW9GcDcrWEhzMVoyaVZNUmpWZy8yR2RweDVLemVRZ2lBcFBTcTNv?=
 =?utf-8?B?QTFBVU5lc244d04weEQxVUFZWVJZVU9rZFo2R3oxSXU2aXJaaE92SmwvSFY1?=
 =?utf-8?B?dDhkcUlkdUJWQUNkTHpoamVkbWJ4NENpVUgxNFZ3UzFhbnRkNy9VUXpVQ2hC?=
 =?utf-8?B?MDJlMjJLdHZKc3grUDJFbUdGN1NrRnJKUGRseStzbHgzdWJ5VDgrQnBONkVj?=
 =?utf-8?B?SUlHMzhMVnovSTJ3dlZUcit4YVFKcE8rUVZWd3IvekZ1cm1ac0R6NTl2NldF?=
 =?utf-8?B?RExnUHVjYm95ZGY3aERPQythR3hJMHo1c0RIMWdVSVpOQXZsbFRsNFBVU2Nl?=
 =?utf-8?B?NHlKMktJQ01KUmNJU2tyK1lhMHJJMXQ5Z2tZUUYxOGZGYUJ2NUs3dElxaWRu?=
 =?utf-8?B?SjZYa3pTeThQR1RaMFlBaFFaRUlsR3lxWC83UkhkV3g1a2dBU2ZRL1ArR0dq?=
 =?utf-8?B?TUhNNkpqR1Ric1ptcVNKMWdHY0FhSUh3UXVpWTVtRGRydkQrV25BamJnT2dM?=
 =?utf-8?Q?KcFuP4GHm44m8gngco?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0206fa-32fc-4cde-e108-08de7dfe22e0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:05:59.5545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p78LOTnfZ9BQ3Slla7Uq5mG/FxZcw8WuDW8jlLX9mTUh0RGpxmUhcMAVWUEvdjR9FAEfdpVnS+j/JPTv6Fy3Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9009
X-Rspamd-Queue-Id: 2CBA923D6A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29066-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de,ew.tq-group.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Thu, 26 Feb 2026 16:38:49 +0100, Alexander Stein wrote:
> this series adds support for TQ's TQMa8QM. The first 2 patches are prepatory:
> 1. Add support for USB devices in cdns USB3 host controller, namely
> onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.
> 
> 2. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
> ("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
> on imx8qxp which just has one PCIe controller.
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
      commit: f21b3840141c3fb3cd469eca2dbb557b4f55210c

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


