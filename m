Return-Path: <linux-renesas-soc+bounces-22546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DCBB1D41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138DF19C5387
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1133128CF;
	Wed,  1 Oct 2025 21:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="anUgGaxz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274BF3128BC;
	Wed,  1 Oct 2025 21:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354128; cv=fail; b=DOw42bF3VOOHw3jFctJP5twBCA2Qgto3X7Etm7DWucqkVfp3wDMm0z4EieLelTt97oJWug1X3KZQlR9tXGxn6UQtICqlVW8fK5j/1ve99kVb5wqHuAt0epUCSrb3rhZi06m3ldrwPzLGhOSSf3rqljZOPteuimm3LCf+am2Hu2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354128; c=relaxed/simple;
	bh=wgpZf1YUmQYq8LwvlDPALeyQjeI/z7wx9fhrAdoMunY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ytf+zv/HbTP77OeD0nt0sJzndsW14riejKd3mnXKg5zvewhi/jUi3lEvhKBjfXsRonxyid5Q5DuElZmvU+pIwLYnD12Tdft4Ag65X4tDMJWvgsxUUo1vsBlu3EyIO/etKKx/U5gJoAaiXpXtBWfvWT6bIUjsBFq1P1SWh28Xzj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=anUgGaxz; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVaVBKzm6O1i5OnmmTmeqEijv2w6eEmR0dl6Vs2Ap1xntUTK7YcTuA0JXj+CiJzTuS1mwSj2zzAHFh3urNpG1pzZ47bXwZnA0+kxbC0N7ZPQr04KOwy1Dc4kpr7+kjUsFU1miNiX6t02dC8WSE9BSC68c24Pg8kmbxWN8cTvle9vTo8W1GOUD3qg8OsUW5r9AVpiN2pTHHMIl9vHoL9AuXA9rJ1SrZm/PFvX+SyUUt/5PQqJRLbQv3iMzlrIn+DELj/bydPlhE5Ey0opevYKBp99TA3jK+Hud9CfrlgIaTlLv0znoOVoqqOPig+kaqTwc59vI1j1W9IrlD3fVEDgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScPfUQIAX6/ciJ1JKBpVyfaQ9V48l1s/uodrCvAuiQk=;
 b=BxuPcu15YAqWSiL41oDK2d1of80UCHBYg8LC7iVShBi6c7tIieMiAs/V+5GDl9/aWAhlWDF/r5m5TzKvdPXZbEfwvitWjA4X/kdhvVkSJbzbJwNkKXyaxgsYYKC9zvFduM8SwvNi3ABuLgYSirEPXZhM2+JBXyVY3zh5OAB2SQvqezTBOeH3lEjos1xZLAn5uywj7siuIDLO7olr+9Z8cmqUp58H9pssjWwDyangCjGlI4IcN1V8B/2q+P442krtddWz1r0wUZ4nIlHEKVvPNllt/OQ9dofOd30w/4Uir2+NNtC4RIkkzFFgycr/TtHvZP399l7AipaaJQVwzft3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScPfUQIAX6/ciJ1JKBpVyfaQ9V48l1s/uodrCvAuiQk=;
 b=anUgGaxzy+KqSp5gXR3/u2QiuVEXR7pIDx8ih2MbBLVKVolNVWNx6EQoFmRRpu98Fg2If4iO9+xVohyAfxrzTi3L+iyKurJOv2X/+uHxWP62S9dJ1HUURnwbvu+BKcaQDXyGmDBI/5SNaJcT0eMP7qpuV8CuqIV8Z0t5qlaF/LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:43 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:28:43 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 10/18] dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
