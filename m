Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7D37B4B41
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 07:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235449AbjJBF4D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 01:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjJBF4D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 01:56:03 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B4CC4
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 22:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfJBwqUZQ3k3rPsEVCGnT6MuGwOuw3mIBR1VH5mpQMrkjiYe3dlHGgaGKoftX0LpEEa6E3wH3ywprLeMQto0XN5sn3F8v9Wzd0EwlDVfVLKRJpGVkv1ZhDZKxX9CLMyYChJY/psH5lCUApXei3G82LSHp4tI/TRwGZ4JfkAMG2RRJvG1wfUxCDvYuW0fzSwTlXhX6beId/PBSEzianG9awpYEop1+0XwDuKnwCuORLcGBK1H4j3YHg46+gad0bT3m+gAuT4ASK575JAFW900eOloE9yO6Y92oJyhxq1TuJ22hmnkLuWAFuoTNycZ7qgRoaqTtdLMpRUOzGeJWG2P9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73SNoQ3FwxuEb5Uo6xYfKb4HXSd1egYsKywvJzUbo1g=;
 b=hJDcT9Q9TEp72VrRlTyeBPgXqQ5c7h0RpAYshba2bGfSHnfXixD1nEyybfgZNTxZNA36rok4Ws4wbV1XtGwukWfn8EQwUjfbGnNWG4rMwTGyn3u5dxJF6xYVN2/RqGlvUom/zhfAWqphZL+uwZRrMMNOS8zqcRFRxV6Z4RyETmPcD49pgjlEfSuZnRsqLvbFHru4ICb5U8CYhnq06HXLI5nRD0cVMpQOB01rgqh90idiBsJyvEpV6wFkvApvLK+4T1yIISxGt0u9HwDcpTLYXaqI7+HHx3JVyfnAih8Fs03nXcUc6tBhLHFWJMEu+S16wIlC/IwJ9b9PCBxRiJ8+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73SNoQ3FwxuEb5Uo6xYfKb4HXSd1egYsKywvJzUbo1g=;
 b=HksJWfqDX6INYOzm5s+nHapaFWUCKrdBSq7KnIFTkw7IMtOC3jzVN1ECdh2h+keQgpb/cMwb+n77RyPmi2s/Ggalksstv0+f2424P1WTHNgjofPHWpJwoLAGfI9rFeQz1847K3UmjLjR19EFELjIdsW73gwPoMDH0ZAo9nqjwWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6307.jpnprd01.prod.outlook.com (2603:1096:604:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 05:55:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 05:55:56 +0000
Message-ID: <87cyxxeff8.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/4] dt-bindings: soc: renesas: renesas.yaml: Add renesas,s4sk compatible
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
In-Reply-To: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 2 Oct 2023 05:55:55 +0000
X-ClientProxiedBy: TY2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:404:f6::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: f312eb4b-b66f-4047-5b4f-08dbc30c3ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wXosrPlU06pWqHFa8toSP0EeKGm/oA9z7nhgIjKE8cib2BlBzF2/WlT4D6/330PErQDPTmv7J7+nFGjPOECKLVsC0wVZqn6ELqMJBqrgr6xkDom+iz+P6HglMYBWgl1i2qdpBBIrrU8cghchuZTyaGp3mxTJfw+M1dpO0cdWh9DAffgGWKhoa2sq8LQBaWuDn7Qzs2/wXz66i2HVxshDxKQOf+JArF3hMNDafh2GK2Ry9ymjNXQxLpeUtFM1I9BDvLuveTMBWtq1Ul/VqOVl4tpj/uevtg+BodQDn0e69ud0zf+ayHFUgoE4wd3TRP2B6oUfHSDBJQwnVLh76xnkWIjhCTk2OCsVt965sQqrW9K0TFMJIvIZYDNraEjJLZIqvyFJv8ovOTLlvd5vttNzWbdtJlwmVdzCDdlekGzM3tVyBs8F4/8yVUxoaUtOG+LJpuqPOwmvp5uwKva49ykVU4BJCL9UPacTq3p9QKZITIyzBlYbBp7s4+00SIIidZTRkCSoV9Ij8xBlT+EYsoOxEf4alOR2xOHM2+rIdcHEpc4KE4IUKzbjHxyouJa+TFUJuZ0+fhRRmP0H62SRv1pn0mmpXkDtNAc1nuaIIYuXfxzQpmAsvWczmtrqTsPeG11
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(107886003)(478600001)(4744005)(2906002)(2616005)(316002)(66476007)(66556008)(26005)(66946007)(41300700001)(38100700002)(38350700002)(86362001)(5660300002)(6512007)(8676002)(4326008)(8936002)(6506007)(52116002)(36756003)(54906003)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zP4eYYL3IJDnut0Tx4ANRKDygKEE3YUr+3gqeD3h8EChF3wQ8mpn7Mv67Fvk?=
 =?us-ascii?Q?YaADkfK20jKvgY5tG6rhtpycJ27s7Vb7Vf24WavDh7SKUv9TUdXyhojwMX+0?=
 =?us-ascii?Q?FSKx8d9oTnxonCNpdBmpXliemlY9FEhGuj0pEgsmjWo/VEmsdjBoH0VbwIPV?=
 =?us-ascii?Q?ahz7GCNU4Wrur/m2vWXv/nCjddtVbMdmxH5kwl69wxlAVZEgqzI8FAFBAGo2?=
 =?us-ascii?Q?CVy/+UoXwi/XZH9XyrYtFT019NQHfVvXOYqLINZrMsCqYEu8v/rLI+L8pEon?=
 =?us-ascii?Q?aKhbm8w0enDi+Pbi6wn62vAQ8pQGmZ/ZaQ4fdfmTg0d+PdFgEfkxdx6A1SZV?=
 =?us-ascii?Q?JuFVVAggpJpGScPOqB0DLlVf2lnwIl40t+YQExsHv3TTybBuKIIkwz9/PfhF?=
 =?us-ascii?Q?Sw5MHtBQIoLWzqMm++QNUm6OjLv+9UPzRmvH8Y33vnUjKeI171qLxETGXuOK?=
 =?us-ascii?Q?Pluv/cROIwbCk/Apj3qzNalY5iCAkiD+IecIYKH1O3mCLkUuPoO4qmlhSZrz?=
 =?us-ascii?Q?VxR5JkVAkDuWwhpnvlwK89ai2VyhkC45++AWN/WnPF7sL8LryaJQ8jBe9NO8?=
 =?us-ascii?Q?9tn2C0j1Q42yU8QjvZpxDDBSsFL9Aur2m2Uh/mjUI/W9tQ9kLnBlkv0AvbHe?=
 =?us-ascii?Q?l6zGQnkpCrDJFaHwJBKUxaekD1XQGAifDVjTrvxkxr5TIB8G0vw7VyyY6hbv?=
 =?us-ascii?Q?d0Syj81Cuk7y7p1KytkX7PLJNk/+h0GA4iJComlx9w2FgWHr/yASgww8vZZS?=
 =?us-ascii?Q?KSAHi2PXS0JijyO8xi3lFEPRznkyAEVjEwKpasoqCyphIGYw4lKMP1SCyjB+?=
 =?us-ascii?Q?0OXLF2j0Wmcfsvc9Is5qs7qWgCGRtu0yS/Qnk34sAEwVXc6irbuSaF5B6iLj?=
 =?us-ascii?Q?Pno5AJedWrMO2tPguExyHXOW6O4DewZr7jJS76xyDHPePvFU16M8aQtW4L2W?=
 =?us-ascii?Q?Y/6rfiYsLP5AIC/XAfW8h7q09l8HHYqDH6jESmrFT41CA5EIdFaYQZaw1rsS?=
 =?us-ascii?Q?2ReYxlQnZud4p0nyE4x5AEv/kryaedPCoAFion7E4+h8b3IIwgVi/5b8vXP6?=
 =?us-ascii?Q?7D9oFqUNVBuQXJYt9UX97NdHqK5iDHm7SDpD1WcMqBsoM04FnplLK5sUT1di?=
 =?us-ascii?Q?1sOKqabv8QL01XvrWbW8ItJBzZO8Gqr8lW0OnRpHzCa1r2mchswe9vVzg/wZ?=
 =?us-ascii?Q?2/zUxmHsSO9OkGavsha+lutZYTz0fJv+xc4HY6hWescjIFGGUjRmdpFUk3ui?=
 =?us-ascii?Q?ZwGRhh3CWHc2LeHy+YTcOYLP+Xhms661Z3GkcSw/z1Pm819OLIZWdYAyff5m?=
 =?us-ascii?Q?8zTInCzWu8Uxubdm3SEeyid8aesLdDJTkKNCHvoWVeRpXLuxUDMCoOdw+LTu?=
 =?us-ascii?Q?o1bkLzr4hXm8YCgv130VtjkBHxgLJIm3WqWIjxbUWbuK4bolAcS54rQT+unC?=
 =?us-ascii?Q?3ioGhiJMHYqth2Yb+hjKdJtizXzqEFaAGort/MnuJZi7ns157B8aELKejd9Y?=
 =?us-ascii?Q?fJpPoQFGiss0rx46vLW9rUvWqw85mfICZsgmbNZtPdgVkceLSMi4LIS0mWtM?=
 =?us-ascii?Q?C1YgcmruPjjImBpnIhzwCPldHZAlK7RCs1erNtwLgQOtFm33P9blxC7yUuPd?=
 =?us-ascii?Q?cdFq0KBTZNGW70iyyxExjYU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f312eb4b-b66f-4047-5b4f-08dbc30c3ea2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 05:55:56.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2saxMAm1wGUp2CzeV/kcj1bRfOzVXl8y8+tv/+VsHHTinS8LaqGauEtzzAdvGnqTuU9bGv2xudaZBVkBIllHe0UTFJrNURWEX8wTZ1Bh+1osVE4UgwQ9/JYDF+N2EAB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6307
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds "renesas,s4sk" which target the R-Car S4 Starter Kit
board.

Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 53b95f348f8e..b2bdc26e8329 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -335,6 +335,13 @@ properties:
           - const: renesas,spider-cpu
           - const: renesas,r8a779f0
 
+      - description: R-Car S4-8 (R8A779F4)
+        items:
+          - enum:
+              - renesas,s4sk       # R-Car S4 Starter Kit board (Y-ASK-RCAR-S4-1000BASE-T#WS12)
+          - const: renesas,r8a779f4
+          - const: renesas,r8a779f0
+
       - description: R-Car V4H (R8A779G0)
         items:
           - enum:
-- 
2.25.1

