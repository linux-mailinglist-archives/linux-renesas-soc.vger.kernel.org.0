Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9245566B463
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Jan 2023 23:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjAOWwx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 15 Jan 2023 17:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbjAOWwv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 Jan 2023 17:52:51 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBD31E9C3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Jan 2023 14:52:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XO/+FGAEJL3X7neAWrW8wOAcPz/VTAf6QVG9/N9Gog7FoN9CvWfJaFJuQzhKEEm0zbYronvPwvGqxX+lj8jId9xqhr+ysKSZllNV05fcayTat/dtIp6FFteEkvjB7G4OgTHCXDFu9/OZX0lspaK9gMtTaMX+1NIF+RLZ9o/dv/LDDIppXP3UEhf4uQvIL7AONtbPP6YqaOSZNO2jlq3wTD++R2xJbJsdp73MBspbb7gySUsbdzNkM2kPGvIQKo1DmNzGJmrBSg49z0DhJxuG9m0P4rFEkHZkTLgDjQRiGkgfRpLpVenBmYyOQZGdbn2jjnoE2u1rHfHleBheBp3B3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryPe3gszx5eJJQUqf8McqptTvqkQ2RiThbRD8QXDYzo=;
 b=SmTSbzVXNWn+YXtr2Xlf+y3L+0owuokHOEWdHIwPlWqvfMbwg5RHkSg5qzuIN2RVkxz6a94HK4luMyW7y1z0rQb9RtZTOtxA0xAC2xWWJfnzG4qmiqPHWqd6E6jVxdq2VGAZBiJ2nkqwlw6J/xcZZvRbYze633OQK0/I1/yMVRqZHVE7oDk4owUUOIHncH2LcOLQr/96p0L0SrGAAMnYkN+EVWYhk/b6AJi8iVlqyEGjq/o7LJBSbzXrBsYfCGmDfSr60zlQ4PA+7qhSIKF7+89QuGAjY6EzaafF2cntGe2FdARKasFVNrp8zs1EFHBZgX78dzDmLDHpN8imRxgzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryPe3gszx5eJJQUqf8McqptTvqkQ2RiThbRD8QXDYzo=;
 b=aQY2qm+uQvvq9YqoxBTmr6RgZ6XmhAeyHAC+CImCE/AMaepOuTxvydTx0uHuzbgupYD5TD97oJjRe2cR5K3c0w7xIEbVOf7S/OUsrWbgPGbbtnz1BQ6jpy/91pFZDEefTIMLkqufMZ807/yfs9Q67zHPvs3ybdfh3xZOaJ4r2nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB8182.jpnprd01.prod.outlook.com (2603:1096:400:fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Sun, 15 Jan
 2023 22:52:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Sun, 15 Jan 2023
 22:52:46 +0000
Message-ID: <878ri3h0lk.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
In-Reply-To: <CAMuHMdWu3okFtkp91z1BW8YUCTzfa=JPogCb+PgLE6gFmggQUw@mail.gmail.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
        <875yeepxfw.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWzyj8hR9-GY5g3ZqVRD3FC4HxxtDEfLAxjiK=iFRpC9w@mail.gmail.com>
        <878ri7babi.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWu3okFtkp91z1BW8YUCTzfa=JPogCb+PgLE6gFmggQUw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Sun, 15 Jan 2023 22:52:45 +0000
X-ClientProxiedBy: TY2PR06CA0029.apcprd06.prod.outlook.com
 (2603:1096:404:2e::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8761d2-35ac-48be-6a06-08daf74b37ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nMMc9zidPhVuBuexsw6SQKbiwMa+esSVa9K2Bv1dIg+9siLp8mSnB4q7D2gN4fjND9LjczhgdeiYPMqSKxIFC+NfRvBV6DZyt40NdJQCyTwI8WU7g2ujUlBxysURAdFwOq9IBcs4EsfNI5TnMxIfQEoa34smDnugm0WOdaciXk6qrbucCIofGDcss7Pojmhghmk0+QtN57Vrc3AAnvx7kL9urFMRCx5ELN534Sni99ONIUZNjNA3YosHyQAui8N+6gHcUq8mMRMUfMHt/GjO71JgxUhncwdM5sO814nj7GW1Yy0fgWu8dHrMS1gxDZyD9jlSAlr0uKr1oqdSBAVFDOjf6k1v9Z91fwTsJuEXFMyv9TBIE2MxnVSKbeICTEUXvY06Wjzi0jzFd/eVgQ/QKuVYprBlSkdGsVwTi5XWQ8W6mLaCYQCX2zu74X7aYWya0+fJDNPZF+cV5JBraOKcVhWDvu7iLeWwZ6iOnNpEUNfOBo8ceZbm+c77La5iTf+Lm3B7Pq4IxtKClrPZRbrgN02IDqiYPe4XSMCpUdDkXc5l6SvE3N2SQ2LBNc+a7N//voeH8p4DoO/cFUPwx5Ug/QhQ47BIybBJLRoscRLT+PEBlCZaReolKSfj611nUB1FTrHaweAtSkzqhbNjwHQNnd5IZdVHtKl+OGTvxu+wbb89AbQLEjQ1sczwOdzWPfp8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(38350700002)(38100700002)(36756003)(86362001)(6486002)(66556008)(66946007)(66476007)(8676002)(4326008)(6916009)(26005)(186003)(6512007)(478600001)(52116002)(2616005)(316002)(6506007)(8936002)(41300700001)(5660300002)(2906002)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rDRThAQIjNgAYISv62V2ZpHLx1UfZgUIjvTyExZly/lCMJLheSQ+ug/KPZXV?=
 =?us-ascii?Q?KoeuPOkFR9aekY9BNzrAUUBOZO+ahUBSJduOMKgt2k4b3CMVGMZV6QAv/Ixi?=
 =?us-ascii?Q?hUR1NPCnaf/nHn/5yGZsW6HoqVXTLijsrdtiESV/bIsxEhwsQ4upmh0wIFL4?=
 =?us-ascii?Q?vndoqMfuOJIF0Dxoa7b9kSUsPse9bs/GOoHcwp1EHZgqKu0K/ADgqDmIcm14?=
 =?us-ascii?Q?sKb939nmZvbdh203+7k9uCM19tH3KvT0TLfjLxfOiVHqX82xypnld7/Ictvu?=
 =?us-ascii?Q?GAs72amvj7XTqLednl7+v+O6I+fGxUPybMfST+CJHl/bu9baJ2Yi8AGF1taX?=
 =?us-ascii?Q?UDZRat59A4wtLzcYKCn/M5yzLmG8G+kSTdUikMYmsB+Tf7dH+gjOxsSGNiIu?=
 =?us-ascii?Q?IkhTY6ktoJv4sjpEw6yhK6P8X+GeQZeI0NZBoenRNMU08gFaMrtNBZUrIjCa?=
 =?us-ascii?Q?imvh2tbc7oTHhai4tEtWFD70p8pJhK02G/GOcBdOu/0ggw7ww25qx8YKN8Q0?=
 =?us-ascii?Q?QlrPKh3vYxOIAdpDaCSZiZOP5R+M1Nbdgk8f4kHPQ6eeNfkE8oF43LgML+u7?=
 =?us-ascii?Q?kEkv0n5pILC/DuO9qHsTtT1RR2GtD2bXg3fydJLGVhrJEOReGH0hAoNWih9v?=
 =?us-ascii?Q?BAd9XnxTaW/RihGBvwRmdVrIp4p+8QiCMxAibGZz8pzHKaT6QQvst/XdOwtn?=
 =?us-ascii?Q?76VzwHOoBTIxPsQMO+l0r+OnOnnRLBTzdI21LlJJtFIPPP6qYSJg5rDWtsk3?=
 =?us-ascii?Q?e/bWJ3agyXEqq2FPe2sNIvrf4qYE+3MPT4jtw9JUJvcpqbYh6NcJoQoHq7BL?=
 =?us-ascii?Q?hsmYzE227FJmacikXd1iw1LD+hr/RmrSo3rkrfq9Fphh665sSs6NPO+ELljF?=
 =?us-ascii?Q?Gb3qR8aJvgvGQ945v5gZseh60B4WEvOF3GTua/GiJRL1wrX2v/qNYfsqqOWU?=
 =?us-ascii?Q?z60hKOykHg8h1Xqq+2sgH/Swb3yplh3ERPvkYH3MCOW7WMop5wVfO8istB95?=
 =?us-ascii?Q?WQQLReFzMdkAV3iOeWzXm5ugjghWIGPrABtY9fsbFPAM4M6KdB0wDx0JEv2b?=
 =?us-ascii?Q?xtifam74bxgMwK1jjPqxqGh5e4k0LR3acSIEKfHxWVhJsL5S6Wcpivqpk331?=
 =?us-ascii?Q?OMr973p6/YyI/c7PnDtrjmP+vuoAewCVXz5XTbz5k8tLv1r42Ndy9F5C1ijA?=
 =?us-ascii?Q?czFqYmIbDfPM8IWq0FzreEFprNssCVhi9daYoYy7PQTv5xbgEC5iBcWQELn+?=
 =?us-ascii?Q?eF41HGY27QNSWJxjwE8bNAWep7QWqV1hdVeZRYgJv/4eM4gDuotEtQ0Pv7Rj?=
 =?us-ascii?Q?0Fg7TTqUCT7G8AKoWl0y0b0BNPxnrUSr6Hly1aKP+ZzHe9CrV6uoFT1WIaOZ?=
 =?us-ascii?Q?oh/mh3TzrE1HPN2WxgpYbLd9mra7wj12ra0+iUEjUmUiAkmE6GCizd2V+AXU?=
 =?us-ascii?Q?EZgiaYEv4vjVhFmbv43Hb2rFf/eIydw5+W/UF1S1ybkjTcpr+fEbMCieFmbD?=
 =?us-ascii?Q?QMvEY0X2QU9ezMMOhpqNBwQJDA+Xa9/nlHfikoyeUvUcYR2tNX2wRdcYh1TU?=
 =?us-ascii?Q?afQj8hc55E6hfZZHsVZN3X0R+SrmeB1cW4xStjwhxYXmafOmYJeaAZnhs5TT?=
 =?us-ascii?Q?mFWtLRWp4aw4x/v4Ps0As/U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8761d2-35ac-48be-6a06-08daf74b37ff
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 22:52:46.1689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4H7g+hi/a3USdR8RF3HysKzCAbKfhwoZ52B1dpI/Ob2vLBPQiXgzKb8xBB9BPTJ423zDicosU47vs3x1/MGirqXrK5BuwJJiSGLHtXqbJZvZAlWTYxwYSDTpntaGT+FP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8182
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

> > It is difficult to explain via text, but on normal connection case,
> > SoC <-> Codec are connected, thus the comment like
> > "CPU0 <-> ak4613" is correct.
> >
> > But On MIX+Split case, it is using DPCM which connects
> > "FE" and "BE" at runtime.
> > So there are no connection between (FE)SoC <-> (BE)Codec
> > at this time. So the above comment (= no arrow) is correct.
> 
> So this is software policy, not hardware description?
> Does it belong in DTS?

I'm not sure how to answer to it.
It is the description to indicate switchable hardware connection.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
