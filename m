Return-Path: <linux-renesas-soc+bounces-23565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF08C047DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 08:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D2B64E8406
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 06:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFECE26ED4D;
	Fri, 24 Oct 2025 06:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VbwZy53F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2026ED59;
	Fri, 24 Oct 2025 06:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286942; cv=fail; b=tOiMMKN+digwIxGyz94Y7I/Zst7HRozZhDDNCbAs7y07z0NLBMMZrK9EfiSdHXTc/ejEXf0W/1fiAzW78xb5BPKvc+XOLA5n0e3zmQM3FyJkr/W2bdPZRXHF2V66TLSonAg2z/lXuOnlktE19lOpFCtyo2uuIlDt5CYln/9YgQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286942; c=relaxed/simple;
	bh=Lz39Szmia0KBkVKCY0Ipbe/h+GKIlmeF6ufMyAJ8gI8=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CQppWxdtteiZN0iFBgK2pe1oT+8RnQ+X38+O9B47uDTgwCQw9soXjSDWx8eGXBJ2KgnUGkJUPTf0Fnb60HLuQJHv/lllDbHMRQ+DIKfG4PN12Hi3CeeKpBVuwU7wY44X6zbRqcQcR8J0dfKj7vtNdexx6XileGJMrXg5WGSrunk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VbwZy53F; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSayGpApQMlMKyYOB/Bc8XsNErAHZmpEIQ6oSb2bZjarDdDkbuRHsRQgv/gAqdJ1frXcSCtwlPGdYdfxcmhZcifpBGiKkcnUDWeol6rgcsi/915+CEe+2S/0dkU1HAI6NCip4lu4TdpybE3pOSg+bihikywpIoJhtDTgbvxpQOSVErqHIEVYvgswpJRcucVYdz4Wi6M2Pkpyl/4L9bzWV+R5kpTiWNqwzh2lH/I52QpCHqPFrWDHgrY9+Bk6W0gtHjnMgwHkR3ufmqC9hkWIkrP3wkDuAYue1gwFzTvD197eD/yGzI/SCoNua9OYuC0w4Z//AvKqS+Sk2hGEGLyYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6cdvpSQjKTgT5BYmxEG1fUy7vgCtPJvGs5Uv1qLwcU=;
 b=mHBklKuTpxgogzixEiz6eW/ynBImYXXz2qW1aZOwEjX9qOy0CbQWwE26KW6ZG75awMaKRewKJrDuFiaD1BEMRtEV2QcSmWQF5ZEvvUDo7dYuNTg71StESQrE0aikYYfCENVKrTZz6J566n3cu/1UC+FhdCgpCKUvnSianrmJBLpgMg3OxSOS+Qp5MtEFweRnVi4lYaRsBRdNRg8KJq7axugRaIfo+LK8pj7X56yL2RMioBFnPh0iLubKo9B9xewSI/IMSbpDQCJgLrw57y09+JIAHEreqPs4d4bppGo5ewBLbWKQ/h3PVG2u4J9unxbk+GMW9N894wOJasspVEWHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6cdvpSQjKTgT5BYmxEG1fUy7vgCtPJvGs5Uv1qLwcU=;
 b=VbwZy53FsVjKOyEOsP5gertH2xLi97ju2KoMYhnoulQZI6nbmM4blAuyNIN8JLQpf/xcuA0DQ51QKa3v4IwMwUPt+caDjOwaD2Wqt6jE740Hf4Om8I1TKjIDgp9z/I8lcQ/XWeq7XyyLOW96DChJ+8hfN/AxXFqFR6Np9RDLgyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10774.jpnprd01.prod.outlook.com
 (2603:1096:400:2a6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:22:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 06:22:18 +0000
Message-ID: <87bjlwn7j9.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 24 Oct 2025 06:22:18 +0000
X-ClientProxiedBy: TYCPR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:405:4::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: fc418579-6d9e-4714-c43c-08de12c5aee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZFu4fpbVBTGugN93DO6ZQaHqmCvJaqKapUXawguEcUc8vuchDvkuniT+N0TQ?=
 =?us-ascii?Q?hiKapYrYKeTwc53j+32qCtBG9WprRGvNV9peOqTcDvCR9HyvfOCoQHtxwBdf?=
 =?us-ascii?Q?4eoD4VFU9YTrTGEAhM7C0+wrjo+kBcHRr9iUDeYVqpDSVZuyJcknif8YYF30?=
 =?us-ascii?Q?PHCs6yBlC5HsjPg3HYWwM/hXeHHyQnUr2Q8QUjTXoGEF9xHmnia83mjiArSU?=
 =?us-ascii?Q?LaRFpNDD7PBCFxapAUWN+1WwCA37zZpM5y6AJMAbuN81sEU5ZiIaak4iAeHe?=
 =?us-ascii?Q?U7WzrJaSNlo9mp2FTPjnybGx58DLcrQ74rCHF27mtQSWkO1w2mnlCNxv0YXg?=
 =?us-ascii?Q?i+YmSDxL4/gY3i7F6J3cN77hVHWkUmFO5gfneb94O1GIdhofKAvd1Rzdnoyw?=
 =?us-ascii?Q?U1hrEztf0H2vNog1mPPIdUIa53Qb2VnvxLf3Ylkuu2spXzAKu7qfoLGcUdDF?=
 =?us-ascii?Q?+iYblZUy+JG6dQmFulUe4mXPpfeM+qSxiR1u+70GRGFcINVI5qpQzepTdYyC?=
 =?us-ascii?Q?qW3rmdbK3KdcEvmflPa9R+BoWcWSeyWHIoHIIROE6ro1qsaBy3ztBbFVXEr3?=
 =?us-ascii?Q?9xvoAUK7Rr20RtpdjQnbPr1DKgMenItIz+KldUZhz1RObkEmyQDLg2hlQZsq?=
 =?us-ascii?Q?ZG+yd1gYER04Ri9/1KR3oCHSJSoEPI6pTFGQtpVGo7CDjLwsF6/SwzHJH9ST?=
 =?us-ascii?Q?9HbuqEgZMAkmfV1wGd7461cUXhMGAzHYJ6kEORxCTXGT7q76iQ0ghtkuFOP3?=
 =?us-ascii?Q?8ZhqU3VWADOLDPLV6ig4Gd6K6SDvHrccVFmiyaN/MJHfWn3Y/n50YI/j4Xvi?=
 =?us-ascii?Q?p1QbrXN21mOhBgrvwbtOnd4obaFdnkFi4/jcY/VQrtIfR98ompjURS4MzGZM?=
 =?us-ascii?Q?dBQ3cbftmX7Q0yqt2gGsbr3HMgoi7cftQ1PRLwyI8Zi5szhyKf0RoQIS+Wsh?=
 =?us-ascii?Q?Pw0xc9LFb+6ADui+935C//RCtAq6fHbKHMRKYOSY+uOYnND4cSG1AAXOWC/J?=
 =?us-ascii?Q?ioKgAEfbZp9s1GLO8gD4oTFnZawXvunzwMAavv8/JwZbYjdKMviY7FDBhR3i?=
 =?us-ascii?Q?1G+b0om7LZh1Bpzt2GPmmOGKjWmucSvoTzSsPGyTZ0Ayhrq5Tflg5dtHvxSk?=
 =?us-ascii?Q?p60B0GbJptjCSdyLx+p5T5kAAda6Aueb26QYZb9Sn73YqGPEfjDY8eNr+GXH?=
 =?us-ascii?Q?6uEh3rBpEMwjN/kZ4YA4pJS2Ns0VXMDN/fcPUxhR6bXp6Pl0pxMF1wcGQxwP?=
 =?us-ascii?Q?4qz9dX8ShzTAnB90bA4J5kbD5Z2FDyJvByGx9Ye2L5vdPy6/Dg4E0CH83+gH?=
 =?us-ascii?Q?Jokt9aZXzPv7zT01Gz4J9hSm8Es2IXc7hVOwZuYc6LLef0NSLbZny2Xh8QqW?=
 =?us-ascii?Q?5lOCKB7dP3FWu62kgYAy/JzK2pb/DJmLWYLVEqOdCRFYu7HrUwd58NL8hDmX?=
 =?us-ascii?Q?sGdwsixbcE3eEIq1AFaYteemW8sl0LcrphpJBxnAJZ1fY+xZxkkqBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b5V6zq8SE266NPDAhKmBLohvZNegxSNE+A4h7Y70iK7j0Y+RX7pcM135AIzm?=
 =?us-ascii?Q?tv7xNHwsqWMdeucDX0e5CigKaeqPlvxHot1XC4Ug4QjoJrWsrz5a/ji4XPYe?=
 =?us-ascii?Q?utuE3/gsTJv8xHA3bFnBYzWdrJdUv4zjbcUMK1g4Gc5FhFd7BbeC4AUKi2/3?=
 =?us-ascii?Q?X/WrTOuRfOvGa8d5gi5LHj7qG3axamVwu1V++mNRPgHc7heGLQFiU59vFBT1?=
 =?us-ascii?Q?v1CMPKY0tZTbU3aIzgOmD+6mMOnB4QiXilXUSeDJ1d51cO+rVZL2BjGNSEEO?=
 =?us-ascii?Q?fvY68QFxZ633BM0srNsvgKH1mTnDSpjpJpix3AIp4ByooGZAS456/oNPoIdr?=
 =?us-ascii?Q?KebKQBZWHGgr9Nz1tzaNahNKDxJITorOWzDQHY6vaLUPdIe+gRCUy2/I4OfX?=
 =?us-ascii?Q?k3lwNWFzc5I/nXgCIGw2+ubMcjmzacvMwZUG2aTuDo/tvEOPq+mIWXM6YY5d?=
 =?us-ascii?Q?VLOQY247ow5H7A1qwaQzFf3OsSPY4n+N/o1F85lz0cwVvDXElRa0bUF2HrP4?=
 =?us-ascii?Q?34hXAtD295l6ZDeWAbU4jQmHI4rIKEElch6kE54TCzwfDTy+8XLP0YKZo7jf?=
 =?us-ascii?Q?M720DE9JAwv3Ig6VPyYFCLvkQV+Txl5z6tmj1Y+gjIpXjnzdd8p/Wxuhckwn?=
 =?us-ascii?Q?UQ/LrovALCMVhO6WruKqLL81n5d7aPcUESVoqdO2Jq6HB29Q91UhCoiqjVRs?=
 =?us-ascii?Q?yzPzBjXje63yR32NCtnWlLQ4Vj9cCICaSBF/ijSofiq17jhfAHw44etrEJUL?=
 =?us-ascii?Q?GcraDvMdbaixXa2xcOqdvUA3hpf3K2GnjhuSlvVy0hU3Mpvsy+yzUQWaovSt?=
 =?us-ascii?Q?YcI0l/CH2TkVSDIU6zIOGWwhEu+OY5bfazttaW+aCG5DWYXZ0h9PA6/7vd5y?=
 =?us-ascii?Q?HYJY46we4+pqUFuxR28IIBFssMmI46VaGKtQLJA98+Ob7LklCRAQJcU0myT/?=
 =?us-ascii?Q?+rA/PCu5ednEbkoOBRFdl5rCBiLjpnrqbkzbUh45+rfYfS9RhW0fpwXc+awV?=
 =?us-ascii?Q?NVIfBWIzqKory+lQptVGoVs8qMkU8jQIOECEcsq4pI5bGkmTxjCzQZsI2cat?=
 =?us-ascii?Q?N8wEg0xuVKtDeSMSGdysjJJ0pKO5shYPlM+I7KEPRE2/GlR+tZLv+Q+fgZDY?=
 =?us-ascii?Q?6vqYzdBE6iDehCdI60qoFIoUBzbvNWY2qwYp/eA8tyw1UQsH7YSOgOSYiI4R?=
 =?us-ascii?Q?jVc3S+3BhFVViKGIaoG8cLdIT1ZH00VUNL6jiFX9CW72iaOre57iQMt0IPSs?=
 =?us-ascii?Q?NrhfKCrPgV7kO2WnWZwpjrpDJiS2WByQVeMAnECSwskjQypIxvt1cexnxycw?=
 =?us-ascii?Q?bEjAdKmT7VoWOc5p6IxUZANJEtVOKT79eix5PLR5iutq5u6kO6kDyNLLMedo?=
 =?us-ascii?Q?oYvVCme2biokN+iBTcYYh96F8JCLKMAhHu7+lpNYrGi/wuNhP4UU+rflgmKU?=
 =?us-ascii?Q?l/xXWtXHy4RTYYBY7cum5Ws0TW1B6SE70ndZYj3YIOf1XUvDOQpw3cReiGp1?=
 =?us-ascii?Q?VnC3O6m90NfbpXEGI3dkp8gS663nFtSqP1NV6DLZMGqrwpjROm+3P5nqzy4n?=
 =?us-ascii?Q?P87Ph7auPVI/ObkCIne7BXjZL65pakQVsztn+D+Rd2BsP1OCt4Td4FKrCJ6P?=
 =?us-ascii?Q?sqb/tycC8G7bMiVWkDvOxOw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc418579-6d9e-4714-c43c-08de12c5aee1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 06:22:18.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31Q8tcVsC2M2U3pQfp62pEy2bCmBVRwm+v1uXEMu6ybNXvqa3RyqUJZ6bbioOYutaRbus3iDb26XS/Dvkj2MFOMNLg+paqzddsT+eQjc0Yr3UWakngkO3JIJeN1OJYlN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10774

Add device tree bindings for the Renesas Multifunctional Interface
(MFIS) a mailbox controller.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../mailbox/renesas,mfis-mailbox.yaml         | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml
new file mode 100644
index 0000000000000..b9b6e6d440d79
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/renesas,mfis-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas MFIS (Multifunctional Interface) Mailbox Driver
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+
+description: |
+    The R-Car multifunctional interface (MFIS) provides an interface between
+    the different CPU Cores, such as AP System Core domain and the Realtime
+    Core domain, SCP Core domain and AP System Core domain or Realtime Core
+    domain and AP System Core domain or Realtime Core domain.
+    The MFIS supports the issuing of interrupts for each CPU core domain.
+
+properties:
+  compatible:
+    const: renesas,mfis-mbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: the irq line
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mailbox: mfis_mbox@18842000  {
+        compatible = "renesas,mfis-mbox";
+        reg = <0x18842000 0x8>;
+        interrupts = <GIC_SPI 4362 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0


