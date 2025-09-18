Return-Path: <linux-renesas-soc+bounces-22008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A3B83239
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 08:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0332E4A5B2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 06:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57A22D94B6;
	Thu, 18 Sep 2025 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="W4r8UR/c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF252D879F;
	Thu, 18 Sep 2025 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758176875; cv=fail; b=BCHlF3RjEVocvw9tUmwFkVi8Xeq6eaNvNxblvyyKIL4UdIzHLap6769vbSSzJwwElXqE21WU9n3/taV4azSH8d1dXQkWuKA10MB2rr7789UjRDNI4W09wONQPpVrXA1HJYzmQyxjYLFOTPAcCrw5KaJd8b0UwyFW+oeieipifYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758176875; c=relaxed/simple;
	bh=WWpk297GBX98c0HBxvQjNfdRNRPXXVuSRT5u09plB/g=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=UTOYuWtT+W7MWYBtckXMgm+nxjiQa7VJrlDM0jJ1ZzCsr8CC2B4bujXkiUD3S4ViFwDiOquHF8XRT7RBS/OjVUPSb3idEUfzS3ZW3GmEv3VunnKHhiwjA1zBO4HRDWLcKqb+Bvg/w1nWAA9SESyuQ0YcUYOD4wAf8eXPXTMR5Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=W4r8UR/c; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLTY7eK3GUd8y/XPqhsokxsnjwgGoI9LBqUvZtE9eKwkJVApzaGJCduMhdUWUlyic9CxsIelAMVvAXOXja/t6zIwbc659UWN9oOinbaVAJaCIGfvS7ql4PaqKlLP0ON9Ubjahw1igoihG2VaZkxOJwsm6VG5oD6cPrfgpCghU0osUvcN/dDITps27K/hzFaAn+mS4V6YoVw9PloyBPi2wm1ls6Xs0fYluws5q/qvrfb3bDuFG8sIoY8uVlVr5K4t3hE9G5kJGpC+xKyigjKCGf+zZZ84CwGpdubUmFVWER+nTAgInVkBtQByn8j1AXRa1Qserm2niflVCEfCJejL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbmcPb6a+a5cj3S507EUNlHL0wbvWxj2ieYJ4zbjOHM=;
 b=Ags9sKzCQi5/7MRlLFPXG0JtdMsn8agPWmsJxrWq0hkonVhKedFcpdtTlHngQfzUpDZWFcmJfk7fYEm7JyaWtJXMM/TnYGNWGrO359T3TTpdFIEDRHgyaiwnpSWPh8XmNKfyT3SFWpukt/du/iKshw0nBnEXn85D75WOq+KkxRuZIxbP6lhwn8vJW5tz/buk3J7MSy4Y5s0DolexxKCohYG1NWcnXzsY47lP7L/olrcSV8qHDxg56dTRpTFFIRv6Fcjc+mlIDjwQbx/W3E8IB1k3K9j9lx2vdQUSWiqyy45jTEFbjdccgSfiQpamGdLes2mBdUpLNIHsvJB7K49jgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbmcPb6a+a5cj3S507EUNlHL0wbvWxj2ieYJ4zbjOHM=;
 b=W4r8UR/cBUmKYBji3H9CKInEOWNj9qrLTqDnstaPOQEoJyo2teY9ldGJ5UP8xHxCUZEO79+bPKy81HYrObomdv1D/PBBhsPo3We4r09z3eknMo0TtSQIMbFME5eSeOV6GHlqfaOs3qLN+BtCrRd7re/jAQYq5KfMeH/fkfTyX3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15939.jpnprd01.prod.outlook.com
 (2603:1096:405:2c8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:27:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:27:51 +0000
Message-ID: <87cy7onul5.wl-kuninori.morimoto.gx@renesas.com>
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
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 7/7] arm64: dts: renesas: R8A78000: Add initial Ironhide support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 06:27:50 +0000
X-ClientProxiedBy: TY4PR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15939:EE_
X-MS-Office365-Filtering-Correlation-Id: 6addeaae-5b95-4955-7b3c-08ddf67c7e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N4+Z5GilKD12trltWHEEgepHVUTwTkG/Fz5n7dmVC+EQnQvCLvhtJPXscJAE?=
 =?us-ascii?Q?Rt7VFWoTYlJtnYNkT5ARNCCDdqJNlQ8I4t8iccZYjZGfj50U72W89+c5nmst?=
 =?us-ascii?Q?wFeYqpCEeMlZ1eZRyAdiXodtbTnLNUcnkZgUaQ6T3BXjh7op26Ne8Y1uGsM0?=
 =?us-ascii?Q?ESRVWtPXZ4GXEdwv7IHNZpSjkDdK/iaSsiqZ+UMdYm+00L7M0MChY40lznr9?=
 =?us-ascii?Q?yU09VV/EpSeos6rHlkpNC99HveC39S3oYsysQfYLy3gKqCpCwnbtvP2lzvwj?=
 =?us-ascii?Q?aJatD2UfIO0YBmz7KGWiLjaWMsDX1pMAo3SjQirg3eWntKIbawljrjl9Uf6i?=
 =?us-ascii?Q?oCvs6Lob89AgEx63w2uUyvUjithTCg7Nm6rUYiNJC6t8C2dwGKvzSbm0NRDL?=
 =?us-ascii?Q?Cgc+CAG7bwBlvV3tRCObigNgcxWfFWcgm9irFy/kPaCfO553u0lPuJxL6uVL?=
 =?us-ascii?Q?ePahGf/+tVyyp69IwYaV3zFEQTWwyWFy/+FJDrvPY6H/7PsulYYQr9fYmi/h?=
 =?us-ascii?Q?ERk95hh1BLexORil+FhOV57bHH74mc/bfcZ6ginwUfA998V1HSO+gkx6pOpb?=
 =?us-ascii?Q?4Y1qsM4xxwjIE43Cj2zO3XCTJU9kxv9VYOYTiyKAwbYlpMwx79zzukMG8MGy?=
 =?us-ascii?Q?4WY1bK+SweQbwbvnlptNCJW8L67qigEmRx00ZytLhm1HlxxaoQpK8tgqCXw9?=
 =?us-ascii?Q?UubTe2V7SxpeHoYdYXe2XM9Gc9R8UEiDE2MpMlL/QzHOd7Ue2BQVJJDfQ3iF?=
 =?us-ascii?Q?0WzklicVMpJFKHOrJbQ8TSUjPb/s+t/SWhVjg/fWfcmDyF0AzuwoBAZf4ON7?=
 =?us-ascii?Q?O9oKslPoVyLCywPIqwtMo0CokKDWV1gopno+QfLPspqcahmLoG3ifcYn2ewn?=
 =?us-ascii?Q?o7ZZ/V9FUGDUJHYZzAPC5iDT0Mwc63oiQZBFhzg4QE2fnElaJh3GCjyPThX6?=
 =?us-ascii?Q?KWU0B6nbpBiJA6KumGUsj1HLvGh980aaCDjlCx85h97BU2O6EwODxdGWDJrs?=
 =?us-ascii?Q?RrPbYSOK/CMF0gmjyln7yszZzqUGKTt+WX1wiRnoreclg7pds3p66bi02JEG?=
 =?us-ascii?Q?XxrlsMtvEhVn4Zr9/k3qg4Ixdwdq1O4M21rTti/yuV0DxERHgKnJAW0TFGH+?=
 =?us-ascii?Q?jPlzVg+zRsVr824k9gtfo94AFGErLWnVBvnYyYaZ06yaRRPfZR813mpfm1FC?=
 =?us-ascii?Q?4a+WMObOgQ6QStYVEJD+gRbIHlqIY48lZ9ZZkMwkQtQaQLxFOxwPj8Fe9GPr?=
 =?us-ascii?Q?FUy54llNQMp952mXhVBmmCzuss5gOnHgD4a8YXk4CiMn4MFMTMW2A0idRjWj?=
 =?us-ascii?Q?V2EuGN+SgJ0uLui35rBs3i/z+F6JCk6wFLupfdK1rHDGAlCN2tgf2nffRihx?=
 =?us-ascii?Q?yM39MFDpJB+jQdTzVKsd5yEUOVeUdPWEGf10ovGAJ6bCujPDSFWUnG5b/32X?=
 =?us-ascii?Q?t+nq3leJ1WtknPIxUEbVk6hMdR/7cud+WXN7cfvimz/2AziZqiHJvWT+FKbm?=
 =?us-ascii?Q?qnIMjK98B6UkqeY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tIdrwNuPt7Ifs9CL+0nJ3zvKkTQT3m/d/7jqYQR4TnoGDQ3sar5/JtgbsnnV?=
 =?us-ascii?Q?k2UKS46kZFtKiwvQ+cQYzA/2dKrLgpHb6VCTqPM/+V1zhgprZLAUK0gs721a?=
 =?us-ascii?Q?bBfH4wzGAUWZUUj1pEE1U7bH70cLJkYAbfnkhSOaVNBYmLGQnUa23SpYmmqP?=
 =?us-ascii?Q?PeDuzfQBb9w/GtDVnBq3GO1/hkLLF3ZRpQA6xKfXzDb5Cn8EZkxVZfiaGKl9?=
 =?us-ascii?Q?ieUE8rd5NeAAH0mxQ5L1EAJPQUEyFvsBBjiEn1+rUYUCVgtMep4r7cnpfQvd?=
 =?us-ascii?Q?1SFxni4uPmx7/KnkT0Q8wQqlbKUDeSceXhizhOy0b5cFTvdzTy1b7pzbv3kf?=
 =?us-ascii?Q?mIZ9wDVNkGqzeK+tXtIE9z2zL/gnU56v+E3A9F2hJNo1N5mzcnFgspU5+RQh?=
 =?us-ascii?Q?hgShJ6Y+lzDb6A9prIaiMzDftUaFJ0Cwj/l09/DNwvXm3zsRchszGsgGyFlG?=
 =?us-ascii?Q?F+NkjfGa4ENVo9CkS7OKMPLIqZ7prXHQoo6PyAbQS4DB2kWtQsYQ9dedoPpr?=
 =?us-ascii?Q?EMF916xUf0pLmBLniVxk8z2sXxqF0ltgEIev7MBwBZbU5tYTG7IngBq2WFf3?=
 =?us-ascii?Q?f+KTv3Dqrc8GII+NhsfPuFfDLFSTsuqWWYLk0tLPMYVRIkRZN4BNBVeCfui8?=
 =?us-ascii?Q?6UdNl/EihM9DxV3NofacZvakkAJj9J2B7IOKbGgzYpyJQ5NMjXvb4JzI+YjA?=
 =?us-ascii?Q?MHCiZfGxrT6U5wiuua597oX8bSPx05QS2brAq0G/93NdBQ+7UCgPOLXM67JE?=
 =?us-ascii?Q?022OoxjiXtxPyyfXKayBpwh06QEvydrBmiyv6/8neYORHk9FU4pk9SwLiiaW?=
 =?us-ascii?Q?nCwEqfsWDVWBId+N0M6j5rHOcb4B/L9SH45toyS7veuJ6gpZxSKE6BejvxDR?=
 =?us-ascii?Q?7ZOhKd9hh6rDJiksazSO9T5DUk+xDq1+KrKR27U97HIQzzZG1QrQUWPMPx5t?=
 =?us-ascii?Q?Vki31SsEu/50nIZ90DcGb6bC04+ukmuCW1V4Te8dhan49Ym/e9mGBPsQva/8?=
 =?us-ascii?Q?/JjSQIz4zII93b16huzs4B6EIFgtJdfHKaiNCnkHhNavCcW5T6YoJQTT4ff+?=
 =?us-ascii?Q?59w0MfjM3e9F4iQnV4kcY8MH+sj4Bv/Re+mEBodOzdv4ovckdmKKZhK4TBQn?=
 =?us-ascii?Q?5hsRiyl63Fbz2BgyKFPpVKRwY9DgA2fjBpNYZD4N2wMKJuUeiSyKjhZIBV3k?=
 =?us-ascii?Q?2olk0mZnb8ENmzDjFHeQW/wdIR845XtE/34yB69JwOZ09LGTMC1CQ8YizHqk?=
 =?us-ascii?Q?3o4oa2yZsqtxWCQ65F2XGBn1NnNwmSAggRBqqz9M+FokyJv1EU1GRzKUBH5L?=
 =?us-ascii?Q?xBgr2UiLGD3KC9LuzREbv83qBSmIaSnI3LB8UDFcLQglF1pTPuB6/CzEJTIJ?=
 =?us-ascii?Q?bnwGZ86FJXWXQRv2tzAu5zlSl72gBdfM2y1Cf1jpfAs8iOUZ7gm+Kbi1qzjQ?=
 =?us-ascii?Q?Ol6hoYXsJuIm/aWBpcHoerTGTspcS9dbiK44gCAu/BJqqcHG5i3aqAhdArH/?=
 =?us-ascii?Q?RCZRPsHFnQEN1UG4HRC+Ipa2EdccVANLoucB0r8oUehmH4G+rMJRICqnFLaC?=
 =?us-ascii?Q?3GCWKrHFLVm1g9sUTVSMgt2OOlWQS0zDKTNkb5ShP+DxuRGQ6dxuKzY9wOAd?=
 =?us-ascii?Q?Q2T/P5H2ND+eoId4WeOF4Oo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6addeaae-5b95-4955-7b3c-08ddf67c7e30
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:27:51.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9wboAD0lQDpgqUI8/KYSPtbd8Y9puqR9KGrhUBn8XCUEe3lfjQX80jbfv+mt7mLeVg3nVVWc6VFy58+D9OwuBnzpCvJqG6AI7rXBA8ZTYUOrciA5NoiQaPmutg6ZoJU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15939

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
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 85 +++++++++++++++++++
 2 files changed, 87 insertions(+)
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
index 0000000000000..a721734fbd5d0
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -0,0 +1,85 @@
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


