Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF0259CDD6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 03:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239319AbiHWB1X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 21:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239279AbiHWB1S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 21:27:18 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B0D5A2F3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 18:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTwp3MgL7YVJ2THw10bfEyJOYeV/dQLR6dlVGKPLo63Hu9TRlVieiL9N1bqbnVz27GAnSebajw/LJEd9ok4cPR7Qb21gl+UFpu4K6IFev02/wCOuWtL8dH8J9sq5RKGzG4OdXW/9O6acwoWYV5Kl7/PlthYWYnhWyJ+LRZYND01kZlW6jBndGONhrp71+vws/QJaZs9jm6PQtB8XwAtUrA41ECwb370Ki4yYMor0IUZ2WzpaBLJuDBUDRicT4kVDAJrm+oDAAHPzn3HveS+Kw02aQDGQJr5yROK3Q4NQ117ByW5xhICN28wfhYrGWfKNDHJUXgXIitYe/FIgA6mpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lLvTkHw6cvk/7RHKvucsYBpS6gvPhz++xSUh8tVnwo=;
 b=M7B5VAo7xNWWDvPJFbXmWsd4uxDycX7cS363WBsuAjq8UDrR0e+4u5A/dtlY2ZYF4quypBN2QJoHEzdyTPeg9AjX9wGWnX5QYWwEF4MRPzmm4NaaL8Gkl86Kl7vOlJkoEa/kAOExlEzSI/VgRxRmHMj0CDRZlPQhB64yTt0MMHPUG04cYfVHbo2bF4EpnwHrxPxXXjZODMZvSHNMefDaWwQoM3JynmOlsu2n/lP7Nmmaew/I2sox9d6DJZFA0j7Xd3D5FEh2aRPt7UCjFxbgSBXUCyBa3o0fZi7V6ktxkkU/3RnERiWngdACxepGugYeUQMiU5uORmy35i6tPXhtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lLvTkHw6cvk/7RHKvucsYBpS6gvPhz++xSUh8tVnwo=;
 b=D/97YRElT38bOmpl2ixKl0QeJHl2l677b6gybij2LFd4oJKQ4zm0H1YTuaz3UX604BscVTXPAcdTvd2FGVEodWVtlDeFA0z1II9SbH9DDN5LtPOPVbM2QPh2XuzbyXQyfY4AI9DZoSG0MkGQ5D41J6z8xTsH06wpmYza91GiaJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OS3PR01MB9268.jpnprd01.prod.outlook.com (2603:1096:604:1c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 01:26:55 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052%2]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 01:26:55 +0000
