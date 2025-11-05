Return-Path: <linux-renesas-soc+bounces-24164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBEAC367D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEDCF662A21
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33B3335561;
	Wed,  5 Nov 2025 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SRZSDwlC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52809335564;
	Wed,  5 Nov 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357285; cv=fail; b=BwXowFI2X0P0VPEnzeNP/D7pQqpDYMua1QBj0hEk6bbo8OGEi9d8kRf6G5Le6dWHwvhcLnQv8hWdTQKpE1Qc/Sq7lmsnUnolylSUiePFZEGkOiCVacnSszSjkAySby/xk+pTcYwGsPre6ecklgcnipl9oej98W+2UOjdQkJkPtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357285; c=relaxed/simple;
	bh=jFuYuK8TJZ3e6aEdHHZL1IugmR4owyP8wa1vjaBS854=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GNPclU9BupifjAdnRsDujMYLf95MbFGd202bO0UbMzOrxhRW2nz1/pQqJ1gYLaj8hCoIQwV7Y/7CUSFScubQZCrVciYMnoHww5owIVDUt8siW0aLNwX7oFa1i/ysig8AVk0CE1Pir+8fULdrJ+DNiuCtYznSjGEf0ajimemIo8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SRZSDwlC; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJZDVkLMnRY9XeViILYO93EqIZo6ddtNCNg9yIHlJxBALpnfSGbPBCS6os0XXYwwk7I3z2vf/s/KABf7rGScAsP6MFfEPidzX0rkvoQybqYBo5fHh1BMk1dud0Zm0lTs1qoPzeODXjUMrB40rGOtvqbfLvnZpI/u5JhLLEScks+sw2vqRIniu71q3pb0RteFEl0nCmfDd9wz7Yh0ulC3VdwdGHQc03ulAVCRQqKVx4z8PE6RvO0jeu6JRWSvIj2VLkkUU8OorhFa9zx2MvdAurr6RJ+tFRMaFWn3hA+3XNNhNvCdaJyU6oBncJH9SGcwgvr2kOMW2oaHlzWfTMIbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VguduBSwaVpBy1da7qmxvZIrpA3Yji+MvgqVEqu86BU=;
 b=dq4kvL0ql2qqfcc30ni3N7jCueziKpdpfkUXdVemBnsHk6bsfpmbt6zfItwHRTJZan2SRoB5mHfQn7uA5+02zA3AVupy4gml9k1KhMB+rADjPZB09xMVcMhRNsQIWsF81ezPKwDlnfI2uQuSwuEQqK67FNI3PhZFWlES1GEBNATlzTQCiosTfai1TOxHkSr/mMVlc5Bwo9ZV+pwh4NOlmGkoDzRjSZgROOiB4gkdXXpyBNARsbEv/W6oPIxrxP+k7q5gLztOYZ/5pjmtrgjzYxeCk00H5y56E3RNxqwSh0BjNlK0sv1Hdl6k15pmEyIcxNmOb3W57naZ9/XFJF8PSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VguduBSwaVpBy1da7qmxvZIrpA3Yji+MvgqVEqu86BU=;
 b=SRZSDwlCAAl17eX1kXX7XidtRCQZ40pKYEsxDAdx6ZFOmhY4jTz9CqTgP92zcWV/aV7O0dEvTrq0QMX4InrRd0nXV5HWfNo75MGJh/GYCdJXICNnPBzp0VbjIoklXCRnN4Fp5o5mliZgwFFoUFnXhoDGHvb4FcumRmSzfpP11JQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:41:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:41:21 +0000
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
Subject: [PATCH v2 11/21] dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
Date: Wed,  5 Nov 2025 16:39:07 +0100
Message-ID: <86c57b54715f8f7bbbc0c2140800d0bcbdaf4acb.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: d99c570a-7fc0-47d4-51dd-08de1c81c48f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jcfCOM16hfPQ9uZpYBhYawD2U6Yd1Ge36/Ovjxsy0qPvcUbYXn9BO0gBAMWl?=
 =?us-ascii?Q?ONIrb1UTGN+lcuZoGLL967Cz1Esg/qF3ort69FaK4VO8C4NHQzi3v+y3AnH1?=
 =?us-ascii?Q?nMPeyyyMOL+X0ssH0zcuHyEa8EirGq0VWnHqgnaS28EFRxtIeFE2na4vncyg?=
 =?us-ascii?Q?MNhUqtOov+LsCoXIJqXcx5f+BjpcLg5VUZNmSwHOXFqAAmfJUv9NJ0ZfeW2E?=
 =?us-ascii?Q?U+CSxOc3vQjnHk6bLetNrk1cGLhShjDnDhV4wUIpWuNJNBVfDAJENQj6MY8T?=
 =?us-ascii?Q?PVcr3l7wcgENnK2tQjLx0dAW0br/Dywd+2MB2pJ2zvwMbewG6HciLjxm5kT4?=
 =?us-ascii?Q?VXt05Rzy77cZGvvWtjXPku/L3v5kQk275IOLwvH6ryZsY46gr1sW/BNVoXsr?=
 =?us-ascii?Q?/CIoTOlbTU+G/lqbNySoGf281SM4+VTUdcaWNK8wNlhwNvWQY+OhehVzDx3w?=
 =?us-ascii?Q?SYrN9CkPLQg+R4uGWJfWphX1Sqs+DP5gFfW0e6Lx2OF+GgQkxQspg+Mk9uSr?=
 =?us-ascii?Q?MgHuXD94tKnD6Y7rRPrt0a+maKdSFGSLFXPHb9HuMV1qOO7rHBwFUUq+N9hq?=
 =?us-ascii?Q?f2O9mVNp58bVjE9nqjXiTBjjf9rWrHmmPC19aeqsykY1DU1s5y9/h/vXLbUj?=
 =?us-ascii?Q?B68gGFxCJ1TfLGtwrRK59wG/BXH6UGuLx2yiyRhrUmaLHQyj5c+dx5rC07pO?=
 =?us-ascii?Q?FFjNJ8y+mCGoYDOwbO58wLpsRu3uFv3dxZfUt2p3nVzi3aPgH/B2Z9AswNU5?=
 =?us-ascii?Q?GQa55scuNp6JLWXd7+m3f/6aANwjaLMbucSa5vvLUkEaIXWRjVWC2W9SdCJl?=
 =?us-ascii?Q?+0btlggtZFfNxK6e6LnuIRq/7SMs+vespWY9OdtLS5yJGP3Phj+er2x//83E?=
 =?us-ascii?Q?oVlJEMXel1XFLPWDLHS3eVh8B34y7sZyuAfhFEQr6jUp94KG+Gi+2oo0EIeo?=
 =?us-ascii?Q?pcvpuTQEQhOv0hkUM8G927xCwzDnw6rGKuiG8iQkDgdY5XnkhsU/lMp9tI32?=
 =?us-ascii?Q?tgmNOC0ns0CxWSgPdQvGX4kTwMTcZHp4Qe0I59pwBAwTY1+Ykl2UJWo1E9ne?=
 =?us-ascii?Q?tETD/7AeEtQsRF9zxP5DE6BdJ5bVYVx2UDqrGfg/djUZv16KGftIALDs6N27?=
 =?us-ascii?Q?qFUkb5Fq6Z2aTtHKJs7Bw0t7gFpKmCuysFUw/xp680Ry7hxFVygAWI8T7zi8?=
 =?us-ascii?Q?AYe2ITjlPz1RhWipPX4sX2IpG3vIgKblJ4hS+UHhPDYiopPTnw3bLR9nPlUT?=
 =?us-ascii?Q?3P8Yb5M3Cfe1qMEc29jFBogr7Sw71o6LS+PhayIGBlEHAk0nxqfZpwJ1NOxB?=
 =?us-ascii?Q?0EtrjJPWcm59Dj67jTac5t6YAjCqEYZ1uoQp60YVa4TPzzc/0iG2JLY7f0wR?=
 =?us-ascii?Q?q2YvsVlFlyAgvJtSIdYE8iBXHQvvn/MUcv3bh9XTjzZYcLD5cdkbhY8F8l8u?=
 =?us-ascii?Q?S7wM5pQFwMXVWDvQYnzwTenXjgPYa/jSfsS1WhGdxdH6P7Htig5jKifU4pH2?=
 =?us-ascii?Q?1/4sSv9iagPFql5fqcDUFEnG01oTTNtpnaNg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KuQedPiEbC6PezTiQv/j0NHk3QAN+Ic0dgNl0zaOP+jeVqxTCeB00y6nTFgU?=
 =?us-ascii?Q?rQH/89fs4uM0518LIL4zkxk7uLj+TvVfnHprqHht4yQZL+jhlVuQ6+RfPX69?=
 =?us-ascii?Q?6RR8NKC6otANAToBIv3zPi71Orqhtto1oxb702k+1T40Yar4oiDCQ4Giz45e?=
 =?us-ascii?Q?2hyy42djqWEppYALv+vEFrIgWKAEWqHQ7EWwySQFkUZ7pjfxPgT6xYDP+GWE?=
 =?us-ascii?Q?m8qMTZAT5/CxhScGRyDecbJZNVV3aw15zcLLnvh1xhYadMQUBahMgD3Uxkhi?=
 =?us-ascii?Q?tIZ7yMesRG/aGG9oGZhb9AC1gki7Q0vCmEe/Tyn/gCzVFoIFNxLeCwGigbCJ?=
 =?us-ascii?Q?87/p//+xPf5sOO20AkOHUw6gHB/w2wJTuKbMF7mzusdQnPMhvKnU8Z76fvya?=
 =?us-ascii?Q?vKWP5NkosdhVZK0v8qD6XBBtO2orapXbfz5aUh3DHFskv3339okDtt3KYPn8?=
 =?us-ascii?Q?lqbXwbcU2U54ZkVunplMJYVjiLnxRAc03DUa/hIW7liCqqqmydIAZNeDmRqY?=
 =?us-ascii?Q?88Oz5dkxZLt3XbDIaYKvqcQaUxyF7f+H+EIVCXlOCp/LnxAboCAOLUH93JQP?=
 =?us-ascii?Q?mHNDomwcD+CsGXieig/76qrMqJPbd5GTyCFaz0s9vHmyqpZR3vKZa2/6F1Es?=
 =?us-ascii?Q?M8CCY+MpWIEYHueYJHyAbQDPfn4sh3VTvv+B0ny9lcwEjV2ND3SRx8o+e2Ff?=
 =?us-ascii?Q?Mjv311FsPvhw3op91foEDf18R5jMSZL0zY6wFVsroPFLvllHujkPJp4mX9rb?=
 =?us-ascii?Q?QF/EjJbssWLDRZnEQvd4J26ZykMnDqZQUfEel+s72edQl9QuvlUF6a8+NxPV?=
 =?us-ascii?Q?UYBxlC3rqd8Jp0s78BxMoIicBxWQpU0kQzPWJWjJnzO1AM2XvD4hEo0pt6Z7?=
 =?us-ascii?Q?DgdFUorxE4HMvHlW0xSeDtxHq4pPMjYKm7OPLkmtvC4uV1cmoaZDWQ4hRD6b?=
 =?us-ascii?Q?qNV9gmn2zEcsVl2/mbMEwDT/QrfGrWXbR3ph6Z/2FN6hVt7SGPh5AWgur6G+?=
 =?us-ascii?Q?N5yIYmHn97J8QLDc8y1gFr5lcqjiXiRa7KDZ6MdT5xuuPXQfDZG/6SD9EXh5?=
 =?us-ascii?Q?j7Ij0IjGmYcxXIKptEf9GDm+PasG3bEInk/60JmSBeH7DTIgTfcq4cfib9Ng?=
 =?us-ascii?Q?SsKW1XA15uYTyfXrmvXJ8UsJzHRekAkfY6256eigzazpkYH7yDBv1u1is/xb?=
 =?us-ascii?Q?0adWxZITPcVSb+z44Ry0aUMU8/p88RihA9kVrQGticLE/N8aC7f6rJuOjL2m?=
 =?us-ascii?Q?0snzCN5PtPkgN5baBc/l2UY3Vlvm//xbfg4H2wdMKr4Q0/xzZ+nhILcSWOBr?=
 =?us-ascii?Q?GJvR2LRrHp/UmY9scraQiOgm+FnxXSchRnsLU65/CCeC9i3jNS2V9oi60lOr?=
 =?us-ascii?Q?2rrMApBMqR3CLwjIF4rOElllEyyUTARTmuAQpUNNcLseCLfUd2ril+qB5c1k?=
 =?us-ascii?Q?DrhqC5Mvh5AjtVC0/qQfVudPSG1zYzVcX1gHNA2DKlJGaSpcHXy26ZyKvdot?=
 =?us-ascii?Q?rWuXsAB9xWHVg07shApD71w0Dya/rFpaxbOk4nqQp3RmxzpOhlUBQhyS95Pd?=
 =?us-ascii?Q?igGEbnLzyhG57QleC8rGJiAueDSU9zW0vfyto5OkMvuufp0NnIuMG2JNK3Sa?=
 =?us-ascii?Q?6sD75IEXtUtPplhZTJSs3M4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d99c570a-7fc0-47d4-51dd-08de1c81c48f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:41:21.0570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6Bpsoj+C0YfVY/NS+Yf7jUl3/IO5sZobTQtCShW1uIhnuRysfPP2+I+yB3opGfXZFDvpAErxvc1mDNskPvsn/dc4PBMp2ZWVmmis3cp8ObhxUYXL7o/OxvZI6SlDrRg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Document the Renesas USBHS controller found on the Renesas RZ/G3E SoC.
The USBHS block on RZ/G3E is functionally identical to the one found
on the RZ/G2L family, so no driver changes are needed. The existing
"renesas,rzg2l-usbhs" fallback compatible will continue to be used for
handling this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 0b8b90dd1951..dc74e70f1b92 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a09g047 # RZ/G3E
               - renesas,usbhs-r9a09g056 # RZ/V2N
               - renesas,usbhs-r9a09g057 # RZ/V2H(P)
           - const: renesas,rzg2l-usbhs
-- 
2.43.0


