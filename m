Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F01E111FF71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 09:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfLPIKc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 03:10:32 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41691 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbfLPIKc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 03:10:32 -0500
Received: by mail-ot1-f68.google.com with SMTP id r27so8060642otc.8;
        Mon, 16 Dec 2019 00:10:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4j5mB296K3OjWTSnZCBs+O5j2Ao0bxQ6pvOe40JZ42w=;
        b=PjN0Fvkei6Za6b/T7Ww/fy24HHf2ase7GEaO+LZ9Nv4lENJpKpqefL0jE/45YRhCdE
         JhnsiaRu50vg6wz8wINa78JF7uBCLDyTL5N2WNiZJ7Pr/942PwdveRG725N8WTSmiOU6
         4/LzcqSiuJ+cnY9NMk3qmFSQqc7vBmLM0DbX+fObIbPdJO8YqLx5GZUMxCh10xYp7d16
         Va/6KsVzvWkCLWte5BWTgfsIV2iofPrUmdYjd/Fx6axEFSfnv2h2f3wD9Vazg/dOzBW3
         mozn6JJT3CdMvdj6NPaCdWdKEoykqTqfwwll/7SXif2b7S3YOZZ/Ga5FZSW/Sr0qlk5v
         U6/A==
X-Gm-Message-State: APjAAAXhYuPfRb8gOXfCboT+JcMGQeawYyKFgnSXlHFtuKLuNANL//DM
        DUrcz2U4ZqgK8fQ/78GuVFpypp/05LvEZQK/7n4=
X-Google-Smtp-Source: APXvYqyWZq4vxFZ0rUlordJFdD6oxjJaIIHj04emaSwV2tCBVu27DKwDtUKc+AphFf1h7JipnnYtHMfDu3xlZDC/BMg=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr31271896ots.250.1576483831730;
 Mon, 16 Dec 2019 00:10:31 -0800 (PST)
MIME-Version: 1.0
References: <87mubt3tux.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mubt3tux.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Dec 2019 09:10:20 +0100
Message-ID: <CAMuHMdWgPJ-m+sphVi5RDDqg=T3-v1h5aDkVCxmfjENx54DVTg@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas: r8a77990-ebisu: remove
 clkout-lr-synchronous from rcar_sound
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Patrice Chotard <patrice.chotard@st.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Linux-ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, Dec 16, 2019 at 3:08 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> rcar_sound doesn't support clkout-lr-synchronous in upstream.
> It was supported under out-of-tree rcar_sound.
> upstream rcar_sound is supporting
>         - clkout-lr-synchronous
>         + clkout-lr-asynchronous
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

IIUIC, as no upstream code looks at this property, there is no need to
apply this as a fix for v5.5, and it is safe to queue this for v5.6?

Nevertheless, I think it is good to add
Fixes: 56629fcba94c698d ("arm64: dts: renesas: ebisu: Enable Audio")
No need to resend, I can add that while applying.

Thank you!

> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -636,7 +636,6 @@
>         /* audio_clkout0/1/2/3 */
>         #clock-cells = <1>;
>         clock-frequency = <12288000 11289600>;
> -       clkout-lr-synchronous;
>
>         status = "okay";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
