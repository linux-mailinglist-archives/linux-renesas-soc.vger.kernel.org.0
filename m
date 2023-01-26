Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3BE067CCFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 14:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjAZN5p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 08:57:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjAZN5o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 08:57:44 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5C86A713
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 05:57:24 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id o5so1237903qtr.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 05:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zITmSWc/9+6XwmuTec6rC27+zeq7PjV6RWOfbUvE03U=;
        b=wK1qPH6BeS+eUjdlQSyne2r/fAehwxTx7xfwl09u8J8vaj8/LFqxzElQ1rSgXTJKWb
         FTQxDB5enClklqIqkjLTeD8jPcUzPpCm3usuXfEf+SShZi47xAAjI2qfTPuv77pU0+5C
         obf2PD1j5JxJ7vv+lslBHliJ0CUnxTYTIf+moSrpC2mDtcza0za5zknaYu8nj/unPw8U
         niR6DnWVZsB0JBQoddTuVuF6mM4bgOQ+G9UFGHH9LtejrlxiOe4q6qWR4cSwk6thkiG7
         Fg2Au8QYndJgbR0P6bMpBioGjcD27gAv5PhLrQP2daJZ9H5LGwnqstuxa3XNfqzkr9KH
         6PeQ==
X-Gm-Message-State: AFqh2kqpYCoLLPtkzEpe2p2NDqr4bJnxZJ0LYfzx8VV1YHrBRo5w4K/J
        beoEScq6I8Uuml518SxF8oy5LRRZYOQINA==
X-Google-Smtp-Source: AMrXdXvgoJLZ9aTayXETDlNXvhFizrk2G+ND1fnG4O0DtmEUMFvxpMCkrg3u6ox9Tj8naMODNqLHdA==
X-Received: by 2002:ac8:7511:0:b0:3ae:7b4b:fb32 with SMTP id u17-20020ac87511000000b003ae7b4bfb32mr49420981qtq.48.1674741407756;
        Thu, 26 Jan 2023 05:56:47 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id z16-20020ae9c110000000b0070617deb4b7sm875265qki.134.2023.01.26.05.56.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 05:56:47 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id x4so2049295ybp.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 05:56:47 -0800 (PST)
X-Received: by 2002:a25:ab30:0:b0:80b:8247:e8b1 with SMTP id
 u45-20020a25ab30000000b0080b8247e8b1mr790584ybi.604.1674741407150; Thu, 26
 Jan 2023 05:56:47 -0800 (PST)
MIME-Version: 1.0
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com> <87tu0et4up.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tu0et4up.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Jan 2023 14:56:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkDgOUSCO4Qaqq7ZJ9mG1f0-915PzoRynaNOVOD_Yz-w@mail.gmail.com>
Message-ID: <CAMuHMdUkDgOUSCO4Qaqq7ZJ9mG1f0-915PzoRynaNOVOD_Yz-w@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: r8a779g0: Add Audio clocks
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Morimoto-san,

On Thu, Jan 26, 2023 at 3:19 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds module clocks for Audio (SSI/SSIU) blocks on
> the Renesas R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> @@ -202,6 +202,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
>         DEF_MOD("pfc1",         916,    R8A779G0_CLK_CL16M),
>         DEF_MOD("pfc2",         917,    R8A779G0_CLK_CL16M),
>         DEF_MOD("pfc3",         918,    R8A779G0_CLK_CL16M),
> +       DEF_MOD("ssiu",         2926,   R8A779G0_CLK_S0D6_PER),
> +       DEF_MOD("ssi",          2927,   R8A779G0_CLK_S0D6_PER),

LGTM, although I couldn't verify the parent clock.

>  };

Does this actually work as-is?
The arrays in drivers/clk/renesas/renesas-cpg-mssr.c do not yet contain
the register offsets for e.g. MSTPCR28 and beyond...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
