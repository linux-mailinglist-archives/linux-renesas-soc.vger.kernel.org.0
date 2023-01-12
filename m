Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88DE9667087
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 12:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjALLIy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 06:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjALLH6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 06:07:58 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F18565B0;
        Thu, 12 Jan 2023 02:59:54 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id v14so16133436qtq.3;
        Thu, 12 Jan 2023 02:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IH7mi4pHsD5CSZenw/RrhIslHHOi1JF8tLoL2JEA6Vc=;
        b=nL9lPU7yXFr5+uZoKuDs//ml2yzl8+4enqRp15AYrpxwDqpMhKtHUpJeacpCrEtSLK
         X8YOCDVa3G2ezpkIpcRuLM5hSJtaK5tyy1MhGZ4fChqdQZ/8FjMzo/FYdWCujVXy+/YJ
         rLprKmi90ExGGC71FDSGd/BlV5JZCAav743kuPO1lrvXpTjxETbWoujJGyecTaanwzYZ
         anj2Gk01rxtCiEQIN7INOOsRLpPpDbSE+6tkuHhw/lVEJEomiXlEcg3Y+yrYAnMSqE9Z
         jw2xgbZJ8Wiu4sk8cmDLvgzsyj/rSP+rtOEwUPKcQgvWA3PN+A7TB1M/o6wbMNpdw8cl
         ggdQ==
X-Gm-Message-State: AFqh2koSR8I9uBrkIKH89b3ng6kXs+4eFcZ+HdO84mPqEhlsJD6c8POF
        uy63RUPSZAWZUsn+kkLTMzJcd1MYPXYfkA==
X-Google-Smtp-Source: AMrXdXu9HdZJ6phmM124FXJdrCr2psr+QOUKuj2rAgknq355bgdVsIIv4WR/Skfhics5TwDk5okqTA==
X-Received: by 2002:a05:622a:1f06:b0:3a7:ef75:62c3 with SMTP id ca6-20020a05622a1f0600b003a7ef7562c3mr16081517qtb.44.1673521192946;
        Thu, 12 Jan 2023 02:59:52 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id z13-20020ac875cd000000b003aef9d97465sm4100942qtq.43.2023.01.12.02.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 02:59:52 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id l139so18171057ybl.12;
        Thu, 12 Jan 2023 02:59:52 -0800 (PST)
X-Received: by 2002:a25:d84e:0:b0:7b4:6a33:d89f with SMTP id
 p75-20020a25d84e000000b007b46a33d89fmr1877621ybg.543.1673521192231; Thu, 12
 Jan 2023 02:59:52 -0800 (PST)
MIME-Version: 1.0
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUH-CSmaKuM2HA-5j5cP_c2pygp9DqyQiOC9XkCUuzCKw@mail.gmail.com> <87bkn44ne0.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bkn44ne0.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Jan 2023 11:59:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPS5zToCU-C=gQB3n6=OXzmhMdtVGbCn1Vk1GtKSZGwA@mail.gmail.com>
Message-ID: <CAMuHMdXPS5zToCU-C=gQB3n6=OXzmhMdtVGbCn1Vk1GtKSZGwA@mail.gmail.com>
Subject: Re: [PATCH 0/8] arm64: dts: renesas: Simple-Card /
 Audio-Graph-Card/Card2 dts for ULCB/KF
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Jan 12, 2023 at 1:17 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > What is the difference between "Simple Audio Card", "Audio Graph Card",
> > and "Audio Graph Card2"?  Why do we need to support all three of them?
>
> The answer is because of "history" and "compatibility".
>
> "Simple Audio Card" was created before DT support, now it is supporting DT too.
> But it is for very simple sound connection. It is using own DT style.
>
> "Audio Graph Card" is almost same as "Simple Audio Card", but it is
> using "Of Graph" style. It is needed for HDMI support (= Sound with Video).
> "Audio Graph Card" was created because it is difficult to keep compatibility
> for both "Of Graph style" and "own style" on "Simple Audio Card".
>
> "Audio Graph Card2" is expand version of "Audio Graph Card",
> but it is supporting more complex connections.
> Because of this complex connection, it is difficult to keep compatibility
> with "Audio Graph Card".

So they are different ways (generations) of representing the audio
topology on the board? Like "operating-points" and "operating-points-v2"
for cpufreq?

Hence these are orthogonal to (and independent of) the underlying audio
hardware in the SoC?

> For normal user case, selecting one of them is very enough.
> But for me, I need to test all of them, thus I want to switch these easily.
> And ULCB is good board for testing.
>
> Basically, people don't need to care about this patch-set.
> It separates DT file, but nothing change.
> It is just easy for testing.

OK. And I guess you intend to use them as examples to point people
to, too?

> > How come we can have no #sound-dai-cells, #sound-dai-cells = <0>,
> > and #sound-dai-cells = <1>, for the same hardware?
> > What is the real difference between Single DAI and Multi DAI?
> > Why do we need to support both?
>
> It is used on "Simple Audio Card".
> We  need <0> if the board is using SSI x 1,
> and need <1> if the board is using SSI x N.
> It is not mandatory if the board is using "Audio Graph Card/Card2".

So #sound-dai-cells should be in the board DTS, and never in the
SoC .dtsi? Hence it should be moved out of
arch/arm/boot/dts/{r8a7740,sh73a0}.dtsi and
arch/arm64/boot/dts/renesas/r9a07g0{43,44,54}.dtsi?

> > > Kuninori Morimoto (8):
> > >   ARM: dts: renesas: #sound-dai-cells is used when simple-card
> > >   arm64: dts: renesas: #sound-dai-cells is used when simple-card
> > >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
> > >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
> > >   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi
> >
> > The above three all describe the same hardware configuration?
>
> Yes, same hardware, but is using different connection style (= driver).

OK.

> > >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
> > >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
> > >   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi
> >
> > Is MIX and TDM Split a different hardware configuration, or software
> > policy?
>
> Same hardware, but different connection (= mixing, split).
>
> Hmm, it is difficult to explain via text...

IC, this is more complicated...

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
