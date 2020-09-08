Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E65C261BB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 21:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731482AbgIHTHf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 15:07:35 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:45974 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731208AbgIHQHM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 12:07:12 -0400
Received: by mail-yb1-f193.google.com with SMTP id p81so5671934ybc.12;
        Tue, 08 Sep 2020 09:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pfyuOTwmLyGVn1lQ9pxhPi2WVNvtBj8fYfp54D5EvVo=;
        b=CccC9AWrpFi93hkwniCD/8BKqp1g2ZXT7QH3ezOROyPmJ0FszaD2rJO/dd50yuSHDG
         xL3/dglRS82dbgPR4NL3N3L/ZQisjIvUjAWQcwvnL/t8ldTmpvHkBqPFZ0sLTMbgXNn1
         6jFjVeSio5Ykd0OtDt25BQC+cpPSsc3kKO53vyC+vEPlfA1TP/d5IOfpr1mK9n4gW5Gh
         c8oXjh9/4tb8KorCzlL3qhCARIma9Fvp6081CrWLzH3qfhmjyUP+wI0ET70IDirKdTpq
         yuo5RS4KnqpEc5RVwtRnOcuqTSGFAQZGFMFCuit6yJb71G43g8VL1p+P6G2wXZqd77ts
         Oi1A==
X-Gm-Message-State: AOAM5328a6lFnrqeKF9oyULNpXiZnG9i6+rp9IKhT7mOj30P3o/UicvL
        vZKG/af8+ruvSLzoiSb2NslGgc/n4sU+pyFu5Wbz2xA5jQE=
X-Google-Smtp-Source: ABdhPJyU14r/u8wDXcWH6gmYyxmxmm3S5lcUHjfasrqBDWU4cxzF8Te2Q3vx/n/0p2SaLGY6X7ddJJaL/6mzvI3RSOc=
X-Received: by 2002:a4a:4201:: with SMTP id h1mr17959802ooj.1.1599564977044;
 Tue, 08 Sep 2020 04:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 13:36:05 +0200
Message-ID: <CAMuHMdXsOki08u_Kf_xsm0OqddKL6RwmWLX+r+sekWYrgXf83w@mail.gmail.com>
Subject: Re: [PATCH 11/14] soc: renesas: rcar-rst: Add support for R-Car V3U
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

Hi Shimoda-san,

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car V3U (R8A779A0) to the R-Car RST driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/soc/renesas/rcar-rst.c
> +++ b/drivers/soc/renesas/rcar-rst.c
> @@ -37,6 +37,10 @@ static const struct rst_config rcar_rst_gen3 __initconst = {
>         .modemr = 0x60,
>  };
>
> +static const struct rst_config rcar_rst_r8a779a0 __initconst = {
> +       .modemr = 0x00,         /* MODEMR0 and it has CPG related bits */

Do you need the bits from MODEMR1, too?
Perhaps the time is ripe to add rcar_rst_read_mode_pins64(),
so users can access more than 32 bits on SoCs that provide it (R-Car
V3H and V3U)?

At least the numbering is sane on R-Car V3U. On R-Car V3H, MD29 and
higher are stored starting at bit 1 of the second MODEMR register...

> +};


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
