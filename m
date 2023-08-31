Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDC578ED1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 14:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345120AbjHaMa4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 08:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235106AbjHaMaz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 08:30:55 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3D81A4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 05:30:52 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso518080276.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 05:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693485051; x=1694089851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOZtKYeuowmHMRbZ1y5siYD7m0zs+EfxbrDHmKtXmmk=;
        b=HOKIrWh4NMU/hwFgGj6vwPQ3M/meDCZ5B/6bznvj3wbogigShojWyfMRFiZkbRg1Ch
         PY7Hn+yL5OkOUyhLAUkE02embDeYD9+skrTJGusBeSvX9BYcI3uyi40Cb+Pc8CmjLDPF
         +nm+pzSKyZ+3QUn7dE6eaXvRPqlzJyhaGJb7otlyo2pF3FHX26riRuURk1PdGNcSPdvB
         VXQqaDxS0Ncp9jnGuSUqbdEAI8yxl5B3BsjaTxdmwB+CNj9z1ei63xNU41n/Bkrk7LMf
         SSw/zLYt+a/EbzQSdkZ+U1HonV8dFSkizEaeM4xJuqvbY0xZNFrLgwpHMpfFkP/hajOI
         O+cA==
X-Gm-Message-State: AOJu0YyykqqrnDVDvbHahNygFVB7PDcyRnIOx9+aD5Y28Tu/eolU8SuJ
        eMfmf2SVNt8lyGq+doe14TtPZvHDBkHpZg==
X-Google-Smtp-Source: AGHT+IGKfab7WmOjn5TcXho7hQ90zTu/lvZa5ukJxcZ42wPmqzC+WdayKBz3V6XsX7Cx96/gxzbFbg==
X-Received: by 2002:a25:bbcc:0:b0:d58:6c03:1af0 with SMTP id c12-20020a25bbcc000000b00d586c031af0mr4687571ybk.0.1693485051358;
        Thu, 31 Aug 2023 05:30:51 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id p11-20020a25420b000000b00d7b8f7f4877sm281461yba.42.2023.08.31.05.30.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 05:30:51 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d77f614243aso530147276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 05:30:51 -0700 (PDT)
X-Received: by 2002:a25:bbcc:0:b0:d58:6c03:1af0 with SMTP id
 c12-20020a25bbcc000000b00d586c031af0mr4687546ybk.0.1693485050960; Thu, 31 Aug
 2023 05:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Aug 2023 14:30:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXc2d_oVhM9p8GOQYMV+gzPuqNBmUQ3-fNztKjLnk6GUA@mail.gmail.com>
Message-ID: <CAMuHMdXc2d_oVhM9p8GOQYMV+gzPuqNBmUQ3-fNztKjLnk6GUA@mail.gmail.com>
Subject: Re: [PATCH 00/15] arm64: dts: renesas: handles ADG bit for sound clk_i
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Aug 22, 2023 at 7:57 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Renesas Sound has been using CPG_AUDIO_CLK_I on CPG_CORE for clock,
> but it is was wrong, it should use CPG_MOD.
>
> This patch-set switches to use it.
> It is based on renesas-clk-for-v6.6-tag2 tag.

Thanks for your series!

> Kuninori Morimoto (15):
>   arm64: dts: renesas: r8a774a1: handles ADG bit for sound clk_i
>   arm64: dts: renesas: r8a774b1: handles ADG bit for sound clk_i
>   arm64: dts: renesas: r8a774c0: handles ADG bit for sound clk_i
>   arm64: dts: renesas: r8a774e1: handles ADG bit for sound clk_i
>   arm64: dts: renesas: r8a77951: handles ADG bit for sound clk_i
>   arm64: dts: renesas: r8a77960: handles ADG bit for sound clk_i
>   arm64: dts: renesas: r8a77961: handles ADG bit for sound clk_i
>   arm64: dts: renesas: r8a77965: handles ADG bit for sound clk_i
>   arm64: dts: renesas: r8a77990: handles ADG bit for sound clk_i
>   arm64: dts: renesas: r8a77995: handles ADG bit for sound clk_i
>   arm64: dts: renesas: ulcb: handles ADG bit for sound clk_i
>   arm64: dts: renesas: hihope-rev4: handles ADG bit for sound clk_i
>   arm64: dts: renesas: salvator-common: handles ADG bit for sound clk_i
>   arm64: dts: renesas: beacon-renesom-baseboard: handles ADG bit for sound clk_i
>   arm64: dts: renesas: remove CPG_AUDIO_CLK_I

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.7.

If you don't mind, I would like to squash this into a single commit.
Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
