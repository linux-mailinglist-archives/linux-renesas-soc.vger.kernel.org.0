Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0830D55F250
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 02:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiF2ATR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Jun 2022 20:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiF2ATQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 20:19:16 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2123.outbound.protection.outlook.com [40.107.113.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAE12A97C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jun 2022 17:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lm1TQSt4VUAlts0vA3kKorhiys4cwu/sVig1oYfRtJpOUK+7ODeqx//kxfl4S49i4t+fjuMKbC1CDMPjZUjGizM+g3Krm6MPhyncdi0NVvyWmHe9IafnSLpY8h3QlAMqhqx2JYzMN4AM5vUUsCSYABS4hHqc8GrrimH2itsb60PheQrr++yjSVnj1D7vddqphEzp0PTgCX/TAX9CPN1cq9Bs+t/yrdZs1ppj5tQhfM2RBTRlexLJGB6t/+OqeC3trN/GtEBICQP86JH/0hbB2bFuJHQxQulFqJKImYombXdPdtsAGzmcWx4D1xeHG+8bYtoQ2+f29eIruIWl6nJBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dV56bZuuELZ3vF7Oj+oVtGayJKUt2jqcEUJBlJLBJrs=;
 b=Rmtbk9GKYvfw6zoE17XRkId0zqDe4Z6ndzw4TMILTVOuVWWASXpCx3Rs2gd/9BvxcWudoF8/t5UQHVCQ4AzICjC4FQ1ZZU/q3wgCcydeB9ZV3cYELU1IO48ay8+5Aimr2xKyrPb3GwAWOZuWTLSLjK7jRng6VSURGmduVw7RJaFkcYeN1aR44wW7d2oGTz/vphUeywLhjNVI14FXmu5jgPaH420O+hivqXrM1wCHpyWxhGsh109u/jgH38jqzk5rtyXZe+Lh8CmzzItzDxNDpBAa0m3k4mGvgMnwDG2YDt+R6cL0xnISYxHjSqkpfGhYyU3Al5yM90xq/axdx60zOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV56bZuuELZ3vF7Oj+oVtGayJKUt2jqcEUJBlJLBJrs=;
 b=ZsJNgSpDUvvFVstKCWi0OgA7tPejZ/GtFt2n5ZvPOTmbZ0IgGG2N5KiUN8sVuZZ1MW6shWba+G/WrE4nmLj3YbYC2eb+i8KINYeM9Ndqmri4O0PdoCxCYWTdGipXBSzg3H6yIQb30VgDjoSeSokt5wYaf7NpGmQ5d2+wwrlv6CI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB3566.jpnprd01.prod.outlook.com (2603:1096:404:ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 00:19:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 00:19:13 +0000
Message-ID: <87v8skjp8f.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: dts: renesas: ebisu: add port node to ak4613
In-Reply-To: <20220628122330.28323-1-wsa+renesas@sang-engineering.com>
References: <20220628122330.28323-1-wsa+renesas@sang-engineering.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 29 Jun 2022 00:19:12 +0000
X-ClientProxiedBy: TYCPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7650bf4a-c6da-4148-1a46-08da5964fea0
X-MS-TrafficTypeDiagnostic: TYAPR01MB3566:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: epnYsQXjstnBm9bZgzRqSKveG77CjMNLYqGlLyjjFMsGyLCDtzLcvdWo4HRCkmqKRtbZMvngeipflS6u3loWHAJCauvnFt/8TTwmJ8RafGJiRrmMdzlXv7ARQcw42EIXen/OULW5INLBZBXFKDlQ5WRZBfHCC0LlENDpjjkQq7wyhpKEgbeLYtmsZzY5H+Q+/ypQvZM5exWNbzgOaG/PkdN7rJ4RwKBD0mf62Pn571lHSfWqJJLhK8JI+zH36sgRukgVZnCO85Vbq47NrBimefpEviBjzm9OTsOPfqp0mfwI2JGis5KNL0roFJ2G2ox1+PqLyh5NAPYfebXp41xSYeRbqxWwiURnHdCHFe6t8VPEBxDIxo0Cet9WORptmiD72YruPyf0to6THBKUhV2gPqdAIBTgh3/ux8sJT60AgZ9wE4DrciR4TmLR04O0xvmV7/eL8NO1eTBNJEEDi32oUqWPTSYzCrhw5TL+UZe/mIpt/kcBunCcJ7/T94eUXOjklQf6Y8+O/ysC8f4QLO8+BD7gWmIm66nCtKWzZzjdPr7eLNfF3eIIzgzeEU6lYNz4lnUSinIUbqNyQ6JqcRoIlsGLFUnJb0zGa03kRRdU1pEhvjSfNejuoIRD8cU6duauJJjaj/JptqW5P9IVUpbrjSkvsQmgFexkhPmOgJzNlj7PWYAQWgehL93yFV31AShFIZJXp7T3zbvH/SXL4RQlbbbTpszrHkMusV8OrZHROc7RAc06FajADOEuB90OpXsYWPbcYQQ2ibcnmNarGbw6OU9CVyb0tcE4nRctWd7Wed2UnNPY5S9AscFgViY0QBkTbT6+54dkeYXgBfKYGpJHZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(4744005)(4326008)(66556008)(66476007)(66946007)(5660300002)(8936002)(8676002)(2906002)(86362001)(83380400001)(6506007)(38100700002)(38350700002)(36756003)(966005)(478600001)(316002)(41300700001)(186003)(52116002)(6512007)(26005)(6486002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2EigSq9unlXfku99T5Nu2bFv0uqlS0K4flXIy95oUN+8s69OEdzqtABtF59E?=
 =?us-ascii?Q?zSvfnHwHyNqAgwOdix2MXDRGKU+odjE7yJ95HFfQRgDZ/aFcTVVLd0u3nCzE?=
 =?us-ascii?Q?b1rc74y32fD+3u0YQX+eYl3U8570tvSNNpPjRjRN5JNftTbOwrb/uHcuhnWy?=
 =?us-ascii?Q?uLjACihMorlCUw3H4rfpH0fSE7oT6VX91ySap4xQcOGYw6XiQEIaaaVwUEw7?=
 =?us-ascii?Q?JrMpyDwOAQ7zVklm1CZjVm0xRIIY05yJlErH82FZtj4w9RFaAGFzpKprCUyu?=
 =?us-ascii?Q?oUKABRBl5zBkSotu2Op6KxCtIZXSjqjbJ8aEYnpi4HgOeKVIVVntCJccdJyb?=
 =?us-ascii?Q?abV5UEj6ONKpC6qiydWESehMYoCw4pk5zZQe3e1Ee7f6SG6aS4mgPDTTinJm?=
 =?us-ascii?Q?cUSyN3/cXFWZ8am8+22iTz2JxbsCDDLMPeLZgkh6VUNK1WNuHTjMWgn3WW/v?=
 =?us-ascii?Q?SaRvI1prnawTyvMdHxgta/RdnVdJs+quGYO0FJr4cbg04mHTdbVFNHBwySGf?=
 =?us-ascii?Q?oi3ck96unLsDIOvIgnNM2WOZUl5ly0aRNBMayAryOFRtfjIAfTSkRbiUeCo/?=
 =?us-ascii?Q?vnJOsPoeoGtQHLtnzNh37vWRI+pm8xaur+5q10o1dhks7Qe125k2KSYMXW1v?=
 =?us-ascii?Q?g1PNMtawZX2eDja57nmpQX/fzcvu3fyPC+PkcCWbXtXrzLMJuXTHHASQ7Ge4?=
 =?us-ascii?Q?OGKNuqrsbPtBZcRHLDMMRUVCOFfOWRViiLtHmbH0eqo39S7DVB508JYTeDAw?=
 =?us-ascii?Q?Chnc2S8bwAhBagvxoRdUt6uEcCSYg5pHV2cj6MegghW/EuspmZPXCB6Fj5i8?=
 =?us-ascii?Q?X5jBYemf1DbL2eBPm8M8uE0NZi46MW8UzFIBOkb23avj0IJU598mhvmUaF1N?=
 =?us-ascii?Q?prS0cCMORfVaDhFXF91F3ak0jvOfev78DIKmqoYDrfe4DKulI3DRhyI7/PNC?=
 =?us-ascii?Q?T47v1D7TWv2vJ08SBB2Omkt5bw1RVqnksjZAwJf5WzB6OVSMsRaTnIV8+T+S?=
 =?us-ascii?Q?A6gKATN33r0ku3FFNRtK3a0H/qkmpxZL7VxKtsKbZrFFefsjvUcTsPdQEv2B?=
 =?us-ascii?Q?vxezwiZSHFd4ZJBiuv3Jo4MPy9j8XPA8UO6e2j1lpXY+B1ujCkKyE+qGPZFd?=
 =?us-ascii?Q?1FoWW245lcty0YODgY3rlbkiaZrMT+XT8bmtLGT2a/a+GpkcMpkNcOLy6WKh?=
 =?us-ascii?Q?SimRYz/TT388gDzj6/9TG3R+X5HOrI+Twi/7dmZvFlmqivbHnf/7yOtKJ1zX?=
 =?us-ascii?Q?k4h5R+WGXc2L6qf+8hKs2Q7N6YXpmbdpto8pTKdx6GIXawu1KEW88MVSusg8?=
 =?us-ascii?Q?sFjsURnUl0zJWS0AVBQlZWmcOxGl/hOEI96KtybTMdcq9/bxUgCRftojDkK+?=
 =?us-ascii?Q?3yV1natvpwBw4XvbjwrA1ng4AzkhcTvy5xu+v2pt4dDHGHbW1AprnZP/eM5x?=
 =?us-ascii?Q?dZ3nYD0cW/wyRTY40kYwvW4qNTHmivr+SEZpNUnTs/79moI5thqEt211izVa?=
 =?us-ascii?Q?TtWF+nkHxCCD+yCnEEL9cmSiwn6m1FtOa/1FCr5xKxqixuZlmQqeZfZZIsNv?=
 =?us-ascii?Q?7itiQXtYUnucOSNfPZICX6LVjc8J4ZOfNDQ80S8TBWHUhqMwWnn5FC6fQAvI?=
 =?us-ascii?Q?DDubc9xdZvWMdI+AsKzMbBs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7650bf4a-c6da-4148-1a46-08da5964fea0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 00:19:13.0947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZOO/QWy5NdTJRSWonQ+mSedjiRbvr1UCCIF3Z5m3ikH35Dne63AvAmmbJ7Vyq8mfsxXzw2vENL9zLLCF1B4o578UMqOsIy4C5VO23umFZY/EhUTo1uDAlG7/OEYtGwr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3566
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Wolfram

Thank you for contacting me,
and sorry for my bug.

> My Ebisu complains about the missing node when booting:
> 
>  OF: graph: no port node found in /soc/i2c@e66d0000/codec@10
>  ------------[ cut here ]------------
>  WARNING: CPU: 1 PID: 37 at sound/soc/codecs/ak4613.c:873 ak4613_i2c_probe+0x274/0x2a0
>  CPU: 1 PID: 37 Comm: kworker/u4:2 Not tainted 5.19.0-rc3-arm64-renesas-00003-g57c83727d651 #50
>  Hardware name: Renesas Ebisu board based on r8a77990 (DT)
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Hi Morimoto-san, I have never done any sound stuff with R-Car. Is this
> the correct approach which I copied over from Salvator boards?

Could you try this patch ?
It should goto linus tree, but it seems not yet ??

	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ec3ad554b956d5dbefa1962c419f164ba223e6b3

Thank you for your help !!

Best regards
---
Kuninori Morimoto
