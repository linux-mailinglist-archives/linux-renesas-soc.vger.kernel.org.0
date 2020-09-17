Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF28726D645
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 10:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgIQIU3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 04:20:29 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37695 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgIQIU2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 04:20:28 -0400
Received: by mail-oi1-f196.google.com with SMTP id a3so1545004oib.4;
        Thu, 17 Sep 2020 01:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OImvR1aLA7jiKCuY6IeLq9jEJl58ObzWa57LO9tthqA=;
        b=k7+Eu9HN12g09HaXBwMIr9sVYAGLajzBrZmfcMhOGN0ygSbmHYy0AcNsecZxqk02iM
         4SM2fPDWnsKrpxpHBSz8lWmsKXL95yD14LGWXxooZZv8BTvrbmCWz8lMYvv7Kt1XOyvw
         jpRGDTPGa6nHJrQ0eSZA1NcmihAirC+7Xe6STmPPYahIV6iQcA5GHUtwlHmvOs3+Pwal
         qrcLmjkPburTV4q4ekjxmMmqKwwSwQWKEyI4TkElwccZ9E2PDJDvSuiez4OJ1AXxl4g1
         E1DaMaFiMPCqphXkuY4LkKWIzS4VD8ECun9LRtsGbME10Cboy9+fMfcP6zQ+VzO0TGyf
         K4BQ==
X-Gm-Message-State: AOAM530AFm3u+9fQxYEkrZi3JXfoXOkn+Bg6qpfTbutrbXmEivM6ijeJ
        LoxKVYOT6T4rIzFe/wp0D+hKv97IB9OP4r02qbY=
X-Google-Smtp-Source: ABdhPJw4DNL7Wu+0nNJb6UxHcGhuJCGJwcAhnphWlGhI1dAAORelaBnV0HoMcdp7ctWCCLtfY26jZw01C0tH+jTyDtk=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr5634950oib.54.1600330827679;
 Thu, 17 Sep 2020 01:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <1600255098-21411-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXo6nRhR0hUB0iNvdZSsg1BCb9gDH7u+Z5+SNvmEfdtJg@mail.gmail.com>
 <TY2PR01MB36924032D54CCB7718F950EFD83E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVje8bjH0E4pVUMs7+Q0QhCRw86WAiKGwBBW3G-NxrEDg@mail.gmail.com> <TY2PR01MB3692CEF31253D7998258ECD7D83E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692CEF31253D7998258ECD7D83E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Sep 2020 10:20:16 +0200
Message-ID: <CAMuHMdUTn9DXZg7KFwBmk7tq2DPqEiW6AosW0baY748tz1EcrQ@mail.gmail.com>
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

On Thu, Sep 17, 2020 at 10:14 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, September 17, 2020 5:05 PM
> > On Thu, Sep 17, 2020 at 10:00 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Geert Uytterhoeven, Sent: Wednesday, September 16, 2020 8:48 PM
> > > > On Wed, Sep 16, 2020 at 1:27 PM Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > When we wrote data to an SATA HDD, the following timeout issue
> > > > > happened after the commit 429120f3df2d ("block: fix splitting
> > > > > segments on boundary masks") was applied:
> > > > >
> > > > >     # dd if=/dev/urandom of=/mnt/de1/file1-1024M bs=1M count=1024
> > > > >     ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
> > > > >     ata1.00: failed command: WRITE DMA EXT
> > > > >     ata1.00: cmd 35/00:00:00:e6:0c/00:0a:00:00:00/e0 tag 0 dma 1310720 out
> > > > >     res 40/00:01:00:00:00/00:00:00:00:00/00 Emask 0x4 (timeout)
> > > > >     ata1.00: status: { DRDY }
> > > > >
> > > > > Since the commit changed get_max_segment_size()'s behavior,
> > > > > unexpected behavior happens if .dma_boundary of this sata-rcar driver
> > > > > is 0x1ffffffe in somewhere (my guess).
> > > > >
> > > > > By the way, the commit 8bfbeed58665 ("sata_rcar: correct
> > > > > 'sata_rcar_sht'") changed the .dma_boundary as 0x1ffffffe, but this
> > > > > number is related to ATAPI_DMA_TRANS_CNT register. So, we should set
> > > > > the .dma_boundary as ATA_DMA_BOUNDARY (0xffff), and set
> > > > > .max_segment_size to min(0x1ffffffe, dma_max_mapping_size()).
> > > > >
> > > > > After applied this, the timeout issue disappeared.
> > > > >
> > > > > Fixes: 8bfbeed58665 ("sata_rcar: correct 'sata_rcar_sht'")
> > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > ---
> > > > >  As I wrote the commit description, I couldn't find why the issue
> > > > > was related to the .dma_boundary. So, I marked RFC on this patch.
> > > > > I would appreciate it if you would give me some advice.
> > > >
> > > > There's also "[PATCH v2] ata: sata_rcar: Fix DMA boundary mask"
> > > > (https://lore.kernel.org/linux-ide/20200811081712.4981-1-geert+renesas@glider.be/)
> > > >
> > > > Is this related?
> > > > Does my patch fix your issue, too?
> > >
> > > Thank you for the information!
> > > Your patch fixed my issue too. So, I think my patch should be dropped.
> >
> > Thanks for testing!
> >
> > Can I add your Tested-by?
>
> Yes. Thanks!

Thanks, I'll augment the patch description with the gist of your problem
report.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
