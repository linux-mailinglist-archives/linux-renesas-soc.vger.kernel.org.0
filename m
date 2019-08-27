Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408C49E833
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 14:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbfH0MnE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 08:43:04 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39050 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfH0MnD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 08:43:03 -0400
Received: by mail-ot1-f68.google.com with SMTP id b1so18502371otp.6;
        Tue, 27 Aug 2019 05:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zD6Ar5X8ZCFYlrqp8u7R/+2aJq6fgCbXuhgwP/0PgYc=;
        b=c9H5mTIF4eYeFeKTkcS77Hk93+0zqFvf4XCg9Fw+D7+4i2KsGzZDCzk08DaAEDrkMg
         Z+sMcCZvNoQLR0C7OkIrvSVFB6nAB9K52bN5OV/shOLqwjdx8IzrxgrP+0NtgyPzg59b
         3cxp43gEZE3demSstv2vck5XHZYb9t48v835gwq6ACftJfm/RPs46ry4Bdywr8OfyJEO
         46izp5LoBn46LAtZAFKO6iXjU4x6ulWuFz50MhJ/TeDSkd5QU1UegGBEjnSVbiUCtsCY
         +/vxIIthrnat24xUHj2VyYFlpGRoabrg5EH7rsNbmSqc3EW4c1TuDQu7zOAPoVCn+uyu
         53Ew==
X-Gm-Message-State: APjAAAUrpEc8N+X+yVFdJU/NUwJSUhinopTjRJnMz4c9bn4wgguXKcrt
        4JWSLGLG/bq6hh3AI2QBQt/uXWvKeAtbevrxf0Wwzz6l
X-Google-Smtp-Source: APXvYqwWUmScWMs8dVNTGNIN/apU3T5R91u0xoCmZG+X1EQUZ75RTVfPs9TRD6ped92zsJIjLVzUZoL969D4FZeUccI=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr19880625otn.297.1566909782762;
 Tue, 27 Aug 2019 05:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566900127-11148-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1566900127-11148-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Aug 2019 14:42:51 +0200
Message-ID: <CAMuHMdXLGBqPLePsShvXxtRFEwvnr0ax2SYDcbou6dBTOqh0Ug@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: host: xhci-rcar: Use xhci_plat_priv.quirks
 instead of code settings
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 27, 2019 at 12:04 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch uses xhci_plat_priv.quirks to simplify. The previous
> code had conditions to set some quirks in xhci_rcar_init_quirk().
> But, the xhci_rcar_init_quirk() is called at the same conditions.
> So, no behavior change.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
