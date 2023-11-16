Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B487EE8A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Nov 2023 22:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjKPVJG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Nov 2023 16:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjKPVJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 16:09:06 -0500
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A55CB9;
        Thu, 16 Nov 2023 13:09:01 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5b383b4184fso14720017b3.1;
        Thu, 16 Nov 2023 13:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700168940; x=1700773740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmAR3Dzl+2Yap6j2yy8l4JfxyLBr+pYiVj7xTuK3lwA=;
        b=VL8HkbDCk/naPeU/JjvUsnxrA7T7L9rXoD54mtwVpFNX/CHsmiFdYrtsIdK2s0n2Z0
         Z6XBAmbeIvIewvJMaW/cALyaUIYm3VRmYOwQy6MU1N6eA/wLzMQPF32y44IKHgy/ekk1
         NDXwL5R2a20NtnP3EHBhsBgqoLxwrkpp6diDpRjIh8121gFMEcppvt6zwlLDV8lnv88R
         46BHM2sPbwobQA4+Lv8Jwp5ykVg1UATp3+gGTQw7V8Zhu1TuwaljOc/Qg9gqu8z24X11
         UyynbsOzuB2r8rkrOd0AoD/acr+kTpM+PBNZ9PUTboKVdDtMVaorXwfvTi3TO8s1fe28
         R3Eg==
X-Gm-Message-State: AOJu0Yy82tqm2wPUotByOyhSaaCkARO0eaVxXT96tllchHUT/mN93IBz
        IpXzi7ejN1BJK1hQ6PD9UtaY6cdwrc3UZw==
X-Google-Smtp-Source: AGHT+IH+MKO1S2qViUWa/qjSyNItu+lV2cKb4Tv5znsbhI8QPdMo0E7jNmnxw5IRAQHURrSp6gy+mA==
X-Received: by 2002:a81:89c5:0:b0:5b8:d451:9b84 with SMTP id z188-20020a8189c5000000b005b8d4519b84mr16112808ywf.17.1700168940454;
        Thu, 16 Nov 2023 13:09:00 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id j142-20020a819294000000b0059f802fad40sm98443ywg.22.2023.11.16.13.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 13:08:59 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5b383b4184fso14719657b3.1;
        Thu, 16 Nov 2023 13:08:58 -0800 (PST)
X-Received: by 2002:a0d:cb0c:0:b0:5a7:bc38:fff2 with SMTP id
 n12-20020a0dcb0c000000b005a7bc38fff2mr17325818ywd.15.1700168938637; Thu, 16
 Nov 2023 13:08:58 -0800 (PST)
MIME-Version: 1.0
References: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com>
 <87wmulrynq.wl-kuninori.morimoto.gx@renesas.com> <20231116192324.GB2821275-robh@kernel.org>
In-Reply-To: <20231116192324.GB2821275-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Nov 2023 22:08:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU0Hqem8Ooehoo64rrGn8q8+5A8_DjGZd9Tvh=Xej6mdA@mail.gmail.com>
Message-ID: <CAMuHMdU0Hqem8Ooehoo64rrGn8q8+5A8_DjGZd9Tvh=Xej6mdA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is
 assinged to non Linux system
To:     Rob Herring <robh@kernel.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Aymeric Aillet <aymeric.aillet@iot.bzh>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Thu, Nov 16, 2023 at 8:23 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, Nov 14, 2023 at 12:01:14AM +0000, Kuninori Morimoto wrote:
> > Some board might use Linux and another OS in the same time. In such
> > case, current Linux will stop necessary module clock when booting
> > which is not used on Linux side, but is used on another OS side.
> >
> > To avoid such situation, renesas-cpg-mssr try to find
> > status = "reserved" devices (A), and add CLK_IGNORE_UNUSED flag to its
> > <&cgp CPG_MOD xxx> clock (B).
>
> See Stephen's presentation from Plumbers this week. The default behavior
> for unused clocks may be changing soon.

Thank you!

ou mean "Make sync_state()/handoff work for the common clk
framework"[1]? IIUIC, that presentation didn't cover the problem we are
facing, except for the big "Kconfig for clk_ignore_unused=true" hammer.

> > Table 2.4: Values for status property
> > https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf
> >
> > "reserved"
> >       Indicates that the device is operational, but should not be
> >       used. Typically this is used for devices that are controlled
> >       by another software component, such as platform firmware.
> >
> > ex)
> >       scif5: serial@e6f30000 {
> >               ...
> > (B)           clocks = <&cpg CPG_MOD 202>,
> >                        <&cpg CPG_CORE R8A7795_CLK_S3D1>,
> >                        <&scif_clk>;
> >               ...
> > (A)           status = "reserved";
> >       };
>
> I have some reservations about whether a reserved node should be touched
> at all by Linux. I suppose since it is platform specific, it's okay. I
> don't think we could apply such behavior globally.

That's an interesting comment, as the issue is that currently Linux
does touch (resources belonging to) reserved nodes, and this patch
would prevent doing that for module clock resources;-)

The core issue is that Linux distinguishes only between two cases:
  1. "device is used by Linux" (if a driver is available),
     as indicated by 'status = "okay"' in DT, or
  2. "device is unused by Linux".
On a heterogenous system, the latter actually comprises two cases:
  2a. "device is unused", or
  2b. "device is used by another OS running on another CPU core".

Looking for 'status = "reserved"' allows us to distinguish between 2a
and 2b, and can prevent disabling clocks that are used by another OS.
Probably we need a similar solution for power domains.

Do you have a better or alternative suggestion?
Thanks!

[1] https://lpc.events/event/17/contributions/1432/
    https://www.youtube.com/watch?v=NSSSIVQgsIk?t=164m

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
