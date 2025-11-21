Return-Path: <linux-renesas-soc+bounces-24963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE4C7A7FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9857E342C59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780E234D4EE;
	Fri, 21 Nov 2025 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="d1P95Xdl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2EC34D906;
	Fri, 21 Nov 2025 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738034; cv=fail; b=jOLMgy2SN0cXO4/8Irlmat4oTJg1FpWFNnr3aFJzRmhKw4iR1Sr4Kwwuynh3FDPC135xsdfGeKkdq01T32NXUEe8B0iDuEHh/Kzo3E8H86pmM/b3SrjdBSLM6IJQzDM+cBdX53zSTSobVix7kSu6TigGhiCEk06qmqLRcy5BFOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738034; c=relaxed/simple;
	bh=D3rmsXtCYogiyDU72GttuDdjqgkaYPlQiPgDf4LNCiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vcg/4IE8hgqJc9mdEdJm13tvoZx4Rwyc37VrogVRJOc9vvQKecROmPlbFj+OaXOfVh+yi8kHk2CoBSjKAQ2TJ4kjGVjh7ZsXjqaAe7kd/NTXBHLUw1YXFuRXncPRJ3JuAVUV/eSW0FVo2EymPGA52mfHZLkQkbNmidAe1mWJyDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=d1P95Xdl; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcfyWwniSy/VYhO4YBQ0RW5F9j48J/pFMAbugWLSqfYsA+PYNBJQjMPZYueq0tQ7QRSUE6vsGzzOloHRR9jzjfekNqZxDchC6FgAzdSmF5yVZPmctug1X8IT739WSXk3rhWT++jbKHYAP4tqEU6R6aCt6bGKOBQX8eY3buRmMZovVRm2q9LrkPV9JPj0mzEcCIMaePWTTtRphVo8eC13cs5bLvBJUXBz8gZ6kSJu5FSPsubAxb7KiKlmyqTeAN+iC1zAx/SoXOT3nEE1ay4r9Ily8qCPMkOya5Z4KJyIGV61yFnSx3RWSVIGgsVkDOxrasrAjMKdt6+0cT4q1Jairw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNt71dgFve9LHdSCuoSd18sKliQkV0VCIYwW4ZrcbNA=;
 b=x/E5amoyjjIaLUj0yFBvTaJqYGj3fzw1V7mOEgwnd8hEiNxFfdeLKlWEDIX1HOxS/qPgAldnzr3/Gz3YfwIYBP7GDyavMd0FDOAypUvwKtbFJx4U1k+fT68dZJG4KHJzbpeuKBio+ilFdZhl29igoH0DNtzK9v22q+UiARMGEG1LK7fKW0w0dyz4/EqtcNyh1HDz3La8ljluNpcogucJjJMCW8OUcoWY6DMg8CfCXDAcorEZaLMts7wlkrgcXroqwpgW87MhfIzScl37MLJHVq3WBglcni8u7OxaVKOy7bVBLF53q0vHWmNxgB9oQRljDO+SDZQ932zy6owc82Egeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNt71dgFve9LHdSCuoSd18sKliQkV0VCIYwW4ZrcbNA=;
 b=d1P95Xdle+RvmBYdxA8aoCr2h8pSToIEDhBsPwv8CaZ+fZxsJsuKQHdn25nS1J46bKYXKRghGIYpPkX7ZvmK4qFREsi0qOpMGqp8x8S6f6qN6Iip2qRM62t2ND2HA3VM0S5vwtkDBBl+nQoZdwQR9Qu/9Mt9ykEgwcT22gplGGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:13:46 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:13:46 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 07/22] reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
