Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DF32A0028
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 09:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgJ3IiA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 04:38:00 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43705 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgJ3IiA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 04:38:00 -0400
Received: by mail-ot1-f68.google.com with SMTP id a6so4877726otp.10;
        Fri, 30 Oct 2020 01:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ptl6SDfjcDqIRDTQhsGvZcOItESChqs80RIvWCLj/w=;
        b=t9eCc1NM7L1A74p5P483XBHrLhpElb7Hd0dlYJ7vNJmDXDR5dXq484+FkheERieVxt
         IREE92G/oy8VquEMRj67asn/qde8F1sJ0PJLb7bkMq+4XFVrg1IR4ud8GLGnYon8p7rp
         eZRpHXdZnCDUKdXRXZii5a8ntYE4ULySJSC+wZ4cq4ERYywbsOCwpFASxwyewYChtQCf
         1ja9xgv8pT1ddeEmY6OnGLm65fXvNpnwzR44Ei3VQ2cMDttXAfXf0CHg2SH4920hYnEr
         TwhhEfOTHCi2hiXKCTy08jvP9PVwE8tiJkH67/IT/nyxbNnoYMxoExfWkrJpIJTH0NX8
         irVQ==
X-Gm-Message-State: AOAM533oi94SyA0yUmOuvbaxhv+l/VfGfIUsQG+vTUMUpeo07r2Y+VDz
        YIyL0QVVJMbnsWFx0Z5IS/N9c9KFjOR9z45rs+W8WsUsDx0=
X-Google-Smtp-Source: ABdhPJyEgNf6Vzx8E8yMGp6mWU5z4DRp4VqKxzo/S74sYqGk6X6WS0r0ozBZimz4V/JlsqofuZuwzE+oyBDFOOgUwOc=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr839396otb.250.1604047079087;
 Fri, 30 Oct 2020 01:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201030083051.18752-1-erosca@de.adit-jv.com> <20201030083051.18752-4-erosca@de.adit-jv.com>
In-Reply-To: <20201030083051.18752-4-erosca@de.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Oct 2020 09:37:47 +0100
Message-ID: <CAMuHMdUBn3=0k7MEc5w2ixn83G_x2ZDh+YuN7Lp+W7ReJ21UUg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: renesas: Add R-Car M3-W+ ULCB
 with Kingfisher
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 30, 2020 at 9:33 AM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> Document the use of the Kingfisher expansion board with the R-Car
> Starter Kit Pro equipped with an R-Car M3-W+ (aka M3-ES3.0) SoC.
>
> Inspired from v5.5 commit 24169f0a453754 ("dt-bindings: arm: renesas:
> Add R-Car M3-N ULCB with Kingfisher").
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
