Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82E7D78399E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbjHVF60 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbjHVF6Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:25 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E743185
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPdtlQIBWp16lzHCsQy4RFDuVqGuVNDRO7qDC8L/iAusnwiWoj1QDkaNOqXShOPCKvAIYvTOgkn1OorNfXiM1MKjo1oMddblAiZpw4GUE69ZaHqS5MO/W5wQfxmnHVur+hzzkrnGyHwZhPzESFg+4lmNyMffke0c/w064ENYvHjPXE3L9F2cN4IqKtx3AZ9KrHoa+58T4RVV4NGmezKvV60YugsNcEUeOXRawVjkXDvrY2B7zthsU21VbEp8W/H0PD3tMIuw8HQKT1Tkk/SscdCxR6LlGHJUNCCNTj+9HBMGi/YzC/Zge8BEx8Vv8HBOElEsE6U5Z+xsjx78RlRZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmAYBEWHElzQLsSNEUciYbPMBGxnLUhyVLIFOc+fmts=;
 b=fVmtm6jASaCLTYnMyLJbqX8DcmdPUi55dCXIcf/hfQP5pM/Z1veTFQ4xI4wcGuV9YyryCa6V1SIG4dfP0OAWQlKap+oM2wbwcvpBNGTZoe2AobwJPzc2Q+anui2UHxlAQWC+psLqtQ+flfyn6T/VK29IBnPgx5xVD/xRsnO8Rwc9pahHWFLKCCCgz2pPTPwzK03z2QLXoaL4WqycEtAnHBoAp8h6Wx0YTTSOkSoxjtt7NSdCevoiptZXK1ZnXceImvlRVZ6J3PcemfTk3kqU8Q5n1MKGCSSdup1C5iEHQkkg1d2TXNn25va9a3DnhX+nZTGBAsupvyogxw7G0C1mrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmAYBEWHElzQLsSNEUciYbPMBGxnLUhyVLIFOc+fmts=;
 b=VDRcueR/1EoIodUeya5nUy5QIUOPLUk8GQmqCpXVuep8lSAI5Q4Tl6u1Lzj20Q2sJAeKYC/sWR/nTQT/rj2mCEmpJYdk64Kg3LJ9jlHwDFiQBNXzLSJpdbxhz6LkvcDwGyUIFHWLA4iRuENUfA0y2xva7/xVWIx8eqBPKvuMYIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:21 +0000
