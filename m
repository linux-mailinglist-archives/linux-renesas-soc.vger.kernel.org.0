Return-Path: <linux-renesas-soc+bounces-21894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EB1B58BF6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 04:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21B43BA720
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F3823E347;
	Tue, 16 Sep 2025 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Yk83QND2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2082.outbound.protection.outlook.com [40.107.114.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F75221558;
	Tue, 16 Sep 2025 02:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990337; cv=fail; b=kfgi1qIqyU4b3lJ6F741dYl/Xzncy8SyH4JuG0c4FmNiuwOYf62w9zo8JYg3huzz7ekIMp13cwUNxTX8nYGk736HRkYLhdJa79YES3kCb6c6zGsrdud315yrtj+rurP1CNAC5fdkZG8PBN0JR9nhEETvQeDycX94DEJIwydSsqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990337; c=relaxed/simple;
	bh=U11Jermpu5CEWAL3IbqsUnYyjUPB8KsqZ7QqGZ9cSzI=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=TgTY1O4bGnuCoU3CnX6lHNeLVWhl8BjARVwqu5ZfEAkQSQpQm0CF8Ie43Sw2RaYECl0cJM/0Xc6Khr/4OcID2JBcRpSfj+A0eZ29ryk8DBRM+yYlCyp9N4bsXY7INjxdg/ANh207q7XJQNNh+vTwA+d8Rxays4PzUyY9dcpKS9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Yk83QND2; arc=fail smtp.client-ip=40.107.114.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kG54y/skVP2q8EltvAuTtIO37cejn2846eVoVBJThgrOytmKFJwudHYqzSWlm/ncIBqpLcmi2G8+RHysrSrPnZcmUM22y38VHWsUrSEfFv3ISTFTBCiwTvLMyqapCHkdnnRgFIkkTgumPL06fJDrVfZQQDSXJdNwo9OlO8++/c0zIAmoU4N5Y38mcYf+nIjeF4da6XMeRw2EdS3TlTkRwNqRlP1lFNwQBKmueGMTM1s+/8C13EiFUv+Cu8bEjf4DsHizPJ5aPt8NREka5ljD4e8qd/U1SiBcwAlJa820n8X7dUqTttyEjvspX9MqPxWBDuZ5bCkOtWZ710xLZKuG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngh4hh8kof+NSerG7nT3yHEAmCqXmaJYhR4OnM6ngLw=;
 b=WANaqDEcYU1y0HESFO/IjHr17UyYRQCdF9QctrlBd9v6ctoxPNzoKdgSPzlompM9+YjTLxi/wxTAuCOrMcHKt3AXTbVLhly5m+u+U+ROQivOIvBn7sx4Q5FEMaN5rCufkS/20NJx2wKCZcHUZloQ33gxCrMcXRZIUa+6nFWvtX4qwVnCsm+StU8C9v6Le6pahelvAlD+lvwQN8U9icN2DvgGq3kydCPZCeWAKlpAIHCzJDv/AfvdBaWXpdkvmy/WA0xRdH3HVYr8SUBqQjH9f9zD/X3ZLsg+ePFeYOeKqPqmk7fLObWkCovBR3OX6uv/0bOtmnXYms1OFG0A+93uCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngh4hh8kof+NSerG7nT3yHEAmCqXmaJYhR4OnM6ngLw=;
 b=Yk83QND2BbSb9UbgVHKR7lvYG0+NTkA85Bp2ljI+1gt3qnyXjKmVVgT3Wzc/fAlpzhSVkDTkj/veroArukNZkxjRt5ymoGo0kjmUBeItQMzYMFov95petomb4Ndh17I4MEs+mXLzaQaKYuKuQl2rCPZbx3h3sPQYV6nu54tyAmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13477.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 02:38:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 02:38:53 +0000
Message-ID: <87ldmfi0jn.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 6/6] arm64: dts: renesas: R8A78000: Add initial Ironhide support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Sep 2025 02:38:52 +0000
X-ClientProxiedBy: TYCP286CA0371.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13477:EE_
X-MS-Office365-Filtering-Correlation-Id: 797ccfae-4b93-454e-42f8-08ddf4ca2cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gRKqclphpYq36QG1sLl7L67DYLxMds/fFONOLKT9XxGGocTJtiviG3A+d8bo?=
 =?us-ascii?Q?NjJVq/SukbaYEigKJShYLcHoydQ93FtJgywOShvSg/BwRCNQiqZGO83/OWmV?=
 =?us-ascii?Q?w464Rd/fpkcER3GL8KuhLLM9QDr81N/hpZ7tlJSJAdw0WRZUn2OKZLujPS4H?=
 =?us-ascii?Q?qMFCNxqvt1xINnZ9pdijqoHCf2IWh98hPebEjs66lGsLd96iSwDzSgCO9I+N?=
 =?us-ascii?Q?3FxG4TF5hrjMcsHmi3Nwq3RBRnl/b+pH2/UFs7NdNqhvytk7mPicnvd0+jvM?=
 =?us-ascii?Q?WQbuBPhiuTkNr4EXDkmNtCDQNn2wNwB/gipGjUs/0XgRzupLbYPLc2ykqglB?=
 =?us-ascii?Q?Gmp6GFWOJjTlsrK+6yPLaV+u3fWnn54JbBQhW6EuK3uItdxI7cpMePIWokPe?=
 =?us-ascii?Q?2SKoZyzQNcZffKoF7slnzHHaItgth9UjIYlH6BysMUIU5z+yuIoGZbZwlr2W?=
 =?us-ascii?Q?rrkZPvt4kfvdqQij4VK6uKrxlWVkqoIVCNa1Fvw266I0CecMF+7ayF85OdFj?=
 =?us-ascii?Q?IMpsTD/NkYHqieiLsmNCrSGjLqGFNEYZjaAEp1edF1IAiu0w2S+gOs9psZ1h?=
 =?us-ascii?Q?xnTKokNmXKvZ94utKZgSdjDTulO05Dc1aLb3lz1ulPAQMvdVPkXdp+Xo127B?=
 =?us-ascii?Q?J7Y55CBxLCwKM1NWPeRkVtca7XmDkOv7i/TaZTVr9wVyUaTqh32gkLHEsFn6?=
 =?us-ascii?Q?iFSTqLyhqpGfT/AOv5UioED/vJhXHx6qTLIYsYliabvBDZea8JLLYfMEInuv?=
 =?us-ascii?Q?xD3TyfElhKEPXD5ZdufGItSu3dk0d88ZyzSEaLaCGMmcXYvqQRy1KFXPolMI?=
 =?us-ascii?Q?Hu9MmzYmioxl0SuyLgiBTsZEAsLahVsLB49otKDm6BsBYdiPQPcN0wONUJ3w?=
 =?us-ascii?Q?K/gdxJ+MMTGP6Z5Nl3SIvAy/YV81xkwO8wo4i8c+R6uyHEQHqGr0AA5Q3rSL?=
 =?us-ascii?Q?z5rfpeGqPIU43fRSKffBVfltsuCXxsRXHFa3yr1I/Jlov+hxGV8poS5mUWui?=
 =?us-ascii?Q?2wgt6zYvxapYgjQRnn2Z0EFOj2Nxw7oo4NTv2sfS9T+qEltof9r8vcFdSnkz?=
 =?us-ascii?Q?PY5e4H4aeA0GcWqcMkFWRY2HBSxBwTPNFyEjrrRalt4GwUu5yZ0VzmPQ17dE?=
 =?us-ascii?Q?ZmmiDOh7L2qjt+YGEUrSROcQPmaQ3H2Wknxv5K/ijcty9DG4ckz1V2Z8GN8W?=
 =?us-ascii?Q?3mX4H68Ue3ejtr1Q9b5sv7I5cssQS+Fgh9PoQqskgcG/0rdYMzvU0amTF+os?=
 =?us-ascii?Q?PgHarceOCW5+gPvjLN2LhSQMZM5xAyD5YizXn/WpHHdHzGnmU6d6+vPgmtyV?=
 =?us-ascii?Q?OKSXMolAVEkFvm5DoaybbjNC4s+XItBOTgPwC78lReyQdDz2IxzF0HUghZg7?=
 =?us-ascii?Q?3/+NzHGin9K0RRD8dT58Xn+CSSX7bL4uKdgXJwdr3sZjj2wEM6IWa8XrqaHL?=
 =?us-ascii?Q?n/eDhZWFoSE0weMhFVBJ7+JLAM4yeg+AekElc8Uy/odjOJbrIt8HiMzldP7N?=
 =?us-ascii?Q?R305zQ3UdbPWePY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+jvWEsem3B9CQzjrnLFvaJ+6JH7wqfETFv8HIgjaXuQAGVasAENXIZxAz7Hk?=
 =?us-ascii?Q?3dniDlRfJp2Q4/9xuiP+APdp0QErz+vpz/VtmTWfBPgz3HbPvPGiLOpdaM/C?=
 =?us-ascii?Q?D+13/wHeG4ftInFj3vr8LTZ+PAagNcuqvFEQDyItA6HL+0kiyqc0yoXFBTcV?=
 =?us-ascii?Q?lBcH89R9MGfuCzW9+P2jYCjrxGnCqHanqcrBcQMjwbSStBIyhnk1WA7AT5ce?=
 =?us-ascii?Q?BN80NUu2N0c45YPR/g0YISP3roq7t3/NCpJq56KGP5f2AotqiyVt4xtrIUXE?=
 =?us-ascii?Q?p53aiy9Ri43rJLxh3gIShGR6yNG7u3yX9tvKNmnE3Agx3kLkeEGY96oqTdLy?=
 =?us-ascii?Q?+pAQA1/m0q775TRBQuVS3ETJ+cImz/8ejR2bJVuwz24VTGwvZ3vQqiGUeb9/?=
 =?us-ascii?Q?yEhW0HqkxvVY6Mz1Yem2CINThdyEOfP5tglzuxry2dwjVYTlMLxgqrU5dnsb?=
 =?us-ascii?Q?aEqdlNVzM64MyMyWNVizpaUTXm3QTDwpd7hFOmG+2OiRoeXLCD2KLRZtdNL4?=
 =?us-ascii?Q?pCQF5USVhgdWbahDFxQa/4sUz3RNjHX/jcX8uFm9/b3IVau6/Zc5v6QmLZ84?=
 =?us-ascii?Q?0g9fETU9OYmfJ+ZgzKNM+cLPNRyKvM0iS6q3lSL/4e53uAK4An/nb/0SS943?=
 =?us-ascii?Q?wcq+GXJWkwniK+pi0dYaHe+Y+AB9Wb4x2vX0L3lTJVMOY9mNw+NntQsJ4KsK?=
 =?us-ascii?Q?1otPcyEhGwukuiOxW3O8Lrk2xI/WelGQRdzYRRKqoNYCSAycVroXebsviobm?=
 =?us-ascii?Q?wm74fWLW2Qaet/WzdxZkxn6yF6d6rOmAWg8ZHpFg+o1xomImRWFbY1rruv6q?=
 =?us-ascii?Q?zX1Me3Q/7Td0uJw2el03INyf7OwzX1KlPKp5fPG0lOuKZST0Gm/k/0IESVFX?=
 =?us-ascii?Q?fBwbPCPeCZZ/QeRKJOLB1W+ccf9dMYWfwlFUfqgdMrQQ1L5eUJdnsqEa2/FL?=
 =?us-ascii?Q?gcXbkhBm4hJV5tcKikxQ37SfuHUIxfe+g4ENyTAh0GAl430EZj02mojSoUne?=
 =?us-ascii?Q?d6VyCoxhPekRNi1KO0+nG3uEtCj077kaWukSSpriECLA+GcayxzMHZa23V91?=
 =?us-ascii?Q?oSGf9Y7kbAVz70qrpD4M1FwlYsyMTN1sJgPRP/BMEuhfIjxmxChBzMYUlHVD?=
 =?us-ascii?Q?yunbupJc9+AdekoCdF3FTMoIajbdEHNZkbM/6dzyZ8qVgN3+ff1APhyrGDjS?=
 =?us-ascii?Q?ZOFu3rBp1mplNZs0Eibmsp4YoCOwXXbZbFSXdrFZUbKh9ZW5rhy1vJXlg7cU?=
 =?us-ascii?Q?SPSwx9LY3kgAEFfe22+Fdzis5FH8k4RVX6KEQN8P825nV1aPd+S0H45ikudw?=
 =?us-ascii?Q?8/OGD7G5+RfSnyFR+zL4dgRxQ9LG4UJ5Tr1+OO5cQubmWS5WJhbaukGtiM0S?=
 =?us-ascii?Q?GQJu/WSrGqM4sZizWp0BrtyLzLpmyXrTmGytCWU+DNnIFCvVJbF0p5hWAhRB?=
 =?us-ascii?Q?PUvLajqIrn4ti/JrB6x89MicryVE55FPnXB43MeCuAu+jPxnG7EttKtKaWBi?=
 =?us-ascii?Q?3f+DCmuEssQ/pkg8OVTuQ309C9ajH6M2gxOR8Dx8FvF0cEj/8tvhz13ttIKv?=
 =?us-ascii?Q?NMpRui9QvZr3VW+yKAZ3pxRu2f1UYPSuHvIW1odT/aJe1ItPi/zv80w/sUWK?=
 =?us-ascii?Q?AIyTPy5kg9myqr3CTIrVfLQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797ccfae-4b93-454e-42f8-08ddf4ca2cd3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 02:38:53.0564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eD+8T4gyIBzOuho+VD9OLZCqxJ9UBLaza6FLf6aqTeKG8FHoyCUhr4soknTdOiRTdnuVIlnGDGfJiJvn287lEMeZpqXUqC6KyaKVkxsMBQTWr8gu+WXJfyC6dGeS7Edz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13477

