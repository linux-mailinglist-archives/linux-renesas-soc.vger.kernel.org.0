Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C31FC23EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 17:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731504AbfI3PIc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 11:08:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:34914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731225AbfI3PIc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 11:08:32 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E052218DE;
        Mon, 30 Sep 2019 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569856111;
        bh=Fp+52V3gN6sLDfZnvz4YS9HFrRO4+wFt/PSe7Tf/5aw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hxPKGzCId/ZbUoZF1UIJZ/VCr/bVk+GIp8mrn4VXi0q1ssoLl3UdYpJWcC/4rU84N
         FnXXm+Wnn1mDguj/c0OeuoaroLmvzqPQ/M2gwlqP6TAbGhFGp/XLbKwI1dfWatbjqA
         3ANZuGUbaZ0VhcoFLNvt4libe25gZtyUyNZzoTu4=
Received: by mail-qt1-f169.google.com with SMTP id f7so17454812qtq.7;
        Mon, 30 Sep 2019 08:08:31 -0700 (PDT)
X-Gm-Message-State: APjAAAXEVCNSUiQi7H2/mENsFioPK4Up1br2gECc858c4wmJf2lfNfCq
        sxT5fk65+q3YpXv82BteZdmsnAm1e0WhDOKs1Q==
X-Google-Smtp-Source: APXvYqwdbKZykrRJVvOGUuCRKPQsrzrj5n0WLj/vIuGy4RYdGBRfRlP4d6XFnA0ZTIbDwxJr+GXxP7zrGKoVrxGv2wU=
X-Received: by 2002:ac8:6915:: with SMTP id e21mr25049775qtr.224.1569856110650;
 Mon, 30 Sep 2019 08:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190907161634.27378-1-marek.vasut@gmail.com> <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
 <CAL_JsqK+SwX8Lu+-4UgpLVxL05yTcs8Af9mPVHqzbf6+HF9v3A@mail.gmail.com> <0bf7c8c8-d03e-c08e-4879-3d3a2fb90ca7@gmail.com>
In-Reply-To: <0bf7c8c8-d03e-c08e-4879-3d3a2fb90ca7@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 30 Sep 2019 10:08:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJf-TGE-SWWj=6AVbpfuN1AsEdDTSOCOk+iUzTT3yZSgw@mail.gmail.com>
Message-ID: <CAL_JsqJf-TGE-SWWj=6AVbpfuN1AsEdDTSOCOk+iUzTT3yZSgw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 30, 2019 at 7:45 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>
> On 9/24/19 12:33 AM, Rob Herring wrote:
> > On Fri, Sep 13, 2019 at 10:14 AM Rob Herring wrote:
> >>
> >> On Sat, Sep 7, 2019 at 5:16 PM wrote:
> >>>
> >>> From: Marek Vasut
> >>>
> >>> Add dma-ranges property into /soc node to describe the DMA capabilities
> >>> of the bus. This is currently needed to translate PCI DMA ranges, which
> >>> are limited to 32bit addresses.
> >>
> >> FYI, I've started working on this problem and issues around
> >> dma-ranges/dma_mask. Hopefully I'll get some patches out next week.
> >
> > I've pushed out a branch here:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dma-masks
> >
> > Can you test it on Renesas. I don't have a real platform having the issue.
>
>
> With the following patches applied:
>       https://patchwork.ozlabs.org/patch/1144870/

I'd rather not have yet another instance of {dma-}ranges parsing code.
With this series[1], dma-ranges gets parsed into resource list for
you.

>       https://patchwork.ozlabs.org/patch/1144871/

How can this one be applied? It would conflict horribly. Plus I think
it duplicates what's in my series.

Rob

> on R8A7795 Salvator-XS, works fine.

[1] https://lore.kernel.org/linux-arm-kernel/20190924214630.12817-7-robh@kernel.org/T/
