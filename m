Return-Path: <linux-renesas-soc+bounces-22002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19DB831F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 08:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 448C63AF1B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 06:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6528B2D8DD3;
	Thu, 18 Sep 2025 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IXWB2HA9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05112D8DAA;
	Thu, 18 Sep 2025 06:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758176737; cv=fail; b=ZwGhVZblVix8oYnXr1IgX5CjnSOI8Mwlajc8rx4rNmE1xSW5mbnXnCU7TNhPfYEWQg/jmuOVSo0W9k9CgKl90c/x+ST5sMSPeQs4pq1rYECCAh5moQ/2jaFjpk5uliEa2NcYOo1clLurG8KN4Bk2pqbIhK5LL4gBVyggdGHPZK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758176737; c=relaxed/simple;
	bh=u1IiLsW2Ai1QO8PneHab97DTSsvB/oNr5M9subXbkWU=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V1voL9MH6qZcdoqs0vevdvujaqgCwV6yB4mGXOnwLcFxUTe96Kb3RigQLhHg9hTOYcxXtRETVRtHwkcqGzh8YYedXwVLqKfJHwUddR5g1HpPNqByb4U4bjvfZX/doTGKlr3Q6ZJFXxpGVFT0m8pkROIiTFeGIqoX4eYEfLfEwyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IXWB2HA9; arc=fail smtp.client-ip=40.107.74.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJNtitly4Lcra/faQV2COLWCQw3MhaMcb3ceiB4S4xSyWKqna2DgnqGE2JgSpLHo+wJluZDLwYQYg32IRe0KbHJH/rsF3f2koUEPKEcLzGwrG4NWngV9zNrrr6e8aDM5GVFWwozMOOfJuwR/E16Rnx/MiNzh/glzPftDsica3tCUbYohXbAkWqzlDrszxrJI4BP2pfs2BIlcZTIDsLkwQ/RoLoEeATFdAtR+uxkb1bgmVEWvC9o+KmTvr21w/aowftT2wHsRC29xqTYrkhoXvIAiyYyibNgkMX2SDcqaukOslXvzoVRNagk6R3tddFwMuGArgZTpJYBxjNlsJoOQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK5OK/e2weff+lKMnKYk3dd6tpqfnNJsKI2Hd/Suo0g=;
 b=rceIBtUpw2ZTW5Ogm9UQuAGLJdCQ1B8Orlgg/+d9mMJoahHP74JtJXPlgUXMpSpC1+skaDNV0u+cyruTYITSDPnYEIkEr+CRAyVkGNizd/yUCf1gUFXOiYyz6RtKrYAQ9WPmZNgZkJGKaVMJMHJwUmVDdu4SzZ99neAhazQikHMPSaYY3RgdmNDwpFdWkgXmG1ICfWurEd18iO3qfSjJXO0LdV27Qy9o2uqxHEvNJPBf/P/ueIimPQ02q5T5VRI+Ro5yqV7/IJzuu3VRG+UZ+A7vnk8mzGYN/MOt6LlEwWhU6HY+F9IvSziiK2QiACnB2CVNyFnIDrJ4iy5L2iajNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK5OK/e2weff+lKMnKYk3dd6tpqfnNJsKI2Hd/Suo0g=;
 b=IXWB2HA9bboDXHVFdbuPCWlfF2MRXWmXz7zAaJ1UWyInCwI/0HZtqH3i1F0d963x/DYlr0tCSP8yYROYbb3ppGSe2Out/7/ut7IyYsFA8fKsKyfG003dSI1UYyAaNFyca3dXF6+XtOGjyjDPZhrmBK4wlJnAOIMepFRcPmvZIs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16214.jpnprd01.prod.outlook.com
 (2603:1096:604:3ea::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:25:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:25:31 +0000
Message-ID: <87ldmcnup1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 1/7] dt-bindings: serial: sh-sci: don't required "reset" for r8a78000
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
In-Reply-To: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 06:25:30 +0000
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16214:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a252de7-c7ed-49f8-169b-08ddf67c2a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hqN6/f8UoC5/2WNylicZNYeAuHJNqridnwKhUBSIPPDU5oZKsCoeyWrk2mfA?=
 =?us-ascii?Q?vXXv6LK2POwdND1Sw9h5i6sA7Ug4Tx0NoRceI3hUgd8IMotfDZrsHXMmWwZS?=
 =?us-ascii?Q?U8bkWlXBSW5KbzCE/DVbrnCawDYHbZTmJ/woQnyXCkEyz3cgPSPCX2Z0uJyM?=
 =?us-ascii?Q?7qg9UDq2c1XuvrxCG9NVVVFhK2Ir0sJ+PrsmII2HQA+BgfCtw8+1Oplm2ig4?=
 =?us-ascii?Q?wVR7YQhIXugJWgAUuqwrOUWKXFQpqrtD26zra2B1VLe6uasJcIdbnn4+F5T1?=
 =?us-ascii?Q?jTj4bm7ngvJk82XABJLpI7fp0TI1U2i+j3F4x8+UAqUtDOhGX7AfvXYb7mEP?=
 =?us-ascii?Q?sgEmZxsS4Kmx6aM19XU72ZOJcQDGO562PSdPWChcoG518S3LKGZiqlh2C3Hd?=
 =?us-ascii?Q?i6KeSMD+aNqMUjLs25DnxSd9IVyoTHEQllIAUS/tf9G6/geCbAwnjPgQyLYo?=
 =?us-ascii?Q?CB98CnTrzyTBTyuqC8HYN7k1HwmDAxYw2MDzuKXUteLsBlny/iNKKkoyNn/J?=
 =?us-ascii?Q?AA98pSYGfhae7sgzheK4kbC3Vyuq4JZdLD2r3w1yp3UaT9GboWfy9RvSYSS0?=
 =?us-ascii?Q?b8gRKhLt68RYZjGIeNkNPFDxrW5X8btsYZyq6X1Suy1wuu0xR1OL2wU9BMch?=
 =?us-ascii?Q?ajL2Vi3H+JAKd+hzuaU7kzwQ6bhPZg43M2o0SI8ZcnEr9L4fQr1DRNMjRTXI?=
 =?us-ascii?Q?TlTLbZ0lY7KYQy5/MfaWOPXhRus92ZSvYjaFCX9i84N4LfuGk7t5VOaf8L8j?=
 =?us-ascii?Q?JJfF1M9G0C13tu26dr4GAwC0XZ660/xok+Rxp0X7elPPgpv3uZ+kK+20qIDK?=
 =?us-ascii?Q?Qb0eRKJNw8OiQTQWdyku8bFo6+4i7oCtJlLb3IuCIg9kEQJnjLtljaYlnrPh?=
 =?us-ascii?Q?2Wf6L9pwz0VFOrhsCHkpQAIAbjZriqLhrMS9mg7F+T2HbDSigl9aus+U+m3K?=
 =?us-ascii?Q?J5xMaWWC3EKRL1dotQns3OenNapVoDchmMmojg61evlRLZPp6SoSffyqQqYI?=
 =?us-ascii?Q?hS5p9EijuP6ceZp9IkCiGnFanMm3dVXQPOETgFSkl/QdqJhUxvcIo2HDk3hs?=
 =?us-ascii?Q?h4hrFaTSES5swjYhGgZ/IthRVkKdlMfB2xdD9zHGDgdLW/X69jKaYhCQHaAW?=
 =?us-ascii?Q?e+/tA68hFA7p5Uji8Z9q74vekSXgRvqZoYfVZCAMwU2Qu7hYX+bjfIPRpPIP?=
 =?us-ascii?Q?+VcrL9LmWnH5bGbnITgLnRfb6oBoo9aknHADnIIceQ+U8JhFRwUGM/17l63S?=
 =?us-ascii?Q?ygso3so2AKT4n7fuCCNE8g6Jn9omG71rhRxjQokydpqwNLEvZ3tidM6WcRgB?=
 =?us-ascii?Q?+5IkAFfteTUlkY3NeoXNi0qxbDpuwTAL3JNahPEHi+fRELcm2FrF3flZ0Tig?=
 =?us-ascii?Q?9SpV13Zq5qQkThLo0thzMlpCKCtuCNWifaPithF+SFq/Gd3l0aE5MOTbV7ld?=
 =?us-ascii?Q?3idk4YKketKrwIiHPN0RVdfJwKuKOKYnldLIqI3X8YD4jv/FNM6EixiLrdoR?=
 =?us-ascii?Q?+aT9jMZ4aLdDOrQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y3mE+gv/RIjNtMmGk6cu/Yr5kp3+xitOmZku6P+JlgeO1+MXMVrmszD0BFf1?=
 =?us-ascii?Q?0qEbr3vKGkGipZ5TYr/PJI+9A7bU1Pws55c8nTWUv5mXx3NANnJdYmhY7g+l?=
 =?us-ascii?Q?3WCcrzCSA+miX0CXeBhBCXECukOCBSk97rrhe8nrnRvoDglTBf8exUMWhwi4?=
 =?us-ascii?Q?4GWTizV4Ux+yiCA5vb0zo9ggjxdHr/diwp7mj33vsMI0+4PC1yscg2jkjznY?=
 =?us-ascii?Q?RTF8fIccwFcmP5f2jwSiSU1jZZfxNRBme/op01UhpvLQqo0LPZdyWKTQzEUT?=
 =?us-ascii?Q?TcBLswl2DBq/E8phbou+wMTD548T7cWldrR1PBL73vp3nU8sMdp6Yl7J4bot?=
 =?us-ascii?Q?UgS0uSmKzrGiFJea9tNt7VfAmzK+/avSYwRVDkqO1ds7nOG8cXSltNFYNtnc?=
 =?us-ascii?Q?OOfs96lXuQrnWd94Iid+L+tHiagnsICgIR+BAaCyz2dY3pza1IBzdYorzht9?=
 =?us-ascii?Q?wiblyNiE63VSMx29VIppYFRuJl4ADZd1DD2acS93KdKwh3JcJL/qCYOtFeJN?=
 =?us-ascii?Q?rc0FhXU/nSVOwp8XfhufrDmxiFQ9p8G7DZ5b0UK/uw+34FBAXjVrY7AjuZ1H?=
 =?us-ascii?Q?Ss93HRRA+HbWBKQzTP4OwmEzGK+xp/rAtzyyFWVKAp5EICBDTraWRPzafTGa?=
 =?us-ascii?Q?qoJEnuE4lGvCH0KqmrnDyvxhRLrMskBuJM6/HPWt7WL1ZNc2fHhJ1uCCeGML?=
 =?us-ascii?Q?rjzks6zBnassCwR54yW6+HvIf6DgVrvirzxmMXbaTAZmCcKjgUA2bNAmbijb?=
 =?us-ascii?Q?fgclRiCFF7EoVG4wVktZMxzOSQs2mlIT1MwVoP09icd/7ohQApi5MuYsQfSe?=
 =?us-ascii?Q?blNNedllwUWnBJ3Z7Qngjaq5z+i8ltycptU0thFCKg+ok4W5fBv/MnZBqxne?=
 =?us-ascii?Q?VRB0ItK4daFySD1crE11CgizqWdsfoNHiLWF2k3yoYFXxH1n+Hzg63Db6myT?=
 =?us-ascii?Q?qz7W6vaS8N1Ac3ctrekVgWsJsDavNfmI+d583urO2Y+W11BXwH34sF5I1Z19?=
 =?us-ascii?Q?ULNdL++f+gFNG4EUYq9hivyrehIGb6OETvzUkBo2aFl/IWdWDTQVnjjKDaZ4?=
 =?us-ascii?Q?v0ZZxCSFm481cH6J/sfcsj68toHC6aJnc6LpDCmJQVo4z+QKk/UytLISyrrN?=
 =?us-ascii?Q?WhKtD3xosdjHQMxjyzsQEa5D09jcNqT7FYvrzY22RrXv8m3Oa5qwvMookd90?=
 =?us-ascii?Q?DTMmsfzgvOgaCde6Wui76OW+SswQrnnQnF3Xy0mrl+VTItzmkgldhy2Ofj0V?=
 =?us-ascii?Q?hucfhka3aSe5ICPF4aMGIjy9meBKxpfgMt2/yCc3KY9b/jd9PrSChbWxleRT?=
 =?us-ascii?Q?hfuI5UlCgHIcq8De+tdGRTuN1Ge/nAL1yjPTfIfcVUnjiSHO4lobxFXgV2JS?=
 =?us-ascii?Q?4K6zgnhLYvvMdFivchjCdQRmSpwF9qGbLsifAuKQV8gUHI7+6wvnbhBVd5/Y?=
 =?us-ascii?Q?LeWqJonyexi7ECizVR53PAaTlpZn1o8EZu5dPriIK5cH0vkc182pb0RiHkgV?=
 =?us-ascii?Q?IV2f0YWHAVJfgtOqOHMaf2HToMo/AqrqDowN/sCcVH/HXF9wpy5RMBGXXEWU?=
 =?us-ascii?Q?IvcQDUiNlPlUX9LwoNZ5cy8F0F+TvB7wmdAOWOvEWfrJCX1NNVAU8p5tL+T9?=
 =?us-ascii?Q?JOYMPIbDnPuQe0xH+t7osJE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a252de7-c7ed-49f8-169b-08ddf67c2a99
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:25:31.0099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXr8YuU31ZH3MZrGHciXQW04kcumbMqX+4cdSRBexWsGtI+DW1Xk8QMISd9OCqJSl6hIeXSxiRhAz0FK0TsU98THwY0UYiZVkr3mOsyte3Zb6oFZHj5ogJy/dWIf+oHt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16214

commit 6ac1d6047372 ("dt-bindings: serial: sh-sci: Document r8a78000
bindings") added r8a78000 DT bindings for Renesas serial, and it sets
"resets" as "required", but it is not mandatory, because driver doesn't
use it. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
I'm not sure this is acceptable. This is optional patch.
If it was acceptable, I think we can remove "resets" from required not only for X5H...

 Documentation/devicetree/bindings/serial/renesas,hscif.yaml | 1 -
 Documentation/devicetree/bindings/serial/renesas,scif.yaml  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
index 4b3f98a46cd9d..d05a83b9513b7 100644
--- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
@@ -126,7 +126,6 @@ if:
           - renesas,rcar-gen2-hscif
           - renesas,rcar-gen3-hscif
           - renesas,rcar-gen4-hscif
-          - renesas,rcar-gen5-hscif
 then:
   required:
     - resets
diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index e925cd4c3ac8a..47cb99ba03607 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -181,7 +181,6 @@ allOf:
               - renesas,rcar-gen2-scif
               - renesas,rcar-gen3-scif
               - renesas,rcar-gen4-scif
-              - renesas,rcar-gen5-scif
               - renesas,scif-r9a07g044
               - renesas,scif-r9a09g057
     then:
-- 
2.43.0


