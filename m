Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B0B666789
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 01:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbjALARd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Jan 2023 19:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjALARc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2023 19:17:32 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11066275;
        Wed, 11 Jan 2023 16:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjYGZs6vmgKO6jbfEDUBLH23rZBUcs1y6g1ItY1e/XgK88PXtFhOzXX24W3Fio2zxI0KsIbvJrKZ9ENYmtEoUIYDTix1JDHtfeF6SFJGpL9XOn6XAaIF0opm8bxLLlPXb1R1ctvB6NujdEK7ntCuEDKoDVeGLGwrPW2wgiC5+rV4Q1ykzIn3jsn0zAUmK97D8Hqw4OjGNTPhMRnjvmvuyvQJdLr6j8tOgJpWTbpeT8MCM+99CFpeCUhrbx4AjouW+Y5TQY+JJZTaTGQcpXokwEgIpj9K/3Ht+ujoLYveAGjKFnQNQGHuyCPvFHA9PSYuG4ywuKGGfSKwYakB35U6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdixyNEdCPsH+Sy8g9AzgCzobEbDVI5BvYqLQsxTlcs=;
 b=YEpoguZ0lfHigkrBoyegjsoCYFFELMuix18oKSEnv6yPPmi9+vup9mA2spPcBHPcBgZX8oyvJzmG3jfSpARCLMkkDpO63QPh3orG83NhTNNOufOKFtdhhcD2WagMeicINCjZ+HNFQSVq7ClqNIi1FpI0g8881rneiTZ13IghvCOZURXzy0w6wDEE4udnC7Yo9mRDRavDaPwY4RLhZzwDzde4GZKR5CAHuaMvAZ02cjLVe8zrDeC39GVYevBlmLrY/Vs/NiODc+1cuG1Z8ReN8g7M+i+XckIpfqjJDmZpUMpypvxBDHL3VhtCVdqNLfHRqm5Puqp69yCSiLwe/BUkCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdixyNEdCPsH+Sy8g9AzgCzobEbDVI5BvYqLQsxTlcs=;
 b=UyOHjz7ACkvuYpU2//2SYr3MXSRzcVAywS7VG/1IvAM3UpWGmj9xV76HPsvDhDoZwRcaDE3jm01l6tzzg6AfsCrXUwowu2bBi3fJm+ex8D9ia7auNurJqCcaiy1Z/zArXbWwuXB3TkJ7yoy9+c3VvibT74NetQhk+7Vn06ngW9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8735.jpnprd01.prod.outlook.com (2603:1096:604:157::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 12 Jan
 2023 00:17:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 00:17:29 +0000
