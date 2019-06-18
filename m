Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 901884A2C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbfFRNuS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:50:18 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39158 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfFRNuS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:50:18 -0400
Received: by mail-lf1-f67.google.com with SMTP id p24so9350302lfo.6;
        Tue, 18 Jun 2019 06:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3XxRZmEFc6S94zkz1v2gmbXuUx8rY0PRYaYALomUXmE=;
        b=CbsWMAmX80BPeomQsrcCjAQxFDG3N6t2Pjx656XgDWM9bhWR+0lqoxv0ty5JQz0+rp
         FDUtpC4zr7XVoVYgWKWsfYxVt8+VUoH257N4+58RynRoXaCnv6ml8daV5hmeizn4n3yv
         pJ5xAJv/r+YNJidNDxdPYpZZ8J4XWOORaU5KZskwUPCjXZgTgn05UIbzTuPCmM85xjX/
         l0MK3dXWWDCNaI6+c0WyYIIa5xtbXOyhC3QiDNXmGXJoFhkg7angcrYRX+8oQxXgCJqn
         HI9i7UZFR7ViodTOclPvy81DF2U65bsXQKM1nj6KtK2g/ZkmfHVs6nNGuTHkfc0YEsmp
         3YZg==
X-Gm-Message-State: APjAAAXQam/ZK3ZW1dNXbToqYT1pYBK/DfPDU3La6cJxxhEUhWmxI8uZ
        mzOGeHP/BFScLjzneii1xNYF3I3Y5PJCvhRCZFE=
X-Google-Smtp-Source: APXvYqyjUQmkWVXqFsrtrEbXyCpTYiSZYc5iy8vOvp8IBFiO7utxs7XS9RNJXLpWcLb2yxVf43O1smhFhYX6qjPp6ng=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr51356084lfk.20.1560865815542;
 Tue, 18 Jun 2019 06:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190617090603.8449-1-horms+renesas@verge.net.au> <20190617090603.8449-2-horms+renesas@verge.net.au>
In-Reply-To: <20190617090603.8449-2-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 15:50:02 +0200
Message-ID: <CAMuHMdWMaSh89Pqd-BYanjvpuZCzDSwonY2OswS8STZaC+c42Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas_usbhs: Rename bindings
 documentation file
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 11:07 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USBHS documentation file
> from renesas-usbhs.txt to renesas,usbhs.txt.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
