Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65A12EEF1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 10:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbhAHJHo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 04:07:44 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:36050 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbhAHJHn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 04:07:43 -0500
Received: by mail-ot1-f42.google.com with SMTP id d20so9086493otl.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Jan 2021 01:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AQJnYqfHQDSkWh7R1VxOUZVE6Es7Gkoa0MRhajtaiPU=;
        b=PTAIF/7ieHe3IU7PfBJOHvXocR7yfY7BH2YJfrVrHwuEjEyvDck9yz3ZUVVIIe1z4Z
         hSPiCLVvG7M0Hwb0HZxJP9Spbt+wlizGThQ7g2pYlXjPHurev34FV0bl5CDSAxgMcFGO
         /yEMdhA5G67FCw+0hMoDIx9WywBpCTZi8bA6nrI7+Cgx/6ud2YpZ3bs/c1yw4K+ytpmM
         NKAvGF7ShmFWR5UUBi/L9D5/pDFfRwljXBcLZpj8lhOBS67qu4TyJn6V9l05+i1lKw9N
         gPJUVDp3uf67PyOnwz2XrTZqZltG4L/tI861F6XQrXr87VA0z75mO3YrG6S/UKDb4a/y
         u1pQ==
X-Gm-Message-State: AOAM531Q212mdPFBXRRgkpD9fTLCUf4LgMXQqFIfwflv+nA0eu1isL2p
        w78qdUWDljkEElXZkqYubNGIzATO6DfsPMvRb7kfZ0/ZRaE=
X-Google-Smtp-Source: ABdhPJw8DmxcG4LNZx17jo9TIk4OpFqV5Yp2qrP5Nb2rWRaG6qSE7b6iar6Cm3JCJsYWJwQsXkjC26oIGCojtBU6eW4=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr1887610otr.107.1610096822578;
 Fri, 08 Jan 2021 01:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20201227121925.8431-1-wsa+renesas@sang-engineering.com> <CAMuHMdWVtACtyoQgxKTWpw_4xS-B1knkGOVU-7DpNzG3uoG-RQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWVtACtyoQgxKTWpw_4xS-B1knkGOVU-7DpNzG3uoG-RQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 10:06:51 +0100
Message-ID: <CAMuHMdU0rxV5cBLvMJp_8i6kkyL3mTdQU-uXny-eN3CcBFxeiQ@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: dts: r8a779a0: correct reset values for GPIO
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Jan 5, 2021 at 1:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Dec 27, 2020 at 1:19 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Because the datasheet is ambigious, copy over the reset values from the
> > latest BSP.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > @@ -110,7 +110,7 @@ gpio0: gpio@e6058180 {
> >                         interrupts = <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&cpg CPG_MOD 916>;
> >                         power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> > -                       resets =  <&cpg 916>;
> > +                       resets =  <&cpg 1331>;
>
> I doubt the reset topology differs from the clock topology...
> Let's hope this will be clarified in a datasheet update soon.

I wrote a small test to check which reset bits reset the GPIO blocks.
I can confirm the original resets values are correct, and using the bits
marked PFCx in the Software Reset Registers 12/13/14 do not have any
impact on the GPIO registers.

So the BSP is wrong, and this patch should be dropped.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
