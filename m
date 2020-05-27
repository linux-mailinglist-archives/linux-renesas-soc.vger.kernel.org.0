Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508D51E3AFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 09:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387674AbgE0Hwo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 03:52:44 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46930 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387650AbgE0Hwn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 03:52:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id g25so18458909otp.13;
        Wed, 27 May 2020 00:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S/vXGrBoFycwluM2P5rydMxcUoPDQRXCjdLYfWHMt+E=;
        b=nRaSjJe3qtTsnpuPc36TJBCa8WIfR3RHp8BMv/yh6UlvBWcICMRZHdxbwBqG/bAqUa
         oybSSVMKskrspoZDTXqHkLjGh/DRmdK9Pfd66iKCpVSSYzrMNoAOmggF5QlJZ5XqXSPu
         3BPC2BZYdCjuh5NC7jAAgQLXt9Ooz7NnybuVEInI+18BDgHZqpyFnkCfvqDObuV9N131
         BiitQ2Q8HYfOPrnJSJ8o9GPMDG4NnGZLCChpvkJkSip2OU+234m7U4bTt+0WvdA18c2C
         ruTIesetsBSwqMVZMV/CMaxFB08i1dwziZO2lsR98ywQd/IzeEhfRGhwnrykEZudoR+8
         kz+w==
X-Gm-Message-State: AOAM533tcNNzZ+93RePWbC0mtIKfE2sddhLxntwQCTrUovsKFCTzb2/k
        1+B89Glug4bDwN6Vo7OGIXyjTE7tvtPfEa0f4ve/nA==
X-Google-Smtp-Source: ABdhPJyh6XnGunqKyldUQUDAVmqdF5DZz8KnpZzyv3nLlCp4H9hrYSx91YK6xYIWALYMvjLu0Y9UEg6PEXXjbHVOKSI=
X-Received: by 2002:a05:6830:18d9:: with SMTP id v25mr3526020ote.107.1590565962830;
 Wed, 27 May 2020 00:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590526904-13855-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590526904-13855-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 May 2020 09:52:31 +0200
Message-ID: <CAMuHMdWQ5i4QiMuSEPrHC4i6fDGa2aJrKO5gzyrsc=uCCdYAhQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7742: Add audio support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC Morimoto-san

On Tue, May 26, 2020 at 11:02 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add sound support for the RZ/G1H SoC (a.k.a. R8A7742).
>
> This work is based on similar work done on the R8A7744 SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
