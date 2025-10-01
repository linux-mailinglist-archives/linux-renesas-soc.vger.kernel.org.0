Return-Path: <linux-renesas-soc+bounces-22544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A19F0BB1D26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D1054E2E2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43793126A7;
	Wed,  1 Oct 2025 21:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QHeCrrs4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919053126A6;
	Wed,  1 Oct 2025 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354115; cv=fail; b=IOQ0sw9fZ4iNifn9eV/a+Dl8BfDYnnIL3Ly5v1cTtk0LjCsmVi1h7e42osLspD5oeTLsJtUj+/GQQTD8Ns7TMjIek8j/cju0ValRhLsWs30oj19XRwUrZbGXezmQoKxTItqXgc+A1mSVQ4KeyH19QvlHakoS0aqzVztWK7tSz+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354115; c=relaxed/simple;
	bh=OBBVivRvHTp5T9YMV0iOvDO8/5vMIvB3B4OmF3jJy6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gxQDkqf3UXf5lZsHejiXBPE8HL1aUG3ln3HVz5WlIgaEpZmfv4ZfenGO7oIvao6ThpuPDDw1ny+YV9ddMp2C+gnSJeZjrb/kqIIOIHAcLroYArSCPAnf060dULN3J8bwxjf4/qaASKje+0ZQmlGZC3heWwW7GbJFjaArYZE6XQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QHeCrrs4; arc=fail smtp.client-ip=52.101.125.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noaIObkltJdUlAKp8di+5XNwMSLfxzV6MO3Me8vsHfVbw4Vmk0IY0uJmFOCxDV1OM+VGiW9Fa/e9/uCfI9CLkquwDlV1QmQ3uCDPxzBKzu6gNmdTF6H7zF6MxesA50N5PJNzwE67unsLKaXfElX5GwrKM9zecfw+hm+d8MPIYXsZ8MaYrFBFlohrzmCK82lFC1uKwHKxVk8NkcHTvcROT4O/JJDezE4q1ICDY8wTza/ujoZ1s0Gd6bc/y+oQ04+/jWibY+0jiXw4qaq8eySPOOVv7Y+U1YnRs9qMd49z1e5QrSWZ0HwXmfcAuOhDaHBy5ZcSBjer9feAyGYSvzmBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqmO2TLJ2Z+DLlVBBJMZUpfr4AKJEfchHv+1dzKZh50=;
 b=DGrLLX4Q79IInFQ6xqUQPmkPyLGw1eHh4UOME4Jj+uhuqMmAmW8h1fZKBJT35dohqIkKI29lQUX/v9Pgmc/lulwjAVqFQ0w/3Ms8rxZ2t6w+TFAdlDhk05U+YHdM1sLNlbY4cH1sVSCuYkCHpFSiGoxFFP9mY0U9S1yGgiH/Ix2H9dGC3XvjmwccQZRvjHCuyEgIn/8W01EnSHvRxVrftf6t4lwVnQjJhFX5kIbWxtWo+JfqtzF4He5l5tjLkMdELJ5y7EmYai5/dde/bHzHINCcQNs1nldZb7E/BtvYbLmk3sEfFHVZkAca2CwP2cZl3oO46BTZEHt+2gSFhxsCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqmO2TLJ2Z+DLlVBBJMZUpfr4AKJEfchHv+1dzKZh50=;
 b=QHeCrrs44K+JTQx9bs9Wih78gcB1yXPXIsYLlwXQHsrTrzy4cEhFxRjuxBmhucNjqSrgPsD/ihuXl7Hgh2/LfnqbP7njTE+NPGoAjcbctI2i0NZv4aSX8nazUk+3LpzmRzFuclgSgqk0Qz4zEWW/WJnttuCqyRFbYHNbZZhZImM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:28:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 08/18] dt-bindings: clock: renesas,r9a09g047-cpg: Add USB2 PHY core clocks
