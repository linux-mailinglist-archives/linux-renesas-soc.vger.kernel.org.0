Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E08D45A5832
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 01:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiH2XxM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 19:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiH2Xwx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 19:52:53 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20719.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::719])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49ADFE0E9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 16:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lo4eg5F1w+4SBPPAHUcoOp2Pi1Z76BuDZvDko/TujnQBleB14xpTMsQCTCeSRecvMMqUuJ7Wep+Xtc8Q4kxRWU9m15NAaqRsUx7BacVX4tJ/yS/JMGtSXHH0VYCD9JUb32tnuSh3ixpqaRrwaDdXLlazKxLlOodM7Z4F8ZH2jUk4xPCntWdr2eFJcun4+hcQgWi4XXg2QYRkcQJkzImfdWdPMQEDH8Kv7Q8545G1hypuhSYUvnBfvtrUXS1jbcweR/PGtuGzogkCSMTgLdbks2V9HpNWhjru/QAgkEyplpMxBvMbEQPK7fG+HCHD35+hikNta4DW4h4abQVFtWbsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eZJSV+BMOV714NtzFZ9vx4yV4nrCIiJx76myYSGo7s=;
 b=KeiUXH4NuUSL6YQco1gLBXd6TmWeZyAy0n0DQefFa9gskmAv0ffJNTcVke4t0DnZ1OJG+L8Sr7TcvyxkwuIn5XSI6zQtgZk8cXvOPF/pnnUlet7ohgcXFrpPb6kt1wiGh0lb25ROkTKWkuotQWWfd+z+efOwMbR1cycisSnyowgZEOKZWtPxSuxEibPM9yrKOY38h5xhCSwbrpOUWxuqfQ0yyD9k5PoSR17mXZNHEswAl15woq0kiJMTzOfXKbxhRlkyqTfsBvTNgWtSTO0u9i0xv5EzOQIGq7QpOHkcLPzfHlKGR7g7y8Lpg/NXBEaN1j9GuiD5CMW11j7h/VjV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eZJSV+BMOV714NtzFZ9vx4yV4nrCIiJx76myYSGo7s=;
 b=HbDgpyvDkcwBsNbydFWQZ+O8+XI9JgpqKqLY/A956Llcw+j2TNQU3nJRq/Yy9wlYtwHI0OiQ1P7HOSnYLRNQ+V3xTqWO9YwLx24snFnk58zYZRiI1DpV403sUSWnAgAgnrWvaHNt7GyyX+a1Tfyw4msYIqFkaorNmZ6hVbWmol8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB4218.jpnprd01.prod.outlook.com (2603:1096:404:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 23:49:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 23:49:16 +0000
Message-ID: <8735de626c.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PATCH v3 0/4] arm64: dts: renesas: Add V3H2 Condor-I board support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 29 Aug 2022 23:49:16 +0000
X-ClientProxiedBy: TYAPR01CA0017.jpnprd01.prod.outlook.com (2603:1096:404::29)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d522bfce-42db-4d1d-f990-08da8a19154f
X-MS-TrafficTypeDiagnostic: TY2PR01MB4218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YWbnmxqwh/nonml66VCCbyHhDX73X73gFM/ycEneWGAeaE77MY1UxtKCqBascKWKmFdsC1WUGc3epkRuv0iRDn0eB6iOsRaT/pLOdZIxEajyO2zjShBWTWVE0vofSeFCv6LoRagncAbJ9W76YN0W+VN/PzcTmILB3dDPTmlutaIjWmEz0Fx/NwwSCh0UmoTirS36yJ2wMH6WN5HmjIhoMjXmj6mjrmqy4ENMT6fFmDpKxB6L0RRO9bfGD3ElpPsTT9IScnqg1R1SoroIwl0L4AH/7tPaqdu2poKTr9wV/oGTVb3vdw12k74bfliEy4N/NXNknifJpasfl04yolZ2sQiCAsxcMzsGRFTmVgZkVTvq7nJ5EnEF+qkXgFDaCU/jhhtzmplm4MqMNpyw7TqLXMmM3xcoBDje3DDg1AtXPb+S5AceeyDy/2O9+rsfRL2wQ5j8d0GgfgyVKH6/INEpXqJLssrvxxf5urE2gjKV5JXnMuVkyuNPtxXeMSYIbzGV2X4cg5yUiJ8rJMbZYNKxICC5lJUJWGErabcY8Ni/AA7Zj11AQMC8G+yScDbZk0WiSgIrRyvoIpLlmSQifAChl37aL+JF/eoa3CH4Or3NtqSnrPZT4vPPnOD9Fsuc542LIdr0uWdVcBCJiAVw8zg9dpW7BN6YNsez57q/ukAr7yNY0p6YT2fKzGAA5s85Jm30ej1ahkU2QaEt/kvTc6AxIVyxyxrivpF3E2w6XoaXm0HrKCedgmvkrDIFKqNVFPAnR0UMOm+IUW0bkwi2jUzdWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(186003)(2616005)(83380400001)(2906002)(54906003)(316002)(66946007)(8676002)(66476007)(66556008)(5660300002)(4326008)(478600001)(6512007)(6506007)(52116002)(26005)(6486002)(41300700001)(8936002)(36756003)(38100700002)(38350700002)(107886003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?erF87i2gBhgamuMcmCc2UKD8myde5SgHabT4Eepp/DKpS2GthhP3m7a5BLOh?=
 =?us-ascii?Q?t2A0d51o9SLyjtTZ8tVgkpbWvkNUHrE4K2U5qeurHORPfrdoAKivBO0WRDa5?=
 =?us-ascii?Q?yj8mg7iecUGi8i9nyObkrhJQXR/wTIuRrXk0XhjRyXp4df3tyuacLEgxh7Ct?=
 =?us-ascii?Q?vVyTRIORz1HkcmNzjj4Q7XUOOcG4KmQ0e4BizS/JE3BX+i+L+DCFdl8rqxUD?=
 =?us-ascii?Q?ICJk46ISdsOKOi3C9qRUikFcyMbjFVsy7bUjUoJg4n4su56HGHUtqJp6SvSh?=
 =?us-ascii?Q?mcqs6O1CfXsCWKweLdVasSmw8C1yBBc7VcFTAISiZxs175CzMk+VkVNq/6WW?=
 =?us-ascii?Q?HdBy40+adjmTfJeUyAIL3nML23LThECpHznYaEwVSaMAT0+WypUNvDobWRXb?=
 =?us-ascii?Q?0U0ptEuj1xjri7ttbj8BiskB/XP3PxPxwnfB1wrXt/JShQ545lS0rNe58pj9?=
 =?us-ascii?Q?X2Mwq+zH/1Iq+FU6UOIk6vtYQxlECULZT0VXs5swUzEKBm9twbgg4xzj2a1L?=
 =?us-ascii?Q?6jd0X6DGNmdMmDn7/nXE9YML9wTDEQRQv5dy8as7GOy+F6folxtENHftoFTN?=
 =?us-ascii?Q?Gap6x+k1NrE+ZueT0LL0qEUNAuwGNgww4DJqBTxHesEMwfPeFVH9XmKv9TqI?=
 =?us-ascii?Q?ZS+hfj7e5uLlh/Y6OMWXswBK2fiSI19W90k/v6g6W5PVNbIU9TaSuy87oBkv?=
 =?us-ascii?Q?FNdkeSu00z4RDvBpLcYg+NI+2UTAkR2l95Ee4da+ZhKdeJnlIg7M4zCZggko?=
 =?us-ascii?Q?tifktb8qr6BjCGpm+jFDf+DutqXoDveRzxS6Zasxp5O/u5ki50ZuaK34d0aV?=
 =?us-ascii?Q?s+SG+4NmKE75oO7tYdJPyKlmr/lLGEkaxvIJMtWYlSLapHptrw+Qlkej6auq?=
 =?us-ascii?Q?KKVCKVBx6tMLNSTpA35jDNKUzDaqCKiUJ93zgfRSGKiW7VyOUb8SXOnkp+4w?=
 =?us-ascii?Q?yMHNQ82g6VyAZJuWjO7fO6ii4M7Adh0bYWA/5Jib4CxHm7fPnsMjnAO7lrUD?=
 =?us-ascii?Q?eQ3vh/7f8c/4RdpLK5qouQi7/p4KEkFVx5QMIiKJz5ErH4Blsms7zhGJ0l3X?=
 =?us-ascii?Q?g5XPgFJzayoC9IyGqUhW0gSUmc1rpjA+OPozm9XvveGcMY5tlGBRc1z8EXwL?=
 =?us-ascii?Q?8QOpb3g7AVWciCP1kSVccANRijPSMC1TJV7iFKTxqNrlkh+NJpr+WBamA2yg?=
 =?us-ascii?Q?L2EB0daRuxPUcrnF2WUB5LjIwcEPA7nm7A1CsullBrcL7voZ9Uaq1ka8rxbK?=
 =?us-ascii?Q?bvPnUw8fWpzCv+ebMUbRFognG9wSlDLUGDFZu4Uub1xQPRpEy1zIpBWys0bM?=
 =?us-ascii?Q?9I8t3Kubke9jT1iDu/86WnpjbFyasglTXxbOf8KBkEzLyfyERT9y9M8p/QmQ?=
 =?us-ascii?Q?xz4+1vxhkQY6AO57fyiFQzuvW6y7ho3T2E9VqopVUJyUsK4kl9vQFL/5TTxx?=
 =?us-ascii?Q?sKePxS7H5gSEf3eLsNlOE9HT+P1UE49h2IGovMemUfdwWJhXFqbDcqOL/8d7?=
 =?us-ascii?Q?7msuvosvo8g3TsD5gpKrAn8nUcXWuYkcDZWbey0mJuDQFZ5RlLkBm7tr75na?=
 =?us-ascii?Q?xaa0WX0VZ2/Zw8oBugcPBp50B/WAcLnMt0XyCtOlfpkbB+BEgkYQUrNU7QO4?=
 =?us-ascii?Q?eG0P0i37m939x+j1KBkODdk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d522bfce-42db-4d1d-f990-08da8a19154f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 23:49:16.3662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6KFH2Gh0vuw/fmRZCF4Oh4sOtehGX3sTxbuneyG0RL+GXfOSnJ1NmN25csX/WmwtMmHqd79ntyECP9/JaU1QUh/eV6ukX8KuzCrOLFhLctmw67XK/UZ0j0qGIuA7f3f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4218
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

This is v3 of V3H2 Condor-I board support.

v2 -> v3

	- fixup "2022" -> "2018" on condor-common.dtsi comment
	- remove "renesas,condor" from Doc / dts compatible
	- add missing compatible on r8a77980a.dtsi

v1 -> v2

	- adds condor-common.dtsi for Condor / Condor-I.
	- adds new r8a77980a.dtsi file, it is no change from r8a77980.dtsi for now.

Kuninori Morimoto (4):
  arm64: dts: renesas: add condor-common.dtsi
  arm64: dts: renesas: add r8a77980a.dtsi
  arm64: dts: renesas: Add V3H2 Condor-I board support
  dt-bindings: arm: renesas: Document Renesas R-Car Gen3 V3H2 Condor-I board

 .../devicetree/bindings/arm/renesas.yaml      |   7 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../arm64/boot/dts/renesas/condor-common.dtsi | 542 ++++++++++++++++++
 .../boot/dts/renesas/r8a77980-condor.dts      | 534 +----------------
 .../boot/dts/renesas/r8a77980a-condor-i.dts   |  15 +
 arch/arm64/boot/dts/renesas/r8a77980a.dtsi    |  11 +
 6 files changed, 577 insertions(+), 533 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/condor-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a.dtsi

-- 
2.25.1