Date: Fri, 21 Nov 2025 16:11:56 +0100
Message-ID: <9ee5dadd719ee1070483073a7741e2869fea4b43.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: b7266926-b22f-48f1-ce9d-08de291090e6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?85rMMjelzOd05c+7ZDDP+FYzRc7Tx7MeK/WbB/OojMVeiK3UjyVWSkPTWNiP?=
 =?us-ascii?Q?nKEs8usKz/4tvFR/bO59J1I3iTeLkGw1lLqb8YTF2oPrdZrJswlP5yWSitor?=
 =?us-ascii?Q?a5OTCX3ZE8sIDVSrerTgNLR3v5sRUViUYLCyWXGHp+E5MT9gOnzJSQc/iQQR?=
 =?us-ascii?Q?XYlIcC0iVNunq+eaufU2Se9Zuy1N03VcEzMm15GkHD3wXfNXfnSdquuI9svs?=
 =?us-ascii?Q?tFLYwdshDPVcYWuP+JUomaD+Bu2Et84lGSiiqfRBp/KTl81V+rMaC2+mqeBu?=
 =?us-ascii?Q?nvy7zMPV5PKb/OtHEd+ekFCIa7eCEcncWdy14BreAO0D1N2U26aYRM2J4YsE?=
 =?us-ascii?Q?qwx4QQ9ms1U4olbYy14KLMikHYaCPnd5vVKQloMEgjq2lMXXj8sqEV602s1l?=
 =?us-ascii?Q?igP+tX3kYsYOMNdOTmD7wKIQu5QSH5DmXCyN8Vr5E2zLshfF3PlI4geM7vIw?=
 =?us-ascii?Q?aAqZHUn9uzcB5YlA9y68MYZsVDfnyq6j1w1TGKtAXeneZqM+bHQTWSQ0chMD?=
 =?us-ascii?Q?Fzg9SW6tF7cw7HA2Lvjklgji5yH+guwGkjkUM1ORyFWEinLzxM+uaRdy3lzP?=
 =?us-ascii?Q?m6xgk5O4+nkU8wi4ESXrHWugDP0W/8+ym+OYQ0uX+jETHiDOKsXY6fDAb4qf?=
 =?us-ascii?Q?fVdk9zv5c9BmVn2UzVyg7dLYsEHVQ7et/J65WmXYdCmRPCZHPNu8zjH/Rbxc?=
 =?us-ascii?Q?NYkgL/L3JQ7HdmuU1Odt4k34aP/53YIVmz/yc33skprv7HjyPWA3nt6PJDpP?=
 =?us-ascii?Q?BqGf4Q9QvKfsOIz9/HA0URPcadOlV9zL3X4UGgQY+VRswKh2rVMCKSRNMSQV?=
 =?us-ascii?Q?pby/YXYC3/KII0z1k0HGoIQBR0jFS3wclFYnPDn69sIqbOLWOjw+VVI5oUFm?=
 =?us-ascii?Q?wXKEDr9Fr1S7eVC3NgAFaj8QEoQKV0EWje+IYNcJK65t22XHWITJJNJWgcnR?=
 =?us-ascii?Q?c7xQMgrKVFHSKO8gON4AkQ3reHdEDblOxh0/o3qfKsFSN9+OEJOjsO6sIXNI?=
 =?us-ascii?Q?cY9VeY4G4a1DjSHc09NFj27IfCsFxg0ijM/33X3QtAwB6KIk4a7SKIxoXNuD?=
 =?us-ascii?Q?eYGJ6xXPe84QBGdWizbx5FBjUXIMGgIbIWTqjqgFqVYa//E2b6IlvxS4byqx?=
 =?us-ascii?Q?y82EXfFs9yyUT7L3bcL+XfazcCQnO26Cwu7Uh+5dZaxuf3ZPHxEODTdgb6I6?=
 =?us-ascii?Q?3adNL+oG9y+2Ps+9G7hplv8gOgmvVySymBYPIrK9Gy8I/UBAieAJcGzrktNZ?=
 =?us-ascii?Q?R+Io9+fmhIn92F4ejlTlPCf4Lx8s70wAoIWrQHJA+HxUIFTcX2F6qkafSuJn?=
 =?us-ascii?Q?C+ob+DvCWCWkMgPONaieP7O/fMyXFiiSirRDE/t7l9EFcb4EJZ58W3Xa1T1/?=
 =?us-ascii?Q?61C7D3RnlpfC5AZlNHOs/aWLGcdZsFNCYmHk4BA52NvbtG/TyxqJCRFlgWZw?=
 =?us-ascii?Q?XgC7vhbza6mu2KWLb58TLAVffXEFJNi3yrQmqNseygTsGBe+D+o2tdHI2jH9?=
 =?us-ascii?Q?nQghXxW9iVZtLNW9c7j3HtrjBc6dq2WmtVUA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fQZjohKgsPZsbPlJTbyLecII9qz+onxhV9Icw27P79Cr56YchKbhyfvyt0XC?=
 =?us-ascii?Q?pvL429QA/g+BVzypAyovsFS5uyw0rNGF5EkmEDqwPdNLD7ebv8JyII7cgLim?=
 =?us-ascii?Q?Jukl6i0Kmt+L9mRhrD1uK7qBl38fu8NjrXTg1LBHCztF73DTNH1KzXy4+fYv?=
 =?us-ascii?Q?1j94n+HAcbLsSw3zKUlsvGoHmrtyviXhjZqNoblQLcEidV229zOYvRSrMBSf?=
 =?us-ascii?Q?m1Ika7WbqVGr+hF5k6+wsN9OmL6yGR/lWJF2FOdbspl0H151IOQoX1znM8OF?=
 =?us-ascii?Q?sDMo3eejlvTlxvgChqGhtEsXUqRe/gI8sOffP96x8vFHpi7ZuKoL/LVf75X9?=
 =?us-ascii?Q?EzsPSwuXOYab3PLXORgk33bww/x82+9T0GgWqMouA5yiXrYrSiwOy/Hvj6Ba?=
 =?us-ascii?Q?YOwQg3JGi2tv7vrI0x71s69IfaT7hk9Ri/ppmhAJg/3YQJFQQSYq1EBr0EwB?=
 =?us-ascii?Q?+dJePH3A1ESk/7tGIoHKWt45NUfMD7YWU8jHuiPfnZzbC8ER28f8N7mwvjYd?=
 =?us-ascii?Q?JKbPdHHatoGQBthXwumSmI6yJk6ODPforWw9kP2W/Y/+aFP+AdP6wVjQ7JYf?=
 =?us-ascii?Q?2m7ySOKBVAzKpnhZ7zx6iy8YHn/7KA3cOTBv0nnOqSh8tyg7Ld3As5gicsvx?=
 =?us-ascii?Q?EWW7ix7dGF214q600fEtD8UXZv2wbsJUAaTB3Qe9rVCG6gmRBe/SSPPr73GX?=
 =?us-ascii?Q?OPbVFH754df5YdEGJIaicXS3Y198UobNnYMhW9TsV+HQ10LXPgY8HKEyy2DH?=
 =?us-ascii?Q?ccZ2sb4za53NrANvo6LXK0E1zfCSKrWNG6uRJ5V+xxeBXwz6VdvQQB9I3aBW?=
 =?us-ascii?Q?fooFbiDR9kw1qNzdPwrR2O0oGUzRw2it5hTXFnPP0Of+Ec2In1Or6Hf0nxn5?=
 =?us-ascii?Q?O92clU5p8cSWEBx4506gKp7tHrGpULesXpJbP82I+f2/dU5II0i1hJdOwJ2D?=
 =?us-ascii?Q?X6UIEjpE69/PFEwTQZk3ek8DNTGiJe59iQ+8aK0i0uuXGxBds6ziez5y+7bw?=
 =?us-ascii?Q?GSeQiDX3te/OFtsg9dpqJnOdcxlNCa6+lj4EKIeNiKnkkDa3V49fqDq7sYHD?=
 =?us-ascii?Q?TfFpL7WhD9SZ6XDeGrLth3PvdYY42rzquU+ZZeVdAMuMXIv+B2dcV0zSwtCT?=
 =?us-ascii?Q?PuSY3OblCwJeUgqb4caoHOdNUe54CNjOHFNWJ7DAgvwMnAqScw2VbPDAJquV?=
 =?us-ascii?Q?51AtHcTD1X4B2sJuMGAEDeBcboBFr7zUin1IpMiQKsU2DJE2oKcoDhlmYRxh?=
 =?us-ascii?Q?WNJ2P0DeAufDva0GlJTMtuMEb9aNsUjwLf0oSKikELSjfke2Pec3xoj/XRz0?=
 =?us-ascii?Q?Dtz6CLRRDsOAt6aItG6jsdmxYvJ7DG+HTuUqyw8CIKoBlxEmg0BUZZU9GBYc?=
 =?us-ascii?Q?1CriY7zAceKhmvfWRCYcrw/VM42s6q5yoJSaj1pXBlS4tpjG4j1nPqlB08ei?=
 =?us-ascii?Q?VPfE361C7+YCtQiT3Ecr3nA3jBvmbsNIMswu/NR2wCIHcnTNjtx679vlLmt2?=
 =?us-ascii?Q?AfYrV5A+4qAYEdIBBcMNH/r8KZYfm8qM6/8MF9N2doHCLekIz2C4feK7r/7T?=
 =?us-ascii?Q?s1fH5z+TXOedR74rDdv/V3AGvZzjuAYmGCBF09ps/t4TCX2Wo6VzbHBwaBfW?=
 =?us-ascii?Q?qXNqhWHxLigzgPPrdQTFbe0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7266926-b22f-48f1-ce9d-08de291090e6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:13:46.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uGye6Rd5jtkeq2lA28vNztlPZVAp0rbxg+lbu4jQH5+OU4fJRUONmLkBghiq4u20wJVXtl+5AI4GIKKqKrNRKGKWCdUtHPFS1iAtYIg0JmewoJNUZEjnm81wHkLCKA8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