Message-ID: <87r0nvsjnn.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/15] arm64: dts: renesas: r8a77960: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:20 +0000
X-ClientProxiedBy: TYCP286CA0319.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd1e737-60ed-4ecd-3be9-08dba2d4ca0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HXwmibBx5/nrmGkD53ocy6QaItdoKfIm5eX95huSH3cobhuLcL3DqHebWzSs4hUiDzc3u6kuTY6NDlXj91oETYxeWGlIn4UNjvTgGPVzUE7/QjZ1OMMev25/+MWY4txujHWcGTJYUBGrSQdA6UU5X317L65YTIq3ltPg/MasB1CgURE+C96Yo7vyjG66j3huycI+NDDK4iapl7sUzwm9rMkuZ2Km0Z+7zwoQNQ6jeUG7/Eo77pVWFuB/5ZqhC2B9v0VFr3xDYt0gL/TfRVXA/O11XnyPtQ5i1eyL/Pnst3PlQvQTm2Vbzst2paDDyMfa5z4E4kmK2K7AczfRYIqDChb5Lv18gtFDIkXQu3Ml8qZeXKJAhk7GcbOtAJibwaU/HPYwYusvRg1MBtXAhjDhHybZfx84igjp7/8JqzISW6rwkyM4aRIcEw6w4h3syqXhSvQxSYepsOogKSLOrLk+cJBgCcJTAhGNutsybJZ1vHyGKjBXZ+yVhNMY5k1GLnlzWRUdDZ5e7RRnd9dm8TmNcKrY15eTJP1ZmCNMI3ESNO2ARgI2BE295hu/iij9c9U+kn0bvOhM+RgLJQK1y/SRxBnaqNW9Ihetlij1PvHMK3S/PM22T7+8l++WISR5uqAY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6KY4zrVNKFOs2gwP17LIjE2mT34ImCASag61xo4PzJXBFGFblD34v2MOwvlr?=
 =?us-ascii?Q?4cyBODH+HhYq7Pa4vbt324zgUrjmKBV5beQxkrP4gSfyxWw4yr/ncgZWrugC?=
 =?us-ascii?Q?p4t6DavKtlsk6Qy1B4yD2BikbcXZIkNLiL28MVWF4LiUG1Y+PvM8rCaKuwwM?=
 =?us-ascii?Q?JimRsg8eIvKYHNsUdauckSqouAB63ij5/IXF6PFrpmTv0fbTioyYLd17kPgg?=
 =?us-ascii?Q?MsT8/lkZa8YOSvXnjCC7OKzIleB0rmtJptldSQ/+aLEXIlNmml6IIQv79J85?=
 =?us-ascii?Q?rk6nF/6CijXHg0pxTfIJBJQSyXq7iO1zRJlkZicT5C2plmHM83HbdWXMx+r0?=
 =?us-ascii?Q?9I708RBf8fTyO+XLgVaoTJHYugP2gwZfRpgMs1ehpCJHBGq4N/nlp9DQ6N25?=
 =?us-ascii?Q?BxTeHdkpoVK+r1afBniBHqKVhmLLmKzC5S9CJOoqwVgg6+mnNS/A2FRJPU2Y?=
 =?us-ascii?Q?rNmiZhP66hqIg8I1IfMT+E5rgNhfIbMlcStzSa1KUA2YVXAWtyNdUz7EnCpU?=
 =?us-ascii?Q?QmDE6CjyXFQZp7tX6iuVrfBAWIw6j9vvVPYAKiylDHqavKx32FpFb0LR7uUQ?=
 =?us-ascii?Q?W3/DBI8PzeMLePd++jc6s6hXpeWAZdp1dnMscgnS/S8wSP9FpxTlaK5BO7GN?=
 =?us-ascii?Q?rk3E/okwMEIyDaaeo/Hilpg+/a2AexWjKkqwkwSufeHJjKFuQvOfCcAFWryc?=
 =?us-ascii?Q?++5oSyy34xngxf8DFcMZ5nfZ+pNDqec7+kqafYgpUlKrmYXPUsJFfF08M3+X?=
 =?us-ascii?Q?bUb73Rk7Rgn/U92RLHKHso6iURcRGDDo86D9oxlOgxAKIyd7+m2LdDU6+whD?=
 =?us-ascii?Q?9/2k2eEcKZotWRhBl4+ExoNng17Z5vjTbyKUOh8nIDKQ7ADadNvNbQpBdpOi?=
 =?us-ascii?Q?5Zeq5UmH8uO0LSmF/qhaYF1iG7s9uVg6hilgo0N5Zdp8VUCVJv3LqLANxuoB?=
 =?us-ascii?Q?LhPVXPC7iboKI9EeKjGcRXalXLOjkp2pL47n9NcuxfujodJ+0MR+J4m3CF4Z?=
 =?us-ascii?Q?LStWaYo5S/OCHgkLQhtO+dGDvZ0VPAHHEoGYoreKJO5qjNxey2aWssCA4emk?=
 =?us-ascii?Q?w6Ddfo9/stEeCZMNw5EjZ6uoRjobPz68wTRmGkUbNwhkx1r+mwv8S1EFpJJk?=
 =?us-ascii?Q?ZflhWO8IcfFfdsxtXj/29xr5R5hPA1b0GTfZlbMHGbYReqPVwlbqfrVyP6ne?=
 =?us-ascii?Q?HkaQNAzsB4d/P0Ol0DFqWFv291XRRAcqS/E6JGq4gUr0T7+EA7vt8E50ig6u?=
 =?us-ascii?Q?cqRQ9YUQJtGCNesVvouosg7ri4nAT2z+8SsTa+5oSlgt1S1ZEFd9utpfOEvK?=
 =?us-ascii?Q?s2az+abXhFONzfGlCUiUoj97hOBqQQ75TLBwAXq3MEUI+pMZQOvBX8DbxnHM?=
 =?us-ascii?Q?+a6q8L80OgdyrMqXEj9IQDGnWu8dU82xZfD95Fp1sDaOO/WSpCTrIgeMgTAP?=
 =?us-ascii?Q?CxLUlQ/Q8neqPpcjq+YigxnvmoruO+o0d/IXqPNbkxbedNT4PSPDNpExpWdo?=
 =?us-ascii?Q?Epxy1DH1WEE29iM8K18EaviLGX2FQ9F2XCUvk3/ImOdY53YnDS0BlfOuHGxV?=
 =?us-ascii?Q?oizSwKYX82OFTkTzM9DVpym4ZtoIGtM02tzuIaf/QQCntzU6sAJsHcMlZPpe?=
 =?us-ascii?Q?OACxe4v9Y4y9Op5e3l5ikAw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd1e737-60ed-4ecd-3be9-08dba2d4ca0f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:21.6557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tdBfcQ7CwWo1Mb5KSW/8MJgIsS+g8p7U4j9ivP9S6uZ5UinpznPerL0/QKKDf4gl0TsDZ4y68K0zrlC+onUCm26kSmc/3HluFBAN5aTJNm30/elPafocbZtxmV5YDsl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11746
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
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 17062ec506be..52d699578d81 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -1903,7 +1903,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE R8A7796_CLK_S0D4>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.25.1

