Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54736872B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjBBBEo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjBBBEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:04:44 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2099.outbound.protection.outlook.com [40.107.255.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298366A69
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLXrthtqe6fm0E5qpFquF0h86h+fbZPjxH9KUC8VlDH7L0NsP3E/C8T6nOBR5yuKmTNpEca/Rv/tfw/RVSUEMAuZdbvxzaXTT9eWMWe8UPFGJfKUryH3KWM5dfn4mwFK074fskGePzMaFXUOcPUEXT29xMxE2ExXLSHA5HbLe0AVHmkQhX6Dpwg/EbIwEI72qx6jSzjQgakNbAbkGXCLKiNoSQ/C1n7PyHcR6v5TIhl2G3YPH2R80eN3jGd1EPf3LkSKztpBV4Zh3u0GBNedYR9DcBN8aL8STXmXPfm2tmaeeQfjv3Z1pswfuOR9Ux+QXB9FyptL3Q9Z4hVSO0HsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxV6J7Lr87Pu6l2OyO2mTj7zbeayHTiJayQW+pmp8F0=;
 b=aYL3toGWBhyjToM9rat6K++QDBVr49axSwM1e8xqNJHT8ailq9wwsr6iLNpu6IjMUtzSBF1CcW98bqjn8hggL9rIyLsT09RdmbmnxrkOW53eyi2ztRANvF8xmIKui2N7VbnPBD/I6fxpkJvDgX58Dwk9NI0FyCUOVvKUp44zfHhKEeercEJR3/a/Ti+yHrmpRoddpMmdhD7gL3vAELrNr5SccVUJyGkTs9iLg3tKcF49UpSrkoSBI7KV1jEARMB5Dz10hUbERgbjgRS/PkXyDbjSN5sBxG5U50g7EC/wC1RoCVp95l7XCpMrZKFFYQWzwVMS2Dshd1qeYPaQZgqs2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxV6J7Lr87Pu6l2OyO2mTj7zbeayHTiJayQW+pmp8F0=;
 b=ObpylTxUOOR1j4h3SxRIJ0H82SW1VkRwetGsVd/iSglG4ibwLVRsGdUGPWw08AJf4yNaWi423FZ5cpmr+kmnlcpaTheU5cErPECnTHWman1XYl1EKolTUR17cIyZgOr49y9p0h+nBjAWokx6fsFqYYCQbZJJAp4UqL4SD0DIFus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8628.jpnprd01.prod.outlook.com (2603:1096:400:139::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 01:04:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:04:41 +0000
Message-ID: <874js4andj.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 8/9] arm64: defconfig: Enable DA7213 Codec
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:04:40 +0000
X-ClientProxiedBy: TYAPR01CA0001.jpnprd01.prod.outlook.com (2603:1096:404::13)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: c002f02e-8d90-4285-5b04-08db04b9769f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: adyrl5kEgtIItAj+LV546/2HBM3UeOTKG1I9o1E/3kw7yWRsypl6PM2qmcr/Vcs69/u9UdizU1GxcSJuozg26jVkYLZMzkcoK040q5CZDxo464ueOLp9lVhk/YCdXLxgU4Z56eXNlZBUN0rhk/88dvMjCchtkz0HGA3GSEWHf4PQJv29NVR6aiAY+XRKfXqoDs+t4END6V9n429fWrXGF7vhIlrH2zj76yx7DFy232CuoD6DbS1jpeiC3IYSOm+FI3KC/rhwXuLCGiJ27zh2QWN3imgNZ26fY4Z2yq/s+U/MM2IksHQAG00YzluUTMYnyOxwOdk4CEdePtfYPpTf7RgasV1XQH141OPyHI+X7bhHJumm2zzDK9XG7gGugXLrWT4gSIvi0shuh6O+gJlRmOGaN7LPl1p7HQ9X4TAv0ewF34RDxD5hcArGyP8UQJLcUdSB7SYKj9WgTfZxWQ23Dl6ZmyW+qP6ZZ7+z9vPVOKPjLtPBk33J+eEC/bsqCtnH4TeO0OISNsLiW1Az4AOw8N40oFqp4yZIjkEP4bEP6i6bCl363xmwmaQOqucD14TsMgwegwAD4iV+0vYjrbBe+R/wK7OM0/C66qoBP8TbLNwVgOHsugtL/ygagFWJpZoZLOjk2dntmbC9eM9/XGcqyrdOYWaOq9eZjCexpBcMFG4A31bTWB2zAecIpHCQ6/mS4vubn8E9DjnFBdoPdgSjpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199018)(36756003)(4326008)(8676002)(316002)(86362001)(41300700001)(38350700002)(38100700002)(66476007)(66556008)(66946007)(6486002)(5660300002)(6506007)(478600001)(4744005)(2616005)(8936002)(26005)(6512007)(186003)(52116002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?scTwW0GuOOhGrP4t3HaaFIN3TaNhNr0d0OYizMHmUBZTWf4fDEzJNXPKAXKe?=
 =?us-ascii?Q?P21I2XmIRT5hbg/44vj2uvgPdLHlAm1AGCEEQ9nEQTuJp+jb4v/Yy5ClKiJP?=
 =?us-ascii?Q?GS9ZN25jYVnLpGElLZLcmxl3tNpTeuFnvFVMUTY2llLqzgYkdskrQ6Wulj2x?=
 =?us-ascii?Q?76vyCHIvfog/oWXn8qu2RJeMDgp1qcoe7sCaceuaY53lvngJkfsMZ+3WMWsQ?=
 =?us-ascii?Q?T6tqCA4lAuUlgxsLyjXyWBkNk3779SkC4Qew2KD9oAQvW9yDVl5FCpyzkZck?=
 =?us-ascii?Q?L9QNIy3+nyVRDxWxpomx7+adnSt//7bix/de5pQI/KupZp2Y+IWFce+vyivt?=
 =?us-ascii?Q?jWzsxJUMS1oAjBUXCyMSGMlc6r9lRJpd4C7uvxYfttxRI+NC9kc6mezTiOHR?=
 =?us-ascii?Q?yXCYH1p/rfwjbm2TioCffVpjM+8kVD7pV2uh05/I+ED1iSlbs0Zb8oKQYmpD?=
 =?us-ascii?Q?3BLqu6hTqGBzJkWNtqVbrO4zJgg+BjNtNqw8i9oH67P6KyR6bKA1XpYNfrbi?=
 =?us-ascii?Q?WPr1Yx3iKh9a7RiDo3mCkj40WKMYwGau6kR3CVNNzbHxBVri7RZE9lHQHHrO?=
 =?us-ascii?Q?4hRnTTR+SzM+ZqV+UfcNEiS5h5T6fAHO6ygInI3CBi0CDF3Ubx8RrLDVcLXw?=
 =?us-ascii?Q?LZA7EaSIhkd3gBifItSdSB4oaq+Lvkdl7hdPBDUWxl/9MF7tQOHIuOb3uFVx?=
 =?us-ascii?Q?jU64I5pj7YQ5kzKul3zW8LMltorb3djoYWn8whhXEXvOeLyKoCtfEsXcLx7J?=
 =?us-ascii?Q?xgyAdTipRy8Z5YQuU4DFlGrOLybLxXYUzu3fwnmU+VmXhF7IMkRD54uNiVy9?=
 =?us-ascii?Q?TFuGxUW/g4No/83blu8zbN770NJDabGPFx1zbfi4/zfCbxt4klPJBxX+R9Aq?=
 =?us-ascii?Q?m5Wg0acytvhfeaAQq0l+eez3qWqz4BnJXs9MniQhQ6h+KseNjoytv0N0J4D1?=
 =?us-ascii?Q?FvHiqFU57Q2a5qITtJo8XUdCmUh99/KJTpizyCxu8Eysd3J57Zu38Uhihf25?=
 =?us-ascii?Q?+lIErmiK0lI6Ak4Be8e1jdJtCv9dDdatFTH02kOfTQgSy6Bt6bxPyL4dFyjp?=
 =?us-ascii?Q?UL7BKlKG47gpHz+iY47FdyIEqFqnHMWQaG5/KXuZf+DO4VP5TMg1AUP+xO5B?=
 =?us-ascii?Q?gXSQmVrLWVak89+FrRYlpi6XuaC9mBarLikevdvNqr8rveTqXE0TFOIJKER5?=
 =?us-ascii?Q?7qo1SrEb8Ka5huu4K5dZ+AhBs98tCBoPiZMbMjXHaFuQx8sQMov5tPW4ACkD?=
 =?us-ascii?Q?S4RbMNOHjccBS4jyK5a2p9wOKtGffWHVXXX/As32hEXZm4a7vwwtm3GOUG2v?=
 =?us-ascii?Q?oshsa6kXpH7tCxRsrUHrgGCVo8WsTigUHC2SVk6oxwarCY36QEYmfrQd0Cri?=
 =?us-ascii?Q?krcAh7oK5LFad/pJp6AljNFdNsWdBdC8fYfBpFQVd98YPb4/Qux/VSrarGqJ?=
 =?us-ascii?Q?NVL8gdkVFG+Jx5k9bQyAl1d3AmU6pzR1te9VJI1EE5Ub4sw8p6IZyF6EGYFu?=
 =?us-ascii?Q?Ng+/Smb22QsgsY2LRrL5KgxfDKSUkvC28DqXqde41VDk+D4MyooVVKStEzAU?=
 =?us-ascii?Q?GKaWMkOT4Tu4jYkwJuIPfseEu0Nc+KNTi8uz9k0Zu5Xyo6KYgyg2zRR/hxGX?=
 =?us-ascii?Q?Theu3td/gnuJ7V1ztW3L7M8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c002f02e-8d90-4285-5b04-08db04b9769f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:04:40.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: letZzMXfDQpChhcos5qylK0toEprbmm43dKvrf5kRVQphKgdN3qsIqOteMAgIwd92YcDiu32/dzRV7I77vTRAE6mxwExURvWVgB7hlXKdh0qZuJjDY0RYVIJn1e8j16K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8628
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
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..f6b0505dcc79 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -857,6 +857,7 @@ CONFIG_SND_SOC_TEGRA210_ADX=m
 CONFIG_SND_SOC_TEGRA210_MIXER=m
 CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_AK4613=m
+CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_GTM601=m
-- 
2.25.1

