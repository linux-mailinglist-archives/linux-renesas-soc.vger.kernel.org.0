Return-Path: <linux-renesas-soc+bounces-22007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4314B83230
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 08:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F22B4A5B56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 06:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9D32D97B7;
	Thu, 18 Sep 2025 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dJP1vbLP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666802D94BD;
	Thu, 18 Sep 2025 06:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758176852; cv=fail; b=WlozjVdorYO/SbpCiziZnLTsKr1r3gulmO5qIjjNQSeUyY7WNG+UVLeFOc1mXpTr41RXKgtddQrrKplEV+tORn3s4MiqLOZI2bsXTmmNhYc319OX1TshxbfT4cj+bJQTHRF0uoDKpwL4/feYp1oiZ69mjmtt0tPmvPsHO4sarzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758176852; c=relaxed/simple;
	bh=HVdA/QIZHuid8pKNJCx0+J/WOggrnf+iFs11nzodhjY=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=IRUHesdw/g+Nhp8OQiF+vKPE2KBERCDUEr4e26IkjDsdQBVXonGoKAJh6Lf6YwgapaRN4FiHbbzadkwfwxL9dNfqgjaxN5y+AJsCTu1ypcQn/FvHEME0UKrJJRJ+4nxebNNPzarj5IAVPYw+KlBccvzWFyIPAO3WdKuhwVCFVCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dJP1vbLP; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5GILXipW2dzvIB7h1wvmTBTzm29YRMMJB7VDPD14xldfi9i/7S5LSkgaOwiC8srkIcbwnDLe2wKbYcmkDjhD+t2Y6qt1Hn7MoyPkOq/ONw8WiYiTfMtuDQT8O9jWBWdVEOzCoV3ac10OcznuK9lK8I9aVop2Oo64GrQ0J48XJCtzzg34z+x4C+MiYRqcBGlsW8ZHS9GEbKLBhRYLeodIbLFeGkU/r1R+z93sEiFL27RtUe/wWv1qI57oZNNNwOWLT8IO+32GHstHfeRW/lM2QxeRbmvYD5+a6FGQ5usTlB5NbGlUnW0lnuCzay2SKFXV0DNcxm9irXPTCHipixiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tg59TM0qnvVRiJRIimXlW8jMfO0unDm9lwgcbWwpK0w=;
 b=a1JZUoNRWTgVvrhsZvPTw+mxDpqJaTc+kSefCZTahtbMChJJP0XeJMReZf/TnFEFtwZNRdDxtXOzMRAV/IZP22HGRq3TxA++ejQI1tn3Zgx1vWLxV2sTAfS5iirjs/Zgi2A/WPtLQjTms0Ru83cEqq8ynCXyC8RFH7BzkmHFmwcMxSx8unHzs+X3iRhN844WQTTydxOAYfU+IEZ3TiUoKh1TzCTXFaCByuKN0qFipWFtgXojEdoqO2qt4CDF/X2SOO1FHa5xGjFhF1TyVfsEzQXmaHqqP43jT7w4VKAPClR8nSG2KtEomL9ZY4ifb8QDl+UoHlLZA67Wjcm9H6Y+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tg59TM0qnvVRiJRIimXlW8jMfO0unDm9lwgcbWwpK0w=;
 b=dJP1vbLPxoXKSI8/k1DNOSBjS4PZIDEGGkimFiOrVfY0nnHumy3awjiw9FU6+Rni59k1XkteB7lblwdwa5VAvJ631XSHvIahKeS/q9cz8JfQ9/Q8BokHEPkbReF9VzfQxcS+NyogsC7HBFte+SrnoSfTqcvEnnIKy+qE1pul69o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16214.jpnprd01.prod.outlook.com
 (2603:1096:604:3ea::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:27:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:27:26 +0000
Message-ID: <87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v5 6/7] arm64: dts: renesas: Add R8A78000 X5H DTs
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 06:27:26 +0000
X-ClientProxiedBy: TYCP286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16214:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c9dd07-0303-477e-e4c0-08ddf67c6fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7JprmS2pU6MhGGnfdXo0rSiQR/hia9kNRVncSZEyNMr8bCbEv4L9o/k5S/uH?=
 =?us-ascii?Q?iH3WeueuZjNh3M9gx8d1aIaL7YYOt9imeFnEqzrMF3wSHxY7K9GeSN8joKRh?=
 =?us-ascii?Q?CcUC8p35qJlG2J/bSc5+90vp4w5ixsB6fwzg4VEpK6ufmPK9rjjtcGkY+h8M?=
 =?us-ascii?Q?kvl8XgWN3/UTnQITznMdJ2B5+3kWwiO4rNsQGg1bWjaZ0xcqaW+UBolC7FGm?=
 =?us-ascii?Q?oFViQ9ZkuweRPjmFKV3SfcngEEkvBm/3oUkhcUGWducwHnVIKgaoQ0KCZX3l?=
 =?us-ascii?Q?pfcmLH72pCZU54PTjZXj6JoAtppDQOSXZtyrmt4T5W3am1cQ6ZmatBZsQp8Q?=
 =?us-ascii?Q?Kq6f6RVmckBRPJzikzTA3Ib6yCfvmZyq+qM4NqWsyMTwgv5mqcQ6+jqXOaIx?=
 =?us-ascii?Q?sOQ9Q96F3DprQpK8QmK9xY0EIYs3aYIeaOAz6JYnYps1d8ko8QM7rq3rpDWn?=
 =?us-ascii?Q?c4PYnneEvRDfdSGV6jG5eSenuU51UvjsVpl7UkH28e6swNkQuJg+8GSrp3pT?=
 =?us-ascii?Q?FnE0HzkXdF59gxcX40Ec72U7zO1KoZomP4nK3poaXIoizPydOj5BF09ExVmr?=
 =?us-ascii?Q?bqX16hvLtQppldfwwyyruQpgGfJyMJab93ufHAtKXI8JI0/ZSRK132jrd9h3?=
 =?us-ascii?Q?OySY1ZMOfpHJoaDMhK/CDXaH3wXBo69cnOTxrfmPXmd3zCOcz5lKB8/OD4gc?=
 =?us-ascii?Q?YDTAwWF9PaRXs+jZ4DW/FghefMkPledjzn62qf+52ITmQpnqzcmLpI2vWgb1?=
 =?us-ascii?Q?5/vw9YD89ejmZitN1h1qV2H39uooid0qqYIoRg+XzCcygyEbllc+eoFvCGt8?=
 =?us-ascii?Q?/eIm6uIPwx+o3N4i0mGGo+yy115oogM7YQOA8pC1jZMEbXU82nzdNXXe9ykG?=
 =?us-ascii?Q?0c0tNQuPsl9frdpdqAJepX2I5kF5wV6EB0dUE6nU5Bg8nAAmhYclAVi4SGMu?=
 =?us-ascii?Q?y6Q8RVKgr/G9cXkHuNYYYbmhlH004bijNDz9JejmwvXOKMuSB6N9zUkF1Fup?=
 =?us-ascii?Q?Xzm1XygUujg2OIDr4U+fo2npjqpUQYcp4JFanc9ojfwh28pxElhtRNLZui5P?=
 =?us-ascii?Q?3i+xlJ0LdMyqSvXNRoQUKq27AMgJUH3tOu9phYpz5/FmA01N9J6140TfR7UL?=
 =?us-ascii?Q?39NhjhTiwB1AA/BuJc/I5CzItrppSxWFxHjorF9Rld7TO/netmh98q22/2NN?=
 =?us-ascii?Q?vAOlTJqJhPNaDCYJfQn91B6J4Woxlom4MUGXsBdAn8UePlqLYtQHPrkKgMBP?=
 =?us-ascii?Q?+X7GvHdv2RPNuGNYXKAg6a/5a+VfL6C1ITTWIrizcJFryLgTP5Wkw6q/pGu2?=
 =?us-ascii?Q?D7PwKjSjY4I7CO0/CF3Nvwlhev+tlOYBDTOWIjMuOshvfkuRuwLu5piW2wUz?=
 =?us-ascii?Q?05B+Ms5KF6c66JG7CuU5mEv8Lb2AoZRLP8Mj349ZW9GcHc4LZreHMwqO3gmb?=
 =?us-ascii?Q?dUxEME6ORDdi1fZjumrxo1TcmIv9SuQT98DM+psMjkRsCOAwQ/YsGXcz03eT?=
 =?us-ascii?Q?0YDECqeFTA6WQb0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJzCIVDPQfY0Oz5EZsaxCtpZDj4Jv3mL9oG3l1wWoO4ORqOMFffwuOUuA3HI?=
 =?us-ascii?Q?yySmFMi/HpDt5fHVmApc843NTBVmm3iGTmF5I7C1pvfCZmBY4e0WHKgm6woQ?=
 =?us-ascii?Q?K15ZPR5aHNxrI34Kz2RJnG3HPa0PACxMuCdKXqLyaNmPkRQtNSQ7Uqus4iib?=
 =?us-ascii?Q?lhiUKZtQRxxsJ3p3+xciK5I+wHaFboYhhDZoUbPj6Gbjrh0Xcyzy+plBNi3E?=
 =?us-ascii?Q?7xyITXqXeic5Np+tVON/zaINJpg4T1mlV5iNkgfBWmpgjydBk71lRpuVHn8E?=
 =?us-ascii?Q?GZdDCiXINZqljRYN3JL27Nj8/ubsjQDOTsgbSWEgX5APjGZaXLL3D2H7BhTZ?=
 =?us-ascii?Q?+lemWT4hS9cAyNkXQy4GCfBfQN4JUtbu0b4RMGVudJGGQQoifSX/JipKuoui?=
 =?us-ascii?Q?37YPWZ1X/Xln30/6iQuyWMSwQ7SgK/8Pxk9EegkzHtmVsC11V6AqbcPTtJ/y?=
 =?us-ascii?Q?/PdNauvpAh/S7ciHy8U4hBcdY2puamhfxudVjZ9dmSSGl8o6dIdgnaExgCW1?=
 =?us-ascii?Q?DMIT7v6GUcYH0v/Vl8kRUoE3IOTvUioSQRpfK6YwAYfqKBZkB8YDaoggctBL?=
 =?us-ascii?Q?8B4d/HTclUcbjq9NQ0yf8UFOfH7G303rPqp0ZB68pbfRx/ytw5P6r71fSrM2?=
 =?us-ascii?Q?yFJ4l8tORQVU5nD2Atpbu5LT0GHZtGyZZmvyAGUxO0VMx8yvEK6a4xxA3UFc?=
 =?us-ascii?Q?HrEsQ08lPDgbWdWeUzvU5G4HlGxeHwSO7WYCydQERzKj91N//eVhs3SMIOho?=
 =?us-ascii?Q?SlOvV0IFJ9e/1zxq1yYwbDh6HivKk0/3HErmHqN09ljoALja1411bdOD0zV8?=
 =?us-ascii?Q?WhvLCIsO/fS7Touxf91Jt5EzI+tzmpuOz5x1p/XByNdQvsj2kbBFzH8LKVdP?=
 =?us-ascii?Q?B9S+E0cjb/boaLpE6inL12TiPxv0crBrqzNM3dzXAB32Ai8Xqlm4Jita0vZ8?=
 =?us-ascii?Q?CHT6tJ34PmzqCGQnYqZTiCa02DUr+kQkwBPKJLiNMUQ3wQpjjK4CKUmrRtxr?=
 =?us-ascii?Q?LdMvfuGQpp7l2vznLl3EHPASQM4+Io+DUmdYrEjj/NcruXy+dN8So5GlZ0TT?=
 =?us-ascii?Q?KMakFyDx5N7vSejo8sbvUchuPAIpMRKi9PVUF1tXFlTUuzbAxpvU24ow4Brr?=
 =?us-ascii?Q?j9YCjNkXZOWbtDa2KEqyFCu+NL6Zq/bBSa2SCm1f7b/TuIRgGQY7p5a3VFxs?=
 =?us-ascii?Q?1h5W6+bKfGrbM83+1VTKZAh+tGr8EQzvKgWZ1JHUfD+D2/MiPbPMYrRxBYmq?=
 =?us-ascii?Q?9QmRoegRmvA6fyIVsQJSMimWtCRv/j/rUwuvKS6aR0KKNglSZvwEvqYUuf2F?=
 =?us-ascii?Q?z2uvB/XV/j9iXu2Ei0Pv15wr7WpH0g6mRGIferhGF1Ev/YCo6Gyk4D7cHlQA?=
 =?us-ascii?Q?c49gien99pGp7b/VWuPAa+T4JT/AD2xzdUr995O40ixOzkx5WA8RZHMvgNVE?=
 =?us-ascii?Q?YyVJzfotkeInA9++NaWDs8vpqARb70R7AOXlJBywpr+suueaLZu89Tjpm33K?=
 =?us-ascii?Q?Tf1mzFy5dbMcGF9QZ0FBMsJZ19HzG7lM46/WeqY7RXmP0rZ6ui4Ryu5SV2BG?=
 =?us-ascii?Q?SziRZ2q2q5dvxkPLOmaNq/dyt0GmLocah1OUpBfy7QOttCCy0PsGWUB1MEbC?=
 =?us-ascii?Q?0jn3x1wab+RUpcys20f0gjw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c9dd07-0303-477e-e4c0-08ddf67c6fa2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:27:26.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIasgUMTBQlNB1nHoHF/bPDiKXwbo9m8Lmqbcwk4B9KXI8wImyAtp0JLgX5VfLwzMwIewe0kKFQPViITp/RJRSyrL7IV/NTuUvJoCMXaZt0xKnMcvqsYe0mRkXcSSPMP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16214

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
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 787 ++++++++++++++++++++++
 1 file changed, 787 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
