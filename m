Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C057DEC3B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 14:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbfKANee (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 09:34:34 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42579 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfKANed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 09:34:33 -0400
Received: by mail-oi1-f194.google.com with SMTP id i185so8140949oif.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Nov 2019 06:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4fdJ5cMij5TvHogILeZV/uBPm8Fei0lU7mXn7gZR+xg=;
        b=O8FtM7IAlfq1pWnRAFrbcpkEsSDob8gVZ5DuZZsaxz4l/bqtvQIUGH09bs3DIHioLq
         UKVBQM2TBgU3yvst/jhnQhd7GnEcr5sNVbu9ckpq+/qMsIUkrXr7AZSiJahYQ6mZk63v
         2t6bgkZ9pYwzS4VwdIdB3f0ZJMVwRiucYYx83hZnbSK6NeAPQKCGIwK5r2QBa5iGWqpu
         RILw6WOYgSbLs+cSMdVcx7FVy1hCaZBH0OP1A1slUFHGBp91VvO8f2l+5Y0q4P+1bAZK
         xdeCfZSnlYwtGPz7eBDNoUbuFlRfELkApjpDepAtEaooM/52G0B7IFVz1YgqGLfXECOg
         pzEQ==
X-Gm-Message-State: APjAAAUf5YFBNONkZ3WI2B1Xb3PPzb/LeCnlwPYNRBI3mCnX6bXwj01d
        LtzCZ9ELEitO2F0nIjneEscklX+Bu+Nh6Z2FVuQ=
X-Google-Smtp-Source: APXvYqxS1zsISt+Nc8b5MZCJ+O+mzhKy8gwuIrfPCXiNV5T0D/z1RuckyJnw1hs8wTnmI+QMDPlgzyJ7pCpfMctXDPc=
X-Received: by 2002:a05:6808:60a:: with SMTP id y10mr2073033oih.102.1572615271436;
 Fri, 01 Nov 2019 06:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191016143306.28995-1-geert+renesas@glider.be>
In-Reply-To: <20191016143306.28995-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Nov 2019 14:34:19 +0100
Message-ID: <CAMuHMdWvoY4H-mmtmkRT9EAekBUFQ2QMOSKsqOr03ury0pksfw@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: Add missing check for non-zero product
 register address
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 16, 2019 at 4:33 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> If the DTB for a device with an RZ/A2 SoC lacks a device node for the
> BSID register, the ID validation code falls back to using a register at
> address 0x0, which leads to undefined behavior (e.g. reading back a
> random value).
>
> This could be fixed by letting fam_rza2.reg point to the actual BSID
> register.  However, the hardcoded fallbacks were meant for backwards
> compatibility with old DTBs only, not for new SoCs.  Hence fix this by
> validating renesas_family.reg before using it.
>
> Fixes: 175f435f44b724e3 ("soc: renesas: identify RZ/A2")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queuing in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
