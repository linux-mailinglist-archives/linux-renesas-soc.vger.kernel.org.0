Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43224260EEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 11:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgIHJnw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 05:43:52 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44182 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbgIHJnw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 05:43:52 -0400
Received: by mail-ot1-f66.google.com with SMTP id a2so14278442otr.11;
        Tue, 08 Sep 2020 02:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DVylAYpz8XDFuaEu7yZH1aasxebApZrD+5SWbgpcZUk=;
        b=mEuM8t0FgUuG83xpStujov/diiB9ZkWYiY6rWIxleKrfalWnCG+Vq/dJkPMJAnjTjZ
         qgETtD77ETclauqVj42RMRWnLvd6USXNJiaQg7ShiaXgwy6TQ4+SV4rnMPX2SwyQ+6xp
         74CCCkpC+1e4Y2Iy58pXIu3S1epHp12z+5PXgzGKeOIxyQeBYU+Bv0WKknzMA52OXB9Q
         pwJ94Z3ff52XewwPEXTVcXqTjzjQcAzFLDjk5paVaZCRtoXJ2XJr3UVGi1Fbj2jCv2zc
         lLFg7JzgRCHgpTurDIfG7YzvgZ7kMdCtpkq5dslO1lsDyMV1DosnS6Z5lv3xnvwW+IWF
         6vBA==
X-Gm-Message-State: AOAM530HnXZH0RfUWKRb7s41c+77hnHfS/8YQxyTpxNF4fsMbZ+HTmND
        RUzd8rX0nH7G0LtzqMSUP+lW6cgLNiiBE6KaztSpt06y
X-Google-Smtp-Source: ABdhPJx2lND5DpgXrAjdqtxUk1CpbbWW/B/bbBMzzvcb1OAWPcj1T8Juti0rO4167CUXPYjZ5TqJ026w1Ebs/BvMAZQ=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr16160142otp.107.1599558231731;
 Tue, 08 Sep 2020 02:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 11:43:40 +0200
Message-ID: <CAMuHMdXfpgM7zjwwc73NwJHw2cNgfh7uhnQZrDgU91R=Bg0GDQ@mail.gmail.com>
Subject: Re: [PATCH 09/14] soc: renesas: identify R-Car V3U
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for identifying the R-Car V3U (R8A779A0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -272,6 +272,12 @@ config ARCH_R8A77995
>         help
>           This enables support for the Renesas R-Car D3 SoC.
>
> +config ARCH_R8A779A0
> +       bool "Renesas R-Car V3U SoC Platform"

Will update while applying to match Morimoto-san's Kconfig rework.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
