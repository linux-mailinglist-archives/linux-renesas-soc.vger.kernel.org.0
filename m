Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF5E7839A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbjHVF7D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjHVF7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:59:03 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F1E116
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKFcxkGtsOV7aVqVJcnhDXaEzqTZ+0eRRZTh45kzJa97J1iGaHBXNVdOjYNhrpIjZ8M9oXLjFHgBw+IR6PYO/Qt2KOjyoNVFOd/JnPfPvKHmFUu+zkGzYTH+Ct7eXYZ98H4M77MVJSnEvoB9dWcXdjXimDGGU81yc3gLZW/E9l3IeQTDq4hl5roYunxQpgte4dymO8aqlC65uLiErCJ4n1bEq5W9kBsxUN+52Y3N8oaZU9/u4CJWsiPXv6LAsizYE000dtdnyHyM/waSeq7BAIZoB8SAoVxpG772gvp3aOeK5BSJm888O9Z/jdD8cFfv8NbWh7YXNbquAPCzSTAKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L33Di08j710zSPnL0V1weCUrkHDnnvp89jg1gKPKDi8=;
 b=TqXCIlTIptan5wrPFlOZJLkHHlKZFRhZkRlk/aTWwFg9Okv7cRAGsD5pHgFlhNdUMOFU7j/jgR1gNCijJSM++fka+/ObRcvrPszGPmULffxeTbEsoL7q1mlYe+OJd0iP9cgjmihf043DdnbzJTT+LI+1TCgozebh+erRdvcXviPZPqedeze1nkm2Iqu3gExng15woDjq4YfPp1TdWYPCWqXAj9no87z1v84/sp1lEBt95tCFXbKNwiPBteHugpc39nv4+U7f+NBbd42kaR+ABTVb4owijsIdKDsKSoFa1PY6QIGhsj6/y4snl+3s5kG62KxoL17JXzOM9qk/U2dVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L33Di08j710zSPnL0V1weCUrkHDnnvp89jg1gKPKDi8=;
 b=l8O56Vzr6rNd+zATpL9IV44e4gv7xaUtCdSFV4XB6et0qSrl3jt3le8N8nsNrfCL/0hZhDfinzUbBf0VHc3RV1Asl2QnTqxPF9W0fKeUIo196ZCm209Trf1Hd3+tDtt7e36hCa6tMoDF9YMu/freyORvJRiQCv+Ga1ij/qecVrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10727.jpnprd01.prod.outlook.com (2603:1096:400:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:59 +0000
Message-ID: <87fs4bsjml.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/15] arm64: dts: renesas: beacon-renesom-baseboard: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:59 +0000
X-ClientProxiedBy: TYCPR01CA0089.jpnprd01.prod.outlook.com
 (2603:1096:405:3::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10727:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4ff5c3-e8b1-4420-994e-08dba2d4e0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9DkB6B9K3jbLtxbaCxDvowXr+BVSvfMeHfqezyycYkdVdP4EDBcf90i3auEfJfQ0+A2lhvNgC4DYIwvssjDDKcNtMBxz/lvY2Pkbi43qVUaFjETR6wiTskogLcVE8p2smn7XalfJ4jpfmtA3JgI5XLBFFEJWVt1kqIJcnsPQAKT7AgPVKKGs17E8qEe26I0sQ+K/NcLgGd9XbL/4Qics6tnINbXrrBG04EgfvmtgAtdkGbm8zmUXMh3eYx/rPsflNqETdXUsalVqDMtBrFWxlN4S/0b2maLvRtiu9mRwuT+Rw5YhiXhrpc/3auwEbeRyz/WX77hgceNOfTcDcoGkLwZoDE4qnHdj24ZxNMFr7DsQUuM9AL5+vVReKABKQeGXAxrOxvsVxDOHq1bgmZGYZawcZxqxvRX0xwTKo7bxdyXO9jLu6PIs1ymFXSCRDEBoKWgcSelBbmt+NLMkOoo3IV6BNftLZpOEGPSp+gL6eMXbiNwFk1VoFzAikYnzAKKAm9ak9njIdKLQX6Lu/90cVeodZaryGz4yKNTyoACG1uyiUBwWYbwOQNb+k1xIGTG0lfBhbhc2Us471PzR/S9d2cj3Z1mY73we9TNuFqYCaB/7qYxQNxoGE42h/t2Ww4B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(1800799009)(451199024)(186009)(8676002)(8936002)(4326008)(316002)(478600001)(66556008)(66946007)(66476007)(52116002)(41300700001)(6486002)(6506007)(6512007)(38350700002)(38100700002)(36756003)(26005)(5660300002)(86362001)(2616005)(4744005)(2906002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?boT8CkoCxu6kawwqfuPeVRgcx19yCOh1PuO7Km2Rri2dRXqLEWaNOZze9BZX?=
 =?us-ascii?Q?Pe6mw1b3e3UEvUkrWYAApk6f0Vr6i6bLXHg0U90i4j054OF8Q6K/CAu3GjIY?=
 =?us-ascii?Q?fjMO2V8IP8Z29nJG4sP/6VwG9C3GXCx8Rhaxp92LPDS7DhK99cz2C5EdSrMS?=
 =?us-ascii?Q?eTlHY3A+zSUZLeY6qo+4yCfrP0lf6MZWzwXpYusAxBIRAhhFey5zItjljNRr?=
 =?us-ascii?Q?gJwPsNkYerGW0UISP9xAAhveTyT36b+zHf3b+fdOMTvul+fCY7UCWkvXsV5G?=
 =?us-ascii?Q?lOkEFzqyo5f5yv/2B0ECMOAfNpCX3FeTVePyVgQnok0a8dv1L95P1avTP1ab?=
 =?us-ascii?Q?AxYZ2B6syf/7lBQFjsM70cL9SvoPMGc1/nPzvGTPAiT2A1ZHHlynPf7vosgL?=
 =?us-ascii?Q?HxO7BsZXQfgDq7ck0HF/7FyseM3WKz+QTc9LLF9dM+y2/594qcWBUnlI5r10?=
 =?us-ascii?Q?QUHAUJJf65A7OC/qDA4gdOzIQnAsrfhy+sgArv3km5D98a/poE/vfTBc0BBm?=
 =?us-ascii?Q?OkVg76rP6YEShKnMluZ5q7D/78FfYXwUXj8o2r1tkOC9ihX8+GJGR6mGlagh?=
 =?us-ascii?Q?oZaSNPr+MtGqDgyD4B/FxJKxMsFQKZ2i9GGMVC4pJvE/xN7D0W0E2/Vt61mH?=
 =?us-ascii?Q?dC+tN9B5mNjc1Z9keDz73Q8k1aK54B0fs+Dk+QCG1lVumXze5PT3RaOkH1HL?=
 =?us-ascii?Q?+9KA9eyMto70hLIHEUrtyLL+W9PADULQpgLu/6RQdHb8tLhQ84EF9bNLKBlF?=
 =?us-ascii?Q?xVmo3KOyFieBDYFpybMxbbqWwo0x9zVO/TFLqcF+9wE7Yjg5I3deAp52O8GO?=
 =?us-ascii?Q?MpQ7JRrde+2pFCVwo1m+T2oRVFBGAivQDzEpz1cwzmEU97zJysae5HVAI8iw?=
 =?us-ascii?Q?9kttFigJRq6eM+G+pPO/YLNjKH8D06hF3fa+JfpG2Z0HyR0yentIrj3NQzcp?=
 =?us-ascii?Q?Er+glLHu8Zyezh+JwCSlV/648ND/14XLVfYWW5J6hsczskUrZTGhl++wCe6Z?=
 =?us-ascii?Q?y80l6FbWG4T6VmlV8qh47v23+/AdvjKHujQK/lLKYrXl6FUQx9A07sLskMBp?=
 =?us-ascii?Q?qLxPzGk3CtqMjBXkmz0vrP6oXmhDg9liUTO9lP68rjSOzXHbTIsEr+VmGHeW?=
 =?us-ascii?Q?MKgAjGrmTxWE6R2Mw/DbLAGa7SRjKhlXUkm0RMPx5qb/8jOxLsnyfa4aj0k6?=
 =?us-ascii?Q?9sZrJbHl/Npa4wiydKvVkR8v2sC+j/SiYPtQUTRASJy+EEuuM1WRlXZBbDUf?=
 =?us-ascii?Q?ZBZry53G0/eYq1ri93cydLztLyi39/QVuifo6u2MldmaFp0zWuOACSeYjrDR?=
 =?us-ascii?Q?L7nPXTmSMK5axc2cndRR+l0+CuvYSQV2j/GHX1bSiRat3ub2OJbf+Km2vNy6?=
 =?us-ascii?Q?H5uiHjbQxq7sQteLcL8qVWuLNW8kXt28D7EtVE9SI5QDeu/RWWQHNehe1URL?=
 =?us-ascii?Q?jFF1+iNegMZ9TriYgI8SCsy4es2/Ag7CPHDz3ocdbaxagYv8GzvvAgCcnnc3?=
 =?us-ascii?Q?HVyzWQyPtGz8aBC1dC80SuugOj1orocTawyv10Yx78KIaCf1YOgBwMzTkH9j?=
 =?us-ascii?Q?V8/XD9sI2OIOQK4JvPc/2stpJA+FFe/KkZ/AY4Or9ND5RPc4LRvl2ctqlAh1?=
 =?us-ascii?Q?WffqTm9yEGUmbtzosRZ6itc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4ff5c3-e8b1-4420-994e-08dba2d4e0c7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:59.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWCyFJt3Ns8Fif612Wio0Li+8GEMy95GzfWy5Ma5pllyvAzH4Yrkfrs0SQk32QxTc6lTw8y1zajEyzyqIBWVQEHCKj/N76IZ8NDt6H/XVFy7CIoD5dHrtUTYzlvffLGZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10727
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Sound clk_i needs to handle "ADG" bit on RMSTPCR9/SMSTPCR9.
This patch do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 2e9927b97732..5a14f116f7a1 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -651,7 +651,7 @@ &rcar_sound {
 		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 		 <&versaclock6_bb 4>, <&audio_clk_b>,
 		 <&audio_clk_c>,
-		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
+		 <&cpg CPG_MOD 922>;
 
 	status = "okay";
 
-- 
2.25.1

