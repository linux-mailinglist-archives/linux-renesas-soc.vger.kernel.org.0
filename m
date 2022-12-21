Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABB5653241
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Dec 2022 15:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbiLUOLP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Dec 2022 09:11:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234274AbiLUOLA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Dec 2022 09:11:00 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65B424095;
        Wed, 21 Dec 2022 06:10:56 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id c11so5822342qtn.11;
        Wed, 21 Dec 2022 06:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIhLv835I1GI2d8jh8RU1BseDr7GqADIOgxul2V3U0g=;
        b=CUgii75dJDf/S7+mI68UpTfsX/Is3m0Xr2gcy9O1lbEuD4tNUbO5NG8R0E/9teW24z
         cqY1CbH1edTuqU/4oC2oKdrB2ylwDCygpCp5GOqXYmJ2/o+y0hapwm5aRsUIXui0iSuE
         zXwfE6WeJehIUJvwxmA75XhjSggouxu27UjeiMo8Ql8Hhq63mjO0u7MN7ENj/FieoaYD
         VdJxCZp5IjPb1gEuJGDYrK50mh1GIqds8TeNGmWvUQWVNbLk0cNXFpVeyhETXddtfm5G
         p5WEU3OKgSoOqiynJdo4aKi9tNjKYGPrcZYiaoCfRdQZPWxZkjW8GkLUOEW8b0LU9C7U
         dbBw==
X-Gm-Message-State: AFqh2ko0xVR0RsXUCkqLDfXbfObpF6ZpugHqgzBgVDyC75IgkK4+eHIV
        DKu8MwCGe6Zol5ebHzbbcqhBjlq4n8gw+g==
X-Google-Smtp-Source: AMrXdXv6Mg8MLP6MDWm0ZrtXTWg3aSmNyvOgeRAlYLR/5MTolsclHCqweApPx/S+cZamNyQc9mBbcg==
X-Received: by 2002:ac8:5199:0:b0:3a4:ff03:f1ac with SMTP id c25-20020ac85199000000b003a4ff03f1acmr8878058qtn.6.1671631855612;
        Wed, 21 Dec 2022 06:10:55 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id hg12-20020a05622a610c00b003a591194221sm251990qtb.7.2022.12.21.06.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 06:10:55 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id n78so5324759yba.12;
        Wed, 21 Dec 2022 06:10:54 -0800 (PST)
X-Received: by 2002:a25:d103:0:b0:75d:3ecb:1967 with SMTP id
 i3-20020a25d103000000b0075d3ecb1967mr93159ybg.604.1671631854704; Wed, 21 Dec
 2022 06:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20221124191643.3193423-1-biju.das.jz@bp.renesas.com>
 <20221124191643.3193423-2-biju.das.jz@bp.renesas.com> <CAMuHMdWimoWKYMfH3kYFxoSfQqa+chUmCR_XtzC7QkjHWnzCog@mail.gmail.com>
In-Reply-To: <CAMuHMdWimoWKYMfH3kYFxoSfQqa+chUmCR_XtzC7QkjHWnzCog@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Dec 2022 15:10:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRVemoko7Ab_yM2Fuv25GV==_+T6HEHnZ1=99P2_dH8w@mail.gmail.com>
Message-ID: <CAMuHMdWRVemoko7Ab_yM2Fuv25GV==_+T6HEHnZ1=99P2_dH8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: renesas: r9a09g011: Add PWM clock and reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

On Thu, Dec 1, 2022 at 9:34 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Nov 24, 2022 at 8:16 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Add PWM{8..14} clock and reset entries to CPG driver.
> >
> > The PWM IP on the RZ/V2M comes with 16 channels, but the ISP has
> > full control of channels 0 to 7, and channel 15, therefore Linux
> > is only allowed to use channels 8 to 14.
> >
> > The PWM channel 15 shares apb clock and reset with PWM{8..14}.
> > The reset is deasserted by the bootloader/ISP.
> >
> > Add PWM{8..14} clocks to CPG driver and mark apb clock as
> > critical clock, so that the apb clock will be always on.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Updated commit description
> >  * Replaced pwm8_15_pclk->cperi_grpf
> >  * Added reset entry R9A09G011_PWM_GPF_PRESETN
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk-for-v6.3.

> > @@ -147,11 +155,13 @@ static const struct rzg2l_reset r9a09g011_resets[] = {
> >         DEF_RST_MON(R9A09G011_SYC_RST_N,        0x610, 9,  13),
> >         DEF_RST(R9A09G011_IIC_GPA_PRESETN,      0x614, 8),
> >         DEF_RST(R9A09G011_IIC_GPB_PRESETN,      0x614, 9),
> > +       DEF_RST_MON(R9A09G011_PWM_GPF_PRESETN,  0x614, 5, 23),

I will move this entry up, to preserve sort order (by bit number).

> >         DEF_RST_MON(R9A09G011_WDT0_PRESETN,     0x614, 12, 19),
> >  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
