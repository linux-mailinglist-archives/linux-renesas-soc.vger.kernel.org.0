Return-Path: <linux-renesas-soc+bounces-26086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A00A9CDA016
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 17:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A539301C956
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 16:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECD932E72D;
	Tue, 23 Dec 2025 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IfBTKjMw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08273314CC;
	Tue, 23 Dec 2025 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766508886; cv=fail; b=pl3T3RFlQBUB7ApO5+V4vn8WJbxPQDMrwv2qd3F6VQbIi4C7017Sohd3Oq7G9Hbi8HJZ+EkGZrPnSGjqh1TtRrDyyirhOJ/UTpyYgWvxSKu1C34AfSgZa1oVFWdFWvM8pA/lJHs6yyjwct+EwDoq1hYLcO4YGZpg5/zmu6b1XEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766508886; c=relaxed/simple;
	bh=a2RX5jr6IojUONEtKwKVt3mcZ3NE55vATk/4nqCWfbo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iB9Bqaz9AG3Sgk8krSdso6c/opyP6jiSBhsu2Kjlf7Q18vw3clUN+0Lyit0ugQ7xUW51qvnr/uk/huqh0iEN7PSfKGic2/4kQM9XfUXl1y2j4PCj0IvZLv0nAHecVQTm+pzECNS1VFNgV3mCugBd0oAgucFUL5SS2w9Drcgi0wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IfBTKjMw; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyyz8MoSRZKcjkqJ991YQyJZcmrIFs4MWg9Ozq0OBkQdLqICaAb4mDLK9pQhQTu/X4usc3ta7P6uFvl44u0ko3wHz5A2jMtvxDNqZ+QVA2lORep04dYz5vFv/NiktgUkxV23HBGjet+Vje3B/veOqCx708uVCirqem3R039n47UgvLXUuf4TVK03wPIvck/hSwPKCA0THAHOM8yJu8kAkdSundAmJrLs7wart0+uBxr2WtHQDfU06iSDpdureXd3temqPAZ8ues2F+sZJlqc/ja7DzaRot+Z3NcIGhcdoAEKWW4MODQaBDGz5SJ3BwLuz8+R6tYZhoqtqiMmB8NAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFDflNI3tQx6CjYPgzwcVnZ+/F2EbVPhHI7tVuDurp0=;
 b=vhu42muHllIOOfoQuKP7ldG/ZV/4q4T9S46SCKLxQz2UYBx5m6aRMS9AovzQ1JEK1kHU+GdSxnp8JhzYIr1lL+KI01PVYS/FEpXCpAbyQ2Kq+/CrDfdAS84prv6YiA4x88FYol/PKo610RPSfKmanznXF1LZ7uad9p1OqClOxWN9APLNVLyebz+18GaiXqmJgcYWLfsTHwF0zAqMUaHHutSegdOugdUtt5F7RvOxfOZ8Fwtvhtkks943F9/pNxeT53r7ctuHbijF33KGKiJuHxvtvif+/f5kZvw+KBp5o+B1Oq6vlGFlFR1vM6HtqBaKPRLame/oOuA8394JEeE+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFDflNI3tQx6CjYPgzwcVnZ+/F2EbVPhHI7tVuDurp0=;
 b=IfBTKjMwTCEgnIZpirP3+ETVF4rJp6yOwK7DM/C/9/nmiBPPfjGFkSvBJaSOjSdkNoWNidP6fKkY7wYB65qhYtQJ/65MgGmhBilmjcCox92wzRPfBkcPaIdm9KnuZFKSzGh0E5+QfnUoB5/IbYStiQN6cLIp6DAIBQ9n4bK6758=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11819.jpnprd01.prod.outlook.com (2603:1096:400:3e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 16:54:37 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 16:54:30 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	wsa+renesas@sang-engineering.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: renesas: Add suspend/resume support
Date: Tue, 23 Dec 2025 17:54:08 +0100
Message-ID: <20251223165409.746777-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11819:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe49779-6568-4479-ca87-08de4243f09a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DViuf/0JEayWzFPB4jr+S/cMd3Ao1I0rSqzAEPN3ys1RPhCVyRzdOiNswDvZ?=
 =?us-ascii?Q?K5jmsXBetxS2EC/w46nmLm46a0vCHnMSoMcWXyamazff3Nnt9DLUiUI4cFXW?=
 =?us-ascii?Q?UXORQBdF6uBghuysNNKOeJiiSEtdAruL7bWv0ykdLjUAPqxTIzRHNG/87II1?=
 =?us-ascii?Q?RFsR0kPfLT5/zdLqgSLGGWw1ZOdBHeVQvWuXENqcQ04yLt309uoenjFnV2Zr?=
 =?us-ascii?Q?hN9HuyQ9ZUeBZQI1CTb2mway1FTJp/tbP+ZJGeYVLKna2CqhLUa5cHFmdv0x?=
 =?us-ascii?Q?faXd+m5TkF7NpPPK7dQ158XuD1fDEXOxwvu+edO3EsJ1nHGfUeGbb6yNcda5?=
 =?us-ascii?Q?ebqfhQtzQy5GVRklnnfWpuCyM1+L0+PvV3CYijxzMnCzryR7urc21YECVRpO?=
 =?us-ascii?Q?FQjPltf5HPKCsFJI4MG2s0cMp1eX+uvnIMn6VpgGTBt8CgwQxMzwGej4siDL?=
 =?us-ascii?Q?JHQlmrSG3tAJw8WQNzmiDWYLM4I4o9Dwfei1F1QBBh9HUpKxnKFuSsYwxKGU?=
 =?us-ascii?Q?dnMfH2C+yUatysNh0f/3iDsnn67Xe2l+4GuFIksFhuPTLQHqwmSDCijN0isA?=
 =?us-ascii?Q?zRdWNwFM7FlWauOLL3C2DgM+2NzRb8KfpqYjj5TT8fLbQ0R04x0yDO7vu7O5?=
 =?us-ascii?Q?ebpfUKnXQZerUbxrn0b+jIxx8iO9+zsJWHtmtL6LMQNoN7fscbx/sncasxUF?=
 =?us-ascii?Q?ZnZMcDweg/fh3ZSwzE6X4fQzmts6k7NSDiDvASWvnCz++O+2QaEVttV/bp7m?=
 =?us-ascii?Q?9RVHp7I4vvTaKO0bLC0j0/7mdk7mGCgnLrckfTBjjoCh7UqCyjRr5XR3OBjJ?=
 =?us-ascii?Q?7H590Vj51kGSXJyAl8jnd1FP2kqDo0QF7XkmUS20tHR/tun4Gsbz6Qhztp43?=
 =?us-ascii?Q?9IvvA8ncR0nPr40qZ7S5pzGopy0fUVb5nDrA6u1Uk6vgnwaHpuGhB6VbIrb2?=
 =?us-ascii?Q?/l+j2W2neaRduejfHJoMIkHW4hq3iZd1vuK0AyGbs2rOKY4CIyMXxX28pBez?=
 =?us-ascii?Q?svvQRdcnA5DKD2khczz35BYaZGPIHKYmLGSkt7viEc9VqUX+n71PXBGe6WPp?=
 =?us-ascii?Q?he9taPV7+VBbqSfwRjGY4Bqk4vTmn34Zk8MhhrbPDls7HDtBOWJfNqwxJxVK?=
 =?us-ascii?Q?RIzJWdAguGhs15k6qkh1x1AfB917QuBuNRCag6pRutzQki06yyGIywri8npI?=
 =?us-ascii?Q?6tjLFXjLrnuJVFh4mdEs1tIoIyBDO6GYp9RSak3FgNDIW1YfQ2ZEFpCTNkup?=
 =?us-ascii?Q?yWPvWQKMV+UcjY+BJAwtUkYH63Sr6mxf/n6dTQUAHmvVS6DaSHF7Zb/mOG4t?=
 =?us-ascii?Q?YkeR0+JFXpwJzA12wmvSfRpybbxFP/jHf8rcF+Vtu/QP1dS+UjspqHXQaj8s?=
 =?us-ascii?Q?zQGEwT4O4t20dlBGI7fIBoT2ab1SdCIVEXU9tjagt8wCMROw+VOT4ATrvPQt?=
 =?us-ascii?Q?aLzFRlJfspRdeH9DhDrsbLwwN+lu5Pd1yVeOtI+jXxMctYiu/nOZb8lGPNve?=
 =?us-ascii?Q?i56W5AYInTP7Af7HF5S5VNu8SwBSJGrPtjKe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hut3si3tx5NVOzsZkrCiCrF60Aa5oC0lIw6xLJjkgwV+xmJNRD4P2FuZZZvG?=
 =?us-ascii?Q?CptYe01lCwdN5Q0dRMAv6y5wOAKjCLQgGDmP6Dr3MpxLQWn8W9DlG1KKrpUc?=
 =?us-ascii?Q?Xs+cqJL8bmqvblZUkJicxrgAL2Ku4spYWGzyItLn+rnPVUTdRXzEkJXC/tXm?=
 =?us-ascii?Q?Cft67MZSFNUNzSEk1Eaq0tx7QDFHS8uKqI93CUEZOJVuMf3TXArbHV7QxtTz?=
 =?us-ascii?Q?S2km/yR+2FmCxnYJ/FB7E7DVSL+XDuHR1/fR6CTLQJLXW9yZnR+rDurXhq9V?=
 =?us-ascii?Q?MQTTbwdgdmxr4T/3C/xH8VHG9HjEOFmCQ4riXhVWnT6MMZhVUmNmHTh8M5BH?=
 =?us-ascii?Q?D3evDZvPluooLjCIqFuItwn9pbl8k+YmEEL96AbW9el4V9tqJkqZiQUt0uYn?=
 =?us-ascii?Q?9KGs6qNlG1doEy8HwLlOqu/BBRzULNzULvTsJDr4A7O2O8z4kx6kASKdCNK2?=
 =?us-ascii?Q?tbI4NBHdZ+lK+qxlTlSALTh8q0ilK9bXOJX0uZOlpWaCmMF6JC0ZWhOavCou?=
 =?us-ascii?Q?WSkMQ3r5a3tq3KUb0r1M/rEuazJd3QmqS9whRPfKDfaKcb/QnP8vO0oRSXy9?=
 =?us-ascii?Q?6+Bx7FdoNPuWc+YCg2FXaMgznHnutbWIPn3iKfDRwJoFc0HJSvmK+pN/xD7e?=
 =?us-ascii?Q?DlaiH4+FobVQ8mauO6nDrAEs5SfRzbMPjGNeS4IzRoFHSu16P8Oemwc5yd6f?=
 =?us-ascii?Q?KAI7c2gKLTGcO+jIhxCVHhV9tel2TlHphUb6W6x1MNAenkjc1gigT95ormC6?=
 =?us-ascii?Q?fr+9gDRCJD+VeZYCvuBL1F7pZLptQz9sxpXOH4tKBY3C/k9704lCG2ugzx9O?=
 =?us-ascii?Q?hJOeUxtvRVvyqK/IZybb9fwf0aYzHUT6snox3BIrrJyjdOA12Vl1e2vjO2hG?=
 =?us-ascii?Q?/xl9mWGqfPSBBv7cwFGd9Kn1NiUxKfBNBZpavwrFFVuTIdnHi8KuCsMn19n1?=
 =?us-ascii?Q?cDKJDGOaMz2iSw3dSs+OuDVJ5DbDDxEwYL1FYMrBfsrJHlNAvx3KDIFHWqZZ?=
 =?us-ascii?Q?eYPyl8BvOPb831MNwe44LPFfuvuBViOXfWNqTSD+ICEa7/HEHy700+U2lccC?=
 =?us-ascii?Q?U8/qYYZdsFeTR61I1qCDvLFTfet2byG9bNnblLLWBhRNItDBNHVxcXGUOllr?=
 =?us-ascii?Q?6HG3yK6YESh9CutcWm7GKKThXM4Jh/92XlSzQHZzGAeEV2EhUxT4v/YiqnV/?=
 =?us-ascii?Q?RqbDkrL3rj3rsrE+FOArVI44jlVHIq9LUNYex3BfSSx5rKELBDuSyTGfhQBn?=
 =?us-ascii?Q?JVtHL97t8ZaxwBzWcm81AfWM6ve8vtoi/vil3IT6di5NICx1i4kG1mgQL00I?=
 =?us-ascii?Q?yrMYk82Y0ykCzOWLoMXsZjVDckzmA/P2dRRqWseEABE5x+d9kiktIYozjG2v?=
 =?us-ascii?Q?Tet1qljbUFQ7PhcEh5X4DTSENIpJykbAiXQNl0o72VOJD8MlKcuzMnyIRBRu?=
 =?us-ascii?Q?1ruwt1hImruY2B8C/h6AKktXh/dJAn0Zz5g1i+KEUablnMczKeuw+uwQeWXy?=
 =?us-ascii?Q?3IG5d3siBtV/rSPusvVem8Hk4PhXu21x6cKGoIXUoiukPkulB1GBYKQeirxR?=
 =?us-ascii?Q?fIzLtZJS71KkjXvKuOI6HE7iVnoF59v32iNK5mifJ3XKvkdR/5vzDw7vb8cb?=
 =?us-ascii?Q?U1dwL+H77ImDs3FSKMLJjau4d2/D4x9K0PmN4vSfKAcVD+l6fvoTU9xr05+b?=
 =?us-ascii?Q?C4LePapkcHMfWnZFWowgDusEjy40bOd8UB9SJ8XfaOYMHa8/XkZ8p6aCtY0J?=
 =?us-ascii?Q?By1XmmHSh1GxLA2rCuCBgB447cniegQAr/3ezbUncPistzdzhiB+?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe49779-6568-4479-ca87-08de4243f09a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 16:54:30.4068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMULJzlebgZwAQd7m/yEq1QDlsEukBpFFZajZOzWRzRX/MBGOwdSzGLWZ1RIjA+iK9pmW3khoagSBKDqF6jI9yHQCGDi30itukE5AyoMILFkbx6Eg9ZH6SdcXoDKyxcA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11819

The Renesas I3C controller does not retain its register state across system
suspend, requiring the driver to explicitly save and restore hardware
configuration.

Add suspend and resume NOIRQ callbacks to handle system sleep transitions.

During suspend, save the Device Address Table (DAT) entries, assert reset
lines, and disable all related clocks to allow the controller to enter a
low-power state.

On resume, re-enable clocks and reset lines in the proper order. Restore
the REFCKCTL register, master dynamic address, and all DAT entries, then
reinitialize the controller.

Factor out the common hardware initialization sequence into a dedicated
helper to avoid code duplication between bus initialization and resume.

Store the target clock rate, reset and clock handles, the REFCLK divider
value, and the master dynamic address to restore timing and addressing
configuration after resume.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 246 ++++++++++++++++++++++---------
 1 file changed, 179 insertions(+), 67 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 426a418f29b6..b980e2a84fcd 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -254,12 +254,20 @@ struct renesas_i3c {
 	enum i3c_internal_state internal_state;
 	u16 maxdevs;
 	u32 free_pos;
+	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
+	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
+	u32 *DATBASn;
 	struct clk *tclk;
+	struct clk *pclk;
+	struct clk *pclkrw;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
+	u8 refclk_div;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -477,28 +485,79 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 				 0, 1000, false, i3c->regs, RSTCTL);
 }
 
