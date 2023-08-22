Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0E078399C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbjHVF6Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjHVF6P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:15 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D63186
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQDIqUYqLNguePOmAPhbBFWUtfUP9YOm4NQWNYXEzxkB2zMSSKuqqBD0myBBNKKoThbuZCHCmjv3Wmq0hQZWBIxsbMNAYpp1HLQAqoqQWz0bM+afgC3KOfhuxJkxsTEXouo04r+k9WyDvK59LcuLiSIGkiUPhaPzG4uN4rrbN25MZKkHnCugMFWOZkQm65SDFrV3G3x6Qals7oYyzRkIfSr+XHWg6arHI4EpzVHKQUr59cRdrbjMcVXEVfU8evewoM3eHL6Vl0v+LPmWyyYaablbLMaiqhzm0ylzDOj3/fnjLulAxuhUBKe+fJkkinmrQHR4ZRokNq8pfz9wsEG/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwFF9V9qo0qni68mSP3PGH8Ta5FhRKRG9F4Gx4leUxU=;
 b=FkjZLHo/kJqCD1dLYTa1j8nnl2pNVz0Kc1veByphQvgYrEf7Blf1YuF6JxVelMJiOQ0qtI60iFzQkaS+V4UPIN+FQ4Ge8ewMtzxV3fqFlfhwgOo4FmzXU2dUjf8vfp2euLD+Ha/Xyr0alr80PslR1pQ+980sD9liExKeGMRaQQX4/HLgsSdPqiOZBhrZ0YlRICieyMlQ2pAsu9FjmXH90OyXk79q6bq10Of6myw9l5Yz0CybgLCG42nw/t9BL2ABNJjXkKVSPVyedGi7zeyNUdUqlm5gXcLOPyxi15qqT7RZ0mh6UEfoVYumHJsat9Hx0B1HEVqjQA90z0gpn/EL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwFF9V9qo0qni68mSP3PGH8Ta5FhRKRG9F4Gx4leUxU=;
 b=DcUfECJI/ZdyC1tFIQdBmpPbSESSp2s25vF+0Oy2p1NZgBpC3TKyiPDSOyJEeuv9J1/lee3yaB5gSnixA7VfKHj02orr/LkkeeggxbJpr913jtDaQr68WHQR2DdNmHi6vJWwImtD0ONgF0TP/LO25m6zGK0MMQTy3v30NF2Wu2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:11 +0000
