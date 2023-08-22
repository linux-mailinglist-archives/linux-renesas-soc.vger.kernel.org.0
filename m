Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD387839A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbjHVF6p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjHVF6o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:44 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E42116
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha3ZFpmzEtB5NCfuUAGdR0J6oi3yz+Q0siNmMsFGBYlgyLJK1l94gI7izd2aJs7PhBj2ePpMgfRt8YXv+nlGIiiub57xa3EqYr81ooynzX63RqY2TwNi3lei5iXpR8OVhVWg7JSFeGplCWDGjvMcBuiGhfBvuSIiBGwa1MWSBMREcyqvXY8Z/xTUT27Ru8wOiTn6G6dji1Tczu3eKbXznXgIEQEiiuney3Euncls6AQaXIM2ZCbIHMJRc64v2EtKjD2HFR91w4begTzNpW83JeuvuugKiClrI2gdMwsGXYktI4hQLZ0AE/T3WI57jw7n03WLeeHNng6RTf8JFVoroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68LgpZNfp0lIL2f3zXdsNV2MEl4cjeNyLVQrLzW1Q6M=;
 b=T+ZW+BfEnHofS2XAq5x+g9o+YRz0m207OuXv4+jcAr/L/d3Q6SkPSOtgp6U892AykNKP+kBJryjGVbio4v+i9uMiIdHhQzSZ/jOzOXpt8INy75/ejvV4wxgQ8D1rIllnpPzIrTP4BpkPVJIvNx6sLAgLxXNTC3rX81ARdXQZxMkf3Y/TVS4dw+zij7m4bZXnkGKOO6/qOULDeIOCalGSb7V56IZEPyxCtGh6KNGMszLCl0W6f/bltiHyXXFbIb1iXMfUi5UGf1I7W/hAau2jDDXqUAA3fYugb1h0LzsW8BYSeS12I89Urb3OaGjZMmaBiJ+OvvYffWxtJDmdF0a6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68LgpZNfp0lIL2f3zXdsNV2MEl4cjeNyLVQrLzW1Q6M=;
 b=mGgZX8DfG9UwtnJRKocuqrkJPqABFlcRYcRwyQcoxjOT9LqSNaxtfdxr8D9PZGBJy970R5u9x1HPARP6/P1yBdyJcH4C293iSFRJ4nb2SvMJIa8JPtamTKUh1+Jk/GO/EH++LpM0pcXE2BRrdyD8da9BeNP9PdZh4QA84ukeVRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10727.jpnprd01.prod.outlook.com (2603:1096:400:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:39 +0000
Message-ID: <87lee3sjn4.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/15] arm64: dts: renesas: r8a77995: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:39 +0000
X-ClientProxiedBy: TYCPR01CA0194.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10727:EE_
X-MS-Office365-Filtering-Correlation-Id: fae9a503-b213-48e4-49d8-08dba2d4d526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rBC/mhoGHnrysdzwPPSKBwRG8nT3vdhmxpBqNYGmHczmoW0I/iDF+nYxtwnMgt4kBNFac43HcAHYYik/DvgCqRjVXujSoikJpUb85ToI4zhDuxScmngVlBBPC05B28Jk3KvnCZc/CSgjJbAgzC8u0XyNIvLH9CnbKNqtOTijiU8askwzNJPq9brFe9rlJrYG/Utket/K+ZcoFJ1cvSETz/3t3NWo7gfWLJO+NL0Qhd5Im5gRzxQY5LykpHDKEJC6zZK1B0EKi6JAGQit602IEf+nAmam05nR8vn3KcgTZ0+MCTnJ4gOvND/Yw6FIOmfy+FvlTU7aOnpBS6DTS0CBOH96C+l6Cxe5xGVfCaebCiK9vmhYCEj2bDgMaF9/VvdwOmU1z1Q9U5svqvsSDW3L0IuxKIiE+TV9mflQGlWhFSRjYwrtquj2uFEqjQ25rVJKTtxu5EKpFZV8ESqSo/E/FezKtdInK6XoGkiBLt1SEVKQY0H7OfiF4JelBfGKNC8HNoD6Os45gFYFIwDkDGYO6XmVl4fmPkyrHcZHkl1ql1I6E95/iOKAAFYOzMKIqDgUcAEls3m5TJGcP3m8UI3mFHB7ywDVcrpKqNXwOinBiNdT8N5RdS0CSvhL9XVsPYO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(1800799009)(451199024)(186009)(8676002)(8936002)(4326008)(316002)(478600001)(66556008)(66946007)(66476007)(52116002)(41300700001)(6486002)(6506007)(6512007)(38350700002)(38100700002)(36756003)(26005)(5660300002)(86362001)(2616005)(4744005)(2906002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tje1kWQmvrqG0ECUTI1cvy8pSiR09rLs/7iNgChcBmFVYW7EDG1/rFSb6j6e?=
 =?us-ascii?Q?kOmEuYU/QP9FTqL4vVTqoOodvw+iLpYba6yYIowaa/+2emRP7ISiMNvPUJqG?=
 =?us-ascii?Q?o0fE/B/KOiRFZxrn3U1A4AC/JP5N1oLzC4RkwFUT/BOwryouUhpnTNg0YmSJ?=
 =?us-ascii?Q?XyhHvNpJa6nRPqRnUstubP25CHpNPIN87yJmWWumA3dxU1UNPSdjntvEP3a1?=
 =?us-ascii?Q?2TojwMXDI51ApzZ5gnkQhVQRMcN85oyHgpRZcmj1nIjOXgPTpdxGML0w6mHG?=
 =?us-ascii?Q?h/bTEfAklimi8qhd6rwLMwR3Bi4Zt49kHxFpXus/Q5x30vixxQb+g12+vi2l?=
 =?us-ascii?Q?hNJY1ClUNDGRAGsU09zI0piwRycBNHy7X0XkJDRU/ivCaXhTZKaBG2nvigKW?=
 =?us-ascii?Q?TZLe+goy9dX8wyBz5LCEunWKAlUkJPM/kW3dCpzrbU5mH77nd+tcMvTSTnQf?=
 =?us-ascii?Q?R8nRCGuUlgCJNjKT8uO9IjulHfnpwRxs3VyoLJXcUUsagcJlxIde9w5k7veI?=
 =?us-ascii?Q?/SZH6J0DbPKUDSwLSa7jaIqZS5ALpG69KGWVjSNybuRUvNK0OjG0NCPkPm4e?=
 =?us-ascii?Q?9ZJcKxeZ+SxgKANT/lsTo//Pi6BMzqPpdCabsu1JD637oiqn5r/zf02eCOKb?=
 =?us-ascii?Q?uAIk3s9UpQzePOA5J8QMdpogWL1KSRMWKqgRrLRbrYsmyOIlNH2hcNm2WA8c?=
 =?us-ascii?Q?wgtAG8Xgi4x+R5voEOs0MAM/Tn/ob12oQE0JjqPGpFQj5TtI3JJbZgqNBpqS?=
 =?us-ascii?Q?CPvg5o7kXE212kWarzK0zbjTkzRRykd/ayLl2mvUXmVlqrOchFJIFgwqfiJ2?=
 =?us-ascii?Q?zfYYw36B1VqRmfy3qiZqHnibAuMHGa1X7x7DIJL4Gc2WjHV4qAxXywn3YQKI?=
 =?us-ascii?Q?GK/k9DkBi3fZTQRzWpboobmpaHfzmC1Ij5N3PzEpaFHLGXXVSlSM8/hb5Ohs?=
 =?us-ascii?Q?8sOLWAnYCMPyWZqXcqxbxEDwVrwGGqxUFUAXRBo757ZZ34i2E6QW2bUI00r8?=
 =?us-ascii?Q?wvIKChGCPajWToFSqbnaqZHS8PMkDu/5n1fOWi54YAYfK2XHPxZq00JPvn9p?=
 =?us-ascii?Q?CRPYF2FQa6BcBugnuYTIV9Lb7xs0jXfPlrTB7VxIISKpueDu20jejaKlVR0Z?=
 =?us-ascii?Q?zkrsBsjWrhAa3jAIEVNkowpk21XOZ29/1aStZTW+Dj5HryChjhdylmyo4lVt?=
 =?us-ascii?Q?lAA9xmme6CnRMIhxr4RRYZ+QSp9zrd18MGiFybp3jxyuqbd3nMCoagE2nEUi?=
 =?us-ascii?Q?ymy+eUkFPD7mWz3Zg00NoT71qMs0kJsrmlN7cTMUrj+MCEqYE2D03V9hNvCP?=
 =?us-ascii?Q?uGZzRYRy7Aig8XE6XbL0J3M8wXuDr+Fw4UOf/MINjbzlKs/Kn8igHaIpAbtQ?=
 =?us-ascii?Q?0yG0z5Fmz7+37ev+Yf152w9EXVA92TidcH8F+bJsxcpxEHk268iDgHZnumEA?=
 =?us-ascii?Q?e3ywQ8H1s41/FXOanZies0UyDR5iAPHJYITvE1ALPa/SDgH4iOxW+hh/mKzm?=
 =?us-ascii?Q?YS71CA8lW2V/eQwMcSMsM0+AEiXm5niKOLJZonJX+fzZ6hjygEOHI6N8cm2C?=
 =?us-ascii?Q?Ohzlnq+/UdEWLmgnd6FTDH4SsD2CW6X5PwnOZbeNoQlbLprqb+YIXlrPtpHc?=
 =?us-ascii?Q?7u02bgLpHsZB4KZVzsFiVnk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae9a503-b213-48e4-49d8-08dba2d4d526
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:39.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkT9xnxwTsc3NGs5f8RnzzHk56XXKmiFWtZenhlWdaZCYTYz3a5LsVW+kMQUTfLGF9dB029JeNBYTJ+1zEioxOjO34eBAN6oTWWj3M6PD0yGjsCQOdCtGvhFtj2Zoqvi
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
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index e25024a7b66c..8cf6473c63d3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1063,7 +1063,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
-				 <&cpg CPG_CORE R8A77995_CLK_ZA2>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.4", "ssi.3",
 				      "src.6", "src.5",
-- 
2.25.1

