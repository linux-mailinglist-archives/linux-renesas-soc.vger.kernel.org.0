Return-Path: <linux-renesas-soc+bounces-24172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC3C36882
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 17:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 30AD54FFC04
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECDF33E350;
	Wed,  5 Nov 2025 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Qz1zNh5n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408A033DEE5;
	Wed,  5 Nov 2025 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357345; cv=fail; b=buxWIGlr6oVkpZ0Z0Wwr1ZSt9F7L3VTvV3tVcZXzTq92dI7A4OrSTA8CprlIBmu8FF5icCQT6AoCe/ZK2Vo0xh81/4AQICmW3ozKin3SGY8jc4add8X7J6VvwV2r5jmAYoJtwhawSzuGuaSbqEhzdqLbjyqlsUjfjKDca1XNR9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357345; c=relaxed/simple;
	bh=f1yH24DQZvGDt5AZYidFLvW+W/ANap/VHXBpzJEx+Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IL+nZpeTavkr+I6mxiozsyGYxkYpKCGbQzuybS9G62Z1ZAE+2FfH/HgEU2nQit3KNhKYbtO1bzGpYGiB/oqmF1pl1SXX9tLdCbT3n1smqQX2SnfUFVIns/GTxyqWx3bNVAvkQnge0Mgd9iEqb63k7JGKdEzCOs4HcVm32gd74Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Qz1zNh5n; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTi94tUZy/xD0UkHkJwI7fWT+mY/IMwfgf8MRyIhXORblrwovM/xzEB6v1lopjtGXJnBV8qhxmcPDNvjqtx6UUUzUnFFFuNKNFrM+ZlFC+SuIdS7ntFdpTOMbAutmIftPi0bslIyMCT+yRbfhPKp5YPwmG61rbGHGvrlA8Xdx+kSBO2aNlOgf6Rjob8gqKI8D1rV+ghESbJ989HerbrHP8boIHydh3FP6xqwgeZs786Hrw53ISNnY7ldwPI9IKTnjKwW343/Ufdg5U4T7E0+3gCgvmjxGw9OszG9cJNRw5xcUXCY43gMP6q2f1vFV9W8EaOK/wNtYDVdAL27AXTY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8DyPEslgTG58YfIkWZpn/bl9H+UON6hV4MMuSphUMY=;
 b=FV6jrLihL4fDv+Y78DFIz2KC2xv5iZxNLlkQJLPmvSbJHxfl5puQkj2diClHV1qE9mf93f7VXLjXN3yhTjngro8wa0l3nZ+Uz5vdd5/tWMmB0/XfxGZp1kgj8iSJWxutOaq8PwC2iL+KZeM9fLL7YgcOkBEGdgPzmTuMctH8I8Bslzr3i96/RYR1KNEMdYlnlltqnpOZTY3aSt7uyAKi6QtDM3Gp3WXDcKI86ej/WI35U7dtbG5JHjaK9t80Epfg497q6WVevtJWX1svCtReQIsC+hmUm6GTSfPmxppY+rawUmkQ3bM0jXrjdDZp49xAsfSE0v3Af2MJEpL50vFX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8DyPEslgTG58YfIkWZpn/bl9H+UON6hV4MMuSphUMY=;
 b=Qz1zNh5n3C8UM/RTkCwuXFqBv9AjCFXzaLbXGKfurB7l0JBEpSKhiy3iPTa+KRtuL7pn/Mc2UyiJCNwn2lFtuzpjaF50khvLLwVHmgQ/t1Nwxx0Qd36JvDNQpyHN/OVnptrIYoS193C5c0CwbkAy2F52bbvJdxoE5nhhhwb7yWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:42:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:42:21 +0000
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
Subject: [PATCH v2 19/21] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS support
Date: Wed,  5 Nov 2025 16:39:15 +0100
Message-ID: <908eb90537e26296e87d539bb66be4f049364770.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 277598fb-6fa3-4f1b-9da5-08de1c81e865
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?elJYHsiWAt5hErVcdCg9GDEZlpNpAZ/c9p2dQuVum9fRGaKcc7C67mvH6hzO?=
 =?us-ascii?Q?5PiQLTgW3hjfO7YUCHD4WE2VHvnnuuNQXkClo+0B9mSQmNRYIXlnsdeEpiPl?=
 =?us-ascii?Q?sRP5k2ph0som2ileNmE4dctIETNW6+LtnffUrqEFNpm2DKRTrz7j7aQ7oLGp?=
 =?us-ascii?Q?18A/pEs11BBl/wGjZn/xq64X/qJDGJ1GITk/25a81A69m5jUwJiUfilveQKM?=
 =?us-ascii?Q?Kmo/iHU9FT7k4SGUjJBe55yblcP/C4sGsCPKU89S1TShGjRn0nJ+1ibHYYor?=
 =?us-ascii?Q?b+eoiM/4wM89rr9o5E/d/eRH4ejIJ35mytzEgx5gq0G+DeuvVO4kdYWSQfsm?=
 =?us-ascii?Q?4PfxZCRrdmDUzxhmOvdJjoqCmLj59K/ksOb+70KdCb9FV9r0DsrpkvHksfU5?=
 =?us-ascii?Q?z32ZpEUxA9/BK/Xu6x/ff0Ne658BlBs/17Wx4F0X7zpnkBzAQgAjvELRrfjt?=
 =?us-ascii?Q?TvDyfmFdbvh/hETl7ixjK4EamVhJ/NdRcYAeAXXxrrs5tQi1B3yDzn6KWQiH?=
 =?us-ascii?Q?/jDyNZzTCJtIGOvv5xTzONcSZ7SxaVw6Y3Ltfs3mHVC5FG4nlVlqti7ZXe5B?=
 =?us-ascii?Q?VmFpJsVEHAE6czfVoHQZAUBdXQR01r8dEnq79o0o2A6WjvKmrp2oDsJFt8Mr?=
 =?us-ascii?Q?BJiPJml4GGBlOGFnuMs7i+pMfn6icSlE1COL+OzTHbKgl6qEsXKWs4TDPFNH?=
 =?us-ascii?Q?jH5iw4wzkHU4Cl9s+U8eY53tEc9F429DymOdi1KVb6nYdbjSvvJ1bIrv4RoU?=
 =?us-ascii?Q?cxqioyM+s/c3dIQyCUsbqMMFAzYJkKgRMS2G1ylZOwK5nbOfvA9kI1O+LBzR?=
 =?us-ascii?Q?8ZnNF04YfPYaieWGdUI6KOXWruc8CupF9GRqsI9oNPX2WU9mUBtmMlaZc6mX?=
 =?us-ascii?Q?rOK+syYCTYljOqEQYeDQOCL8kgoNp4xQ7EKmAaVgR3KtIzfx2puLyc1sJM21?=
 =?us-ascii?Q?Jfw2VI79HOOZVPzV75xlapReurnCkFsailmHojD6XezfbDIVuqC5xdff4RHz?=
 =?us-ascii?Q?3xwOLP6tnyTw752TwpjEn6+QvnfpwREnu4uxU1kYJ/fmf+T+9NUN3t7ffjmq?=
 =?us-ascii?Q?oAhunaptFBAT8cMa2xyL3lBHGl+o1kBSkXiuYX3G9t3aWR9bKLgQ+FqFksv5?=
 =?us-ascii?Q?KpcwF51P8E8A3hjmQ9nWmiWh3aTd1P9YoHKz4egAbmWHj/98woahQN/nqCWh?=
 =?us-ascii?Q?e4X8D65rNdB7l7nA7j/GIi97zmLMoxKFjP+UHaYbda5amFVY18A8QUE6N4Ca?=
 =?us-ascii?Q?GypJUt36l9B0KHo3WAeA2UqwOHTmay7SpnYRgsdeOVKzuGBLUcDim78Y8/Qc?=
 =?us-ascii?Q?40+hsi+os/Pog1eX4CunWiW7QKZf/mb2q3XwRIr5kFjS7ZptV2X+3lyvAM+1?=
 =?us-ascii?Q?Tuj0E6/9pjY9V7AEfF1/4weDFl3f/OP7a/vXOnt7ngUKQ2Up6rfv4CW3YB/G?=
 =?us-ascii?Q?5inigiRg61acoe3GGYGRvu9Xd8scmAmhrUvDNuIxUwREW7aR39pZ++tTKZNA?=
 =?us-ascii?Q?u3Vj+ZaPboOOYmKfDbY1hoarzB6NZxsTD/ig?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gXqKne0ApwKXH+0f25lJQ/4AgEA6j0pHiQQBn54xpghdIEyAkSLDQsxZUgHt?=
 =?us-ascii?Q?Xkqc3KS+ybjLt0x99wmUtVKJXBX43Alk0xos/JOHRXcBubjtb+vWinE/b87U?=
 =?us-ascii?Q?BtN9fWmMUnOXJ5DIW7fJag8XhX1M3HQw3T9azl72ZD5nqt6t/7L7cEjLuIG0?=
 =?us-ascii?Q?nJCi80RcdHoQZB6v5zmb/Bw33wci4mQ/1D7xIb+4ThSuiED0lUTy89FpRZcJ?=
 =?us-ascii?Q?nbB4gZyyD27n86c43Mp/kFZ1WUJEE4KrAkY0tt0tqVomi4ouK84IAxwYMtLS?=
 =?us-ascii?Q?nLc1BsLjd7vvgIUewV5T3P3dg1Vt7+nNKNqfmYWa10xtKHa8PtsjOBFyD6Sr?=
 =?us-ascii?Q?Giff4tgGtPLH7WFIy3wOAYHPma7sfAcXupPViv6geh7acgSTmtKNWTkUJtlL?=
 =?us-ascii?Q?PmVKaNodgIx3BR0TiQcukGe/11OZTFDWaqsUDdlr8btsYPwRXIiilMrGH3DJ?=
 =?us-ascii?Q?YelgxQQpUMGHHGNpu6R6Rs3jkAtUI9eq98nMOS5w/EHnEY4nJ+Gtk+qy5NkP?=
 =?us-ascii?Q?K7j9e581nMGjkucgaPsrdZpio7nLUH3ttLZNVdNXPXANC434PX5u/CrCQiee?=
 =?us-ascii?Q?AckIisjE4make4wOyEg5GO3ikcdPuHnILyET4Lx/ByNif6B1ptsTIaNkD8cC?=
 =?us-ascii?Q?zeyeBYVeHM77yUdXyGYXaMW619SjZOKlLnOQa9xz5ngsOuBUOhkVgsxNXYIu?=
 =?us-ascii?Q?ogOLbe4CXEFepc/EzGVFGYnKtDuXewO6hCOK1U7pYrf1MsnKzqzHPj378s8w?=
 =?us-ascii?Q?L88FEiWJN3HYq/3VcycvKPVSAnnymwx7TscdDyfIJ+3G/xaKfRor17MiMv9W?=
 =?us-ascii?Q?313iOQSR7anNgkAj3uZTHPEr6xQnYqtV72DRoBEoem8nNGRaYKbsvjBLSr43?=
 =?us-ascii?Q?3kCZcJLFlXYSHdzEaK9oGvPjV1uKJt/GFLJ2JPAGj5Oly7NqHLO5gVU/T/wW?=
 =?us-ascii?Q?BKK2eMAXsJZnRHJvwum2IzOVzs79wpbuK0penfmvd0J8unnqYk0Z6pvn2m6x?=
 =?us-ascii?Q?JzxWvdaXqRb650jnl5oZ8GQzTqC/Orz0+/boiZuK5ma8gIv977/CMj9EIO+r?=
 =?us-ascii?Q?Bpp2KSZVg9mdgjRJeCgetdyCLOrqtVpZwtUuCAx/kgiDOc6CxinpyVc9G6fU?=
 =?us-ascii?Q?kzj54KIxjjg3Dj08xTKB4K73FpAeN1FxbF2o49Avd8RL0mWn1avPlNEt7lVS?=
 =?us-ascii?Q?TTNXcOmXW0ra97hanFSS2vLQKgFHhCJSFJTHjwtJiWZngNTXfJH90k3dPnPb?=
 =?us-ascii?Q?yL+8YVdtKvn+86Q5McKJfn7DdqOQ7now1p+xruAOGzR+Q9WI/z3O4r0JeYbs?=
 =?us-ascii?Q?lOjPjvyidqEuz4K3guSYAhEUngumA/7/hr7wjd8ftVQIP73ltl+zsNyKjp2U?=
 =?us-ascii?Q?q/VnitijNQKbBWWXaVU6ICOmZSIHERAllZDEZ/Ukl8ju3LxdTUxFCMPj3apG?=
 =?us-ascii?Q?0HIfVIBY8xFF2Sjf4886fg9tZ/lz/kV0TYeeW/mSFjRAXqs6YMZOXZR7mIWV?=
 =?us-ascii?Q?EBwLQn7qmhx64xWeuN3kq54f6bLw/0ExMz13EdMkRQBDB5Emc0n0NvP37pOc?=
 =?us-ascii?Q?qGWUQ88CJW6HcZnIg0c8jvE89gN3gzT1uTVEm8rv9tunzRiVbxMopbIEHv4q?=
 =?us-ascii?Q?+516nwJwwMit+QsVd43aEx8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277598fb-6fa3-4f1b-9da5-08de1c81e865
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:42:21.2107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pg8XhnxOaRIro1Dj5Y4SZxzQCySqdyzbS/fpzHqqtF5G7dqJzUl7ohTey9vZVJCGD4YCK9E/lkc76/Aazlm/7poujjoEkzZ9eL5+DesMk+l6EXlVNghSu5Uhk5sE+E8Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g057h44-rzv2h-evk device tree.

Enabling them ensures proper VBUS handling and reliable USB OTG
operation on the channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 5c06bce3d5b4..69ca9f0381f3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -423,6 +423,11 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb20_pins>;
 	pinctrl-names = "default";
 
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
 	status = "okay";
 };
 
-- 
2.43.0