From: Hai Pham <hai.pham.ud@renesas.com>

Add the initial support for Renesas X5H Ironhide board.

Note: It is using "maxcpus" in bootargs to limit number of CPU, because
SMP support is now under development. This limitation will be removed
in the future.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 92 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 6093d5f6e5489..a0b9307494608 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -124,6 +124,8 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 r8a779m5-salvator-xs-panel-aa104xd12-dtbs := r8a779m5-salvator-xs.dtb salvator-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs-panel-aa104xd12.dtb
 
+dtb-$(CONFIG_ARCH_R8A78000) += r8a78000-ironhide.dtb
+
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
new file mode 100644
index 0000000000000..29b7180cabbcd
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the Ironhide board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a78000.dtsi"
+
+/ {
+	model = "Renesas Ironhide board based on r8a78000";
+	compatible = "renesas,ironhide", "renesas,r8a78000";
+
+	aliases {
+		serial0 = &hscif0;
+	};
+
+	chosen {
+		/*
+		 * REMOVE-ME
+		 *
+		 * It works 1 CPU core only for now. This limitation will be
+		 * removed in future.
+		 */
+		bootargs = "maxcpus=1";
+		stdout-path = "serial0:1843200n8";
+	};
+
+	memory@60600000 {
+		device_type = "memory";
+		/* first 518MiB is reserved for other purposes. */
+		reg = <0x0 0x60600000 0x0 0x5fa00000>;
+	};
+
+	memory@1080000000 {
+		device_type = "memory";
+		reg = <0x10 0x80000000 0x0 0x80000000>;
+	};
+
+	memory@1200000000 {
+		device_type = "memory";
+		reg = <0x12 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1400000000 {
+		device_type = "memory";
+		reg = <0x14 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1600000000 {
+		device_type = "memory";
+		reg = <0x16 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1800000000 {
+		device_type = "memory";
+		reg = <0x18 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1a00000000 {
+		device_type = "memory";
+		reg = <0x1a 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1c00000000 {
+		device_type = "memory";
+		reg = <0x1c 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1e00000000 {
+		device_type = "memory";
+		reg = <0x1e 0x00000000 0x1 0x00000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666600>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&hscif0 {
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <26000000>;
+};
-- 
2.43.0


