Return-Path: <linux-renesas-soc+bounces-21893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3FB58BF4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 04:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC741BC3BB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0763A22F386;
	Tue, 16 Sep 2025 02:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="orhVDQNg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A48B1E00B4;
	Tue, 16 Sep 2025 02:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990334; cv=fail; b=n+uOPPFwRLGoTUPTOpRFhN3UKCT2k0n4fItHkLis9l1DJGOvZSVRSjAmxey2/hpUqjk23xnB0DHZG2KostCCJ3wrNpyIXIDF05UWbRseoEOd297jHuNzS0pCZA2xxAyFDVxHpT6wB008m3oHLYUhbFIEENy24Nw6woMQVZloe6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990334; c=relaxed/simple;
	bh=KwcdxBH9KXRXUJGwbEPLiTvjT1JJ+tqahfj5sjpaYFM=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=WOOSXgXyhL3x1W140WysBo5vdMcqr9WMIZ/5eCDa9LU3NodwDPPF/uIu7NHW0ITHQ2rwtYiS4hGzJP2Q7nEugGIlAhRCEuYV4xC/YvSTLjTo8YpAW3ILMD8x9aJUpI2kKgvGMvZCfZLVhfcNwffSS3UBE+25lv3nK/4SvVd0mM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=orhVDQNg; arc=fail smtp.client-ip=52.101.125.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjTz6pCyqredTxfBfMuN2hoxI0C7z5W47t5a/pS0VWdsN4YwIoRI6A1k729oiyZ8TpkrHnIDT3ydl0uqyhf0K5dnXOxpRLEFOi/HovpgeSVcQy2FtF2lHpeuaCaFi3o0nnR+RDFTNfLWuJD0/zjSsKSklKaKZd7RUHbFaQA9nVjZY+3biz/z3jhQLlaT/kcj6vTaNltk+u5rIL/l4CddgGqaSVXm8fQz3Q/vZ4h7G8wYOYn83U4NnqBWgyXSzdiFMhBuTk+OZckVp3v+aX7GHo1qb0VCFB3AqNYPuQKq4zbCiXeOniBdQ4Xdvtlr9Xze7jpPJPZFk43gnAv/gsHSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAO/52F2trbHHmkF4996sCxhcjBhSp9d4Xj52pYkVbE=;
 b=FOtTAbATF/oQLyzDnUHFZqlnEVGshFqg3hMjRoyD+UzzMRe9nIOUxkZ33Bok+BMq8rHb+3BZiXz7Etbivc32MxrK4olWtKLMQTzGceFXkbbCbZcu5z0c9hu8+VMRO5/v25sf2sTPnCfZZahYpzJCbh2zF6mFvcTVA2DJfXgvCFuKJM6biFdVPy3Hdco8ftuNNYn/xJWRNmcYL1bZ/LyomQqGPmUfw/ZEyKIcjy2SizZUkTe0lzw8ydBfoNW/kuMeJjCWAhpA085RcsrD2J/Mq8LPHzlR+C0jrDcQBtXExKhVp4Qk/c48MTVK5aidRW9mZUAvdtqvN3c1TWr8ZHz7Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAO/52F2trbHHmkF4996sCxhcjBhSp9d4Xj52pYkVbE=;
 b=orhVDQNgfVgd8W+eCmyLSllrNH9i/XaEWIiy3sE+WtKhlhsMjphSfQTsrPb0yspeHWUCzo/+uflASCrSW+9UTgL6egSHejSGC2JQ80aliXIXqygCaHmEIeVFaxw66eLmUHYvK8CfXhTb7sHd3BDvZvSbn0Val5fwAmosDf8lzR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12661.jpnprd01.prod.outlook.com
 (2603:1096:405:15f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 02:38:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 02:38:48 +0000
Message-ID: <87ms6vi0js.wl-kuninori.morimoto.gx@renesas.com>
To: "Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
In-Reply-To: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 5/6] arm64: dts: renesas: Add R8A78000 X5H DTs
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Sep 2025 02:38:47 +0000
X-ClientProxiedBy: TYCP286CA0374.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12661:EE_
X-MS-Office365-Filtering-Correlation-Id: c23d615c-064c-4da4-ba20-08ddf4ca29f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rasFRuGq+1hkRxvxX5J5MncKfjCFSz/OD9zBDrW/c/EkXAKKn1Rm+J1M22PK?=
 =?us-ascii?Q?AVQmD8A2i/vKCBuQP2OS8bQOFz0AN3yOyrJR/dR45qoBeObEhUM4AihtiUcW?=
 =?us-ascii?Q?OXe8pOrYabF6NS4pItmFZ5CCjVNV5BTlRF7UUR8WivGXyBB171QODQ5nGSry?=
 =?us-ascii?Q?DwATJ1jXa7fU7b/FdsqsEALhnuw1cj/PeaFjR/GzpnnHjKn8Pv+2XIV+3y8A?=
 =?us-ascii?Q?4b1aHObZ66pLnIAUJhBaMqD/4r4C4eR7dtIz9NzEtti+/ewwvyBRXe5zWaXj?=
 =?us-ascii?Q?9c6OVJb0lEspt2IBQNwGi7X5nEWR8sqqFqw9TKTtpcp5eMQgJIOOQ0UMpRYT?=
 =?us-ascii?Q?lcA25HQ5PAzjSKIbYmmI2u+6s9Ck+ck07PhikS8P20NTB8VV66PHGzfXf+jA?=
 =?us-ascii?Q?iyx888CG9r9cXwn0bbDjKm3QJe5w2f8DHmmEKCtXdNwhIHWKlfX3kLA6o9NL?=
 =?us-ascii?Q?TKtD9TY6fa7zWcZaC+KaJlGACpgPGPOF1xwh8Rkp0GJcyioO5UX7sd7HKEvU?=
 =?us-ascii?Q?59KT+IGN56HKNBR1fSuEnyLp2Ve8/Nmgky5sPsXbAB9Xwd9zuSgD+NaOxkIR?=
 =?us-ascii?Q?Jijbd7ftDZUaRFtfsdjeTaLPwr025xVmdxIMyOWHXTFxFLYEwcha+82kBebU?=
 =?us-ascii?Q?eribs9bbNO26Nb1WZzTMHl8s2hl4pXFB92IXemkn0Mwi4PtKE6aATg89XdnJ?=
 =?us-ascii?Q?ZjZgzKjTcr8V9xKSKLatww1CYzhhxufcSlttmR9O0mpDjBSwykcFQiA20g5/?=
 =?us-ascii?Q?9rL35JNtrJZoAvZ8XPkMs5CloMiIp757cJQUk+VnU1gmufcWUiTk9xbLJN1v?=
 =?us-ascii?Q?+UjfftHif15EoX6/W8PfGsSfg/4TPNOXGqQ28ivwC35MzfjM0NAY9n5Xli/G?=
 =?us-ascii?Q?jGkt3R81df/omvs0WC3vXSiTORmpUZold/wGB3NMgKQzN8DvXjWDulsvReIA?=
 =?us-ascii?Q?NZqaA3MqVtSToHOfp55vvud0kPgE3sJDmevWAdW7aEAFHwKMblB4QrBRDosI?=
 =?us-ascii?Q?/4toVCLzkWGq+cs3pp/yceaJJPnYHm84CiU8c+sf1vpvGxiK78REP0KWaaxJ?=
 =?us-ascii?Q?g+LlG0MqwqcJ8QR+SYKAuMfFY29ygc/Og/yzaie8muzWeY29btl8nYIs+G6Y?=
 =?us-ascii?Q?N3jS2Fekv5JpwavBCs0HabF+577Q3sJ2l1G5NgF+hVqArfdG4jmNs1MRNsyZ?=
 =?us-ascii?Q?GEAUs50rtZdeHJC+2bGDden1R+wx4oJbv7d3VWQ2nfoFJhyPO//daPhy2s6B?=
 =?us-ascii?Q?xeXsNFTVJSXaRRWoeYiqMrfZSBIf0fQMxjH27FKAjZGk9PnZcA+x8MmNGK0y?=
 =?us-ascii?Q?F6sQuBfhXDAn746c3qbUKrHWeegyiQPsxmC1pU1l0R4mWbDh96qOL2y07hhF?=
 =?us-ascii?Q?JaJ3hxS98aZSU5+jT1ZTvPG/R0NCDaO0BPymfyqz49R06As+nh99X/bL9gQA?=
 =?us-ascii?Q?otbakDkbl26jAu2GPrbQrIf+gLGBQba1AP+btTLt1EOHFfnBXzHKwmrt5kxX?=
 =?us-ascii?Q?40xmgesWZL01OW8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VmUX7RysBy+iditAWWPqwMtqBInpsFkmOK8Cc9m0jccsFA7cq6ourEE4gMKX?=
 =?us-ascii?Q?T8om3cNqe/eoICTqk5iO2nDjyOM8FyugpeVHjVpV1UCL/HRoQFFpAI2GI8Ft?=
 =?us-ascii?Q?Jd3PUjvfGKTVAP8DDw1T5P9EVW3lUtSHCrKJ05WwLOr78lEBwZcWIKF8JC1S?=
 =?us-ascii?Q?yp3k40y8i/vB/IZDmfKCgsXZl41vWhEn9RGyBh7dwq1mKJqmW24xLE0DJUkt?=
 =?us-ascii?Q?2yqZzmkRKP2hxyDZR4RfeAppoptvvWbMKKbdXH0+jF2+1wShfBR/CYoTg8zs?=
 =?us-ascii?Q?eJ43bdtysGq2DrgRUsJw/k3GmGzSS0apI+RWyT5zp+AKjgX+0P1hEoHYoZnU?=
 =?us-ascii?Q?bp8D/DMGNsNZ9lNIDOlaiEL4z+8cip+QJDxc1FVw3aXCFMqPuH0YjCeqzkOu?=
 =?us-ascii?Q?jYejPHmBL6Bz4pwFzsXRPdgLAn3VMehOLWmKkUwBtUZoswpquVVNesNbGfnx?=
 =?us-ascii?Q?NOPUkI9mj7vRk5e9vyLyfTd52H7kNkWFCodRBvDRxnz3+wwYi1ukzKO8OP7r?=
 =?us-ascii?Q?ff5GXD6PyxEcylnvMSm6SvVdcZv7hy4nAjSbq7zRuGbvLpLEnuk3Q7q7e1wi?=
 =?us-ascii?Q?Z5LoPwfBw/bTJdmtzQkZimtnQTrX4hJgPbHFGXXaEDcpyEZ9t9sJtzsia40+?=
 =?us-ascii?Q?h2WHRfsyZZXKAlzUxNyYz5HvB2r5zBfDpYWItk4fg0HNngn1mIMARDrVn7JE?=
 =?us-ascii?Q?+2ZJfGdH9PbnO3o82mJ7JziFhkPzhyYRxxRGDFdXBcd1YpEiMLgqJuTmWJWV?=
 =?us-ascii?Q?BO+3IF5xU3095AnA2sZtGoH/ukUyIHpQ993SVeHbL4cep/iYW9B0bKxyueeU?=
 =?us-ascii?Q?h7FyBUdxsqj1ZTV/y4TUB+OC+sw4XS5tn099bLsRI+vS37dn9ispnZwDphKg?=
 =?us-ascii?Q?uOEReYxrcdKuJT2/XVOn9Dx6eMsiXi+0vOWvGcwJKmEJ1HxNnEQ66uGhWHyH?=
 =?us-ascii?Q?m79zGfj4KspcGfL3Cf5gl2qPXSkYwhj9YzNVUvWyunHkM3NlpoNNIzwmXEvX?=
 =?us-ascii?Q?hPfjzvpE7DbHCndU76edIFsfCt9WpjyRVEjAsk/XuDjyzf0gSdcCKQXCIq58?=
 =?us-ascii?Q?Dbs1xgAd1/bCMLNF9+Ifnw1gsshCZ7f1e0lNzSNYZfTWOq8ICJj+PQwADvHB?=
 =?us-ascii?Q?gWZMqA2c7X373zbZ1xU2s/a8LfxUuuh3/+v8sODnATzqwiDQUCMXzF409woq?=
 =?us-ascii?Q?EffpPV35yPl9rqG8FuFrPJEwmk5KblHPE/jmjvqv2RMDzefueAy692wK1DUy?=
 =?us-ascii?Q?GxGmXx2zVTqQFZnt2d5EaV0IEaMgxkQ1L6Sck3oD0qR79oMloscLUqOXRKB/?=
 =?us-ascii?Q?GRjrZTDtQcLf90tOljw61u1g1iO2G9Fxc5v6FB1P0hW2isKxMsCY53TUv2Yd?=
 =?us-ascii?Q?2GqdjDlSrF5+da2CJ7jKJfrht2bjxebljd1lueUVqSDLRgXGzRCFtUSgFDLI?=
 =?us-ascii?Q?I/xqRWNJfsf1LpYGUClXgQNEUBS+4YGfIkru6ohBSzqaa9e2v1dm5mIEtFg2?=
 =?us-ascii?Q?CUn6C5zNAX2lwUA+oMP4Eg8qlonqAeMu3J6pF0JtJNAT5UZIPvA8d7za28oJ?=
 =?us-ascii?Q?w/BwcKS0Nw0RHl6w5uhXneGI995buhB2XiufpLIO0CAthtfnnx+eEzP1qI3q?=
 =?us-ascii?Q?mpjTVBCr3NJJ2sBA1w9P7+I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23d615c-064c-4da4-ba20-08ddf4ca29f7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 02:38:48.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVKE3bm+KB/HPXxURfOJBoTCBxiF+z5SDB1eUhaSltWqPXR912lNd/D6e7IFqT5jbDWbl2jv6SLJjRqK0Dcd0sKUYrGN8ejRD5uC1IPoVA+aogtMqPAXtCuniN8Zn+w6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12661

