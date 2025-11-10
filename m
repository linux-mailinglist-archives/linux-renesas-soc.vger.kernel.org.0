Return-Path: <linux-renesas-soc+bounces-24388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCEFC467D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B8CC8348439
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C6A30F930;
	Mon, 10 Nov 2025 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uoNjRfCZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D173311C2F;
	Mon, 10 Nov 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776599; cv=fail; b=TBbBDC2O26jgFAKJfh8DyKHKMuhLCi3maUd+KMprn2hJEhwB05PD+ogAWbT1vSOL2LrvXrwDJVQiUnM1EZdziUGUA4XLeLPka8wHRN1aD0mKivzMTRHHqSZllMVrEWnnwF3SsHFljUzqQv3awVUEEWluxmx6KJzBPQNa/yQOdgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776599; c=relaxed/simple;
	bh=zHHOUElu6VK5mnTiunXMjX+5KdZMag/VIEfhxwQTgss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MCHpVX58QEDUlkJ10hdaGPCkwpRBjgbQXEsGT1WB8cFqFCySSRBXHf378TKLG7dq5nwJOHejkgOcai9TFCMqOQtshCojoQ2Cm84kGX0q7mBxiY/uxIplIZnyPpm5kyUtY/wL3yx58ikWhgdLc+19YclChUQhCv0OpM7pSwOZQqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uoNjRfCZ; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egppBSk57Yr0xNhXcEOnJeY/Ktb+zMWVeby5skZhxKDGrgx3w2w1Xe3KAGN2or8xJuJA23VlObhvBBHrQgrHzYvKfyWuA4+XUsrcKcRA1gt3H8J60ncFCg+WHQJHxRGxSi4EUdbXlk7oYFRKdFMCylXxEpKmUTDh5hrKeS4we31K1tGY9JSS0VqVUvjY0AiwpxmhN5UVBtQ1bRepZ342IYu86AZPncwEYTq3PtqGZHCLX34jG7R7HF4O71/PkeBp46r4KJ8OxcsoFCDLlX48LWIYNQtcOmnfPhtN98HhhHnhAjuhAmSgSn+3vyogSBmDM1C0HU85LIGrTvAq3EjtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvvCK0/20tVF91IsMjmlHzD0r+5kLqjcPY0ACIB1AvI=;
 b=PC9qfPfH0qYnK/JmtI4vISopA7Yij4vctQ6wAQEh4nI6Di2hM/U2xRPKx+qF9W0zLXZng3vISYAJNc8wNj7ACGFYBZqy7dx68vVKR/AtJdS7cN3IMlzptJDzBDn1zpMhQdcImIk92Ok6yi47xf55aF+WaJPnUjXo+zKcUCDy7ZURIviRUaGzfGZNLUnPllLmU9nUKUTTJpWTezYQCMyyWdvYgQHp9VsRHvQdc01Zo17nncNQH3B1WWKiTD75sk4eexeEECdxEX/P7HR1EhOH5MCb+3rNMqPUqQLks3pFQxXmERuns6VBZYAIlwJ2LhZ0S2Z3iOEbLZ8cpNfE2jDFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvvCK0/20tVF91IsMjmlHzD0r+5kLqjcPY0ACIB1AvI=;
 b=uoNjRfCZinSm13BLMgUxGsrfoaXDkyJJK77UgS40BBGqlxsdbxPt4hy6Bgw8HLPILkI+crCT+zo/KlfpXru5zkQc0yZ3t6hn+gM6z3bWlayw0L/rPj4i7UcobgplrPgdEVUT+2BJgWB3FVdAvw9DK5UjsnkRotRdwGSu1RaSEME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:09:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:09:55 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/21] dt-bindings: phy: renesas,usb2-phy: Document mux-states property
