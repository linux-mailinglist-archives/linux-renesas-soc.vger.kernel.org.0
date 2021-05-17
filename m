Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B5E3836AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 17:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242761AbhEQPfU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 11:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243845AbhEQPdF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 11:33:05 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BADC05BD02
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 07:35:01 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u21so9480315ejo.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qAO2FUm0dY9lNhwbBsHwbCEgof7mfDL+I1zM8Q/QjZ4=;
        b=cpIZGV4JjFuIrzTEp13KAJHZNiDrPp8cM6LgvzOAFxkAMid1cqMVk8LWhthpkkipSS
         ZUwtt4pomD4ZD08pXRSuYUNSVGqOZ7b0fdu1nbnUVJ+P3qgfMXDb+SXbYOwkh2i0lXbo
         lLOb+tsIwBk2GBUHFWaoHNms4uE6DaX4sfP2orgt5QDwk6AkcxCINtJFm+6iyw7RloEa
         rySbDjKHx+T5IK4HtQ+EzVEh0198GdZbjFlSGcP3h5Y7TAawl7wGHe9RRppvRX0sPom0
         n7Kvryyn92lU1v0lMjcuZJVTvBPDiJJ0IOEafvrn3+YnCXzqmojhHjCF9sbHnWO6jNTr
         LLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qAO2FUm0dY9lNhwbBsHwbCEgof7mfDL+I1zM8Q/QjZ4=;
        b=nUS3HOrT2p/9r6fi/wFhvWTccxPBcSdo9zBPU13mdfq9rPt9axdtSvxyW1ksnqQxHs
         C6YLh8nU1+m/1cnwkZUpEWaTipojRXkxmib8WnthnbX+wQWSI7DQ3ZWAPGDIjk4v6vkI
         jNbPQ4g7UUtkp2atJvA8igjvbw5eXrz16Lnc+/1N7HiF3IQQSgKsXmkriqd8V+5c0LR9
         Ex6I9bcGHzVQJjeqcKzDE0e40AtSAKJ06c/V6AvqquIFKmstguayRlom72wswYNuK3n+
         TWlttP4cyzEFyMO0utEOpulUQ0GfHL+7HsDrzAUPhYi0w1ZtDVKyV8KmxeqWskw55zpQ
         ATng==
X-Gm-Message-State: AOAM533YkZC6tQHyfojcQG0qC2+rKZdEpm64VpZ3+itnUpQSLFfpgL66
        JCmlEw37LR5ITC+Ag+Rn5skH+03T9HktZs4R0paC3SHStwo=
X-Google-Smtp-Source: ABdhPJyCItkLkOgAXyd3b7iB+Nlr8zeIzvzqQG4tHRp5Q4C9r1msHXKBPMAXwTRC9KXXXCKUhh9OyfxpgmpH7cqEfro=
X-Received: by 2002:a17:906:22c6:: with SMTP id q6mr201844eja.275.1621262100390;
 Mon, 17 May 2021 07:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKjHramQ=p74+jtLP0vV6=cTjMv-b7ad83W3R50aWc=rQ@mail.gmail.com>
 <CAMuHMdUsTouu0LAC0sD8cW-P1WCE0DcPMSR5iBaos_H2oOHLiA@mail.gmail.com>
In-Reply-To: <CAMuHMdUsTouu0LAC0sD8cW-P1WCE0DcPMSR5iBaos_H2oOHLiA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 17 May 2021 09:34:49 -0500
Message-ID: <CAHCN7x+PLtntxuxTMkQ27BnvnTc6mc1GjvRr9m_y=xSvWUE=HQ@mail.gmail.com>
Subject: Re: RZ/G2 Lossy Compression Memory Question
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 17, 2021 at 8:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Adam,
>
> On Mon, May 17, 2021 at 2:50 PM Adam Ford <aford173@gmail.com> wrote:
> > The bootloader/TF-A configuration we're using is based on the 4.19 CIP
> > kernel that Renesas released.  TF-A, we allocate some memory for the
>
> Where can I find this BSP?
> rcar-3.9.x is based on v4.14, and rcar-4.0.x on v5.4.  I don't know about
> BSPs using a kernel version in between.

Their URL is:
https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzg-linux-platform/rzg-marketplace/verified-linux-package/rzg2-vlp-eva

They have a github repo with  a Yocto recipe which includes references
to the CIP kernel and their list of patches:
https://github.com/renesas-rz/meta-rzg2/tree/BSP-1.0.6/recipes-kernel/linux


>
> > lossy compression and this memory is not available for Linux.  I'd
> > prefer to not have to use a special TF-A for the mainline Linux, but
> > what appears to be happening is that Linux doesn't know about the
> > reserved memory, so memory corruption happens.
> >
> > The Renesas CIP kernel uses the following to define the space
> >
> > /* device specific region for Lossy Decompression */
> > lossy_decompress: linux,lossy_decompress@54000000 {
> >      no-map;
> >      reg = <0x00000000 0x54000000 0x0 0x03000000>;
> > };
>
> That is, inside a "reserved-memory" node.
>
> > Then uses the following to carve it out so Linux doesn't think it can use it.
> >
> > mmngr {
> >      compatible = "renesas,mmngr";
> >      memory-region = <&mmp_reserved>, <&lossy_decompress>;
> > };
> >
> > Unfortunately, renesas,mmngr doesn't exist upstream.
> >
> > I thought about changing the memory node to break it up, but it seems
> > like a hack.
> >
> > What is the best suggestion for blocking this memory area from Linux
> > while still appearing to show the full memory size?
>
> I think "renesas,mmngr" is a red herring, as both rcar-3.9.x and
> rcar-4.0.x use that compatible value in DTS files, but don't include
> a driver.

That seems true for the 4.19-CIP kernel as well.

>
> Does it work if you manually add the reserved-memory node and the
> relevant subnodes to your DTS file?

I'll give the reserved memory node a try.  The extra "renesas,mmngr"
threw me off.

Thanks for the suggestion.

adam

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
