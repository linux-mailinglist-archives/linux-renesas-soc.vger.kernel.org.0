Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEABF6872B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjBBBEu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbjBBBEt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:04:49 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2133.outbound.protection.outlook.com [40.107.255.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8921F4BC
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:04:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhpFn2ZLnPmmm7Z4KrTSUKQZcKufjBN7BzIjFKYPblmTQwwTquS1rDXq1aPx55tPJcmJGnd+vnhWlCLgQIXXWrcEuBLle9rgXXENNWaAC2mYEAsC2xD2VOghMUI6InvbCcJ1qVJdJincGXktRXeF3WasjiVmFScdJ9q7aP0z13RcSH5j33BVioJW0U/xo9/lYmGiRu63PNLNd9xWBMO2X2Jk8eGP2CVdIbfOIW+a/WzPTXa3Q7w4OW+2jYKPa55r+EbWtWHN2nAl+ft7NWYOj4cYzxgTs0hX5wlZaWMyKbAbOEW7GnEdgb/+Y3MF05rGtNU6KHQLYZD1W0Nn3JBi3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht3Oq5bN88Au93s+5oTaM/uSxJ0PPFHISpnw6CWihKw=;
 b=dwJAm29jyYVc2gQJ5yWyD9gaHFeh92eF2fwBR/hkqYr2HWpbja9WTTtJF+qBHUqxaTsldVFKT6Zbih+12xZ5y7BV0k1+VPs6FAVZwJyAVfteM43/ektBpRssIiub5iQ041qeJXVmRg9rZ8hc4EYIWfeJ+2d6w/sOBdzIAiYwgAW9MDBynft4sq1xHCamGsXxr+paojzgRNQQcjE8Y8Dr/JXPbXvP9zO5ON/chojPh5B8nQOuuMAGWPGfTqTjexFGhwcgMKTVtouQw/pYvsPKf8nOn4xW6n+qA7K6fiPon844b8tBBW5HH5aN4qocBt8q6yIxAyTv2XJO55isXWnUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht3Oq5bN88Au93s+5oTaM/uSxJ0PPFHISpnw6CWihKw=;
 b=Ri2OUTNAo9ucRViqvm3+o74uDAgyxYARIo9mYd7AtxU80vU+s7xJaWKpxPbFZ+763aPxWIKnfMBCIkz/MSEQ3qHnpMAX8R/hpTSK5Oc50Ox2qNKYWQAcedFHrYapNLR49M9PRkJy6DHFYArJcF/IbnkA+W7dBNqvUh+gZ2RvQI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8598.jpnprd01.prod.outlook.com (2603:1096:400:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.31; Thu, 2 Feb
 2023 01:04:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:04:46 +0000
Message-ID: <87357oande.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 9/9] arm64: renesas_defconfig: Enable DA7213 Codec
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:04:46 +0000
X-ClientProxiedBy: TYCP301CA0057.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c904d4-c581-450c-c22f-08db04b979cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +o6zOt+2zAkeTMuerhJLvxcxYy0/a1HQCCzfk6mEqCQ2wm/ZnctJtz2+maoFKxh2Q+s/h43GoNji68MA1zXLjjsguDs0Gl+7cqjTzx0L5oeim8rnUXlr7QtkwtNVDaHm2kBoYdglIaBRoC67RsnOseDYNdfi55YkRFSSiVyzZ/EWusXcBxYtRgPvw6Wt/yW6915f6uNyEJuG7b09XNAIV5KndoDM8GIHBokza0vJf20npZZ1u/5MW6DYTNbnbjEZbAzXJodnblENTpbLPtPuUwhA3DjSLRsNHvmq5dKtyqhyoOIu06oG4dKJ5O0oBZNxTCGDzcy4TBf5lhRpnssPgwlE9RVV3lbS3QPmvBGWyWTYIKBzWfLFKm6+gHXpoIr0oRBBS2po2rOA9y4LAoPSqdvkGC4/q5zFi942icFgVW61PM1oema/YwhYKJdX+8wrpsaucWoKBvyIJ6U6g4aRXaTglIFHjV62AHL7WKCOZqfypPc87Suun8PM3Dczp4beNP8A93Gpb1vBbcqyY+DohIensz2hZ2/lr/U4fvDzdFE5kERDmxcrBtgZqm9cU6Z1QtnztI0OYWiz4Ahg/UvVaV4wIYncwpr3VrhnoZuGz0i8cN2B2uzwT6HGDRTpZeZ1AC9jE809CSjrHvqFPywjRMkCgACUyl0kkLIhgOPZP49TZqJKisU1G1v+A3Yl0aqaBtBeAmi9LfSAMCPr5NOACA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199018)(186003)(41300700001)(8936002)(86362001)(38350700002)(316002)(8676002)(2616005)(36756003)(66556008)(4326008)(38100700002)(66476007)(66946007)(6506007)(6486002)(6512007)(52116002)(478600001)(26005)(4744005)(2906002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Grln7znj4Soz9LN4Nu0HheYNrBl6OSstJY8dXL4MLBViNdwM0MBlD2AhMgL1?=
 =?us-ascii?Q?32igdSsN7S/W4sg5ujC9b/Nquduq5kMDBGdZsfoo1EJpHltv0kHx0M8GLSlD?=
 =?us-ascii?Q?cu6AOXkUDc0Ijv9rZ/AgHHj4uodXTIQE5HPE+OSzOHQkRaXASxO95W+Su9r8?=
 =?us-ascii?Q?iFqrAVWNAfz/vJ3rzUbNsL/3G2tjRrzWShIhnd8AH3I1Cs5zg3u73lHXWwt9?=
 =?us-ascii?Q?T1PYS3VMJOF+euuTrUQalJalg2dY5EjKuNEOxaklG3y4k1jI1YdVLi64+LjD?=
 =?us-ascii?Q?tpI+uPd3V4uUzp8ndrxbHpL4tbc636SXLGtKHhnKDhvLV8kuNaPoe4wDcN2I?=
 =?us-ascii?Q?uerkIxqPSawiEJnMVvckN6e4sWKzEfnWRQrJ9+FTmnBwULrxSsvOUj7lIejw?=
 =?us-ascii?Q?Of6nnqQkQOjaAJMFMquiobm2pTr6u4FBFC6Kv3yaBSKjGrylp0rGCiSOBQtu?=
 =?us-ascii?Q?Zawk90SeUa0SPycBmTg5f/XP6hZ22GCWhGVmcxGaps01tYXxZ5AcUEynTg82?=
 =?us-ascii?Q?IGOQtt8vbZBW9IsEDEYb8nJLB6PEI+T2Nu8x0eidJTH44u8ZmrrEcE25N6wt?=
 =?us-ascii?Q?JO4ndSaw1PxOmzPVh36Ory76pJ9lE/Cy+hkgrOMQq9fhPqPTpSrXEVyR7rI/?=
 =?us-ascii?Q?P0Km+gzlll1c2O0WUlUZ3xmi7xpvzSbINFbQ3WiKe/wLqAcE3RgWR5pq5Q2H?=
 =?us-ascii?Q?Twv7rdwX8aDSBLHeiPZQlmC4x8Fo0PFaPC0uCaCW1fkes7qFHTuJEA1/NTvr?=
 =?us-ascii?Q?0qSwgxne19fE5CLLvhEOY26hE3IclZmaBSqowdx3nx+1MhmZL92f0xnYvFVy?=
 =?us-ascii?Q?iWniUd6DvS9rBMlJnmmVFs5GTSDmcHs2VE7EjY67SmOeT+ffAr+LqWUVs7rt?=
 =?us-ascii?Q?i+uCDJoHX145B/zaxTCr0X/ZxLhLdUv3nXiBjl+WZDp/kQedt0J8o66/CVkD?=
 =?us-ascii?Q?RBk9ZchoiI7h855U2J8uabekaP1otv6uz4mXuHt68vQCoUop1Oe062gzHwjD?=
 =?us-ascii?Q?fo5yPX5ISsx4p21GXjphD9W4kqQ/obbBlQdnN2PAeQ4FHDBx6VQ7jBLuUWAh?=
 =?us-ascii?Q?swgq/CTJFL1xOQUnTPmzpDWqFFIXvlhff6+AL939CY8/7RKZwTS2gePMHuC9?=
 =?us-ascii?Q?L+LBYM1iLsXlKrGZMaCkocArp+VtJxG5QRZjroR9SmtNLsrAQoTgE1uPWmYa?=
 =?us-ascii?Q?1sAMfBelAufhCs1oIIIiw/VsYDa8MGLamqIHgKY1fxt6upyZBmRzfNdRp/QE?=
 =?us-ascii?Q?E2RcZJu6FVZbhqzlmayhlq504hUghaPMU9C24eK/CHcY8N94oIoJkebe9Cli?=
 =?us-ascii?Q?pdvcGlhYAKMxpi8HHeEgIJRB4wUXN69CT5kEjmRtqnPLTUGXi4Dtt0CPqAjl?=
 =?us-ascii?Q?c09utjjyhrNyWJefNIgoS3JSbod5DcPJJ+2hOsw9u4dn1SgrFGJNA2jKuq+Y?=
 =?us-ascii?Q?k0U5j/AxSaskG5IxYPxTxZaWzbRvH5+vrUbS43lMeMesHdbt343YGPxphmnR?=
 =?us-ascii?Q?BG0qsSvyGgm+hzjYDCsglRumEgITt1ck3OWpvJkeOJk9h2NAyYoyybtYOYVJ?=
 =?us-ascii?Q?ePv6NQBPPMqeKaAee0C1T+ce59EMlZanEICqv18X2mYpyUwz60xVogAbjhPk?=
 =?us-ascii?Q?OA6njCHdzVs2ZwvoWn/6oO4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c904d4-c581-450c-c22f-08db04b979cc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:04:46.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlY85xzaBRgCeYiTDOhG239sMvoD7Hk8yCZ0olEZ6H1z1vVtcqxu/+qBU7XQK9JYNvijmIr7IIqVBvzKeRhJM9TCG0PYy96JqG3JJTM0Cg+wWFmEYd4g38WiaqbuhPua
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8598
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch enable DA7213 Codec for ARD-AUDIO-DA7212 support
on R-Car V4H White Hawk

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 0f73d81f333d..83f9ee4aa90c 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -286,6 +286,7 @@ CONFIG_SND_SOC=y
 CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_RZ=y
 CONFIG_SND_SOC_AK4613=y
+CONFIG_SND_SOC_DA7213=y
 CONFIG_SND_SOC_PCM3168A_I2C=y
 CONFIG_SND_SOC_WM8978=y
 CONFIG_SND_SIMPLE_CARD=y
-- 
2.25.1

