Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75177665008
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jan 2023 00:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbjAJXq5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 18:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbjAJXq4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 18:46:56 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD48855843
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 15:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQp6Yu2Oh47/QbqjtWwMLQzdwhjwsAEvIneAYn82+Kkl4sTLZil7KJLeqj1rqZgls4tKUMhGVAhOV1vtKOygf1yDnGQJMsKByaA84TlREgWbXF16ihHWHIG58hXb4gThogUEb/itOIuQPd/+X8CxKU4qrfUsOkC8sa9jrJrgVn600Z2zRhdAQ9NG0j8Sw74sV1sQ3qXHVfxQvPriSHgegFYPCdpMGYnZ9qKhqcHwUcb2YCcmj9MTAy52hccyEVc62NNV28HCRKkj9hgcSugMDEBKm+PkgXM9X886kQsAlP0fQUPgRgBCOL+u0i4xgtrnzpfPYZTAZlZF6LxqJ7BzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s+FS5ZBapzQWxqiVWQQhnh+XyO7tE6rVA2qlHqgqc4=;
 b=V7p8x/7oAL/Csu/3PwLkwxI+fGK3GIqBBxh7S8kA1nordt1AR9SJ84u4V3LvP36eBq001kJO3V2P/7xDL7CjcoSFMSmsXRnnCp8ieOAh/+GAgP3kJOV2yFL7VBezKFwH463aTXWW7MzysOvFLChQ3YFByXoGwZqAGTcwqdazXWlybo5xjALpeFixlfXYslReC6WQxFIYvCglb/ctSNqfwyEzuhW4XQvERFYRJqRK+lwTVMFmyYLG/GEpyzz749a2K5QKOoG5iUxkPkucJWAnKRfkZW2cXItywWaczWqCaMleqO0Ez/drEwLPJITg5Yk3xRbUGyZsYhe+3IYYD4eejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s+FS5ZBapzQWxqiVWQQhnh+XyO7tE6rVA2qlHqgqc4=;
 b=JGWZ7kl/62HP32aKgzm9E+LQWoV64Z3yX9BuBD7ikz2x2N6QH7dM9F4BXSwlCvI6jBhTa0KDeEtSKB49wtSdDbJQgaRpfqWpn7ANAJ+c3KXkmnYpJ04eTrUewxzh7h5XaYLEdigk3ljAbUs7ESUOZkCoivnXFWQiRrTqNTJdQ0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8189.jpnprd01.prod.outlook.com (2603:1096:400:102::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Tue, 10 Jan
 2023 23:46:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Tue, 10 Jan 2023
 23:46:53 +0000
Message-ID: <874jsyhs0j.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/8] arm64: dts: renesas: Simple-Card / Audio-Graph-Card/Card2 dts for ULCB/KF
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 10 Jan 2023 23:46:52 +0000
X-ClientProxiedBy: TYBP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6e93fd-fdb4-41b0-a8bb-08daf364f337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ogaCJQWcGSu82xMDyg3Cs7mCkkALEeguoRppQIQM5eevBQWp6XLck606FiKP0svAVjBciu7k7JiEvMrsL2nnIfJVRr6Qg/DSP9VpkJwFaMNDT7S8WyEvdhb+K9BqPDryb42WOLlbpCUlxqxugPBoeV+uzhMao9+0dQSUnid30CB/kBkCDr2E6WZdiNgxGnswwt/rnvS590gEY9D3SpjSM9pv1qxUJC9DusdUgb5gXHXF3KgLEyMWxQuaXjTn+m7seAJbEDqEQfD6JqDp6/yHGkrwc2qrTwsOX9si9djgCbqWzkK/Xt+H+fXep4jC91G0wEZl1BCnyj7ucU8AKxQcQj43f171vYsxg1t0W0/XtOPOHxMAWshKnn30qq3bfcsu77bBcZBg3h6exiEk5Nr+5sl/fgHzyVyb7qoXVEo1M+kN7vJ2sd2/KtMy/rRxJos2KnvqbCgIWSY4MTLyml7juC3c8X+Mwz+xpmb/82f7cHiLXsiUU/dFv2wSER4PCxBQUkOq/4KT+tAWeWzCpOjKBxFG3its/hrf7s3+lz2EecVpdadlnD+CvBm8AQUf7iUneOdQLTNCWxfSRvvgWUYyOvOESsvCJNudycAx/sm6la2C3SoCwIzfovRhqySkaew6iUlm7xvK+AfQiEVm3se9OIeh63xUTvVaIFteE69fZllsSyfLJSU0HZeAQLpHnXimyRyp5G3y2DjrEyBH2dtbCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199015)(478600001)(6486002)(36756003)(52116002)(38350700002)(2906002)(86362001)(38100700002)(2616005)(83380400001)(6512007)(26005)(186003)(6506007)(6916009)(66476007)(5660300002)(66946007)(8676002)(4326008)(66556008)(41300700001)(8936002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ex4hpg9JhAlST9Eqcf5KKOHBYp6l1Rp8GdP1bVmW5+fIABvo9I+LswY8Gk4I?=
 =?us-ascii?Q?BwWDn4Ed2FPSSAc4nz1W1j6dmGq2kH9CuAO0OuAUSO5/FGN/ANsSFAZ3Stne?=
 =?us-ascii?Q?GIzhGr7mVw8O7CzVLKkBN0K4SIn01/04Sr/4pD/rt857b64YNKqQvBzmQrMd?=
 =?us-ascii?Q?6ytA0ID+waKuTeg5Usizi7LTCob4snZ1xwJca8t2+aEgquYsq9Qz7hsZCsoD?=
 =?us-ascii?Q?ZjPp0HZE8OYghABbUhaPivalTDGxsSQEP3qSb8GL4HR1X4rmKXZqMD88GMMm?=
 =?us-ascii?Q?tpb1AhxykMrrXgJvZuoh8cqy3tWUce/Alrf38edhgZB2Wy0UiUEsS+hM/oD2?=
 =?us-ascii?Q?TJnEKu/vnXtEVhUTTMgc1WLZAqnq6utU9HogHUvRfNp1rekSJPDL8kMxwDLB?=
 =?us-ascii?Q?JpunU8ZJ2qlDg4uKB12fykIN4UlLjLmWn7R7MCfM9j006fFC6GiBFTXJEu/h?=
 =?us-ascii?Q?Vf0PIZyqX2BRxGJh6dt/sXeQTpqLfkzAdru5cXeNFu50NZRfmdzLBmM/e6az?=
 =?us-ascii?Q?z5boTWE0kL7x5mqdFx/p30ZEA8CCJMXzXR3HMd1dqNPqiPt1QTPhf6NSLviN?=
 =?us-ascii?Q?RndcYOl6INrOzlhzMPF9JtPvKUb18XrW+sLOynzm7kcs3uqCw1me6mRk0XQv?=
 =?us-ascii?Q?X6E18zs5PW8gtQtv7zYzHbRP7PrVFEMunhC9sTXE41lIkYZM6tRezbZXIbY9?=
 =?us-ascii?Q?aPZ95w6TWgnUBuKgFv6a1JQxpRIFK4mugjRrVEWopCRuTKDTlhNE9Ai31183?=
 =?us-ascii?Q?EVxOIOldPFRxHNjzMIJThHIBqPk5Nhg72M8ySQk4p6Gx23N3xgoKGB0yxq5o?=
 =?us-ascii?Q?r1bSWHjPnUMGKaolmiKR3rJocW+lPPFTBdi11tyno778sAE5h3MnHNRi6MRA?=
 =?us-ascii?Q?9tKWGucwWig2IQaAif9f7v9uogXJxvGAECr+dUNB+SGpM5NPsPBnV+wwQGfA?=
 =?us-ascii?Q?bYhfgU0HNIBYQxqyF0ulWZE20jcyNFucQ4GudpPUsAuYYG9bx23z9+CTiPdK?=
 =?us-ascii?Q?s1yUXgmJ+Q0QPsnZw2mRMn1AB13m+fCX4kodcf26xivdDItXDt9SLCYh5Vhp?=
 =?us-ascii?Q?bs41FGnlU50C958u9f5ESGeNvIy38nBfZvsQQwUbKHvaosVqcLGx0VlDbwB2?=
 =?us-ascii?Q?0pHdvoKeke2XTYE4bViqVptDVTY9anWQ4mFbYZmbsHEqg8C17fn+vkOxfYDt?=
 =?us-ascii?Q?nValL8+Xb4N/f2xwBhOpn/Mvi1GagFz9HRcWNhl4k/azP7d9AyKA73miW1EJ?=
 =?us-ascii?Q?i9jKRK2Yh6PvZlP9UmGRg+aiEu26qI0Njqh1GEvLjoyufgkuBgaMwMUeYFAO?=
 =?us-ascii?Q?PGQbXqcaEbWtXFphRV9EKYeilvFLkMk9VolP6BIVPNJzTXkx2qYVUgRW/hxC?=
 =?us-ascii?Q?LRrfnxQZwqyOVFtHidKxEqTfBXM0tvFaETczOgBI1FJKIc9Gy22/yB5kHyHE?=
 =?us-ascii?Q?tNg7NpabCm4jrt3smA42ErIsl1aYf7mTE9szRrODzg9jX/KbtB3x+P9ktyUz?=
 =?us-ascii?Q?kQFYtuDbdjZx49c533+t+9FOx4/P9XH2UkCYq2TQZgKNMDcMF/1UTJeilrzD?=
 =?us-ascii?Q?VevhSBDZXOHdBqURq8MDo928LmT0BanNZ8aJ5BnYxBFeptFEQFwhTPBp6VNC?=
 =?us-ascii?Q?Vpa/8rBL2pBlxJx9wCNNKuw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6e93fd-fdb4-41b0-a8bb-08daf364f337
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 23:46:53.0210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26cmzfRzAd/UmKtBQ5t32DGa1BbE1PRE3aNk1X6FgaJWRKMJU9vvAdVY+WPVBfNtXLp1N+TlhPI8Px48umwQ20x0OR+5PmqgVCf1CZHyvDQREp6DEEPD05G9kFG3eqiv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8189
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> ALSA SoC is now supporting generic Sound Card driver such as
> Simple-Card / Audio-Graph-Card/Card2, and it supports
> "normal connection" and "special connections".
> I'm its maintainer, thus I need/want to test these.
> 
> I have been tested these by using my local patches to switching card,
> but maintenance it locally is not useful for me, and users who want to
> know the sample DT settings.
> 
> And I have noticed that some local patch had bug, but no one noticed
> about it (of course :)
> 
> ULCB/KF is very good board to test these.
> So, I want to upstream these.
> 
> One note here is that this patch *should not* have effect to
> existing normal users, but useful for test user.
> So, this patch-set adds "3 card" x "2 use case" dtsi file,
> and ulcb/ulcb-kf "include" one of them which doesn't change anything.
> test user can switch to other card or other use case by changing
> "include" dtsi.
> 
> [1/8][2/8] are small tidyup patches for all SoC sound.
> 
> Kuninori Morimoto (8):
>   ARM: dts: renesas: #sound-dai-cells is used when simple-card
>   arm64: dts: renesas: #sound-dai-cells is used when simple-card
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
>   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
>   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi

Are these rejected ? or can I post these again ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
