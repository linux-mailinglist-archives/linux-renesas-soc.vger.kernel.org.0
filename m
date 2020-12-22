Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A452E08E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 11:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgLVKgq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 05:36:46 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:46733 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgLVKgp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 05:36:45 -0500
Received: by mail-oi1-f178.google.com with SMTP id q205so14248729oig.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 02:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z74Dp8Nr09WyUmtydpUpM76UQjRM7SM++a06Ux04Uag=;
        b=MgVhSEbl43mcEjqfpASlsOrDAv004Rrbe9f6Fa4/bALMhDnvpF2z4ajgMtdB7NwnEH
         fvy9X37eBI+LdY+F902kLeks7lpsNVgCNhe2Zsx5wz6XDmvZhGVdWFYJ4TLOfmZGxyVH
         i6T4sON9BZ5OEcOWGgUyzdS82FVrqaaDJ8oUAUyqjvcYoe8XYLboPMbEdWPZ/sQwpLgV
         zSZfqVOfmJP/6z0huRB9CWi7G0Y3iie+kGQFj++wPsC0eXimZ+9qnsiLQb/oJC28zv4n
         0fEFIU3IdNuwKNYnkzL5GwLofohps84JGf4UwqhcS1tOhI7cnFmyG+D4teJDJgMqpcRt
         +1Iw==
X-Gm-Message-State: AOAM531c40y01Bm62FWKQ1t13tvzwwiqoT1vBao1pLgcRSKCexiT4pGW
        WKvi/Rq+Gc+rcX6gA2fMqwXhGyImKbPjpO8L0uF+nl83YmI=
X-Google-Smtp-Source: ABdhPJxy0kKZhYRReAhWgi0uKS3BBE6/naD9BjOnz8f5RMh2roERrqS7UYpnvndxAz12ZVgRitwWK5tWWqDj2QZle8Y=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr13807985oia.148.1608633364766;
 Tue, 22 Dec 2020 02:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20201221165448.27312-1-uli+renesas@fpond.eu> <20201221165448.27312-4-uli+renesas@fpond.eu>
In-Reply-To: <20201221165448.27312-4-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 11:35:53 +0100
Message-ID: <CAMuHMdULv02mKuZxNeT+iEkBL0Wmhut_VdqS_DKKCyjA3+EHsQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: add PORT_GP_CFG_{2,31} macros
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One suggestion below...

> --- a/drivers/pinctrl/renesas/sh_pfc.h
> +++ b/drivers/pinctrl/renesas/sh_pfc.h
> @@ -460,6 +460,11 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
>         fn(bank, pin, GP_##bank##_##pin, sfx, cfg)
>  #define PORT_GP_1(bank, pin, fn, sfx)  PORT_GP_CFG_1(bank, pin, fn, sfx, 0)
>
> +#define PORT_GP_CFG_2(bank, fn, sfx, cfg)                              \
> +       PORT_GP_CFG_1(bank, 0,  fn, sfx, cfg),                          \
> +       PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg)
> +#define PORT_GP_2(bank, fn, sfx)       PORT_GP_CFG_2(bank, fn, sfx, 0)
> +
>  #define PORT_GP_CFG_4(bank, fn, sfx, cfg)                              \
>         PORT_GP_CFG_1(bank, 0,  fn, sfx, cfg),                          \
>         PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg),                          \

This can now start using PORT_GP_CFG_2().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
