Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196C53CF72C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 11:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhGTJIG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 05:08:06 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:43005 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhGTJIG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 05:08:06 -0400
Received: by mail-vs1-f44.google.com with SMTP id u7so10905064vst.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jul 2021 02:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TlTRywORmagYOylQIe+Nw7+fdHtAWJ99PQcf3gpgDsM=;
        b=iff+bMdVQCho8I+Gx14zWNara6qglKNPYJuXXw+4WUgQjXkGUToFtOda+Ju6Udg/mv
         Z6pzQBUbM5k78Y59gWraCLfwdcyTJHRQQdm2jQPRgS+YtvMXxlQQbNApNK/u+NQXY87v
         dKV6z+Hh4vbauSI0B1zpHI0GwibccBlwMhXAERkrmuvqJ3kAf6cvZFm/Z6rG0ssX6I0A
         zikRaaG/yGmWp4es+76XpD0NLjz0ydxQmwGFP5qg+2SGM+k+ewlz76NpxEXn7/w85FdN
         fAUMnG+i/lI/e77EuF3mhwTPGz6gtkKdSeUsQu1G5Q2tpGgmxuUNowOMsDZSJ4L/nG1h
         Osvg==
X-Gm-Message-State: AOAM531ZJaNYa0w69as1dtWqiy50hf7nrop1obBCGtF2qZuTTk+tetkX
        ZlxkIiv5SIwuSIi1hZm9InKZEdEgEtaRL/aQpEU=
X-Google-Smtp-Source: ABdhPJyNAoKIlOTlEdibNwGa9FU2ebOgw0+zfjj9dlrneKTEmb+x9ZnkMTqC79UsorDdHEPBGbnYgOnF5ZVy/4WMVG8=
X-Received: by 2002:a67:1542:: with SMTP id 63mr28750650vsv.40.1626774523816;
 Tue, 20 Jul 2021 02:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <87fsw9x3zx.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fsw9x3zx.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Jul 2021 11:48:32 +0200
Message-ID: <CAMuHMdUO7iVpp=93O64fbS-YxkvFhGvpO86=bvROuEVRT3WMOA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: r8a77995: draak: Add R-Car Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Jul 20, 2021 at 1:45 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> These adds R-Car Sound support for Draak
>
> Kuninori Morimoto (2):
>   arm64: dts: renesas: r8a77995: add R-Car Sound support
>   arm64: dts: renesas: r8a77995: draak: Add R-Car Sound support
>
>  .../arm64/boot/dts/renesas/r8a77995-draak.dts | 121 ++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi     | 158 ++++++++++++++++++
>  2 files changed, 279 insertions(+)

Thank you for the update (v4). Will queue in renesas-devel for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
