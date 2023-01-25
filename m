Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF3967A91E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 04:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjAYDLn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 22:11:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjAYDLm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 22:11:42 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DEB926591
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 19:11:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlJccXcy8ZGO0+K0/oUZct+q++uVVHGcebG4kDMJQ1Iwr8QQ2bkhkO7Mde31O/rLKw+L8aYV/cTvi2F1Ln+YNwGjcN4g+4J+XckN2BNPGAhE/pBsccYdCXrXPSyraLhVY9xm5zDdlEAkUfz7eyuSgpvnJa1YPafIKCZ/UMagjBhpaOi3x58G+09+oCtXbZPeC9kkSosZuTPgWNahXq0fL4PbpcAY2YEHjb7w8K6duY6U0zazMMTyIJUF5KFZDCU8OiJL8+rXdbdGRE3juYDz6vgeJiMR7zfW+VKzSySXEYqWrvS3L216Y0Tzxhksuf5Jy4jdlULc3zZto/h1ltNyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2L/HzMuXu7uqZQEv4c3xpNh8mTsLFy1vIePt0IO20o=;
 b=EfADs8i6Tb7wwXK7qDewm4WJlRaGKmTO+TecB7AIZPPf0qksTPuYjevT0WOjngmfsrrMh/tIcP2xIf9pxsZGVJsF0466kptvK2g0tq5Qw0s7l6wTJT+y4TeAk4FIntw8W8YUSmrtxbgjuFsIJdFmJKp4tg08kUw0FIzotqB3HXzGketHlm1PVlnirbhfB/wacmEGmW+kL3b3UL2hon1mCMzTmgONDfC8Ba2E0bkCCws8FclukNX5v4UGl6TWHtVGZDrCDs/jxdJOdnl1TquLl9RfeuHsDt53aRn/FMvY5mGMS5MlPllX5fgRVOk7eimbRh2UwmhpkoL7yy2CPbYiQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2L/HzMuXu7uqZQEv4c3xpNh8mTsLFy1vIePt0IO20o=;
 b=g2qHJ09QITbEXehfIhT/QmSISX/hPN06f3pN5lxYxKPIXLavk+ByomGHHA5y5M1623WBblScD2AYNKHF6dSpu2OxaKLpRGfCWhjduG8z1dA00bva7FyBB6WWhsDrKAfFAIUSRrL04G4fJoM8oqly4t7ZNRm5v/9SGbfmAVMN3tU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11199.jpnprd01.prod.outlook.com (2603:1096:400:3c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 03:11:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 03:11:38 +0000
Message-ID: <878rhrfgv0.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: dts: renesas: tidyup CPU6 connection for Audio Graph Card2 MIX + TDM Split
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 25 Jan 2023 03:11:37 +0000
X-ClientProxiedBy: TYAPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:404:28::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11199:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a8d8ae-3075-4620-4d33-08dafe81df59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RdGoJ7fMoov1J+9ub+6dV9c9FLDNUPaP6/WKmCFB5mwlw2JknKoOYKfp3PHtftnIjdBkVY2ClKHa3pBNjHIGwYPA53kHQmHXkwDJEaRSxO09TaTbmJE2Em4yS2FQhMRDLt/UDpMUI4CBBISydwtLYo1ka6K3lxZdQOFOsxijgj5DnjEIruq7v6cMCNE+0mqkBJj5LjSRE9WrXKFE3gq81NjSO51JblW69WlFM5uac05mbkfrXQ3dDYZweg4UiIC237wRaZHLBhElFBbhMRTRQLGWCiCOjvkb8nZfAqzUX/pw2iHE7/a2ZHYy6Ie27s4bTR2Fb8C9dMVu4zkmbZW6rWuy5w4E36BXtrOztfNp6AdPrgMO2dNoD7bE/9ocO9iRn4Q3F7ZQheRP9/+XsgsBHRoWwA8M98i8JcJwrEu/BgXC7Nfg3gfQJyo0yVKSKFiWV6EA6rzG+0dh+DdAoztfSylNEGlexTK1IRxO36LnqJb/QZ7GB53nBuQehzMs3JwC6cBAvMbX3sTvD+P12ZBVB6hveincmFpGnTz+g3OCkKUH9gMzlFvHLDRG0bCnLB/C7xv302R1kG2bGrlOACWnA/rcdvSsSPC3xcVfdZXbY03x++sQhL1I0XX8FutWgt6c2PLmytfZQn6zSjEfdlc+gS1Befwwq9Sew9eQstYbDHJD3HOyhEZbRyuQZvBEO/6X7m2cjiGSWWVYGuY6KqF5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199018)(86362001)(66476007)(8676002)(2616005)(66556008)(66946007)(38350700002)(38100700002)(36756003)(6506007)(6486002)(316002)(478600001)(5660300002)(83380400001)(8936002)(6512007)(41300700001)(26005)(52116002)(4326008)(2906002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JIqlj5K3KQII/D/gHyDU29X6ktBcdB1HKBauCzloq8rQp5Nwii1A96hacv5k?=
 =?us-ascii?Q?WSELtK4yqVYC0KA3xJkgVX/uYEK9qcCDT8SBojk9dLpZXXFMm4UyoZ8PzfvQ?=
 =?us-ascii?Q?SgaioustpSNVgR6EU/63yIP99PhN4HP2TgawZslzC8lPOiWe3B+S+2nlp6ma?=
 =?us-ascii?Q?BbTq44wkQVUroyUbOPc6oSCroNYDvLhhxXB/51wyt1zdfSRRUcDmG7epXxv0?=
 =?us-ascii?Q?O/4UO5rsqFWXjcE/eggs9u6efhckbRFJBm1/fxUHYO7j9eh0l5HLRAkY2clk?=
 =?us-ascii?Q?fPcK9A81R0P7JLTKxxekC+FH26Ulg5SFjSZS00F+jVfP/qs1CiWon0hDLfL2?=
 =?us-ascii?Q?Ro3z9jHD0MMJBUtHR398rZPGS9pM+69wxXsc563ybG9GF2rbu4vj88k1CKbm?=
 =?us-ascii?Q?dNjXJVq+T7uo7h/VhiASIhcSicmHm6GoAzA+Ri5AZQ/orL2SK5m6W5/SX+SF?=
 =?us-ascii?Q?xh+Y4Fcgz2C5nduczKkGM9HIX7h744Dp3zRPKVAbjogfn7KYb5Lu5ojWgOiN?=
 =?us-ascii?Q?tMKTTLDvXBUGTg55r/5whP1bOBoa6CoL+IxGTaDktBpiD1GtRzonwJfe9cTL?=
 =?us-ascii?Q?v+Ae0+v7E97Ug/a1E8s/NgCqatncDxQtWfq5DmhjWEZbPJoOzjc8JqaDc7ks?=
 =?us-ascii?Q?b7HfBtAnmsK8/5v/E7vfPJ/Sw3Kz2/0JBmaCXpxqW2UG4hI5rg0CGgVngeqU?=
 =?us-ascii?Q?2Y8ZXNLyOMAcMPzADHPJCmjJdOMp6gzMYJV7EFVUU8kklPvqt5JH2v+UuBmv?=
 =?us-ascii?Q?uNMiUXsDfAkW77hzXrjMC9fKQRigiVeJz64hUzl24lhjqmHCtu3UHUOVqEnP?=
 =?us-ascii?Q?J64romTRRjiLCJfXT7TlhabwoRvPyO2qexGNW35tYVPH+DyfeHLPN5S1YKwm?=
 =?us-ascii?Q?AeLgs1NsjmFgcXRIERPdhn+K8gFnSvFDM6H92UurqxhhMQo+UzPa0V+SPhnt?=
 =?us-ascii?Q?ZmqSmNNo8efLablL+RF7CnJ+KgKStZR/WvsLQThHMilmW18F/PCQJ1yG3Phg?=
 =?us-ascii?Q?tWzCOX2eHziP3sfUiST3DjG6kBbTyyJUoqU3fRkUXlQOulm622of7oLksdqG?=
 =?us-ascii?Q?tMR7mC0mRgV9P5tAVJj6un0H1hIy+JnRYszbJJv18sU0lCDbwu0a+cnfz1Hd?=
 =?us-ascii?Q?q8TTJA+7EICB0O7F3u2KpoZ1k19qfg9NypiPvf/sTkf9IHYJRKfqWTNK1+MT?=
 =?us-ascii?Q?TDGU7S8PYx/fRzqrSWKWtkD/FT+T/sZjMTac3otizp/Yg0lyBdxpu7YiGQSm?=
 =?us-ascii?Q?7rNJRtkIXtPwq+SBe6QwqXKVaXOlMOvqjkWQT6edzpjoBcvrrGorDL479T6k?=
 =?us-ascii?Q?Ujr1peJ/9aQE4R/Mm9K+3nuiRx+X1gVD/zANbi/sGQwNlM5/4gqFis07ctuU?=
 =?us-ascii?Q?yqV+lyPDhq3xRmRhZ3WbULCajMzslOFigw96qM5GUgqfjuokLkl/E4JaGfeI?=
 =?us-ascii?Q?sSbchg+rGuJMOBQzj2MJYe8FxPKCkacxPJg8U+IZ4Ao9jyGxkO4osHcKsdlA?=
 =?us-ascii?Q?NbFHrJg/M1jxsznX4HwJ6bjHidur1hqDAIbbzvQWhXCVTQ/sZs0e+znVBd77?=
 =?us-ascii?Q?mVYV4z9RwIdleDb/uAcHrcNc6Pq8CG7rk6JHvy6f1d2a595UiZk5y7t9L9+H?=
 =?us-ascii?Q?GE1GIaUwNbwQHCeT9VrQ/dk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a8d8ae-3075-4620-4d33-08dafe81df59
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 03:11:38.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFkNt9Yd+B/GGU0N7o7w5Oig9+RHHIHorDTipPVG4OU4fujVzVpkZ5w0f5CI7eDPyyZjQRq4CDE6ZlF9FOUMVty/hrapb4HWBWTk/+ub7bvs/Aagpw/ogtmqBfcE52Jc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11199
X-Spam-Status: No, score=-1.3 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

commit fb10d95e47f4 ("arm64: dts: renesas: add ulcb{-kf} Audio Graph
Card2 MIX + TDM Split dtsi") added Audio Graph Card2 MIX + TDM Split
dtsi support, but CPU6 is using Capture, not Playback.
This patch fixup it.

Fixes: fb10d95e47f4 ("arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 MIX + TDM Split dtsi")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
> Geert

This patch is for renesas-devel/renesas-dts-for-v6.3 branch

 .../boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
index bc9b89dc6eb6..2432eca0f610 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
@@ -170,7 +170,7 @@ rsnd_g_ep: endpoint {
 				remote-endpoint = <&pcm3168a_z_ep>;
 				bitclock-master;
 				frame-master;
-				playback = <&ssi4>;
+				capture = <&ssi4>;
 			};
 		};
 	};
-- 
2.25.1

