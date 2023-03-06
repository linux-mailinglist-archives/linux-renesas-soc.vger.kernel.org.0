Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 698C66AD303
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 00:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjCFXtx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 18:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCFXtw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 18:49:52 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD7138005
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 15:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C++nE5NACcjlUxzqZCjyl4FScGU5bgmu8eD1sFsHAb829HUaAoS311pJ7gXDFMvsWAfzkz63YknU0Xaza+i/34/xlyRyb8fdgXqp2AdpBoGwvdyePKYugfTfMVvmtLmr7atbRSfOtg9HlXP2BdJFVTOP2fjAZiCigmlqrGtNOwD1Q39fDQTOHKpsmoG7/zhwXsCIJMIWoKbDU0Jq+A3qYjd3+3W+2xoHxJ38JVld+ZR+jU9eli9N4j7H2w4Y53l/L8QqiZm1AfoMe99p98dOdq4nGmTMlA/liacoQKXk4/MHgCiIxHxpdpCAvbChlQY1E6aQkvKJdajK1jft06sRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDClAs1jGMrBWk6RaOt+rMelOnbYorNwMD0IPPcZR08=;
 b=GvO0LqMddepeYBfbYZyRjVu1Y5a4T3RRdXslnvj/N39BQAV2fIHM4OX1F8Au7h8KhptVH5NJgkNPHmClJDkKClzpXDR8cUaDmO5MKzGocP+kXdA2xFtTNL1pKlqDqkSnWsPIfCDmpau/smZO/XkxuEMk2FCThzMsOdRehv5HQFZgMNyEjvxiPXYzCMnb/JBXSMRdztmGzsefwLNfYVY4BG1Yq0ntjGgRV77wjZqltEYQIqU0DSZNpViD7x4pLyHtw9qpED0QOIdMmZmGDgNLWI/5Kh8jnHREIZmI6OHP514EOstZPzdMuFIcZIogu6x2I9VtP1LfUzmIcH1QPSfqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDClAs1jGMrBWk6RaOt+rMelOnbYorNwMD0IPPcZR08=;
 b=FZxa4JhbW8Rw53thzCTIQ0WNQsx86/VIJ9eeLfPX/05M396yEbwrDxvAMkeWsc9ZtkTMeXU2jjV3zDCf9xnfUsQbrIKKsFevhCn3WbFNt9zVT6MUdRYhJYXYOyS5HoXxwe3PxzGzb145GpDGLlWgtGBhlAcg+DM2ihwB/oFtCXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11980.jpnprd01.prod.outlook.com (2603:1096:400:3fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Mon, 6 Mar
 2023 23:49:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%8]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:49:49 +0000