From: Hai Pham <hai.pham.ud@renesas.com>

Add initial DT support for R8A78000 (R-Car X5H) SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Minh Le <minh.le.aj@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 756 ++++++++++++++++++++++
 1 file changed, 756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
new file mode 100644
index 0000000000000..82e27ce39c127
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -0,0 +1,756 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car X5H (R8A78000) SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r8a78000";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a720_0>;
+				};
+				core1 {
+					cpu = <&a720_1>;
+				};
+				core2 {
+					cpu = <&a720_2>;
+				};
+				core3 {
+					cpu = <&a720_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a720_4>;
+				};
+				core1 {
+					cpu = <&a720_5>;
+				};
+				core2 {
+					cpu = <&a720_6>;
+				};
+				core3 {
+					cpu = <&a720_7>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&a720_8>;
+				};
+				core1 {
+					cpu = <&a720_9>;
+				};
+				core2 {
+					cpu = <&a720_10>;
+				};
+				core3 {
+					cpu = <&a720_11>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&a720_12>;
+				};
+				core1 {
+					cpu = <&a720_13>;
+				};
+				core2 {
+					cpu = <&a720_14>;
+				};
+				core3 {
+					cpu = <&a720_15>;
+				};
+			};
+
+			cluster4 {
+				core0 {
+					cpu = <&a720_16>;
+				};
+				core1 {
+					cpu = <&a720_17>;
+				};
+				core2 {
+					cpu = <&a720_18>;
+				};
+				core3 {
+					cpu = <&a720_19>;
+				};
+			};
+
+			cluster5 {
+				core0 {
+					cpu = <&a720_20>;
+				};
+				core1 {
+					cpu = <&a720_21>;
+				};
+				core2 {
+					cpu = <&a720_22>;
+				};
+				core3 {
+					cpu = <&a720_23>;
+				};
+			};
+
+			cluster6 {
+				core0 {
+					cpu = <&a720_24>;
+				};
+				core1 {
+					cpu = <&a720_25>;
+				};
+				core2 {
+					cpu = <&a720_26>;
+				};
+				core3 {
+					cpu = <&a720_27>;
+				};
+			};
+
+			cluster7 {
+				core0 {
+					cpu = <&a720_28>;
+				};
+				core1 {
+					cpu = <&a720_29>;
+				};
+				core2 {
+					cpu = <&a720_30>;
+				};
+				core3 {
+					cpu = <&a720_31>;
+				};
+			};
+		};
+
+		a720_0: cpu@0 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x0>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_0>;
+
+			L2_CA720_0: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_1: cpu@100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_1>;
+
+			L2_CA720_1: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_2: cpu@200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_2>;
+
+			L2_CA720_2: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_3: cpu@300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_3>;
+
+			L2_CA720_3: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_4: cpu@10000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_4>;
+
+			L2_CA720_4: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_5: cpu@10100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_5>;
+
+			L2_CA720_5: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_6: cpu@10200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_6>;
+
+			L2_CA720_6: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_7: cpu@10300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_7>;
+
+			L2_CA720_7: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_8: cpu@20000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_8>;
+
+			L2_CA720_8: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_9: cpu@20100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_9>;
+
+			L2_CA720_9: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_10: cpu@20200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_10>;
+
+			L2_CA720_10: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_11: cpu@20300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_11>;
+
+			L2_CA720_11: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_12: cpu@30000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_12>;
+
+			L2_CA720_12: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_13: cpu@30100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_13>;
+
+			L2_CA720_13: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_14: cpu@30200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_14>;
+
+			L2_CA720_14: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_15: cpu@30300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_15>;
+
+			L2_CA720_15: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_16: cpu@40000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_16>;
+
+			L2_CA720_16: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_17: cpu@40100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_17>;
+
+			L2_CA720_17: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_18: cpu@40200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_18>;
+
+			L2_CA720_18: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_19: cpu@40300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_19>;
+
+			L2_CA720_19: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_20: cpu@50000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_20>;
+
+			L2_CA720_20: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_21: cpu@50100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_21>;
+
+			L2_CA720_21: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_22: cpu@50200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_22>;
+
+			L2_CA720_22: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_23: cpu@50300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_23>;
+
+			L2_CA720_23: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_24: cpu@60000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_24>;
+
+			L2_CA720_24: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_25: cpu@60100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_25>;
+
+			L2_CA720_25: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_26: cpu@60200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_26>;
+
+			L2_CA720_26: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_27: cpu@60300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_27>;
+
+			L2_CA720_27: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_28: cpu@70000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_28>;
+
+			L2_CA720_28: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		a720_29: cpu@70100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_29>;
+
+			L2_CA720_29: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		a720_30: cpu@70200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_30>;
+
+			L2_CA720_30: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		a720_31: cpu@70300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_31>;
+
+			L2_CA720_31: cache-controller {
+				compatible = "cache";
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		L3_CA720_0: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_1: cache-controller-1 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_2: cache-controller-2 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_3: cache-controller-3 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_4: cache-controller-4 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_5: cache-controller-5 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_6: cache-controller-6 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_7: cache-controller-7 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+	};
+
+	extal_clk: extal-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* clock-frequency must be set on board */
+	};
+
+	extalr_clk: extalr-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* clock-frequency must be set on board */
+	};
+
+	/*
+	 * In the early phase, there is no clock control support,
+	 * so assume that the clocks are enabled by default.
+	 * Therefore, dummy clocks are used.
+	 */
+	dummy_clk_sgasyncd4: dummy-clk-sgasyncd4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <266660000>;
+	};
+
+	dummy_clk_sgasyncd16: dummy-clk-sgasyncd16 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <66666000>;
+	};
+
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: scif-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>; /* optional */
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		prr: chipid@189e0044 {
+			compatible = "renesas,prr";
+			reg = <0 0x189e0044 0 4>;
+		};
+
+		/*
+		 * The ARM GIC-720AE - View 1
+		 *
+		 * see
+		 *	r19uh0244ej0052-r-carx5h.pdf
+		 *	- attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
+		 *	 - sheet [RT]
+		 *	  - line 619
+		 */
+		gic: interrupt-controller@39000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0 0x39000000 0 0x20000>, // GICD
+			      <0 0x39080000 0 0x40000>; // GICR
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		scif0: serial@c0700000 {
+			compatible = "renesas,scif-r8a78000", "renesas,scif";
+			reg = <0 0xc0700000 0 0x40>;
+			interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif1: serial@c0704000 {
+			compatible = "renesas,scif-r8a78000", "renesas,scif";
+			reg = <0 0xc0704000 0 0x40>;
+			interrupts = <GIC_SPI 4075 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif3: serial@c0708000 {
+			compatible = "renesas,scif-r8a78000", "renesas,scif";
+			reg = <0 0xc0708000 0 0x40>;
+			interrupts = <GIC_SPI 4076 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif4: serial@c070c000 {
+			compatible = "renesas,scif-r8a78000", "renesas,scif";
+			reg = <0 0xc070c000 0 0x40>;
+			interrupts = <GIC_SPI 4077 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif0: serial@c0710000 {
+			compatible = "renesas,hscif-r8a78000", "renesas,hscif";
+			reg = <0 0xc0710000 0 0x60>;
+			interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif1: serial@c0714000 {
+			compatible = "renesas,hscif-r8a78000", "renesas,hscif";
+			reg = <0 0xc0714000 0 0x60>;
+			interrupts = <GIC_SPI 4079 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif2: serial@c0718000 {
+			compatible = "renesas,hscif-r8a78000", "renesas,hscif";
+			reg = <0 0xc0718000 0 0x60>;
+			interrupts = <GIC_SPI 4080 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif3: serial@c071c000 {
+			compatible = "renesas,hscif-r8a78000", "renesas,hscif";
+			reg = <0 0xc071c000 0 0x60>;
+			interrupts = <GIC_SPI 4081 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
+				  "hyp-virt";
+	};
+};
-- 
2.43.0