Message-ID: <87bkn44ne0.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 0/8] arm64: dts: renesas: Simple-Card / Audio-Graph-Card/Card2 dts for ULCB/KF
In-Reply-To: <CAMuHMdUH-CSmaKuM2HA-5j5cP_c2pygp9DqyQiOC9XkCUuzCKw@mail.gmail.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdUH-CSmaKuM2HA-5j5cP_c2pygp9DqyQiOC9XkCUuzCKw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 12 Jan 2023 00:17:28 +0000
X-ClientProxiedBy: TYCP286CA0229.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: d57d646b-a7f9-4169-77f2-08daf4326408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0EEst5YMtPGtilrI6JXkToEk4TlKXkCwP9awbFFno7kq9j3FH7WEHcOTUlH/Y9ajsBd3oY/VHYNs/yidYJG5ots2RkGTXfhla0TyFhgQUO2VykIz4uwp9ZBJDWWg3DNK/5QsRH9eGWqNmWT1Qd78YPCVrbau92rS+nofOAgkN3OZZOTSzqfoVuYlo8RPuYn32pKSJLR1PjxWnoR/XyGBmPybC4wVF2Z8c7Wof0Tv2gq0e3yEaF1/BoGzlPI3yzpB5ht0PP1skeVqMELGO1TQ2d9CNbVSV0obOy3crIznqWPuzPCpvI1/CNm+YM9gBx+rdzre3M1EW0CzQ7UEH84azg+pqNkpApv2O6WM1wZzPi+Y9Y7ahavlDiUFhg+ScCogeP/2OgQXtk7u3g6UtVPcvUIpm/OYXbwEtzDM3wRehjoIJ3Ar5jvyta9J2oYPvu2RNHFbBBFvqPoKKHbxsrUg6urlh7x1aC/yU1EFDQuZHlrAdgpi89sGXx6XvE2k+vau2je7hYLN4RojB2DlSE7PnokLmVoYMk6GtFV72jVIvITDgOLylVwMNmzbAoKKQlb7oG49IXIPVgBW2eu4hX1ANQxonhIxa1+T96+YKs7DDM9TtLXlMoA6xHL9RX+b8kq9QPUDYMPtJimDMPLzKRgVAn6DW4OB5J+f3x8ougU1NjFASdcZBFxVVPT9t+XTfO6FCm2d61bLFrAJg9TIs/oYRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(66556008)(41300700001)(66476007)(6916009)(8676002)(66946007)(4326008)(5660300002)(54906003)(316002)(8936002)(2906002)(86362001)(38100700002)(36756003)(478600001)(6486002)(38350700002)(52116002)(186003)(26005)(6506007)(2616005)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dn5yPi0ncI4a/8sQVKvXMvl2JfQ85qjd8732hEfVNmh7Hj0SUEuMYBSRRsVP?=
 =?us-ascii?Q?YEGdTJFXLFLhJ1Lo/GHHaHES24eI9cm/kbdYTvEJ9TXSW6CgTBOt/iMyVilX?=
 =?us-ascii?Q?PLn7AhJ8m4d7cbwiV+g0GjXjjBasGBoSLsXIBTKUvHyZFaTvxQ4qlgiHhQk8?=
 =?us-ascii?Q?YNN8iR9zhfqOFuUxN6tPEyOHbCfjkN7K+S+7oA+jFxsFbmpgHwpEcQKYfNF3?=
 =?us-ascii?Q?1iCg7EsMnD+mBOBFhgSLbuO7/0xSuTFNeGmpjbeZg553yVJJueRuvatrBTMy?=
 =?us-ascii?Q?1wC2Mn/6IxIhglrTWCkQAA50jCqTCJfjUVuLbnbBm0QV01FWHwq/L3tk8+l/?=
 =?us-ascii?Q?PojvnNvQPnqRLF9r0PPDQ2HBLKz19ZQl7BP9VaWy7KY75TtEP4v2hbAgZ1QZ?=
 =?us-ascii?Q?K2aJY8zqV4f2NnEutbYwLEcgOx+djXkaFscdhJZEUR1vHdAgr/p1ZTICPz54?=
 =?us-ascii?Q?381PacIafoNIYv6rUYVQE9xG/3l2uxq7XE0T65jH7qN5b4q5dNl/uRq3IX9L?=
 =?us-ascii?Q?KcKllLwM1SrI0ypYtbJbSiZ02DDX9pNx7A8guf5rYZAcgR7ZcYQO0QIUifj+?=
 =?us-ascii?Q?VfLd1+22RZFNEf39J6C/EhygwtEgjbGU9RZ2HyzMzUyvSJUUZ0E3td/f13da?=
 =?us-ascii?Q?vJBogvFqmK2u0iLQA9+9wfSH8qSkslDevjbej2E5KuIq6xKNarM3TnndVVqf?=
 =?us-ascii?Q?+/Q1utYjpF1q/uToCFPL0LlKwaK0HggwUCZvwd8CpR5gg+KHfgIQpQsoOpow?=
 =?us-ascii?Q?GgukGbQQt2sq5ykQb4Kw6dizA3gCoDhXpt00vBX0xmwKSHNLk9BNQk2qpJWX?=
 =?us-ascii?Q?LGmree54XcqvlQBGs18RRVwOwwQv9Gc+R0MrD1OdXD1CYyZmj7HKat/WrrJq?=
 =?us-ascii?Q?iIfW7+1JrALxyCR1qAkrdbKhXLkwCn4KFQy1VmRSxiiQ/WZWd+TrWQDUZVTZ?=
 =?us-ascii?Q?iC2oPhSoq20e431Cm3HKCRC6FSrKdKLltPp8nu3UQ3jMiYRddC9lmK6L+15A?=
 =?us-ascii?Q?J4mjGVskYBXBlgcbhHc0tM8BYeWtz+LE0bVf2kHQ0kor/NFT2bc52pq5qfza?=
 =?us-ascii?Q?wXOSIFBfsJvdUGY9Vb8vCXcUoogJBq9DtTZg+meUCHWCmm8XBl2xzH8c5wm9?=
 =?us-ascii?Q?Zozrp1el30Os1i2KCua05FuvW6lv3mhirBo6+eZvbvAtITjKNlT7h9ryOcCy?=
 =?us-ascii?Q?+tMpWZBKCcwBKCkXcSZrgDeSO6UPiPl9lP8Wp1VMsLdnjv0WJIZVKrYHCkv/?=
 =?us-ascii?Q?gtDx0DIjwEKJtPFsa46yYBWbFHxmPjbTwxsRqFi8VT5MNKlz081D+lKSQ1HJ?=
 =?us-ascii?Q?qOk+UJoOtDLisvBwdEL7M935sXlkxe2Izq89yhoZAhNhtabdHZaSnmLD0P5c?=
 =?us-ascii?Q?BstFh9rF236oi1p3NUKeoRJCnP6oBWQVHSB+cb26trrpdwj2eyTGBHSxFNLy?=
 =?us-ascii?Q?s9G5ev4rajLc1MEPBH8EA4NSK3fYQsgOHf/LIgZkR3OXLlCjx22Ac71X0j1f?=
 =?us-ascii?Q?PoQyjM8jQnkveiZNPiqtju5tmLl1uHY5LHoQ3I6pMCFaKnwsX7C3wQ9i6X4l?=
 =?us-ascii?Q?f6OsnY0CwNIM8oKA01pBr/qIjKCFYExJDUl0VBjXO+6Cc4Sz/p9UA1gQYaVI?=
 =?us-ascii?Q?3L9A2N81YD089mcYeQ9INbo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57d646b-a7f9-4169-77f2-08daf4326408
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 00:17:29.1258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1t1XZ1oWb5kr7W86YmcE7yyPrTevys1zcqkMLsDYtbP/L9378W5XoKTERK1m5l34cJaINoJFS0XJLOB+PtAgxzEp/gK1PB0hlix7I+7kyrfXMtfVgRlq9SClBIvPlWtC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8735
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

