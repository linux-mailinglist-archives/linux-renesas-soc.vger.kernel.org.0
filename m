Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C64E7839A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbjHVF6u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjHVF6u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:50 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0330185
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QshRDzkJWMLpVfGb6bp1eUaVISzF+k4NlGokHz/relX3DkIXHWmf5Jo32gqimB/6tX6J0wbml0htPaf7mU5Lz8oXRMxQi5bldepd7kFB4rGxF6gWaHgP+GIk0MRBK0r+y7EeNcFhYDT4a06CEljiKQbnblQAkOF8XE0BTK30yfHLQ6ETkZ1rNCBlKepQJ1kdZrskSGLGzYk9H4+xdoFJekWx6oG+YVeaxAlD3NiiCaTbq3MGg/rOJ78+UnEE4GoIph/KixtEW00SXAn0/cbt3CKnLG7pQq/mTCozLMINJ97dQZQqZnNrqplTYcZSqtgaKMG2A1l5Pxw90MSsD3skow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKBerT5vsqgj/2slApzUdPGiUl4ha1dJejDHZuH1AOg=;
 b=ln5wNgnBprbGyGsTsriVRWk4Xxc4oYkNeSNRe29jSuwQ66vsDzuebOGN9o5cPNzgO6GZVMMo/c7fOWYcZ8xTqHtMU3TYaJnRRl5Mu19kBhFusBFvbV4yklLjXfo/p+jZKTIwo9RIcTcLK8IaUtjfK4mNzrZrYXp5pJem+nF60KueXlNw1cCyb8JQwja3S5WBI1ABycw4vY3e6BR5Q1r5Ps6CK2/H/zVvNQPt8w0Cu+XBGeVOG/fDC0ru+Z2HUdGmhR+zpUCdyMTMdB3PqQh2UtsCS/mgHB3LJrKSBqBTRIU9pIzDE7Vf/TLWxHysKZjtcQrPQL/mg6t1eKc3qPy+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKBerT5vsqgj/2slApzUdPGiUl4ha1dJejDHZuH1AOg=;
 b=Es9mBSHnNvZNGH/snauMsPHOJC1a6VJqwzPDjnlYJjzjpgQlx7stoNetq1ffSIHIAs+zTmKqVSB7sfCzFC2X1FJPrjOeeGE/HnPUOGwJAAOUUJe8HGj23bZgt3akOZNE6e1W2DdjVceNlBwH1KQwOP96GTyTKGO623aZ/jAhIyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10727.jpnprd01.prod.outlook.com (2603:1096:400:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:46 +0000
Message-ID: <87jztnsjmy.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/15] arm64: dts: renesas: ulcb: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:45 +0000
X-ClientProxiedBy: TYAPR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:15::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10727:EE_
X-MS-Office365-Filtering-Correlation-Id: 471cb71e-7781-42fb-f0f1-08dba2d4d8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrsfn1VRIve8ePLm2SYqzTVFMhxStyW7rfhqBgPBNu+wSqBcm7crgmeEwXNo6Nt1ItnkpbV1xRuN3bvbs/CnnrtVQ7lV3RU2S5cM7AWW229nH2URuA4L0IU9h790kGyKhTrsLhVHCjdChYeWsRHrnPOg5kOO9KeWbCxB5qeMWrTZlFzVwzCsDKXmhXSflz+cPirlIZ0L6LownrVw9D+9pZJI0jHkkzn6f40ccMkbfxgAsIu/iybihKPxZNT+3NXDu8fLiR9yodY98R5WIf9NPqqdejNjbCO5zOkkwwEZgPMNPxe5814nIBJk2BfZDllkgfIOUiIzXoO1HTef22OZ7urH/Yf2upv4bLSTagCr7jBkdMAhwXvXljG6qkpSdSxk91VSryV5To9C6OzGfXzAAWP4E+OU+fJ+ViMw6sJoqvBoXZYToXYx4P1oqr0uWOXL/XobWk/JIogTF7fHbHE+T2WuM/o5nH8k2i58AXrd/5CdFLWJKYhPkzT3tN+CJyXaNCDq0TZ82zXmVv6sJGfH+jz8p6y9xB+yeHff34dlZNd+3cck4Q0bdO+k8vdn21CJXaCTEaKEsCvpCzSF1nbMJ8cD8bx8cFncWll/GzCbQa9JuxZZ8/kSH9Fs/e/jKYd+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(1800799009)(451199024)(186009)(8676002)(8936002)(4326008)(316002)(478600001)(66556008)(66946007)(66476007)(52116002)(41300700001)(6486002)(6506007)(6512007)(38350700002)(38100700002)(36756003)(26005)(5660300002)(86362001)(2616005)(4744005)(2906002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Llcg00CqnCmr8yMBer5nAaLQ1jax0OUsaRrCLkSR1dZh1TsahFD/2PD4gYne?=
 =?us-ascii?Q?Qt7PgCdeGBCzgXsVBVNWTSJWxgbMZHzWcGOpO+fireVcQNghfIxw8luOmamh?=
 =?us-ascii?Q?Fej6yFxuLDzNCV6QBiDasFVBMoGWrH7dYNm+BOTbuNqcNe+0+7BZkEUUuEUH?=
 =?us-ascii?Q?HJoUyEUaHp/bWdPF42rNC4YDMqHxN2tS5PFTppKV4pIV4TE7UJu6IvSQWJN3?=
 =?us-ascii?Q?lHz9mCpNyK6VrcfvAM2zfgg1r6+w/6IaocnDK9S6WI2+E5+PF7UL2ulJNJbO?=
 =?us-ascii?Q?nsdIHFNJgeT2BmX8aUl7eNkh1RUwneEKuPZB7Y6hvK/AAtg9S6KGuTNEb5oz?=
 =?us-ascii?Q?TwS9nXaSd5/CyXa1IJy1TwndfGrYsitwd4ysJkQ+XfS0Zp/lAqq4YhYBJfsF?=
 =?us-ascii?Q?AfD247r2cc0zuqZt+FQq+j71qELZYBxYMaV45EeWBvuUM/KvN32nMDwiAiht?=
 =?us-ascii?Q?76f2nuydj/xP17Gcuq1YbTioQKe4wol8vaDwh6pyAiYUxGloOkB+rhHjy8Aa?=
 =?us-ascii?Q?DmyM03cKyIIhw2WJCrocxUudqZf4G6AaxJXcOmbs1UxHIY3EUJG4e06XXXDd?=
 =?us-ascii?Q?ZOKJQcjKM9ZViy+qV/Rh84SGPBHOOV7bU8TV7SalHw6ecgeV3hxia2FSSXjS?=
 =?us-ascii?Q?2Xmdi3II169xyOxKulO3piVeIJ5yChiutFuon6R3NS+Wn1smhxyg3wAP0M+0?=
 =?us-ascii?Q?hSeS3uaKruTwKQnHVX3C+cJs/Qm8T33VYpNaTcoI8HJ2wduKUAYUJAOCXnnv?=
 =?us-ascii?Q?4syzLSWtdx93oleboGS/js1Vn8MyZ63GEUwvWwrYH+10F67XtZ21ZGOb7SnW?=
 =?us-ascii?Q?Zr1EQS6dhAGr+l8o/anrncfYY3Iss5tlZ0G2oRMpzhD4tgJIi7B3dk/iV4bc?=
 =?us-ascii?Q?qZ2fMZ9PxrqylqcO1yiXroa0QoudMxtAwQ15EE1SIGWwDjWP+RcScBiPZR3N?=
 =?us-ascii?Q?JQOUQL9Ujd/WTXsXGyE2xtkcgGhMwaY+mLqbGnUW/sRsZk95tG09T/rkov6p?=
 =?us-ascii?Q?XBzp3mPzhi0icGM+1I3xok7pEurNBOCrn+LB/EN3xDbSTBaD9yq3NNT7H5x8?=
 =?us-ascii?Q?4HFR7Nyyl3VXiGbY6z3QtwNGf53dXqcIEt6nt7zT2TAqDEnrNd9MCpmHprlC?=
 =?us-ascii?Q?NuMM8fbOLd6tJZ1Fp8+yOJoudCk0GwgdNXgI/GY08oPfhtTsM8x7h3ffRsdP?=
 =?us-ascii?Q?JLJguwWs9qANjP57FfhgrnbqpgRuFsBGGaDbZT0tkv83BAJx67hSz1Kn7x8F?=
 =?us-ascii?Q?s0LqGEgj22z9i7JSjj/KQqEqQyDmGftYl14Zn48qOwaDLi3arYVyau2wquIq?=
 =?us-ascii?Q?EL7uk9RiXVLJVO0WbRU1Nae0xpymcbNyAyY2h1PXWn3ajeGCkVBC1pSKR8gF?=
 =?us-ascii?Q?A+tL9Dk7ywwJxUf5Z+CxAteqtic8Ho52Tx32XT9uhDr1RKS8vfk9i0jWZ7HZ?=
 =?us-ascii?Q?xxaKoN90iBvM2s3wkh2BKzLgt37vTrctgpSYVZrlVA9rAhIWWWO4kIuFxjlL?=
 =?us-ascii?Q?OHOEaP2qvaf/cF65LOFLRiEPoBjLaSngU8jhdLxsp2sJFIXa6LxikfZzIcKF?=
 =?us-ascii?Q?lgZzs/8EKyigUgLqbkdnTHrVYGVJAJ4YRFmiMOM67Rx1fZAKnBBLr6DihN3P?=
 =?us-ascii?Q?hAy/9wTb19wWo+VJmWwqTcA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471cb71e-7781-42fb-f0f1-08dba2d4d8e6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:45.9819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sc8RgGY48308vbow7V5KqDR3VTR4XemmZr/buS2/QDI0hegN47XbX0uwk2U+LZpYSOZITCjYLlzZ7SsCubg8YufYRll2NixivsEiVAV29sUk1ozXVvXIuOLhtCYomtFt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10727
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
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 0be2716659e9..a2f66f916048 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -383,7 +383,7 @@ &rcar_sound {
 		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 		 <&audio_clk_a>, <&cs2000>,
 		 <&audio_clk_c>,
-		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
+		 <&cpg CPG_MOD 922>;
 };
 
 &rpc {
-- 
2.25.1

