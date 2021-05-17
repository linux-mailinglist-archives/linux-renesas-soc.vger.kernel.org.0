Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7CE382CCF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 15:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235590AbhEQNHD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 09:07:03 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:33666 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235368AbhEQNHC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 09:07:02 -0400
Received: by mail-ua1-f48.google.com with SMTP id c6so1513041uat.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 06:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VlIjRdgbBbg2+Jydj6AnKG8ruqMCiTKnrUWfP9Yl+pE=;
        b=GeHKbqVh3jXxjMWVeroDJZP6xLy4dz89DA5t8Xscy+13zAWRsIwxxmWiRazYVUdxIC
         sM4W2satUJW2AcH3UCXNrOIvWo8XFGgCDfTCO48/nosHQpwd3FFkFykNY+qTSZIJd3tr
         zfMS6IEOYAxL08qAMwJSk3CRBmZS7Y1V/d4I78r9YjzGbVyqynJRIMvK+/gS6+3rPE5U
         clqqwFcoXSdmCfh+Isbh4I16kKnMzZY0TrhzcY8ghQoVTXns/TH5TMB3XGpvhLPSes8t
         Rk7k54hC+xeRBW2Rc5Sikpo9E1uwh+mp+spQJD8bqDydeXJhORopWmEAN4ZSvKN/f8Fk
         IcCQ==
X-Gm-Message-State: AOAM532p3mYdY5lyj5pcygfwRD+RLERTFTGOAr4x6Y1IyGhxAK0pgm75
        +zOq/yxy5gDUJI3VQBbZ6W+zJpglaFoBWALvwOE=
X-Google-Smtp-Source: ABdhPJzQ9z0TSsc6XiNN1z5NV+q1eQ9M2Jbf9BGoIKSrFGS8/x0NVGuTu72x1139WS3jvPkmXvsoCM4r29quy7nETpk=
X-Received: by 2002:ab0:2a8b:: with SMTP id h11mr29583220uar.4.1621256745434;
 Mon, 17 May 2021 06:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKjHramQ=p74+jtLP0vV6=cTjMv-b7ad83W3R50aWc=rQ@mail.gmail.com>
In-Reply-To: <CAHCN7xKjHramQ=p74+jtLP0vV6=cTjMv-b7ad83W3R50aWc=rQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 15:05:33 +0200
Message-ID: <CAMuHMdUsTouu0LAC0sD8cW-P1WCE0DcPMSR5iBaos_H2oOHLiA@mail.gmail.com>
Subject: Re: RZ/G2 Lossy Compression Memory Question
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Mon, May 17, 2021 at 2:50 PM Adam Ford <aford173@gmail.com> wrote:
> The bootloader/TF-A configuration we're using is based on the 4.19 CIP
> kernel that Renesas released.  TF-A, we allocate some memory for the

Where can I find this BSP?
rcar-3.9.x is based on v4.14, and rcar-4.0.x on v5.4.  I don't know about
BSPs using a kernel version in between.

> lossy compression and this memory is not available for Linux.  I'd
> prefer to not have to use a special TF-A for the mainline Linux, but
> what appears to be happening is that Linux doesn't know about the
> reserved memory, so memory corruption happens.
>
> The Renesas CIP kernel uses the following to define the space
>
> /* device specific region for Lossy Decompression */
> lossy_decompress: linux,lossy_decompress@54000000 {
>      no-map;
>      reg = <0x00000000 0x54000000 0x0 0x03000000>;
> };

That is, inside a "reserved-memory" node.

> Then uses the following to carve it out so Linux doesn't think it can use it.
>
> mmngr {
>      compatible = "renesas,mmngr";
>      memory-region = <&mmp_reserved>, <&lossy_decompress>;
> };
>
> Unfortunately, renesas,mmngr doesn't exist upstream.
>
> I thought about changing the memory node to break it up, but it seems
> like a hack.
>
> What is the best suggestion for blocking this memory area from Linux
> while still appearing to show the full memory size?

I think "renesas,mmngr" is a red herring, as both rcar-3.9.x and
rcar-4.0.x use that compatible value in DTS files, but don't include
a driver.

Does it work if you manually add the reserved-memory node and the
relevant subnodes to your DTS file?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
