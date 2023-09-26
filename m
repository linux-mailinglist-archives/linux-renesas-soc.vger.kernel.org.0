Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0679E7AE498
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 06:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjIZEh2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 00:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbjIZEh1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 00:37:27 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED33097
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 21:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BayNrgR7c3skEoK8fkUeMGqcZXYiPv6tm99qSPuAduuFpT4j4y6m9T3jS+RSF/evIA1N+dc8PW7Pl87krucd0oZRVIP+721B2PE84RK/fhSrN0PNAYEpgQ3G8Ka1/46AMB7KdDjE/FsvcLXa87yZl6bY0U6YX1/ZSIYr4Fk1iVcT9iQYE9EBaaZoibHavqdV6kwk61abTXrsGXe7ZlEpnRqKO4resRbLY+vWiBe2uq6KT+QfWBgUIB8UjU1rc/aPJiPOBuKN30MP/8Z1vlOPrNVPnTYYZK88SunFNPJmGoQwPoF8L4sP1bgh5IWliZktbYhf7JPIedwAxQ7pVtotQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXP+OGVv8MnojIq77P292ahhVewlEh24qCLZxxzAEFQ=;
 b=ZYlu7yMB/Otgz91unGCx6aa2FiB6X6koExSt0gtC2LsBPZ0Aehwtt2tKRRjKtHQMiJ7m5l6zjKNGhkc5/udIJWs9B4Zu55Vd6CKPtqT/OGqRzYCy3NcDuLUga5lwBJWschsLVBagxLJ0xiOVI3Bz8GIAvZQL8luWfLtzq0az091sTTW2eoWkuzFjvnUWoA+rd17KwSfwJkGX8lnHysOIprIWqVdhiuBdUGnl1gC6ZWNF5R1n4/eQp2Fr+ufwgbXtrJa62gcpa9KCQKEVSu5eeQ27gw22LLqFuHqFOfQrmpSwc/7AZyZmn3fFsUbI423SLOLdJj3oD5J1zhIpN8ckdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXP+OGVv8MnojIq77P292ahhVewlEh24qCLZxxzAEFQ=;
 b=E+3kQ3XAMjkRs2+l2kqKXrEPRQXLKB74BC7MoZmeILvjWAz/bTvN0xWz3SEMwangd6mCBR3Ojacu6UyCgGn9I4JD+pOI/7wYo/+WU2TcOWjjoWWoDC+YTb7RK3SAYceJyoYv34OY4T3GjUbCVWjSNqhlnV6Wp/R+Wrbwb5POPgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYVPR01MB11247.jpnprd01.prod.outlook.com (2603:1096:400:364::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 04:37:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 04:37:16 +0000
Message-ID: <87msx9im83.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/4] dt-bindings: soc: renesas: renesas.yaml: Add renesas,s4sk compatible
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
In-Reply-To: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 26 Sep 2023 04:37:16 +0000
X-ClientProxiedBy: TYWP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYVPR01MB11247:EE_
X-MS-Office365-Filtering-Correlation-Id: 936e41cf-1e67-4eaa-33aa-08dbbe4a433b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81R/chix2pVFOsFfQjHGg48fKm0FkRudNPT3A3CpwvFd1VQE5SUeAwbqIQMN7MsBaXxjGBTaB7b//8K+Op2SH/NkaWbmrgxQSrM0QXEe/GcvMDbLldYBMi2tUtHRAgzc7Ou3eyXZz9tTHAzJd3gNW3kw9bahSr3iFwnq1DxfO35rTKuO1eeZU5+5dAIUiY4yVaqY1fWyxMwZBMHXBRbpuSbHPyIYzj/Gnmf0J9tti+7lPt0+RtuEIC1YT4gK/0BC6kbWxsXUGLV9WIYLZU6qLVNDlHFi0DdymM5ufnYrFNymn/WJ+qiIpd7pAp3FAnUjPUrYow1bjHSXBK1vdvJGyU0QbPQPgdnwws0Hz+Wag2veuViiAN4TcXEjxYNRbbxyKLDD50KVwUReoyaozDQWRKS0pM7liDtQlL9X/I/3NSK60yHcBQueUXTnKRKqpY82H1msPbt0hm8FB47mnF0vvIojzQibYZGUvsKLc1SGxO2geZz3u/Zy19x1xtLLVs0eU1KIdOlay7sUI8LPx5mtOdly1lXdgizkD5mn9tsKCHNbxTNMI5vzEmYLVj9bzhTYLjEcxb77jA5CgRldPZsawVC9bfFM4eCyMUZ4bk+vp7Ub21AijDiGLlRbs7cvMPV4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(86362001)(107886003)(66946007)(66556008)(66476007)(6486002)(478600001)(38100700002)(38350700002)(54906003)(2906002)(4744005)(5660300002)(8676002)(36756003)(8936002)(2616005)(4326008)(316002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?myppMU8biyPacvEf3+JVRiZRvrPEytxSRY7eaCgx7lEsKQnfuakRMAK8TxkB?=
 =?us-ascii?Q?CeeaqCfpQ6GvIDMIIjx6J7B64xmK4iy0hO/JzhO6zu/g3PXwQ88P6SqatkK7?=
 =?us-ascii?Q?wwzs58vWTZRuLw48JVBoQYe3WgnMNTZkaGHG8movNSr6AziUlIyCMCKkonT4?=
 =?us-ascii?Q?F/dKMCsJ04WIHe56RaDkCWElvyFDiCsnO2UC4/Bo8PUEMW+OxOJhbG5PzjH5?=
 =?us-ascii?Q?O1vVMb0ItxaRbGi0tg0UXrNli8qV71URgCbDnyemmri2zcqTMVII/XldM+zv?=
 =?us-ascii?Q?q7hSkeYtQ04Sv/hls57f/ucP8Wtc7V44JnHuw/I2NM7bff/9ei5HM1DiFwpS?=
 =?us-ascii?Q?tiuxvp1NDvy4UTg4pUTx5nGvgkVK6XYfXea6OcxjMU5wk/+15dijF/FVYT5I?=
 =?us-ascii?Q?+YAmh7QiWEoR0MEz7Nuybz05/vmdmbUbUCUdXr7wubgUgnie+rTGW5TmmvYL?=
 =?us-ascii?Q?IH/NbJieOlKkYR3vduqu9sQbzy0HIxa/+d8708dAKu8ZWRnXpmEh+kz9tniR?=
 =?us-ascii?Q?BuuTA3XLKs8DrFUP0nAH1ZkS4/c3qh27F5z+3eghub/GLUJNkk36wQRpp6jk?=
 =?us-ascii?Q?3V4GLw0hcrNpw6Ysua6MdDl33hQqXW+rwc6JafJjtnlqVkfr40ElT8NY2mf7?=
 =?us-ascii?Q?8k6g93Ahhr6gwx8cAzadrEA2hkFnUa9eppo3XhTqufixHOfGfEq/O1MSeD/O?=
 =?us-ascii?Q?YVc8JOBPzWsooUdr66g/P04jKCQ1AUYXEIu9eFiLylgu9c5hJA3v0TUL1F32?=
 =?us-ascii?Q?sV6tohjilKF1PSh1Nm543o6nFH/TNbr6izJlp7AkwV/SW/yjV0hrzbT5NspQ?=
 =?us-ascii?Q?n/3EXA8RMhRYpM7xmgnH6YHKluq/aZa9xfhYPq7cpPujacuQViZUU3EmL/FY?=
 =?us-ascii?Q?x2ubCwOwUUM6je4NTALsAjddMtmXlEwVBh5H9tKTAm36jDICdDdDrnJ8BUaa?=
 =?us-ascii?Q?iqd2xHXuiTmrR01XGL+DevCnCsk3QSAPUE58J7DTpm9isOnt1LXz4hZgycQR?=
 =?us-ascii?Q?IxxB7GDrmlhfpRzALAMAWmy4Ick2Wz2dzbes1Zf7sdL4+UErWXiqPKMGePTD?=
 =?us-ascii?Q?St31ecxOoR6wHFtwDpWU7WcN+vonSTaJYpRTyATcCxu7tXqycFmNqPi3S29m?=
 =?us-ascii?Q?JNWw/bCVuURhbyo7hinJlyCd/aQzpf02KSaYgEIYvye148pIHF7ursT1IZTf?=
 =?us-ascii?Q?lu59CnAA4xrSy3zD9zoa0is6/AiKF3hTRGKGCu+JY+AIm0YTNQnW+zZddEL+?=
 =?us-ascii?Q?Dz3G4c9DlKszIVai7mKCVwnHO/GztYHDzVqhcl20rgZjNayNgb/78M3PNBzP?=
 =?us-ascii?Q?GBgvO8Refh4ymZji/2FWk34qbOqbHJzoR+Zh8zfAgPuw2XZCIwyfphBXAO2u?=
 =?us-ascii?Q?ErIB1x7Yq7LGXKBVzQZGLa5wAg+8HLHE5Q00lYYGG+UgYu9wB2PYVg98SAdx?=
 =?us-ascii?Q?nLJZTkKPGThT3+Dn4TOudkLJ3CPjxwCCIV3UKYFMCIqupgoyDLNAH4KNQbOe?=
 =?us-ascii?Q?dPlf47ztP5LDrGb9URmPV0I3BSj2GQ6fLFfbtEdDcY139N0AJlT6XX1TRupq?=
 =?us-ascii?Q?aguyMkJd8B2x141OAH4ipZdZqURUW9x0uvBW3AwrxWRXYICtuMVp7k/deSi6?=
 =?us-ascii?Q?a3aSB3lJWynoEIHtQxYReW0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936e41cf-1e67-4eaa-33aa-08dbbe4a433b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 04:37:16.8962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IeqIOw2g3OqOBK+4caWKusO72JuQ4lQlL9Qw0iAtRRcqB53S6uP14PWfaWPTw29YDo3HVu/d/PKbe9zZqlbHBmUrkXaUkoRnY3+0UVfzRMsKxmal7+ZZMe+63pm6GXh3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11247
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds "renesas,s4sk" which target the R-Car S4 Starter Kit
board.

Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 53b95f348f8e..9e8ad803b46f 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -327,6 +327,7 @@ properties:
         items:
           - enum:
               - renesas,spider-cpu # Spider CPU board (RTP8A779F0ASKB0SC2S)
+              - renesas,s4sk       # R-Car S4 Starter Kit board (Y-ASK-RCAR-S4-1000BASE-T#WS12)
           - const: renesas,r8a779f0
 
       - items:
-- 
2.25.1

