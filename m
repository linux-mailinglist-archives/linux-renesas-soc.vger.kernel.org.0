Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8991C368F75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 11:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhDWJge convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 05:36:34 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:35535 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhDWJge (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 05:36:34 -0400
Received: by mail-vs1-f43.google.com with SMTP id g20so24355417vst.2;
        Fri, 23 Apr 2021 02:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZlsnD+/yMmsZHwVBAU+yyMMtrgUWUBC70Kuq95HkFpg=;
        b=Mtr7gPfTtwxlLlqibhFaL6VO+jvOUyQAyWDM8JzP5JkkmP5yij0YA+2zSZF5bG4j+x
         hYji7X6b/xPZYEcGozws2LlBMc4BqIMkpcs0XZu3b1PN64Rm9gKsb5Mroz69oJARGiWt
         mBiyu+wDvSWLVhXwhWHl+RW41a/+cMw40JOThuqHjg5sKuVS++aOohJEWNR+3b4gqabM
         1pRANNwXejW66mjqvOomW9gEe6GCvrlXfWQhx+NuQd5QnRgmRlTV3Yx0aLVJJX0AiJ1k
         VG3GQW4EloehyuVbQkavcMBZhP80OMjGzd3BIV+6TIQJgekF2GxqHI2fQZ+LdahUtPe5
         XAMA==
X-Gm-Message-State: AOAM530LCTluOXc064taKrxB5Zh19ecsRLD/Fn3sJgE51gDXBXru9afT
        w2q8PRJjobm174jm9ank+IlhuNd0tETQgXUFE7U=
X-Google-Smtp-Source: ABdhPJzgFUpnjKealiX1Us6N/axnBjG1ohxe0Jm/07slQ5sbQF5zE9pYnmWk5bvlBLkBlDIvJeLFU1ElIS9n1ZrORws=
X-Received: by 2002:a05:6102:814:: with SMTP id g20mr2455801vsb.42.1619170556142;
 Fri, 23 Apr 2021 02:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210329223220.1139211-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210329223220.1139211-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Apr 2021 11:35:45 +0200
Message-ID: <CAMuHMdWFy=hS8=f3s+tims1pJnvnXn76n5SCp+v+mbM8Gi5hvA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779a0: Add ISPCS clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Tue, Mar 30, 2021 at 12:33 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add support for the ISPCS clocks on V3U.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -180,6 +180,10 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
>         DEF_MOD("i2c4",         522,    R8A779A0_CLK_S1D4),
>         DEF_MOD("i2c5",         523,    R8A779A0_CLK_S1D4),
>         DEF_MOD("i2c6",         524,    R8A779A0_CLK_S1D4),
> +       DEF_MOD("ispcs0",       612,    R8A779A0_CLK_S1D1),
> +       DEF_MOD("ispcs1",       613,    R8A779A0_CLK_S1D1),
> +       DEF_MOD("ispcs2",       614,    R8A779A0_CLK_S1D1),
> +       DEF_MOD("ispcs3",       615,    R8A779A0_CLK_S1D1),

Unfortunately the parent clock is not explicitly documented in the
hardware manual.  But S1D1 does match max. 479 Mpixel/s.

>         DEF_MOD("msi0",         618,    R8A779A0_CLK_MSO),
>         DEF_MOD("msi1",         619,    R8A779A0_CLK_MSO),
>         DEF_MOD("msi2",         620,    R8A779A0_CLK_MSO),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.14.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
