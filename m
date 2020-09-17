Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1736826D5C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 10:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgIQIIp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 04:08:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35981 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgIQIGh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 04:06:37 -0400
Received: by mail-ot1-f65.google.com with SMTP id 60so1112308otw.3;
        Thu, 17 Sep 2020 01:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c5dLo9Kgntqb2r7/kw4ayfhfchq2BsY83K9yWHWtwYg=;
        b=JG1PE4Ud/q3wwVD+BPsrSM/E284sfXjY2F2y2fyHvp9tRbR1kelKB4ZlvxLB17dOca
         7Mv4i4l2LeLGVre7CsxK5Kp6rkvoV4gp6nwfhXyJWCNIYzsC3oAGN/3T/rz7NQQDlF3H
         GjwyyftZaZ4Px4AZrmeL5cUuI2spNjiXNHoNgIddvluFRjmW83KA7v3AWc5iePGYiwgG
         J7O9nyZit8sV5Vqv8qqHURCwCluiBwslNQ7JNAYXku1WI6ZV5r+VwvGOmnOtkTzF2OYC
         GWC4CKHD29Zi4dwsqzapDrkpKhOA4uWDrNVJB29rx9ZUqcZHBaa7ecWaAnu6YzPJ+Sn1
         dHdA==
X-Gm-Message-State: AOAM533QghB1/71E6C42gltaza/OLyZ2lncu0H+Rnzwpb5IvDB6K+KSL
        AH28lHOibZ0DkVzXYysmAAnjCMZE5DNIEI5WVAs=
X-Google-Smtp-Source: ABdhPJxj7P2HrhjOvh4TG5v9UOpymbOx9ps2COHNP9nEXuV1eIH9lwZzeqWhi9pNEP1wyeafL0OLbh6Ui8XT+9f26/Q=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr17597554otp.107.1600329926543;
 Thu, 17 Sep 2020 01:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <1600255098-21411-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXo6nRhR0hUB0iNvdZSsg1BCb9gDH7u+Z5+SNvmEfdtJg@mail.gmail.com> <TY2PR01MB36924032D54CCB7718F950EFD83E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36924032D54CCB7718F950EFD83E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Sep 2020 10:05:15 +0200
Message-ID: <CAMuHMdVje8bjH0E4pVUMs7+Q0QhCRw86WAiKGwBBW3G-NxrEDg@mail.gmail.com>
Subject: Re: [PATCH RFC] ata: sata-rcar: Fix .dma_boundary for WRITE DMA EXT
 timeout issue
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Sep 17, 2020 at 10:00 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, September 16, 2020 8:48 PM
> > On Wed, Sep 16, 2020 at 1:27 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > When we wrote data to an SATA HDD, the following timeout issue
> > > happened after the commit 429120f3df2d ("block: fix splitting
> > > segments on boundary masks") was applied:
> > >
> > >     # dd if=/dev/urandom of=/mnt/de1/file1-1024M bs=1M count=1024
> > >     ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
> > >     ata1.00: failed command: WRITE DMA EXT
> > >     ata1.00: cmd 35/00:00:00:e6:0c/00:0a:00:00:00/e0 tag 0 dma 1310720 out
> > >     res 40/00:01:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
> > >     ata1.00: status: { DRDY }
> > >
> > > Since the commit changed get_max_segment_size()'s behavior,
> > > unexpected behavior happens if .dma_boundary of this sata-rcar driver
> > > is 0x1ffffffe in somewhere (my guess).
> > >
> > > By the way, the commit 8bfbeed58665 ("sata_rcar: correct
> > > 'sata_rcar_sht'") changed the .dma_boundary as 0x1ffffffe, but this
> > > number is related to ATAPI_DMA_TRANS_CNT register. So, we should set
> > > the .dma_boundary as ATA_DMA_BOUNDARY (0xffff), and set
> > > .max_segment_size to min(0x1ffffffe, dma_max_mapping_size()).
> > >
> > > After applied this, the timeout issue disappeared.
> > >
> > > Fixes: 8bfbeed58665 ("sata_rcar: correct 'sata_rcar_sht'")
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks for your patch!
> >
> > > ---
> > >  As I wrote the commit description, I couldn't find why the issue
> > > was related to the .dma_boundary. So, I marked RFC on this patch.
> > > I would appreciate it if you would give me some advice.
> >
> > There's also "[PATCH v2] ata: sata_rcar: Fix DMA boundary mask"
> > (https://lore.kernel.org/linux-ide/20200811081712.4981-1-geert+renesas@glider.be/)
> >
> > Is this related?
> > Does my patch fix your issue, too?
>
> Thank you for the information!
> Your patch fixed my issue too. So, I think my patch should be dropped.

Thanks for testing!

Can I add your Tested-by?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