+static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
+{
+	u32 val;
+
+	/* Disable Slave Mode */
+	renesas_writel(i3c->regs, SVCTL, 0);
+
+	/* Initialize Queue/Buffer threshold */
+	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
+		       NQTHCTL_CMDQTH(1));
+
+	/* The only supported configuration is two entries*/
+	renesas_writel(i3c->regs, NTBTHCTL0, 0);
+	/* Interrupt when there is one entry in the queue */
+	renesas_writel(i3c->regs, NRQTHCTL, 0);
+
+	/* Enable all Bus/Transfer Status Flags */
+	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
+	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
+
+	/* Interrupt enable settings */
+	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Clear Status register */
+	renesas_writel(i3c->regs, NTST, 0);
+	renesas_writel(i3c->regs, INST, 0);
+	renesas_writel(i3c->regs, BST, 0);
+
+	/* Hot-Join Acknowlege setting. */
+	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
+
+	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
+		       IBINCTL_NRSIRCTL);
+
+	renesas_writel(i3c->regs, SCSTLCTL, 0);
+	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
+
+	/* Bus condition timing */
+	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+}
+
 static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = {};
 	struct i2c_timings t;
-	unsigned long rate;
-	u32 double_SBR, val;
+	u32 double_SBR;
 	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->tclk);
