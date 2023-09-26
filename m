Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884867AE497
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 06:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjIZEhL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 00:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjIZEhK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 00:37:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8879297
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 21:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2NYotFRReHATLbxO9kIug+izk3Z/S7VnyuzxfXE9uXvpICmS/OLK73NNhC1W+UIDW9PKhphqK3QxIWM7CHLcyLQQH9OSid1kW6DlzMCQmfB7J6jQkEsJf8HW1SvJ75iCefZ14VKWEjojnBDY++zkLEuSx88qIrnoKyqnYWNQh2y04CDmBcWDY5LioQIzi7BBVuaksbvoXpz36KE9zBNLv5e+5KIrOcQGzh6GzsZzjOnip1H9ANtWoV3MDw+wcaO+tXf5JA8P5aZyxb8hsl/JqLOcY4APT7i1Sk0Ix7YI5iuEuooqil9x71SWjBG36+UvYmQCdiQxlKwPZm+CbDAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY+tN1y+K0g2Wba0W+IZ3oeWPCZDQa6zhHeGD90MtsE=;
 b=MiUClb3uWGs9itD/bVPE8ASoNUEprdodpxX6GOuALNeRq2OoWhMa/B36GdioZyM/khMcBlRDzwKeoy2YvH25gwpDZRBCi7K1PRIIbdpB4ytXM6aqxhBwnIMxxL730jOers0ruk0IOnOd9YoDpU3f5gopP0NoAbzOFbdh+a+GDriFeOS6JD3rpK5NvhRgRav+LsbH91CpcEqGdiQyvHBoq295VW0AJo/kq9LRCBq8SVmJg4sku0O7ZmdCxsJ9rqbFMQR0vPCJIKjNB4Dev/QU+bIOpAmxNkaHNnPP20dJ0hnwIGQeTChs9xJEQlSk7SICtzMozJDe+vE+qaPJqLYu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY+tN1y+K0g2Wba0W+IZ3oeWPCZDQa6zhHeGD90MtsE=;
 b=b0g//S3KJ7KIafSLgrYZ1nnZ0edzPLOq0MWfFFGtFCk2dXIxxB0uIsy1bQUJ92JGBql5lTFSYxCBbMFLeN5SEXm1clHx8k4X5Ck102Nw9qLNGYYrsWUoST6UV9dC/do5yssW+y5e6eukiwiasOZIOyiKIy478+mshQ3ta/tZfuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYVPR01MB11247.jpnprd01.prod.outlook.com (2603:1096:400:364::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 04:37:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 04:37:00 +0000
