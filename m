Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D293F6AD304
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 00:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjCFXt7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 18:49:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCFXt6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 18:49:58 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2137.outbound.protection.outlook.com [40.107.113.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B9038005
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 15:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCbcTeBYbc+vOlfzm5nuSJwrO9qwIEMv9UsZKajaKSPYCUjJKKtUGbHhmO/Ibb0Y+WdRwB2apSS0fvYt8GgOchVns8Gs7giOG6gV05Ik4604rgzU04Gm+Bc3iwKmvI7dh1nCxiehl0pSbTOG8E5rMtaPrbftPeK3cnyxfHdDlgw1HEE6faZjN0FKE3+LbZfUQsTHFDrruQ+Q132vWIKItQYehSS3kzN9rmgP9aO1HA0++Typ6YwFjjAXppGRLxrB4vTKBeK83C8ucNdQ2Y/PRXadsBrjgc/3MTRX3icoEhIr7ZX4vJDq6Cq4VQWhtHuYkcIzq45cgy/kUZmCiL1pzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6t6a7N2rgAVYeBiJ9AcoBgIk/DjCvNnTHmLolr4r0mU=;
 b=OMBqTgNHRO0csiaRxw34/5HgHM7U5d4E5AhR1l/fr5hRbnFRHVLIwHTNoQKfYIlebYwPdBR7El4+frwCuzE1vrfwRUZrsu25kIS5eWiGkPy2Z4Hhe8ysc5LvFGLk/w4IsucWutrHR+Z3zEZuXJUDFTVcaEBsl2wbKzx1Vutx80PvRMP8welSWxAWUQm772KTW6doOv5esOvQjJNEpQ9/TwkwCGZMMn+/DJDdplLzyMAIqW9HmfjlZcw9/pgeXlUv019dXM3at97owzjwscJUaD8mHv676SCIYQeUTT6FDSbd0nz5XfWpWm8xFZtebmFY6wjKFfyxkIIftsd20bLk4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6t6a7N2rgAVYeBiJ9AcoBgIk/DjCvNnTHmLolr4r0mU=;
 b=NeE04ReXCfLeCGAefMFqCzuza0W0/80OONhSjdzXZA+Xg3MNuJeOLckTmxhcLnTs4Wi/JNL7nIpbjcdNJ3uKUYdwALIK6yuvQdQllyA4Eqx2J8+hw/0GhRenug7PBLqorlMROsUrwbE0rBWPZiIwtwpNdOP0k9VGk0HNtuSfp+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11980.jpnprd01.prod.outlook.com (2603:1096:400:3fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Mon, 6 Mar
 2023 23:49:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%8]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:49:54 +0000
Message-ID: <87lek9l9st.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] arm64: renesas_defconfig: Enable DA7213/COMMON_CLK_PWM
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 6 Mar 2023 23:49:54 +0000
X-ClientProxiedBy: TY2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:404:f6::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11980:EE_
X-MS-Office365-Filtering-Correlation-Id: fad0f30d-1586-4931-fd6a-08db1e9d7c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLn6hE7G4mPT7/u/1oawy669yyUSzVn/JuRijoysFsvEUG1utt3cnCiOWiB9emcpBY07uvZ05Q1mZJk7CneHZtYBuTMBcKEepW4QbhCNycLF0XDjXbcWWLptZWbznF6lnbgbKClrNM2+XerGhTmFQqcWtF1YSno5bYPOVFQlQOZG6Dn5YNPlL3fpXDFTsc9bdyDnHQhINaFxQpWfK6bU7PQFJtrVurtYJMEho7kk8HUJNHiwoq85qtorCxmjQ7lWwswnNacF2ovus58Njhz71c4yoWSjRdtBhawlovqYkB2Ykz09NKV9rgQn0/9pt3RZs5xSOh3mfxOv6Fr1wOxkk4RPGxqAnMvLj5WzO7KmaMolfruDP/n1t+aYd617SmmpI8Y29fsTgucrnvBXSbOTQiVDrKq6xgsUsz/3VLDgQmh/JZH3vrDptntQYjHNZhDEYfxlBDqwx3VhZRAPZ9wQFS93itc9FuqdvJeRqUR36qLYIUFtjtIpROdAzhTKrtm8g8CszvXp0RF0kXxDgl3S1dapoMhnuFBQ/8PPbbq/BsT/pO5chFZbotB35Ja0xleCIbt7Dz05ENz8R3I2AKivTG3ylIxSqRgxkpIBR/+xrNL5eB4inBj+qrTRKrUtlhrnweQ1rhAK7iNjmc80ovADvIq+Opx7R3sefVWHzlYqHgXlad1K3nJRttiKG/8arkFGH85zr8fpHNgMFGwAgYkOcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199018)(36756003)(6512007)(6506007)(6486002)(2616005)(186003)(26005)(52116002)(316002)(41300700001)(66476007)(66556008)(66946007)(8676002)(4326008)(4744005)(2906002)(8936002)(5660300002)(478600001)(38350700002)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5nF7UNK8IPIE2AgsAepZD7BoAtlYpakZXuXarOlffCDHfKJG2zJxXUj7l2Nv?=
 =?us-ascii?Q?Mq38QpymPtxEt3p1lMWSiD6RBB7z9veFHuiqhWbxVIIj5YVYOE6RpeGPBfa0?=
 =?us-ascii?Q?AnZeD3UQSQkkgC20Wn/pUsJjtFh3hwae4jB/CeVE5/lMXz6JdrnIe6qQBGY1?=
 =?us-ascii?Q?pgKDkF8osXLPAEEEkXtnhhbteYHSVJTNUm+bdylZGAul1o0Ud6ZJ+XMy69VO?=
 =?us-ascii?Q?bwGdoe3Oo3TmtTqM2EP66ew9KmvO9P4y9mY6zV9zjQI+qfD0fUAdCeIqEox3?=
 =?us-ascii?Q?plqOXi/xY3LmxqD2mugVwlBC8ibhSKFCu+NuPdfGvsTCrUZ9Kwyv9GJstEpX?=
 =?us-ascii?Q?Ceuxhsk5ucdCLy/69BWj+WBfP4V/qfueKSK2C77Q0LOhSA7r+Vnuk2VBF5+H?=
 =?us-ascii?Q?2F2EKIUIID0YczDVq3vUpgeRWdFBA3x+Kza9Woziw1FMDFkP6sElTkttYzf3?=
 =?us-ascii?Q?EdXTTbxYJiibBGoijlRfgP78EAMgwO3dX9s2P3ymCXkltRzCnRvlyCE3YLeo?=
 =?us-ascii?Q?qkkdUz+/aT9K2snnooAV8xG2zF2BJmZ7KYAcy+OaFaOAl3r0AJZIiLpo/0EZ?=
 =?us-ascii?Q?eH36iRJ8bWZnfP6t7Ynwvfol0+SE2KNnRAuQOneHEYK8MSS4rg3GVOKjHvWf?=
 =?us-ascii?Q?q6XKggOcicBfPAN/+kM0ajL8XVpTq8fIOWEmi5rDo+pH+m24YrfhEJYlPraB?=
 =?us-ascii?Q?T7nMBr6Fyp0N9qqE0n4VWfV+HR9jrL027D4KuIDlUaaP2L8AFWeqxgX4ZZiS?=
 =?us-ascii?Q?m3oMNfzBkjgMVMStgXXFc5CSesoC0qo1IVbN3XmYPyK17tUggOs3TqhhPYdL?=
 =?us-ascii?Q?SS/Gu1qxSDzgSwOptHqSd6GIFGrBgUWvwu5KeRpW07PoZzoMMY2uCjBfDqXH?=
 =?us-ascii?Q?8yK/3rew2E1aWeLoP6IHy/1nEoG5uZQ+myf1mnDaZhy8UIA4sfprYJTx0WcN?=
 =?us-ascii?Q?8Bg7fZs+qbmJy3V5529x2+D4vFp6hz6AjlJ+M1PtQDMtk1v+/BmOVv8BkMuT?=
 =?us-ascii?Q?tWV0UaRWSFWL2osVTfiajGNN7B47xXpdOdFWM+Dob16ecPFY3Z2WjMWk7IMC?=
 =?us-ascii?Q?E2ycJXeVgYoV1pufJe2DqxSQiuY26SWdn4EmrgSbg9mtFJXUjr9OSD+wzfSD?=
 =?us-ascii?Q?n8CrajSqAOAS9iZfYbd7xXgqD+eaNLYMIchwwn/9RFGE1nEaLvJOGr1fHtbb?=
 =?us-ascii?Q?NpGvdiMll+oxoqB0aM2u6By3htbROSUHG/pWd4qF2iA6d1E/iBUFK52BNHiZ?=
 =?us-ascii?Q?N+yrsAYWshM1qdzUSdlnt3N1iRYlP+l3XXoHSbVzPQUukAUGz4xZ8O+6yxKG?=
 =?us-ascii?Q?YJMVgr92cIre5lhDNUMq5YqCyseirxmOuLW5CGSZRGVr5r38TOVCK5YlelEa?=
 =?us-ascii?Q?k29hHsONIAKkuMW5x16nBbI3rtFTIdNe3ZCYWXwbCTQzGJ0zQYH/yEXTKBve?=
 =?us-ascii?Q?3GxRka+AXA+2qY63/9B+LBKUpHyfUOBv8cC0KEe8pTHjfObE4WpXNbHupLDD?=
 =?us-ascii?Q?cNb3SgyhETj1CL3TjCs5yXp+oJowmkG8qoX9NF4X5kFk0zf6QjaGBfqXPBKd?=
 =?us-ascii?Q?Um4Jt21MeN6UsTZPUTSRsxCp1nEtTX0EH1YDdb8qn6ovPpTDuJ13WyVHghyx?=
 =?us-ascii?Q?m6BM9QvlLkjhp7Fksc0r9lA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad0f30d-1586-4931-fd6a-08db1e9d7c36
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:49:54.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7j7GKx/a+qa3vPgfq9vQ+L8urPqbh1RzJHb27xFbh6UFXL42hQtpRWOX2l5+xo5j4Br1OHq/wo8zo36WauQ1EQsHyhgYwLiGatsw9/cvURqeQk1XfRtez5wZQhHLtLp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11980
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables DA7213 Codec and COMMON_CLK_PWM to
enable ARD-AUDIO-DA7212 support on R-Car V4H White Hawk

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 906cca4eb3a8..30f8a962d4e2 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -290,6 +290,7 @@ CONFIG_SND_SOC=y
 CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_RZ=y
 CONFIG_SND_SOC_AK4613=y
+CONFIG_SND_SOC_DA7213=y
 CONFIG_SND_SOC_PCM3168A_I2C=y
 CONFIG_SND_SOC_WM8978=y
 CONFIG_SND_SIMPLE_CARD=y
@@ -348,6 +349,7 @@ CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_MAX96712=y
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_COMMON_CLK_CS2000_CP=y
+CONFIG_COMMON_CLK_PWM=y
 CONFIG_COMMON_CLK_VC5=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_HWSPINLOCK=y
-- 
2.25.1

