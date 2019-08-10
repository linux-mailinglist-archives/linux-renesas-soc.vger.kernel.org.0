Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF065888DF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Aug 2019 08:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbfHJGk2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Aug 2019 02:40:28 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46880 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfHJGk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Aug 2019 02:40:28 -0400
Received: by mail-ot1-f67.google.com with SMTP id z17so22742533otk.13;
        Fri, 09 Aug 2019 23:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sgL6/Ytr+pf8qX9FnpbE1cRVsjA4/JRI+n1Ds36OnRQ=;
        b=EWbaTbgJxtrFckaoEJI2KE8ne94DeFq9YST4Uxx9T3/4Q6/04oPh2YOar0vr/qasH9
         cdZ7fgY4N0j72b/NP5VMziE3mtzZJlLFTLIj6Ja/pTbbPhKRtjPZgROuL3pZ0Vt3Y/XY
         nV/OfPKz20n9lXgL0MpOQbJfOFVb8HytIuDC3tOHf8or4B0FmjdIBZps02KR+dvseTWQ
         zqBwHURb8DXwDvX11XD1c3h67ejSBxCt9J4ptXMacyEiGfO3MvmC1JxxtzTT2mYxIgKV
         L7ya1PWxU659XoE8ObU//0PXaOt0chMfqlNRHE+6Uso3/ReHP88FXeUKCS5WvSBP3Nx1
         8WMw==
X-Gm-Message-State: APjAAAVimJ4E6mIngRczzn5lqGuutq7xKCtsrRDITFo2UPm5vuncHnRB
        vCZJ8wM9pB/GYUQ2g0RLJAEGT8GVPotIxvI960c=
X-Google-Smtp-Source: APXvYqwL1Hr4nukuQHiZBX7IlO3VywoiQEEq8oLdMtUNZRZXHuL3Ju75BOcXu/Uz+0jWeJRI1uykPzqCJiIXVfSBQ9c=
X-Received: by 2002:aca:c4d5:: with SMTP id u204mr8236259oif.131.1565419226816;
 Fri, 09 Aug 2019 23:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190809213710.31783-1-horms+renesas@verge.net.au>
In-Reply-To: <20190809213710.31783-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 10 Aug 2019 08:40:15 +0200
Message-ID: <CAMuHMdUHK7Fq3m4y1rjVFxnSXH3tZyTjOzFMfVMtRtPcdKjNCw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Aug 9, 2019 at 11:37 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas,usb3.txt to renesas,usb3-peri.txt
>
> This refines a recent rename from renesas_usb3.txt to renesas-usb3.txt.

s/renesas-usb3.txt/renesas,usb3.txt/

> The motivation is to more accurately reflect the IP block documented in
> this file.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> * Based on v5.3-rc1
>
> v2
> * Add review tag
> * Correct changelog

I feel sorry for you...

> ---
>  .../devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt}   | 0

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