Message-ID: <87mt4pl9sz.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] arm64: defconfig: Enable DA7213 Codec
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 6 Mar 2023 23:49:48 +0000
X-ClientProxiedBy: TYCPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11980:EE_
X-MS-Office365-Filtering-Correlation-Id: 02aa0fa7-dc42-40a8-7eee-08db1e9d78dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4wBMFmCIcXA/+mN3M8AZcCItYgn2fnJVVXAaGOjdcYXUIpBvkS6Feenl82uWKKMr+btSnNhE4qKC38ndGMfbDMjLNUt1WLgE7LGOu3aJFQSDWQMwXVBrqt16kpc2JAs0vjaCrh2FPljCahbDQ1Jrb49xe07Ms5k7C+vU5rYDt04nKVlXHdgFWM+0iPQHyM+zg8cmrdPnbR8+wbf9ywjdqDHXZI8H4tl+WhNZEWTeyaKaK5UJZ6ZNpJZy2VIXB/Y1C4hri+guGeOf0alJpf48v1nqIhIb3U6fwY/g872jGkQjxZFBPAu6/2JF87E2/KEDQFzWqgSTUth7ZCosAunMBvI/AgdDH5LTfdM1TpmQBMaRhKEy/WVpDJIiGVcQJlrK8WojELV3R5fp6XlqKw2kaBhJmJisJ1X4aYpvih5HmCuiPp1AVEvd7H5ikBEb5XeL+cYiMJXmVgkB4AwHizkwuLqvERWscaus3PgxT5IRbdG4jcBYiELcUhqWzP+L3D9xfeLwjVM9jJKU46Q9FbfewZzNR1WkYdfJAexHr5beqFWGe9bnlfQWgycBis5i4V93r0Ypw43QO0y3zDUeBKyiZMyvmV0/yR/VFZlFeYp6IIj43UhOSdRoggHa6oS3sg+64psyiNQOvAPffiAemasIaE4myjNPWVzC9jlNqrdOL46JCMIoreC+o4WoD2mrC3O0ryCe78bjTtFROnlr7NMCnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199018)(36756003)(6512007)(6506007)(6486002)(2616005)(186003)(26005)(52116002)(316002)(41300700001)(66476007)(66556008)(66946007)(8676002)(4326008)(4744005)(2906002)(8936002)(5660300002)(478600001)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZQqbQJ5tJ/dV1GPDWI8901o1Rn5bTmSoORxbao/oiFNWckb4SZ8ZfhNIiKM?=
 =?us-ascii?Q?RnnxubBBlwvGsweCfnm9VvLc1xZH502SeOp3A9IRfQHDKNWQ79lEVyq5BYe1?=
 =?us-ascii?Q?wQeHXvqm2kGdh0oDA6AnhFr9tLwLLasxmA6xqpyYTdMmK5xVIVlNWUIRY/lM?=
 =?us-ascii?Q?9DqVfgktK2D/kR0ClTXCqxsnskLmM20oTaiM7AMfRslFXaPs7WDiTDKe990a?=
 =?us-ascii?Q?scDkNL/XYU0y0XutN22yI15GlUBTsWynElyQhMGdCspUEocOA4G3KtYGrmO5?=
 =?us-ascii?Q?UQxS83rPWs68yWr6Q2OF/keYMoTJN9TSyDdvz/r08xFHl2C/L8TLqVEg1OXi?=
 =?us-ascii?Q?nT0Uagwm/ksK3T9w/UGvlX8zgTzh/U48eY+k3IrrSmzC7HfrBJxlR7Mi0WbS?=
 =?us-ascii?Q?yd1kKftDegyslk3o9uwydh6TcRKCMDyxSut+MKuCktQheU+7ntGznc9EV2D8?=
 =?us-ascii?Q?SwrR/IiAkOn396UX4X/mKw2WspcQ9Lcj0p+zIeQ0JD1KvXRqRSVbbOMSPtGp?=
 =?us-ascii?Q?2J5WmrtZZKg3uyBYHXBb/f+k8h+MYWlGPVPrXgmVNq3Q4EicvcUdhJMmJBm5?=
 =?us-ascii?Q?lLa2nnLRkUFhaLUSudO2Ge96+kxU+APND5y3U7Gdd/zPunUGTsOe/eR2vQMr?=
 =?us-ascii?Q?Rc/tWWIu3hs6tL7uM3tDl2x+a6nEE4uCp+ypXIkKzIv9ppvxXvGZqIpRWEoj?=
 =?us-ascii?Q?CNYwQ5dyUZvrDM3jeWJ908aCOH64jHMOavwOXb2XJbn3KAMs/HVGjAh67ztm?=
 =?us-ascii?Q?MslddLYRXUfEGOuCA9a00A6mWp+bWX40FJYN1vlmUR8/3CjkKB6FA/m25Va1?=
 =?us-ascii?Q?97KRhGnj6ozOORC9SatWUJsChZ3JpwUJFpqE4LRuLbq35Wq+3DQeD3dGMgZp?=
 =?us-ascii?Q?x+aU89dvKm/UNVYaKxt4+sMBHUyxcSdaUZQS2sTzHkl3RqmRIWSR7nHsf08H?=
 =?us-ascii?Q?3H1Nkio12cdbTTc5c2xmV0YQ7J6Yew/iUY9PguLIhLZlR+w3eaSGNgjfCRQT?=
 =?us-ascii?Q?h4shw8qeRVXXhSemxmDlrIosyJCbk2W+WR1MFBvLaVV0cOp3Yzwqk0uovTok?=
 =?us-ascii?Q?mf+LWvq0E6tr4xjgUOog1Lm3zG8qi/CoRUSM9dUwygNnSvmg4Zh6/1bHlpdv?=
 =?us-ascii?Q?SmpxznGoBKbnCf1A4vFpelBB4dZc6+4l/KeKRX3Az7d3gqsSi7iJb17SElOe?=
 =?us-ascii?Q?0odwpFw52/NAjT3aZJamqF7NmzdNrPLHMu32nRoQoS3RGtDe8fbITjknNCGV?=
 =?us-ascii?Q?kVWUAezVvSWXoMR4DpQjS+50mpO9gSQA3A72vyPeBgrgxHf9/rGB/wUTOqpT?=
 =?us-ascii?Q?xTJrYcnrzcwVbWTUR8J8m40ijwU04mOAcHZYK9+IcvM12qPRSRW0QosE9vdz?=
 =?us-ascii?Q?gAEmBazzZwM2MgCR/AQk5lbc5bUnlNOOz/xxmQBn6nqFa890dpP6zeWD0xyw?=
 =?us-ascii?Q?jCoK17xcoURt7hGAPiAY5AjkV2Sm5mBTpx2XC17Ly0dgAqOuN5z0UUVYw2ax?=
 =?us-ascii?Q?NbLJqt9dQGjAIsPxKk8b/8/cnWJeCk+hpOTNZD2ZjMfwyVJBiglDVBYuDu8u?=
 =?us-ascii?Q?kaLp7WudyT594i79o/iZLutcvTa3J34J4kpfVkD4Yyfj/M8iBHbgtR4TwPk4?=
 =?us-ascii?Q?pLvKAyw3VN5jvhaR2BVTm44=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02aa0fa7-dc42-40a8-7eee-08db1e9d78dc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:49:49.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5Do9MmZiJVI5fYUj6P1vOIPTYEUBsTymIcdXWcNchSmADUENLOi+U/CtoWu2DVkP63nuabKj4nrR7hpn1fwYEzJ3PPC/H104FK9IgZZ/WrDgl5hvLW/dN5cA3QA4qOd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11980
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enable DA7213 Codec for ARD-AUDIO-DA7212 support
on R-Car V4H White Hawk

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7e0487bbdaa0..153d5a8a3c05 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -871,6 +871,7 @@ CONFIG_SND_SOC_TEGRA210_ADX=m
 CONFIG_SND_SOC_TEGRA210_MIXER=m
 CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_AK4613=m
+CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_GTM601=m
-- 
2.25.1

