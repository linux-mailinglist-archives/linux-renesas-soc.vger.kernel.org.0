Return-Path: <linux-renesas-soc+bounces-21959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D121B7E4B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB5E67AD3E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 05:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E7726E6EA;
	Wed, 17 Sep 2025 05:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LgfOVcYE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2072.outbound.protection.outlook.com [40.107.113.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C0FBA42;
	Wed, 17 Sep 2025 05:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087080; cv=fail; b=oY5+99ojSLFSp+RNVnO3WA/ZwnF+k+NVZTzRK5ehTQcl/vfQGrf6CrA2JCEIhhRWm6447489YrM7qXumB5KDwQrjRCDHBb8s0UsBEAOOkZtAKfi0wd6mnUIkCUX1anisEFuTOrfNfxbTijgU8olmFLt4l1geaSN79mjqz2GeejU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087080; c=relaxed/simple;
	bh=blziVGo+z1pw0zfOI6H5O5xNacEJJmXmZJghe/ScITQ=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Q25Nccs2vmFJNxIl4Jgy53Wt7J5nFu9V/fJ3Bh3ii0N7+kalYHGxHzGV1ga3W1pw/widjjK7C2jLFpEZqLQluHSFVqw4IsndsDs9bc1UGTZPD/xQsKoLMntcgReKDZ6DVkOSZdQuxrnQM6HoRnHY/kdeg8QwMEW+m9e0N7Yp03w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LgfOVcYE; arc=fail smtp.client-ip=40.107.113.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD0ER43f4T8vPIVE82z493M5e+4Mwjj/U9gYSUTNrab0P9xE1Ogxu0PTzzL4RlI0b5VVs7JPur9NYyDFh2DavvTo/J464TY68LAHOGy3WplPgcGWMdTOm/38m6S8A4MBG2+mHpy0hyqMW2Ox0YMvWpF8wsLeehwGZVvvNoHA/u1Fd4Vucjrs8e4qV+JQRe/XmaerRQm43+xBtJDU0e8kAXXTsiYbbHyMWWpa6JUgWwkjFGaJfZ2yAox6e1hs79JdNSCp0tecE41WBPkSvfH1jJD1+6VkJp17q8CYMEvXmmYs05QNGUXJ2L1LM+vhYAeu7Z2LdBp8oxAQ6ZbfkBROMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+a5nt3ZxxRH5WCwA7DIZ3nfCeofgm5AwA4LP9NeTIY=;
 b=ZphZLIOyj6KqIpZkgk8tz3EL2d7bjgF0roZdlSEnwpV5J8Y1mHONEw201UBPx0X4vjmZRKa+qSamDI7B8cU1fOcKsKbMlnuHlkvb6wKHDuInbzK//zHeg1vyv4VLJd4efFHF9q+qNW71BuPB5R2qHfI0/CUlrLNN/uvWV8sB9wHcqfYFbw7RoY8mir+ASXlgViuJ6HddAFSqtWLYmvtMxrNcAKtUPGvQPX4zQe0rPLxM4mQ5U7v1+rEAUU92TDik7JMcqRcJyyDjPKpllnurIm8W7AAFnA9d51/vvP5YUzNEaELjOb/GhBKwCoNUsvX2Xi73HpiiUGawy4abpJtQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+a5nt3ZxxRH5WCwA7DIZ3nfCeofgm5AwA4LP9NeTIY=;
 b=LgfOVcYEmwFozpSXrfGOMhHpPhRyX5/87LPwiOXiaJanqqvZlBzwsYJx1FCnllqrb0fZbC2BeAbJGuysJtvVsP+SUK2hkSH0NH7LuloVqg3xEvRoRE95aUX7WOmZYd0kzsjuB7tfSCJYBIZBi4EBAU01c7JSMFufm1Rqi7OrpdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10187.jpnprd01.prod.outlook.com
 (2603:1096:604:1e2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 05:31:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 05:31:15 +0000
Message-ID: <875xdhabml.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 5/5] arm64: dts: renesas: R8A78000: Add initial Ironhide support
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
Date: Wed, 17 Sep 2025 05:31:14 +0000
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10187:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dedfb65-4d45-4593-9f8d-08ddf5ab6b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SeYQR2XIF63I4Esx0g3DLP8iMrKqA617QvQ+1eEO8ypdWGo1f/b7GL5tZxA4?=
 =?us-ascii?Q?dgMIjsmsy2pAgDdApmtHkSU3sjuEIBnJB4GHnfZpOOJZhxOykZMaHYJDoTgy?=
 =?us-ascii?Q?Ffr2Ad8ZL3zlp1WbcJXyJCN9bMG2ECRQzNZCSZ7eOENANn0n8iFTU+RnyqD0?=
 =?us-ascii?Q?+fmA5sZc79nUx0QP0aihUF5PBYT1g9H4fvJh8lLHsyvNy45SnGSGVFtnzYmf?=
 =?us-ascii?Q?OyrorpcH9b8tSo0GFcRt1GIU9RFGvHoSS8j/IZi+JGbYoxDhG6jNKsHYAV91?=
 =?us-ascii?Q?w57leA7yY/jgP52Y11prxhd6dcsA8vUsfhUSfkpqI7hjpSa6C0XQk9YTcG6P?=
 =?us-ascii?Q?R8LZcCPHsjhWO5mxyOsIRr1vpL54M1/TWcuTSyU4MNN0cWiV8Wqi9hZUoo6V?=
 =?us-ascii?Q?+6WCst33dizy9OelCM3z+xPyFdS7nVKMk/JxunikPzMtOzvDEG4Vt2OArPHl?=
 =?us-ascii?Q?3lfIz+Nv5v0KRGqCmioU1CXEl1bC3NXMbmcGIEsncnkD13NRgSXtVTSGFMlw?=
 =?us-ascii?Q?rOQ8poLmFr/MQlnF4IWcv/Xvk8XRV8SZkhGveQfIuSEv6IqvxWqBGvPoz0Lf?=
 =?us-ascii?Q?LcAt4nlvtuR35LxBiaA4rSt9oaPi9KqMUdF4X0x9ICZurraAFZm//6UV/eP1?=
 =?us-ascii?Q?4wOAZzw0BglYZs10f/k0FlQ1Sgr96RNf/CYMgrD+TrSLVSXdenqXYpSUz/L0?=
 =?us-ascii?Q?Xq3kLfnlBH8Do4urnB/c/AKhP+DQM5V6Bj90QnQ3KeSmYfhDQTtyizKPjTdS?=
 =?us-ascii?Q?s6QZzbECoImJgCnZV3+TvSShLtD1L0sdpOV5cX1EyuxEZiIs0QXi5j+BhAmw?=
 =?us-ascii?Q?UPY7pPy2P4+oHgrLMBGxiX9FvdRUo7HwUbexyrxkHfzPTkTzncrUlofAoro3?=
 =?us-ascii?Q?moh/Msulc+5VrBciIPDbLs0lb3UtSiYTJf7q21eXXJZjxMMbMPLUUq1DZOll?=
 =?us-ascii?Q?rU6RE7qDVTS+ngVtP+SOF/L/ebsC+RsmtK4FOV4q+JUjf4Sn+U4xtdbSLB8E?=
 =?us-ascii?Q?Y537qmNk1NR7npPUGg38j+8r5OdCuxh7OnkvQUrhIPcDFvaRl2hYZVBuI8qs?=
 =?us-ascii?Q?JtONFJYLhAlrfcLLp6YCKDKMGMEpLkxKC9xZnBLI4s0vytCeTz2kSlVAFN/V?=
 =?us-ascii?Q?5GvqWhxDDuQH79VH3JxYDDmMldHjavZRc4hOmYCy2N98sDEulCqZGpzU27Nj?=
 =?us-ascii?Q?BHAF6fV/lwVX7lUoBh17qosbyNH3YjsyWbn94ScQPnsHbynjuEGWgAs9iFjR?=
 =?us-ascii?Q?XaohHsFHgSKDSE4JFW3dTj/ZN1/k8qrhZG4P6AmlIPnk3hD5JtXTcOAj53Z/?=
 =?us-ascii?Q?AtccFPbsWXn0Zgt/CQCeLBswgNEAIlaiGS/MzZTJ8sSFcw9HhgJBsQukAygY?=
 =?us-ascii?Q?p32YgUA2V7EUav+83LYc8eBGIuxrgGZsoNTyBtnXmzu+bGFLYW3sUue6Fc3L?=
 =?us-ascii?Q?IaXiH87n/U7udglJUM3CWp4gOdt4LcP2SoO3HpG9dTWNJZTModemznonFzfL?=
 =?us-ascii?Q?a/8m83YZztrAulY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tCObuxCZaXR62XrLFbJT/0LHejAgc9LuJbXz/wCklqRCSXw48pfGoAwHxbPY?=
 =?us-ascii?Q?NatdocdkdP1ENrBtNMaUzbxYQ5yBY6/uJMeCb+3Wmit7vWVdAZA8CZefShNi?=
 =?us-ascii?Q?WwxWfgwShWd2+WUDfCPgLv9y7oremfS+ockwLDG9XEWfrS0IS+z2NlAKvTiQ?=
 =?us-ascii?Q?2XcnD5RNkMaJX4OAb0RyeXRxatW5IKZBxPgqNrDOLeC00U8Ek6peqOIPNZpp?=
 =?us-ascii?Q?r+ITfA2idnJ7bOO4CVmc8i6Vy/82jh15s5WuLsnm0ENo4oHCcO0sNBJIVhv6?=
 =?us-ascii?Q?eWnKk92CMve+c8vu3nFtDw16HUB5wj5jdLNl/Ls2+7l1ij+KOyGKN0QuDAGZ?=
 =?us-ascii?Q?yndRpCUhtjf8DQ3+MDI+J/U2JAKvE5Tn6fE4HLkbGkcvGYofJR4E1u2w2D5G?=
 =?us-ascii?Q?j4CFLikgirqRg0xa/Cfw9cm7TSqloUbWd4loPkES7TzLCBYjmXPCeIoskp+W?=
 =?us-ascii?Q?qRuFJnivt4H9sJNEGSUE+GG+1zBXofJBUjYJgBPtslPeWWLgNVFhXI+MOZCD?=
 =?us-ascii?Q?zz+z2YWJpjQArTFpYi6wZEMrip2w/fVUVMZcNPu8QyhDyoPbeME4srMvzJmc?=
 =?us-ascii?Q?WaAyxjEKLc5GLVSWxNIhG7QBx+0EUFb8x83G3ap6qXdIQ7soQTzvhBIHqsk+?=
 =?us-ascii?Q?zgmgqW+F3GEd5mbh6gc0KyegOkBZ+Bjw3w7G0BgY44dNgyTCRffYKy0n9uxD?=
 =?us-ascii?Q?mMTRSH3muTQ6OYU3yaSX0ZNUwz3xouy+7uHLXEfnjqlm2nXtHvs3Imb5T2Hu?=
 =?us-ascii?Q?HH+HHgF8JBZv5IZSGkq4HhpJgCcS/jPugnrGMhf8j9MFWwHWO076SHcqHZzj?=
 =?us-ascii?Q?AcTzM23r5+piKnzIFkPr9ilU25Kaz59pNAME17yRWCF0sfv6nD/kiI5h8mq6?=
 =?us-ascii?Q?x0ZKU6OngkiKtJGsn/NEVhDe0yr/WyZfbd/Dzl3962G8tQDUy8l5ER1LnilF?=
 =?us-ascii?Q?odEPAcV/q+eBmGV0MxAQSUXbCUcn8i1Acy2Sczjh5iua7+o8Bf5INlBIrcdX?=
 =?us-ascii?Q?PLs+UOatL2b20XhVnflZs56p87wYuHzTcjHwOuUh5bQGbU1UcYXTQvWUn1XD?=
 =?us-ascii?Q?e6M6/2/ldV1TfqL+NePYoJM/Pm+/bPOGaDZIGdTAzNGlz38HEz/htpbkwO6u?=
 =?us-ascii?Q?ik0VqFW/kegRsUUztrvy9szb+2fPgfPJ1ZrELMNAjJaQb+TF8HHSuj/uy0oA?=
 =?us-ascii?Q?ejMRXSbvwUNXUSEgytkzu9db6owcmcGbwsJY/5aKjy9wRhQOsjVxMRJAB3p3?=
 =?us-ascii?Q?isI9oP+L74xmOAUWLJNM5sgOByN7SpSCZ4pOCVfbens5GK+ART0bOvakAVXa?=
 =?us-ascii?Q?WuzqT2ZcibjvcWGusH04Uy1fFdlHImRu0Vr7b6sCFCx4gzJvDQaO5kvssyTQ?=
 =?us-ascii?Q?4EitaEIyuYZB7bOTwAXecviSMA6buyp1EoOL1bnLn0MGdh7IA4osyIdzLz5S?=
 =?us-ascii?Q?XR3DFxPjpFDZ5/0xs6PMYFuzXmcLm7hHiAZhmFDCc3TCnOXi98pmZVCwlhEx?=
 =?us-ascii?Q?GOtUcZW7161NKvEUn2OaP8x2XoTVMQwT4EmJFOdvrQn9IMHTLMFB9+xSreQq?=
 =?us-ascii?Q?SBpkAbRoQr4+JOMagr0hTBHizA2v2LTU1nZ0KtUBFIqIn9njo32Z9Dj1KEbr?=
 =?us-ascii?Q?mzGNlgqQcm5tVYKZUJU1DuQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dedfb65-4d45-4593-9f8d-08ddf5ab6b9a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:31:15.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24ikbLE+LEC07yzItc2uZzEmRiyfxVSpoM6Ob+k4OSPX03KVKt29Av7+BcYgt2z3Dt6gM/wxuSFvu3a/ORMnHc7Q6zLau1jERKYBW0ih7FLJsVr5BmHvc5XcS7FG3A6s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10187

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
index ccdf7aaeca13e..dde046a3f25c8 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -136,6 +136,8 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
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


