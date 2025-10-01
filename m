Return-Path: <linux-renesas-soc+bounces-22541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E80BB1D0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD7B41C4921
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0835F311C38;
	Wed,  1 Oct 2025 21:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZXgmOPSN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0895311963;
	Wed,  1 Oct 2025 21:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354100; cv=fail; b=oJPVPhUUopyTME3w8Esw1iinW4/uv0hhwmXu/vGK6PkzrPFaSkNmSv5SiYmmpLHUWgMf9+N1ZuNz+S5n6hcbRyAz6PhlDH3XbiR5wQFmZ3rG0Uw1V2hhkxOM9ku54utaJrHghQmTLmN90KozXr1XbC4phTUP2KzqZd775akQEes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354100; c=relaxed/simple;
	bh=A6zSCnPNPfRt5czMMcmi6fcXIkDnyScZsPqtU2eHkzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Basv5jdvH0Yy2oP8oBzDkc9PoBnCkD6xIRrfb5Tv5ANUc/ut4RqZtMBniuJKojMklWfIe2DM0UuB1xnizy/dFtZyKgqytqXaUQunZzyWedbjfo16A/cq+fxpLP8gnYiuLIPpRC50qRh9yynHYLEbOFuvobuX4kteWiTECiWQOv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZXgmOPSN; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Chj5mfju1NXGatUHkzjM8O+lKz/edIxNu6MX9vqUROsolfDOQHb7AUOv5fYBwoeci5dxe17u2eW91/RlJE55/vPlNjoHZLlXTTNe43YUDkTADmz1ObT4t82X6F2Y8NNBeHTJCvBz+cgnAGZk5RAY+Y4pgs2MojVfUmGdbemMyzvQFf2ZtGwZvm4wQhMu98VjObIY7ZPyW6AUQLhcbk00J+08YAGciQKYdpHxUbYbOdTKYp1nky7Ea3mXUdWnMdjfOUrshNPp08/s8NRGHdlGsTnU521NgAB17Yw6fEtbfzJXcPNXNWgWZNFVVjcWbBp6hYwnFFpmMcu1KX8gq9LQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUhJVshKjumVNSQ4woe6E25jOvZn7Id67F/tpXw8K04=;
 b=CxXLECtpW9esZ4HuB07AQ4l9yjCEushjFmf0m9F2rMHI5ZgFB9gIYCXFw12CgG9bPnZkTwImfuVLy5d19u/wXILWWtThrOpm2AyUY2QsjMp+1ueSfvn3hHfXwAjxOvwuOfz1SLQ2/Jj/nfdaSrSWrNiekecPGkS0ad+0MGKPaTU0zIcII83r2Q2T8LbNskaNx03eVGAEr5XvYHuuvSamCLuC0W41Npp1xLFTMFEipwC7vhMyP8cEgrQFuqwLKZyXVUjlOdQT7KbTrRmeQLemg9WHoRSFZSFOfT0C3+7zW973H1d2zEgY7EPXbuX+Ydu16l0AF/FtATbUERKEAikiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUhJVshKjumVNSQ4woe6E25jOvZn7Id67F/tpXw8K04=;
 b=ZXgmOPSNZTUI/1XYwQkXeH3qP8yzTz7gg/vYY/bVyoqJ/fu8BiB+cJolbhfY9O11cUIbcHeGMjjyKhuWqeMnzzgFZgAcL9WmbwgbA6Q9jNr9zhL+wDaHn8KFeqdAqDCoT0dogXVWns/BnCpwat79dEX4bQ4qQmR1jRCGw8tEzro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:14 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:28:14 +0000
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
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
Date: Wed,  1 Oct 2025 23:26:49 +0200
Message-ID: <20251001212709.579080-6-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a6df9992-fcbd-4841-112d-08de01316dab
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G2YIO09oVBZ6Q9TLJLYOibd6EtdpQ2Fc8/KoRPNWIyxHO2V6uSgDaqlv5iQM?=
 =?us-ascii?Q?W19nQD8TBJNvfPuzRsG6RBEFgfs6xnlGa6eYFcmlamaqhQ8ef+ORy7QWWsjn?=
 =?us-ascii?Q?nWtjeiHhREqR5IKUy4oY3AnIX1jc9x2786fY5P8i6yr9MRYo1fwK2h+bAi/M?=
 =?us-ascii?Q?2/t3QK8TFx/VApOOFNeLNpo+fT2ErqGMHwBd3YqK6PmCje1ckGVHk21KUmf9?=
 =?us-ascii?Q?V574LBugFz7jbRAwjSNZlT+S8zHqX6M2ZwpLb7BKfV59lSPHJtS/gWaYXgeG?=
 =?us-ascii?Q?Z1H7dz+JCtIAARAL2N/2InPOEOF/q15jkh9e4lvq49WM4p9zuP5wM8MGpDY5?=
 =?us-ascii?Q?HiDH6nFoajLMu48Gy+9FfFJkCT1jyudT+8jwlcTnFopc46IB73qkrWiY16FX?=
 =?us-ascii?Q?dxgTnQWsSWCRoTbdgWRKvLeNp9NT93TX+op+jpWpNKnH5AQaTU6oqt2Kcyuz?=
 =?us-ascii?Q?dOp3aqCy1Hzjz/p8slx21rAYvEvDH8BdS7lbgYjx5KMNUdk5aqiaWq86yb0p?=
 =?us-ascii?Q?W2MC5K7LhJtiNUZHp7CjN4XcYrtg2JwY1ToUNn8WICMNGSMMx8FgODnjONT2?=
 =?us-ascii?Q?RqKRWXRzoQNnGzf+BgteUgBeW8G6RkL42yxFnMgkaz2MX5gmZ6sC6yQtKuZz?=
 =?us-ascii?Q?lYh5nahoNX3Hy1wRNUkEzpMOqg38w2NorMIF3Wv2NR0toKHdOjqzXxMJS6ra?=
 =?us-ascii?Q?LlHBPIV4NiMNeHkBOTTPXFDZaGSPXOu+BFEnOFCrImGyB8/GIHTfJBx4DHFl?=
 =?us-ascii?Q?BILQdELBuqTZ0QYzB139Vxk9cd/9Ar9FORJfhD/BUwOLO7sF1LYAXDeUvR1p?=
 =?us-ascii?Q?qQPYB9D93adlwqnWG0tbA3hrrE0/jFfRMkVrYDYcIMOPCvQ/difUdk4HFD6Z?=
 =?us-ascii?Q?EJFigd3LaRkBPyw8CV3VYKFpq6UhYdRoLM53Nl7kYopvxt+yw9hio/Hebmb1?=
 =?us-ascii?Q?sB5NBUf5Zs4WHNp8Rxh8MPDW9lpmuoiItoyJM+5PEuGAmjz+3XV4WPW7nsGn?=
 =?us-ascii?Q?FOHwwRcIFDg+tRsxYJ3FWEFNuaL0nWF8anPiWnc2h9Pb+X1yQP/8CT69EY0s?=
 =?us-ascii?Q?4e9tQuyaodb+f7VyB4tDkG4MuqshfTngcOkCaXEts4mfmbMeV1jRVid5x+4r?=
 =?us-ascii?Q?MkNqvb6Yc2FvDREBQNwVgZ2V5PVMOLJErl+I6v2Vhf7utnWDKXsuqsUWb2CI?=
 =?us-ascii?Q?mMYNbknrRmOIDBPpolUH8gL9cRudoNtAnni+fPjIuu6jk7+Ggk6Uc2z1BSIV?=
 =?us-ascii?Q?Ebi7Dmv5gjNyybM5z3kdD/Y9rQHa52xtbsHfsYB+Ru4Vmp5iBeEmoiMA8wCw?=
 =?us-ascii?Q?G0A8rg2oQbmVrgrMLG05kiM6lz2b4hnHn1ioegfEMic6l5tr4ln08qkkQDGo?=
 =?us-ascii?Q?IVzajW46AQP/lwc76xNJYo8/+vEioyfpWeCdBoPye79rE/Rl1mD9BYqk2Xl7?=
 =?us-ascii?Q?LUStMNzcWJbDt8Ya69JAtby6PuOB8VvUYQk7y1dxugAQcfNl+Pe1g/rq2uH1?=
 =?us-ascii?Q?f/lKhj6XcDeQbnVR8M9zH5pkJidHsEwfcljq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oOtxZpVPV1FAuAXtYdbJRLRLSIOKXZ3HMfvvm94VLNUGmH19lu3IEb7H4dyH?=
 =?us-ascii?Q?38US506/cTnC9c2na2oVobQzrPLtvoiyASo70HUKFpZ7l/3oxtcdDqpDf9++?=
 =?us-ascii?Q?YCNu2kBk5QJQz4nJs+sgYGr80xArtXhsSSSp325TvMWIdQTzyiwC849QnYyM?=
 =?us-ascii?Q?0Q/xaYR0gX4p77pbIrLy8AykX2+P1ZuM0fjt3JgxSL5g1C3msYiBtGyzvsOr?=
 =?us-ascii?Q?Cbmbe3UemQ6UQiknr4BEvF5qk9YFX5PKqPiLG85NAzQEeNDQhJGpX9vgVX1C?=
 =?us-ascii?Q?qOW9yFVf1FSQKh15xKZoDbIX6F53J4FFhe3tpaNTZn1kGg9Etqhr1cpbSP9N?=
 =?us-ascii?Q?l8hIS0si/b6WNxLAn7PEF0uoTAQ6eObk4+tOl4Vui+nPg3EeVn932mgVmdM0?=
 =?us-ascii?Q?bo1b+R8W5zirlAfwHvHUUFZUvuc+gNMC79dhmIJ0tyO5eLXcLzkk0Fyy9IGH?=
 =?us-ascii?Q?Z68QTwch6mmTA3duCOdrtbAKPuD4zuSXA8cmXtw/KHiR1pi9+I7vrHkYxZ7b?=
 =?us-ascii?Q?GiOpL2O0q/S7HpyHrh3MlV/qEPhY3uL0kHcnV951ubzIeJf1iG/uoOb+b7ZJ?=
 =?us-ascii?Q?dg232NTvFNhG15MBFNsfwz7wis+q2pH+6i/Y7cTlUrIQHnz/Jg23077VeFj8?=
 =?us-ascii?Q?3Ocaeuz6LPdFduf5DR2cXBAWqtUw0NrKdzOnDQ9fH42Fyoynh62uU1qk1ubs?=
 =?us-ascii?Q?n42PRhiIPZH4tSIfsGgRJNdWNK7lwg51Hd188dzkF+WNo2gL2CoSrz+/ELVf?=
 =?us-ascii?Q?Mn6fxAGEXIS70JQOsVn96aTX9jWxNJb/TytRisVCK2I1fvVEkNNwua0/O/82?=
 =?us-ascii?Q?aSsMEREUQxz+ZcXOg4IEGifOxInTxM6w6+ZKwzsY8AQF0liT+eaHK6pkDuW3?=
 =?us-ascii?Q?72nemOPJZ0o8n178J5cmJTEZqtvGmMW7mZzSzPU8io0cW3Q1ResDV85xUbhF?=
 =?us-ascii?Q?PEzlNfNaoNH8Zdo5a+UjF0qvbHOWupvMPCKcNaCv5e0EVsC1++HGEUsc3qSD?=
 =?us-ascii?Q?TB7LPL2zwPbRf+lm5na9BhlW9m7XUpqPVasSQ93smIx+puJ0Y5sph5+i+Xcm?=
 =?us-ascii?Q?Ly9A+TVjdVno8sDA+E92+GphcTuOQWai1JAfg3dXGWrySo/SxX5Q4W7dqY84?=
 =?us-ascii?Q?Tw6+I3vZSKqYvbr2azuHjzWQEOv+XbIQkYtDk2c5wJX5QICEE2UjZaw6fOqW?=
 =?us-ascii?Q?CJHxZbTCvaVfd+bo0Qh2CM87DR3yX/uSCc6T3TijdqzCL2XA5UfP0fevD8Vt?=
 =?us-ascii?Q?u80ANhXFIqghXMqQp9orqqaHfa9VT+nUdTk/x9Pir9ki7TulzzNJRT6Juj3V?=
 =?us-ascii?Q?PabYO+bJf62MKT+GTEB2/jLcc6/e9ia81S17ERHtkWLg0guHTTl4nGy+p5t5?=
 =?us-ascii?Q?CcMsAjnq8d7FxJCZhvsRBT5CsQ3BwqQTp2fEuUav+9VmjqSR1sjLrBn3Y1mT?=
 =?us-ascii?Q?To4EiDTx4I+rHNraprX4rU/4ACj9KaY04rCZj8uEeS1+0JKXeYM2qeOSmWrb?=
 =?us-ascii?Q?BsIsOK63hgxYo/mqkcVvFvlRLghAK+pvCBVv89VCDMjss1tJHc3/lB2mxpGn?=
 =?us-ascii?Q?Gy0h3/qM4YnjcKt1LDudRzWxeu4F/fs0HukTby0mH92rSRR+iNJuLuwTAC9b?=
 =?us-ascii?Q?11zmk1sBM5evbEAbtzIJej0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6df9992-fcbd-4841-112d-08de01316dab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:14.2106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL+0Ja2pzqgvTosCeDzV4SASW6995Nmo1EMuL+SW2xsw8CzkwXTas837XyLlVjJGPpXyYEp3BYgG0Fcgo6SX/GSQ7Ej66lbCALzLhzsbj3xqDo8+Cpg5HpWGkzpFHAsg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Document the 'vbus-regulator' child node in the Renesas USB2 PHY binding
to describe the internal USB VBUS regulator.

Require this regulator node on OTG channels to accurately represent
hardware dependencies in the device tree.

Documenting this regulator allows device trees to model the VBUS power
requirements of these SoCs properly.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 179cb4bfc424..dde5269b0db2 100644
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


