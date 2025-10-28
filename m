Return-Path: <linux-renesas-soc+bounces-23717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6A1C12DD5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 05:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19B144E16E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 04:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9448D3AC39;
	Tue, 28 Oct 2025 04:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NFoTjRrq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75899D271;
	Tue, 28 Oct 2025 04:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761626006; cv=fail; b=E+YCXpk82aVztIC1g8aVtSbut9UXxcSfVXIsXD5GN2Q4yJPWsfXd2bJWTZN1F+BsjYjDZ3g0HhxaEnurF8DzmHVExQW/h2PXwN6M9+WngF/ibdfnluDLxL51zR+pe4aWNa+7/CQgO1GZUl6GCRoqn1tvwcOwWjoMNdV6emq/4gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761626006; c=relaxed/simple;
	bh=9NRzIsi2IT/eP4wXrny+Rh5cy7KYqA0sfzdcZA6EU/g=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ON2htizAddjFuK0IqgrVeqEvQbuiIIA4a4wZXdmdHAxyh7b+m2OQJnONS9Pir1gLxq7H5Fwy453ENf4UuesYLhOu9Q38cLUCwtYkfU4c+izu3jUwd9CyqVYTgdJANeuCHnOdLPisrGl+h2StXctjEOt5upHRYNpv5xCno3NW/0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NFoTjRrq; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJ1mQ8CZGhK1A551IRi9tqJnCXEmnF5wHkw7PuA+H6r5e/KBph5UZggly7Z10u07zDK4GLD31MA8uxAuSYkmdqAQuNxZtNV3vx6McYG0yDip6ou/gXlM1J9NcyvnQ9Ui78DQ3E8WsE2LMhS43pNX8FibCafEgkn9jqGf+XbBB6VotnglLl2pvrCNql2HyAKC+hg0aN1JSHrDPSmdz18iYKvWwRN5J3DuMfqYs7s+QP6S0/Q95G45AxsAb4OIOIWFEbNTMOceSqMvUf6a/PsHQfy9SwKiUqS6Ufi+bkFQxXmBukxYlFWuybMYDkAYpGRVCj6dfLnODWGY8wkSSavFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdGR5cVhBkw6+YmBSR/ivG6DnfGfrejnEPqudCwyElk=;
 b=KNsLvJ06OBaB77pKwAH3RAWwad9J4wdLxTScW0+FUuH0bZRPXNOw/o2JnPp3Sr4MCgTrwxidbUexeyP+dHgxUxQUt84YKrI6ABRIxSjJF/osiNkx590e3ctE7VWs/CUscvpFw0TL2M2jQgZyeIQZg5KmCqRFqKIvfZLP2jpsvw/IvUvawOPktGYzbCIUvuAWCm/VFOLgOF1MNRlTgQZ60QzjVGOqKCnKFGx+zN6MhoKuugTOqNk1xdQj66C0s4avRZ/RCkFBwUDlsA89U0nP1OJaDmv2v8O9jg9W0zBiC6kz/u/Scaxb0VKOJLHaCo7YXzVoYf/hruD+Cue1HEbbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdGR5cVhBkw6+YmBSR/ivG6DnfGfrejnEPqudCwyElk=;
 b=NFoTjRrqr4cpShIYesenYmbrxZ+DZ2g9vvKTxLxfSd2rvEoaijXhL7H5Kz4rBCo24SFkRudz+p4Z5D4xZWZVh+X0DNw7cGIvLPu/E0ONJPu6gLaZxTp3LNsj8BozSLWXcUjDSQKtXxmM4DqKaOFi33L3BOuC+vD9Mef8tCVMQoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13679.jpnprd01.prod.outlook.com
 (2603:1096:604:380::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 04:33:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 04:33:22 +0000
Message-ID: <87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 04:33:21 +0000
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13679:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e18025-728a-49b8-b8f9-08de15db205c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RzhXamDgc3llCjoH87hQ9TkdlZ1DDOAsJWw9iWOGcmIKmpdoYyTwi7GmJnK2?=
 =?us-ascii?Q?oQH8l3AivC13HDjaCRCQmSUmiqg29UvPyQCz5BPza80oBPwutELyq3oh/6TD?=
 =?us-ascii?Q?P42AeaxTR6uzf7EsbG2ntrxRdxROlCKUkKx+m70t0nF7wEAPmVAMWrPz4HDC?=
 =?us-ascii?Q?K2AnqqlQL4oKC8WaVfIoOu7A7Mlg9cOTVHDqp9FchX2eaOnGB0uMGT25Pv8t?=
 =?us-ascii?Q?/YLCOmzRIUOio1Nwvg1kgACF0i8PytZ7nVwyBBo9Vj1Pa1qAb3BMNGOTex0B?=
 =?us-ascii?Q?bvB+e99KBQ+LCCsNnMbIlzSuMY3eMEVSliGEvnGoJkBmqFVawNQCxJl2OyRv?=
 =?us-ascii?Q?Ne2Tnjm1gV6b/pJqqmoqzjRGzieSHtYwU+ADqIIx4i+WnvAbTpojZycAck2O?=
 =?us-ascii?Q?7YFsqvsEG49zJASg6sIJPsLMwbgXk+0xdZ0HN4kEnQUWWFbONXaEjR2mWvWT?=
 =?us-ascii?Q?KIRxlHVUWsCe88Veo7UG1nR/PRbUkb/XjnJWMKUiDfqkRUMRTKnSyWev0HlV?=
 =?us-ascii?Q?m9cZNAmIZitpLH7ILs0GX1XTRcD+SXul6AmXyfWdBh2V/4azwoQcnWVqplsg?=
 =?us-ascii?Q?9pLDvo9YwBWye2CiM4ys8At6HTkLFg2CGt/AE5n/4u/XS4zjo8arUlCiVIZS?=
 =?us-ascii?Q?yjceBUPPbSVqLQ3hRkgWg6DegyYXlk+UhvZA7uopXNduNE+9zcEEAQac+gda?=
 =?us-ascii?Q?cVDifFNj+c+bJep4HB+d8T6q2xooREJH/aX7egJKB1sMawxKkX8xxEizzfrI?=
 =?us-ascii?Q?lB2i9BVZCP+j0x6V3EKaIFA1hlEZ667cURvzDGrWtwNp182EGNQsp0k2VIny?=
 =?us-ascii?Q?BsIQJjjuL2zUFuvEJqZGpA5+RkOb+XBYD+guQmXllA55TQFgAMYnmOzuJ9jG?=
 =?us-ascii?Q?sq/GgxZ+M4mV2uIySqIyOgyvAGEXCTNrEiSAjxThpb4KNrXGvCQLKswVAjvI?=
 =?us-ascii?Q?RPKfZLdykCsRnz9oG4ucO5HmSyMEn6dwb75UF4I97LbDCHGPMM0cRfOzEioM?=
 =?us-ascii?Q?M1vQ9/h/ISDv7KTAbZmvzBQQSZhwX224+w5Zjd6Re6rhoycvnpLJnUD9a2fN?=
 =?us-ascii?Q?woftt38H0iUVw5lo5acQoIMwmRZ3Sbtwlay3FfNLjlRB4Psgw3xv8Et4YnYd?=
 =?us-ascii?Q?l88mtMHfeRUd1/WHa0CgOUMxPDVVtfj7jhkdgLDLbqFP/jKEyL+GtDfIYN/O?=
 =?us-ascii?Q?9icUori3b7Nm6J0d+zDm4+8bbeN15Zsg9J3oFY8HcrcJIvpBwLo036A8u4J9?=
 =?us-ascii?Q?r5OSn5rmKWalxO+cz8gWXm2/xbLl/WBjW8sAQR++kvSW0GaSXmOhShQiuFOC?=
 =?us-ascii?Q?9uU4msWknT6WBfWTg2bimIyyVuB/+9oh84AG+HqCixhttiJUA8PoQkhwf1et?=
 =?us-ascii?Q?8LwRxxzUMFTeE0qyo4EuSLGBxOZPZZZL2Xqo7/sJ5oEwai7+ueWr4Kak0/6B?=
 =?us-ascii?Q?eWOTYtpGrNEi60I5hmyW/l7dO5NKxHgXijMxVyPBmHt676iSn6/Vgg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S9ox/C5Ts3T5mOS9Jr2JmcV/oLiyrz4OIgpkyp+7i/a/Zh3QjnLqxrKF7IHW?=
 =?us-ascii?Q?2fuQLBFTH4J6LRaYo+j/1NTMnORdxxBnaWbqNDTkrj5FVKJIabDntb/9KYSL?=
 =?us-ascii?Q?KPo9m4j+Nfb7QdW44mRMiSR3rb0oZPYfPgWJiN0lwGtqmc/efJnbpmW7tvyP?=
 =?us-ascii?Q?qCfQZvHJOLKMYCcAXhWtzmpVB0fFMnI3Fs644K8iis5tW3b7D1zIyelFQs8o?=
 =?us-ascii?Q?1wJiai1jNyU5YPLl1CF11JWULNoK2hiLrPn3mKX/gUDl68UDjhADANE9fS8O?=
 =?us-ascii?Q?8UE6s6hDQdQRtAUJ0inwMqnuN0Z9FaRkKm3Q2PTzLFxBe2ESUfnHy8gyZCPN?=
 =?us-ascii?Q?xpfLBMoGEXh+aX4tK69IvEvmVv4witLcV+Kc45zf4ZpSpvd2HF7AMsK1YPd5?=
 =?us-ascii?Q?JxMn8cJerCMNNF8vGxE4CyYe65M8BoYnzK6Cw+ptKbhoqpQ2yWGBP/6OQQtJ?=
 =?us-ascii?Q?hfc+0bOB/ZeXm0qXPtfIYkzc7TcqoykivDH4gUO7H2KB5Rj5D5KgKZlN7XcK?=
 =?us-ascii?Q?OlYEcvucd5bwT+tJVf16gCSpGy7t8291Hvt0LwRyG1ZHJYCt2edBcBFa21SH?=
 =?us-ascii?Q?AubaPjrEOnWmBOKfS4ts5kKKlfthqazD/9LqzK95A0zd3Li/B97/FVIjUGG6?=
 =?us-ascii?Q?iOQ+h0fcSEn+27diwryWLPgtd1rqXIk0m/JxYUkx7Rgv2r+ZaaC1dcBLnKmo?=
 =?us-ascii?Q?+8LILkI/148pNsvMjXW4Txrmg6JR59GzzPM7QABDb62zWTfbWqA4UNq9rEOd?=
 =?us-ascii?Q?3TxeD5ahoSbsi0UE4eqwxwVL1Itd6mi3yPzG8iuKMD+ootembQvXcn8pRN06?=
 =?us-ascii?Q?qfJ8Vp0absSktEY5uVWfNq7EzeBCgEkQJgBV1cb8rwpyf51kKU4Y5taYnEcx?=
 =?us-ascii?Q?QY/HAai+O63PyULWy6ix2VZMZXj38G+45cqeqsH9GHKqHSoZzMK5xbKMJQ6X?=
 =?us-ascii?Q?ElXacIe1tn0Y1jQiOUi1kM9VOPXJjUgZz+LU8FTg83Cw19GqSNgPmwIZOmli?=
 =?us-ascii?Q?JXbjdPm7B0hPIuh8IVDSkWG2VJJfYgJUmNjzay7I9pqjei/1tNGAroclNpYA?=
 =?us-ascii?Q?9nD+jSzfavi0VTUgtG2KYbJDsovXuMgrWnKgxsL1JM2bpUC62g3XqtID5cwc?=
 =?us-ascii?Q?8hfcyB3igTGZuR76v7tBgq2aqCrl2WNhZdI0YgeFOYP5y1VGnwUBFjzT4H1W?=
 =?us-ascii?Q?sifg0MOtoXCiyWvUMQo9J7f2sQxpkNapdcUNRN1tnADbEaV39xTHOKSSqj/t?=
 =?us-ascii?Q?ikE/txrau3MhKks1fRZgaQr7dnTeK/oaXBouTD9+aolgkQoSPVKjJm8fP64B?=
 =?us-ascii?Q?oWHtezi6bAdEyLLe/qaAc09ftSLNTOZk+ArCj14pHP/cxTabNr3ffg31R0Bc?=
 =?us-ascii?Q?QRV8GKEV+45dM6M8QYNDCnDk/JGxjYZXrgiJeW+4XgfvsVr+iBwOkmDo+h4L?=
 =?us-ascii?Q?RFPcwEJyDPLJDfKiqmuPzvOPppCMS8vimQRFONpkXljtkl32EDhW+fG50hNL?=
 =?us-ascii?Q?VgXYuo+zHLdTU4ij0c2lTTSSeveiiwuLSjhUi3w6G/uLa2OX73RfCz5CSYf3?=
 =?us-ascii?Q?zdxvkUz8dvE19zmkJZe/+vc3CwxOeyhIsiExSZbGaeR9m1o4gn9QHGHfpQRu?=
 =?us-ascii?Q?uQF+aZokKTEZSJ0lA1U45K0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e18025-728a-49b8-b8f9-08de15db205c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 04:33:21.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/pwglbEpewtUfvscX91VinMpmlIC0gA6LYOZbqz9PsVxyxUwPdHw442yIjqUFW9T4v5JddOgoc+zxz7mkJdAq/GO+nn7xKOtFwFA1lAmZ1A8rDZt7aAvAxqRfMUh8Nz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13679

Add device tree bindings for the Renesas Multifunctional Inferface
(MFIS) a mailbox controller.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/mailbox/rcar,mfis-mailbox.yaml   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml
new file mode 100644
index 0000000000000..8f5f3a5ea717d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/rcar,mfis-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas MFIS (Multifunctional Inferface) Mailbox controller
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+
+description:
+  The R-Car multifunctional interface (MFIS) provides an interface between
+  the different CPU Cores, such as AP System Core domain and the Realtime
+  Core domain, SCP Core domain and AP System Core domain or Realtime Core
+  domain and AP System Core domain or Realtime Core domain.
+  The MFIS supports the issuing of interrupts for each CPU core domain.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - rcar,mfis-mailbox-r8a78000   # R-Car X5H
+      - const: rcar,mfis-mailbox-gen5    # R-Car Gen5
+
+  reg:
+    maxItems: 1
+
+  interrupts:
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
+    mailbox@18842000  {
+        compatible = "rcar,mfis-mailbox-r8a78000", "rcar,mfis-mailbox-gen5";
+        reg = <0x18842000 0x8>;
+        interrupts = <GIC_SPI 4362 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0


