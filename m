Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD705A21BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 09:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244943AbiHZHZA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 03:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245260AbiHZHY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 03:24:58 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9021132
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 00:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDuudoulFjJzM7YpWgA779eWM6iQ88cbMsS3CEqS2kelpinlRYPp/nwSEMksaLQeMyK3ttuBTej5jy6Wc+dqoqqrR5MMtUoB1xI7F78l4WVEXMh1AqJKVF00bWUgo7YTEc6ObZw+hHZkMJ0s8ehFRKluOTP/QMjHsfwjQXMOxE3awq83rRV+a3PFdVHQ6+HCLGynNZL2N2q86kXu6pYHL22CqqLepx/l4Z5k1a7wfqqI2qSdUfSYDA/GEOHM2FId18E/yls8fKvfIy7g58vpMkcJ9J3TPA4sxxv90ZHOlM+EzcAmtsPNSTn3jUxIAW30v6xzuyF7Shls4SArAlD8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyjJ0Aea/IiLv54bkW5N+FybHC3W3vwkyFRO7LqsLO8=;
 b=cmIB9ic/PT8FH4nusDO900hYiqQl3wHPXGhdRDtCMrPVuamET94uvBMCtk7Jh2fhMxdBCJ2P6dOQjXSS3pHAKPSGPfqFRexMdaQslu2WhatLTQWvR7bnUv96x3b90k7y0u9yiSyvU9GsXpi2AthHnm05nv/RsSq/K9ZyDFr31QeXMuf1kgtd0u3ymr8WEJ5aK/NeSNLkt9yBDG8X6tIOGNgXAOfnIWYMcFqvb1G8maKHw4fcImKbpQw4wVhVKVtqE6/wtp1Myg3YZvUuWof7DDSKSkLq98Ysf45ImBh9UdqpM27ZLflnRFpM/8aZUX29NCJrEbsi01rLeTa1FSi/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyjJ0Aea/IiLv54bkW5N+FybHC3W3vwkyFRO7LqsLO8=;
 b=KYlviAAv8mUWEpwPpNA63VmKE1cKGCfUs3Q+d1oSHxrOqzjeC2bERzj7ryf2R5ZfhdjFBA3nB96QxQE//ZQVx/PS6OK3LpJMLWXxJiUF1vN/oQ3iC1K+jsn+PZwylWztert+qtP6D6wGhuGU57tziGLifmc0ILrspoMuWFPpru8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10389.jpnprd01.prod.outlook.com (2603:1096:604:1fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 07:24:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 07:24:48 +0000
