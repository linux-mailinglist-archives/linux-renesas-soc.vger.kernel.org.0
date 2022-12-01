Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9704163EB30
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 09:34:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiLAIea (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 03:34:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiLAIe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 03:34:29 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C0358027;
        Thu,  1 Dec 2022 00:34:28 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id i12so872000qvs.2;
        Thu, 01 Dec 2022 00:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhY3YFkRWIrtWfmzSO+RL6iW0d4inthXuirOzpTcfjk=;
        b=yCupXeeUlsSUfFL0e3PPU8odxJ0r8G2XlQvlLtRx2Hn130XavBKgmOhhGvsMLSyCz0
         8SQFOenUpbaK3VjJb3OxbhmmFNQA4679SZH1SViRWt+HybNos+x3SfuyNAJzNZoEFku5
         7d5V9S/WxPF0m9Ic01373dd1LsjnO2W6zNdJHJcMYYoUjgxxluful+GV3AJPzPAYc+T8
         U33kFtQItzLlkI4H94RgZ3savKV+7UJ4/QtDZ/H7o4NpEohPF96+iFrdcWIOO5aTw1v1
         bZj85YtAp5K6tm4llIdRFaRsQgUStF7z61yHyeerx+QNdR/KEB8di7KKSIVC5mrtaWf9
         3BJQ==
X-Gm-Message-State: ANoB5plXZvUERjCegQFysgTMLgJBkNiQlyLb4V1vpKXOKn/iipHn+L5w
        UpRN27HqQmdPxbLdUl/zerRuFGxlE2Ecuw==
X-Google-Smtp-Source: AA0mqf6TpOay+2AS7h2spm2Pb3xmuafkA4DALYH8dsr+o4J2sA00Xtu7/2X3pkJqmbEXnhjWRkgV1g==
X-Received: by 2002:a0c:8002:0:b0:4c6:ec49:9768 with SMTP id 2-20020a0c8002000000b004c6ec499768mr24254937qva.120.1669883667127;
        Thu, 01 Dec 2022 00:34:27 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id de3-20020a05620a370300b006e99290e83fsm2923060qkb.107.2022.12.01.00.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 00:34:26 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3876f88d320so9922937b3.6;
        Thu, 01 Dec 2022 00:34:26 -0800 (PST)
X-Received: by 2002:a81:a148:0:b0:3b4:8af5:48e with SMTP id
 y69-20020a81a148000000b003b48af5048emr33859202ywg.383.1669883666369; Thu, 01
 Dec 2022 00:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20221124191643.3193423-1-biju.das.jz@bp.renesas.com> <20221124191643.3193423-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221124191643.3193423-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Dec 2022 09:34:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWimoWKYMfH3kYFxoSfQqa+chUmCR_XtzC7QkjHWnzCog@mail.gmail.com>
Message-ID: <CAMuHMdWimoWKYMfH3kYFxoSfQqa+chUmCR_XtzC7QkjHWnzCog@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: renesas: r9a09g011: Add PWM clock and reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 24, 2022 at 8:16 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add PWM{8..14} clock and reset entries to CPG driver.
>
> The PWM IP on the RZ/V2M comes with 16 channels, but the ISP has
> full control of channels 0 to 7, and channel 15, therefore Linux
> is only allowed to use channels 8 to 14.
>
> The PWM channel 15 shares apb clock and reset with PWM{8..14}.
> The reset is deasserted by the bootloader/ISP.
>
> Add PWM{8..14} clocks to CPG driver and mark apb clock as
> critical clock, so that the apb clock will be always on.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description
>  * Replaced pwm8_15_pclk->cperi_grpf
>  * Added reset entry R9A09G011_PWM_GPF_PRESETN

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
