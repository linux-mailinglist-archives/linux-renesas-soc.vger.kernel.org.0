Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E2B5ADED0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Sep 2022 07:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiIFFQx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Sep 2022 01:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiIFFQw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2022 01:16:52 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4987D54660
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Sep 2022 22:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuQd8dFLbR21UIsR6aafPdrIdLIdH3Vd6cBnTqVLml9HikUNDmIFup4VKISk8pXq6umQpwZc9gdK0FipI/yiBWy5mUZIunYDeGGPUjbVHU4ZXQTkkYkbtIifCeUwP07+7cGOw+JzdE3wybxGdy1TpgWH2DSepxQpQDBpUxj8WjBLU83+5Hk9MSVgZU/yyn91dSjLcypD02j9vOfPKKykTm12QuXiTQA/wNp9DVuv406OcC2h6lCMhDVEHY9hDm1X3Erfs2st1Vieabt7CvIUXJljZVQgOc2zINSJ6yst6oqcbf8Uhmua4dJkvNpd3FrP5v2sJJ1CsiuCH0ItaFoxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJ3V/ZCj9fJkWScpYsYkTAtBuVGxxGrs1pmoAVyl7CA=;
 b=Cpt5WX0gmA2okbSEZDpgWInHjKzXEwliDpzj+9INb6KMqDChHh4k1UIGDXcJZPdtK2yjvpUAcD1O7XKNVO0TTX/yHSria9Cl78V/1uwl269mxC0fShhrW5fEkvpOjpQMnqxFkL3sE1soly71zj/6T66HF2HV3J+9j54V76RPX/X4C2xqFJ4n37pOlz2uW4K7xaB+1sl1x4drFeDdksZ4wSzoVu7A0qD/G1gupsNEeeOGYwAhx2DcCD9adORiKid9t147C7MDH7y6VXA2keNiDdlC/7Y6y7pceew+prRmpVFMbIoVVgG5qI86TtoQ2kgHiJ1BVgpcK5haZlt38+RFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJ3V/ZCj9fJkWScpYsYkTAtBuVGxxGrs1pmoAVyl7CA=;
 b=GE7jwuwgdjyGGXiPa1UEqmQazhhOx0kd71oNr1SSkuMNi8QtfQSLSC7QEWccsIwgjxGqSWbwPZwr+ufyt1qgTo5e4VF12N+XI1mWTyosOmmVVmeY/aTYy/6ItbATqZuRnp+cdgbgRN6TsRzjgnCPNdSk5EVkw+SPL2R/BZ2L/a4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYVPR01MB10813.jpnprd01.prod.outlook.com (2603:1096:400:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 05:16:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 05:16:48 +0000
Message-ID: <878rmxf5fk.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] arm64: dts: renesas: white-hawk: add missing bootargs
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 6 Sep 2022 05:16:47 +0000
X-ClientProxiedBy: TYCPR01CA0160.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c35526b-ab60-4620-5f9e-08da8fc6ff5d
X-MS-TrafficTypeDiagnostic: TYVPR01MB10813:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MvZHNfbWVrdVhwVYwI0h+Se6vwzID8buMvrq2kAzke0vum1r9bVUPHmv9B2hucIukuRa8mjk/3M+UhqMD51odvmezvWHXMWPmSm0azm0Tqi13u84BSGSVit22Hoj5hdvB0L2nYqSfG7PDC+XWTGGUQ4TnJ+viDcS/JUfeK0H3MTULUnAcdQ8uYWKBETQPKuI2WH4V5TBrxzzi0C77ORh+gz3lWaSLRPqEsnM3VSMv+PEg85zK47flsZlGOFtGnq5UYROrY64at0iahoJNzHuZCkKLWE6CMXoHhSCG64NzBOJY/7m2Btmf7rNRbrpVWepeLOPAu2LLbn8kjRsV50VkmmIaeW/mzgSv8o5qwtuIGzfxk3f29EGcXgpHs/nVzv3V3qRA3Jx4GhLyAoSrTFQZ1sRazj4si6pBObP7j8dXJkYbJpnTNNuS6/6HKkgOWS21kFqN74oiC49Jt8ikZdE0HzDlouNzaswrtufRmsQfAEib/vsiql2nY8zT5TnvOSAiUpb4tt1vRUYGtdPPgKMFb2kFI3GSDdVCgTcE6o+zWeZL/0EXe0GWc+SVy3fr+5lsGS5hAPHRcBTg8d71KRuVy4m3cHARJLwCUatkl4sTNZEKRPRZIpWZOY3SIeTw8GyVm0w5N2PMoNN3Vs4PMzzToidB0b/LVeOaB+8z9tIlgBKc5MEsNXaZMOtnuDYBYkOXRjbs1ZqdWLUvImjmdP2axI7xBIh5MjvoIlnxQ9WopCDNQrJNLOPTnVm8z39J7v95N2yth/BNZlcc94UDwP8Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(478600001)(41300700001)(2906002)(26005)(6512007)(6506007)(66556008)(4326008)(66946007)(4744005)(66476007)(36756003)(86362001)(6916009)(52116002)(54906003)(6486002)(316002)(8676002)(38100700002)(38350700002)(2616005)(186003)(8936002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r5/cSTKxRxg1XOGElreqTkt91gcL/dWHHGwfg6NprToyaiawM2Q+4YTwsUVG?=
 =?us-ascii?Q?q2GCplA3BSNfODWdEZ4O8QQsXLvTS+Y/hOlhfAjQ3JFT94vrERJh6kcUEqwW?=
 =?us-ascii?Q?hmzqxA8+lBAQ+IMP9IXD66k4nqKpKMC/l0G4RIAh//MoRBnTex3LpmbrSX9y?=
 =?us-ascii?Q?2rsd0NF8xm/d3ft8K0r3xGjIjE36XVyQAXtOmmTKd3WXB6X3orUc8gO5Otu+?=
 =?us-ascii?Q?1QhhKeLBd0dG4Fl7KMXWOsgyPlUndN4gMebmoccPJdazWg6WFG6c503lyG93?=
 =?us-ascii?Q?CjN087j02iDLo/nlM3AiITnX8TSMx+UQsOZ5Tv1QrMUOG7ccO2NUHIGjURlG?=
 =?us-ascii?Q?noT+jlIRLNdfz4LyGCoTnOHIxbaIr4a+Ayhkvx9IDpHuPhdnW7NsdeK7gNi4?=
 =?us-ascii?Q?h6SIc1bHRMJGniYHQJ7bVJq4jT4rpaRWFfkEmFvKHZ3bT3vs5kMCMCgcPKyA?=
 =?us-ascii?Q?ny6FTuv8N3WR4NzWHcgBhXqbFOVDMiM9UEVemEtsBoknbDrgXmYxkOr6h2/Q?=
 =?us-ascii?Q?wekwvH9Pm344l7Zj0EwwR+c/3OdjMgKm6evGd2o3h1BCeqT8Blh02eBTjj2G?=
 =?us-ascii?Q?ntjhSBTpx45NTLKeWyOtJrj84PDkHNc7sz01wkuIU2UyP2F+wQevBAfSoEXH?=
 =?us-ascii?Q?gZLLSQCfGshLqM8KSRWCnCbK5fdqpQmfNC3vVoYm0E7RoP6nQWJZezWy6GjF?=
 =?us-ascii?Q?oecUFn5NVOp6/2BuSCn2a02GJXmlt5nejP78ppTMn8MSMLsW7lcne+4iAMB0?=
 =?us-ascii?Q?H3ntQGecGbyiSqk9xNgWpT/idtGL0GiNemiDN+CF6kVOBuFv8y1HXzhdWOiw?=
 =?us-ascii?Q?BG9supV6DnTqy1KYDsB5feeNdWKYTXuISiAbqRh17CgqfH3WttXMnHL0MtAn?=
 =?us-ascii?Q?SU90Zd/92uPmDyS4ypB3/wSDTZUtb1cBvhkrM77DwoiiPyPmDByDmRB8U+PZ?=
 =?us-ascii?Q?/Vf2bwci6aZAZvs5XWsXpgdIz4aeukYs/CAq4X2/W6vltmqVFwm3BJ9qsjz5?=
 =?us-ascii?Q?fazSekF8WWxxBTLWnpUGiY0ZDZFM+sBQwcBJirO3Rzn0N7+5FJcCpJsZG6j4?=
 =?us-ascii?Q?bgBxuOHL33ykj0oJuuLMKCfZPuS4lBxhtXpIkYAnJF3vyPQXFn2fMRlfpBr/?=
 =?us-ascii?Q?bvn017BWp4m4mUvjVAZ600xUW+2/QLqGj2iioLKVg7NI8KeUBH0a6NkdVv1/?=
 =?us-ascii?Q?RfmlsQyhe5Ro/ooTgwaY03oH/Wliw+7wDwkGJMfuY8CxhOoQi+wzry8BXxq5?=
 =?us-ascii?Q?pZT7moT3WD9E6gpP4z6pFsY00+CHdush68kcU3TIPSkx1wVSvhKTgIPfe42h?=
 =?us-ascii?Q?vOm5C6Bdp9sdmJJ7zdoutTk04DTvupgRLhG6Xs9Jy0KKC70WvIAnbaYMeHt7?=
 =?us-ascii?Q?tFWwHKr2HsDsOhU1Ck/T4YhuU3oamddHwJ+TGuXAkQYfKCjqvDfAVL6j31tj?=
 =?us-ascii?Q?JXZcHkiTNvJD4EQahjF+OJy/NbXiuzsnbcElCACxscSfG3gOCfMdNw6zwltm?=
 =?us-ascii?Q?RRITS/r6QfV/zwxzsNtMsPHV19QPobQT7qP3RnTpQScynbqq/ZBkL8cuBff9?=
 =?us-ascii?Q?w6UA0fVXUj2SCYiGE1pW72uSvdxsONvJ5Gi65V7NZn4uujbruvA2l5fHl0Sd?=
 =?us-ascii?Q?pPVJmH4/SULuNilc5OYOpCY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c35526b-ab60-4620-5f9e-08da8fc6ff5d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 05:16:47.8514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: px1Cdpkv23m8ETj+5K4CJJl0N5SMdquoWzgIJsz5BrXA3tlA9YyIXAFSuNH4MtQLBIi/hOtzQUjRom+ZVCdPY9eIUS8guzUshx9gY7rN9gMOlxr1zy7xCibusJVXFPgV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10813
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds missing bootargs for S4 Spider board.

One note is that current Spider board doesn't have Ethernet
support yet, but this patch adds standard settings for it, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
index bc0ac109b17c..34b018cd0c9c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -17,6 +17,7 @@ aliases {
 	};
 
 	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:921600n8";
 	};
 };
-- 
2.25.1

