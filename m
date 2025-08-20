Return-Path: <linux-renesas-soc+bounces-20755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9BEB2D9AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 12:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C39D5E252C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 10:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8962E0B79;
	Wed, 20 Aug 2025 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hZdLXr5S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A512E0937;
	Wed, 20 Aug 2025 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755684309; cv=fail; b=QxFvsi9LfEfCZxq+HjdtNnclSK8aj45f9ceifIHXzDeb65pwi1HYSShQqKEVQxZyOUCsn3qWj9BXEhCxio//ZveGVa9zcjLpmB4gwTppSd2d81pvbU2Q3UQSg8V/KSrMUj0le6QmDLGRmt0qDaCTxsdxEZFAdJE0gJP6xBcNST8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755684309; c=relaxed/simple;
	bh=9DIB9lRJ5fflTbpwB0//qnXFaHOphzAkMLBMkgR3fWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q6o95YpWYUorlHsL9mopPDOqbSbtsYHSPQjGX0TPEkZjbzzUI/MkXc8yV4jq74OXpCi7HHEz00/Mo9Zzuc1SpCKs9LWjzZr79gwvYq+RLP1xSl73YEsyiGvNyjdWC3USaNiRNNWkAbviQTArhN76pH/0kOv5KoJ7YYPvRuiD+LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hZdLXr5S; arc=fail smtp.client-ip=52.101.228.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kD1XYNuf6c51NHbBduEB0f44RrF375xk7hUILfPE3AZuC+FE6vEueZkfDR97ITtXnqN51qSlXIw1sf/tPH4yFmWurA0yRbHx2QNO6e2TMKU5cdGUxJIuxO1pb7ZJdGNgbbIB/m0nohLGk4twIiNpLtreqhMUU7IrpHGmPqk/8nmqevdxBU4s8IYrhzB5qcL+kh/xPiGC49d0U70JhN2jkrAcjSXJ70F1Bpng+ST60q0rXQgYZiBL7R6SONVqt00MXW0jgR7hBTD7a1GSX6FnVNBv5pqaEIX43LizvqN5C/Ix2TMR78Z44D5cytZyMPWAhFPZOShxkh+vxSVxPW8VcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9dlC6o0TQgMP5Dm2LuIe9GDHBc+l4moqU7iI7l9InA=;
 b=rRRMuuqyMVGEJx3Svjn4WHr/VdgTqOLghuvZ0XfPWDbPDrFpRTidzKZFBtDejky4ygSXSDhDffgLOcvDwI3GCv7YisDKeEzRSsjFrQwR9flcFGI/rr5Z6VEem6g/cOE+IckcSxFcnBcZN+yloZWvTMl93kINBf+kykY/9cW2M0YVbXufjS6MIr+H225V0xG6ZAnleupy5CJBedrRTqt4Pj+sQqrtpkLtlTuehHx+/ylwePevV5Flyoyv1tf5zpwFDDRbLfMBlVk7w1bJW7SxTliI9usQ/B+MZGopicX43NWALHoQ2Uacr5e6X96ESl+hxauKDZymFwJXdS6eha7Y2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9dlC6o0TQgMP5Dm2LuIe9GDHBc+l4moqU7iI7l9InA=;
 b=hZdLXr5SLiQ+Xj7Et3x4f0egHKKqCmT1PoozbsQB3x7EL9AugqwoR1r79jmIoNlBabrZ0FGViQ3/FSPZMYt9ll47Hr5yk5jc+lqggJDbPLvQPcT0cR9cwZyCSpfBVEozyCp6liORDW5JOya4D3LfWA88K71Z0a4+u7jbq7nUFq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8109.jpnprd01.prod.outlook.com (2603:1096:400:11e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 10:05:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 10:05:05 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] clk: renesas: rzg2l: Re-assert reset on deassert timeout
