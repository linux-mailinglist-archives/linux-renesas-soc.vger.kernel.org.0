Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8F75118BFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2019 16:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbfLJPHm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Dec 2019 10:07:42 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40009 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727272AbfLJPHm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 10:07:42 -0500
Received: by mail-ot1-f68.google.com with SMTP id i15so15772880oto.7;
        Tue, 10 Dec 2019 07:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gK9WhM7XsDaY+lb7/ANGcV/P86c0uO6eQPbXi7xswFE=;
        b=eIH4lr9LaBZSeOFhwlWBesw20u7HhJynzzXSFuID/eOnC6umFrgnqgfC26BH4hkwca
         HWxdcjAC/5PxldYp33FLiAMwANVdV8qrYnAgFWiN/M2sULha8b3XhJPL/pj2C/bndSbZ
         zI1p9AFepvSShSph8KDRHCDnbQNA8aNi9I7NhfKXs1RaN3w62DTAxQBuc1eiOizIVKA2
         7wE5qFTCy1LFyzzDk04MWtUv5Xn7IJEweh4ZOKAcGUCP8GyZ0/JYqn9Q7Q05xLl1G/M1
         cTCs/hWSyTde/n5Pk41XIKLrnmCCw5+5BWkkmVeir/03GbfQTHtIJP2GGFAJt/+NF6N0
         3OHg==
X-Gm-Message-State: APjAAAWwIx+eFRKUOyN5B9RlGPFOOPB8iCMCjDgn8g53ZaIpITc82rWD
        ARRU5segUdovbFVlI/XoShCL0XbGyJNGr79Rz7M=
X-Google-Smtp-Source: APXvYqwC9TBYwf2pyNK0Qv54QJWthYsUOMkaDtrE0Tk9LHTcQq/Y/VTDQ4Y51lg891cIGW1OjaKmhctBQZh2r1ySNGc=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr21315284otm.297.1575990461076;
 Tue, 10 Dec 2019 07:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20191030184844.84219-1-edumazet@google.com> <CAMuHMdVK=dUxhJh1pjLe4bGn3V=FHJ_90oga0USRBw-wSqd8Pw@mail.gmail.com>
 <CANn89iK5oLcLm2bL=Q5+oTrKrd1q_QkEQpAQSfyjDSSeM22Dfw@mail.gmail.com>
In-Reply-To: <CANn89iK5oLcLm2bL=Q5+oTrKrd1q_QkEQpAQSfyjDSSeM22Dfw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Dec 2019 16:07:30 +0100
Message-ID: <CAMuHMdU2i8XABic0gUbSdCyBW=D3Rm+K+HR5DzUbxm8SpP-rHw@mail.gmail.com>
Subject: Re: [PATCH] dma-debug: increase HASH_SIZE
To:     Eric Dumazet <edumazet@google.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Eric Dumazet <eric.dumazet@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eric,

On Tue, Dec 10, 2019 at 4:04 PM Eric Dumazet <edumazet@google.com> wrote:
> On Tue, Dec 10, 2019 at 6:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > JFTR, this increases dma_entry_hash size by 327680 bytes, and pushes
> > a few more boards beyond their bootloader-imposed kernel size limits.
> >
> > Disabling CONFIG_DMA_API_DEBUG fixes that.
> > Of course the real fix is to fix the bootloaders...
>
> Maybe we can make the hash size arch-dependent, or better dynamically
> allocate this memory ?

Dynamically allocating would be the better solution, IMHO.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
