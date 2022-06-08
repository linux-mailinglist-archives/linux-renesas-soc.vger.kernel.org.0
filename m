Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2688954250D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 08:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbiFHE0Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 00:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235902AbiFHEZs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 00:25:48 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20704.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::704])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA7A115A59
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 18:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnxaptOXWTfNHkDTqRNBl1V3s+Hc47FmHmxI07WB3Qll3E38Vk8oZR2yvXf7mt+2haC3z9OnTwgIK/yWnGmwCGFYeB0kUrAdL+vI4FtY9V1Ml2B432tLUArU12A6NOwQ38wD/+HYjJIM8ikLsGuz6OEm1H2Of8ykn3L8aJ4jokossuuAa3vUFH6kMfbLDWKGHBBHhK+fWdR32okiOgy4imB4OeydqIaWm54Q0c7md1kV3PGsDhMtq0CtNNG+uwTajKV49+CgL4/JlYQ7HfMePP5o8FnMRYgp4iGFzKO0JCWdiFSw9lKPNPlO97xX58rDh4prgbDeeIisBaFowqcavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh6MRdjoBnOljWuFruJEheWUaC+7wHYBYbw5EDR27dc=;
 b=Wts0Ztta5o+rHS29ZPNlvCGcKJv1MB2OKz80w6hxbGS3GKR7IP/h5JgfnDF6RsMMhETNwHo3vu8D38IBPP00vG4U0Topgvpn79EcK883RC1DOv3Axk870vhe0L7XoJOy5gZriFCNVp8RKZ7f+x4NpuObm9VRe01NXuJ26x/AjFdUHYsmF7KHe3bXYbbxcOgJ3q1rHK3EC0r4J1G/eLWz7J+YvoG0yDWExQ3aXNXah5x+A1TRBEQajSXqAEDoR4pPYrUCRrXBvI0I5ppXDIfyB5XTdKrLHk7bYqgHdEoAhKIm0ZyDA9u98ubS/QqU9NN4firaJhHVaRtEikpE/ijBwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh6MRdjoBnOljWuFruJEheWUaC+7wHYBYbw5EDR27dc=;
 b=UbYEGsctqRxk1kwt4HlSI/9Uq6ZyzKMF5CCT/CO9LV1dHeebtp4wREfi33btnZydH6HZVQdunGfwasdg8au40u/vdqpj3Ov5wVP5rTy4jTkPfZRxd4RudGusy/6cI6IwmCjw5WvkAgT0vZAuAo7pNOLhu83t3sXMjZD6TSOq4hc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9962.jpnprd01.prod.outlook.com (2603:1096:604:1e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 01:55:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 01:55:52 +0000
Message-ID: <87ilpb2a1r.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: ak4613: add TDM256 support
In-Reply-To: <alpine.DEB.2.22.394.2206072222390.746371@ramsan.of.borg>
References: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
        <878rskp9l0.wl-kuninori.morimoto.gx@renesas.com>
        <alpine.DEB.2.22.394.2206072222390.746371@ramsan.of.borg>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 8 Jun 2022 01:55:51 +0000
X-ClientProxiedBy: TYAPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c13d3026-c61b-4160-d1a2-08da48f2043f
X-MS-TrafficTypeDiagnostic: OS3PR01MB9962:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB99624134E79F69A21E83E837D4A49@OS3PR01MB9962.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dstcLNh5dLCv4458I+oR0336QqPZbV+kjC2fdz2v9iUJk017/+LTmNbWw7uXQOyZ1vZPEZtybuXPNwDS1pWLhs2BDOm63HQTjfXaIl8N7eIH61Ac+7LZnXv0s2OqhRNQ49TIAVDNErPxtmA8ySSPyI3Dyh+8fvswuHpqZPTXlF/15pj+OXFJfb3LrRCpWI+CxOBrrGwF7qiNvGKpnwK07nk4ABocixraKvMAQsLKuEh823+Zgnuvuk+q3vdEIeCjI+tZ9yByg7H1/T8f03O3dl/DbuW6N6EpLlL7s54RKgG5iOaD3ChW0SIYguPJiukC01yXKIQ7adEZtQTMzfPiCbhY4xq7clpBGQSaFYX+0I0HVvicWzq/F65pa5BtK0lpa7W4evZJHIDohjJD1ZUGggDFaUKHzjlhCqRgMjH1AiC0HCRH0miIuIEyHk+dNhTGiJta9jiY3knG6y2gHqTPc4nLpQQOxi2Im/9CKg7ghEqA5G8wScyxhvf0cTcH6mIGQtmQPpX0kQGmTxIHHrzQpDFsRjYG6QfgjP2wXWphQd9+PefL1QAVKtM9auVf/5xdABpPhWV1fVDBFdqqeG6XPwM5/x/IJ8covEXjucRlYs4zoff8UvatQ1N6fV1aHPDKlH7rdo93ZDFT83eepljSnCRTAUEMe5zCRY5xZTEWSv8lRqDqTMOv4Wnhly5RqPGpO6S+DH87eB1P/gEnTKcvlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(26005)(38350700002)(86362001)(6512007)(38100700002)(186003)(2906002)(54906003)(316002)(6916009)(8936002)(66556008)(66476007)(66946007)(4744005)(8676002)(5660300002)(4326008)(36756003)(52116002)(508600001)(6506007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?87Y2fWFGaivWeXuCfPHBPYu/qoqj8xEwPv1C+DdJGcDJcGSj1jmqwXZCywE5?=
 =?us-ascii?Q?BoiQyDsaTAkHVPJ+MMkNPTtssdkybi8jWOJINAzGsa/T7Wk42Jzur8CSp2aY?=
 =?us-ascii?Q?vZ3xB4J6dpENtqsLf3TjgdyRKg/Zs+qQv4kbp0zz9Mmz8ZBr7NfxTSpc+gxk?=
 =?us-ascii?Q?Gil76JQOS6aBDzWQ3mgOhonrKUPaZB16XH3aPqW6Sdwq+y5uPBpFdvgBb+qj?=
 =?us-ascii?Q?Kmrux+0ADAsFPYsuTR9fKXs/3wm4zMKq/Wa6KHM/PW+dXiCAf1ppZXm7s6IG?=
 =?us-ascii?Q?qmgIWP/KLSlJNOth2IwzLhpda/1sxwTj3nwqVYab+rKXVDQZXTrz6HARVO/J?=
 =?us-ascii?Q?DvYnVZb8jCMyag07T53vJhFDF2zYRXMj7vJ4YyPVMB0Pii9oQY75Rds+Fl+6?=
 =?us-ascii?Q?Y3pscXuVvnwojjxt8Z3QlCDcL2CAeQIiJ7HD4iBICyA63U5n1T0xNiLBRSQK?=
 =?us-ascii?Q?tBWlka32atEYUXzkkkLI1x4tpgdWQnRqdlmLBxo4deWZosIbT89NNHqS3FLN?=
 =?us-ascii?Q?pwUyF3iKqxfxdRHutKvlHyM1OC9bwwpLNCSKA371atsB//58Qa16NTpZJepZ?=
 =?us-ascii?Q?6LQO7B09zUgoForo2zqFKyU6tiGNW+a68pYi9ygDbBwmRXn9megO/udaRgnF?=
 =?us-ascii?Q?w1iIqvMnpBFxncPJpXfzvWt9ESGrvzO5U2wOEWf61KDSZ5zWZtoPNQ+EaKCl?=
 =?us-ascii?Q?JxjxYgTKHOidIyIfjwUfZYEng2gVDRXTc7RR+Ie/ZJ/upaZcGjPxpPPkVngT?=
 =?us-ascii?Q?Niys76i+X3hP7YJoIktLIVTLPvQ/R3DrFjO4ZwXMBCje9FtwpdaARn9gXmGs?=
 =?us-ascii?Q?5obMCXPfzxRFuu5MrPXW9XPRpXKL5ENrT2yHGSoI9j6oJzdhDrM/vWoU40NK?=
 =?us-ascii?Q?cBhkZOlz9fOumzxxES+ksWqx/Qyl/BlI/txfoZENR0/w3qk86ry6epP2b97J?=
 =?us-ascii?Q?Wqu5L6Gpxo2PFkUJDc5isS3eE7E/hexOFqNFrfFmof9Yvnm2jnP7RBoqn6ZB?=
 =?us-ascii?Q?37T0HOGh3znUemqoHXaES1kEFgzRY0scJZgTc+rAPVb0jKPcAzP5knaAdAVc?=
 =?us-ascii?Q?u3KZjP8VCPxbLnxSrP9rBx7iEg0JKlxyywdrx/aO2C90cZE5vcPclvwc3Ik3?=
 =?us-ascii?Q?KbHspXz4OpgO24qaeewoSL3Cy3eSy2FCkiREPnfqbOs31FyBU7+RShmn1NBi?=
 =?us-ascii?Q?SNaG/28Q5djZeDZy0el9nRjzp3W2i6s/wh9rhCn0oH6pUOCfptelxJMrCt1J?=
 =?us-ascii?Q?WhEw0K0pg5xoyVQkIyGndFGsFnjW9H5150WlGRRA7bTegloPsDYqpJvmcL66?=
 =?us-ascii?Q?pkf2F4u/wWh44R5hdvpWJ7NbriT3ExeKK/Jfopk4LbErr1LAlScV/O4MMiS2?=
 =?us-ascii?Q?N7HNfcqqMRsGqMw/4r1txHlwQLf7IiC8PihktzQQMtU5qOJMKahnF+wioW5o?=
 =?us-ascii?Q?4y/K5YypCEe3CaWBypUV+0+ECnMhMsVEaNqw0fCs6Rk/1iMduhUyja5HzWwp?=
 =?us-ascii?Q?xMDsAK5HYl2PK2yoQJWi9393nFNoTda5EX2BkVmoEkyA84jn5XWf/O60vBgF?=
 =?us-ascii?Q?ltLNi7O53BafNZAOWhgtCipqmlcnxeWThZSeGINuIUhgWsYY1twak9VCkyIj?=
 =?us-ascii?Q?D0c3QHUpuIcl4og+aSIciuBDmvhdDFlZ0S9BR45dCgCh69shz2+0xheK7G4c?=
 =?us-ascii?Q?WHUQL5FDXO9Ylnjt3j2ol1cQ1o+R1YFiGzWRWGDXrLWaWA5fIDEy7haLns2Q?=
 =?us-ascii?Q?Y5ymrsLoXqyn5pvw6VgfwLYD6TKRKfaa3SBZZaw3EnX24S1fAtfP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13d3026-c61b-4160-d1a2-08da48f2043f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 01:55:51.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwaWyHxZ8im6aLIrqzCUUDu51Erk/b6QRkHLt2hVUhslFHM3gdO7rEP0yY2l8iXrNCtCgQUyr8Nq4Zez4048yDVhgYKAuen12LmQSOc6UdfhCjq3vY+fwLLPHZnxgWQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9962
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> Thanks for your patch, which is now commit f28dbaa958fbd8fb ("ASoC:
> ak4613: add TDM256 support") in v5.19-rc1.
(snip)
> This WARN_ON() is triggered on Ebisu-4D, as sdti_num = 0.
> It can be reproduced by booting renesas-devel-2022-06-07-v5.19-rc1
> using renesas_defconfig.

Thank you for your reporting !
The patch assumed ak4613 is probed via Audio-Graph-Card, but
Ebisu-4D is probing ak4613 via Simple-Audio-Card.
I will post fixup patch, I hope it can solve the issue.
Please check and send Tested-by to it.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