Date: Wed, 20 Aug 2025 12:04:23 +0200
Message-ID: <20250820100428.233913-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0182.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: c25ff1b2-6e08-4905-e6fd-08dddfd108d9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tWJvqgokYxbw8jDP5e2ZWeii5z+Kj/OWU8bB0BQtu7lQIPD3KET8Q2L16RuM?=
 =?us-ascii?Q?XNjOUqNBjD22hsat+v6izlF+KmZvQ3wAF0wefVt+at5P4xL/Zue/2du+Bgfb?=
 =?us-ascii?Q?YCrKFqUvPJM8P/KLK/Yxxfd7vwM/6PsW0qyB4cKHDa3+DB0O/lbq9BSHRK39?=
 =?us-ascii?Q?n1wGSZO7QfbF7ACLeTSt53kiHt3+LxdG4zPgB8Zs8MvD/TB62BwEsFi03BY3?=
 =?us-ascii?Q?EKfZby602bPmdttWvvLa+Wi13v0Wt9QlClGksJvQ9PiSpYmemNDekVE4oy35?=
 =?us-ascii?Q?8lIkug/3mPLrOEBremKMHW4y4A2aQN2RDxNxBfRywRRue1rfTGS5GhSCKGvq?=
 =?us-ascii?Q?wowVtQmTdvvWCl/23jfWtmVbNZmkaokh75EoQiAESfmPNfhB6sfr6ZvUiNLL?=
 =?us-ascii?Q?JBHCJVsePmvyoJ+VeUwWBSneJWpjMrIY6R0qGWXFR0zvHhhUEXHyzGHDLJ0O?=
 =?us-ascii?Q?9FIzRrqHkoZSypLtYoZU5rKQVXj7BQ1jovOsvDcjuTIsYTJLus8K6Ee61W9T?=
 =?us-ascii?Q?lNL42ZnJJ6pvoR6xnP9AAD0sYyoTAk8jZxSuCmG8iBNqNSwpfRBjp0q2gXNN?=
 =?us-ascii?Q?6DR4tPBsm55Bj0p2fwZ97pAuhh7uHeOQgvtCSDDSYUZpVD2t36O3/24pzq6i?=
 =?us-ascii?Q?GM4hTEiFvo6fhd8WWbyyF/VB1ToyJf/3rlpNveLn7VIAqYidotudPEJ9vQM7?=
 =?us-ascii?Q?1AMvFOSoAGtzuTVfJIMyVzEI5h+3tFl7QXoC2wFJccQMK775JT8DdZrs/z/L?=
 =?us-ascii?Q?iU3ZxtnqMkunAMtxInKrZYK5aHUvcTM7rbqokZtVPOsCGCTj42NkIZQGeeRn?=
 =?us-ascii?Q?eHos17xIInRqDIzpP6Y6Nm2X2ULy4MeUuURRAPhlqYW9IY9na5qYl4AqWhlh?=
 =?us-ascii?Q?JfVf9bqFvTtPGFFS5V89v1eH6QoErYLluRZWAgj15V1LaGLtrAOPCg5XV/cW?=
 =?us-ascii?Q?dIpFRcsue8TzhiyqeEuM39W9QSUKRYFdMLlYHo7IuPUPOWaWOnhw4e60MMxR?=
 =?us-ascii?Q?+VkU0JbphLDcFQsy9BFHtsuXrbVR1Se7h25PV/dff7fecpt27UFViSNdyiSJ?=
 =?us-ascii?Q?054yj3EjgRd1033oYrqRkzPJAmEN1RH3/7SKGXsh5+n4rGIc9T4KeB46v53z?=
 =?us-ascii?Q?dRy43FJJOa9QytAAGYWvf6zjZCVb7dSKoWL/3qYXaZ2/mrxXCuMzdnjEmkL0?=
 =?us-ascii?Q?h5e4nTSmiVGBnI4KJ2i88MQrHNU/meI7C0e8R8qizbxGySa07MlDHfbODlPJ?=
 =?us-ascii?Q?88b/dGdaWnQmM2AJuZSOF0NvCFfpi4ume+gs+pNNkczjkLN0ZzfBnxQEFRmU?=
 =?us-ascii?Q?cwQJGL0iSHsQ29u/Yxc5hC0d7uM6w/q6I3x65/CLHJvmDp6Bt16nb+Gx4EVx?=
 =?us-ascii?Q?sORi9kXBE+CW5tcxXNWnKLzB2r7xANQYWHA2j3knAM1Bsr3LsduFqFOJ3lxG?=
 =?us-ascii?Q?stT4W1U43klPA8GbB1HHvBgLeklK7oxgHx8TENm3NOAkv6XWiao4Ng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X9MnGONVVTHK0v8PdIfP4XOK40pB+j52eLQQVhY62pkx340t/cYbbaOWO3nG?=
 =?us-ascii?Q?hJKoWLyy6ME30RAI5VrBb4jo7FXu1LYF8ZAVM8bgc9v03tDscs7Akb9NDyND?=
 =?us-ascii?Q?jeCGgqa9DzgUueBtXwjjD4wN6ouQcwi8LH9KdLb/Hb/ouEpKW6RZSCMjgXji?=
 =?us-ascii?Q?uhTmp1s/jtfyNc0osafK1IpdmFM+MIrbgyuSJOhjmwSjd5IJg+Kqw88ZDDlw?=
 =?us-ascii?Q?Deu9L70GyGnR8qXvf8+tdIAFvIctR4ov/+rAC0WGaAL1qvCsuI16eBr9lMHi?=
 =?us-ascii?Q?3oL0QVdYFE3dDbh2Yr84gsz8vMAEZB3I1HBTr2C3KmD9H6gQnAP7aokArxqC?=
 =?us-ascii?Q?M0oveoMUyZHkGrSlTFrk57FJHxQ8teT3HjkD2OVYCfJfLQMydEfhJCuc5BHk?=
 =?us-ascii?Q?CQs2pJJiykuJv1bfzHYV0mFCUZZKH16TByNBCj+CdjgapD8Gj7bfRF50QVvm?=
 =?us-ascii?Q?nXDeGPBT7kbzL2HWGk/wYZDP5owBp0vGtRrwShMh0B1epbZZNZoFddnln8en?=
 =?us-ascii?Q?wvwqO/swOgZgq9iEmtlU+giNApx6UxNIw4XW+9nDpm5P7qel49GJ0JbjtR6e?=
 =?us-ascii?Q?9hWzno18np1BdznLNuGOmpSO/5PvNxa379ZLdtq3b6gF2KiqRW70fSGotmVC?=
 =?us-ascii?Q?8/U9lLYEdX6EDl+Q7T6puT5N2/B+JI89mYJAlYyoZjHVn97wUha30uu5tniG?=
 =?us-ascii?Q?9YI0pIzzSfkhmDMJgwwm+o8ISE70YIvCUQBEn2F761P1Y9/mvU4KsZ0ZCavr?=
 =?us-ascii?Q?kkpgbkck+5DZJkUcB1YuHcQ6bNg8FrP5u9a/ucWJ9Bxwy4T6P8aj2gQLMBUd?=
 =?us-ascii?Q?/Gs7EcUYjD2QJdEwj8aVzdDb3fEgRYKyLYc+tj/E95guV0anEQEDDOmf+Znf?=
 =?us-ascii?Q?kUiWsUnnyb0OjMtkYSitlNKk9XKkiJnseAMf9QyFLzLP2I76OKmUv5pwF3g+?=
 =?us-ascii?Q?YgUkLaG6UQhSZ3Y0pjWK7csr10TExRAn31dzU5JSxj1tdelnPiLly9NNCC61?=
 =?us-ascii?Q?0NkWWPsduchTYPcBg6dejzR1/9PY1o8j/yf5V+aIVNMrKtE4lcLxRVqM57/z?=
 =?us-ascii?Q?mccpCCdFrF96SMTSBJFfUe9DKsCctCJsklIRx5BENpNNXpr3bRhHJQEdmp2i?=
 =?us-ascii?Q?y27E6/tvuTekG1CV8ngutMnKqTqIFWQOjq/1Cy80CoZLIfRyWqOrbhNzRN7/?=
 =?us-ascii?Q?Ni8/imXo6w067cwt7ixBIvfOx627feU8gsf1Syxs5n2aCRRP9dKM8wbFbCQA?=
 =?us-ascii?Q?Et55cpsfL85OWOJLlml3W4n8SaEfOciqwl6Vi5BnSHoSm952MnU/0nHevOsO?=
 =?us-ascii?Q?lTlB+x1QWVQWQ9YcaPtSP7yME64VraOnzEzs/mqYfSaj597dbOKWKuW8UUeI?=
 =?us-ascii?Q?IPyfdetP8syPTr6Xu+Tqtue0p2Bu8pVloHxwA97KT10vdtgjeXRbNOWPb7sv?=
 =?us-ascii?Q?tyhgyN95mUHOZAqqsGgJHthFy+D9E7Z3HiyM1+1b1hszZYLccHQe/yDFk6Wc?=
 =?us-ascii?Q?jIEZ1MlPb/yK9t3wFs1/1JonkszA4ooiebUtTrN1nwcOMwY+LYYrYv3x1JNs?=
 =?us-ascii?Q?PY0FnWNaQNeBFANFqT/8l4Vud2+1xh9SOwmIOt0pbI0wtWLe3f7K9pwX8mp/?=
 =?us-ascii?Q?AHp3FsOmGCv4c2nb7mHRv0s=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25ff1b2-6e08-4905-e6fd-08dddfd108d9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 10:05:04.9923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cU+3hxj/1oCSRVM/cXTRYdBdpj6NiRDbfIXE5ogxANStdH6j4vSbw+S5IDM3wI07ri7DbokdZsrKA+OKFGTpuMVp6C1W6F81H1Dr0KOasxmerUVVLTEtRmX9r5FL+9rl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8109

Prevent issues during reset deassertion by re-asserting the reset if a
timeout occurs when trying to deassert. This ensures the reset line is in a
known state and improves reliability for hardware that may not immediately
clear the reset monitor bit.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 1c648c0baf7c..6ed90368cf94 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1667,9 +1667,16 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 		return 0;
 	}
 
-	return readl_poll_timeout_atomic(priv->base + reg, value,
-					 assert ? (value & mask) : !(value & mask),
-					 10, 200);
+	ret = readl_poll_timeout_atomic(priv->base + reg, value,
+					assert ? (value & mask) : !(value & mask),
+					10, 200);
+	if (ret && !assert) {
+		dev_warn(rcdev->dev, "deassert timeout, re-asserting reset id %ld\n", id);
+		value = mask << 16;
+		writel(value, priv->base + CLK_RST_R(info->resets[id].off));
+	}
+
+	return ret;
 }
 
 static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
-- 
2.43.0


