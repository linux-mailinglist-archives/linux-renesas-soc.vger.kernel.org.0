Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834AB67CD46
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 15:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjAZOKD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 09:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjAZOJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:09:46 -0500
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF8136690;
        Thu, 26 Jan 2023 06:09:45 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id m12so1501229qvt.9;
        Thu, 26 Jan 2023 06:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNOgtEE7H1l/AO8s03pTaXslPPOOy5fTOkR4y1H9rA8=;
        b=1QD4yfotXoM91Xy0WP9+6tTKa6t1SC6ectyQXdhDhroL38Wup+Y8yx6zHPWrwNdbEj
         wXewuaP4MOyek+BJFVH4/4e+E/FwXVmaOy9+fq5ty7/36XPQJjg2Hd4NWGztRGiVMCed
         iQmFaOyw/V+Dq8sl4//cG2bOT3QU5lQAjGQiuvDa4jJCxbw2oSTiDsBC3Lqye7kuEc94
         NDwYxL1QX7EF3e3pOCT9xxbASqlYTjLWZyJIGm+jfdSg+WgnT8oUeD92NHpNBX80tEof
         mMD2hp83e5nQPXD92jlR2a2QROENCUm42TVbvzsWtcddlPe+V22DbuBLghq2hC+OrFzB
         0Qpw==
X-Gm-Message-State: AO0yUKVAOhXM495FxW/Ki+KyvTBqa8sYF/ilnDPGXRxOh18SLNK+wLmr
        hBh4Sfjq2xFwJyOcfk6tImZ/2frg04/6UQ==
X-Google-Smtp-Source: AK7set8l2rCjeJ3aD4d5nQs5eKYjsBZvnDe/S9mu/+SSZEErZQO6YokJp/GiUBjWfSuYzupKMnJylQ==
X-Received: by 2002:a05:6214:5189:b0:537:791d:51c6 with SMTP id kl9-20020a056214518900b00537791d51c6mr2993741qvb.14.1674742184241;
        Thu, 26 Jan 2023 06:09:44 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id pi48-20020a05620a37b000b006e16dcf99c8sm947974qkn.71.2023.01.26.06.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 06:09:43 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id d132so2080093ybb.5;
        Thu, 26 Jan 2023 06:09:43 -0800 (PST)
X-Received: by 2002:a25:ab30:0:b0:80b:8247:e8b1 with SMTP id
 u45-20020a25ab30000000b0080b8247e8b1mr794862ybi.604.1674742183328; Thu, 26
 Jan 2023 06:09:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670492384.git.geert+renesas@glider.be> <a174da512fb1cba0a001c9aed130a2adca14e60a.1670492384.git.geert+renesas@glider.be>
In-Reply-To: <a174da512fb1cba0a001c9aed130a2adca14e60a.1670492384.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Jan 2023 15:09:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZ7DL=bo8+g=jWKC=z3aXaRzvZNu5KirRgzvuU7jv=NQ@mail.gmail.com>
Message-ID: <CAMuHMdVZ7DL=bo8+g=jWKC=z3aXaRzvZNu5KirRgzvuU7jv=NQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rcar-gen4: Add support for fractional multiplication
To:     geert+renesas@glider.be
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tho Vu <tho.vu.wh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 8, 2022 at 2:07 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> R-Car Gen4 PLLs support fractional multiplication, which can improve
> accuracy when configuring a specific frequency.
>
> Add support for fractional multiplication to the custom clock driver
> for PLLs, which is currently used only for PLL2 on R-Car V4H.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I am not so sure it is worth supporting this.
> On R-Car V4H, the following clock rates are seen for PLL2 and the
> Cortex-A76 CPU core clock, when using the Normal vs. the
> High-Performance mode:
>
>                                         Multiplication Mode
>                                         Integer         Frational
>                                         ----------      ----------
>     Normal (1.7 GHz):            PLL2   3399999864      3399999997
>                                  Z0     1699999932      1699999999
>     High-Performance (1.8 GHz):  PLL2   3599999856      3599999997
>                                  Z0     1799999928      1799999999
>
> The improvement is of a similar order of magnitude as the accuracy of
> the external crystal, hence insignificant...

Hence I'm ignoring this, unless someone has a good reason to push
through...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