-	if (!rate)
+	i3c->rate = clk_get_rate(i3c->tclk);
+	if (!i3c->rate)
 		return -EINVAL;
 
 	ret = renesas_i3c_reset(i3c);
 	if (ret)
 		return ret;
 
-	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
-	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
+	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
+	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
 
 	i2c_parse_fw_timings(&m->dev, &t, true);
 
@@ -511,7 +570,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
 		else
 			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
-						     NSEC_PER_SEC / rate);
+						     NSEC_PER_SEC / i3c->rate);
 		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
 
 		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F)
@@ -519,7 +578,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 		i2c_total_ticks /= 2;
 		i3c_total_ticks /= 2;
-		rate /= 2;
+		i3c->rate /= 2;
 	}
 
 	/* SCL clock period calculation in Open-drain mode */
@@ -540,8 +599,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			STDBR_SBRLP(pp_low_ticks) |
 			STDBR_SBRHP(pp_high_ticks);
 
-	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
-	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
+	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
+	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
 	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
 			STDBR_SBRLO(double_SBR, od_low_ticks) |
 			STDBR_SBRHO(double_SBR, od_high_ticks) |
@@ -556,55 +615,16 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 					   EXTBR_EBRHP(pp_high_ticks));
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
+	i3c->refclk_div = cks;
 