Date: Wed,  1 Oct 2025 23:26:52 +0200
Message-ID: <20251001212709.579080-9-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d34058f-6265-4e18-3e34-08de013177e2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CVydspXMoYfflcGaIGO1zuwqpdBD9kkAnIo73jkfJ52q/zvocJ9yBZMFie8Q?=
 =?us-ascii?Q?zWkuUWFGMxmn02BrcY7GmYeva/q9MXI/H8zRzj0uOYLoL5k6fnEtOtsDNDFz?=
 =?us-ascii?Q?pmOYlpwNkyZDPB9RlpZK7PvrbqFH8PdFKZCM3qMRqaOVTUeO7fRQMl/t/1Q5?=
 =?us-ascii?Q?1FlMglI3tSLsOUOdNPT7Ue6QwBLAzY4yqwAXSPbX020SyUYx4yN5b+hNfIVW?=
 =?us-ascii?Q?0CCH/iSES3VP5wp8BnAKDdSxTFvRc6WMXUvBVJosOawl4BY2tgFOnzZglSRR?=
 =?us-ascii?Q?nvAcEpqWvZAWxjpK4dVYkwBuOSeioArsefECuoRe29J3tS+TMPehw1B8YGz5?=
 =?us-ascii?Q?sYp+pj+p8OheXnVzJVjZxNzTCXvCzJm/f6SmzVu+3H3iBXzPgcxw+HjMVLk3?=
 =?us-ascii?Q?wNO00g8ltn5M0LL5rvM3QCHuzNbhI/xTO3dAGmQ+ZJqWKemgFPiARoGCOgl7?=
 =?us-ascii?Q?hEVT9vOBLz2lF190nCy0btKgqjTcULS6yv5EYvLYhysrW4kDzJudQyJPpmip?=
 =?us-ascii?Q?mbbiP1+rOm97XgyxT8Pg0BDc1jjTAO58Qe85buLhY7444SecA+lOioZPBlYs?=
 =?us-ascii?Q?rMKy79OQwW2mF57fTy+dz5Dlm3DRtIk362a3cM+IBYRnDVaLjLb/xQLIoSW9?=
 =?us-ascii?Q?stis51jEoeaT2IN63FjUaxanITo21Hq/sFYpcdJ2NHLRQ8Qw7G16LgPUQq06?=
 =?us-ascii?Q?6oadRHOm6REO8f9i9OPry38CaRizWWjU4JaUDy5G4j8mmakQHeUg41Uf3cd/?=
 =?us-ascii?Q?sU3HyaN71tTeVcfhkxtXE3WF0/bNSEicbb5armwTwcROjUzDEPf/kyqsjAce?=
 =?us-ascii?Q?6xJO/IDhlvwMQ3hhh4OKaJwYURfnXVqYp+NKUwWQcR1+16PFbaeUsb+BwnaC?=
 =?us-ascii?Q?xcgl1MZ7JvqzVnK/PhvN7F6n57KBU/cUma14z+saaDZT89Dzj/bTsOpPF3VV?=
 =?us-ascii?Q?pAqJWey37iuEgMCNtSudNfOOkED3+qMUgG3ZzY51r8g28JuJZQzGC67wnqk+?=
 =?us-ascii?Q?IQtmb7uwLgok2Bm93D/LjnHp2SN0CxOY7dJCYIjG+6SK651mlkaIc9KwnEj7?=
 =?us-ascii?Q?DWhKiM3oTp6iIrL1LGEcUh2DXNhD4cJVv5iCIIqJKAN3T5aSuEYPLwFITFa8?=
 =?us-ascii?Q?4SG+FUE3FyiwJjR8h0Jr2HaOfmysJ/Jy5T/XQ7onWhMxCRM68W5VI58I2y26?=
 =?us-ascii?Q?WOZZ8P3tyD2LyG3JjKhITjB3NUTBfsFUsdPkh7nGMgwGcOClvXQRLTX4yxTu?=
 =?us-ascii?Q?oUMYuYcVk/Rd6lnjWJK6SuDrA9LdhipRawnkHyR8BuQtYGyDwzyBHEe/WaG3?=
 =?us-ascii?Q?Pt1KoU/GpKlxZpZHqsPJPVmtQcE4J9fBFDrCjoj91auw1NQiEJ/lOFrWcYuZ?=
 =?us-ascii?Q?yhF/p9zHE7DNh1uttjWn6yM7XVdXYfiklqd1Qh3knHXJiWa8SOSyycArLzR4?=
 =?us-ascii?Q?Q1MOLhC1Hux7CgqFwKzFwqOz3o/h8KiHweehl/Zbsr6HHgbQb73klUUYehRe?=
 =?us-ascii?Q?SkKxKDBug8HeitxXYEXor79ssmfNzHdgyLHt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J7RR0GciEfMdaSmebdxuIc9rOxysJM4ReKI+MljYACoP09qv7TjikJv6Puw8?=
 =?us-ascii?Q?IDdfaElfgwqnU6rUwnMMyxwnlpXyVpHRiOBCsGtjW6OOWtAg+LeWbVoWIK7F?=
 =?us-ascii?Q?CmCtWADR6sgcfz98bR9ZtsB9yMeyRNUsrGy9PMggH+iGjjStwD8NPEIHjBHa?=
 =?us-ascii?Q?hw54vw50i8DvFgeiGKcbnJRcbTDl41WKbcSs8roWp8jodavwmzJKs412GsG9?=
 =?us-ascii?Q?QxA1r25JNeigIX1D3AVs5/Hw6neKNBNfBunROe5Ndbvh7+SwyoguHWiB5o4V?=
 =?us-ascii?Q?xMjfUf3rwYAYgQhpeUTKBI4mzkx0Gjib1dvA51qArlgJA8t2wJ9MldZDGazG?=
 =?us-ascii?Q?1rF7IQ30YAEXyKwPl0XlMLEJM/TVYprZzeUG6nGRNVPNG6BCfjZ2YkzGJwh3?=
 =?us-ascii?Q?uXLvvW6baP5xKrIny1k/IUOz7ikKNHPqMgLC8km5odKLp0RizLtW4MGSedZC?=
 =?us-ascii?Q?LnKTQsa9LeuxVz9qPEAutc5kjPeWac3dp4dWPMiAwZT4vbrl0XGcMlaS/eMS?=
 =?us-ascii?Q?dJTnY5z4Lb2n0gOwB1wy6f4KKteGTptYTMcMlf1ZQuUDDwR5kEtfQO6AoIW0?=
 =?us-ascii?Q?ruPy8pJRJW7chefFitZA2oDqaGWGlq7hWcIA+eIrxPu5ixoBi6VMG5Ialf2d?=
 =?us-ascii?Q?kAx8yK7BZgGyGizBaCBw+Md97KVNMVhWZNH/Mjot5wcaS6948m7hcSM2BmZF?=
 =?us-ascii?Q?GHPSaauNlHh1k921TSReeOCvjKjRpE6YoxPAZvcelvOsxk0DvKEw6T2Ak48n?=
 =?us-ascii?Q?XvEhDVgmHqtBE3g0rGSr4UnM2S8jgHpC9SbIICjBWEf8ZvWEGE17+QK/75TO?=
 =?us-ascii?Q?ANlwOlxSPvWQub5CPYVj0pfYiDf+wQSHPRB09xYHkrHl6su+7hpAwAYR1B3I?=
 =?us-ascii?Q?T93PfIkxWMUeG1eYTgNYfBB72juHp6yvfF40Cln8cLZQ5BOT8YM4ClET9zom?=
 =?us-ascii?Q?Ecw2IVRFzrBLdWYOjskCCOyxWFVVRigCUa119720A/ydHwgWCn/j33DLijSb?=
 =?us-ascii?Q?44qmOTybawwsMLj/t5aSV1sx1lgGSgJa4if3eMyTTdcUSXceQlVCFsDCa449?=
 =?us-ascii?Q?S1XwuPqsC6FSQRzIIpfDaez2z73PE5qbpUmta73HCPuJ4l8PrECQRcXM/gRR?=
 =?us-ascii?Q?I5rC4eLSR8oHJKdy/4C7+xmAL70iTlJT1Rfu8nQrKzlJvGzWwPdmqlp2llZt?=
 =?us-ascii?Q?ZoUwwJ1ocyyROTxwix3iHl8re42DEdSg9KELxyDGm35SYGrRXC099mysTqLt?=
 =?us-ascii?Q?82RN42RP/aml7vKjYAJ0nuE5sav/V3j2WA5AqH1a2d+Q7RMX7T0mSA4dJlwt?=
 =?us-ascii?Q?5mRhkLg4CqRm+5WkwaW5YufLDqQ2j1uyarVMmivUku1w+GELRdmAu0kVrnkY?=
 =?us-ascii?Q?djK/Txkp5EJcgz/hvKnThjtsbnX8auR8A+IWLCgGRshQgJXHXC8VuNd/+wLm?=
 =?us-ascii?Q?76jh8BiPFluV+Xvst6ccXCOV2fZg5It/IUDicfvB8UsrkNpw/9IT0T/AG1VB?=
 =?us-ascii?Q?hIOOoK+g2NnhDurFl2jMbdRbybXv7LbxpgU/qvEqi33czdDAG1rzevdnPOgu?=
 =?us-ascii?Q?sn/yqkAAXSkYFEo4/nOOWsXfutjgrBLJzbS5tzLabTSP9vHazQUFUkOma7Ep?=
 =?us-ascii?Q?gedPiRBkbaUMo2kf3i7WfJo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d34058f-6265-4e18-3e34-08de013177e2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:31.3449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b31qnzsjmVBVk3hSNaSRbVNdZlTMVRW8G/CehyvgRNJ5wFHVgHm0EDmEeZf5Ip5syb7p+nphduEpbMTXAYncH+eSzOSH6fVcz/LPKNNgphRLx4CBwtJMrVLOfnPfneSH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Add definitions for USB2 PHY core clocks in the R9A09G047 CPG DT
bindings header file.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
index f165df8a6f5a..dab24740de3c 100644
--- a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
@@ -22,5 +22,7 @@
 #define R9A09G047_GBETH_1_CLK_PTP_REF_I		11
 #define R9A09G047_USB3_0_REF_ALT_CLK_P		12
 #define R9A09G047_USB3_0_CLKCORE		13
+#define R9A09G047_USB2_0_CLK_CORE0		14
+#define R9A09G047_USB2_0_CLK_CORE1		15
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__ */
-- 
2.43.0


