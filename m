Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33D759CDDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 03:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239309AbiHWB1S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 21:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239271AbiHWB0v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 21:26:51 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05DE5A173
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 18:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0MLsAdYjdKObQ044+5i2AvAgNyeEepZP8MXJGSJgZnAaG9xg5/RiopOB9I0OSuvRs3L4cOxnIdJIEQ7Vusib39N+UpjgGM1MjYUFuEueQ8BpgL8Xvxg+CluWSVCPbhMDreKYlaC0cHJgfs38Ar4ogjJS1TFZGxL8RSOBLNmLXwNDsRj3UoIIbOf7tNZ379VymuzJYXWnCPB2nESdvU6RKJEbe/fc+pLtP9fpdlLqm1slt/DA07RECi+YLwhWCpuc/Z7vaX1Zlz58+bFIkctgg8ElRit830rS5k7+e6+8n/EKAhGVFlY1Ml4uJmD2tSvT0tM1yDr15ttx1cjAO/7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwPICUON4dsw2l+lsLg1NAtq3Nep4bFiNc/PQlVYZ8o=;
 b=klI9FHQ7V4pcdq9IMvyFcHuktBiTZ4tSP2sQdlHLel1LzQd3XazGEyikcVStx4BP4xfK/V4w3jepINBAqHz1zCaVYuqfWSmCs3mOp+4aII72ZeaUQBNiQMNwDyVwQN5oLcfHoUo8VDgkz63Lti/VAMqeizXZEoBayF/Sfrec2JcQDPbztJ4l9GUZ06OK8LL3rZzrag3TKR/aA3euLHPe9SIkghQSodJMLUrkYbXr+6xJJ6UhBwW8gMPjklv5GMnuBmfGUGMXuWTKJ2V5bmeNoCDsIFA2xJ/H2CB994h+hWGoU7IUk6SQ52hRDS2H5sCR5r9WiMi2vgdnzV+vmr1nYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwPICUON4dsw2l+lsLg1NAtq3Nep4bFiNc/PQlVYZ8o=;
 b=anFMeV880MI59o2XKzEceo9UxzoPyAG6MptqlO+FWLs7hiu00fafpFkCt/H2QXe/dXLnP5VshSvp5SXJ25NJmH+dp33mLT/cSowMcOoHkE+7ujVtb4GNnPJCVCtdaSrOZjUyBYAlbmG23BsaR1m+namEpovlSDT9VbX6/C985CY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TY1PR01MB1627.jpnprd01.prod.outlook.com (2603:1096:403:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 01:26:48 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052%2]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 01:26:48 +0000
