Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 858937839A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbjHVF6z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjHVF6z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:55 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C8F199
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkDrlrrxYRBlutSswcvXm/zdeSX9gE16VdtxZDZ29KL429O/1Me1IYtFyxkNBlzDlAN7u71l2ywJP0OCa1G/kRf9ebtlByTi/j2CGUrGht5b269NgwCEpj8cSxq46zFAsFZwZAuNnoLsEBgKCg6+ALrhCMxP9Xj1mJpOglgcGjVmQtxqQ2ZUwRVfSx+eC8ihRgik9kJ/rlkscwIKvzGd6f+qKV3N1Gu3MqLOXtgviWDEe/ai1J6Ue24G1HJ9h3TTHwYcsjbtagMYV7q3bYS7FOlXDFjrKyu8dPGePUEmpIwmw8dy/wCz7gA7J2ma4g1bpsU5m3A0Wkdo31BlwtTj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kepu+4lIwfu5AoQl9WLbWxDqEZ8AhabHY2Cc+yCDWl0=;
 b=cnbYz71ssT3ZdwHyvCVqDEk6jUgJ6o1TtNa+d3MpP0qvFH46/N4rF7eh+KprdOvKbgHadjBhY7H6P/bsvDLosNIfR81UWvI2mFRxLmhN9tlOjs5LEi03KbjP7sU9kG0P7Em6w5XU8GmC7JYAVEcdJIg+kUQl3ZykFRZp1ial47sCxUSJ5m/pm+OZtOCqPdOLl+u8yN9tU1vB5lxvQg6zuFM9NjjgCycLaT3Q2u5Z/hjLcvxUvS23Rc03rhAQJu5aW0l0lbGojod6KkMxo0hyyXy/nOFseEU8LzbXxe1J7A504EWVt5CJRqVDmLZiV8g+yEJMMc5Hd2XI2owm2XdqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kepu+4lIwfu5AoQl9WLbWxDqEZ8AhabHY2Cc+yCDWl0=;
 b=mkQqp31XZKwdmnnAQJyRxtWJgpjy8df75yQVhHfYGc6Sygz7NZtPItg0Sx/JA/e3c3ceAE7uegrUuoythS54JzZhXEjUP2rUMVS+BWuGxh4I2FT0hOvU6or2CocjJzr5ogglyXX57FvTfAC2AaJ7n/lEGkFR+vpqU6HR/gd151k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10727.jpnprd01.prod.outlook.com (2603:1096:400:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:50 +0000
Message-ID: <87il97sjmu.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/15] arm64: dts: renesas: hihope-rev4: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:50 +0000
X-ClientProxiedBy: TYWPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10727:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c29393e-0d37-42d5-2bdd-08dba2d4db68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3usd4JOYDQ6upJm6eLRTsvg5JdroYHoJMMcagsKyHjQyee4VRPqYapVKtDbwS+/ewf2/r8CKYwniRzaKECFgos5UEVtnGKMfqTNBs0ra2btR2k/QgvZKOO1/hkJBjguM7EqLBEqXAaqWaDTYEStbtqKABQmZVwrBLGMEjPvKxCdp+RmP3YpV2FnpOZTh1s8r8hJrRD4jo1WmZdvZHz43zweyizueJwCifBA5ga56pcu10mXIloIurn8Phv+O4HjpjuU2LVEkCs4z5XDKTHyvA2DynkhkIM6tPgC+CBOOxiqxef8qCyVd8RS7n5XCxTM3EP/W20PzkFeVCYNzyFVIXFq57HdOnKGwqaomXfG5UyRzwFDAPEUxRkkvQyfeNz51WqAC4wszvf+SD+PogytlW3vXD4uw1EXm3GWf8CWrpEkMZ7K+ONAjCoNZjJkkOKk+CSZ3f/75Lu7FR5cnRRfhAorbd911QBVWF2SxM3auMuwJF2hdLdC6dm+5Km0PASqK4XD2MeCqnREd8w2QuBDnlB/iCXI6+6MKq+AGOKF5s3rBNs2a9H8kSV///ENVdyrVPbxcWs/VXE97bkc4UviyVPC90U6DHCXiyha9GIi7HKSbmCKf4TxaSPa/Y5Gc9cKy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(1800799009)(451199024)(186009)(8676002)(8936002)(4326008)(316002)(478600001)(66556008)(66946007)(66476007)(52116002)(41300700001)(6486002)(6506007)(6512007)(38350700002)(38100700002)(36756003)(26005)(5660300002)(86362001)(2616005)(4744005)(2906002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rp0qbntdsQXxEijq+RhVQrFfj2A5dZALi1oNMwEGY/KxjexR0XeViTVMzBWA?=
 =?us-ascii?Q?CDChto48NX/5DMYFk6MRfK+JPlKrukOk13/pzJLa8mnoioLyLrPrtb5lIUhL?=
 =?us-ascii?Q?HBK8nbFg7dF6Gx2oNZ3PAaOT+qn0f14Es3rRDj1MCzzw52AgH4h7jt48fbxw?=
 =?us-ascii?Q?ASd6THe/9JxrVoj++DEpnZnkZNy3dJWRPpO34YSg1vSAlfiJHwLbSV2AtYyT?=
 =?us-ascii?Q?yivkvUH72miraXxnUAzW4jGAjIOW80XG9+Jhs0RblX1KyQsjI12ph1Hld2KP?=
 =?us-ascii?Q?ZELe2WL44AXIYbkF05vz75NspkN/BtpdkM1ROnDdRMdBemAe2INp64wILyBn?=
 =?us-ascii?Q?HE62IiObtoRHO3/0y2FiQbMfWdvdHdMtS+dwaqJvDj/g2c3FMpChnSo0feLD?=
 =?us-ascii?Q?cytIFKon3CqL4w/878LRlPZh3yGZMptR33yYKG7aa+vEIxlTNs+0xqe0TWiO?=
 =?us-ascii?Q?Qjse1mOYtKM0d9rY7quoc34Yvui2dhkgXa6/D40rMJ9gaoGnKvUh0TJeunpz?=
 =?us-ascii?Q?JuSAU5vJClLoFgp+v7pj/BzMyMlsC3urbYeWggSoVLhDr5IHmmbz6ZuwDn43?=
 =?us-ascii?Q?K5n0Ol1lrnP0ghYMsp33sCEDaQ8WXbGP/KvZAgxR6Flg8KpngJ3ZhKLETxZA?=
 =?us-ascii?Q?ReRLHEbpagcX1ikkAOSXRY/nyWZWj3R5FiZ7qhAbSslvToeW6/1byYAP47sc?=
 =?us-ascii?Q?ab1ASLo5QKBtQjFky6Qhx4zH/B77bzSobNTwHEZGFguP0kVaiJrswAe95xWo?=
 =?us-ascii?Q?uYXNNZsBgAwXYLV1quCtFgo2on/2BVbHkjRoKzX5203F2bMxTAPnkwrUsirj?=
 =?us-ascii?Q?eDDDfj+QfK7Yf52czCkt1ausvFrVsbfCWcxqdJhxFgdYArXBGAAWHSjCWzQJ?=
 =?us-ascii?Q?cQz0/7HpBw2KdIkv29xtxK6o0KaW+U/evSiRTM14UzRavBpNEuaEBIQ2pU78?=
 =?us-ascii?Q?NleWaaSMuCWfmLKHHT6A8Vc25DxCBtRg2/Z8O2udyCEiPSyaMi4ci/mgdzw7?=
 =?us-ascii?Q?Q7K0ZsdWwgV/AFcVLuUCC1OIdhfuXxgHXdIzCoY25bok/tjm4D/xrjkHK6y9?=
 =?us-ascii?Q?Y593vCUBqYY35JNAFl3+W9kOCZ9S26fP5zswG7V0qhtNyUKus90DHiDLlAEn?=
 =?us-ascii?Q?/NkcsPXTii404v6575uIr8A4cCG64ntowaOSwY96aRalGKt/jVel5ezL5F/M?=
 =?us-ascii?Q?3gDYJdSCpw2Za73L0ULqkeDOmTgJlNDSi9+ex6Co8JSC2ZNoV8fN38JOLRGJ?=
 =?us-ascii?Q?RNzUVnkRnBpwIq0KGimjv0AIAc7fXdZVjvzwZaQKj/Gd6vH/63Ksuit/xCLh?=
 =?us-ascii?Q?1B9feUc24pS2v2PvGuM+tL8yfSp/QvWo7RFeoBQSnjOJjnZAM7r0Ylim3PWb?=
 =?us-ascii?Q?rhMHfDQlZJQTdL6SHhP/ULNJJrOnLjrW8AijkngW2PgTUqV9SINKXtbivEw0?=
 =?us-ascii?Q?jDW9can/ktt1B+BBmnP74sT10QGnGpdzbJlVcFoC7Bb+nCzy0NdrF1bRrecu?=
 =?us-ascii?Q?LkhDvx5nYfuIZqodGEtMR2f1m3t1eaF/S0wG6Neud6CvbvZriIKUZ41QQ5kj?=
 =?us-ascii?Q?5auSg8HIClY89qbvOh258TGhxIvw7JPKjy1n4unQ9G+VzH8+Tkv8q0SRrKBe?=
 =?us-ascii?Q?vhYR++X0XUFNgbZaNWdh/vE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c29393e-0d37-42d5-2bdd-08dba2d4db68
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:50.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRHBHmEm9nJwg017eay3ztLSV194nYqQpJFgfxXN9uOeENxPBhrMbmu4z+eNI2/ZPg4czZ6Q1MenCPDshDJe9f89zr0ovI+1xtwkRMasae0Cezon3jhUIl8dNDm/HNJC
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
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
index 7fc0339a3ac9..66f3affe0469 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
@@ -112,7 +112,7 @@ &rcar_sound {
 		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 		 <&audio_clk_a>, <&cs2000>,
 		 <&audio_clk_c>,
-		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
+		 <&cpg CPG_MOD 922>;
 
 	rsnd_port: port {
 		rsnd_endpoint: endpoint {
-- 
2.25.1