The RZ/V2H USB2 PHY requires control of the VBUS selection line
(VBENCTL) through a mux controller described in the device tree as
"mux-controller". This change adds support for registering
vbus-sel-mux auxiliary driver during probe.

This enables proper management of USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes.

v2->v3:
 - Use __devm_auxiliary_device_create() to create the auxiliary device.

v1->v2:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 44 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index a771e2be53cb..acab9a028291 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -256,6 +256,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
 	  (and similar SoCs).
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 5bdd39274612..873191f30448 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -14,6 +16,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+static DEFINE_IDA(auxiliary_ids);
 
 struct rzv2h_usb2phy_regval {
 	u16 reg;
@@ -104,6 +109,41 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_ida_free(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	ida_free(&auxiliary_ids, adev->id);
+}
+
+static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
+					    void __iomem *base,
+					    const char *mux_name)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev;
+	struct auxiliary_device *adev;
+	int id;
+
+	rdev = devm_kzalloc(dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->base = base;
+
+	id = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	adev = __devm_auxiliary_device_create(dev, dev->driver->name,
+					      mux_name, rdev, id);
+	if (!adev) {
+		ida_free(&auxiliary_ids, id);
+		return -ENOMEM;
+	}
+
+	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_ida_free, adev);
+}
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -162,6 +202,10 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	error = rzv2h_usb2phy_reset_mux_register(dev, priv->base, "vbus-sel-mux");
+	if (error)
+		return dev_err_probe(dev, error, "could not register aux mux\n");
+
 	return 0;
 }
 
-- 
2.43.0