Message-ID: <878rnbzcua.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: fw_devlink.strict=1 breaks sound card probe ?
In-Reply-To: <CAGETcx-QBuqTHPuSXMUHMzyhf45ZNsvPGCCZap3tWHrx2y0RwA@mail.gmail.com>
References: <87sflmuyf4.wl-kuninori.morimoto.gx@renesas.com>
        <YwXxT0Gr1KQQb71F@pendragon.ideasonboard.com>
        <CAGETcx-4+RkgXZjK6yDMr97Q2iUDJxosqp9s2EyhFW7+WCcFrw@mail.gmail.com>
        <874jy12kl7.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdU=Rw=NdDHAmZqJTb5vWmi5Kw0Kp-nCKjcSpfeoCTzGog@mail.gmail.com>
        <CAGETcx-QBuqTHPuSXMUHMzyhf45ZNsvPGCCZap3tWHrx2y0RwA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 26 Aug 2022 07:24:45 +0000
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a34c4c0-413b-4a3e-4547-08da87340d5d
X-MS-TrafficTypeDiagnostic: OS3PR01MB10389:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZICJuYEZ4cavn/kFe6DGHU/DaNilWK5A9euIHGol+bya5gEjVnEH5dM6qYbaVeQ+VtPsesOtLfTgjwTj2GFszpc1CTMc8J5qYlgIoI8uIX9BTdIdhjMocY5Pb3KwTywg5E7235Z4S1+KUrVE8yv1AKWGHu6xVRnGBXQs5jqIbPJG6iFRoCwjwEmAhyzPnjGeCn7uB7Gyn61iNr5SYY41U/YJX5242N1cNL2X53WxqaBm2PWBHhpKUaU7gdIVUND8ebmjhJdoV/DlsqCZi2xL/xDs5QgZ00b7dMb/MKPRRM2Dpld17WPQd8NMwzWSr1PBDXAKOEH3Aq+hNM+0un2f9GLa+TSb2fHd3QZlBAvmhCj0k6Y6DgE9POgYk5LKbDhOjKNaWHoPiVBvjYUW+EDi7nV83GQCqGGDp/6cgM3fvYRShdITjz82WJhya4JYUQUJRv214JehtrzC2VAwj4R92tfUtmthx5xO7NBpkm7BMErcY0+EmSRKxpxG5lOoIj4/waO38zcwohwqj9xWPgmyS6K92loOpS0N0Cnor/OGo6arBn1XY16ikp5s7E/Nkl4EDDLMjvhgsPZEocolxfewOI6gDHueuuvD229jdmNVdJrZgwgtNn4le7mEmnx129N4vRZVWv8vv02lAIpxGF13dHiAaArgDr9sIumvP8zbEnHOj/mWGOg9/kTONRfYPYUvEny43FfTLxpAgX+8N+XkxS7GTQA3q2v02k28Ofwv9qgud8PPvhUrpez0ipNMS1Q483t0t042tlrZmmcbt8JYLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(84040400005)(38100700002)(66946007)(6916009)(8936002)(186003)(66476007)(66556008)(5660300002)(4326008)(8676002)(83380400001)(316002)(2906002)(36756003)(6666004)(6506007)(52116002)(41300700001)(38350700002)(6512007)(26005)(54906003)(6486002)(86362001)(478600001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j6PRcjWUUH+EHXsvefpB6u/XDT2sKMGmTYAFWk2+IYu8hB0HCMk0Ouo3QhE2?=
 =?us-ascii?Q?Q6MkHJZq0zxRVcTsgkJZ7WeduQ+kQzdQSh17wHHQnfWiXCHuuGmMjP4A8Pjf?=
 =?us-ascii?Q?JGiQDQC4Wx8xfOhkob3XCma72k9wrdTI/wMPZOoU+yzWv/GGRaX8YmrJzbtA?=
 =?us-ascii?Q?7vPAT92JJ5w9Id7dnG46zKubu5UoEv0W/wW3OiCCKUOpXOSrQq6ThJ0JTk7o?=
 =?us-ascii?Q?5MIqh17pdpa+jQJtFZNpc01dFqqZUJq/k+RNc3kJV2vqrsHVWwriX72noaXf?=
 =?us-ascii?Q?XE+CFolLXJ/zIvaxhbes7uPvRFdlmy0GHcZM1RqyxFl5vY1DOOqTojkexxsA?=
 =?us-ascii?Q?FrLVzProLHWKJ18huYoR+srcl8JEPsu1ajJpViv93C0VCwYMxlxjmBhIepFm?=
 =?us-ascii?Q?4SJSZF9C9Wf1ZcZb7JQbkREetOpudsEatkbgBVcrGwBot4XSeH2qyl6I6xGB?=
 =?us-ascii?Q?OpHphhBpanRWr4QOwh9Hdi227RD4POM7RRW9u8wSkfQianrquT7CBeGKIr/L?=
 =?us-ascii?Q?BpG+FCqmTd4uw1Zqrtg1AM7cg9WCpxz5sqM+/NK6NpVnbxTfEvtlUVmy8FWT?=
 =?us-ascii?Q?7qpyOWUgpIbM1HE8MBCUOIrsS3C+UXAxGuJLtNpIsDnnjLlTdap6oyanEexW?=
 =?us-ascii?Q?G36ow1F08/FUQK8/tif3yRBIUrdISXHsdz9SiBucHIvUirKGIQrApQGCHjpU?=
 =?us-ascii?Q?3yosTbfgKyZhgrh5xWAfdpEHyfQcywdhKnkzruYxDBiXKfEWyLId/IJLdVX1?=
 =?us-ascii?Q?TM/2qF2gvmDSXWsmp2NQEWc2NZEDnOUezrVwXfFsw7Qjl8xwCy81IwUGO5Jz?=
 =?us-ascii?Q?AqfP9tfW/fE8abmclL9LdQq2wHKcNfyHrAf3Sy+1HKYc3YiW8rQizDss4Qjo?=
 =?us-ascii?Q?4WkT3fYzxRH6AfuUYRyUbiD6JKOadF54MgPEHFJZMRkIT4vjC1OA0o2Q9V7U?=
 =?us-ascii?Q?hqPMwnfy9EvDE52/3nr7Tp+1i7n2a92RDH6B4yuT47hFNrHCcJUMwtWGtQqI?=
 =?us-ascii?Q?K38WNdJaFMEJIrMCHXiXFZnert2p9M0dFHggk8K3keNLSN4nGsC1Rd9Lco5U?=
 =?us-ascii?Q?DKDLVzexh9lVmsgx17IIpi3vT2NcWO93O400FN1Bw7xni6g4gI6JVad8HZWU?=
 =?us-ascii?Q?u56eDzxJgpB6BCNKguwCxzMlPLpi9/zUrIDL2gnHEfQuv7A8FXvUH9+v+nub?=
 =?us-ascii?Q?d0Qcg6Cig4c5JauKK3/PsWe7Fe3mp7tT3s6ryeh9kTWmZ6pV3RLW2l+ub5V9?=
 =?us-ascii?Q?p/cFinyFRmWpZ2ubXUL7KPhWSXEI7P5dXUqW+Dq2njokLsioDJL+P40QtTXk?=
 =?us-ascii?Q?QJ0PdNZTo0WMZqHJEfPaC0c2oN8cv0qGIrxV1/3sQxJMwhXYJsYsDk9Z9pTL?=
 =?us-ascii?Q?m/R6B3LLrlwlHL3uYEtZG+dzqq1nJJz6mHWtTbSubX58TsR5Sa0d/eY21t6p?=
 =?us-ascii?Q?oBfmRjDMs/oW8KSUFUS5KeD/rPByXtAGuZxcCKG4hzrheVdQ3rEIAbLSuKZ6?=
 =?us-ascii?Q?2hf/QGk0I8w4cZBbYvDLAy6BawWYxGvmJ8hM3Fbi856xbJKk/ReYrBpf/9A0?=
 =?us-ascii?Q?zOEx5yciWXdnzHyDeB7StlMw71ElpBHhSmqk8h2JN+ztrhjqfMykOFmCh8k4?=
 =?us-ascii?Q?t7Thyc3YRhTIPuDsAxJl3Fw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a34c4c0-413b-4a3e-4547-08da87340d5d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 07:24:48.5331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkKzEk1gNY8nLv4yAxvK4ATrGb4GVJry3bIwKOAVrXENYH8J703i8/QUCTY7KZ6bwLeAl4yEurycIipnWOYBKyZTFvhpIlRy2lp/Vn/bjTF+mtOJeqlCtbY4NFnO4F63
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10389
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert, Saravana
Cc: Wolfram

> > > This devices_deferred file (which I didn't know) helped my issue.
> > > It was my fault. My .config had been missing necessary driver
> > > (= CONFIG_REGULATOR_FIXED_VOLTAGE).
> > >
> > > ... but... why it had been working without it before... ?
> 
> Hi Morimoto-san,
> 
> Hmmm... even if you didn't have the driver compiled in, fw_devlink
> should have stopped blocking the probe after deferred_probe_timeout
> expires and that value is defaulted to 10s (it extends on every
> successful driver registration). Can you help figure out if that's
> happening and if not, why not?

It is very deep and difficult to understand / trace.
I'm still not yet find the core point.

But something found. I hope it can be hint.

I'm using this DT

	linux/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts

The key config was "CONFIG_REGULATOR" (not "CONFIG_REGULATOR_FIXED_VOLTAGE").
If .config doesn't have "CONFIG_REGULATOR" and "fw_devlink_strict = true",
some drivers probe will be deferd.
No issue will be happend if it has "CONFIG_REGULATOR".

Below is my .config case.
(It will be more drivers if I used renesas_defconfig).

	# cat /sys/kernel/debug/devices_deferred
	16-0044 i2c: supplier regulator-snd_vcc5v not ready
	sound   asoc-audio-graph-card: parse error

If you can use "renesas_defconfig", you can reproduce it
if you remove CONFIG_REGULATOR from it.

Here, "16-0044" is "pcm3168a" which needs "snd_vcc5v" and "snd_3p3v",
and "sound" needs "pcm3168a".
"pcm3168a" connection is like this

	-- linux/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi --

	i2c2
	 - i2c-switch@71 (pca9548)
	   - i2c@7
=>	     - pcm3168a

In this case, it will get -EPROBE_DEFER forever.

	driver_probe_device()
	 - __driver_probe_device()
	  - really_probe()
	    -  device_links_check_suppliers() :: return -EPROBE_DEFER

Thus, pcm3168a's probe function itself is not (never) called.

One thing I have noticed is that I2C numbering is changed somehow.
I'm not sure this is related to the issue.

	fw_devlink_strict = true	: 16-0044
	fw_devlink_strict		: 15-0044

If you can indicate something to check, I'm happy to investigate it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
