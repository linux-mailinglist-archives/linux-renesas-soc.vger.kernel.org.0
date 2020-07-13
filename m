Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F37C21D4D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 13:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729703AbgGMLZC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 07:25:02 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40969 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbgGMLZC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 07:25:02 -0400
Received: by mail-ot1-f68.google.com with SMTP id a21so9213636otq.8;
        Mon, 13 Jul 2020 04:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eJA1IRinJgbZYZbZZAxPJXmFYzKQSKN349MJoNikxhY=;
        b=uZGv+V7EjAUtaIX7qqrkHOHjAOC480g/EXJdQkAft0JXXoP0esYXAbJPSfM+DaPLbj
         uoIILSfWGZb9yYlhtApWgFo3l6iK2tqGeCMl9jUTSLGlLuR7JiaDbHlakeb/YIpL/NPy
         Ko4qceIDp3sUmfwDlnIYzVfn10Q+XZHP7Ewu0FuHmATWkoYvl7rZc5V79JnpjSNc2Fan
         OOQ/KIgg0t0fxQQZ3/aRyEG99zz5SYFuL6l6xI05pjQV5HgCEIipSaAzuScKUHTjReZp
         WAp/K2jkSjG0+MnRjW0Cozi6bAozQI6DFp5dmeyYbCbAdcs772Mse8vjUeg46MPkniPT
         3BuQ==
X-Gm-Message-State: AOAM531rvXMVcX1FLasZrZ3/a7oXKL91mojcYZRe6KlOzlc0KyUdylYw
        yj75zOs4UwGscxGvflefxIVATm6vXlceBNp7Rz4=
X-Google-Smtp-Source: ABdhPJyqlZ4W8EF/gEChb9o/WfZDrwRK+3M9vyN/4qfzBUZ+4oUb8cRk4TAZO58rumpD/dex1l3MhdhTb324SMvrRLs=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr57043566otp.250.1594639501400;
 Mon, 13 Jul 2020 04:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 13:24:50 +0200
Message-ID: <CAMuHMdUV-MzFxq4GpL4YzFrWr-aeF0__SubG72Bi-Au1OMTfYA@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: serial: renesas,hscif: Document r8a774e1 bindings
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 8, 2020 at 7:48 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> RZ/G2H (R8A774E1) SoC also has the R-Car gen3 compatible HSCIF ports,
> so document the SoC specific bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