-	/* Disable Slave Mode */
-	renesas_writel(i3c->regs, SVCTL, 0);
-
-	/* Initialize Queue/Buffer threshold */
-	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
-					     NQTHCTL_CMDQTH(1));
-
-	/* The only supported configuration is two entries*/
-	renesas_writel(i3c->regs, NTBTHCTL0, 0);
-	/* Interrupt when there is one entry in the queue */
-	renesas_writel(i3c->regs, NRQTHCTL, 0);
-
-	/* Enable all Bus/Transfer Status Flags */
-	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
-	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
-
-	/* Interrupt enable settings */
-	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
-	renesas_writel(i3c->regs, NTIE, 0);
-
-	/* Clear Status register */
-	renesas_writel(i3c->regs, NTST, 0);
-	renesas_writel(i3c->regs, INST, 0);
-	renesas_writel(i3c->regs, BST, 0);
-
-	/* Hot-Join Acknowlege setting. */
-	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
-
-	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
-					     IBINCTL_NRSIRCTL);
-
-	renesas_writel(i3c->regs, SCSTLCTL, 0);
-	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
-
-	/* Bus condition timing */
-	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
-	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / rate);
-	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / rate);
-	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+	/* I3C hw init*/
+	renesas_i3c_hw_init(i3c);
 
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
 		return ret;
 
