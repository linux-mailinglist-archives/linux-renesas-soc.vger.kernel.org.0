Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A8B6872BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjBBBFt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjBBBFs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:05:48 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2116.outbound.protection.outlook.com [40.107.255.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB4B30E8A
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:05:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1Ta0qV9+3I85EkJRTvgGZ+n2iIjX/AwAWQ7YO/3fgGwHM3N9nT2j3J0asR2oxDk/4Wjt/zGPAJvvFSdHbc44+TQWplvjuq4UNAglWVOSADA12lVN54+aSzRqz5i1DhUTyutoxi6WPd9WqYYGzetb61OTl9/4bpY7HR7UZhcKc0ilZ7m3FSPbR3tdUuVzrGPtwiVC5gdtZuBOR/cz5akDyhWKPcl4pmDgdM8Xt3kFyWbWXT7/BFcuNAX19LFqO5cz3hig5fuUAirDn2wD61RQD3a4RDVEN4xByVgjoH6It4e5SCuds6R8zvmopsC2G32M4+vRziD5AVCg2Fu85FjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wysVTh8nR/zy2hlAuRm/AbHkv1kXpNPPlW2flhZKDlg=;
 b=IwdtEZdSo2fGm7U6A73SlKiJdfmizF6Tksoa33zMzCWspBQIrihKvE01Vc82ytZN0YjNJGJWAxqUWrLy1OMP62UUC6BWz0Ywjuz32N44qTUVRC0k+0i5WZ3EpH2vRrxNI84WXeENvNi7Bp/NEAgNVsYh4OH6sC9LHMqbWcMn8wPrLYx1tBvq+WLanw8KYQ0c5yMHqCWkeHnIgNkPcQMcuwQxAE8r5vFwBBc414gDgc+x8A8FP/zv5cElZor601S1aQ4cFGCU2Ee6MAkcn3RJF0u/iX9QH1FY47nRsKwY1H+1I3ZpdIGDkmhnKMb662RY8WB4m6/y6wNYov4QsNyduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wysVTh8nR/zy2hlAuRm/AbHkv1kXpNPPlW2flhZKDlg=;
 b=G8SujF8XVIDaaYoj3VhpgfXfu32pGmfjvWXfGQddtUSxAdNejrurqs3Xh9ckqGI7sbSOSipLAXIgOg0FsQn/fRH9ipYTfi48oUL2B/tPg0kvTJQINaTLDYAmKuPBTZ2nMCteVac3XREIWH0vRTHAm68Js4wbh1bfF5bLA4QPAkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8628.jpnprd01.prod.outlook.com (2603:1096:400:139::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 01:05:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:05:36 +0000
Message-ID: <871qn8anc0.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/9] arm64: dts: r8a779g0-white-hawk-cpu.dtsi: add 5.0v regulator
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:05:35 +0000
X-ClientProxiedBy: TY2PR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:404:a::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c3207d-94de-47d4-c356-08db04b99770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NFkWSNogWjdxXAt6EM6L+mFtWRnPAiLBMTvF+SoJEW5tQrLIS0Z6xkRm2JXUzRkYniBC2VZelzqWXVsrtROBTlmNkV/r4GVJd+EI7YzPaa07dOuEmdMyzKz58FBbnu90HXGW6SFYp8cR8oFXf88csul8zBIabmauU3nW5WXTX7x2JDRSVkxiGzf364N//ZS7ovAV95FDMM0A8wsqh+TdDs0VrgkpcR7QjTl2w1ssV0Pvy0PcP+KtRokJACpz+DXg6Oa1c0QlmenfiaQXZV17ztUH6oWYNxFYHTco0EBF66eWSM7teQaajEjZTgmPzcGeBZi0WFIk251Zo0V1vtYMwC4GZRBuEAcM6ugnQAsDv1A9va2MwVTnJ6/Hq+ZdHqOuW91cUgwUETG1ylfXNdZJiCuEW/v2WOeUvpUTkrAy4WChJDLdcxpAwpibNRulYREDhMps78uKE3uBuMws/ZlbNllQIjBjes9I2RCxiXCtZjfdFUQDduFpw53PDSFA3S7orXGoJVFQVXWeyh431lmuQg+6xvqGScsUzrQ2W3tIo52urWK1hoadQguFPUMfmFzTIvZD6CwqD/aWOPMCupXzILu0nk/ZvLDHm6epz4Av0gNK7k1yUTsztnfd+ErgPOCtGYZcYmWEsw+GOHVNim2kdBuRLvRC0Iuruv82gEBIOSLBY8WdmP2J0JcjFD5TU7+cpM/6gjCYwjEhwaXXxJTacA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199018)(36756003)(4326008)(8676002)(316002)(86362001)(41300700001)(38350700002)(38100700002)(66476007)(66556008)(83380400001)(66946007)(6486002)(5660300002)(6506007)(478600001)(4744005)(2616005)(8936002)(26005)(6512007)(186003)(52116002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/A+bisyU3Eb/Df86xZJjYbW5ncdq1ZETU1m18OvgyxoMVV1+x3bE4UH3b0w+?=
 =?us-ascii?Q?IDPp212oFokLP4BqkRsE/x/5F3druBX1m5hYqCndFICyJnlvZgrBod3RlZqJ?=
 =?us-ascii?Q?XGb5dcKjLpiUrRHnLGbTe7mfjCWziLrQXofmy7MXIdjTYo4OnNyeysrpA2TO?=
 =?us-ascii?Q?myh9mM3QKrQqKgo87lcZZl/gIOSuTXqFSHZbw9ZFUMmnGG1XsiqP3GTnuzjN?=
 =?us-ascii?Q?AEaPCJu8tZ2DLrTOEtfjkXpoiwBOHD2lfA+OFDEl1DJSewgoLpIFeli2nvp7?=
 =?us-ascii?Q?ks/R7/Wwmdkf+SBsS2k1/NCopxD4mdVdlOK8I5jNDJ5ykIu+ky9MNoSPIiHN?=
 =?us-ascii?Q?iZm6n4d6qPnWfgtNZwwNX/x0t6gvT2UHcyfb4sCqzgd/zUAu89B0eT6v+nJl?=
 =?us-ascii?Q?ZuNU7oyFVeo1fY+iehiyXz/AjbFoAjwXObWD/gX9NXiQFSp6oWjhKFv+7Ait?=
 =?us-ascii?Q?j0KJertK59xZzbBUwLMd6a9BjToE8pYXN5rAr/PIs/NfDttlv+MLFuGnTEyE?=
 =?us-ascii?Q?m84nZp0KIhRq6Tq9Nvvdb6x9R3njwbkw/8i2291QG/GTSmvRmHzRzq2Jghjm?=
 =?us-ascii?Q?21A0GY/PFwzkDemzpiae0z1VOSbF9ZAil0cTezEgvaFRa35SUWgKyQyDX+TP?=
 =?us-ascii?Q?Jef+1wuzVh5bE841wxcFFXLzNmGGdtzKpKK7E4TYe54eX2HyH5cyekvW+/Uv?=
 =?us-ascii?Q?ikfg7cIg1Xz1DB5vBO+6T/tGkM68oQA2UgZvUtP3Pmt43bZT34cuws/MPMT6?=
 =?us-ascii?Q?IYmIRWW5NzOg2Ol+kT8fiiJM4MEEVc3n9YugXrid//VbjakZyyIO7DnMceYE?=
 =?us-ascii?Q?mog72IfngunOjmTmAyn/w7FUbUER2XgO8wmzggaxwWIyzX3ebuO3FJfEEQoB?=
 =?us-ascii?Q?VjebwzAZJ+5io4xPSwhkMakv/w8M8c/vKXW00xZONtgB1Adz8MWXYK3/O9gQ?=
 =?us-ascii?Q?8OBa6LippTIP9q/GRzfx4lpbB2VvC4yKKH1rFtT7Ptao4PbxPDe7E80QdRBQ?=
 =?us-ascii?Q?6geQQZxMUgR0XJLdipPLqCpngGR6XTKcgA6QBX3KhBqU+6aphjVDwoSR4ceG?=
 =?us-ascii?Q?VNz5WRMYt2pb9I1Y0pSus4D08KxUmTYbEIKjD389lXV1VVE1YYVc7nMjIIF7?=
 =?us-ascii?Q?7dzGeegAGDF5ThtXFfF7RwtPVWmddyL8wqolYUN8tdPDlkL9Vk0lms8l+9JW?=
 =?us-ascii?Q?RUJFTd8UyztchrPBFGWXlDKmoUYxQPYY2CCBq+9N63f0Bjz5tqzItMnwsWoA?=
 =?us-ascii?Q?jBrJLBYOOEQdh9Qe6G1AyVrzFUBBXVqOBmfuXFVfoloJzPoITzUvZricxkrr?=
 =?us-ascii?Q?7H2Zp3CPVUU18uqbIFmS6IcLdhuDX7xkTiOhut/KdSvcGR76iuXEIXy2TVeN?=
 =?us-ascii?Q?+NGAologBueZNNAySJuwl4/BakEo3Wwy157Es4lbLKlinxQcWRiru97waW1o?=
 =?us-ascii?Q?bVz8bMddsPAlVMJDnTegRUuCoespk7VBKcLxylX3biMMCOUlVNsRvm+Y245Y?=
 =?us-ascii?Q?xTRmvoDm6bvWFKrLRz1/iJQNlBbAmwAWy7VRCUS7ZPwEBdEXRi+xk/Q3tdDj?=
 =?us-ascii?Q?0E65vfgLPJ2X+HXjXuVRxb00HQd9w7XhpPiCgm6lYRxn5JTdM93xjQw2l3yZ?=
 =?us-ascii?Q?RnmSgmaIY+wPjjIppMihitc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c3207d-94de-47d4-c356-08db04b99770
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:05:36.0829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVYAeGa4YidVLnk9Q15i5AxDzvfX+/pLpcJK+HDyp76Dj05ksrME4m/o+BTNaiSMRD1CYxLvJvyj6IqrLTTzuuSCAHYKbpq4PXk/QaZcJidVFAHsVhV7W+fW1RpC05go
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8628
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This is prepare for White Hawk Audio Support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
index bb4a5270f71b..e1fee0d38752 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -136,6 +136,15 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+	reg_5p0v: regulator-5p0v {
+			compatible = "regulator-fixed";
+			regulator-name = "fixed-5.0V";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-boot-on;
+			regulator-always-on;
+	};
+
 	sn65dsi86_refclk: clk-x6 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.25.1