Date: Mon, 10 Nov 2025 13:08:08 +0100
Message-ID: <bec1905bcee1a396f5b004611353af922e6d7b55.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ddd9ef-6a32-400d-fe45-08de20520f07
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dug7NBQEAHcTQm+jcjQ23srNQhDiEbOV9cJIQOyBbj9N8pkXE4Fnzc0omdWX?=
 =?us-ascii?Q?mfAZPlK4sLmvG5xgTkTbAKS3hQ3Mzr4JXya3rYiwCPF9FczxtQwAgWbw5Wxw?=
 =?us-ascii?Q?C3h+9uSK/1hClrRBh6lJFysbDhTx6XSRYg82sxHbi2YlWoeOH3gn49L0FkhF?=
 =?us-ascii?Q?vGnja47GvegQ1bAIwbZFhl9sbOpjCuzjt+5htjgDfvZMwmIg86yIerFuo1gK?=
 =?us-ascii?Q?eVoeq0qJb3HrYzZpL5r3b4sh5Y40vR/Sfwh1GB63ns/MYE1XX4mEOm6ClScE?=
 =?us-ascii?Q?MdO6lu/ed+8bMyXoBw3GyPYVdcki6KCXs5f+gU9eZdEYSCU5RHa/r23Pm0zL?=
 =?us-ascii?Q?w+G6SnugTpl7V8IeZhsdM3mLlzAtwA06ub+nqqbgbYyFMRMMnFV9WqLGPvTg?=
 =?us-ascii?Q?Y2GOHfktjl2Jw6yYozfdHzxO/VRrg5kZmPdKJ1v+TQsuJsaq7Qc72iVockWL?=
 =?us-ascii?Q?3SqPy4v3xJwWkqnSQUHgXvfGY8hpQP+KGZJKF+su3GbBnkVeIjpoAAWBu6DT?=
 =?us-ascii?Q?7cV8yyORFf7n7hyfpMZh2WzPdV/68YXA4YB8RGB09emS6jyXQel3UE+ZkJbp?=
 =?us-ascii?Q?ZRxiT/wPxFkTuC1Fc4AqrhUlASCFp9V023JUHZlr6upH+msAQ2NjZmf1GhEF?=
 =?us-ascii?Q?8P96/MchZ+f04Z0iZL0TanFLDZNkYuRw3eEhafvDDW17rig2vXy2ZWVGdjsm?=
 =?us-ascii?Q?DlGDf4S2tNwQmHyOx/+Ze0veslp+2EKvm2Y0/5bDzgS503XtAOhIgE1gKa5U?=
 =?us-ascii?Q?UVYfgZ/DP7n9TIkrx8o13yiwt2FqhbXRjiXC7LhXH5ce8vXCzQoqw+bVYhzN?=
 =?us-ascii?Q?5+vfC/xJGOLWUS2as8RabNfl3YSxEuhLJav/YGLc1V+6/Zzys+nCfDJ1n/RY?=
 =?us-ascii?Q?wX9Mmvt+AaF9yNiSS5SSRBrcJtoJoHFOw0odERXMEOtL9mO21n7/Drz2ljIb?=
 =?us-ascii?Q?aV5dQ4GETLx1QPA7TlLkoHDn8HeejrIxuU1aQCU5cWi7NDog0V0C2mM3x0Zy?=
 =?us-ascii?Q?BPZn2ZaQ5sOhMAAu8SxZXpZrSec+I/lbkkTdKWn5A3x9Vt+4133pXjxE74j6?=
 =?us-ascii?Q?gNU0/J3vbdOmIgQo7PniEVZaHqdfoFSE+iyQK9uxXN4WPBhPFZ8Djre5m0c9?=
 =?us-ascii?Q?kHeP4NItKeNU81lxgKRO8NjnKoeHds5KUgHjzDcatDsbPiqn4OwWDtCw0k4o?=
 =?us-ascii?Q?76O679a32ibVBthzECHoSK8AQOnLsDftcgOP98Xpl5AVRff6NSn0amfqOi4i?=
 =?us-ascii?Q?wUNOjpjRjdWpSgDSgZHzRD1PcWKB+ihIwkk6LFXLs0/vP958jXgSfTYFW3JO?=
 =?us-ascii?Q?hkRk8VtVlwxvBcBJY0v6FH9UrPxOQBvVt/y5amUZTkDLAR2HAwavvVDhFo7Y?=
 =?us-ascii?Q?6mv8aCpDf+BI5C56OJ2jV5HR1U0KdAMRzpc1li0/oj5QYqurTArIVelD9sWj?=
 =?us-ascii?Q?Q9QeL3ub6hVqCHtDnLWKmVnc550p1AOTf4uQoUEqnVELOZECmjPCKZUlJkaZ?=
 =?us-ascii?Q?iIexDRXs34ha5RCZIvyb2UnqLPnC4RXpbKOy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aHQNPfY9BRM1HVPfJjdf3FIdzkDy2f1J7xeas2L3GvcxLh7UJda494zqTAte?=
 =?us-ascii?Q?5xXWBJa5B1q0svHftQZXc2dC2mVADmbpCdH6Ea468PivFn6o337nuGOT7VpN?=
 =?us-ascii?Q?UmfULbbRCLJrV8MlN0t5mvBH6MDQ25/BMhi905JpGZpB8RLEKheFE6igSSU/?=
 =?us-ascii?Q?rdo4/PJunWRTrTZIadZG3ET9uTR0E5ocbqUx27jkkaBaH7bd8m+qSOBnvTo2?=
 =?us-ascii?Q?UC60vdc+VaTR4O/lqYhSx6TldLSE+m/QhmSIXU+EecYC3u1n8+RhBKehnsrZ?=
 =?us-ascii?Q?l4IbFCfd5sqA/iRT7gHZ6ZQ3xLrH7wD1yuyxcTdKzP9ZYA1C4aiRsVlFoRME?=
 =?us-ascii?Q?M8LmKm1fBZ4syq8mRZETpkFiKI9b64UVfDESj+bZdmjym0LrwKRq8gnG+voj?=
 =?us-ascii?Q?+lGO/CVwXG+KHWP0IYjmyxThZeM7YihjyJgGlW/0fmcaXFTNgycbYS18PDeC?=
 =?us-ascii?Q?sRH8KSvbAMGBmWOFYBU7KSFV3d1+b2p1Q6mCauerKCrLwZ5ijI6q5oESlWbq?=
 =?us-ascii?Q?npxMlWBPqJzlznUPVePyDaqssuiUw27Hn6EonDd7L/TzU+3lgb7sBpGPjGoq?=
 =?us-ascii?Q?1nrzugh2ExnsWkpmwf6ZPyJdMEd+NJZAcroPQB8iUYDQXio0TJH5mLMHD39Z?=
 =?us-ascii?Q?DpasxKTqVAuzXsK2MPmRs6rzbc/9QLVcGBYAZIqaZoLuCLHo6sdv1+Js7AgG?=
 =?us-ascii?Q?5ZY4kyHXR9GFnDkheDMHb5j61RuVIIDBqr+LhnYRxFLfbmZ1QAQ9gNiz0q1H?=
 =?us-ascii?Q?lgX5VYANl4Xic4G23MFTGWrM23F6PYfIt24SxNh8LjLE2WToUWs7iRRYuMuQ?=
 =?us-ascii?Q?5DkewiTdcDVPoF5pJ55mmquWXulj4hB9ZnOhwfHgksfTZYfMXIKvkmBvNUv6?=
 =?us-ascii?Q?YdgBiuqZg7TdpKsNeUDFX+hVtP7SSdssC2IC88x/sIr+0q/kgU8bUbGn2q8z?=
 =?us-ascii?Q?0Ms0anFngrI+BfWYEa6oMjsP6J1MiCt7HOntghR0DvG55JwoLHJBaAf38/Bg?=
 =?us-ascii?Q?p4PH7HQXJI1M4IBoHs6kTBGAvbZ5ndRAc4i/QsbUIvm7IJZd3fAeGu3WWhBH?=
 =?us-ascii?Q?PRDh4H04rmWIsjNiQZ4x8KIgCTcAMcK41+1FlhbYz/lpfPYfw9OIYVxmj8Ud?=
 =?us-ascii?Q?4YkFS9zkZ89Xfz41EKqhZvwkUlWpbr0JBB5aO9j/hh61mchUgb2Npy0ytKql?=
 =?us-ascii?Q?5+z/xhCyz6w7f6Y9bXirDUtuyYEUvoqVkPNhbFlBRoqFoiUcDEsOYtPfIida?=
 =?us-ascii?Q?6tR5VRij5HW5yAPf5AGhuOAzvHPhSDJxvkEx9vUbfoYXXDT38ZdvUxDsvYQ+?=
 =?us-ascii?Q?1KzW3VS6AjfwZyQ81pFGHCmY8taK8kkMda1FhilQGu6RSmcPQqD/CsI0yb9C?=
 =?us-ascii?Q?fYiutUUaaH+wd/zFzGevzHH3Y/iwu0AvQIpNrfRUzNqpvRi1ejQPogjD0gs1?=
 =?us-ascii?Q?DSfLvAgoK2zBxeDVpdFs95L+F6mgYAXRERt71CWxttMfNW7GPrh7UheUO5kW?=
 =?us-ascii?Q?B2UghbCSAxGk94S1KtNJt3emPHR54KBhsLSH6f/qWdscZKelJN/wW+9vEzx5?=
 =?us-ascii?Q?HIJey3JuDQyfzeaVc4v0FlwycIwoTEPK8Xch+dKv9179fnQsPqslwALVpuJY?=
 =?us-ascii?Q?VWb9lYAH/qcJuUKIY02XLlI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ddd9ef-6a32-400d-fe45-08de20520f07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:09:54.9397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzkVxIXyiKYq3+QrveTi3qeu9XTLAjKV163k8OFtqtrZkiGK45i+gZkHhj5kEH9sWHmqC7mjF0Jkt5ozmjcd+SXu3Ie1tbaK+TWQLU6V1mwSCVorTGqrKJKPyqt9PkYV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

Some Renesas SoCs, such as RZ/G3E, provide a USB2.0 OTG PHY with
configurable VBUS control through a multiplexed hardware register.
This register allows selecting the VBUS source via a mux control
line exposed by the PHY.

To represent this hardware configuration, support the standard
`mux-states` property in the Renesas USB2 PHY binding.
This allows the DeviceTree to model the VBUS source selection as
a mux, consistent with generic binding conventions.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Improved commit body.
 - Improved mux-states description.

v1->v2:
 - New patch

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2cd0efa75f81..448da30757f2 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -102,6 +102,11 @@ properties:
 
   dr_mode: true
 
+  mux-states:
+    description:
+      phandle to a mux controller node that select the source for USB VBUS.
+    maxItems: 1
+
 if:
   properties:
     compatible:
-- 
2.43.0


