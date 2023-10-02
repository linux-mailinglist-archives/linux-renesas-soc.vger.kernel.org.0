Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAC97B4B40
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 07:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjJBFzp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 01:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235451AbjJBFzp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 01:55:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DA6C6
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 22:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErllsFaVL7iUyhIH8dz8tZ75JI8wg76dzcBHLq1Rixp7U+pDUQ0ecQoCFy7D4+Aui++RBa+pBEccrMPvwG+gGkaUqDLN8tVCWt+59kRaZXy4sqBFVLr37V3X1XyfCSztq5N/auvGkCafCpIoeXsr8/jFGZE29QpTf75pRAU0xSmzzyuDlEgW5BvcFjBJ7j0eVT+iFu8fyna8IW0KomMwphrMOFnpsvvNgX5eafV62IxtYOJ2WayYzz7IHDGySCJqzjoWD0UJlFKlS167qmNnmFzZTx8FZ52YLTRo+q7ysT1hKMnLiTBBU2goMEnsg8CGigGypZ7yXlQin7zRMMQOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuDK5mqWXzDjiU2Vj5gp1+IH+bs4LXiNQRnYK9MlUTc=;
 b=F7qTuGlko4eTLA9pLrqD+bkmSLdBJTCJnLG0wvHP0APMdTLalMNqExHYVVY/ZZcpq10DN9X9/QCuyJVdI6eSLrdjvEa+4+02t5/wXzvTRMlsI/ch3VZvWiRKBg/KOEv+HHQYjGfQI0kXbP9zb9q/u3gGbUBoBs40jU2aH6LPcXOHadFj2afIjrcWsksOPVWZiYMuA5zzvAgo/S9fTP/JYay2hwsFTx/zMGZSfOUoCXOZL6PTVuGNhSNyyHiXHUOiy+S4tNF1NVeGVO1KJZjfJ741NkYcfWyHb6WwV1lGcB+SMrfKI2tCIKZF0qyJciMzXYBVz3VNUOdhPCHAmpfYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuDK5mqWXzDjiU2Vj5gp1+IH+bs4LXiNQRnYK9MlUTc=;
 b=Xtj8E/SVZPQ0r9LJGJdiebOb7+c3ghoxBuRg3diK9vCc7yTNwwbl3KeF42R1UL/5QNMPlWEFJ4o7E8gdeTJOp8HboZeisdhf27H7UnmgPJUXd8y2lYQFdH8iRpgfaiJSLX91meII2TZe02nwFdC2+4Wis61E/UdBgX0SlF4VSHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6307.jpnprd01.prod.outlook.com (2603:1096:604:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 05:55:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 05:55:35 +0000
Message-ID: <87edidefft.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
In-Reply-To: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 2 Oct 2023 05:55:35 +0000
X-ClientProxiedBy: TYXPR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:403:a::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: f7bf9681-c842-4b3d-93d0-08dbc30c323d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYfrR+DGMjVPeQ6HuhbSiD1KDAkdvGzpvQbTkipdZBEP8KLSjdaXkRCMRRFyOgIEgMMdOkA47ZEQqXi5FvDPa7eI2ooYOwM1nrxE2qYcn7s4rkDsgGomexmx6iTLp5R65NNZMyeBSsgJRpx4P8hu5Ri41JajwrRPxD6xS1AIFH+BZAYbnCYwE3MnzyxPpWLpct0y9zyVM2iQxEyTFvbKItlHgRLe2XHcbDo/6OOUyKvapGzFyeQHDCemGRU8UNro31rY36dxwQ2+14SJHN1vPIEPeri6Detp6MOEeXa8K2w47jJUjf0JLG9zMdyONLt3PFnVqSYiqqXG0WE6g7WIhujP0CYTGN+PngS+dl3gkpWcdNd8x6yq6xiGDXMK9EtFv1KirO1A4KNl8odhukCPj+26RwrgitLz1HGl4x6KCAucDzQoLmpyFxPvw4yWM3UOw11O6MxvCq47IXvaxrW19M45vOUeprhQrTyCQbax3daIOXUaK2j+PVdhobypOitDP4OWx3oa9Nph8Ea3NL1w3NSWQRNIolNR2zw1Apq02fIZFbC7/YLMknhOYA+TbfaD4oIzVM438G2QNcsP9lubFdgx51PPHJgCVNGTI8efVxofIAlinjoW0N5ZcMWmtrQs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(107886003)(478600001)(4744005)(2906002)(2616005)(316002)(66476007)(110136005)(66556008)(26005)(66946007)(41300700001)(38100700002)(38350700002)(86362001)(5660300002)(6512007)(8676002)(4326008)(8936002)(6506007)(52116002)(36756003)(54906003)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DGKTVh3Yc+72LCcVXO85wxL5bb/xuuvQCfS1tFsczdbpPVfgedUfyfRutcVG?=
 =?us-ascii?Q?7gxEaomzzz1NlHdjlC3I7HUeX5HEDUOgFr48inJM5ckhlok5br2G8qdKVbI2?=
 =?us-ascii?Q?WFgG38v0vIwFakwjGIbV9q7R6hN/EmjMXY+sXfr18NK3rg+MniLhQ9+BjbBi?=
 =?us-ascii?Q?e0BsmjqL9LBQ3B9T5fRtFf/sXoNKIOj0c22X6rcO3Do5RZnMHaIc0T3SZi2y?=
 =?us-ascii?Q?1DWgqNcpoEK1N7UXqGBwBHnHmBcu0KlgQ3Q3Qf9Nr1A5mB1kzaRjGTXLOrB3?=
 =?us-ascii?Q?CMO6MUW7q6oMfift+KmSYJw9Ad80b76TIfCZrrNI6Loj7jRl6gWBYUTpMNmQ?=
 =?us-ascii?Q?fy3pQNEDK/gEcVnvlEFZDwplbVbm0ihhwDoiF3omdj63OGJ9oUqhde0cEigz?=
 =?us-ascii?Q?L+grnyt4w5Ipj8Sk3XuK/yuvE8pQI2m0YgdTwN/Bosch2lO5NHztSzuWv43F?=
 =?us-ascii?Q?YUc5NSEIJL7avlu3W3f+y1KH48fLVPNoq+1v78n39aP90/f+/KF6y8o1WM5Y?=
 =?us-ascii?Q?TKtY7L3gqExJt4S9sEruFjXG8Qzcu1MSIJGp0eco9HCBGpKwxUkgmf6Cgyaw?=
 =?us-ascii?Q?uCvkIP5RjVRAdCkthQlB7EyLAqZdm4ul7jSwb3tY0hQlIsvpOumUjZOV3JY/?=
 =?us-ascii?Q?ytcS/gNTs9ckrxqHUVCMdkYNlHLPRp//7jCmXkzs+geRZw7RwiIVyqd8exMn?=
 =?us-ascii?Q?XdMuD7VbVwq3t7qxo6efTwBp9rHKO5De33b1N07GhUwvRidBpuDFsSJlWykL?=
 =?us-ascii?Q?cbEN8O6SKpr4KnxmElBjZF+Tkr24DecKgKWXT0UvGWFzfJCa0wB/HRNJq00i?=
 =?us-ascii?Q?o55cuIq1Mn3QhuSxS2/9d57GLRNfDzTxhe0zP7kaLmdNP8xqck2BlpFkho3y?=
 =?us-ascii?Q?17SUbcJL4z1+d/3X6CTeWtJ4hDemM4S3LasChtr2LCoI2BeuMudgWc9Rj07T?=
 =?us-ascii?Q?N/678zamcZqtS6ChE4s/OIygKQlit7L8n6kif8s9Am4Iyhr/014l8Z87kbap?=
 =?us-ascii?Q?hBqOEJ1f7SpqC6nJcsh7tUCbo7l5ZxobpUwSxr54Qb4k/KsWwta4S12doA+B?=
 =?us-ascii?Q?Lxno1puj5XA8dWlkfIzx17UlpkyCqDmRXdIVBTWQA47Dt3tcg4KvTKYI9VZe?=
 =?us-ascii?Q?3pM6M+6IMnOL/yWnqwmVN9zgwD0vSLQbE2C6IifKNp0pZwwGtZ+TY15QRMN4?=
 =?us-ascii?Q?W7T7YYLoTPPaIKeGLFqnEpIqhhqSDD06EbitB5dncu8ZVQ5TqvSy538q5Sel?=
 =?us-ascii?Q?22KKaZ9pkpxWGhkBWMw8+p0mMzxhvo0GjYc5h4l/EjKiPjTsaFGxBgc7jsHM?=
 =?us-ascii?Q?Vreq00/9ZoAN0sDm/0ooWig4nUro26LGOSMN8PwBSP6lhIaD2cm31U7M83r+?=
 =?us-ascii?Q?IhwS2uwFLJ+mtON3DIVj2CgrMDI+cxoeCFY7A6t/nF6+W4VpI/kCxZLjBpCd?=
 =?us-ascii?Q?P3E0cutF+wFtEw0aQYtKjm3xvEtrVeNXldbXw6I0DVtdN3I5GRvfpxpxA2m0?=
 =?us-ascii?Q?k15ye1NA780NAV+tTpbF6gtt/6tjwV0CFGGOHcBPnsvN11JxcypfgjJdfERh?=
 =?us-ascii?Q?+W90YM/LErkHPVDeihuaj6xnv7oq4ihLHM4ZwKYGEGOl7id1D+PdcQCD5kyi?=
 =?us-ascii?Q?p6k1TJbLkD75dI53i+BbJBk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bf9681-c842-4b3d-93d0-08dbc30c323d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 05:55:35.5102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BGfXeRGjlZX0gsv0/FO2OGjDJzrZurX7jdemd5ZwWRNpXxnaplTx1JrGUSeeERI6Uu5ZRkCq9egCIyIoWSi6ZuraMzPMOKDSAbL5Ajvfl5DT1a7GKLL7eE+hyb3cAyf
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

Document support for the Interrupt Controller for External Devices
(INT-EX) in the Renesas R-Car S4 (R8A779F0) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

