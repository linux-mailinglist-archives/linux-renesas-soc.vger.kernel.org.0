Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 751637B5F17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 04:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjJCCda (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 22:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjJCCd3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 22:33:29 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C793C4;
        Mon,  2 Oct 2023 19:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Envnc2+2HZXQyT7NKUtn8DMnVb0PLxPVGDj6R1jVaz9q0ZtboJ9cuWWC7qqQtn8ZP9ErfmnGTz8wEHnYe3RjYLvoVrMGHOArq9XW3sBsfB9V0WINjBacLiThct+BjRMyD9J7L5OZkxrn7C3VZOxuqKDEhLwayJJJx3U6TsPzDBxvLdKVJ4X8DC7/ns16x/lnVQKU2rEbPAMJMegX27ysDNsgrZka2TKKTeh+s4/o+d1tEUUMhgHtrv/UWwo47oPalBGACyHgS+Sd6OSP3NEUaI90i12Ae7KQCikdJMPFV6+Gm4KbIHCUyKI1D4UUoC6yzkSCUX5lPVY3ABI2QFtAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTVrFykAC1EEAmJJ69dndYwuttsoxq2oa1l3+VJP45g=;
 b=LT9AvO5v9mfL1a7ysVzG6G67VTpJFRGTsGv0KeBM2ILvoFhyOsADy4FfCIqjCm50z/xJkm62ih5/CYO5I4P6vU5dnL3azmmwQysdPGtMkuOsOMz2Lt6NKBoACRwzybfUlMdQSbdTae4hIxSksnVPuXiyTg0dnNGwgsqRJtkk0EHecyff1IYjf6269EGoK4yqV0C8zrckRM8UbRS6T3cOLL4GGO7gvYdFFs8aG74OgMz6+OAokdTGpELv2RWXMIr2VrTXzKmkAmfZVefirV/azuNi0qPxTLVdVr+ceXFjrQoA7ck5/G14ecRHkmaCXwNk/A/Z9KFdOiVwkMhZKN/GKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTVrFykAC1EEAmJJ69dndYwuttsoxq2oa1l3+VJP45g=;
 b=VA0evos1YyO78yJBTtjbxUI6n6OdnVuAFFehWLWOlAjzwFkV5emrS3QBov5kGYg/Y8xkA0GXVB1MonxhWjuQyUBns0r5/+92tMHUe0h5tkxeytdaU5M6CAdFhJHzwnDIKpQf2/w/UDGsjtxxB8nyNQL7hdOCL5lKg22ndNidpL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7781.jpnprd01.prod.outlook.com (2603:1096:400:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 02:33:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 02:33:23 +0000
Message-ID: <87ttr8fn9o.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 3 Oct 2023 02:33:23 +0000
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: da72aa84-b7b5-462c-0fad-08dbc3b91da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QA8fXylvX69hw+IPVQFUsT05fsBAg/Qw5WgUaWgvpnHMR6JVVRbwbQ9/VHObP4FEyF2js8VJdtcOk7HNyvx+MGS46J+fg2cp+a0nApN7JBxE1uGl/jf2jjA6ydDt8CKvdhc+b6QTc6iNmA7Iujb3CpYxP+pA8P8zM091EZc3IKkeEu5pMDiI2jLHKGLX/91vJWqY7y6sYGXdiP1nueUSAHdrg6xCqq+9oC83I5bCUsU3x5eVk9sF1AC1T21ZwhdGux7ecDBQN9ycluLpYV8Ar8HfLQLygJFTsO8K4I/3FdLchfMXSfevRVAgxVR9IMO4fuNO/qrHif/N62kiWsGQiGNci22oMMTi0MkUdVUBzBZ++I8Maf27P9u5QvKcEokqaqwh70cxvi5y4zDT80K6tOHsLrMVq+G8xTJvJDHmpLsaOv0SzvsqCPkNRPvN80Dha2Pmk1OCluEJTW7DCSsJGYth2mEymkXHLyy0hYOwBr27A3UCW+pfXeMKVBjBNOHuI6IfHLKxc7e5wxdN/33pp6X+ILbr3oRiINQVq+BTrLAC5E74+kC4wdfDA7RpF66uSKn1CRVqgzjz9qlZ+sd+zB+ix6dF9q1oTAynmeGjpJWl9jKAmFQEWCYSELHuTnNc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(52116002)(6486002)(478600001)(38350700002)(38100700002)(86362001)(4744005)(2906002)(7416002)(41300700001)(2616005)(6512007)(26005)(36756003)(66556008)(66476007)(5660300002)(316002)(66946007)(110136005)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jmei/CWWzDY4vHz4ZH0lmY4PuwPIM0oXnt/qW61suAhpmm0tmPfaYHxTX0S4?=
 =?us-ascii?Q?WW/qzGR/lBIfnS6hKbg/KhisFlAuUXXV6m2TtlsPUat6jlMV8dU4bqEwM61m?=
 =?us-ascii?Q?I4B2u2yanfSsgs08a/QZQSD2okVOIIlAzrACp1aikKx61V/TmqukEgXU/1kW?=
 =?us-ascii?Q?D/gbEQpQeLUi8BcG29WOK8VnnNqqB9yf9/7eROkH0KuId3czbBCAuJiXyRXj?=
 =?us-ascii?Q?NdZTrxhCbE9aipxs475wijBwgDstvCVvmQoUGKaEN8g3jqG/3bOxY/iMM2hW?=
 =?us-ascii?Q?ckJMjrn08FdbKBUoU+M0aVhmqzPiiy3nH8ALUeSY8ljHPaBDQudclvDwTEy4?=
 =?us-ascii?Q?Sqa0OraThdIBt+95VwpgLJbrNI1jQ2AP6LrfLlwH45P8TRnUZlOPL2S9uEhW?=
 =?us-ascii?Q?ZFqvfJLEFLvfSVxTTsXLsjKH2uWfwJPtCn0DdGtYcAdD43CysItAT6PQzf98?=
 =?us-ascii?Q?E3TlUTfoA3EhvKPLnQXIi6UYoYbCT8FOMrAddwvrav7L7iTHer2YB/IfS4+j?=
 =?us-ascii?Q?465loq+ny/jkCe9OGTz/4xupcCMWv0o/x8WARDa9I3MtkT7hWhNqTv80bbVf?=
 =?us-ascii?Q?c56zzm1qjgBKWubyj1P1vMZyQ2Qx25hGgj2X8uq1460UYhyX74T6wXtD5rFP?=
 =?us-ascii?Q?0fSJxYfUrC17dymkG+6zU6kiVvLUqW4V/K533QS26c19+77MzVqkHkIrvtET?=
 =?us-ascii?Q?+ivWrszBWH0M7s8Y3Qus+aAL21Of+Xl6dAQi5+l5IWSIDHyqVslMLD6Dsyw5?=
 =?us-ascii?Q?stTnyJgcrwlbNxfcoSUCUleu9T/m0RbvIC6A3SlifB5AOFOkKAIEyL4i1Ake?=
 =?us-ascii?Q?sg9NPLNGSbw00cBUjeyekjoSWYpHy7fvl0BTQs3Gos9gg0kNpKnlD07mZJIb?=
 =?us-ascii?Q?ZrgbPhl798vCXrMmNgW7pEwhzVl+qWEzPfZMF2IOSVOPywkiGCk5FfDOpO30?=
 =?us-ascii?Q?w4CGuJEtfDCL4irSeNEVdNYU9e0ImIkLaAKdBp1p2cLHPnkLj8tn5CHaCG+7?=
 =?us-ascii?Q?4yr1UiAAu9Ylh+sqC0pKaxj7vG8quyAL7TiaSz2BlchuoYXtfgsTaOLqd+OS?=
 =?us-ascii?Q?Hz1G+ZO70QGc1cevNIrQtbGY8J223WBtbQK7f0Gjfrs2EKxcGNS/jh8p91na?=
 =?us-ascii?Q?skJkqDKzVFJbDUyzrdn2CSHHQeEVa3BlJRJe46/K3+8E+4cS+HTaFLq14Asg?=
 =?us-ascii?Q?8lU7U4KSmTyNRYM0f3lm8KKLxGl3yvLhFl7klAYZZjQRcfxk5wPgJZxdb2ws?=
 =?us-ascii?Q?gt5bPiugoH07GIvKKYEdbn7sBXnpSHZ/g096oNfEvV1DEnPIUSV7Urj5fxrj?=
 =?us-ascii?Q?PyFBbi2agn62MFrcwCyGkXqpYFRbwLI614gHLDuOmmChLoBzIJOAx84EpVrf?=
 =?us-ascii?Q?U66+Mt/PmwI8w2JW/XtdNNc51/2Fb2KiqpRWtGPCaUE8P0KNwwotJL9AcnIH?=
 =?us-ascii?Q?2422Goe34d7qdOwuqMJ2NB+eqan2KXSeHqZ1xeC56vg4OIkA4/rWOByogcX9?=
 =?us-ascii?Q?a8TnCJkaygNWpa/Ughzj0hC3pCK0YRyrTYqUF7h+lfEv8aB+tnQ6z62clClW?=
 =?us-ascii?Q?khmCd/kx9tsvdOhAclqpC4HauRyt3Cg+QohFL8C8Q+ji1S5IQZYqipDChkWa?=
 =?us-ascii?Q?eO8nTiOdHQsoOrPbJ9HZsKI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da72aa84-b7b5-462c-0fad-08dbc3b91da0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 02:33:23.7966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ai3Poody5Dfl5rp+Qld5l8zp25fASAN0Dmmvau0rbZAWpdBX96KpG7fGCuwCdspT9ncX6+oaaM4+Da/ZhcmWJtlfH6A+U7GGnGVODLLyGWnRK7PUIM+LbCwuPEweC4ot
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7781
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the Interrupt Controller for External Devices
(INTC-EX) in the Renesas R-Car S4 (R8A779F0) SoC.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
index 95033cb514fb..b1f3e7d7b88c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -37,6 +37,7 @@ properties:
           - renesas,intc-ex-r8a77990    # R-Car E3
           - renesas,intc-ex-r8a77995    # R-Car D3
           - renesas,intc-ex-r8a779a0    # R-Car V3U
+          - renesas,intc-ex-r8a779f0    # R-Car S4
           - renesas,intc-ex-r8a779g0    # R-Car V4H
       - const: renesas,irqc
 
-- 
2.25.1