+	i3c->dyn_addr = ret;
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
 
 	memset(&info, 0, sizeof(info));
@@ -1301,8 +1321,6 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
 static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
-	struct reset_control *reset;
-	struct clk *clk;
 	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
 	int ret, i;
 
@@ -1317,28 +1335,28 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (IS_ERR(i3c->regs))
 		return PTR_ERR(i3c->regs);
 
-	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	i3c->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(i3c->pclk))
+		return PTR_ERR(i3c->pclk);
 
 	if (config->has_pclkrw) {
-		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
-		if (IS_ERR(clk))
-			return PTR_ERR(clk);
+		i3c->pclkrw = devm_clk_get_enabled(&pdev->dev, "pclkrw");
+		if (IS_ERR(i3c->pclkrw))
+			return PTR_ERR(i3c->pclkrw);
 	}
 
 	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
 	if (IS_ERR(i3c->tclk))
 		return PTR_ERR(i3c->tclk);
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
+	if (IS_ERR(i3c->tresetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
 				     "Error: missing tresetn ctrl\n");
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->presetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
+	if (IS_ERR(i3c->presetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
 				     "Error: missing presetn ctrl\n");
 
 	spin_lock_init(&i3c->xferqueue.lock);
@@ -1364,6 +1382,13 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
 	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
 
+	/* Allocate dynamic Device Address Table backup. */
+	i3c->DATBASn = devm_kzalloc(&pdev->dev,
+				    sizeof(u32) * i3c->maxdevs,
+				    GFP_KERNEL);
+	if (!i3c->DATBASn)
+		return -ENOMEM;
+
 	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
 }
 
@@ -1374,6 +1399,92 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
+static int renesas_i3c_suspend_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	i2c_mark_adapter_suspended(&i3c->base.i2c);
+
+	/* Store Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
+
+	ret = reset_control_assert(i3c->presetn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(i3c->tresetn);
+	if (ret) {
+		reset_control_deassert(i3c->presetn);
+		return ret;
+	}
+
+	clk_disable_unprepare(i3c->pclk);
+	clk_disable_unprepare(i3c->tclk);
+	clk_disable_unprepare(i3c->pclkrw);
+
+	return 0;
+}
+
+static int renesas_i3c_resume_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	ret = reset_control_deassert(i3c->presetn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(i3c->tresetn);
+	if (ret)
+		goto err_presetn;
+
+	ret = clk_prepare_enable(i3c->pclkrw);
+	if (ret)
+		goto err_tresetn;
+
+	ret = clk_prepare_enable(i3c->pclk);
+	if (ret)
+		goto err_pclkrw;
+
+	ret = clk_prepare_enable(i3c->tclk);
+	if (ret)
+		goto err_pclk;
+
+	/* Re-store I3C registers value. */
+	renesas_writel(i3c->regs, REFCKCTL,
+		       REFCKCTL_IREFCKS(i3c->refclk_div));
+	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
+		       MSDVAD_MDYAD(i3c->dyn_addr));
+
+	/* Restore Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
+
+	/* I3C hw init. */
+	renesas_i3c_hw_init(i3c);
+
+	i2c_mark_adapter_resumed(&i3c->base.i2c);
+
+	return 0;
+
+err_pclk:
+	clk_disable_unprepare(i3c->pclk);
+err_pclkrw:
+	clk_disable_unprepare(i3c->pclkrw);
+err_tresetn:
+	reset_control_assert(i3c->tresetn);
+err_presetn:
+	reset_control_assert(i3c->presetn);
+	return ret;
+}
+
+static const struct dev_pm_ops renesas_i3c_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
+				  renesas_i3c_resume_noirq)
+};
+
 static const struct renesas_i3c_config empty_i3c_config = {
 };
 
@@ -1394,6 +1505,7 @@ static struct platform_driver renesas_i3c = {
 	.driver = {
 		.name = "renesas-i3c",
 		.of_match_table = renesas_i3c_of_ids,
+		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
 	},
 };
 module_platform_driver(renesas_i3c);
-- 
2.43.0


