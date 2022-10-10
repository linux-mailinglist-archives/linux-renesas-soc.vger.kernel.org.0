Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4B55F9D56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Oct 2022 13:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbiJJLMV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Oct 2022 07:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiJJLMU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 07:12:20 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA8846D91
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 04:12:20 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id i3so6446592qkl.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 04:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sle1oX17Fjk+pIlayM5b0Lb4WcqvNWyC6zvzllHNZ+0=;
        b=q4+HI1zxdL0Y4fEOHxKXbimZktIsK2z87fLR7ls0625QeAc+OTB7hE1WXpu9/2hDfk
         YX4v5bcXdbuVRnsoBoHFCY9V4nLGiYh6DWZisdNWblK/vcu6Wrv9HtGWPx6RqtxdtvNC
         E5tc70aTVN06FOWohvhZWkyVpcCin1JaWEt9/N/lr9ewKjNLTCl/bejF3FidnNpSjGUb
         LRCAgbOaaXvnUNhntQko6iIjadb+ASg0cGE/LGJOQekLhHn8Asz6aKpK1NkCvsPA5F2Q
         y2xvt2zeYQfFDp8WZps3OSw6TloQsbtxD/c2PEVAD1WhzdCj2aKamdfIC7qMRyjtxcRU
         oYUA==
X-Gm-Message-State: ACrzQf24HkgEdbLic8qpHvlDGMuiB0/wxBiIAk0YzgDqzlhh17H8UEjn
        s9CJyivhz/qIrbBdjLVWtWHTcwU2fk6hzQ==
X-Google-Smtp-Source: AMsMyM60H1M/uqtjUywvUk5UTk184x+a9EI2SlO5P61oxGlG74WWNblw3yqfrNKsXa4sSg3bZuPE6A==
X-Received: by 2002:a37:9302:0:b0:6ce:3765:eb95 with SMTP id v2-20020a379302000000b006ce3765eb95mr12340813qkd.177.1665400339002;
        Mon, 10 Oct 2022 04:12:19 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id o3-20020ac85543000000b0035d0655b079sm8291637qtr.30.2022.10.10.04.12.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:12:18 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-354c7abf786so97805477b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 04:12:18 -0700 (PDT)
X-Received: by 2002:a81:848c:0:b0:356:e173:2c7a with SMTP id
 u134-20020a81848c000000b00356e1732c7amr15929266ywf.502.1665400337990; Mon, 10
 Oct 2022 04:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <a5bd4148f92806f7c8e577d383370f810315f586.1665155947.git.geert+renesas@glider.be>
 <Y0PQDVzGj8O4oZZY@shikoro>
In-Reply-To: <Y0PQDVzGj8O4oZZY@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Oct 2022 13:12:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBJi9kgbXKLzmz51u-46sXk2gh-mbcPZ0-vpvANDLCOg@mail.gmail.com>
Message-ID: <CAMuHMdUBJi9kgbXKLzmz51u-46sXk2gh-mbcPZ0-vpvANDLCOg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Fix HSCIF0 "brg_int" clock
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Oct 10, 2022 at 9:56 AM Wolfram Sang <wsa@kernel.org> wrote:
> On Fri, Oct 07, 2022 at 05:20:03PM +0200, Geert Uytterhoeven wrote:
> > As serial communication requires a clock signal, the High Speed Serial
> > Communication Interfaces with FIFO (HSCIF) are clocked by a clock that
> > is not affected by Spread Spectrum or Fractional Multiplication.
> >
> > Hence change the clock input for the HSCIF0 Baud Rate Generator internal
> > clock from the S0D3_PER clock to the SASYNCPERD1 clock (which has the
> > same clock rate), cfr. R-Car V4H Hardware User's Manual rev. 0.54.
> >
> > Fixes: 987da486d84a5643 ("arm64: dts: renesas: Add Renesas R8A779G0 SoC support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

> Do we need to wait for the clarification about the docs mentioned in
> another thread?

This one matches the docs ;-)
It's the module clock's parent in the clock driver which doesn't seem to
match actual hardware.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
