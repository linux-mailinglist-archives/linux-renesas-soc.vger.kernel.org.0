Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67ED9783999
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232621AbjHVF6A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjHVF57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:57:59 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4205D185
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRRYy60DR3vkukBbu9QH2mrQT9WI3gaUHaaFekYVHAVeCWmK/278twi5AK3nPVrBck7pojhw78LZPhhiHSEhJxRSYOi1oAHggceMrjaMsvxS7OD3Kk5R6tBwq2Vw3PJScFZP6nCr3ZH1jFjWfGlwndS9mYCVKEK7fPAxK4yYTRl1mtrLnoWVouqmJmOPCBMWmcyJVpxVFQvuvwKIfZZhDAuuDeVaUEdMqts2Dj1Cmw1UgM2/ChKBI6o8Ez69sTUNOYPM5aqMn3olf1dDjLOTALnN+or2Pg7M0Fn9nXDBF6W6GwS6GIoLqfvgYS3O+iwfSarpzMj3EC17DV7h/SEnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JprmBziOehx4EZHLRTW8ELAysFSbgurrl/cATogBMnk=;
 b=JJlRuSUvpe3rQ2KRK5jSS7QMYouTQ87/teHdWslDrSIddmp9+WSSRxnlJ+kJ1wrBOdfHHpUFUx364pfWTqvn+njL06PWmSGg/ZxK2GzFLDpySC7w9KDlN1ZtTekgSyfRRWgyeNPmmo+x69dsfOt0IQb+g3fFvlarmx70exrMPhCRSR0i4GT2uQjEX7JtStQboG5QnuETnPqekffxJ3TUBQoV4ulWRr0BMxU7nAcF46VlW8OVQgzgzC3n+PzVUD1UqDsZMWwfHLpE58lVMnFgyWGagORMrQV3tgvlhPScWiQluhw4Ksw54KgM3cqgHk02HYu/mivQ7qbc97UidBs3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JprmBziOehx4EZHLRTW8ELAysFSbgurrl/cATogBMnk=;
 b=Ljxk5C5IyVnewd0ttbZWyU5+A3AYQvlf2PCepJNtEix73Izvh7g/37ubGpnSm6UsZVjGi5wMj/XyhlCvFMVmF1DO6or9pDMQP8RegxI37sLYNjccoSl4s9QzKMZW44WzdfDdX+u5qCtedQfC7GOQ+bQaXs4lM/sHmqL4w8jUT9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:57:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:57:56 +0000