> I really wanted to review this earlier, but I am held back by my lack
> of understanding of the audio subsystem and the audio bindings.
> It is also not clear to me what really is hardware description
> (i.e. to be described in DT), and what is software policy (i.e. not
> to be described in DT)...

OK, I will try to answer your question, here.

> Hence I have lots of questions ("A fool can ask more questions in a
> minute than a wise man can answer in an hour." ;-)

No problem, your are very wise man :)

> What is the difference between "Simple Audio Card", "Audio Graph Card",
> and "Audio Graph Card2"?  Why do we need to support all three of them?

The answer is because of "history" and "compatibility".

"Simple Audio Card" was created before DT support, now it is supporting DT too.
But it is for very simple sound connection. It is using own DT style.

"Audio Graph Card" is almost same as "Simple Audio Card", but it is
using "Of Graph" style. It is needed for HDMI support (= Sound with Video).
"Audio Graph Card" was created because it is difficult to keep compatibility
for both "Of Graph style" and "own style" on "Simple Audio Card".

"Audio Graph Card2" is expand version of "Audio Graph Card",
but it is supporting more complex connections.
Because of this complex connection, it is difficult to keep compatibility
with "Audio Graph Card".

For normal user case, selecting one of them is very enough.
But for me, I need to test all of them, thus I want to switch these easily.
And ULCB is good board for testing.

Basically, people don't need to care about this patch-set.
It separates DT file, but nothing change.
It is just easy for testing.

> How come we can have no #sound-dai-cells, #sound-dai-cells = <0>,
> and #sound-dai-cells = <1>, for the same hardware?
> What is the real difference between Single DAI and Multi DAI?
> Why do we need to support both?

It is used on "Simple Audio Card".
We  need <0> if the board is using SSI x 1,
and need <1> if the board is using SSI x N.
It is not mandatory if the board is using "Audio Graph Card/Card2".

> > Kuninori Morimoto (8):
> >   ARM: dts: renesas: #sound-dai-cells is used when simple-card
> >   arm64: dts: renesas: #sound-dai-cells is used when simple-card
> >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
> >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
> >   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi
> 
> The above three all describe the same hardware configuration?

Yes, same hardware, but is using different connection style (= driver).

> >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
> >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
> >   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi
> 
> Is MIX and TDM Split a different hardware configuration, or software
> policy?

Same hardware, but different connection (= mixing, split).


Hmm, it is difficult to explain via text...
But this patch-set has no effect for users, but expand to easy to switch
driver for testing for me.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