Date: Wed,  1 Oct 2025 23:26:54 +0200
Message-ID: <20251001212709.579080-11-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: ba171749-b400-4f29-5d81-08de01317f2b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3V7mHEsTQc//gMqztpGNax7VfCXUUHXANmJrWWVrYTgSuIUXdle8uAc5JVKl?=
 =?us-ascii?Q?65rDcmXr//RWKGfa2h4v+eiMCQg0F913pJyS3GtLCpXlygx7OItwBl5NAc1O?=
 =?us-ascii?Q?FNGDyGGFdWfRnC5jiVOtq3ZCR5e612h2LjqWutxIGEWJz4vDt6dNWSVS+47v?=
 =?us-ascii?Q?8uN1zpt00umGJJ6AJl+IOfgMP4NsVGJeyRGg01AXZ8aFXKprHNnAQCWg+1/2?=
 =?us-ascii?Q?K199hm+FanwOSuN/BfwIWtTu0kYKSM5dVq6H6F6W8VNjsl4SLXHRohhb49yL?=
 =?us-ascii?Q?t/gJTDv5yxmrI44HXKv/kxeEXyn0P9aHnPeMuqQEqy7rA5ciPex83BWvmqq6?=
 =?us-ascii?Q?Bn4RRXLkTKCqDZ9oGP116mif5pd4lJxzgPGZYsJ2d9P4JWFNurkQ5TydqSkB?=
 =?us-ascii?Q?FTS095fdrjyaA6oKIyE4aVw4khTRY/t2kuyJaPD92ZTjmInvB/gHQWPNlHEo?=
 =?us-ascii?Q?dtqA9zAo4M2a/Eb95wQiQNt2Jj0LqpVLNerCz1o2voNKin9RCcYw+WNshaM4?=
 =?us-ascii?Q?5sT8NhyeGU6g4/9wvRjBr4JcO2aZhwMIcq4MmH1ljPLeJ+fTlUF7CwXyN/sE?=
 =?us-ascii?Q?M5Uf8rPpURjsLrdM2WkYxv1/K7hEnkqpXc5/5LGOWtfBkZH46zLSZeGsBtHW?=
 =?us-ascii?Q?TVTbtj3zMRMhLHvvz1ZBx2+b38t4DIn+Yk4Ja1LXybiTUT4HhPNtZ49jiLye?=
 =?us-ascii?Q?dV8R8HpXwYLmPNr5u8Kcb2/5aYwZ3N0Dpx1swBfTzqhs5/b1L2v9HcFBGwLB?=
 =?us-ascii?Q?1c32+Sz+vMdVj8Ku5QzfWVhpYOyVNwyNDIKcqc+HTU9sV19BDMdNQyf5S6I4?=
 =?us-ascii?Q?spRxpnXfiwf1LKGar0K8MPT5x7BctbhUmgpiuNiChzVv0V+I8Ws0lrriOOgp?=
 =?us-ascii?Q?XW8Cla2DlpeEXzrWjwPhIZ5kMnncUP5SlbBR57YVu/bemepp3Wl+RLkfLZk9?=
 =?us-ascii?Q?4a8fDrvXifVVLV/zdXokijtFOBk7ZT8fVtaGEyXxWh6ZaxADpxF2T5h4i/KJ?=
 =?us-ascii?Q?e91OCgmJkJhOsvcJ0O7Nic6rOQQcfv5jAw6Xrigit4AD64eyeDtnRXxbD3kj?=
 =?us-ascii?Q?vgMybKgjLXyeAVSFxResGYXZy0O1L/T8lt9+4V9ojfoZhU1R0ifLclEc3gcW?=
 =?us-ascii?Q?1Z39k+eQZgAqDtLpioekHNcO4lXgutBTJ3gRVY+hSi9zQKuaDiOYOpz4BYhe?=
 =?us-ascii?Q?LyD+qncelDRAqBs1Z3r+d6XgoFpAqCzoAJoGzVuoHVghl0U4YHde4dDDcK5/?=
 =?us-ascii?Q?PdqTVhFkNmlwclaWgFabauJB8IDX9vWz27gR8/BM9luMqYSR/qTA2wAtLW6f?=
 =?us-ascii?Q?Uga3pC6Ao4/JNiESOXOqu4CwK3QEEmMbtxINJDvJWBCH+5lw/VEFhhDv4YOx?=
 =?us-ascii?Q?grJvyYF+z9bgVLRa2ATUgljBOUY2meyJEPmniFGb7U8GCKzeglGFZ0leYOWO?=
 =?us-ascii?Q?T8o4F6Vm9xmzELF3XCIHFKIXwlPMp/8uBm1JxrH7YZYjCclcuZZ43whkgrfD?=
 =?us-ascii?Q?x5O6CzSkX18UDUoIBXp9lHNM/nCx9ZS1pJOZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WaRnqfQ87TiJFkUx4dB9+qA+NA/h7eLduU4603bhQd6pF6HiYCKrl2gLGh/W?=
 =?us-ascii?Q?zcLBgWxNws8kKvwBM2rCHHwNwNzTV1zPA99PMK7f3J3nCV159mKMDgxqaOyN?=
 =?us-ascii?Q?8nbJ9qEL2zvDLOOfacELUd44hRukQFn5debwFRsfzMSH2FGw2MagZ86YitLZ?=
 =?us-ascii?Q?oO5x7dci5aQSaGn1YUkUayi5tRpztNVavbYqO0A0i8KbZ2Hv1OWiRyQCdadv?=
 =?us-ascii?Q?UnpprhzareNaMZEMXqm4bcxxZ4pFcam9XT2+0L9u9IQS4I2jA0Do5dD1hrM1?=
 =?us-ascii?Q?N+d62Q+05ODAZ579DD/DG4aeey9TWucaNTDcDlj3DZX+6Yt7xGDWLUZppigm?=
 =?us-ascii?Q?drv23MUDvEqsE+erk+hwfy//gAewqcdXYk4cCiBq+E9mI0aSM6F4Ls3n3w5R?=
 =?us-ascii?Q?UpWKKxQu1m0Z/7Y8/5+SVBmLn5eeE8rkyQTvscs9pdqDjkh9TqeoHTehyd52?=
 =?us-ascii?Q?MVlXiw23BMaSgpaWLuhbzmnwdt1r9Vx2qj6Lkq1jl9d7M4gFshhPeITWnJMK?=
 =?us-ascii?Q?mmaQcqNm0jtE7EySGlV82bnFgNNp9usq69Te6d3nSAQ8DSXjlDCHktPF6WrO?=
 =?us-ascii?Q?B8W0Q22RoD5uOXxnOdhV9W3nYXGE59J0HW2M5+1Fd2UJCG1N+I090qR0wQWA?=
 =?us-ascii?Q?TZsTBiHC8Wfna8sZ4zdxvkFIwoUoE21tbb2oxyNaE8zch1+lYdO0JgNbJuLV?=
 =?us-ascii?Q?jfxpK6u9JVNziO8GQUy1awHbw0hIXXircp72vl7HM7T0GwCulreZV/hw/e/V?=
 =?us-ascii?Q?bd9q7IKpzWv5QV5Y98EuZ0dk1z0acovZ+tGbo/t0XiMzScVQ50klpd1k1FrY?=
 =?us-ascii?Q?1iYxB6Z+m6SG9E8LIkvWsVi+XLGDPpkAvOeBN1Cl9yrpOC24pBW1OacRKuYD?=
 =?us-ascii?Q?NTa7p0cEXA7hCbFqsQ4RBvysNYpcMLNes/fMchuTtpyerqtiHorzcfSOq50+?=
 =?us-ascii?Q?vHKyxMqA2YobjYd9rITfyTWAj9B+0Ohbn5e8/njsPLqpTMASrg2JGLlYRXuy?=
 =?us-ascii?Q?oICZopRQVbVGSQ9fnV06zmFksqz0DILHuFgZtq+R0lqTq58ht4MHzNeZrgWp?=
 =?us-ascii?Q?sYy+jaDNpkxxGwQ5tAId09qwz8ELIVpwhWtBRTWlbYc8hyKT35wTuQO6X6VC?=
 =?us-ascii?Q?hN7XfsjsGjv3RwNuYbNltaaHNUvnFqgqZYezFKKPLUf57N8hXROH/Mtzz2zv?=
 =?us-ascii?Q?RwH/4JPhNe0ZnmafCQV+Me6MZZzZD3rJ7YTxBPShmT00Qw/4Y6sLcyqY319g?=
 =?us-ascii?Q?6bsUl0AJUmeCdMRumqLigtuP+Z/vbDdEP54loxP+sq8zisd3wV34DAI+iv84?=
 =?us-ascii?Q?UP6o6PF2WNKG3JSwwq+cBP3XdTiJ4GaUbu9ZSXOSek242RzCnfV6wvCzYMEA?=
 =?us-ascii?Q?lhnUofIgjaer5kXOAzK2UfDUVSyAgbkSlfvJtgOG1lAqk9+M4zvMMWhiplz5?=
 =?us-ascii?Q?1wIwXIE+wSpXqftMGEGwg7OgwMZTGU3J+5PFOJDLUSJhzFdf+E96EqvHGhNA?=
 =?us-ascii?Q?R2vcQtZ4MWAV9RgwfAco/Q3Gez38oflVz4yB+jP6u1sUqxaV0mJl1nmYjROt?=
 =?us-ascii?Q?mx3kBFvSIu8C6dhWi5pCTMrPGv2zBJmcEOrSs9CIgjVnQlDiCkLiuaGjQqC9?=
 =?us-ascii?Q?ajB5sEsgl2nwgNTNl1InW7Y=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba171749-b400-4f29-5d81-08de01317f2b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:43.5741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuPap6HUqLZ6WZKlCTM/f7Ty5FBb0j8CjRUQdGZUhvAttFwGYIN45GC22XnaiRQ3srDISb/tGuZvQ+kWFPfNtyYj22ARLhe8/uwQ0IpyQUH03fR9Th9F/XOP40e4W7pI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Document the Renesas USBHS controller found on the Renesas RZ/G3E SoC.
The USBHS block on RZ/G3E is functionally identical to the one found
on the RZ/G2L family, so no driver changes are needed. The existing
"renesas,rzg2l-usbhs" fallback compatible will continue to be used for
handling this IP.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
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