new file mode 100644
index 0000000000000..96d87d5b50859
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -0,0 +1,787 @@
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
+	interrupt-parent = <&gic>;
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
+		};
+
+		a720_1: cpu@100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_1>;
+		};
+
+		a720_2: cpu@200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_2>;
+		};
+
+		a720_3: cpu@300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_3>;
+		};
+
+		a720_4: cpu@10000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_4>;
+		};
+
+		a720_5: cpu@10100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_5>;
+		};
+
+		a720_6: cpu@10200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_6>;
+		};
+
+		a720_7: cpu@10300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_7>;
+		};
+
+		a720_8: cpu@20000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_8>;
+		};
+
+		a720_9: cpu@20100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_9>;
+		};
+
+		a720_10: cpu@20200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_10>;
+		};
+
+		a720_11: cpu@20300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_11>;
+		};
+
+		a720_12: cpu@30000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_12>;
+		};
+
+		a720_13: cpu@30100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_13>;
+		};
+
+		a720_14: cpu@30200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_14>;
+		};
+
+		a720_15: cpu@30300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_15>;
+		};
+
+		a720_16: cpu@40000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_16>;
+		};
+
+		a720_17: cpu@40100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_17>;
+		};
+
+		a720_18: cpu@40200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_18>;
+		};
+
+		a720_19: cpu@40300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_19>;
+		};
+
+		a720_20: cpu@50000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_20>;
+		};
+
+		a720_21: cpu@50100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_21>;
+		};
+
+		a720_22: cpu@50200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_22>;
+		};
+
+		a720_23: cpu@50300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_23>;
+		};
+
+		a720_24: cpu@60000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_24>;
+		};
+
+		a720_25: cpu@60100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_25>;
+		};
+
+		a720_26: cpu@60200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_26>;
+		};
+
+		a720_27: cpu@60300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_27>;
+		};
+
+		a720_28: cpu@70000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_28>;
+		};
+
+		a720_29: cpu@70100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_29>;
+		};
+
+		a720_30: cpu@70200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_30>;
+		};
+
+		a720_31: cpu@70300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_31>;
+		};
+
+		L2_CA720_0: cache-controller-200 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_0>;
+		};
+
+		L2_CA720_1: cache-controller-201 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_0>;
+		};
+
+		L2_CA720_2: cache-controller-202 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_0>;
+		};
+
+		L2_CA720_3: cache-controller-203 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_0>;
+		};
+
+		L2_CA720_4: cache-controller-204 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_1>;
+		};
+
+		L2_CA720_5: cache-controller-205 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_1>;
+		};
+
+		L2_CA720_6: cache-controller-206 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_1>;
+		};
+
+		L2_CA720_7: cache-controller-207 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_1>;
+		};
+
+		L2_CA720_8: cache-controller-208 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_2>;
+		};
+
+		L2_CA720_9: cache-controller-209 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_2>;
+		};
+
+		L2_CA720_10: cache-controller-210 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_2>;
+		};
+
+		L2_CA720_11: cache-controller-211 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_2>;
+		};
+
+		L2_CA720_12: cache-controller-212 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_3>;
+		};
+
+		L2_CA720_13: cache-controller-213 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_3>;
+		};
+
+		L2_CA720_14: cache-controller-214 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_3>;
+		};
+
+		L2_CA720_15: cache-controller-215 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_3>;
+		};
+
+		L2_CA720_16: cache-controller-216 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_4>;
+		};
+
+		L2_CA720_17: cache-controller-217 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_4>;
+		};
+
+		L2_CA720_18: cache-controller-218 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_4>;
+		};
+
+		L2_CA720_19: cache-controller-219 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_4>;
+		};
+
+		L2_CA720_20: cache-controller-220 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_5>;
+		};
+
+		L2_CA720_21: cache-controller-221 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_5>;
+		};
+
+		L2_CA720_22: cache-controller-222 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_5>;
+		};
+
+		L2_CA720_23: cache-controller-223 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_5>;
+		};
+
+		L2_CA720_24: cache-controller-224 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_6>;
+		};
+
+		L2_CA720_25: cache-controller-225 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_6>;
+		};
+
+		L2_CA720_26: cache-controller-226 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_6>;
+		};
+
+		L2_CA720_27: cache-controller-227 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_6>;
+		};
+
+		L2_CA720_28: cache-controller-228 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_7>;
+		};
+
+		L2_CA720_29: cache-controller-229 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_7>;
+		};
+
+		L2_CA720_30: cache-controller-230 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_7>;
+		};
+
+		L2_CA720_31: cache-controller-231 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_7>;
+		};
+
+		L3_CA720_0: cache-controller-30 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_1: cache-controller-31 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_2: cache-controller-32 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_3: cache-controller-33 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_4: cache-controller-34 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_5: cache-controller-35 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_6: cache-controller-36 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_7: cache-controller-37 {
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
+			reg = <0 0x39000000 0 0x20000>,
+			      <0 0x39080000 0 0x800000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		scif0: serial@c0700000 {
+			compatible = "renesas,scif-r8a78000", "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0700000 0 0x40>;
+			interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif1: serial@c0704000 {
+			compatible = "renesas,scif-r8a78000", "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0704000 0 0x40>;
+			interrupts = <GIC_SPI 4075 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif3: serial@c0708000 {
+			compatible = "renesas,scif-r8a78000", "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0708000 0 0x40>;
+			interrupts = <GIC_SPI 4076 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif4: serial@c070c000 {
+			compatible = "renesas,scif-r8a78000", "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc070c000 0 0x40>;
+			interrupts = <GIC_SPI 4077 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif0: serial@c0710000 {
+			compatible = "renesas,hscif-r8a78000", "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0710000 0 0x60>;
+			interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif1: serial@c0714000 {
+			compatible = "renesas,hscif-r8a78000", "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0714000 0 0x60>;
+			interrupts = <GIC_SPI 4079 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif2: serial@c0718000 {
+			compatible = "renesas,hscif-r8a78000", "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0718000 0 0x60>;
+			interrupts = <GIC_SPI 4080 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif3: serial@c071c000 {
+			compatible = "renesas,hscif-r8a78000", "renesas,rcar-gen5-hscif", "renesas,hscif";
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
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
+	};
+};
-- 
2.43.0


