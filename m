Return-Path: <linux-renesas-soc+bounces-17110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2FAB713F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 18:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916EB166FEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 16:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4216A21C198;
	Wed, 14 May 2025 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n2FOKWzX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB771A5B90;
	Wed, 14 May 2025 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239901; cv=fail; b=mPf923JYeqtXE1jd4W7+IK9dmPqDR4UDgrTxmD3UG/lIckf7cJy/4MnZBSSZrCEezn7p1oZdOBRgneVV5CjlFy0qSMNWlitz+sK/o89qpHU+MEpBbkbT1XqKp8MgqoLRQLnyYFKtrgrNLLnOgPaOIjyiBtsqrJKlNnkSxrfON94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239901; c=relaxed/simple;
	bh=VG/YENCu3AWyK3K9XSGIh2z/CNyeuAMae/Ciup4K/3k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Z4Q7DpsO4TelRe2sHIAr94x3iGiKbDDvhmHfWBvBLD+06ofEc/5d+mfQZDziDJCRbgD+ptFbt6MG1iFwG7ONrgHdsq7Ze3n2AUv4ly12Rhz7dbbnjkVDt63vQ8bF+YLDtqaB21E2KqXceX29VE9xqi7fkMH/qN7PKOtv1VDFNfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=n2FOKWzX; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTlqCrtZvY2c6YbV1dUkEz1A0nOfVxgsyh0FBuWIT+uywoIbb7hgT+myxDVlLzTl6oV5p9ubpnqN/mX8r9vZfzG7w9vZKnT0Zui2QSS8z0hYlylD4SGoDZP9/FRm9YhnjBMThvKVXDxZAkfFjJbsxmnfj4DnG9/IANf+RRw3ql9LsTbrVlTlcQnTARylbMKvq5/EEoX2T2sFEQwFHxlYNF53QD/c54igYfyxCrRlM66XgUOOMSZ4NG4bCPEZhUYa6La/NU/iWJXT5YGkQCfs6w3qH+LQKsPNPxJsqdfvQ7xA6bgUlCQ0wOl+oltPVy6LigvsAfsWiyu4e+MUTEUFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLSMzdp+eUvB7WAccLHK8tGOnIgrTORf8Rwttk9diik=;
 b=w6cghMYvU9kQhURmKxlJxcW8ARaHacciqiQWeHQoH8tOUCM7pQ2/U4z0fxLxO3EOd46JOc479gXPgJa4Vbzm0ZjP2rbkl+15vxJjNg3AVmMtv5d72lAplQgnEgCsdiLLGg9ACKtNs0726WtejAB+dW9PkUOPxePUXvSkJWJTLJ3Jyd74E9L48kBO+6PU8sxkvs0YkAslMjWrHf69EDXz9iRsz+iumKPr0gVFkBuWyC0Es7jQ1av7L2YE2aPjYSt5pJO76BpM81usaRGGK9snSkgml3vSU6NnbTQZ3hg8tFVVutWhhrw1IvvjjrnqqDcI3DCzBaa6ig/tZb3bwyt+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLSMzdp+eUvB7WAccLHK8tGOnIgrTORf8Rwttk9diik=;
 b=n2FOKWzXT4379m+Kxr7mBfmNhqt7tOV/z4OPLYl1T4WxKxvWZGtvgT3YFXR62uqM+DdDTIL+w5LDr8fNNlWVWhinOJHvRPiUTwVvW2xysnAeM4XTky0W8FQDrfxnjUu8IzA8hYRin/Vm/N+/iJ9LjQsEuF/r/dF6M3yZNSYIp20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYWPR01MB10520.jpnprd01.prod.outlook.com (2603:1096:400:29f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 16:24:53 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 16:24:52 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: renesas: r9a09g047e57-smarc: Add OV5645 support
Date: Wed, 14 May 2025 18:24:16 +0200
Message-ID: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::8) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYWPR01MB10520:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d1e1e0c-1920-4ab4-03fc-08dd9303daf1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cdba3w7SSbPH/t41oZ5AxNh+hlYZh+mTrwUKjBK64u+uOqrCLYn6SIydBdR1?=
 =?us-ascii?Q?eVMIjInfbKz49IljkzPf/gO+cHgN4fMesEadacLgDzFAbu7yaFX2hsXO4YvM?=
 =?us-ascii?Q?9ZYKFVxxUxyRflLb/AOqERgHt75e07t3Zzkaz2N90U2dKHlxV+vff7eVUKDB?=
 =?us-ascii?Q?mWfxDxUWNY0z3uoWFY502nGg9PcXseFR3CAx5T+aNYiTTvBfNAW3Uq4F/tpC?=
 =?us-ascii?Q?lVKMeii5cAtB0qxiwv10BJ4/h+kN4Bd5BhpUQekgnUhQ4pa2j8G7kBJq4dwj?=
 =?us-ascii?Q?7yHJPkDipnlmFwQMshWhkus9TCj6kHvRXHud3W4WNkLNBFHb6wgBf+K0rK4Z?=
 =?us-ascii?Q?m/aKdUVXqmzZUn2y6frio0sp+QgvRt9080bok6zClqpKMACOndCzSEzW7fHe?=
 =?us-ascii?Q?PQJdLYBWC5kQIlWw/n3mzDQJyVmIQeJZjqUEVXihLTjQoNuUEe0aW2zVdFTr?=
 =?us-ascii?Q?f9QCvirVmwx+TLp17q6dSMv6JJ21U1XvlShNydWjQknG7TIfxSkH74VIei4q?=
 =?us-ascii?Q?P4SR5JnxBXEV0htFvozJwXC7tmjriVVZ6uuQHTg95Xq9LixQ+yod7nDbbko4?=
 =?us-ascii?Q?ZixdYIWrVORnmxEpwJoPthWTFEBPmsd5k/JeUllUoPFUvQ6NCPDCfIw2u5Gp?=
 =?us-ascii?Q?F9rB+P4TutjzNwGcGrgRaDwmBCtQatHxujXNCoRFRrFBB7CIBmOEBel9fR9g?=
 =?us-ascii?Q?yYbZ13/17xziEjrS4jFPpgGYotTl+uTveqk2n4vZtW+J9dCSa7os1fkRCf5u?=
 =?us-ascii?Q?8maiTwOrvrH4/XPztxuBf4N24l7sOfavceexzRe8/n9rOav04JSxFrVxaikA?=
 =?us-ascii?Q?y7CRWz/iy5RM0kIp2oWrQCQBzslD5TxXwZzpyoLhBiDjeq9gJr8eS5pzh1y7?=
 =?us-ascii?Q?4hDbB531bEaEV2Uap0zPEgB2WnHWKfPyIRcP7/fWfMSD/6p3rVRg1TTqunKr?=
 =?us-ascii?Q?hswMUDQ4NiqRvpAc72cjJZg8Y02Ne+rMMX1f2KOA7ITaj39iEkiMz+jk3Oml?=
 =?us-ascii?Q?kbuEv/C7TJCppkGCTvBvx8X1sqVDTcEOcFvV/+jIFobHpZotF38uX/QznbBK?=
 =?us-ascii?Q?YKqFK+T7VrsOCQpdDWQBuJ0v+dsutwUjyfjyYGYwQRgDqTYNJDnP4ck1Nic3?=
 =?us-ascii?Q?oAuuT/H3DcSONTpEcV1NT+tQ1yz6RtF/dCYxCuOexsQw158WMDMYn455Vw4H?=
 =?us-ascii?Q?xr/VOpsNT6dL/WF/As1K/wOgFbsVMDHIkla0RxakZhzc4f0agPXZqu2VUlY+?=
 =?us-ascii?Q?K6YpM4K+wJQaKnClw28JQK0VO/3kKDfrqlukEKTg5Jg5CLAdWbijMUlB2L7R?=
 =?us-ascii?Q?gjMzqkyPJTkLPHewpQZNaWxEa9++Na75EXNYFTjxtXcQ+o5F/EUN5tihGuii?=
 =?us-ascii?Q?wFUWUVXvzKdwJ+kz1L0gjofVGskytyo5DtljMDOspqUtZV/KEsY7IWGzWa88?=
 =?us-ascii?Q?PkUK+7dreN117dN22ERWUTS6nAlQS8IFXdoT+mekaD9zim9t39q6RA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n+x7WCPfmpM7Psucae2T8G/GosM4pT5z3eMXCwJZUAPIQ2XkKYLUCr8dQknX?=
 =?us-ascii?Q?OXK53+e6AHgJXf18MGOsUmmL5KqHAV6g5BdzHhvGXdJmruWlMKm9cYZvqnXb?=
 =?us-ascii?Q?qgXb7dNIi5FiIctgh9TlgVt6g6kqvhAxxYG2RfPXpH7u0i2/BM3QyJxBclb5?=
 =?us-ascii?Q?Twfu3lDDCf8FbpHhdzRlqan5ScSOUsx0HfUoW/rT3OiHMv7iDPr4g9JPlKkd?=
 =?us-ascii?Q?HOXQjTCOIBjM6bO3QASluofg79FasUDfd/GT62qjU4rXaaBPnosU8e+INyIs?=
 =?us-ascii?Q?b7Epho+XUlXu6D9QA1nQCDYb6NhycFUjmz3UTO8PfeGwY0Zr3+7p3I5mxPux?=
 =?us-ascii?Q?EHk5w5qJAgeCFV6fYMHbx6wvxw6ZmvAlWybBms7j6pCVCVtMMfXkehBjDUfz?=
 =?us-ascii?Q?3Avgq6qPCOh63qv51i3zGZasuUsXEhah62lv8FTi47wvuVhVjmk6Vwm8QNcY?=
 =?us-ascii?Q?XXHWmyQiLA51J0NY2GCMiVBzBZcT9kt19Wc97C9xBhWCLiiFVLsKEqUNv0A0?=
 =?us-ascii?Q?PHEdBt5piqMgZkAr87A0UPM0iJJ2Tt3sZyRvLnVSyBHMhWC5G/bmAARa5oNC?=
 =?us-ascii?Q?1obwHqlrT2GOxVMClW76cLQ3yDbB7beZpq4kQ8xhSZQPnRqzEjHX26cQyh+0?=
 =?us-ascii?Q?Ec6yG0RBd8xrrx5+P1ryeSpARNeneKvQgccbuS9v1tsEW7y136rkZToGMN+n?=
 =?us-ascii?Q?Hy6sIFPVAFnTndPS6lZMnL+yVYTftZyGd9bvJXyTqrnrTecwqdrXdsNMVw+Q?=
 =?us-ascii?Q?wZugS7EkA2nAebr9snBLwQc7hb3SKgVJxP3ODVirEJF0qPV70j+w801DPm28?=
 =?us-ascii?Q?IZL3NFXuLIBN3g87nPR8XVRMbfsuzej1hYJi/clyFFPGjrKGeELcfXqpZtKW?=
 =?us-ascii?Q?QXGe2bZGJGrBmm/7nfTnvfx/qcjyAJDA353oIA5ogesX7t0zdYouiAlPhZVI?=
 =?us-ascii?Q?HyKrYfI5MzHDPc4Fwd06skwTEjwcOPkmZBUvaWtWPInZAlwwMJiWKiA/yYbF?=
 =?us-ascii?Q?twvk5U7d8EWwDNBYBr4AqNsL9+sEIaEu0taFBrIzzoz8151rS/98ysr/mSnf?=
 =?us-ascii?Q?yExA/Xv8yXtijW0d4IXNuQ94WUUAGkMYntl08KVkEhRVk9fQh20mdnsbxEFn?=
 =?us-ascii?Q?bbbAojdXrBbd6rcge63blrjddVX2jLAeL1D8H5/3X516E6E+TVZQASMQdXQ1?=
 =?us-ascii?Q?O/+jA/0nqDnim30Z6bU28EBAekqgj0PaFwwYCsTj6waCBOxaH/APR8q3AMv1?=
 =?us-ascii?Q?04A/NrnU1PFBYycveu5VboFx+TTMsY+iKKj6GvhQjDQOPMlZa1PYJsYRkt2T?=
 =?us-ascii?Q?gJvrfpseIdgFkHP+xQoFHruPUgWTSP2GAbBytHFbfthHiMZlr7n29uC5RfUf?=
 =?us-ascii?Q?DOOjBJ9WtNAb+CuGqNLJi7cX7QA/PGEZieT+7bgTE6JSZlCeqzuTPVAKODza?=
 =?us-ascii?Q?mNxG4ngGjU3JwzChUwLpqshLPgAnuv/4bciS+UlkpE2z7VRY/Rn9BCUqeu0J?=
 =?us-ascii?Q?4BiraOw5pPgroi3d1E2y4avjHCMdVV8Vj5SVefQPp5wfuseRCfX/OrP8OwF8?=
 =?us-ascii?Q?XZF+s6/TAAxuSIbffVXeVt56kaRUX8Ps1k4Z+CkQoB4bWGyzReYekEiKsO01?=
 =?us-ascii?Q?bjAblcJ2cPtH24+57pKHtc8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1e1e0c-1920-4ab4-03fc-08dd9303daf1
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 16:24:52.8185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JA2buq1+CuDTfT6Ewmx/jPnOyR/O7WSPwdRxr0CdvLq79Bwo5DCdJEYpapiDGi+88xdsOcMc00EYrBAcDFIh36V/AQEpDSE8/ykju7xGZhgypKLFE/Af7sesHwbLBFYD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10520

Dear All,

OV5645 image sensor is connected to the RZ SMARC Carrier II via the CAM_CSI1
CSI-2 connector. Specifically, the following hardware pipeline has been used:

CAM_CSI1 (RZ SMARC Carrier II) -> RZ SMARC Pi Camera Adaptor -> OV5645

This patch series adds support for the OV5645 image sensor on the Renesas
RZ SMARC Carrier II.

Thanks & Regards,
Tommaso

Tommaso Merciai (4):
  arm64: dts: renesas: r9a09g047: Add CRU, CSI2 nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Add I2C0 pincontrol
  arm64: dts: renesas: renesas-smarc2: Enable I2C0 node
  arm64: dts: renesas: r9a09g047e57-smarc: Enable CRU, CSI support

 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 69 +++++++++++++++++++
 .../r9a09g047e57-smarc-cru-csi-ov5645.dtso    | 21 ++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 10 +++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  6 ++
 5 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso

-- 
2.43.0


