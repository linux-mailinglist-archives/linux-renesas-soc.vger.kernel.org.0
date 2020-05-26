Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2861E1D8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 10:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729824AbgEZImz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 04:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgEZImy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 04:42:54 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882B2C03E97E;
        Tue, 26 May 2020 01:42:54 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id i9so4068359ool.5;
        Tue, 26 May 2020 01:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=by3wyV0ECJVMLMRZBirFTqDbHUkcFdAgys+Jcbd3iFQ=;
        b=I2fmC5YMGeuL0DC2lGNDNFrXiaS7yPv5hlAAducVtoCAXNmj8mWzD06tjY9nTvy3Pw
         sHx/AbnKnZB5TkRyi0OUJwC0C7wsZmeWrX1na2IstfAf/ejGw4lj6IUngzUJPIzeaFY8
         DwhJh2+vCliH4UGUKQQi3pUteChXy8GGr4FDwZxjaVVF8jUNTG4NnpoJ5ZirDMINOs6b
         B2cjN/1BuTI9nRx21nSAB1FK0su9KIJitAuZnfOLOKW/6YYE4Q3BxT7vZgLt2fOX6Sb1
         7Pjl0ajF1NdsFNGLQRPqax0zDUb43D/g50m+zWdo/3Qif6T3TAysOqFYEYOq+I5CnLOj
         Nw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=by3wyV0ECJVMLMRZBirFTqDbHUkcFdAgys+Jcbd3iFQ=;
        b=RvN9fKTNosmhSARV0Zk+Zovtd3n5XTIM41DMDbroQridUcZt6y6nHzmHkhkh8RC45x
         a6Gfj0nxF9oWuT0KXEXZMGAtJgDha/9SsBqp+RnvZgS/itypaEbU1s34NCCu8CkFjloP
         PdyM6RjQ4cU5+sM0BfMLZUpojHLD6+4T9WDkS8EOd7CRWyzFbth9p4ym+KR41MAroMAF
         vCxkLuyf4nS6N75gftv1j8ODbpx4mXcLQEV97hZuBMA7pzw1o13h82FueQ3JQMaKly76
         YVbReTbYcVAQTd5G30oe1o5glH9omqgYZuMVNPgYZ1N7v0mb//cLrgR62+Rajje/v5qM
         8C8Q==
X-Gm-Message-State: AOAM531QIareps+clQkySO/tsLJnHkn4catuqvmYugKUHDxpn/By9vJy
        4GHZo/bWdfiYctzjL05dRAXLRzzNSzZwBvo8W9w=
X-Google-Smtp-Source: ABdhPJxhhnv0+0VClviGVBAhLXqhn1cyS0y0hGt1fYZclGfTLBKjChSPAPTdABy6HP7VKFzhy/XimkvLk1WWOsSYfF8=
X-Received: by 2002:a05:6820:21c:: with SMTP id i28mr15915509oob.42.1590482573864;
 Tue, 26 May 2020 01:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <1590420129-7531-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590420129-7531-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWjGX43EDnwxu0xp3U7aedWHuW5MLQo==1d5v_mV-1R9A@mail.gmail.com>
In-Reply-To: <CAMuHMdWjGX43EDnwxu0xp3U7aedWHuW5MLQo==1d5v_mV-1R9A@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 26 May 2020 09:42:27 +0100
Message-ID: <CA+V-a8vOuHr4_+EX_Atfv7-ZbqQLkj_qHowa57QUUFPamC0N+g@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: r8a7742-iwg21d-q7: Enable SDHI2 controller
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, May 26, 2020 at 8:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, May 25, 2020 at 5:23 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Enable the SDHI2 controller on iWave RZ/G1H carrier board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.9.
>
Thank you for the review.

> BTW, perhaps you want to add an LED trigger for SDIO_LED, connected
> to GP5_22?
>
Sure I'll add this as a separate patch.

Cheers,
--Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
