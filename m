Return-Path: <linux-renesas-soc+bounces-15321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5184DA78F78
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 15:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02EAF16DB84
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 13:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE77238D2B;
	Wed,  2 Apr 2025 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Mu/4xnf6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6B91E531;
	Wed,  2 Apr 2025 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599558; cv=fail; b=BXhrEsJw3Sc5SeYWMOWSgN0mzvXtmLeSyP8S755UTVJpEBgalU8qOu/1o7KZ5Ivu4OuR49cVNA6UxsrIqky4lgcNL4hqu+9a04CHM7/l1mY6GBXQrn433jyV9dVsshyFnwGz4dzc7p1dgbSb1IyB2WHay78RK7LjgDXZljDnOh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599558; c=relaxed/simple;
	bh=ZFdjLPtswi7YoJcM0acqWtopyXOFKB0EkxLoAPiLjV0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IbqKFbkFY5LPPS46m5BSq3gWCsaoP0SHcf5rAiX2+m5Z+ZNKaWabGiSEiihLqHUrU99BMMLSqsehcqtt9+uIvfPFuQx4c62K4e4NmtWWUQwfAgLAiRMNHqxsMM/0awnZBcl1LYzr58i8grkZws0P2cFBxTY2cNWUNCa2ZvJrJ1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Mu/4xnf6; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmyME+BNDVH8w/rCJD/9AzJ6pNcOziepB0vUEODtxyCIDWQN+7yDHcwyS7baDRtGDc66roVI4G9AxEBrREnWUIKs4u/zAMCIW0Zna6QmY+9K5UNRkLSh1EUdEHLVBXDIcKF7ADYxmtkyhoEfXitE3+vLleE4RQi8RKPFm+16RGMBWtHwJSDnlDdua6eNeyb2h0ExffwTbzL9HeKrZUJ/v3B2eElhzkdNrMa+gPYo4OVEGmK2abR9mrasRms0t+tjoWBgylKgBP+HJsRj7a5pAI/evFwf64de8c/aEpgXlhzONFJvZDVX7cCGaMxSBtE+OEHS+CQL7R/OFHaePxBh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUWMsTiAQQkAyt0ObotuI0iQG008uB3R7kf4D2uZYF8=;
 b=oagzHsIzoOBKlUW7z5xOw+3YpUPsFvoYYb1hNsKwruBF4mr4QSqkfz7rvbAxtoiAWc9uH9T6+Sin2FIGqpK6hdV2qNYws8CJQ9gIehKq+JeMmiKb1OkP4Lx89wlI/lpn6VaUCbdSbLSrupUNmywsszunyoVrE2WfPscwnsw/lLchFQ9gqwBv+jxbZiFqSowclliPd+ohe4Q9RTPtpPPmiRcIF/093wrWPaezJG6wRXGwfqp7VSBgpslQAoEnCnZee8/3YDTg/EhKfkOE8FdAphl/AaScBcrU+SwhtnE3/yPfD7L7jkYVX5iNCCziPHIYnduZxNcgVJ4VVDmWxOmZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUWMsTiAQQkAyt0ObotuI0iQG008uB3R7kf4D2uZYF8=;
 b=Mu/4xnf6HzVcfr0UVU76jBcgGyawPUaPCq/OxNEHwHgcW789Wf6GezhezVdL5ximdUDI5YopgTKRerhI/0V1CSnL6EdSXL5OB7Wb6pglNimzkCJv2KuYLJyd3xDq04NGKgUTBOOFHS9Kdc+OhtbEr/M93mddY4Vze2uqq/F3c+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6688.jpnprd01.prod.outlook.com (2603:1096:400:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 13:12:27 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 13:12:27 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add support for Mali-G52 to RZ/G3E SoC
Date: Wed,  2 Apr 2025 15:11:37 +0200
Message-ID: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a34408-da57-4e23-33e8-08dd71e803cf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v0jtL4q70NOSE7kaFKB2tkYIJZDxILFiOzqWYAf81myudkUF8U2xmCuJg6Ux?=
 =?us-ascii?Q?R7LxlWz03701OFa0OXoribX91rlOB/311lscW9ClNlBFE/9VZHv7HDPgNxJS?=
 =?us-ascii?Q?/1JOABN5ncpJmnX48Iubww/niBmqxVNPyS26QvrQP8TgVgAPuXvCQI5u5/r/?=
 =?us-ascii?Q?zH2lBJJWnjHoXzH3K+wEZgXtF6iScEJEdcqnsUT1Hi0cm9OHFaf+G0nElvC/?=
 =?us-ascii?Q?iK20XIX+Sy7JoUGYDQql9NpML933HatyV+3PLuhOGk1gJHAVSNUBL96sYP2f?=
 =?us-ascii?Q?PfbO2OlczCBhilG44dVBkmkTuMvItbz+hyGdcsm/IiTwz7AdD/q6ClPzvEcm?=
 =?us-ascii?Q?3/SD2Yb48qPf6ElHNSQ9DUa5rOqh0vU4hlb13dM+4jb/45daOWM8iFItTaDV?=
 =?us-ascii?Q?Jb6BNMj3jopEpGJiKWRl/qtbfwpOr6ylTi013jL/Q8fWTZBBmdSeb1LTLYqN?=
 =?us-ascii?Q?iujc2gSr6nuW015FL3H84A4fdDFjrk+6ee1EnpOTbNiljHSxDpCUrJyPIFCH?=
 =?us-ascii?Q?jpEFVOK4oMtDJj9jbvKiO4RakuhDwaDwvJpG7wlPbZsLBsK2l6AUW4KnaLUp?=
 =?us-ascii?Q?OCyn5K1w81jhNnrFfyDJLoUNMQcl62IAyrbSV/bE6tl4dIcnmNFck+nNx2GO?=
 =?us-ascii?Q?yj/UY7CjkemwkgmtXQ8p61OEiNQ10JLGJoUydiIGncIhDM+2jl7R02eNhQ4d?=
 =?us-ascii?Q?GOpmzzoGiisylCbnZlBEsbqd5L5lOLvhVY4EHa7CFCYqWxMjlGpJZ5x0x2fi?=
 =?us-ascii?Q?SjRSe/K5POw1L6i1PNokMpgxhUZsVrbu+9DhSHDg18NIKGgoopKHPz3SmXrY?=
 =?us-ascii?Q?2dmzQKWuSSofZBHb4FB0/i9uTMFfCnQCRMikvP2mIMmqzQSPWQPuKvN8vnYF?=
 =?us-ascii?Q?3ZXtT41t2yT4Zy9B5Mq3Vomv0rfdDutuYZurQ34Pcz3GRWw4Y93XjnfGDKhY?=
 =?us-ascii?Q?e6ywMdxtaA+QYEKf9PIXF0J0sHozEVjr/mvvorjMWjNvs0y5PY4Hs+5E6yFB?=
 =?us-ascii?Q?kFwg8W4wZtc0oWfUTU3CrlQ91U2jakh60dU1GJTQaHpRN//9ifyxbF9EbSEj?=
 =?us-ascii?Q?tMTcM3GakvVtfXYUvf+wdmIPQzDHETUjKmwjTglkqfoY2BZIJ4jldssXDu4D?=
 =?us-ascii?Q?E3h/HC4K1wxkA/2OGASeIJbsWmyWl2AWqT9KaQueNLASvLBbUzwBjKz2t9rx?=
 =?us-ascii?Q?2r70k4NE3upxPoNEnEoPDXL8iRJAEs8e/LebfipCulBG2C63K59ohdxNCl2P?=
 =?us-ascii?Q?QDGeLZ3okQ4j165lvyveRlky5/xYRUdv+00Ho6eqyQmtByJ0ACA2jsRD8b6G?=
 =?us-ascii?Q?X+MGw6Q7RCrRWF5M7J8Dno+t/Im6o+BqvriV5nRoRIt4H5rZjWpVLIpgon6b?=
 =?us-ascii?Q?xGGc7xhQhonjjpB9vT+4rykBkhQBE2ftE2uZ0gHUzIzkuvfgXw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pQ66SHNxGj1i5x3du47o0tRWP2UOL1C7oMIfMt8OBWBArV5f5DYUJFiVlCTH?=
 =?us-ascii?Q?pMcnxAKOkq76U8Vlhr8OqqaRX5nvMWCEwDpPGxtpnXtxFX/DCJnxdEN/OGvi?=
 =?us-ascii?Q?7gEkxOXOJIC1saVvQwLsHn7SByToaKwjdoXCysfOoHkHe806ymat6FeFhWUu?=
 =?us-ascii?Q?yxr1P0wzTuyCcNho339AzQ/ZEVST+uACQItjMh3LfASFKbZQxonynTKPvbbd?=
 =?us-ascii?Q?RJ5SnSTNyYEvq3cAlcJKBOGoaCP3wpHQ9HS4SaN/e3Qby6ltWsZbLYuiMGAv?=
 =?us-ascii?Q?izCIPgGDmzQQYVca5/+HkycCwOo9xNxB9R3Run7jvdNEt/7uw7LRe6mrZrCz?=
 =?us-ascii?Q?Z/j8Ni4g5BjOGgR6phzz3KHKXRQrPtVAe5J0aY7kbcaRRs5FDbd7aSqgZXPu?=
 =?us-ascii?Q?rxV/O52WV40ZRWaRg15lN/lzP76DOkJxDzZQrP63sW1+szkIfTmfUd8Iohkt?=
 =?us-ascii?Q?aSuSDHlSsQOBYr0qU/E0fIapNxuGK5WylMpbmCgyDcHiyZQI9jpKGv7tzwqk?=
 =?us-ascii?Q?VrSeniWvdfSGEVkVlFzxdYGMVN53lCW2OoRtAmo07VeJLyYRbctYcagwlLbr?=
 =?us-ascii?Q?FOTfEkC+4yIhad9+k/00G3IRluaVyUvQDraPGal9QiJMOLvdsLRbqQQYzu0S?=
 =?us-ascii?Q?0ytaFCxYcgFWF0BeNogxajQFZq2Ipci9i46xArZ2m2TkwXf82MJDGtxC0WP9?=
 =?us-ascii?Q?Ekgmf+kH+cStNU8lApxGaFXyTtcVqqMbiU9uxgCxlvl31LBryfCAt65vaSq5?=
 =?us-ascii?Q?3CfX3SbG0TBPFIGz90bGDJDdcQCEStncZfSPk8e0rNphEaAQnoLaie9J1UnF?=
 =?us-ascii?Q?GiDp04E2dTbg+EUCZO1npERBVqg8NvcvZNm7akYfzEKM6NJ3dkh+ImnwzQQV?=
 =?us-ascii?Q?+akKQCO0uWuFe9izdj2pwe215B8w20RYoMGosPfPGbR8Al/JXPyhx2kxQBBB?=
 =?us-ascii?Q?3Wj6UNsOosmbiB/4E7JDCeqjDZOIXpb8lAg9uoY82pALosk1ZR8vXn6E/+r6?=
 =?us-ascii?Q?B1FgBEmiBCwcIqou4wYlHY6cJv6dksxl4ErzTUwnA9VAfqNwdr/71685gqly?=
 =?us-ascii?Q?QIIKP9x7biP0c5+u6VcYgpq7TrT2ecfo1E/qhj4/mnLoIRQSCscQlARe53M3?=
 =?us-ascii?Q?X6lmiiQr0j/Vif95nmR9HcEUgyVq6jLAdYrSVx2rsZj5pB5zwjK/+v39DoPP?=
 =?us-ascii?Q?zEiGW/8QmXGb0jXtDngNkyxKrTBndleXIwmHMKHK2hdZMQqkwmNyBMeBeKSY?=
 =?us-ascii?Q?coUybuwe7htS61FFpkiAmZHwq3qvPHL5XUzOvj9DnmzNrLJTkPFRbvrzX0kY?=
 =?us-ascii?Q?lMb3m3sOPxnJoXPhwpkLzC04T2d43rIXWU9AnDr+lFhLjfLxpv2RtYilqqWu?=
 =?us-ascii?Q?Dr4d95EzVzfYomaYv+C3k0Mm7oAto41RZSuDQhAetvJYwrTgVJ4YTBySQivH?=
 =?us-ascii?Q?dyjY44fpXA4yRl7m0OYBkmMoIbSLcWgbXB35FhZ8FXICMlTz0zJ/46/QeRgU?=
 =?us-ascii?Q?Xid12P4t6jG5vmjGdE+9xIN0EL/hAfsGCA2ubeMIqqTMztz1Q293a7LL9gda?=
 =?us-ascii?Q?8Q5vZ1KuNGe7BISwzPh/tEJ+J0lteeXbGpiWIymbv5QnutgM77BSmY55+wOk?=
 =?us-ascii?Q?2tuKETS1UIoUJwdEUd/qNw4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a34408-da57-4e23-33e8-08dd71e803cf
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 13:12:27.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNp17yEoCQzssae6gDBdS+7U1J3J2q2BiHHNhyqw6t0DR/FXat+WZLzZ/++UrXyc7apMXQak9Hn3tiwqQfdfoGukjjIEUFCwnwfwX/fiHy0yWBmbmev/DKp8NTwf+KbJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6688

Dear All,

This patch series adds support for the Mali-G52 GPU on the RZ/G3E SoC.
The changes include updating the device tree bindings, adding the GPU node
to the SoC device tree, and enabling the GPU on the R9A09G047E57 SMARC SoM board.

Note:
This patchset is applied on top of:
 - https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/
 - https://patchwork.kernel.org/project/linux-renesas-soc/patch/20250207113653.21641-13-biju.das.jz@bp.renesas.com/
 - https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=942041

Thanks & Regards,
Tommaso

Tommaso Merciai (4):
  clk: renesas: r9a09g047: Add clock and reset entries for GE3D
  dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add Mali-G52 GPU node
  arm64: dts: renesas: rzg3e-smarc-som: Enable Mali-G52

 .../bindings/gpu/arm,mali-bifrost.yaml        |  2 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 49 +++++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 15 ++++++
 drivers/clk/renesas/r9a09g047-cpg.c           | 11 +++++
 4 files changed, 77 insertions(+)

-- 
2.43.0


