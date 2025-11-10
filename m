Return-Path: <linux-renesas-soc+bounces-24387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 556DCC46837
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CE06420DBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9031530F7F5;
	Mon, 10 Nov 2025 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZovCTE8h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8F311C09;
	Mon, 10 Nov 2025 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776592; cv=fail; b=k2cDaTBhnkcCtfU2o+KL6EkXaS+t2w9lONiIMuUpz1mDfAN7tZX2QNVPm/616W0Z65ddp67yojEKtJlQPG1DS8GJoGrcTpH+Wfwf3s9a0gauvrMLPMLsuKbYrUaCw9a1vnXm8kluG01th8Hxh55vOCBapVyGnZyIdfekMf2DoEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776592; c=relaxed/simple;
	bh=yvMFHYTNn9oTs77qK/mULJkLKQ5gpNbeV8x7YSRj67E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XMJXQogC49SulHVbvvDwyrRcySqfZCq9t9yNr1y3RmCqHcOB0azv7qnQhhFj69rRrIrQLPKO+FyLxOK8DdljlLfEwLz54Go1TxvZoNajZqHSX+JerZHeDPxhVVUeRce6qF8BJuWvKR5eXDG0cprcGpavSVxbBGi1JdzBFzPHCfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZovCTE8h; arc=fail smtp.client-ip=52.101.228.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sxo8NwCntNTIWVFJjWKVfurUqJfUTbbB6cGRuKYwDsTrNIZPnViZ3J9yrsRNdrp0wSsy3w5zttR+qBDoEZ9zPF8KLBWZPqtfbvKw6iXFY6lx/OTf5t8uSCalOaX/miuO7lslvSzjbTT1DjB44rwTbtdlZH+BII96exv2TSOpe79W0qJtTolr6m6lTp+o4jjJ4YlY620YAXLAvXy2v9dXtHJtKSpNB4yB84utm66hxekAi5Z9lYR+58Taxiyon25dfYlALP24t9pYZRuJ7uOOywA5UCl+Zf9fnAXEJIMSaQvUpBQxt9rCuFpud8uCo8+CCfJ3XskAth/hOD9ujcP+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UISGNlZTtykMOeSiUP50VFMHp4Q+BSoselzz6co7GAM=;
 b=h/lRUG4qOJM++FP1Xdcz0/dEYtXFCjUkI79gg4r6EpKN52nRd+V48278Iab1ZelO7Htt7B1tQ7+PKppm6NQ7t5p8lErLSTUqEtpEPy2ybfQ+EG5bPbO8gIkdFC2QbINHFZV38BV5hZeWVAxB6+mqd8+uCh0TQEOXoXnr+wQXzcU/uChz3xhPv9eDN+86gXnhf7l5LBeO4lm69qLoedTS+bWogD1e1Xl1zHPJ8eUv80/+d9DVaEvFKjvL383VK8ddXJGM7NlQoFSj+Jjzt7fdIpbis8RsS6uhSw6QWGqFm981TAFaKiZsN3kdD6T3stR004pMcFc3vKG8hMT4RqqK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UISGNlZTtykMOeSiUP50VFMHp4Q+BSoselzz6co7GAM=;
 b=ZovCTE8hkYOVGurGO+UoDlE1IKUZzAR4cBZkwussGHi/6OfZhtauD1cUfAXWdBP4SpOjd5GOTQR4JhBjnNi1XsUC/SdcSJPWeucrc/jkmhwOwYN84rPHNMUKgIRTY2RGTwppIS9aQIBz2gdkmElYzGLxV5zjGe47dUViSCNv5Ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:09:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:09:47 +0000
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
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 07/21] dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
Date: Mon, 10 Nov 2025 13:08:07 +0100
Message-ID: <a1ab1e92b1f4f3508e68ba21658f519a58ed57b9.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: edba8288-7926-4bea-bd4b-08de20520ae4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TuPuqwovjJN6ZCwzAr/DyBc+7LihiiVAyQfizg6vaV7Q3bCR1xGpQiquogBx?=
 =?us-ascii?Q?eIJ/T2TpMAtHVoLQm41Euh2DXcWlASuoEmdLc0jaQD8tB3SIla+/nDKa/t8l?=
 =?us-ascii?Q?O8vkX1+T0urrgA0Juom8sXlD9SkH5AaFMLL/YG/xG7ySbiuoms/ufTVn1T+Z?=
 =?us-ascii?Q?BuMewNbxqfhUBUoS6XduLAJG5jKQcYDx+9o9Rk6fSRp86dVEFDh6xjRp/CxU?=
 =?us-ascii?Q?FUjMxLhAREcOie3jqlODYdvT2IvYHt/EKSP6OC/9rnuxwD3Qoya+vh8oourg?=
 =?us-ascii?Q?QR+PsbnSz17ODoxRfiuo3/cOcHwH8/wiSHWPkCLbDr5nPDxqJqSwW2XBG/Ke?=
 =?us-ascii?Q?8StQ+m3+R97hE36izrxAwDhMF/wibZNiejUEfifAfTjCeSfb7PSxybeUGnHO?=
 =?us-ascii?Q?jIiI8tXwHKtoan2IkyhdmeOuPuUPWzpC0NDNOkLNBbk3fikuKjPCLhdgcecw?=
 =?us-ascii?Q?GYx2OEvF0/6QVTK8ZgSnel5RIonxexu3SIdhABuuZi8Nr36Svfw4/Q1Lh/O3?=
 =?us-ascii?Q?SEAAsHttQfFMIhoi0qbx2t8/mRy/GfI0iKXzukHTJgbm6KTqKTKjG38TCBMD?=
 =?us-ascii?Q?/IR3XsR4WbXnTUUXN7+5wf60jLwBtTvsj6kWuY+/e2Go9DY3NoeNsG6Bpl8t?=
 =?us-ascii?Q?sqrW31likwdnKaIwRUrvx1lA3mniAoCicvffM8yRBhfIigvPkgO7wYuNcD1C?=
 =?us-ascii?Q?Ze5yCZlJbRGAUjZw/zVuhdVBXfdg1QmlpoMRCwk/UyOWrChsAHpN99B8B29F?=
 =?us-ascii?Q?eVTgM8WauyaynrloGZ4oQNSiYq3stPCobg7oJZDPTPZcTKum13aOg+NpLbqG?=
 =?us-ascii?Q?ydfWNO6lMTfT4TSrQB7HLXuyccWMhI/SVwXsv8wBogILVePz9k9MbZhdPLaQ?=
 =?us-ascii?Q?VA2iX4aHhRq1BSrzCQpLKH/F5HU5KMZ9jKi9wAmYb76RXjFxlUysGMerxzhs?=
 =?us-ascii?Q?ZCBvf+gykucvF4YkBvfQKD+fZpJfZjFKs+9Xhk++Ew0aQQVUPziXMbov02q8?=
 =?us-ascii?Q?4fzGKO1Ki7Dc3xojEfp3NMKgx/yUZVImvYOgF5h46IXJo8nwsDvnV2wRUfIM?=
 =?us-ascii?Q?mVxO1X3L7s5VxhOKaftui4/YxisrF1OC98hv60LMCYy6b2D0bQ21ircbNpSw?=
 =?us-ascii?Q?yT6Yxwc2cV2qRJJC/ROVbipOQprPPQLjOmLyhmIn5YZTCWv9ZZ6dzyaIoECK?=
 =?us-ascii?Q?jIe1ri4ekdrcALgP7xFkhFUp2AHaqUdH21VZi+JthkrMyX9Sbwkf8gv31qCC?=
 =?us-ascii?Q?asHQzZ+envtsgg+wUsffTZOsMCGErErT/uj7Sza+0vnDnwFTLciQ8oTI+a6s?=
 =?us-ascii?Q?YXp/hnGndhjF4Z8yL0MsFLFcMMG0/X1AVt/D9l0r0FvmBJpz+ujHT2vNTpI1?=
 =?us-ascii?Q?oM/LNXsbh4Hnk+cohyEKug+uIon0Y/s/tdMe6ud4hUsrlLEfIc8XH61vGRjr?=
 =?us-ascii?Q?TbFzbfhS40pFhq/1VhIDCpNOxlAif5cbmQmEdmJuvtkGXnj3j+yHE4+8nf9a?=
 =?us-ascii?Q?fep9a4Tg6/iyiCEhoq1Aw66RRbDfKH5FkVWs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S83mgxs+ll3G1VrjpmBE2iLxmKwsHr6+n8tioEZ99gWaoYjZ3i4iMLu2cZ1T?=
 =?us-ascii?Q?yZcch+8EA0j363C+xLe049xmr0stEqlMXotRMvwX5b1sBQpqnPOPSnNmLh9p?=
 =?us-ascii?Q?BPwRkB50/QV+wSfqLhG3oZPG1RYy+DC3kd5w4E0jHTZFoZzpGo/lBF7f0TDj?=
 =?us-ascii?Q?BrtAYTihC7OpsdsRlpZ3wNNlwHP2bCqgxWLkadmR8WbImVrNZugdqrbtnBCi?=
 =?us-ascii?Q?GC6BshyjGTGJgktwZ853qa+QYNp867o3zpw/YMtgPzPFx11ADPKnAOoNsPz4?=
 =?us-ascii?Q?4xIdW5+BhQjIO9+CRTy1aqC622q5RO/D9qnEwv93fBJKKoY5Rd6YDMcBouxD?=
 =?us-ascii?Q?6NMKXOCvkxMWFrq0ERZrQ+yn1+Dzzs5gD4R7QkYV84Hn1uZyxfcRxpLaQjue?=
 =?us-ascii?Q?JdEHlfhWlQAV6iNVD4q4HE+Q5mIVaIYikwYXzf/w+TEr50rX2QEP8SS9ZI6e?=
 =?us-ascii?Q?p1E9g6tAnIqhBaTXMqm4U2Hb+dnFVHqM6jHvQ/zulyawuaIRdCPOJfcFDm3H?=
 =?us-ascii?Q?W9nZbwDd9cuoAWHR8+t0lCHCt6UHdqlCm05cpVzjFwKr3dq9jgjfuiVTsJCi?=
 =?us-ascii?Q?vJh5DahDYajSt9OwoyIjFifxyIHlM/c0hwUaWzEclTcpkfYeoFOp244R3Cqm?=
 =?us-ascii?Q?G6rhukC2pS8yn4Bvn/0qfXoupKkaTHtMxybCVONOF8RIsJnla9eWOokA11jw?=
 =?us-ascii?Q?NpF5EhfT5V0Qy0Jg595JnXSji4CQbc3v9sqakgGrA0DqfNOCFkKVcCHOpg/r?=
 =?us-ascii?Q?2flVgus5nABQ8/gUZyImrgyR16qXjpcrtqJebrU19t765yO694Dd6u0qxoN2?=
 =?us-ascii?Q?RAjetvN436LNKXkzvx5GHOka5f4mioY1JCUyZaG1yJD52VnTkXHW/lyMniKl?=
 =?us-ascii?Q?4bXAgl9xI24+VfBSfmFNdEWEhR4WhaNjg78KmmB6cYSpaPGRrDjdkPW+aflk?=
 =?us-ascii?Q?DntjX/hSQJ5ATmRz+a4yk8ROMst6Ls3Z6cpHJdprH6tQ8UhAbWeSW3rmYG/x?=
 =?us-ascii?Q?Yx5M64lr9rjZaXbf9baiCYaxUjak/TvD5h701KbbFDB2NW2szwwjus0LUvZl?=
 =?us-ascii?Q?Q1I7rEPvOsVSWXTwUMFUac10tEKJf20HmHa7wytOb2w3EGX9xpjhZzvLuXqU?=
 =?us-ascii?Q?pKvnOaClp3KihEtK2BA7zWmx4YZcyYlhvuNl5zhhxlwFFGlM0fdaJIjCNEnJ?=
 =?us-ascii?Q?24HfDOVoefaRwp5SvUgTVeEEnb86h/odhG89YM0ZH8AS3qzY+x5rRs1SqKyP?=
 =?us-ascii?Q?IBgNAyuqabubmsLENhqTN0MVTGCuetHlVDGSP8DilcN4Y95hYu5OjgXAmXMs?=
 =?us-ascii?Q?TPKDxxcVIkQIgWYdpYMQgeShKpYVvh5xtFgOwHfdVGh0ZIS3hrQYFn0mgonC?=
 =?us-ascii?Q?aowWCEHMogAQ3XKYHHIXJCaoIljKFvszIv9psO9MDq0m0FjDM7+avVPNJKFw?=
 =?us-ascii?Q?DM1OKKG/08WDQZdb9CCFirFiOHrIjfiCOnwyacsmcPkPjrPphkxjJkEq6kcW?=
 =?us-ascii?Q?I0thrDh3Bne3bVfzSFT2dtZ6o3gwLiOnrCwVniyZYWqHlqBqHieN7tsCqPMy?=
 =?us-ascii?Q?DyzYrZe8SuXQAeHpsP5CwyKaBh/18lF8xstt1fZHw3fObSOxqdSvUUfTmMa0?=
 =?us-ascii?Q?ZpEfJHnE1VZi7zm4uAD05es=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edba8288-7926-4bea-bd4b-08de20520ae4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:09:47.7569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpStsbeMJ/S32i+Rnr+9XRsIGjck8Kq27zGgT00aD2MtPSWodoDFdieAyMrWD9xDycmvqtVft7T/FXjjFqO3KdxsNi+kgVk5quxYL3rEq8lnfzzdVVq2EbvHiYoCnOPb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

Document the 'vbus-regulator' child node in the Renesas USB2 PHY binding
to describe the internal USB VBUS regulator.

Require this regulator node on OTG channels to accurately represent
hardware dependencies in the device tree.

Documenting this regulator allows device trees to model the VBUS power
requirements of these SoCs properly.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2bbec8702a1e..2cd0efa75f81 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -89,6 +89,12 @@ properties:
       Phandle to a regulator that provides power to the VBUS. This regulator
       will be managed during the PHY power on/off sequence.
 
+  vbus-regulator:
+    $ref: /schemas/regulator/regulator.yaml#
+    description: USB VBUS internal regulator
+    type: object
+    unevaluatedProperties: false
+
   renesas,no-otg-pins:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
-- 
2.43.0


