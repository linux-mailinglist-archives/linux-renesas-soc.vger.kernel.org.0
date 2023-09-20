Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7F77A7226
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Sep 2023 07:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjITFgm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Sep 2023 01:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjITFgm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2023 01:36:42 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EFF90
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Sep 2023 22:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaHzZwSiuE52pmuggrRJXPkkC/IE0IPudgVjSwNeYwwaiKZhpJYabil716we7I+dAry3whKy2Fd8Gfl1uXU+ip0hWgErsa5yiAOdhJ43eXagBKemqUxyoALtatEeVcmJ+aUa8th3kikkdlOEW/+d6ac9ODv4ocMF/uUCbkuLzK7wzXvJ0x+fyCZJLFi27j+vXadp+EOlc0sROeWp1/vRKUz2XhwM1+mk56VfKMiyOGFk13/XJICtf0UyX+f0eMMiAZP2tWEeF5kpT1p6V5J7SSbV1/zw/jfPBYhgcowAFhrw672JMYfHwdXHfE/HU07H6JIfHIcPsHUkbuf8O4sDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTNDbNP2GZioHUeXzLIRjP0Sfav5iL1Wed3N27AHygs=;
 b=Sgib3ezVcCOxNDlW5tlDTzqIVKO/t0cWF6rzYRLNk+UbQaU4NdlZLj8p1xfc8Xo2c5kEA0Ndoyx7GxcRsuxL6hYcb+2hdF4fdcNymKu3MHi++QZ9yqRtktHlfA4ERTb0xEaX1xPaXH9RpNG8Madl41vtzIsooFhEMQXkOgtfRC/VbHAsWOAtdyRpCThvnd4jyMssjFgYj9F7UpAH++BM5JKordsRbdii3A5UPNLrET6ZywjV7kEejpQyXqARbHPDSD6JAtx2m1CRo28ScurCOLYTjXG+crg4VOms2r2KVsT6Lv2/FDiPZ9IYWcLlAuIYx6+TweiMBb987Vwn2vRjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTNDbNP2GZioHUeXzLIRjP0Sfav5iL1Wed3N27AHygs=;
 b=THcdIW+kBZbqfN+D+KqORP+s5jB2Zy4KKZpfGhncur+s+T4L6cD/bubWLcnuirHPXEGncTxbpbyweZiQWXwTcuQuerFS3Q5ImzQQwwEZtz6AZ7ogn/OPnJBr5IRZfIPL7ShM+BLva9RsVSdab3waACNWyjqIJMYP+llRGQG1wo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10340.jpnprd01.prod.outlook.com (2603:1096:604:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 05:36:33 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 05:36:31 +0000
Message-ID: <87o7hxxv6o.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a779f0: spider: fixup memory address
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 20 Sep 2023 05:36:31 +0000
X-ClientProxiedBy: TYCPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:405:1::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10340:EE_
X-MS-Office365-Filtering-Correlation-Id: dd61b038-3fe9-42a0-6796-08dbb99b8ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mVbyPPT0T8RbjUK6WK5THueEmxGDYjOlrKudDVIo2ON68KxZ7CA6HfNR6gPN3CbqBwsnX3PdoP2ErIW/e7L6cUWVEiqSRtnWbA+B7Z6e5bHIq8g7oOS2wAIK0DSZ2E6p3iJ83Oq/U5eDRMeBByKm+Akd8r5j3bQYskl6acGMgoVxM2TspvYarBzz7wVPariygHnD4vEoNkXSPPUjrZwqQHWlWWM88qz9Q3PR9F6FiSVNl3620/CoeFDvVrgVPkFtwLWYEBx34M9Ty9jFFt+IsM8n16mj4NOcRA8QDCrhElNJr70wpZffMOjJusdx2EhGCHWJs4ejwLeQo96nLZmbFa/m2y92RfvXzLzmKJFcxS1ZXyEZt2KBsh8u3mOz4g9GAYgxb7AxMghLfys0PRznBU63KjD7tb8QGJPcDEoYIu69xxAR3/GA8hZzBN4K6sDguqYNeGMM6uIeZaoS5bkfbdh3GYTbAiefHyit5a+nxQLPuU1AFacNw1vP95THFR4EhAcPfYoVB5RfDSkGibS/GjrnMwx4/CfYVJrl0Imppn84jOdwNunihS0iuPETYBRwM670r5oRUUaRWf6KAjoXhrHDrawnJ42GQjLmS1DwIvoKuqGY8Kow60fzD1lLLg51
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(366004)(346002)(376002)(1800799009)(186009)(451199024)(478600001)(6486002)(6512007)(6506007)(52116002)(8936002)(8676002)(83380400001)(66946007)(66556008)(66476007)(316002)(5660300002)(2616005)(36756003)(38100700002)(38350700002)(86362001)(4326008)(26005)(4744005)(2906002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ndpzMSVUAprNxyNzeJvd35DTxLG6f3U7VRA+09FsT62nJ5YO/nrfVWavTOdf?=
 =?us-ascii?Q?HlgbualNZUL3tND5ivL50wpc8AxV8rpnKKW+DzxAovU94ha3ZKC/50ARVs3R?=
 =?us-ascii?Q?o5f0P5dRVFp0+MEGL2eujF39yge2Nunnsrp9qTaZK/6LcZC98JkWX/rblMyr?=
 =?us-ascii?Q?TVoPBXz9cUZ1JxFyw+3CvDt/zkhy3RVfC94aE4kapmxpCjI9kbzY68RsLC2w?=
 =?us-ascii?Q?6LB5q/ZIInEezUAJEv9yi63QQNiF0hIFasfZ8tYjZMI18f6mz4xRTTV1kjDs?=
 =?us-ascii?Q?qUwwG3hEyZIaFMlf8mki8pnfVpDT/72Z0k3eeMc5MWbkKuNCRE2HO1lGN2bF?=
 =?us-ascii?Q?dxZA58WcZqR4WAZ1qm8j4dBwTcdcAijDjBgcf8eAWKOY/ZSAJ7t2H4C9ABe+?=
 =?us-ascii?Q?xlBRCinjaledwN48y+Ac+UKECueah8W85xtUYfaCuRhtEQJMfGV/qSE/ii1k?=
 =?us-ascii?Q?yCmTjOr2gvMPj+FKQAwjb9BArLkOA06tZkpSdPZnAdVvEmOfzrkotsD+Uf6d?=
 =?us-ascii?Q?MaTsBbJBP7USETWgEwctyDHhWQuBYqi3E61VKGgmTzflJKD1hFCqTsQ/vjOm?=
 =?us-ascii?Q?3b7FN6VrC2QCmgBXA6p2sSuu9YYQWU7JKQcvZ2kBfhtQsYR9NKz1VRofpMVs?=
 =?us-ascii?Q?6nJ5koOAKwBxBFuMn2SZFyKrxCHir4zirzZzF3TEfKuo50/gaoqBCVI8kPCr?=
 =?us-ascii?Q?fHSAOhRwyJr5O5bbGPWDnswHg8rkbSMS1tCXLrmnqDLmJQJoj83vd9V9mXac?=
 =?us-ascii?Q?LJCzzFJYEF1uR0aieuv5T4OrUglr6vHknxpopaJyY9KLxiH72S6HRZ3VZz/d?=
 =?us-ascii?Q?8rE2FrHLCuWo7phg0XqaNN81AjitkG7eeTcs1ODsqgANR8EmQaWMYqfPMuDf?=
 =?us-ascii?Q?Qm880szxp0QYKcaGNGg6KrHV+mhltYVjJ94X17GPPZFhMIbV/J3xkV57cft3?=
 =?us-ascii?Q?uJylwqd+uVXpVlFcmOxguE1f/jt18crY1Qw0nyffqfVHOEQxi9QF6UyWpCy1?=
 =?us-ascii?Q?0/f45v2YOZWOEYb5/luljtM7DUq2UD0E4jwgTA9dcEdqdz0lBVeqAju8Of1R?=
 =?us-ascii?Q?WIJjeptpVeDmdYtOmrKMFv8sL5fCB8g6Zf5BZsux3dXNAJ22+mQHfOkrW/hI?=
 =?us-ascii?Q?+sPd0aMItBlmyUuAJg9hJKB7T2zgJVmVXz+kNXiCYSr8fvCQFdsdhL8NktqJ?=
 =?us-ascii?Q?Q9/mrzvq4afSrswWmz1K2ROigalI8k19gOZ3J92CmANkKEJ8bxHmGeCCkdL+?=
 =?us-ascii?Q?MfMMPoCOhcBV63uTWlX9ZAlofQT9lOUx8gEU5q9+i83kQ39vqGGpSQcse+wA?=
 =?us-ascii?Q?nskF8P2/kMAwxtoOvqpfPiYL2IbWZGD4tLMJZDsXrySddMdlFERB416/udrV?=
 =?us-ascii?Q?VIthqnLhoPFS5xJ+yGiCUVf2niyt9V8oQs2/1F8W6jR+f6CSuqux47ag70VO?=
 =?us-ascii?Q?cxvLavmmqHrSe6cKnSXGx9XDsk400fvPvXpwbMg1HMXEM+wSXy9imzOflsiG?=
 =?us-ascii?Q?AottIGqqyB+dGI0Hj8+ub/oftjUBBJoRwij9nCdRlLgSOGP5wc/fChoHMgRR?=
 =?us-ascii?Q?YVw9R2gcktNq3QCg8G/XYYivOsXJQfKaIyURlyij7mkbRFra2rFwT3zCUFAr?=
 =?us-ascii?Q?qmlrsu2LanZ4nBEAR6v7g6Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd61b038-3fe9-42a0-6796-08dbb99b8ba2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:36:31.8177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhv2ERO+sDW4rqdW+HoNCRoG5ylcLCP1hw55Npi91l0q4YUZhxuEKhbxlSVAPsY5CW9Oz983EiEZI1lAq2lg1JGFv0zz/PAucTgNkbD7bChnU3Q4PeZlRrpnCYonHavZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10340
X-Spam-Status: No, score=-2.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It is using 0x80000000 instead of 0x480000000

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 12f2a1db4fb7..5dab4030daac 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -28,7 +28,7 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
-	memory@480000000 {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x4 0x80000000 0x0 0x80000000>;
 	};
-- 
2.25.1