Message-ID: <87tu6392cp.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: Add V3H2 Condor-I board support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
In-Reply-To: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 23 Aug 2022 01:26:47 +0000
X-ClientProxiedBy: TYCP286CA0075.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::16) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c08e8db-85f3-4545-08ba-08da84a68bdc
X-MS-TrafficTypeDiagnostic: TY1PR01MB1627:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: swBly1n9zfQRVut2oB8BFXi7syIKof5SDMZYCfIFQbm3JDr+U6eMBz7qG4qYOJAsyl0E8xZvrHccjPb5aVpjO44pBEjBCin7RJlMt7VuYfxcIrsaYHFDdIRJPIPkmJ1DS5izWd2ZRDXCvQJF2wrBeqi1xDuu2rHSuCwS5L+De0qbTLb5x8yEJx2OtZBEgE53f6icVr/q1Dyk3GYOqbNOlkqOYecx/HTlCoIvokUoBsYYjhvs6C9NZGMlgDo928uEOXvEg1zkd9IMsVqePsl6PRnQI3cEkHojHvk0gxsszyq2t6foeUidbWUESkr219pVUfz77L+r4Z/8qOmTqOrLeJqUzS3LU+rLzxx/LTda4snTB+8Jgi6aWlAOsFsKIomuGbzg3M8eKYodZ+sAhgPLNbyW6ArFLvyxnRk1RrFfmgDWw+CyEBFevWabkfnG77i5j6Fkv7bX20L4o+EnEakhc0uep5U1VEE6X0if8mEpeqw+KrqAPsMXrfN/C1FIIoqdLjTek7/82S8qMMWQZWgavws5Ivhok6iPwtiw0o95kmFoTc9wVX7rWC8HWziFDjVCFBqK+VOH63jooMCNFkEAhQIkJO5qQHUQUAA4wFfg5AXcWAuoBeaz29dGe8CRWM/XZi42eiAp2FOGVY9AT0QarKbGCWMLkPTStRybbTVEbEhBD37CaOI0s0SgnlXxNwYEco0d5CeuRV1+qn2TW+YzndP2Hs8VIAnqzvtRzSXOcvcaaMdHff2dCwCPKTTjgkKsPecpg6vFjMWtAijADF0m+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(6506007)(6486002)(107886003)(41300700001)(478600001)(186003)(6512007)(26005)(2616005)(52116002)(2906002)(5660300002)(8936002)(316002)(54906003)(4326008)(8676002)(66556008)(66946007)(86362001)(38100700002)(38350700002)(66476007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hB4+tVCZYuMdH78EPHyUODwDyjm9dyc/lW9jBoU8BwzRksvfNa39hFTjNWCq?=
 =?us-ascii?Q?NC94ETN7G25LgRRKTX3SEmyjEg/qloDLGH7qTjb3HKHKPgbwujusDKfFKyaz?=
 =?us-ascii?Q?kLAhA7IaI0Vgwe5++2xj0mq4sqVgrSWeSfbzGzCGm9bsUtfNMHrsU5Sk7s2/?=
 =?us-ascii?Q?MNo3EEbHFxnKnXFRBbOTmKq4mo7iQwbxhUXSCwplVFuVjzIbfetjpu39WjUl?=
 =?us-ascii?Q?xT11f9uUtRIno9Ha82Pybc5tSC++e2fAh4SqYrHjvgsl7MWJp8ZP6FPFJWKs?=
 =?us-ascii?Q?Uw2Kxx7xu01q1ENqTJvrkMs9W5TheRQvBDunaOW+nBPko1dwP0+TAsnP5mqI?=
 =?us-ascii?Q?ieD4k1jNrnJ5tCMok2Dv56brtKNEKJ5/pVgsYmFA/FonNHeE9F6jRMt7bKY4?=
 =?us-ascii?Q?QpDGnQjdhU3y+OKYEYmXaiuJFTE+45VGElMrBOIfIgkMVPDZB8TKacdpSJic?=
 =?us-ascii?Q?ASR7fHw3Du5pzfNxt09EUxy1SO39PTrwwutPYXciisT9/LiL+lrrxR3TdhYX?=
 =?us-ascii?Q?ks7zFPlEaHtI8uWAtX2dVb2Cu3kkjt0KRspdR9Or2U8XUhwI6Mq/lAGWa2KT?=
 =?us-ascii?Q?na2LSzHvcqKTbpm/MffpEuG3yJheJB6nymZWtRKsFw56wT1Tkf8R476MMee8?=
 =?us-ascii?Q?GLAgwlQZmHPhsXCcvw53XC9fzwUOjFmaE8wFpPamPRknWp62N7wivbSMsFsd?=
 =?us-ascii?Q?fqMMl5R5DYPRkPb0Ym6BBc5YVInOjd2llVd5SHO/5VxBFbdgHd1bBIvAhqf9?=
 =?us-ascii?Q?WZ25dBD/sZCisiJpo6MXB0iXgcVhNxfTGDS2yTO0Q6DUF8zz5lTtmmzLLKoc?=
 =?us-ascii?Q?H4baDMCV0drVPLJyUQeRLJxFa42gkDjw3qzhPwWjUZmBYgaogt1Vj2sB2Hzx?=
 =?us-ascii?Q?97eRTl7HCnE1CoFnVeRis2LLp0rn7M7KMHCqVHdbza10nkj1fJwf9TK2S54v?=
 =?us-ascii?Q?rm4YYZGFLJNj8KzgXugMCWLP3S6FjlPpVDWacgSUKLQwsuLZvWCtjHOTdImZ?=
 =?us-ascii?Q?5+t4PCdKy3aKbCQFhka8S8JPMlZs4/D/UDKTevm2KYw+LQqLia/7/yfysC3O?=
 =?us-ascii?Q?8N5SWNOl9+UB/oTO3ScgXXDdIwGcJAFFmkwSVnyw18RXYZb0XyrVCayztMdN?=
 =?us-ascii?Q?uUDPrU02R59qUWtQMGiaXy6BqHqOC6T6lEIzpCcZBZvCE/L5Mx8KAHcAVEfK?=
 =?us-ascii?Q?0/HGsZlFZRKxQDTo/8B68rvxLGHYMidO4aQJ/5OejimAJ82V7D+vT6YaHEB9?=
 =?us-ascii?Q?C/qdgpN4ixUIwLLF2Yf51e+ayhFqyJM+OoOIJcjUtT+9gapzpU+U+tthtWP+?=
 =?us-ascii?Q?jjE2Y4+QHbNNe34t48nIizostfIHrYBb+b8W/URJtZqjpk1jePuF0BHvZ25m?=
 =?us-ascii?Q?Hai99v2xRbTiWQ2wpeB/NS0pxJWP2/OtyryQuavP3gAqaT14SVwLQ5s0uSB6?=
 =?us-ascii?Q?sYH8P6F5Ay7M0j401bxx0ECcYYBaodUqGhr/NjovElxJ1zQ4la+ecv/UKjFY?=
 =?us-ascii?Q?ypY+Yg3T+WvOqQIiAtMs24UTWLZfxOlx1XJm264UtHnu7mlnVuyS704dXKj3?=
 =?us-ascii?Q?MkHZ//QcBOmLLjlhvr2tFMAee/48+D61mS4Zg28Sw3yIJlBsKojkV10WbDO2?=
 =?us-ascii?Q?cYADHK8xX98PVXmNK2G5wfc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c08e8db-85f3-4545-08ba-08da84a68bdc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 01:26:48.5533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pw0Fg/lgArKQnpk3CMxUM24jHyEvxH8pW3N5bf7M4Uk1nN1VOP1CdaPk3K6sWD8LZarEOwrLEehVPg1VYf2qzgl8b/udYA3G9iTPq3cSrPDFfir1De9A1vKLgVUyAke
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1627
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds r8a77980A V3H2 (= r8a77980 ES2) Condor-I board
basic support.

Signed-off-by: Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile            |  1 +
 .../boot/dts/renesas/r8a77980a-condor-i.dts     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 7a647860ef35..0699b51c1247 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-v3msk.dtb
 
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-v3hsk.dtb
+dtb-$(CONFIG_ARCH_R8A77980) += r8a77980a-condor-i.dtb
 
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts b/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
new file mode 100644
index 000000000000..4c572d916ab7
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Condor-I board on r8a77980A (ES2.0)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a77980a.dtsi"
+#include "condor-common.dtsi"
+
+/ {
+	model = "Renesas Condor-I board based on r8a77980A (ES2.0)";
+
+	compatible = "renesas,condor-i", "renesas,condor",
+		     "renesas,r8a77980a", "renesas,r8a77980";
+};
-- 
2.25.1

