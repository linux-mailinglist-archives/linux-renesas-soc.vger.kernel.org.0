Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990454287F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 09:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbhJKHnU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 03:43:20 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:37571 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234765AbhJKHnH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 03:43:07 -0400
Received: by mail-ua1-f52.google.com with SMTP id f4so5825411uad.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Oct 2021 00:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A3fuzgbNQC5eOVqvthd3rBxKbVkJd3eWhQHKOqgfUmY=;
        b=LT8iynolUanvnzk6NfV7GE3fhZBgFSKDMb0cd9zL6+nieJXTfkrXmx8HYvcTGB1dUu
         4JF45zeFii20pwwFea7pMUwAc1/9FOiXZgCHQ7W5E7d0GlwiMuGkX8hsPM0qQqTbH+SH
         2LOy/CQ0FL3CqbqXau/xj/qcS813cnMd7aD4smJ/9EZI4QJwouGwuh3Bsahj4ZygTVVt
         5KwNxe2QMmhsZBym2yvM6F3xuUYPqjjYrcfSGw/2T/GEfW9aLaEyNZRtKSmG8bBouiU1
         d4jiJwgj9AEcuaLEnV8b9AY5gxA5XGwDMegpnPM94SOpV8xQuPBCTmS7zGFetbyKj3Nd
         H7ZQ==
X-Gm-Message-State: AOAM533SnW0XM9oVu5bFkQYJomgKtKEG+H+ZKnDNl7z45aIkMdxfXTjh
        EE6EQh3ro396Kg0JPxA+ZPTIYJNPojCWbYdJ0nVAODSZ
X-Google-Smtp-Source: ABdhPJxH0sEYlmdFnfaWllkjhtG7NewoybhCgGXLvADqZHgA3mjEC15r631bgjNLaqmMGBS4l+9Aj/7jUKjoCg792q8=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr13155654uaf.114.1633938067785;
 Mon, 11 Oct 2021 00:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210924171905.347115-1-aford173@gmail.com> <CAMuHMdXoLkh9Mt=8Q-dJeBrrHR_96MJUTA8ZJTtDSgMym0+J1w@mail.gmail.com>
 <CAHCN7xJjejzQ3ouS=_t8+yO1rE4CCPp9VPgbARJyuTU_q-_8qA@mail.gmail.com>
In-Reply-To: <CAHCN7xJjejzQ3ouS=_t8+yO1rE4CCPp9VPgbARJyuTU_q-_8qA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 09:40:56 +0200
Message-ID: <CAMuHMdW9hCEzSr1EqXZ+ONBAYYAcS1iuCDRk_9X01E_0_=5EoA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Fix memory corruption from TF-A
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Sat, Oct 9, 2021 at 1:13 PM Adam Ford <aford173@gmail.com> wrote:
> On Tue, Oct 5, 2021 at 9:30 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Sep 24, 2021 at 7:19 PM Adam Ford <aford173@gmail.com> wrote:
> > > Trusted Firmware allocates a chunk of memory for a lossy compressor
> > > which makes the memory unavailable to Linux and any attempts to read/write
> > > from Linux result in memory corruption or a crash.  Fix this by reserving
> > > the section of memory marked as unavailable by TF-A.
> > >
> > > Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > > @@ -13,6 +13,17 @@ memory@48000000 {
> > >                 reg = <0x0 0x48000000 0x0 0x78000000>;
> > >         };
> > >
> > > +       reserved-memory {
> > > +               #address-cells = <2>;
> > > +               #size-cells = <2>;
> > > +               ranges;
> > > +
> > > +               lossy_decompress: lossy-decompress@54000000 {
> > > +                       reg = <0 0x54000000 0 0x03000000>; /* Reserved by TF-A */
> > > +                       no-map;
> > > +               };
> > > +       };
> > > +
> > >         osc_32k: osc_32k {
> > >                 compatible = "fixed-clock";
> > >                 #clock-cells = <0>;
> >
> > I believe these days it's the responsibility of TF-A to create these nodes
> > in the DTB, and pass that to U-Boot.
> >
> > What bootloader are you running?
>
> U-Boot 2021.04

Hmm, that's fairly recent. Marek?

> > Does "fdt addr $fdtcontroladdr ; fdt print" show the area as reserved?
>
> I see the memory nodes, but I don't see any reserved memory being
> carved out of it.
>
> > Does TF-A print something about reserving the memory?
>
> Yes:
>
> NOTICE:  BL2: DRAM Split is 2ch
> NOTICE:  BL2: QoS is default setting(rev.0.19)
> NOTICE:  BL2: DRAM refresh interval 1.95 usec
> NOTICE:  BL2: Periodic Write DQ Training
> NOTICE:  BL2: DRAM don't have ECC configuration
> NOTICE:  BL2: CH0: 400000000 - 47fffffff, 2 GiB
> NOTICE:  BL2: CH2: 600000000 - 67fffffff, 2 GiB
> NOTICE:  BL2: Lossy Decomp areas
> NOTICE:       Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570
> NOTICE:       Entry 1: DCMPAREACRAx:0x40000000 DCMPAREACRBx:0x0
> NOTICE:       Entry 2: DCMPAREACRAx:0x20000000 DCMPAREACRBx:0x0
> NOTICE:  BL2: FDT at 0xe631e588

OK.

> If I set the fdt address to 0xe631e588, I can see the memory nodes:
>
> => fdt addr 0xe631e588
> => fdt  print
> / {
>     compatible = "renesas,beacon", "renesas,r8a774a1";
>     #size-cells = <0x00000002>;
>     #address-cells = <0x00000002>;
>     reserved-memory {
>         lossy-decompression@54000000 {
>         renesas,formats = <0x00000000>;
>         no-map;
>         reg = <0x00000000 0x54000000 0x00000000 0x03000000>;
>         compatible = "renesas,lossy-decompression", "shared-dma-pool";
>     };

Good, so ATF passed the reserved region to U-Boot.

> };
> memory@48000000 {
>     reg = <0x00000000 0x48000000 0x00000000 0x78000000>;
>     device_type = "memory";
> };
> memory@600000000 {
>     reg = <0x00000006 0x00000000 0x00000000 0x80000000>;
>     device_type = "memory";
> };
> };
> =>
>
> I'll look into seeing how to append the memory nodes at 0xe631e588
> onto the device tree we're loading and passing to the kernel

Now U-Boot still has to pass this to the kernel...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