Message-ID: <87y1i3sjoc.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/15] arm64: dts: renesas: r8a774a1: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:57:55 +0000
X-ClientProxiedBy: TYCP286CA0191.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: 68895ff9-e438-4383-c441-08dba2d4bb13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igFkHrV2Uo/gntz8BSt3WH1eyyh/LZkXqmqwGDKbG6XldNqdKzqzdiBct4Q7jTyHEHB6MZpF+8mlw48SV17eRsBR+ueHvK1lnYqQ1MgVECWVkBI7ALESNkjGGEOoYxoCQDHovMpFv+s8rVQKwlOIyJ/Xe2ovWC2A85UytxRjYK3oNFn5d1ewH24zI0rxUWZDlX5qezP5ZilCYM7gio3GjPAfF4rqXfLF4jgFKrtw2jvDO/hHoEhRKQ3b+ed/QUzuKIfnB4rVAtN8tRgzx0RA8vvOT0crh4ROpiBD53Wf53VpUtNeGaXstSpsiRGsG+V0aZ/+93QvmdQ8YLfPa+RGPgsSfRYoPt9EkDytfMWt7QC9Bs27824LvPo0xIzifQAT4u2NUDK9k/wKrN1I1QnxdRQeqyUEETUKW7xKA5D8fsehr44kAMTPLFlH+MHMMG992g3YYia7vpXDDHX1/OGoxZH7P8xvm0sVglGkFfCrbEbUuFyNsPPsdIv5ryEAJ3xiyjlITDjK4hozquPyLZBeQficxSLllxZh4aDGTRb9HTA9+ITTj0BZtek+4zTFtRPGEyVU++rx5+3O1AXd1J5KdFA9moQbQmKDfJygK/mOvpWt5BVlGixJz/RYEQ0Qr8Y8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2wjEAzc7L7dOq2LlXprxD5qgskqg1w31E8Lv0nvBaf34PO1gIJ1A6KdwLleA?=
 =?us-ascii?Q?/XTeKUCaj3I0R1p1YzFhK0Ll1Lou7OgzvBLngtWVQww5TujIlS948c+us7pT?=
 =?us-ascii?Q?cDeQDBE5S+U9J4KiFTZ5DAMf5lkvZpZMdGdkgr4rIFDUZc9YZvq+ne8Y5s9u?=
 =?us-ascii?Q?sEOVLgau4V7wVqHahydcYok8yWx5Vm3PAynduLEt+5J+3hi/1YWyIRS9X+Hx?=
 =?us-ascii?Q?FE2KAl5r+7MJDxA+y6rGT19ZS7R4BS/f3nIlhvbgsdmU2SnNvhdLC7DTI9co?=
 =?us-ascii?Q?8ZH93xBqp4CVM2fJNloi0hyH1UPd5RvKheKL7zz+fhy9jerQOOMp6LFd8lWI?=
 =?us-ascii?Q?SHgEBiE3RaSTuOfVkzIvrDQBM1OT2iMhAztrKBFXd3+vYQuagrY4Ig4uVeSh?=
 =?us-ascii?Q?dLMW+T0veZnDjGg5N2Jsknwv/m9qM1aff1t14flnlUE2Hd3W0pKOTFflDvHZ?=
 =?us-ascii?Q?pPPeY9tclF9usmKWadkVRLcsfB40sXb31dWnf4SrZAUe3X7W62DtM1pk6fd+?=
 =?us-ascii?Q?AnHcEiKEWXS7pPV2ExJfltKbdQX0NrqCRBTFxcMl/aWyEZLCpcbXFqChUjMp?=
 =?us-ascii?Q?ePyLi1S2B8SMfsk83lSrf9/vjBGEwhYdHL4jlLNvv+FT6ugi1GyAEChzTUFp?=
 =?us-ascii?Q?7qIFsGzbDBc67rC1GNIVGn5MRHF/2Hn0sfxfHyJgwExILTNbmi4PDD58VFw/?=
 =?us-ascii?Q?W1Q+hvID3zt41v6gRS5bPvDsya372/u6qwutHHnhoAxHuJh4UrZB8uVpS2aW?=
 =?us-ascii?Q?yOAP64+6wazifeFKT4LTT6raneLW/4Ky6fc6FUGNTf8YKhf24TNzl2vA6o4E?=
 =?us-ascii?Q?wwMrlp7P5C3wnqaFLZ/fhHUOeulcvJMKBUUW+LUuJ2s/gkl1rbMlcMdhxcZu?=
 =?us-ascii?Q?eZlPPGRQrxRGvZoNR+92B52bd251E7H+js05TLgyg+rxPWsECXCCgekeFpP7?=
 =?us-ascii?Q?G6qLsD2TUM9pEZdmQ1YVYVS4AZC/3lH+OjYyS+tFgtV6gQADb/wzwxRU1L6a?=
 =?us-ascii?Q?JDwLNVUcIhlkIif/kW9ObZsSVVPlBz9acBWusBLubIfQUXY74ygkMbtLp9fg?=
 =?us-ascii?Q?/hruc5fluHS9ofzBgiry0lZgVEUGIeX8GST1uQMG8nlL7adTYOtdiVR6+nH8?=
 =?us-ascii?Q?ONdWI0qaDOx0DEy+kEJzo6AhER6Gp1d9VKOWTc9hJeB4huDdaGkBU043rP9P?=
 =?us-ascii?Q?8X58Taf3h4P7oofCbTWQO8k9i4V1jqT/11g4ja1KhlmzhXhFjVaDSBanOqv6?=
 =?us-ascii?Q?TS23kLY/Dg35yWOpiAkmI12Z8K7QJT3iwIssTAo5c2N1FxAqO/RBihEIp0jA?=
 =?us-ascii?Q?LGkBpTyuzOcUr5rjak8LmGb7oSZ4+7f9Mr8Y2HfaMrbu+EX9Buzh+iAPbYbT?=
 =?us-ascii?Q?g7T9B8SZLYQOXzFBIcVEar4wUUVDivlwsg0LR1Nr2X8sdemrygIPaqpMhyF/?=
 =?us-ascii?Q?6w+Q//F8HRU4k6Mehrww7ciSG1sObw3eeUI3hpUT5TZ7Teai0rPYnejVTKm1?=
 =?us-ascii?Q?R805ghDYHOokGDV7V8zleX34N0YCxrJXAdYRChN403BwzEinWwycEOOngFS8?=
 =?us-ascii?Q?4+jAdirL4RG5/VlCe907V3myR5+PHcxNd8M5xwQy1Ct57UhiSR9Br1BQZNHg?=
 =?us-ascii?Q?avdw1dim8rWkP9Fa21in+ug=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68895ff9-e438-4383-c441-08dba2d4bb13
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:57:55.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxHQaOzbbUQg51sEe78veK/gj6iGc+gtf9g9BOzV3mzrsba5CLI63bNVbl+5efg8zlaCeaRousVgb37f+dHlaSZTqV8N50zmF0yDFvlB7Tv3yeBbo8xGgz1jSfZmXmID
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
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 9065dc243428..a7b7a8cd5bf1 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1713,7 +1713,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE R8A774A1_CLK_S0D4>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.25.1

