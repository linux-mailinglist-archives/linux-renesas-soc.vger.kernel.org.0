Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6F8332C3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 17:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhCIQhT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 11:37:19 -0500
Received: from mail-vs1-f49.google.com ([209.85.217.49]:37229 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhCIQhP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 11:37:15 -0500
Received: by mail-vs1-f49.google.com with SMTP id l27so7123115vsj.4;
        Tue, 09 Mar 2021 08:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HUZ4t15V9I/1vz47YrFHCQni86f94WsYW12d910ZHfo=;
        b=as8Dr2w7z0V3E3muyIS4AoXjpEGVIeqCYFfHGV5hFVjpxetWEgWs2qmAe1jEaoqV7B
         qn29Gi8GHJXlLC/kKzClV6a/K3CwiuxTzc58p86TIDW+ogdZRMZxCZOg1soLGHhlwePU
         Ozf9rRG82EUdcjJjv5Re42uOnG+RjhXaRRQHlihS3+IV8M4++6mSTg2bY9pAfrv6r8CJ
         0X49EYrk3KKYhAseI6mZXjMDxMPb32mgbvMOB9kkz/+vWAZc1ElmPLa0R3geOTumLEPU
         bqEkIblm4smRw2ugVLE7QGYa02XwgflgqTEPjEMQsmN8W2pePfNpxBKVwsVJMfyYc8pA
         URvQ==
X-Gm-Message-State: AOAM532OV5aZxsDrPmE2GAmImY3YUSXtIsQnwdvI9Kj9+CejS1TCnKyl
        lfGV9uStwB5zKK80UTKPsPWPQaT3jDp68EyfoQ90H12dkKs=
X-Google-Smtp-Source: ABdhPJzaC+5KFcaTX3OyX+4n4qcGGLNj3w7mbjC7f5KPpstR6V5rbEjbAhiGAyrI3Y76e9RHB2463svwZlBW9LeFI8M=
X-Received: by 2002:a67:f7c6:: with SMTP id a6mr17491782vsp.42.1615307834805;
 Tue, 09 Mar 2021 08:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20210309161415.2592105-1-niklas.soderlund+renesas@ragnatech.se> <20210309161415.2592105-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210309161415.2592105-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Mar 2021 17:37:03 +0100
Message-ID: <CAMuHMdVNH1rviXR9QuZV_4tQQrgKOaRGPo+UGKsHfXpn5gPS9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r8a779a0: Add TSC clock
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
> Implement support for the TSC clock on V3U.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -233,6 +233,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
>         DEF_MOD("pfc1",         916,    R8A779A0_CLK_CP),
>         DEF_MOD("pfc2",         917,    R8A779A0_CLK_CP),
>         DEF_MOD("pfc3",         918,    R8A779A0_CLK_CP),
> +       DEF_MOD("tsc",          919,    R8A779A0_CLK_CL16M),

R8A779A0_CLK_CL16MCK?

>         DEF_MOD("vspx0",        1028,   R8A779A0_CLK_S1D1),
>         DEF_MOD("vspx1",        1029,   R8A779A0_CLK_S1D1),
>         DEF_MOD("vspx2",        1030,   R8A779A0_CLK_S1D1),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
