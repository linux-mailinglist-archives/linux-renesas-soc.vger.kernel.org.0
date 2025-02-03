Return-Path: <linux-renesas-soc+bounces-12814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 745FFA25223
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2025 06:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DA0C162163
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2025 05:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C432AE86;
	Mon,  3 Feb 2025 05:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MBqvTuXs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6930184F;
	Mon,  3 Feb 2025 05:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738561646; cv=fail; b=l+MSiXWpXRIDea8dWI0NVt+9JsNvj2Z1vX5kIqpyFomB5nl8J3j2mAkt8wCWcvEgds5enGpGSiT+lqES4pTQsVMxcOoMtYGntHk8mDCjdVY5sfBezVC7UwhgqPsYqFQP0Auo7GGhQ2VsMrSodhcuTpr04L9URxSY8X3wZ+KuHPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738561646; c=relaxed/simple;
	bh=TmVfwAeUJcjiPMIMeDvPsazSiG7KBPv1eqrAjicbfHQ=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=Ha0gdQXKKaZQpqMgMRbROLE8TXgdoifhZ7yETz8tvAyTDVythCSPg3AJ9qULYK83pMsssUk+JmG0STTzMMc/wce1/wji3g+oYbssWsA0HzcfGq3FudCpplu2fVYkydxTAvwzhlaPJ6AmvCgOHnfxqhzdO8BB5XBLGPkCs5D+3uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MBqvTuXs; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bf9EakIvY+Jx/acIdz6/ReeImhHS2z1NabfntNEJCIPhMzGil/trbdHKO8zaJ74K0rq01CwolE2IMSBMLY9PGWKNgUX8pwN9Vx5OYhD/jFFqybGmCG3l/eRbKFVwfhyOCHDF2vVdXSgo3EgqnQRhHYbycAkkfHqVDapiYaY1Qu0DqfICJ9HerD45STHHIQoTRVwYIi5sgyi90chXam85RTMarWsfujzLvPk/+5YVDYdsiiFN88A3N8qd7n6ox1+qltwXr7l41+P17SpSH2OyvwZlzM/KLPP7SWa8fPsdG3MXGV0FN89ZidTxKAQLd9nZ5TpG0n7zpfGkITdKgCpI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ2H0rf0KqScwvLAGZcfnvmLsBmBJD6TOpqk73ZJpuE=;
 b=rJG256Fy8WTLLzCvPo51W//cVJI0GsWBvqALU82vWMnNwXpXSTV37qQH8Rs2ame+dEkqjMS2YD/96Ksxt69O9pJ0roADgrtSaoTCAM+Mc485Le6SdVQrgcJ++gZc92uH/xVzrwrF7InxVzr8skCILas5drvmyRA5n6uW2+MZVVPzzGiJithdqhcHjXpAqrhs4R/nMONDJwJoJVJYqVWIULSV8EHwH8rSvLA+oaORblHZ3RckKYNwEXb0L7CmwFwOwDW0gw0odvBq7DHZDRM++01/XylNuIQZkaMt4O+v53ccFtHDuFoL9lt4rIWYgZBN4ydCnryCaEBdBoY8APArKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ2H0rf0KqScwvLAGZcfnvmLsBmBJD6TOpqk73ZJpuE=;
 b=MBqvTuXsDdfRLxM8HqBvxxGjJ9oaS4XCUTpgFu4ZWMftrta/WUO3Erv2NTDlluEcfRoPqASXFckNrSKVdPyap88QKC4USjAneTHmnIma0yn4ZdjGZ+Jw+6t5TAWxesdIw6Uv0S/CJ4GwRNnKXmpc7UI6WSTTFemxQRFBJg6kMQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12746.jpnprd01.prod.outlook.com
 (2603:1096:405:15f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 05:47:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 05:47:19 +0000
Message-ID: <875xlrshp5.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: dts: renesas: ulcb/kf: Use TDM Split Mode for capture
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 05:47:19 +0000
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12746:EE_
X-MS-Office365-Filtering-Correlation-Id: 4620ba2b-8796-498c-6739-08dd441638ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fNWneN/gZtxN260bATj5MP3SZngSY4vQKwRnMI42erBcKbk7ARbNo4Z/zkE1?=
 =?us-ascii?Q?2foEDy812BdH6/7arKR9ZapSS47GO59BgZFBpJIpLXlBkhGIxnMilGZ7BQ5x?=
 =?us-ascii?Q?RuITmXfWUlNy8Zm4hCFpusBPkFoQMomkm7gUpw8kzzOt0bRNdtsPlJCg1D/l?=
 =?us-ascii?Q?VR7wYV5Lk6GjyWUTfsNcktkYZw2EE/lK0J6Fs3rh6qh6Oc/Cjd6zY9Ge4Ol9?=
 =?us-ascii?Q?Gcm/mLqc2NK/pFFE8GEinB1Q9RmbH0PrvyCB8PTCp6pRGpalP4sm2L6Zdox1?=
 =?us-ascii?Q?91OlZjt9s33HEvDXeMrkmaK2AAa/qJ2vAtF/UoI4/mtVdLdO4ofPBrJ1UkWk?=
 =?us-ascii?Q?vaT9Nd0uITMMRNktftrNovFMZ3CQU3QDhWzsq/7XUGJtVLvI/ATcXYH5fyDy?=
 =?us-ascii?Q?mmT1xDw2QShS3T7TSHybj5vPEXI0g21ynraV/CtM0DaOM2gMAhmrrijhTUG1?=
 =?us-ascii?Q?YB85So7sN/Dj3Rp3JA/yKA4dLZf16861EyOvJyHlGo2R9fyKanla9nyfXrs1?=
 =?us-ascii?Q?xr5rCGWGsB7p8OaF6b3y8+0+z93l/25hg4ngDZX39Oi3Sd1/FGmGb/oJ2teQ?=
 =?us-ascii?Q?O3Tjl10pshN5R9RMtEoDsnn/q67/zDuxQdqAX/iCSz1O9RPRkZF5eA/md3Mi?=
 =?us-ascii?Q?SLqSMks+Yfxbs4Fm1BrBy4LVTxJ86P//rNanGbCvjZKyWE3A1FaP6izEQH4H?=
 =?us-ascii?Q?S3VM6iT1kP6w2qfWw3cndN4GI3HoNHGZnTosuDLqu8yjx1UGvYW8cKTvkzb0?=
 =?us-ascii?Q?GC8nuyTY9o6xHuVhNVN8XatvPProo4qgHvtwwzmmk936tLp/d7u+PVAZZ96c?=
 =?us-ascii?Q?IYQ4qxs80Nzc97Ygc+78n/TGmyAo1FMLYni1xe8DQ22gYDhlCFDua50Lq1RX?=
 =?us-ascii?Q?F7S3bWV1eYXr0FCcygnIDd/4w/nbk6VhIjf+KDtrjPoaM9iltd5LFxA3ZUey?=
 =?us-ascii?Q?1d3M5JKkQIkry3nsl7ukV6dK2OT7qy5F1yrwzMGAJDqoWkipfdsNJtdRw6n+?=
 =?us-ascii?Q?bkWgFCfF8xTl0htykE45AJ8S1iZb2BJYAW74AGz8nb8jBmXKtWyFvxnXDwk5?=
 =?us-ascii?Q?vcju2/axpnVMxd708tOxncuM+NYYcRlK7bx2BeEbX2ARNUKz1DwTXoHHrupP?=
 =?us-ascii?Q?+FL9E23rWV5apewWX3bzN1Jdk53VykwAzqoz7cev88Ns8Cpm7QLnXIkaHQEa?=
 =?us-ascii?Q?/CZm9/SPc0gbZJPC7lu5LCU9AQfXAbNeQPl5vnt6tU8pPVEEl9cNO/2XMMxe?=
 =?us-ascii?Q?KYJPaCqLIjy/YSet8uyM02ABj6QqlkvayrUOQzNqTrdkWcK/0QTdHozgjl6H?=
 =?us-ascii?Q?lIeAm7h9jElSXEpvuECyhB5uoK+oVaeAawncL8uHTAp0tO2mqHKWaBYmDgs4?=
 =?us-ascii?Q?fRVa//p8SysUJ0EfIq5aaGHuKmgRN8MIjn5QdAzWSFNmab4StgtMxkcrASWg?=
 =?us-ascii?Q?NFruJBDJdUZSDPgBmCe+ss0bSK4tj+rv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ogIywFVNkDmT0+p6B+Q6ZPUKsro37IiLvC4w7SOlhSHbLgmfNsNbsb3jUC36?=
 =?us-ascii?Q?9mve0lWamPWjpGalnYT2G9/+n7wQbFIWYLhdZVgBnNUzE8coJlFAR6z8/XXP?=
 =?us-ascii?Q?C+38QClaSWNyxr+8t3Q8J2X3wLrPEIhRmZxm/QyPzTqcrwvdcg0iW58ERKZf?=
 =?us-ascii?Q?LQVKTwwCaMrHQLvMUtuiLpXnBTLhnmOj0HIRUZuOOyQ8Cmg4/GJ1rjz0v21+?=
 =?us-ascii?Q?MXQOZKtUACWuu5EMyYmfvTYD0w0WiQgjjzhZd5gORvEaNqRDm0CiwfIWZ/WU?=
 =?us-ascii?Q?a53JvKaNeZ1HNh7YRJMi02H0udzET5zBpJTYiZjJbZix6V0akgmPAqQE2tGh?=
 =?us-ascii?Q?uTgZT6vC1lDH12WwF+6k+Ah67LCW0oaRqhoFzmIhnGF/NW3yX4s0hIv+oc6B?=
 =?us-ascii?Q?KHZ5j5o8R3DGsW4EgBU1AUy/rXI3TmxaxekCNZKozNn1Wdcgmcc/iMCzaadg?=
 =?us-ascii?Q?Qi1aFVjo5dTMtkE20rMDOoQNDuCBRIDiq1rq91dV7s3A3XgFD8bPUqwHwt9n?=
 =?us-ascii?Q?bWzr29+Tb03Tfodcf5nhqc0scI5MMHzViMe9yEaWr8nAKPE3LkmeYYZSQNYo?=
 =?us-ascii?Q?nz8ACHNxvG1vUhhcXyODKCNJsKttUxv23W7/b5WS9IkgiA53SEc7G/7EFusD?=
 =?us-ascii?Q?jpbTYYB8UeVUr9c+YIE+K9VzOEWZXgOsC3itZoY7++CZ3r86KAALkH8i0dUu?=
 =?us-ascii?Q?QzjAM72Zek803ofbW/CXSQd1JhhNlqUm0hQEXNgilJWZzxnf4sAqI9T05i7i?=
 =?us-ascii?Q?s+SpPbA77FoOlVLEMVXFXaCZtZ8bXn7P+/gwcC+Pg1jhpMj+RvywJjIHFeSD?=
 =?us-ascii?Q?WhIyA1TAf7M+OZXeowJa6+aaEFn2OC6SDGQLiPEtW1N+Eib+FUf65YM/LgNY?=
 =?us-ascii?Q?PFlpPq1/QwBtaGJHTspkwrhzAYMLd9/VvWG98hfIuFbzWP7aX4O0hdCfUY8R?=
 =?us-ascii?Q?M9NZxbRn7PTL5FmoeFwEPJaXIg+sLX8of1Mg81rVNT0r7a61iqs9Fyd9Evgq?=
 =?us-ascii?Q?QVGlnwqdNUJ44HeVzDOKOOgAyoo+n4E/aKnYZnXs/Z6O+P/9kMw3A52ouE8c?=
 =?us-ascii?Q?mW3DCTqF/nBJq1fom+xWXc4N1I/WyeNdFt4CsQ81KwizDM4SceLIar7+mr52?=
 =?us-ascii?Q?PyGST5qw85ocUIumqU+q4hKvkaGJgMCvhKVpnXGZB6lFbgGTMLfPq+aeLLI9?=
 =?us-ascii?Q?OwCs7+XKaxWww97xAciYctk+mwkGoemnsXf1Txei5daIcmaxbOvWfKxbd9ww?=
 =?us-ascii?Q?r5NCU7PRx/4y6qa3cN3ZASBHgMn/5Lp4AychiShdbbnjG0uDsPUQBfwbBqqJ?=
 =?us-ascii?Q?incgPygEmD4HHF3BlvxC8PPqzzQ8C11PlIKA1i6CKm2S02FzEjmt/vdsO2NK?=
 =?us-ascii?Q?YUL2oEhDQKW1Bxdqu1mS2EeGa0HcxUToexgBhdD+LbQIkcLGh01oIhjN+uJV?=
 =?us-ascii?Q?j+eXtxKkChpOwqof/3s0W64qkCWvJ1sB/GT/gAufKQKBUHqMa60vCeBKrp22?=
 =?us-ascii?Q?FtJRqAMIBTTwfEP0tmaU8tEZbABz3gW0bNwzRoC+MEd+M3xwjSe7ice2JFJx?=
 =?us-ascii?Q?rRefnjE2/t8VfonCOnH2E6zwAvon2uB4exSn4Btx0MVUdeA9xYi1NZnVf1xZ?=
 =?us-ascii?Q?QN1Y7FEf5VP61kpAY606tvc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4620ba2b-8796-498c-6739-08dd441638ed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 05:47:19.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH3AX882IhjNSHcVLub19mW90Ipo31Vv87gNgJ7RESKnEcqAGocdtIRxuTKSTD2HvOzEHRO3klbXJdFpSYtpPhAcv5foZ9VtCcL4cVlqdPzaiZ6FaY+twyj7Kw72gyVV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12746

Current ulcb/kf of -mix+split.dtsi is using TDM Split Mode, but only for
playback. Use TDM Split Mode on capture too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../ulcb-kf-audio-graph-card-mix+split.dtsi   | 73 ++++++++++++++++---
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi  | 66 ++++++++++++++---
 .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 53 ++++++++++++--
 3 files changed, 166 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
index 8ae6af1af0949..4caa0281a687e 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
@@ -15,7 +15,9 @@
  *	(D) CPU3 (2ch)  --/			   (TDM-1 : 2,3ch)
  *	(E) CPU4 (2ch)  --/			   (TDM-2 : 4,5ch)
  *	(F) CPU5 (2ch)  --/			   (TDM-3 : 6,7ch)
- *	(G) CPU6 (6ch) <----  (6ch) (Z) PCM3168A-c
+ *	(G) CPU6 (2ch) <----  (6ch) (Z) PCM3168A-c (TDM-a: 0,1ch)
+ *	(H) CPU7 (2ch) <--/			   (TDM-b: 2,3ch)
+ *	(I) CPU8 (2ch) <--/			   (TDM-c: 4,5ch)
  *
  *	(A) aplay   -D plughw:0,0 xxx.wav (MIX-0)
  *	(B) aplay   -D plughw:0,1 xxx.wav (MIX-1)
@@ -25,7 +27,9 @@
  *	(F) aplay   -D plughw:1,3 xxx.wav (TDM-3)
  *
  *	(A) arecord -D plughw:0,0 xxx.wav
- *	(G) arecord -D plughw:1,4 xxx.wav
+ *	(G) arecord -D plughw:1,4 xxx.wav (TDM-a)
+ *	(H) arecord -D plughw:1,5 xxx.wav (TDM-b)
+ *	(I) arecord -D plughw:1,6 xxx.wav (TDM-c)
  */
 / {
 	sound_card_kf: expand-sound {
@@ -35,13 +39,18 @@ sound_card_kf: expand-sound {
 		routing = "pcm3168a Playback", "DAI2 Playback",
 			  "pcm3168a Playback", "DAI3 Playback",
 			  "pcm3168a Playback", "DAI4 Playback",
-			  "pcm3168a Playback", "DAI5 Playback";
+			  "pcm3168a Playback", "DAI5 Playback",
+			  "DAI6 Capture", "pcm3168a Capture",
+			  "DAI7 Capture", "pcm3168a Capture",
+			  "DAI8 Capture", "pcm3168a Capture";
 
 		dais = <&snd_kf1 /* (C) CPU2 */
 			&snd_kf2 /* (D) CPU3 */
 			&snd_kf3 /* (E) CPU4 */
 			&snd_kf4 /* (F) CPU5 */
-			&snd_kf5 /* (G) GPU6 */
+			&snd_kf5 /* (G) CPU6 */
+			&snd_kf6 /* (H) CPU7 */
+			&snd_kf7 /* (I) CPU8 */
 		>;
 	};
 };
@@ -50,7 +59,9 @@ &pcm3168a {
 	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
+
 		mclk-fs = <512>;
+		prefix = "pcm3168a";
 
 		/*
 		 * (Y) PCM3168A-p
@@ -59,7 +70,6 @@ port@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-			prefix = "pcm3168a";
 			convert-channels = <8>; /* to 8ch TDM */
 
 			/* (C) CPU2 -> (Y) PCM3168A-p */
@@ -91,10 +101,28 @@ pcm3168a_endpoint_p4: endpoint@3 {
 		 * (Z) PCM3168A-c
 		 */
 		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			reg = <1>;
+
+			convert-channels = <6>; /* to 6ch TDM */
+
 			/* (G) CPU6 <- PCM3168A-c */
-			pcm3168a_endpoint_c: endpoint {
-				remote-endpoint = <&rsnd_for_pcm3168a_capture>;
+			pcm3168a_endpoint_c1: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&rsnd_for_pcm3168a_capture1>;
+				clocks = <&clksndsel>;
+			};
+			/* (H) CPU7 <- PCM3168A-c */
+			pcm3168a_endpoint_c2: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&rsnd_for_pcm3168a_capture2>;
+				clocks = <&clksndsel>;
+			};
+			/* (I) CPU8 <- PCM3168A-c */
+			pcm3168a_endpoint_c3: endpoint@2 {
+				reg = <2>;
+				remote-endpoint = <&rsnd_for_pcm3168a_capture3>;
 				clocks = <&clksndsel>;
 			};
 		};
@@ -160,12 +188,35 @@ rsnd_for_pcm3168a_play4: endpoint {
 		 */
 		snd_kf5: port@6 {
 			reg = <6>;
-			rsnd_for_pcm3168a_capture: endpoint {
-				remote-endpoint = <&pcm3168a_endpoint_c>;
+			rsnd_for_pcm3168a_capture1: endpoint {
+				remote-endpoint = <&pcm3168a_endpoint_c1>;
+				bitclock-master;
+				frame-master;
+				capture = <&ssiu40 &ssi4>;
+			};
+		};
+		/*
+		 * (H) CPU7
+		 */
+		snd_kf6: port@7 {
+			reg = <7>;
+			rsnd_for_pcm3168a_capture2: endpoint {
+				remote-endpoint = <&pcm3168a_endpoint_c2>;
+				bitclock-master;
+				frame-master;
+				capture = <&ssiu41 &ssi4>;
+			};
+		};
+		/*
+		 * (I) CPU8
+		 */
+		snd_kf7: port@8 {
+			reg = <8>;
+			rsnd_for_pcm3168a_capture3: endpoint {
+				remote-endpoint = <&pcm3168a_endpoint_c3>;
 				bitclock-master;
 				frame-master;
-				dai-tdm-slot-num = <6>;
-				capture  = <&ssi4>;
+				capture = <&ssiu42 &ssi4>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
index 4cf632bc46215..67a0057a3383d 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
@@ -15,7 +15,9 @@
  *	(D) CPU2 (2ch)  --/			   (TDM-1 : 2,3ch)
  *	(E) CPU4 (2ch)  --/			   (TDM-2 : 4,5ch)
  *	(F) CPU5 (2ch)  --/			   (TDM-3 : 6,7ch)
- *	(G) CPU6 (6ch) <----  (6ch) (Z)	PCM3168A-c
+ *	(G) CPU6 (2ch) <----  (6ch) (Z) PCM3168A-c (TDM-a: 0,1ch)
+ *	(H) CPU7 (2ch) <--/			   (TDM-b: 2,3ch)
+ *	(I) CPU8 (2ch) <--/			   (TDM-c: 4,5ch)
  *
  *	(A) aplay   -D plughw:0,0 xxx.wav (MIX-0)
  *	(B) aplay   -D plughw:0,1 xxx.wav (MIX-1)
@@ -25,7 +27,9 @@
  *	(F) aplay   -D plughw:1,3 xxx.wav (TDM-3)
  *
  *	(A) arecord -D plughw:0,0 xxx.wav
- *	(G) arecord -D plughw:1,4 xxx.wav
+ *	(G) arecord -D plughw:1,4 xxx.wav (TDM-a)
+ *	(H) arecord -D plughw:1,5 xxx.wav (TDM-b)
+ *	(I) arecord -D plughw:1,6 xxx.wav (TDM-c)
  */
 / {
 	sound_card_kf: expand-sound {
@@ -36,19 +40,25 @@ sound_card_kf: expand-sound {
 			  "pcm3168a Playback", "DAI3 Playback",
 			  "pcm3168a Playback", "DAI4 Playback",
 			  "pcm3168a Playback", "DAI5 Playback",
-			  "DAI6 Capture",      "pcm3168a Capture";
+			  "DAI6 Capture",      "pcm3168a Capture",
+			  "DAI7 Capture",      "pcm3168a Capture",
+			  "DAI8 Capture",      "pcm3168a Capture";
 
 		links = <&fe_c		/* (C) CPU2	  */
 			 &fe_d		/* (D) CPU3	  */
 			 &fe_e		/* (E) CPU4	  */
 			 &fe_f		/* (F) CPU5	  */
-			 &rsnd_g	/* (G) CPU6	  */
+			 &fe_g		/* (G) CPU6	  */
+			 &fe_h		/* (H) CPU7	  */
+			 &fe_i		/* (I) CPU8	  */
 			 &be_y		/* (Y) PCM3168A-p */
+			 &be_z		/* (Z) PCM3168A-c */
 		>;
 
-		dpcm {
+		dpcm: dpcm {
 			#address-cells = <1>;
 			#size-cells = <0>;
+			non-supplier;
 
 			ports@0 {
 				#address-cells = <1>;
@@ -62,21 +72,32 @@ ports@0 {
 				 * (D) CPU3
 				 * (E) CPU4
 				 * (F) CPU5
+				 * (G) CPU6
+				 * (H) CPU7
+				 * (I) CPU8
 				 */
 			fe_c:	port@2 { reg = <2>; fe_c_ep: endpoint { remote-endpoint = <&rsnd_c_ep>; }; };
 			fe_d:	port@3 { reg = <3>; fe_d_ep: endpoint { remote-endpoint = <&rsnd_d_ep>; }; };
 			fe_e:	port@4 { reg = <4>; fe_e_ep: endpoint { remote-endpoint = <&rsnd_e_ep>; }; };
 			fe_f:	port@5 { reg = <5>; fe_f_ep: endpoint { remote-endpoint = <&rsnd_f_ep>; }; };
+
+			fe_g:	port@6 { reg = <6>; fe_g_ep: endpoint { remote-endpoint = <&rsnd_g_ep>; }; };
+			fe_h:	port@7 { reg = <7>; fe_h_ep: endpoint { remote-endpoint = <&rsnd_h_ep>; }; };
+			fe_i:	port@8 { reg = <8>; fe_i_ep: endpoint { remote-endpoint = <&rsnd_i_ep>; }; };
 			};
 
 			ports@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <1>;
 				/*
 				 * BE
 				 *
 				 * (Y) PCM3168A-p
+				 * (Z) PCM3168A-c
 				 */
-			be_y:	port { be_y_ep: endpoint { remote-endpoint = <&pcm3168a_y_ep>; }; };
+			be_y:	port@0 { reg = <0>; be_y_ep: endpoint { remote-endpoint = <&pcm3168a_y_ep>; }; };
+			be_z:	port@1 { reg = <1>; be_z_ep: endpoint { remote-endpoint = <&pcm3168a_z_ep>; }; };
 			};
 		};
 	};
@@ -106,8 +127,9 @@ pcm3168a_y_ep: endpoint {
 		 */
 		port@1 {
 			reg = <1>;
+			convert-channels = <6>; /* to 6ch TDM */
 			pcm3168a_z_ep: endpoint {
-				remote-endpoint = <&rsnd_g_ep>;
+				remote-endpoint = <&be_z_ep>;
 				clocks = <&clksndsel>;
 			};
 		};
@@ -171,13 +193,37 @@ rsnd_f_ep: endpoint {
 		/*
 		 * (G) CPU6
 		 */
-		rsnd_g: port@6 {
+		port@6 {
 			reg = <6>;
 			rsnd_g_ep: endpoint {
-				remote-endpoint = <&pcm3168a_z_ep>;
+				remote-endpoint = <&fe_g_ep>;
+				bitclock-master;
+				frame-master;
+				capture = <&ssiu40 &ssi4>;
+			};
+		};
+		/*
+		 * (H) CPU7
+		 */
+		port@7 {
+			reg = <7>;
+			rsnd_h_ep: endpoint {
+				remote-endpoint = <&fe_h_ep>;
+				bitclock-master;
+				frame-master;
+				capture = <&ssiu41 &ssi4>;
+			};
+		};
+		/*
+		 * (I) CPU8
+		 */
+		port@8 {
+			reg = <8>;
+			rsnd_i_ep: endpoint {
+				remote-endpoint = <&fe_i_ep>;
 				bitclock-master;
 				frame-master;
-				capture = <&ssi4>;
+				capture = <&ssiu42 &ssi4>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
index f01d91aaadf3b..fd75801c329e8 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
@@ -15,7 +15,9 @@
  *	(D) CPU2 (2ch)  --/			   (TDM-1 : 2,3ch)
  *	(E) CPU4 (2ch)  --/			   (TDM-2 : 4,5ch)
  *	(F) CPU5 (2ch)  --/			   (TDM-3 : 6,7ch)
- *	(G) CPU6 (6ch) <----  (6ch) (Z)	PCM3168A-c
+ *	(G) CPU6 (2ch) <----  (6ch) (Z) PCM3168A-c (TDM-a: 0,1ch)
+ *	(H) CPU7 (2ch) <--/			   (TDM-b: 2,3ch)
+ *	(I) CPU8 (2ch) <--/			   (TDM-c: 4,5ch)
  *
  *	(A) aplay   -D plughw:0,0 xxx.wav (MIX-0)
  *	(B) aplay   -D plughw:0,1 xxx.wav (MIX-1)
@@ -25,7 +27,9 @@
  *	(F) aplay   -D plughw:1,3 xxx.wav (TDM-3)
  *
  *	(A) arecord -D plughw:0,0 xxx.wav
- *	(G) arecord -D plughw:1,4 xxx.wav
+ *	(G) arecord -D plughw:1,4 xxx.wav (TDM-a)
+ *	(H) arecord -D plughw:1,5 xxx.wav (TDM-b)
+ *	(I) arecord -D plughw:1,6 xxx.wav (TDM-c)
  */
 
 / {
@@ -39,7 +43,10 @@ sound_card_kf: expand-sound {
 		simple-audio-card,routing = "pcm3168a Playback", "DAI2 Playback",
 					    "pcm3168a Playback", "DAI3 Playback",
 					    "pcm3168a Playback", "DAI4 Playback",
-					    "pcm3168a Playback", "DAI5 Playback";
+					    "pcm3168a Playback", "DAI5 Playback",
+					    "DAI6 Capture",      "pcm3168a Capture",
+					    "DAI7 Capture",      "pcm3168a Capture",
+					    "DAI8 Capture",      "pcm3168a Capture";
 
 		simple-audio-card,dai-link@0 {
 			#address-cells = <1>;
@@ -88,15 +95,39 @@ codec {
 		};
 
 		simple-audio-card,dai-link@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			reg = <1>;
+			convert-channels = <6>; /* to 6ch TDM */
+
 			/*
 			 * (G) CPU6
 			 */
-			cpu {
+			cpu@0 {
+				reg = <0>;
 				bitclock-master;
 				frame-master;
 				sound-dai = <&rcar_sound 6>;
 			};
+			/*
+			 * (H) CPU7
+			 */
+			cpu@1 {
+				reg = <1>;
+				bitclock-master;
+				frame-master;
+				sound-dai = <&rcar_sound 7>;
+			};
+			/*
+			 * (I) CPU8
+			 */
+			cpu@2 {
+				reg = <2>;
+				bitclock-master;
+				frame-master;
+				sound-dai = <&rcar_sound 8>;
+			};
+
 			/*
 			 * (Z) PCM3168A-c
 			 */
@@ -151,7 +182,19 @@ dai5 {
 		 * (G) CPU6
 		 */
 		dai6 {
-			capture = <&ssi4>;
+			capture = <&ssiu40 &ssi4>;
+		};
+		/*
+		 * (H) CPU7
+		 */
+		dai7 {
+			capture = <&ssiu41 &ssi4>;
+		};
+		/*
+		 * (I) CPU8
+		 */
+		dai8 {
+			capture = <&ssiu42 &ssi4>;
 		};
 	};
 };
-- 
2.43.0