Message-ID: <87sfln92ch.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/4] dt-bindings: arm: renesas: Document Renesas R-Car Gen3 V3H2 Condor-I board
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
In-Reply-To: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 23 Aug 2022 01:26:54 +0000
X-ClientProxiedBy: TYCP286CA0071.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::15) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e3d20a-ef17-4c6c-07ee-08da84a69066
X-MS-TrafficTypeDiagnostic: OS3PR01MB9268:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +wv26sR89Ag8mTny7iHbQuFBzf4CkWRvVW0aTYuYrr67kdFuCxGbhq2akWtZkPHKN8tRUltjNhXYRLaxFt8S7DcAiKwhY2TXS9FznEebhRnegYwo9GK2J1vaD88/6n+oqeMbjOE+GLtMCOkqvCFc2HpbRPpLTkoMVcLN2XKqrt9gGOfxHL9pFZn5bf0RC/U3rNsCUNNYmAu62uJIMmab0e/DjM1lh26c+4fDTpmNPDY5ewHQONxT8w9J4+PBidUH7pbtiltcw3uNqjxUNHDxzQ8qzd1cwDLcLgbyT83+/88UAhPVvzOD9gpoU67GhIljTE0Vp2zlK+oZBvbcxZNyosCY9wGqED6upMjQzrZUc/nESVbEaX8f28CCUX4zXONvPFEIaaYBLNtsOM1nfwrjYWk5ZzDAzkCL6+Kp5Z5v24Z5Ic2L2bfgszvW2q8ImBOoHYTyjswsBQVII/JhmXikkgZ7rS1y27KOviKnakEo8OcSUYkfVcqN3VXNtUHdN9cQkyaMhAhfJCOZYWfhsbC3ywydgaSv+adXAFL3YmhoHkYl/lRyPVlcEfLzYyBnzY3rqW4+6MUx/TFFsyYHBI/ykogOjy4i2q4wADLQ0uvlXLtezv+FN6lC1NwnkJ6phPkxExFyAiKZ4RKmnSD+oUmjPqiDfo9FhtGPYwliNJMCOCDYysCxfUlAGdYP8IGpClPvmCer5b+lKyqrygfxdFf9s+bSOpMN8VJeL+hhnbKA5JFkDKfV87nx+6shMguXxVIrj2LgS/4hjWeN9Ow7xMDxCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(2906002)(38350700002)(38100700002)(86362001)(186003)(478600001)(41300700001)(6486002)(2616005)(107886003)(6512007)(5660300002)(26005)(52116002)(4744005)(8936002)(4326008)(316002)(8676002)(66556008)(54906003)(66476007)(66946007)(36756003)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YV1h1rgRsYzZAC7L0vn+V9fdN1zDPaTPmHItqp8mstW8Mc9VeqaZrZ6Sw6ag?=
 =?us-ascii?Q?BsqNFfDc+qEIY7V4DYyalvcrEnTwoeBi6cfBZID86fOb4hwvP4mCOUU51DFL?=
 =?us-ascii?Q?slDnVaYsd9fgBZSOCuFikdy5SpwbUSJCHzgP/9CH8LlLjpvzDetvgliB0lpg?=
 =?us-ascii?Q?/ugMSmK5msGQ5lEUjIIHYnJ7cV/uScWwA7D1gBNQJUDzaOMg2Myabf3aBmfx?=
 =?us-ascii?Q?fWTDvlHzCwZP38S3RXAdlzLOl98/alnpwPGDdW824Tzp8gA8Ryo0A6atVj/G?=
 =?us-ascii?Q?ecZiw7IcDeQfzqwVSWn2Txs8kiNtElmlVEWTCaZd8pNTk1eo2mNNQlIo5z/O?=
 =?us-ascii?Q?hSLhfSalZNSerD/XlMZ9Degy0VoqSnjWgxRm6Dfm2nkGBoU8RFgO2ZPu3scr?=
 =?us-ascii?Q?bpV2tlviis+sU+CdnR8g7ohgGclUy/9q7V5GsWKYcqfaY3jjuERRZZ+KmcKF?=
 =?us-ascii?Q?P7h6Y58Ge4cze5bBQzfOuCejU1PKgHZtS27xCb6b3Ido9kvBsjumcLcIr57u?=
 =?us-ascii?Q?fWYNf0vctDVSRQGo+Qp0TxzUu4iksGz0V0FMamyUthMbqnCeR9BCFv+a1+t+?=
 =?us-ascii?Q?ZhxMBsAsirpFInuxvc3xEUxaUw23iV+JFY2h3C3WupiF2aoZxNydQJJs37aq?=
 =?us-ascii?Q?0Erpzem8X/5tVUJVgLMMDAx9DMx3VE6VLq52uFj7BmSRq0c/rEvfQ9kQxAgW?=
 =?us-ascii?Q?97Rg4a+gqzKUfcBFlilRXttHCu59CccUO3QaZ6m2WCpnARMY6Ax7nuDUBGIu?=
 =?us-ascii?Q?rrpETd1WAp4JqaRDUmkhJxY+HcQP7Is/qUFA6oMMZC0YVmQIYsAPvUrGpank?=
 =?us-ascii?Q?7xUKNJkfA1G532qjoh33/8DRpszxoBxhQ2kKkWw3UShszQqxhkV7BX6YE7N7?=
 =?us-ascii?Q?0w6A4/wl91UGXr9OtUtEmZbdJ3M+td3tp1RbVJ8x/d9/3i1Wmiz1eHtM8iDK?=
 =?us-ascii?Q?fQjVlYH4yby8M4ZV4LuDWd6wNXkBjSscaEP4WzzORZmgDbKig7NxMm1qdu6o?=
 =?us-ascii?Q?bhMTOeUQRzLUUS094lXFWFedscw4kvcgw5x0zABqH4Ka12SHUi9Ph3m2hbWu?=
 =?us-ascii?Q?Ad2qnGG2gx+JnC+FF1p+S4e+Q/m7NrJX9K+ygv3grXVE+vm7/6rjtlD7fMyH?=
 =?us-ascii?Q?dTtA/04Ia6q6KFSfLZ97blp6/IF+OwN+TN4N4XUHGChvbFQcECyeeSedauJI?=
 =?us-ascii?Q?NKb1EwuTu+4ayz7aCszhLyV8VQiG+iU5A8evFgbsLEG1Lmdqx662IHdBVIRq?=
 =?us-ascii?Q?lPP5T3sfWFUHIyVVuD/Pclo75rDroPkf9J/wvi3MzVtJ4OGY4/MIY4/p+mTP?=
 =?us-ascii?Q?XZrG8OEYmaWeZ62+tEqGRxbOEf405KzZ9UzAcusoneMZtxax3MVhPwI3dgFL?=
 =?us-ascii?Q?C/8c8dZnmIffUeL0l6BDvL73tz5wRRelOcUQx4Inrg8454DU+zLoyGJg5yAT?=
 =?us-ascii?Q?kQFnzA1+K7ijzTA8h5GVcMV6ZisTcLokH9KGcINUnAp0mCWw9LkbAVBZSdHQ?=
 =?us-ascii?Q?SWiAp55/MxoF8wls3xRox+LQW6t5SJEfpJuvqg809JNkjR7lC1cZcTcuK61v?=
 =?us-ascii?Q?+WASL0PRlfV3zVD//gpkwYtHhY20ylj68XWPoG31zCp69fQ26pS0RZx2CmD+?=
 =?us-ascii?Q?9Hcv6YOahYHtjd1Laz9YDtc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e3d20a-ef17-4c6c-07ee-08da84a69066
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 01:26:55.3076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnHI0mymFp0sIJ5YUI9AcrsR6JhzrSY6lRGcpTnBsw0P90LfjF/2jBOffeCwxuo2dgH9OXKwPza7vuYNdPt5rkS84QW3qbx2f9dzWPVvlhvSVz7ZpMm6wfK2QBGJplrU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9268
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

This patch adds new R-Car Gen3 V3H2 Condor-I board.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index ff80152f092f..0e029bbd5bcb 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -291,6 +291,15 @@ properties:
               - renesas,v3hsk # V3HSK (Y-ASK-RCAR-V3H-WS10)
           - const: renesas,r8a77980
 
+      - description: R-Car V3H2 (R8A77980A)
+        items:
+          - enum:
+              - renesas,condor-i # Condor-I (RTP0RC77980SEBS012SA01)
+          - enum:
+              - renesas,condor   # Condor
+          - const: renesas,r8a77980a
+          - const: renesas,r8a77980
+
       - description: R-Car E3 (R8A77990)
         items:
           - enum:
-- 
2.25.1

