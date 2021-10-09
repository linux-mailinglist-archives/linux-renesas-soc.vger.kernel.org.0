Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9AB42795E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Oct 2021 13:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhJILPg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 9 Oct 2021 07:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbhJILPf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 07:15:35 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A224C061570
        for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Oct 2021 04:13:38 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z20so45982682edc.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Oct 2021 04:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zQmsE1hWSKo2mCNAEH/8xFkkAJ8qHpcx34rZSKeVszI=;
        b=dl1UNfwuCKJswuIVXoGfzUh6EuqWHM9EtE7n5rmLP2g5ZxF5jmFVi/kxNPC+wyCyXb
         X251S3s+5QGAytZ77qX6FDH4EFBiBa/znTnSneFIt9FnY5AgUZHEj5Blan7sjN83ePTY
         0Dia9+LLzWbNeFgdvPTcO5N9TeejiHeecVBXOmPxsCzfCDR63xHO8Z+ndRQNu5JaHVb2
         H69vGaPY86DVIQJqUy7Nxs8EmM4FPXb0UKjyV16AAH9/1VeepuxIKjTcQoyZuqS2oITp
         7aWMTWG21BKVR/c9GQmEbAR9aeEhzo7CszEECDS1lc+abSk9Xq4J5TFSHE0zbYkctAjQ
         S9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zQmsE1hWSKo2mCNAEH/8xFkkAJ8qHpcx34rZSKeVszI=;
        b=6N231lrJln/KNR5PE068+V+vjPp5ph137posb5neBv+1ROp8ObH9C0j9waBPqSYg9X
         9vgt7nRtblH8QHMpd6V3ZZ/ixlzO5trXHzBlhva2YMekvX5LxWs3zF8Rn8DB+LTQNJDd
         WvpiM1KOOkuEOc0CSIasSZvOh9rxBLFH8KLCY2pbbbQSxSV1gZfXPrgMdipDTkgJn4o3
         PGnn2IayLDk8bC+pPsuh+0hkP8rMTkAvXwzdwuqwCT3S0/NesHX99eOj3J5VCMC6pvWb
         JsfC8Ami0RHF0BGZgA1SbYCwnFlHb5GdKn4Pjosu5KDvRhm3XwMFw+jsPebi9wyuNYn4
         nW2Q==
X-Gm-Message-State: AOAM531mN4LZw8lnGiX+zilRuB7RvQgMnwlfOtFAPFtXc0tGmUQ8bKqr
        WFYb0W1VLQeTtshr8vRrfEC7duXwnOA9c9zqPxA=
X-Google-Smtp-Source: ABdhPJyFK97d5YaxbyqTj/us5xUKewVmfNrduDNr9+6lo0cYUwfcQrJvdlSo5q8neC99uv0Hjz7CXBLI0vMqoAFDEJY=
X-Received: by 2002:a50:9d48:: with SMTP id j8mr23504019edk.165.1633778016849;
 Sat, 09 Oct 2021 04:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210924171905.347115-1-aford173@gmail.com> <CAMuHMdXoLkh9Mt=8Q-dJeBrrHR_96MJUTA8ZJTtDSgMym0+J1w@mail.gmail.com>
In-Reply-To: <CAMuHMdXoLkh9Mt=8Q-dJeBrrHR_96MJUTA8ZJTtDSgMym0+J1w@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 9 Oct 2021 06:13:25 -0500
Message-ID: <CAHCN7xJjejzQ3ouS=_t8+yO1rE4CCPp9VPgbARJyuTU_q-_8qA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Fix memory corruption from TF-A
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 5, 2021 at 9:30 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Fri, Sep 24, 2021 at 7:19 PM Adam Ford <aford173@gmail.com> wrote:
> > Trusted Firmware allocates a chunk of memory for a lossy compressor
> > which makes the memory unavailable to Linux and any attempts to read/write
> > from Linux result in memory corruption or a crash.  Fix this by reserving
> > the section of memory marked as unavailable by TF-A.
> >
> > Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> > @@ -13,6 +13,17 @@ memory@48000000 {
> >                 reg = <0x0 0x48000000 0x0 0x78000000>;
> >         };
> >
> > +       reserved-memory {
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +
> > +               lossy_decompress: lossy-decompress@54000000 {
> > +                       reg = <0 0x54000000 0 0x03000000>; /* Reserved by TF-A */
> > +                       no-map;
> > +               };
> > +       };
> > +
> >         osc_32k: osc_32k {
> >                 compatible = "fixed-clock";
> >                 #clock-cells = <0>;
>
> I believe these days it's the responsibility of TF-A to create these nodes
> in the DTB, and pass that to U-Boot.
>
> What bootloader are you running?

U-Boot 2021.04

> Does "fdt addr $fdtcontroladdr ; fdt print" show the area as reserved?

I see the memory nodes, but I don't see any reserved memory being
carved out of it.

> Does TF-A print something about reserving the memory?

Yes:

NOTICE:  BL2: DRAM Split is 2ch
NOTICE:  BL2: QoS is default setting(rev.0.19)
NOTICE:  BL2: DRAM refresh interval 1.95 usec
NOTICE:  BL2: Periodic Write DQ Training
NOTICE:  BL2: DRAM don't have ECC configuration
NOTICE:  BL2: CH0: 400000000 - 47fffffff, 2 GiB
NOTICE:  BL2: CH2: 600000000 - 67fffffff, 2 GiB
NOTICE:  BL2: Lossy Decomp areas
NOTICE:       Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570
NOTICE:       Entry 1: DCMPAREACRAx:0x40000000 DCMPAREACRBx:0x0
NOTICE:       Entry 2: DCMPAREACRAx:0x20000000 DCMPAREACRBx:0x0
NOTICE:  BL2: FDT at 0xe631e588

If I set the fdt address to 0xe631e588, I can see the memory nodes:

=> fdt addr 0xe631e588
=> fdt  print
/ {
    compatible = "renesas,beacon", "renesas,r8a774a1";
    #size-cells = <0x00000002>;
    #address-cells = <0x00000002>;
    reserved-memory {
        lossy-decompression@54000000 {
        renesas,formats = <0x00000000>;
        no-map;
        reg = <0x00000000 0x54000000 0x00000000 0x03000000>;
        compatible = "renesas,lossy-decompression", "shared-dma-pool";
    };
};
memory@48000000 {
    reg = <0x00000000 0x48000000 0x00000000 0x78000000>;
    device_type = "memory";
};
memory@600000000 {
    reg = <0x00000006 0x00000000 0x00000000 0x80000000>;
    device_type = "memory";
};
};
=>

I'll look into seeing how to append the memory nodes at 0xe631e588
onto the device tree we're loading and passing to the kernel

>
> Thanks!
>
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
