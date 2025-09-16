Return-Path: <linux-renesas-soc+bounces-21889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD8B58BED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 04:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF067320724
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A993221FA4;
	Tue, 16 Sep 2025 02:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RdoWVP/0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2066.outbound.protection.outlook.com [40.107.114.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB989204096;
	Tue, 16 Sep 2025 02:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990310; cv=fail; b=L0bQnGZlZ9Qd/ovnap6UBSMgYnPp2AK9qWXpCB8xJI4LGUUbKOn98CUz+OoBeFYFXoB8jh+RCt/zAj5vI26K1EePeJF8IK8iuiuizURl0GEOkolvdNL4n67fWGqU4UoR/w0AQ9XJkI+BJFXD6ijU33ghF6HGrxkD0d3+lM8rKRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990310; c=relaxed/simple;
	bh=YPpqBFuVggZCEW6UUDW/mmlgeROkn6RJ5piTDptt0/c=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=SlLgtZ2swR9Uou+yIF0YuNn7oGfTtBPmldEjwt4VnY7n8u58d3yCRTMYJilSSERZdHMH1QPiuu3A0P+nYtrtChIwPpeNfh/Z+Y1c+UEKbqoiok6n+H9NHUmzfx48fSNmF+j1AtMAcRr1qkZl6Fz2SHXES7K3u6IrbBEM4Olol+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RdoWVP/0; arc=fail smtp.client-ip=40.107.114.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjqiJJxKleS8suAMZtFR6bormltai/1Ua0Nhtw12j8Wqq5b/OPcWXiH1TIIArSxmkNx7iMAFt11oh0KCn2ErL2jigtQw0TjoFDWPpT8cQ/eSw1jvyAK574bVnOizoUvG22+rUMiGvpNDKgVT/v50vZWweZ9FBGNxRhcE1MNNbZhvSTpjzHR361w0U910xVUhSPsAExxnqDJ995/3NCSDRNJVkINgkK6LDQagrImngGnutYRio5Ox4zPOBhD4Q/YzdVx/VbwUBpGZgG/ccB0FWK+KyMNRmiQ11Jk+6EOs9DbAzVs7I1PAiLtZeS2MoyqJPoPe+yGaQ+2wspVKbDz7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2DMIXMCgbIQJzsAtux7ub4WwVuFZ5oCgYmHZCfeq00=;
 b=U1RFV4FFyrq2u/WuMmx8KHIrhoEbD/fORjPO09fh2D587XxgNZiDqfIsfNx4g6B1UeE82se0RphFX0d7uudzbqzFcpVit9YzPsplnGuPWyMVhQa+W7nDp9pWOrGz8V4Bq0Nymxr0M49AgUCKtduAiM0ft5MuCWGtek98T94wzvemQR12fi54ebDnmZPj3egEuHnXT7vgMwG+PA/yJs0RrhZRQ9+8QadggJ2HFerODUsRdQ4gNnQAWq9e1Q+I4jj9EI88xQ+/XyWHzjU4NoUTRwSe25EIglk6h8b4XtPzdWo9EwJaKz63IXtz9j1IBcoCjYAfGjngRPH61LvFyq2PPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2DMIXMCgbIQJzsAtux7ub4WwVuFZ5oCgYmHZCfeq00=;
 b=RdoWVP/0kzw7Wx895c9PizcVfnUmgkLt7pFLWyIpajUx5uDZ2pmJjcNwvn+QJXtDKAwGdSHJzm0XGnti4NlVdVH7AsInlaqE8XlAXeKZ2AN74bayU+Sa9tpfa5fBDH7hywxNgbOmPZvCGziPGrJ0e25dwd32uGsTRc5aPXJ8PlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13477.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 02:38:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 02:38:25 +0000
Message-ID: <87segni0kg.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 1/6] dt-bindings: soc: renesas: Document R-Car X5H Ironhide
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Sep 2025 02:38:24 +0000
X-ClientProxiedBy: TYCP286CA0176.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13477:EE_
X-MS-Office365-Filtering-Correlation-Id: 894d85c5-d6e3-4cbf-0292-08ddf4ca1c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wX+15oBMWXJm1BG1fc0XiPJfQLRK21ncu29o1wFRqO+GGFo+HVtO3gdjriGr?=
 =?us-ascii?Q?LlegvUFK1500TpDgg04N5lVejx7goH5Gnkp1i/tbd1TSaUkgV76DrqNmilNT?=
 =?us-ascii?Q?a9vh28Xrbp6/3h0qrR2EFsDerAne+cQJbUBWqZFMMrB1nFWduUdJV/f93QTT?=
 =?us-ascii?Q?r7bAjJZBp5XCeNixhfCOLTWbxNup6rRGNui5LARJo3MQ5eeLZL306MyX/Nzx?=
 =?us-ascii?Q?q2vQSm9a7loPu08k5Vn/62YDbHVDRxbI8zib6JcUcfogjLRd9Lh6q4v1xmHG?=
 =?us-ascii?Q?lyA59NL9oKbcMsDAk0oNp/lRhKhmuzZkRhkoSqkViGi5tksqdfXojh5yW5jP?=
 =?us-ascii?Q?OEwiK90y2SJ0Kctq/jB6661dqHNVN/INlbeHIj9RWncNbop9HLQM0HN4rZPz?=
 =?us-ascii?Q?wpm4RoHUoohwpidmcs+CjX14wbbB4blYxyneLI/cZ4oXd/9+dbD4BkFyxxVA?=
 =?us-ascii?Q?E1V1ou4HPEhmGhGq98kROgei+3A+0EYAvZbIWuOfKgBVQJWqFg1RJVwBsoJg?=
 =?us-ascii?Q?Uw+wg9xJL1cd/qMPju932QYXe+cEvdgzEz16nzVN2pacamaxMMXjbPLFWk5O?=
 =?us-ascii?Q?QdO714wLHjY3rTMOaa/mz3DRxMts6D3xEkb1q4SJYSj59toEIGtArYybT3Yi?=
 =?us-ascii?Q?S4i+xfMuZpRo74pFPuTEz34ZIa/nR0HWGRyEacWBctBk62qr9+Ij+D7AeE0Q?=
 =?us-ascii?Q?pH3NsDNwAcI67vdT6Tj7KAuW6qstKFYbxAqAV4kbwZm5lc38W6mBxeDPKghc?=
 =?us-ascii?Q?CAP9X2f98n1tB5uBCtrgmmlJm+TOvO5tgYG+GOQLdWs4CEadpHVCfSdSs5Pk?=
 =?us-ascii?Q?4Cqj97jR8dIevHjvm66An3G2DSUq1ASYSoES9lHb8skYs/qV6MT2IUAIrXGy?=
 =?us-ascii?Q?jRcL8xj73T8+yrpBVoIz3m5ZZeKaeABbF/Q6lV25nbbOFosbNkFl+7jP1XT/?=
 =?us-ascii?Q?2bSomAR5bDftOBy6TnyAj85Ajhk9PxXE9waW7P2LQTL7TJGmM8DqJaiQWWJP?=
 =?us-ascii?Q?Nq1IHFftOo7TuoC5iMPn3I6gvCnerb1ESz5wX27tqoO3cKdszb0NcCTa/IXS?=
 =?us-ascii?Q?O9ReKrN4ilWfAxDPANKAiJ54AEgGHQeCUQJNA2eDD2Rzs5chaeW90cRcAUth?=
 =?us-ascii?Q?Ww6nKthBrdk2EwpmHpz80g2LzzyJzkTAFIQ775s7KzdHRr2F2G6RM3rqu2o2?=
 =?us-ascii?Q?j9+b+aeb1P5IRjDZleuqVroRbhmf+x6Ebu3DtGH6UIBXSN/9f25wVoC5P3H2?=
 =?us-ascii?Q?1n9Kv+X3nOZN4PY86okoTHvOjB3wAqaBO4cQLRm/C6jFUekP5ltw99ZihM1a?=
 =?us-ascii?Q?Zka6L3BrNT7hIU+mV2BvWFw1Qg8fXlpQkLft2S1K2LvRdn6i0NW+WIFI/bNv?=
 =?us-ascii?Q?TJZj912HQow+mZzwzjiA8Ag/RyGDb9aHuS2JF+/GembJFrMV4F9Myy4eh/AX?=
 =?us-ascii?Q?aFNHsxqpO5Keg2VD+qDE2wqtT3JZiaD7CwSZkE0NkWDUyA/gvY09GWlReFR0?=
 =?us-ascii?Q?PiM5slW1R4HU7dg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6si+yKn8Z1GY16eWmRGmNk7BgiPvfjoMJN7wtkoXQ7JCp83iHAcBDSKMtJ5O?=
 =?us-ascii?Q?C0RTHL41iUVJRQGfYfSJ9Ojf/zqeredAjRW/sK8Y1aWFblJ49xfoBpDR+WRH?=
 =?us-ascii?Q?EwJBTRVya1HJcEecHDRcLc4XBU3ADEQt9dOl87WCja+KsEtrduJL811KMNVz?=
 =?us-ascii?Q?p/LlCyi9pREdEDhwFVcdcpNTErdNnbz+mabsxBK9yHNineNAx8z77niw2Z4C?=
 =?us-ascii?Q?oJ+n7n/IU/KOz15s0vYnkZQp9mhM3hQK8A93+IMvDRVkYBOnqeTZ3vrMO/BU?=
 =?us-ascii?Q?4CMBMmKM3NLUQQPf5sYvF2Dry/1xGA7EiP9AM5eIfNrf7TYqopeg4J/sPjCN?=
 =?us-ascii?Q?hxKmFHavQ/qVtzjbjHQdEpkQeTg7rnwNhxmZ6oTK+IW9eFG7UlBjvSDx6v/t?=
 =?us-ascii?Q?yOFiWckfZshD69BginznCxk8No9LkyZ1y7xCPwuUwUu3H2T1TDBsSlvo3AhL?=
 =?us-ascii?Q?B5acyOxEhMTSlSfQGsI0IE3a6QatBk9wQKvSzNrKgP8EClMrweV9T/SI7jdD?=
 =?us-ascii?Q?+qW+mvPLGB/Vum33HVFADZ458Dx2Q/UlG65VbJBJuljZX/5DCod/UK488s4A?=
 =?us-ascii?Q?BQa5LFZLA/H/cYZvkCSi32kcJKvtqtysGeR0RmSifrDQDUpCqUCYupozh9M8?=
 =?us-ascii?Q?kyfUbZT+jVYlDrnyIKqbnTj9s5z2BupubbAd5F0uQ0vkbQ3Ik99RqBnb5onX?=
 =?us-ascii?Q?+mPEyNKG6wsvbMD4bhXKJVGCe3GEmJQ984haL5/CZg4TbIvUQYJnCFoYZ6wf?=
 =?us-ascii?Q?K2ayw85hsgmU+jr8Ta7XJzvaabnWHoFUZ/D3ACrB5z9yzeetVqiOXa3/SLXp?=
 =?us-ascii?Q?3lW3cYIZGmDLX+VvyzFgPn/+AvBklwKrfG1Lrp2JnPLi422/TWkDQVSJOKEr?=
 =?us-ascii?Q?pSYiZGUCH9R+CWLELilMce5sl6zU6aePzp2V2NZfUX6zmEmAN9bD/zVlCfxi?=
 =?us-ascii?Q?cV1QBOMmW7p6YEP2JPeV6JFFzyZEbj1fUaEKglI8D4/1dFTooQ2dBanGgwPq?=
 =?us-ascii?Q?qhh/gWHtjNEot0ApUeokH9okcbmAE7D4HSXoSkw00Ea8P8TkV/iBU16tNlRX?=
 =?us-ascii?Q?RWLIZoFOHsmF+a1sp+4nIRvClAjgXRUm1P/xyt/lgOWR0zNGWuTX+TuUoKPO?=
 =?us-ascii?Q?WHGmteGNn0O6gmuMyVHcdR0Qhp3oeBr6NbomoYlhrMAW29ZFPmL+Q31idW2r?=
 =?us-ascii?Q?6Jz3d2HsAdF2i00knUkyMS3K3NSHVtX2iVqpILIcfhhRXQVoPTXjk0/qJNIh?=
 =?us-ascii?Q?SNLtBZN/AqHCe4jVSV2+CIKhYa8NfFoQ+U7tO2cl1P+39O+1TgVcjCHrAz9K?=
 =?us-ascii?Q?DoI7VyWosLAI8GGiUTrU+WoeBaff4xx605r1BV8nRxQ7PnTqq4lkpMTEZS3w?=
 =?us-ascii?Q?RzidsCLoIZMQG+9vXzXDojfIBjeIJvbB2k5S0xbITJgICoP4qDfv8YtEeJ5H?=
 =?us-ascii?Q?byqmca4j1VyMERGujqaQQRhVbjLg17phuaSNm27zZD2tmhKUe8ROq9VZvYul?=
 =?us-ascii?Q?eDv9L4cESjsgpKuPkhaT9cPBsDdlg2KU+fQePO3QwC4Kt7MwkI1tIhVPP6yq?=
 =?us-ascii?Q?e1/Xx2Ua9ByvimGED1JDlBz185GNbqxTIJZhj/Pend6jp41nqsgJ8c/+PK+Z?=
 =?us-ascii?Q?Bjq1nT8g8klJPuWB1yn9+QE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894d85c5-d6e3-4cbf-0292-08ddf4ca1c64
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 02:38:25.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQDWsvrbIPcVu+P4y1a+fYP7hp0ggPFoDYMi7x8GuqZ0aG01C4hoNB8NCn7L8asx9G+x+kQ/gCpGPJwOho8v5Dscf0VyrAs2SHZSz//UPyKrBwViaDlFZE0t8lKxaTwv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13477

Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC,
as used on the Renesas Ironhide board.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5f9d541d177a4..f4947ac65460b 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -473,6 +473,12 @@ properties:
           - const: renesas,r8a779mb
           - const: renesas,r8a7795
 
+      - description: R-Car X5H (R8A78000)
+        items:
+          - enum:
+              - renesas,ironhide    # Ironhide (RTP8A78000ASKB0F10S)
+          - const: renesas,r8a78000
+
       - description: RZ/N1D (R9A06G032)
         items:
           - enum:
-- 
2.43.0