Date:   Tue, 26 Sep 2023 13:36:59 +0900
Message-ID: <87o7hpim8k.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
In-Reply-To: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYVPR01MB11247:EE_
X-MS-Office365-Filtering-Correlation-Id: 38666c3e-6b2f-4104-313e-08dbbe4a3961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /aRcHbmXOBZDrB1QZWu93mqCXdkzNETcjYR2R6Ur7NecIYrxOQlsFZ1O8mlBd2EcnWB75R8XaQU0SSdYsq90wIMNKu/bvRVxToC2cui65t/Fv4dWweNefqDiLxvy7I0MA9KDfc28tYTrk/qgD/XHAZuxDyuvstWarx93XZhhbQm5rAwY5VlwB7w0Avb5CkO94K7tXKbT0JuLCqo9KdJcYCFiZTnCVzUsYPJkUPdz4HXAGZW5VobBHysyB1slTO2xqUYARYohR2PcLMR8iwzJW+nPFZkd2UqCf2BTyH4e9jsxm5EMY9Rn3wTw85HbsJIrtDQ8bPJfUjpJiZw7ejrnE2M8u8wGL6BAGZYjgi0meHHfQsmCeU4sul54FsByVgmCSmAC42ctX4zNgVx/xCG569GCtDhrOzdE7NnMSRhWjWAEUQEb75z0AWVIxSQI4P714xDm4FvEYasuaY8QYKyAFkMRdq8YnpPwt/VOeaS4XEh1bgeM8ZwBnq9bTSS4fxPyNpMF2MsSWgSprogqqBoonXiLlANlZN4hy2zmcfcfDshXmuUfwgBIoGHo2R1gNlrsIYwmtkWC4vo5zCIVBseyam3Sy6Ph6BfE6/xHqZ37aQD2zjRph+WLoygC6gIIQAqp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(86362001)(107886003)(66946007)(66556008)(66476007)(6486002)(478600001)(38100700002)(38350700002)(54906003)(2906002)(4744005)(5660300002)(8676002)(36756003)(8936002)(2616005)(4326008)(316002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vb74Oknmu2iLv99KJ7kWPSgcZCnx9mjk99OkXdvdy6NcF0ri07eqs+MhuPO1?=
 =?us-ascii?Q?Hx+6YynmEjoncy9VPZcf63Wgb7v0Ee/blmX32SiaBXrwYS2ouSjA/Q4+Dg7j?=
 =?us-ascii?Q?uB5R2JVdwWgnRrj7pSjysYBUlTi7sJe74Ldjlsr+SI4T55STTV89ITo9dvDa?=
 =?us-ascii?Q?6wCHee4W9CpMCzNrbgC3wqnbhOudFLlmLLPW6HAo5m6TWIL+oCQgpnim2w06?=
 =?us-ascii?Q?OE6NEttElRGjkikxoDGZETJNI7svuqdeeFBf9X3bc4IYN0qf3h2ZDmabaEen?=
 =?us-ascii?Q?/F9UgqG4tkzZKiD/WjXO/RmmXcptibvIuPFbb1p3jBdKyolK2tYrTAMzmk1b?=
 =?us-ascii?Q?n4YOdy2jbA0pPyMPOd+D6t+X3ncRGuhACS/b+bsgw1KpWYIShtCgCL/ubGyy?=
 =?us-ascii?Q?OzWB5kiJR2FUdpaGqHEnwkxJbUJAhlTfYVDDJXtFFbeHsllHcCi5L+FtezjK?=
 =?us-ascii?Q?mOguDxGenRA3C6rI1HBs2Ob057ommCSn3Y9n+Cvcw8tBHm7bjwARQeAPOAqw?=
 =?us-ascii?Q?RieyL2otEXx351cpXqyEhSLn3KkJDhi3dpH3goqhmwfoU+A7WWvjhZL9OMZu?=
 =?us-ascii?Q?Tu/Snm77HNtk3WKUECj0qdonW8iBuhTEyKK81uAz+1S7qnpqPT0jlkKixZ+w?=
 =?us-ascii?Q?tz4hfen7AMs5SVR3y41mka7KIfDrjW5MCbGCMy25onDH0QjBNsJtJsCwu11E?=
 =?us-ascii?Q?8nvcq6r2qd2bDZ4xC6WUrZUctiHuytkoAvyWIEb7DxPVeUV/NVo1MzKt8NO6?=
 =?us-ascii?Q?/h2BwWptBl4ROZxKDYkzvXjbF+dLKbo/Ozcd4ie0Myi3yMQqNuXmYe2yPzKH?=
 =?us-ascii?Q?4Ip6NwbKWAt7Jz9X1hYGoS3qqcXWf3zASaVA6+iIEYB6SlgEJ+V91q6otuTz?=
 =?us-ascii?Q?wzBhQlzVBVaI+hQ0eBu2MYEVwUfdVhDGNM5E1pqYXPxRH98H2ZUmHabbalp2?=
 =?us-ascii?Q?AwlVvbYSFSHfLsJ3DnRl+4qXcmjTcKMWoadoc4Zupij1Dh9wH0DurYKacD8X?=
 =?us-ascii?Q?wwOAEqAvWQYtcEEICYGPuXaQSxdIu+b+f7RSAEev0yYWqzQfZ5rhZ6X/xTkb?=
 =?us-ascii?Q?Kv9pFgRIL930yFxAlgSC6lcScutcad3YXTMl7ZTExRD5Am2QuBnvccP+4z8U?=
 =?us-ascii?Q?I/jaImdhwg4hvy3pwm9s9gydU8O7red2y2LmTuG525teI5I6TgYIU+PE1+OH?=
 =?us-ascii?Q?M3L6qfvaQNtYsZaM2Zs6SyYxFDG9H7hdlCyiX9AOFA/q/wADx56RUB4saiho?=
 =?us-ascii?Q?ChP441wTqh2Pvqwz9Cqd/OFTIOO82hd3dV3mL6dektX5BP/EhHdN/YRRFxdN?=
 =?us-ascii?Q?cu12HF3Jtlj4ngCOYushVOkgmXfW0W4h+8uGaDtlTBAqqCxisC2cYsk1N5O5?=
 =?us-ascii?Q?JVF6abkY95pcdYQ/B4t5kreagP1OnqJsOsKT+RONDuo32ZZNp2GUEvPsQJ5E?=
 =?us-ascii?Q?+brx/BUsiKWBUKPUwqNmyNHqloBDKxnXpBdivkQfhzEMT0LiU2TKEYfnLB02?=
 =?us-ascii?Q?kZNyCl8/d+dNG0FKiH+heGG82cyimefRMvKFH53TlxN7tcLY0FXRoShV/qy+?=
 =?us-ascii?Q?o+75U+0oeuJt5kZGXGosRzr5jgyf0KCvtrx9R7ptOJ0k3mVAl+UF10LBPk5x?=
 =?us-ascii?Q?e0FxAS6yiEPCHF7QgB9hY8k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38666c3e-6b2f-4104-313e-08dbbe4a3961
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 04:37:00.3917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKCtQJ0DdJ0aY2S72LU8Iimj6YK+sw3Zfl0uuvp6XKPmals1waq266gwHH8uDgcU2Tz7zve0NLPOiNac4vJ6tB7ckjOzh36+9/awPvGJQ0DWRK9PVP69ATc+RI7jyB5Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11247
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the Interrupt Controller for External Devices
(INT-EX) in the Renesas R-Car S4 (R8A779F0) SoC.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
index 95033cb514fb..b1f3e7d7b88c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -37,6 +37,7 @@ properties:
           - renesas,intc-ex-r8a77990    # R-Car E3
           - renesas,intc-ex-r8a77995    # R-Car D3
           - renesas,intc-ex-r8a779a0    # R-Car V3U
+          - renesas,intc-ex-r8a779f0    # R-Car S4
           - renesas,intc-ex-r8a779g0    # R-Car V4H
       - const: renesas,irqc
 
-- 
2.25.1

