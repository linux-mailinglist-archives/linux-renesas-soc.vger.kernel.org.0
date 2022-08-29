Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8C805A5831
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 01:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiH2XxB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 19:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiH2Xwp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 19:52:45 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20719.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::719])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC23CB1C1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 16:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m50MsLj8LPk4pddYaLP8fbDc9Uu3uzSNf2RWLak5u8/nzWvYNwaLKeJwVIf5EQeFGQLYCYLRBrY/LdPS1kzEqzMtYANG3uOmMVQYmtEVGwAc++PhC3TXJIBET6AHGxglg9TATjE5YLzGUWhDWg8kcymkDcN81+DoSvzB3inuPC8WhFftnz6skHOOrcUDsOAK4FBqCsXKb/UgOy/ecLYEYEumUkHlhEXnU0StkyJq6vLPGrYkHv0IldW2MUA9cmWbAXcU03IeYT3B4ku74AKNF59Yu1vJcMJt9j9qlv/jIXTa/i4iakaD9ziSPAJNuJuGW19ht7L8XpNp/uvfoPVn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27CnqmyWXAxpt86Y94WT0VCLYLDPUoqQzGTOpiG5chU=;
 b=aqyRZflvsUKGmdN6PPygYdOKYNW7FU2vliN1RinHNXMGybdjY6OSZOg6Y+tLvtXiaw/VD4WjqJC10FFhY8SlcFRBVtL54Q1e6JAuvOxln+r5MI5xkfsQSQbkmc5A/47Pd6otDJGQ32zMtj5vl2d00q3lACw3FoG7JgDvilCy2NGgdUL5MXsk/2G+SbwHzVipQHcrKFie1AxW13W3csCT+Hgtm1rybYTUBQQtcQlK+TyU4XDZz1olaO2NbnoKA0o06Qpn7xaSLOO2jt7yfYTENg2xQp6gA5SdTzRyLCluoPkeLNswhK9nokEHkUuewglGylvr5ENsUPMfXCc8iqnHtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27CnqmyWXAxpt86Y94WT0VCLYLDPUoqQzGTOpiG5chU=;
 b=i/CQAB87OkHrW1Zb31PxwALMUGSVva1axanb6jKtdZlwll3SNCh0WnhmbUp5iU7hVNeH6sjkOR2pO47fFoHlO1yerld9Z2FpIO7pvkc5Hsd5IvtmHnvKe6cnoylc8q+r0JERix7CAVk+evLhCB7xYIyTbzHPb30ePJQcWUNGWmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB4218.jpnprd01.prod.outlook.com (2603:1096:404:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 23:50:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 23:50:07 +0000
Message-ID: <87wnaq4nkh.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 4/4] dt-bindings: arm: renesas: Document Renesas R-Car Gen3 V3H2 Condor-I board
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
In-Reply-To: <8735de626c.wl-kuninori.morimoto.gx@renesas.com>
References: <8735de626c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 29 Aug 2022 23:50:07 +0000
X-ClientProxiedBy: TY2PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:404:a::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be1f3ccd-9e9c-4da8-e580-08da8a1933d5
X-MS-TrafficTypeDiagnostic: TY2PR01MB4218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j8AEWfQc2qBu627+Y6jFgLaKHHbaH+zkfdXdI6KBrCiuWk8e75QcjaZCMwBAvTsyxQdyXKmv+eyT8UlKbouIrDMlkiqR1BgjzMcqr6O4pS9j8ly0qqU3NpMfHjFzZtzTwJySsgFSMgmOKFnBvpSvqfpe5sL6r96/P8NK9IfIgojs/16aVSMyL3ZVxhgvfiCPQqz37g1PugDWttHBJyJjWzH4NrB6X2Bn/JaponrjrVOqfiRTXC6nGSgP717CG+3b9lRVOyYV++7Gg7OjkAtVT1f6kjrlSehCcplnn9NopZQKm76kLkYmyiSj2VBid+WMwXwUb88fk34xFsabDu5Yq1qNXbaCHXkN3U4O2vwqWKPd87ZKhB90MNnGYvIf8iiPL4B74XpWbFufE+UFl7QvhIUMx8Nem9pdnTI3RlavqkVqgT2MYCnqUJ+3Fd/D8kfmkX+/gTzi1Ew8Ik8pd2fH6IK6jxu5+GGcQbR8mT+SaoWkF6N1ExSRbb0blXu5nwk6XHXqnb2RxeERfarLtCxX8w4mE49bmo+3frpulN4mhMbdOfcETA1ny7UJBSz0W4bs2L5t0OMdIHYcRC7II0ZVrZDML3EcrCDTWC/SF11jRnyZNoPPtl0TUjqRbgyBBWBvBVo/t2+2VIbHlqH34mfhcmtSi7so4EIrAzRilmDYK740SkW2wlVP/935O/V68OLyY9UnbkTb0SMS3MSsEdS2ah1VURW+J1Aq12qzXzr94A06DLg5wQ05NiJko9vkWBnDv4Bx6io1u+Jz3WqRSMBLPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(186003)(2616005)(2906002)(54906003)(316002)(66946007)(8676002)(66476007)(66556008)(5660300002)(4326008)(478600001)(6512007)(6506007)(52116002)(26005)(6486002)(41300700001)(8936002)(36756003)(4744005)(38100700002)(38350700002)(107886003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1aF3bUIAn7VEVY0Jq5RSynAnb7yI9dJf9AlpqmUkZ2+aw5sMM7kpm40/kkx/?=
 =?us-ascii?Q?T3R9zODCfk1651h7izQdhKMZHuznDHe7i+Gm3M5O01QBFYt+GhEQR2tok8yS?=
 =?us-ascii?Q?y2Gz20pL9MtwkWxuMrOpaiPgXr7N2qp7hbUaD/bSHVuGPjbR8nBMq/gH9zbA?=
 =?us-ascii?Q?5l/FXckf7mgrrJ6CwfG9INJhxbQ5HCOeymibGTkgrflwV8ef7l464/+MG5J1?=
 =?us-ascii?Q?m5Rw8+Eyq7sSvygcsvMpv0WoovAmehAzo6BGtlzvbZ37h3N4d9k9/+xME7ug?=
 =?us-ascii?Q?Lv9sVyu6ePlNRB8ZkmlinheDyrrs9YAzJ5VVhgSr8r88X8LAe42WMFySlYa+?=
 =?us-ascii?Q?lioh0FanFnsdEfWcYCKttwaXSY92ulyKNd3sS1HlV75P8R74pzmpAoKyhy7q?=
 =?us-ascii?Q?5Rdymh0rtb1FFR9ahNYJe05s14VdMbZpflfhskzJCbueftWbBGcUzOb5hUhy?=
 =?us-ascii?Q?jZd9OilNk27xy1sEdtrGoldy0FhlkJeKjqOisp9IC0FemK/0fop/BxpSu47R?=
 =?us-ascii?Q?En8oZFUHOK7ukIXSIWoMxFiYO4cokE1rlkHOM4xZWtX0KrFyjLX0O+coqGSL?=
 =?us-ascii?Q?D8UZCmZJ2HofP1XO1S4fHe+kAt5xcbiTguTeJKUmlSsv7OA856ny2AMtO+ev?=
 =?us-ascii?Q?9AgmxMYaNm4cigANa0g/mOHMUfVb94DoLzBeA4N1SEYV1itZ/yDo6r5Aq64z?=
 =?us-ascii?Q?2Z8jEKmpwyGi9heXBMFhl0TKcw3yLP48D5iGpIKPrc3x3w0z5jbn9Zf0qQNm?=
 =?us-ascii?Q?7tjsRbS69gt8g1eCgZVTfBN7RG8SyK83OQT4r+RBKkQyZdNURBY3CrN0fbKn?=
 =?us-ascii?Q?53Pe5NnpmRMXEkZN6UBpSj2rww5l6jW5JCsMg85EomOwDQxEDUwWksHkIsZ6?=
 =?us-ascii?Q?uuep0R24mkrUvdwgiMne1kKwRRcLcAENV0nY22nNhMc4R4VJhVX9H+g+5Kya?=
 =?us-ascii?Q?eYsyCtuLaeo+qfFRQO9SPjgSfq7elJEcmtE9tsdmQjfrC1ZDOqJvimvCatgR?=
 =?us-ascii?Q?wiDdSJHnOeBy//oSojPa8jPmWn14vWLhnb0oedmfDV0FAU6wndEyZ6y0JFU8?=
 =?us-ascii?Q?r4EXIenAgDtMM7wX5W49kWgLMGWJvfMXgFbs0XEhSA8iZCceNdj7A4XXMSXb?=
 =?us-ascii?Q?mgqYxwcVwFPqYPZN/Fn+P+eFlgITDgoTTTykraC/3bE2ghe/zX02hgJwZQVP?=
 =?us-ascii?Q?6EQCEP4F9iUct5yM6KnyL3qrjEkOqHkfPIP69mHrXHilL72gi0x1s+fWdQqx?=
 =?us-ascii?Q?ICw7IAEhlEeAjlUdqfk5HN9h5t+LOM/T2gtRw4AI1Hh8yF6ScQNGPgzicXwd?=
 =?us-ascii?Q?EYKjpFLqYRs6q45jzJpBMQIP4GyqMbPrkGMXAXNEsfIdEsIOCmMHuJAsqBpC?=
 =?us-ascii?Q?JoAC7aB+DJgV1Y+9OXShTEB8tmneb8yaatBwFUvvlAKhHEIpD4PJnpjiz9TR?=
 =?us-ascii?Q?UkakYn5JOBOdDHtNk2vEl8sFMJOzE0y4DNb0Zs3weFADNVWXjCxiRp+xVcka?=
 =?us-ascii?Q?gcrw6KgQjFNGVdh7f4YWdFJFemqIlwqw0Yw3GzdosWiD8R9+RH5zHYcOt56B?=
 =?us-ascii?Q?kZtgg7/V3azoq6oDOinlSlAEIr42Yujotr9M/AWR44sKrlzKeoGoCGv6Pq3g?=
 =?us-ascii?Q?j/SGc6KqKm9EkL1GbLQ/pWA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1f3ccd-9e9c-4da8-e580-08da8a1933d5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 23:50:07.5755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCMtKrJyyzUuDirlEtmvBBFppmwZTp79R2iVv7ukU8akjZw19PCbX5eG+RyddH53rzqMPIUNdEK8vAdORySGYv3+KLcSq7JU2LXXk9fFhNciu5QgemCP4lUw2Z5Ql3Gw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4218
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds new R-Car Gen3 V3H2 Condor-I board.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index ff80152f092f..bf485603d226 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -291,6 +291,13 @@ properties:
               - renesas,v3hsk # V3HSK (Y-ASK-RCAR-V3H-WS10)
           - const: renesas,r8a77980
 
+      - description: R-Car V3H2 (R8A77980A)
+        items:
+          - enum:
+              - renesas,condor-i # Condor-I (RTP0RC77980SEBS012SA01)
+          - const: renesas,r8a77980a
+          - const: renesas,r8a77980
+
       - description: R-Car E3 (R8A77990)
         items:
           - enum:
-- 
2.25.1