Message-ID: <87ttsrsjnx.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/15] arm64: dts: renesas: r8a774e1: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:11 +0000
X-ClientProxiedBy: TYCP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fb368d-2e98-421f-6207-08dba2d4c43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AJBieO0lLXYCndJUF/+1wVbcMxGHSnDFWsBVfkz0+FY3kmbMYVnBsgFaY4I7BAXHWPbQnQnVc56DYkV7jAve2dhVVImlTZSxoxXrh+UeX5TZ5pEAPmz5fOLtBrFnhNJ2ADrrpTJb7YHeGlsv9k8s6o8bknNKwY2ftHcKhQ1HE9B8frrNcwUlVsSrtWKl9AHFDkngl1K11LZ2qzjI5+EjhecAUL8gzxCbHi47ED+JuWQlvw8KSE6JNAorJoVKjFkn64Iz5olz5TCdNdpPiZZvEKxn8ytyn0uvss6pU34gNdyY/Cpk8vxP8o+LvywR0qqAfSi0jgw4Qn9gIWkaIIBS7hsP2FtLyc16eQ4TpN9Jm7+b5pgxVbh9DrswyxDR6ZpyxXACF+CbXO05jvfq2qUzOG9w300VaXWM9eMa5BQMAndd4w/CRS0jkI0IEVV++lz1n/WWNMFjSK4ZInsQBoDZBUNBgpVAmZ3YbYA+nuLMYHwgVFE9nsVI4VEUBj14NN3FIUS12UQJXz+Ipu16bM2iWpoi23PGW2o8UtTaW13GR9x8c04DJERNqaSlkX9zAQ3NoJr3aOLM4A9Y4VK8M0HNywDCd6r540RToAiXyVp1VaaSqTFu/hpAXZQh9v89fGqE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zns+gpwPpm5roB4GGzdbg80mWLwpdmYkAWjbdOz7PovlIZpKH6sj0i54mf2c?=
 =?us-ascii?Q?k6T567RZzDgjcO/VnOeElTYRNDRPkEw0GXb0o3YnpQX8mKIG64rZcSKtpEes?=
 =?us-ascii?Q?XpTtpqo2CvOqDtirhocYlyfwGPy4BcRcQBFs5uQOvK3GMXaBcZUw3jXY17BV?=
 =?us-ascii?Q?tEXayHsN0S+vHwdd2knfQph7t2NCbBo17OMf5n3bJf+jWHHJQA6v4RkWYcjP?=
 =?us-ascii?Q?nB9KOpdOF0C9XyGIXFsD0MlXrWN3hSaWLWo4r0CgBpgpZVHplZfhK17Ljn+n?=
 =?us-ascii?Q?UJqSxoRMIgfFZggDRpfXiVD5lkd24X0sAKpBJjPUn8oX8PscJWhXGXAMHnfn?=
 =?us-ascii?Q?QPGZ4tLRFOwIq0qj9L+MWrA+lpqi+bCS5yL6zbJpUlVsAUn9sXbvu7OnPEyY?=
 =?us-ascii?Q?dWrgxQ4K+HSHH/dHi0iWYgOaoXWVy/oDfXaYIq+HIUJuI1AGKMpEMUGaiyxD?=
 =?us-ascii?Q?kavkCz/8shxyPnCZtGdmYOtjVm1dPwf9NKvPvlLA+4xNLp/KbCnza9GvntH1?=
 =?us-ascii?Q?Rt4d1cjqtP22dHH6g9XYw94x8lSTRfGIIwgU4YWqQBE1K7X7h0GeQc5fRc8u?=
 =?us-ascii?Q?5ZxCkVaVuu1g/Yn6vEPCdzdElx9HRtdyEls6Jjd0zfHfyPZYlYR+EY7M8B6+?=
 =?us-ascii?Q?wjp+Yk9UE5mNtdFAHz1xh8Kx9dgja56mCjPtPaaalUFYNYH54Iya1pizAO+v?=
 =?us-ascii?Q?j9YpC3eBgr9yCOaagM0ZP6BG3qnn8A4oEuU+97WKiNNtEWFPwW131q6WjQ6N?=
 =?us-ascii?Q?/L/gT3LmPoUf4EbhJXINwpFjBAS1c3L3M9PcNzrr19eCv5FE+gQ37XLROKIX?=
 =?us-ascii?Q?Z0FP17crjYMJ7tRFNQLcnFX0Q352H2zflrSzB7Fe9YZbBsmgVSvbqTPPQ5wQ?=
 =?us-ascii?Q?Su68g4fAoMhjWeVleBrRYqDHdgvnc9Go/AE7Iib2GpvM1qV9WPLTHdP7lMif?=
 =?us-ascii?Q?GiWkzLifzcnhNZWyLzHqV+cjcWpFErpc9H7bpmpQ22WFJg6mOmOcWjHZKLFq?=
 =?us-ascii?Q?ZJFwv5B1DkxiOvTMpjt5jaJCVIaLLdxzhZYFMqYqbc80BvPKUAENCq7xKA24?=
 =?us-ascii?Q?shIVXDU5Wb2W7aZHJyYbSIAya7048MEFqWY58J3jvB/LbCNK6Dqs4Wh5xvOh?=
 =?us-ascii?Q?OI+s9w3xcTlFjcm7GyV0fWx/LQTyNGjj3cAp021NnC9SssRDvT4G8TeS0GXx?=
 =?us-ascii?Q?Hymcf6s4swPCZ3Davzzpg83SJgBG6WeEO2bFcGLfxp6rwW/8Ns4SRgzbla6Z?=
 =?us-ascii?Q?wbwZH2ufiMF7Ea6HTIWgLQv2wYxt7rGfco0PkOCsZvYcwkDQGqFhy9qAq0Nt?=
 =?us-ascii?Q?eheEQ1t6MlJcVicphwdJHgCug6kowjn/mU9VlM9etHREJrrdS+SM1zI5OLQf?=
 =?us-ascii?Q?DCSQwc+xdK+Q3kCrNo+2YbAnfC310g4aPaglrd8C/AT6DYixsLZKB/NXgDso?=
 =?us-ascii?Q?DZDSx1n8YF6zZHkIDFzbAcSro/e/0KG1MGgnUK6TrGZlzOoDEtUI2BoJr9zl?=
 =?us-ascii?Q?Y59GBPrkWemyzl1qiYSFJs3Y84GEQxhJ3JDtoE7jDvo6NXDRqnxGdO4gcUGU?=
 =?us-ascii?Q?Xwqtgt3ePi6opY8f9WSuX+MF3MFwMjljUKLSHUVYlAyvuU/qq8dRXhGK/mZK?=
 =?us-ascii?Q?oVwhYhdbVN2UHxOCUNkUC94=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fb368d-2e98-421f-6207-08dba2d4c43d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:11.4849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ebuN0ZibiSYumkPGKYy86NfvsGkXrN/umDZRW6lN+sgNrXKmvOYWYIugZj/AR0WU6QqgMnpnRd/RSSna0WA48kEOrv+5KKKDWYkQrFCfcluah8792gjBkw/qjPzbud3
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
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 2acf4067ab2f..867170a10e14 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -1809,7 +1809,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE R8A774E1_CLK_S0D4>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.25.1

