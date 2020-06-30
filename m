Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D6020F57E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 15:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgF3NTW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 09:19:22 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38595 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgF3NTV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 09:19:21 -0400
Received: by mail-ot1-f68.google.com with SMTP id t18so5553913otq.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 06:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Vv3oKfTUTLjhvdZMhnpZ2Ycz4NvPJuLRaYdFI2N2bE=;
        b=FaqDCOPhXSJP3xad3vqd6RcrsfAR//uzsc373kbp98xPNUQmu3SIrQinrLBoBc2dqD
         n06Ce/sK0oJiisxU8SYS9VOM++giRue/9D7CA1ibuO3sl6aKDnywRHyhoLbC0BAf15kW
         o38BqvlNj4dEgXpCAyvR02tkEFeJYnAhQzqDRNV/AGbKJg7/0VzZjRNpZhXT4B1Zwwuh
         hBBEtVO4LcG0/DHdYPn8uYjNk1jgB++WCaPIqlFQdq4u3PGkwnA1qUOKoyPsMHOGHxbn
         55rJv96lnjg7O2iyYEtH5MzTH+ueQIhBjvE03/bGr+kw9ZkrdoxeALHJSNI8NvEVTPsW
         /b2A==
X-Gm-Message-State: AOAM5304SQVxW5ic4I6VV9eDGdq1TvmxJxpAXzKcL6BKfLUebhwMpzx0
        7HNvBB/r3vcFPY6FKX9Lfil3MXeMJPLB4paDVUc=
X-Google-Smtp-Source: ABdhPJx2CbhwSUW9CdiX1Zkw4dTdbHFXV4X5yfDACvQ20+KKs4itk/4TIIY/dSasNzkHw8dR9dbRKUydabnqLfGIm7Q=
X-Received: by 2002:a9d:6254:: with SMTP id i20mr17680562otk.145.1593523160419;
 Tue, 30 Jun 2020 06:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU0OEA7seCDadrSsNYXHQJOuSRrm8O439PK_pf3NoLxsg@mail.gmail.com>
 <TY2PR01MB3692FBE296EC373130842219D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXh1Hh6H35Mp8hBJBykUucRNwxTmW+U9SHM+xhrcwasDA@mail.gmail.com>
In-Reply-To: <CAMuHMdXh1Hh6H35Mp8hBJBykUucRNwxTmW+U9SHM+xhrcwasDA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jun 2020 15:19:08 +0200
Message-ID: <CAMuHMdX93Q9WhKLqv_wNPzArbc68NcbVN8jJ9MDKxAcicpBQ5Q@mail.gmail.com>
Subject: Re: [PATCH/RFC v4 0/4] treewide: add regulator condition on _mmc_suspend()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Jun 29, 2020 at 1:49 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Jun 29, 2020 at 12:04 PM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Geert Uytterhoeven, Sent: Friday, June 26, 2020 7:13 PM
> > > On Fri, Jun 26, 2020 at 11:32 AM Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > Note that v5.8-rc2 with r8a77951-salvator-xs seems to cause panic from
> > > > PCI driver when the system is suspended. So, I disabled the PCI
> > > > devices when I tested this patch series.
> > >
> > > Does this happen with current renesas-devel and renesas_defconfig?
> > > (it doesn't for me)
> >
> > Yes. I enabled PM_DEBUG and E1000E though.
> >
> > > Do you have any PCIe devices attached? (I haven't)
> >
> > Yes. (Intel Ethernet card is connected to the PCI slot.)
> >
> > < my environment >
> > - r8a77961-salvator-xs
> > - renesas-devel-2020-06-26-v5.8-rc2
> >  + renesas_defconfig + PM_DEBUG + E1000E
> > - initramfs
>
> Doesn't fail for me on R-Car H3 ES2.0, so it needs the presence of a
> PCIe card.  Unfortunately I haven't any (added to shopping wishlist).

[...]

> The failure mode looks like the PCI card is accessed while the PCI host
> bridge has been suspended.

Does "[PATCH v1] driver core: Fix suspend/resume order issue with
deferred probe"[1] help?

[1] https://lore.kernel.org/lkml/20200625032430.152447-1-saravanak@google.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
