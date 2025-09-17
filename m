Return-Path: <linux-renesas-soc+bounces-21958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66405B7DF3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3560F4E105B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 05:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1137626F46F;
	Wed, 17 Sep 2025 05:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YdahaaNG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2086.outbound.protection.outlook.com [40.107.114.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCC61D7E4A;
	Wed, 17 Sep 2025 05:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087075; cv=fail; b=SkeCP/goTvO9VvMzqATFqJi4TISq18Xck34onm9uoYXSxltUFzOMxJHgjpmbS0JHUWkXFEf9nrzdMv2UXuXICQpeXPvhmonA1LZrpjp8krL0zS+64djh8pnbu51mFlPd9kzBfxtsOS7D+4RxcL3YoQb26iqyFkebzpz5ydpNW00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087075; c=relaxed/simple;
	bh=J1b63FGZXjcwEcBGOSMD0EO3+5KKSYoGfDVaUmDqxkE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UUSCpqZNYo2IrR5ZmxLfBzIQCqG0+Z2X6nGohxFBwTHgpVTKtlVOs3VVwffMB+UDAwYbUGxJ5MAGwQyXKqvGqi20oF9PQVaEs6pNyMQHJOWbAWGf1UgNZOJ+k+cskJ84vW8AylB8xTC4tpMJDPMqgQ4pERs2OnmlyPITkP0Ik98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YdahaaNG; arc=fail smtp.client-ip=40.107.114.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVDuQBdG+CxyFBD2WU7AM8SHuI0/AWGtNoDyuswiUEDly+B+9UgTm8XIuklyH3UETvHRIlcoRwtABBD5qvNOBZOukCA0+tg1rXjMToXDi3zAp2cSozCNpCv8bdN6j5N5+41CYMlBnmyB/Ny/6SDNCsTxQLoh4ABCUszR8fk4b5RrppekYV4B6mDYniSIKbCjfuTc6OvSRh4L+aWNyU2y3o0m9gZIgg6DSiyUVDq/TrQ3hTFB9ZOmnJypiknRarNQ97vW2sHF16lWUvTZlv29fLQ/9osz+bffuK86fmgSfTGvtpSd5MMGhIRA9aNKa0GckkUKRSUKc/7kbALjakyHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIriUuOFNxPI/yCBWpzIrArgS/D5OTMLw3XYMflmg3I=;
 b=QHD+Nogun69VM3uaV1nub3zX5KrEynV3xXXxafXDtn9KdzJlx790WGT5xFM2kS+dLl5pcqb2ngx8rzc42vuFKvgw8D3PKQBk4QPvgkQcPPsPLd+fVg30s1nrYAsSQAXlNtKPz3UvVYJCsMyGK1Wkuo85z0wb7rdAFS3EjBtpxZiL57UJXNLsDkKPNfkH+X/Mjbe9tkGFM6cKCFSZkPRdpAOpxMXIafjdMVL4MnljSwqXz59eIi8Q1Vdpq31C3Kj88MxN3T4HSfTor69HQ5Cs13UaNWSrmlf3EJH+jLHF9HXx4NLEmvwsAhNbiNQz3sZz8KWynIfEJxK0BveAEG2w7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIriUuOFNxPI/yCBWpzIrArgS/D5OTMLw3XYMflmg3I=;
 b=YdahaaNGYPNAzXz3Az68CUYLB3P98yWVxzc6yQfFjMbr3dKm8QxQ/aaQ9N5hGqtJqMsccemaJ+GaSJrSRElhLmATTJ99wdJOBBls7fIHfpzD98WoSaONHsKuATR35DLprebHDFpu48Bsr0zVzbFoA+5Yqs0FLG4VlV+YNiSbkaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10187.jpnprd01.prod.outlook.com
 (2603:1096:604:1e2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 05:31:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 05:31:09 +0000
Message-ID: <877bxxabmr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 4/5] arm64: dts: renesas: Add R8A78000 X5H DTs
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
In-Reply-To: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 17 Sep 2025 05:31:08 +0000
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10187:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe044ef-0af5-4306-1ba9-08ddf5ab67fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l9mhASE1ZGvxWM552ABI8aSGvSMquNmQuciwjd5Q/d8tfqC13agQBnXClv7j?=
 =?us-ascii?Q?qa/HsK2JYtaX/mHAtZcsoyF+z2/AxNgPEP4qO5akcUXzLr2zLIlkFZvcV2Zy?=
 =?us-ascii?Q?C0WV2WSTKKuBW0zqFrXaZJtQJ+KOftrf2H4nSdt36X3tcRu5fgsP6GSbyPK1?=
 =?us-ascii?Q?7fzxF/4Bh8cLuv97pyBkQoeADufUjJg9IZc1pj8YC1vJ/eUykdGvz8pVqWLq?=
 =?us-ascii?Q?AyN1SEPJoBjwivx0qguwJvo7zlYM1BUeSHdJwp6PZiCwlDvn+0CdfzmuGodi?=
 =?us-ascii?Q?aF9bKShdZtNE6+ssOVCZgceL5RQU9C6SwN1y0rA7NxyRdK7GgDEKzE1nk6Hw?=
 =?us-ascii?Q?TK8K9y3bWx/U0ZTW5YZe8ZKRXNTPMpUvNq1efiwjuBjg8cE4J47mDE/Y4GMK?=
 =?us-ascii?Q?lWECMZVnLFYWONRqHYnFq6AnWDwljOKONeAyMM31CiUozOQUY8+nlqqgkO/n?=
 =?us-ascii?Q?vNsyEFs+WUpwi+kQset1gsYnS4vMWBTBtSqHLocEqyPVEEqzi+EiP5XO0gmF?=
 =?us-ascii?Q?yKNHt1bNJI4Y+EvqCIWHvDQMk/BRAnVLAizAAFEaaafGy7eB7Fa8PBSv6NAt?=
 =?us-ascii?Q?nYlpv1PXI+ka7K0WC9ET5yylJgGYEQCwGnQ5vf6hl2joowRGuxsUy01ksBWm?=
 =?us-ascii?Q?jEsSjZPPbnNp3Fhn7KLfTPiB8WWJS6/yR0RIN2U5YXPrhx9wMvbaaFRCU63v?=
 =?us-ascii?Q?jk6S5LOUVQJ/BaATbMd+gDHOlogw4X54u38zY5l4bKAqFVe2Ugv3kOppnZgi?=
 =?us-ascii?Q?aGdrv33h+V+a03gZk/UfYtcofW/C3hDlM9DKPnAz+OINMbhnYBpX7wRsZsiW?=
 =?us-ascii?Q?LhEMcl+Ch3mFi7xIykDW+IxpV0/oquGelkfBuNZA04VMys6p8tPKhFkmYsr/?=
 =?us-ascii?Q?w2OdbBksjSgFKkgSzcBFW93aw1lcQfoRZNzrHoci1ctODFzNxOnyx4GhZj0g?=
 =?us-ascii?Q?h99QjkQVEi2BKgPbIdUVlTDDQDXwhyOxLpqneLh4m99Xu7FR6NNZa0z/n7jp?=
 =?us-ascii?Q?Ae8HaPSDbwKVqpBNorErWoYwGtK+i9QFRef/ICU62Hlgz/3iA54ClktmT+bH?=
 =?us-ascii?Q?qG88WjaWePY4ifzrtMcDFDoskQ8Ee56e/jGwZJrYsIUlsxgYjioUNAl8E8/b?=
 =?us-ascii?Q?BbR3y9+AfGoFSlzb/GUfXhnbX/N/DJQ0oIFJdhpQN4eOndocFTWSpgczqNfw?=
 =?us-ascii?Q?H/w+rulYvyEM56tsrERRlcMHoEb1x4bUYvYZFjSgTFEUexNPV6xzyB2aqvF/?=
 =?us-ascii?Q?erCf6h+NtXTGFsV2CrfiDYrm6/p7iwfzXFPHdiJOdr4YJHmkLKdTXUTGdYID?=
 =?us-ascii?Q?w5plKvh8uJl9XgGG7a0m0b3tOA4skXOv4BwMQkfb1XtOm2Qp+uokmHR6hm0T?=
 =?us-ascii?Q?AW+uqTY9a1T0jk53oNMHHOgfM1W9/Z8siRmFvm7tPjlOPEaAS9LxGfFVyy0k?=
 =?us-ascii?Q?wHb+C8AFgB9FhWR9K/F4xBSz7LT16+zpGk/0Fhh/fU8bo0xLEEpK/67UB5YQ?=
 =?us-ascii?Q?Eqp19tRhF8VWpB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CDq5e7nY0OhboD0wfO/anyb+rUX6ls7HOUvVCN5fEDnXxYSyCHvOsxQddveP?=
 =?us-ascii?Q?Jn43Qx5IYJ91SWIUA0XAq0JGas3RNMM3CJtGMrhkAh4+GI6W2Y5972TKRDbB?=
 =?us-ascii?Q?DVLK648nqGZ6zEKrrHT4w+pnzcVkRaeQLjPC9c3E4xwEEY80ozBfrtUFtEkE?=
 =?us-ascii?Q?dMgujkdmJfImqwxQ3y+i5iWXkrBQ15Zn+EjMWvn/GHGbYIAsVv7PAu80JOcM?=
 =?us-ascii?Q?FOgj5lHe/WeSD/UH3eYrbbrbVLWXjqFcl/1hMBVONf0DbqNbQQf+OKCjsFEP?=
 =?us-ascii?Q?RAfwtusG2TQcQ+tKkZ3zlsmD3mynKAOlHXojNO7S7Ylrdi/aNda5qZuHm1f2?=
 =?us-ascii?Q?bQbmsOpL70vK94n79LoQGBU8EJLd0eUZfFLUDZJ4SeT93r8SuuhJnReSv3c8?=
 =?us-ascii?Q?uha8B9f+eSVrqIpxcQAnQhxN9i6+tjkoZwily5IoOkeUdhIiHHZvkTyjainA?=
 =?us-ascii?Q?Grb4njz/mNA0QFidMiUUXRSY4fzjDTMVftbw/dbAOcbFxX3E3SsmI6I1cA0a?=
 =?us-ascii?Q?H1n04A8dWq0k8fIm0t5IrVbroou6MrKCEayMXbN8q126UJatHxpZGW/2C90T?=
 =?us-ascii?Q?jMae6EJRqmKNsvi1VQ7SvL1XpZZ31y1ELCrelNQ4iJH8gLzfTrqmIwa3TX1v?=
 =?us-ascii?Q?VMMJCbX66hIiJrzpiVoS7K9k1IyBHLnd1ZPxMQa5XNLoCMzbVnwcfFgAP/cz?=
 =?us-ascii?Q?G8T8QyZ4vNlhydcRXL8Se+Vw7h1kG3DNFjzfW5TLH5GXbF/ZCUwtgf1VGpom?=
 =?us-ascii?Q?TNvkfAQOpVE/4DgJrO37TC48o+xEwy+fYxM8saHjc14NaS4W4+VNMT/svyix?=
 =?us-ascii?Q?5cC1dWHRVYAl8b+Cs4anD/HofO1Uzb8czgPnHZTzNo3DLZX0ItU9VdZUKrdj?=
 =?us-ascii?Q?9qkrSphKhzl/dHBgRitXcD5SBluGoplUleR3tqM8ktxPSM7GHqjwLeR7iqg5?=
 =?us-ascii?Q?dcMxAkIh9Suqp627S4sWukD0kC7pkdelOZn+JlajRVTJieOtktq4m1itWzqc?=
 =?us-ascii?Q?AGLDQ/4uLeBYm7p7eI2m8tePS620c+hnBBLux1ZXeSfMRJKQ9My+4EhwEupl?=
 =?us-ascii?Q?NCexJuO/Ir8bxR2373lR7rLqErzZTm77IVyNl993wyrVvRr9u/IDncxL2M7+?=
 =?us-ascii?Q?4kDNKeDMg1ibOBmMGtGrKnI4t7JryDjRp1lP8Qs7AW5F2AD7mXjv7uEUO6Of?=
 =?us-ascii?Q?y6wqjJt9IpzNmWlbsyaYZV95mzMYmhs4MZ08A048HfaTjToalKQYT37pDDkW?=
 =?us-ascii?Q?tEXdxluP66faUxcVw9NNcOJZFgK2JMGBTR6+K099JuXvoW1fyfGB2hUu7IH/?=
 =?us-ascii?Q?pfA/7Pj7PzqKMwRZA+s5BzNwJl/RF5DBnvBmrLXdrc0Rlb4TWTbnzuoyOzVv?=
 =?us-ascii?Q?Ammum8fpRZhNXoHqChEk041mT7X8KA+jMoqUoPaJ/gsvHTz1iRwuAqY+/JkJ?=
 =?us-ascii?Q?BCyOtbQmpQIeK55L9GHWxppMiYb/zf5UQj5YWGldTF06wSgMoqDSLVIH84EB?=
 =?us-ascii?Q?Y0POZK8q87R3jEFlKPu6J3tobsfXUWORef4TSWalMxFwKYRzAr7emv73olLW?=
 =?us-ascii?Q?z6VNbgc1ZpOJmPeiGtBAsaizW94aYOt9Z0mjG0nJkTHUejgV/y7H0YbdgZ4q?=
 =?us-ascii?Q?OTj5Z3XychpSyVTque/rN24=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe044ef-0af5-4306-1ba9-08ddf5ab67fd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:31:09.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5ovXW97Dk94AXrK7eyEfW2G07xBug0DEbJms9kjgUOOMBRapioDlVkXxxCbo6861TzWDj25AbVmcUodPtqEzx4mqhsBI0004YihB7W9eOM+2EsEbqL9DA16BEvCChGs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10187

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
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 755 ++++++++++++++++++++++
 1 file changed, 755 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
new file mode 100644
index 0000000000000..6445f05de0563
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -0,0 +1,755 @@
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
+		timer {
+			compatible = "arm,armv8-timer";
+			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
+		};
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
+			reg = <0 0x39000000 0 0x20000>,
+			      <0 0x39080000 0 0x800000>;
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
+};
-- 
2.43.0


