Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B52332C1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 17:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhCIQbZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 11:31:25 -0500
Received: from mail-vs1-f42.google.com ([209.85.217.42]:33443 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbhCIQbV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 11:31:21 -0500
Received: by mail-vs1-f42.google.com with SMTP id b189so7110911vsd.0;
        Tue, 09 Mar 2021 08:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7T3OrsGssaCVTzmJnu5y0QnA2KO5cJdEPpSUopY8k54=;
        b=dkeU2ePgHNzqXJl3PMrexeSjHjW04gjdSxxdvCICyC0F8tu1XvasoZ2L/r+3GVjyXq
         t3YTQk9bFFjRsawDSHHHvltsloEil62Kp5JoEXU9WzX/yNEgRkoKiighovgC11eTCeTX
         8KHirLZZBw/fLwlqLVst6xLW8N4h187Rfp6unBBhjp946H89EFPk6qC8yfZBx1FuFP0g
         ZrA+c58UTPXGGRTxRpgfubpf+aQy7u6MljUju96rq/vuTIyB2fv9D9qJ68gkeXz2seo0
         flpuOx5c/xd++Jqc4TBh7O6hiYfoNe2MMRS4HagKDBDyPencBDvnB1MubS6QFa6+L9GM
         RDxA==
X-Gm-Message-State: AOAM533LBfz23rEOiXppXKfTBt0/3GkmcfUW2wnllkvZs8zRFbGfLeGf
        WlEMzo2R+bae7yps27vAo2UpP5WwhR5PNO58wHlk77UhfeQ=
X-Google-Smtp-Source: ABdhPJwUI1nqVO7+E0ei9L00sn7NmoZGnkCtm3lDs/R4jgaSf/mgxy5JVP0Pr0MbHX6h767ick+7iQrywpENw5sZS3Y=
X-Received: by 2002:a67:8883:: with SMTP id k125mr5583688vsd.18.1615307480361;
 Tue, 09 Mar 2021 08:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20210309161415.2592105-1-niklas.soderlund+renesas@ragnatech.se> <20210309161415.2592105-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210309161415.2592105-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Mar 2021 17:31:09 +0100
Message-ID: <CAMuHMdW6dqEejq0BiedT4hsDV7U5jPkDk4jJr4-u_20NKjWPPA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: r8a779a0: Add CL16M clock
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

On Tue, Mar 9, 2021 at 5:14 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Implement support for the CL16M clock on V3U.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -147,6 +147,8 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
>
>         DEF_SD("sd0",           R8A779A0_CLK_SD0,       CLK_SDSRC,      0x870),
>
> +       DEF_FIXED("cl16m",      R8A779A0_CLK_CL16M,     CLK_PLL1_DIV2,  64, 1),

Is this any different from the "cl16mck" added by Wolfram, and
already present in renesas-clk?

> +
>         DEF_DIV6P1("mso",       R8A779A0_CLK_MSO,       CLK_PLL5_DIV4,  0x87c),
>         DEF_DIV6P1("canfd",     R8A779A0_CLK_CANFD,     CLK_PLL5_DIV4,  0x878),
>         DEF_DIV6P1("csi0",      R8A779A0_CLK_CSI0,      CLK_PLL5_DIV4,  0x880),
> diff --git a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> index f1d737ca7ca1a7ca..2974dc6035f7b936 100644
> --- a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> +++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
> @@ -51,5 +51,6 @@
>  #define R8A779A0_CLK_CBFUSA            40
>  #define R8A779A0_CLK_R                 41
>  #define R8A779A0_CLK_OSC               42
> +#define R8A779A0_CLK_CL16M             43

We already have R8A779A0_CLK_CL16MCK?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
