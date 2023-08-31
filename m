Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C1478F5E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Sep 2023 00:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbjHaW6P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 18:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbjHaW6O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 18:58:14 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FB3CF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 15:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FV703zIxURMxyHjNgeas6jAPAlqM7c03kq44OCocZ1e/qOrGbm46yWSHcC3pIsopuzQ61AtqnYdgCdaGU0cXHGMGFd+F1MEFtD+Xu7oz4mKC+lvkCI4ZMrIC9Zxm++mfPV4H+c8r8Rl4lsnIipK9TXNq7nXTLY7jmGzVmnsre63BZy8yvCarrNiDaG1zWx3TBEJy9KcfhfKU+4uSfNJ4VbDbwj2GJiyvl3xJV2s31mONhbMDjmxdBji54DfbZk550MaOVAfdffxb5azffhdHL6JSXI8PS95fNrJGT81xj18Pofa/mVWdsT3zLvt5ug/79F7r72UtmZutiubcFypoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVs4HS+kjYNSidP9yLWfSZFAmG8ukBiC331lnWkOwso=;
 b=Xr/z+j7AXmFTjF5+YVHa+KwKFJr2jvstpfnTfEMWU7p9/MX81PvdhCSveBwRUgCT/Go7Wjjenz8UT6YsT7yHeeNACGRxRRXeljcx2LLiyiAo0fk38PwLdH53fZnUfQ9eW0uWn3SYylX6Xsxnlep0HKn1SjXb5vyOetnkDuZYzCsA45VdqH0V8+zsjRavuuGGConKz0Vs/PgezxlyN+ZDVpryk7yVVBmYgU7rbwE3h6uuLDaFohKSscN/nt52AbnorL3+Q19euIMn4B4ErO+Hx5/qQrS4GeT6vH2riPwaqwT0ySv/9cqizUzsA++oeWOkVRYDGdA56R8XlVlpd36mlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVs4HS+kjYNSidP9yLWfSZFAmG8ukBiC331lnWkOwso=;
 b=RU3Q/P8dptYsTDI/gYxfT3q7PzAArej8bx38EUmr97YFwq8I07e6MxYkCE8SmJWMz+bjQZgeK70s2mU9wKpdAzXmJCcb0fLIovNSaWZPByXQl7qHWS/ZI0qoiwImt9hftnFIETIEviSgyIhekxbqSNMrjQY3+ynjs0RGrl+x4Y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB12123.jpnprd01.prod.outlook.com (2603:1096:400:43a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Thu, 31 Aug
 2023 22:58:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6745.023; Thu, 31 Aug 2023
 22:58:03 +0000
Message-ID: <87msy695vv.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 00/15] arm64: dts: renesas: handles ADG bit for sound clk_i
In-Reply-To: <CAMuHMdXc2d_oVhM9p8GOQYMV+gzPuqNBmUQ3-fNztKjLnk6GUA@mail.gmail.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdXc2d_oVhM9p8GOQYMV+gzPuqNBmUQ3-fNztKjLnk6GUA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 31 Aug 2023 22:58:02 +0000
X-ClientProxiedBy: TYAPR01CA0199.jpnprd01.prod.outlook.com
 (2603:1096:404:29::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB12123:EE_
X-MS-Office365-Filtering-Correlation-Id: e18ea46e-a217-4d49-8dc6-08dbaa75bb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CruyoQYeszgnUmZ3a8bg0/hlHnTH6Lpx/lKCi3WkGqsS1UnXJAl5/id2uJl/+N0BBhHMU+/aq1r7zfSuexBwPHoZ75H7qR96kQIEyU2wzEI31HyIQ67A/AYdwPtwJoqDWOhH6j0H7iBojIea83mu3Tzxgz4fBCjZFInWhhB0OdCSk7tnQ3U+tP9MPvGy67jt8tKeeZg4fV7Oef3qfVDKyMH/WlDPiLoRtWKJf7BX8SP3xah/Zfe/CIqJkwU3KIYhVZ1ZXn3ApaIzgWdZLoPMf74/CVAteWtu0hDFYWaDADcTUUr5QILvGk6N++Ttcp2zllZZrbvt5MjKq29NnEv1pCN8gSyoiqkU07aHX8qfhQy1GNQTy/JqUb0zreIbgcmN4874YUcuiU5zalDOWF11APr+7Ut9ziiBWWFE1IJtinkjF6WcxGYVhY1dHOzrLz4fL0JY6fdntQATgj0+7eriH675mu1Kya4QcAy42hWSggEbqyGh9/hUysSSyzy2vsqUNrld95xyPpY9tTtF0GWjtyWca7GL0qgB62cECQIUftDM7ain1Gk/YbO1B1x1zdOZYK3/Kq18us/XGyYqONQzkNVy2kuHiVWXNDhTtwF8JFEcufN+VRYSpKEjUKEmI0ju
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199024)(186009)(1800799009)(6512007)(52116002)(6486002)(6506007)(83380400001)(2616005)(86362001)(4326008)(41300700001)(26005)(36756003)(5660300002)(6916009)(316002)(38100700002)(38350700002)(66946007)(66556008)(66476007)(8676002)(8936002)(478600001)(2906002)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DA0tXWjEi5sDEDGQlVbnnJHDjeTz2LoTN42/R0sDzmcwj+cAl3GsJAEco2wK?=
 =?us-ascii?Q?gHACl9J6cYYar7QTQUwQyenpItShRrsgJKGleWF/NW9N5wkOdxs/uMPkanim?=
 =?us-ascii?Q?AzcFKZ0yCAe83KJnU22Za23yPMEFJ+yfX0NA6bMXORjLWDjRFfud19GXzCWs?=
 =?us-ascii?Q?74BK1gbI+S2NQEXt10SNtFi/DZV2lXop12anNONPM2GMi2fV9Rf66QSV3hrQ?=
 =?us-ascii?Q?c7VBF98kxl8aQbBxcxTjbsHOxaSMPfVaYMCt0RkuTSkhX2goCeuKxeC80Ehb?=
 =?us-ascii?Q?IfsrM1aZx6dINRpCo3N+e0A87SNLHG42v9322UiX19iNRTlZ+Ptsv0fSJBLq?=
 =?us-ascii?Q?RfSpwU7suo+vzPlxxdvVQt//G6FxE8kOe68bashNSbFmBQ7PgZ5kKNGX8NBY?=
 =?us-ascii?Q?7c1N9C5OXG1dUdkQr5iD9ZwEeWe/HpbkUfV4YmIhzQQ8CYuD/X0yYV5xaUou?=
 =?us-ascii?Q?eOu+if1A4I+BT76nRE451/4FC/nE+li9yZIyBmB0GY67cR2lpJZAHhFi1Frx?=
 =?us-ascii?Q?tQgwlOPK/bbkyhlEWVwRyD9uOtEFk+CoqaxF9jTpwO4DBXySNZxOGQ+pAkvM?=
 =?us-ascii?Q?eLyL/fOWpD0lrfpR7OmbvHESSOnbdfFxVLk1ueUCXqD+p5qVqwZIc3eUdsx9?=
 =?us-ascii?Q?uxbhtKtjQPFRg5HIp1srVNLQsby3UmeZgswdgG+/0w7IUYXgSEhgfqbv401u?=
 =?us-ascii?Q?DrL7rqC1gTXGKMwKClKJwoL0o0vbApOG/b+5LsVlnCjmlezfNsZK/+fXTFIi?=
 =?us-ascii?Q?YhOCV/JrNt4/F07K2Sm1GrXVn1qx0vqa3QmJh1kyXja5fOc4TZzeJc4Lo5L5?=
 =?us-ascii?Q?YLwA2N78/m/E7ahwdZ07mRIPLz3fzFv4CFXwOO7RVLskw86X9XtRZ878WJtm?=
 =?us-ascii?Q?zgUdNwq+wCA7P7Pva9kGeSW9+HrU8ypeepeL6G1JSt5rPBNjhqXCeo7yW6Dh?=
 =?us-ascii?Q?HGS6eHnX7DjgI3ZisnIhGbSyVxcicZjpr0zvD6pxyOAvdfROgB71j3f2E4Df?=
 =?us-ascii?Q?pKzrbFqCY5YR9MFPPd75xMxlPLYeFTBoWczmNOmDv8Em1BfFGSxh1B1oaSla?=
 =?us-ascii?Q?ZGqAkliwE0kkcRIGjTYphLxvNMFcsi+MEIXkFQRDCOJHRdBTLt6Heefbaqx0?=
 =?us-ascii?Q?8d7TnEsTSx/GPtDPX6xK9v/ep8aegTKqDCix2GMKVhPii+ekyK+EbKde4zwW?=
 =?us-ascii?Q?+zd789bJlOMQK7vTDFgcLZmxs9VQ5k7afAsLsyu++CpjO2cfwahnM+Ljzajs?=
 =?us-ascii?Q?pTIEcar04hnps2z6bmihZKFfJspnOvbJvQYtXsnLkmZK6EtfofB0uM9652g3?=
 =?us-ascii?Q?MJLWUiiYjXh/JNTlq9CE+uZZwxpkm3jVgZCzyVqxB9t7q8vuaip5KVIXOvze?=
 =?us-ascii?Q?TRv1RvcjYbDoKy0TsKdnpIS5cLkeJXmIrJECSf3t1Fw0B082ihboN4nz6jzp?=
 =?us-ascii?Q?D5SZw94bLkk1wUTIcqIC59vJwLVVs3gsaoAlFLrj9iVy3TaPXR/jon+VKcUh?=
 =?us-ascii?Q?PdKEu+r0M5hxsDCpk+t37/k45XpVF6t2pEUQWgaYig7dYN1mmzDLKC3zices?=
 =?us-ascii?Q?hWJ+b/fjDRJxIdtdO/0FK/ZmovM8tcVbz0cDOV4azETamHyPlPvWS5Z8w9Sc?=
 =?us-ascii?Q?10rt0VYs52QoSg1xG3LLhGA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18ea46e-a217-4d49-8dc6-08dbaa75bb0d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 22:58:03.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0KfRLC9MP1VbNt3aU8vPLltfi0P03ZJIn8+gqWcfd1GV5yUGTy3mrJYSaCmjPxTvAzCsOYUYgRPzBkp7igtu+yLwA0xv7XbzXjP6H2/to8cfBA9gGP7af1xnPYOXSUP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12123
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.7.
> 
> If you don't mind, I would like to squash this into a single commit.
> Thanks again!

Thanks.

I think my previous patch-set for clock has squashed into single commit.
I'm OK if it is better for you.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
