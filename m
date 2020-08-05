Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDE523C87C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 11:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgHEJBf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 05:01:35 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36433 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgHEJBc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 05:01:32 -0400
Received: by mail-ot1-f66.google.com with SMTP id x24so8646357otp.3;
        Wed, 05 Aug 2020 02:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0C2QPNz+RkDu9YLa9Z+rHGCS+ZeukaWrCXpvcs7hr4E=;
        b=he8iscqwyO6rW9U6CxDpjZ1TOY7aaleTdokKCqHQp0Vj6/dTsWLdBvwDlo5NeLnItW
         f0QdKq1DX9px+9tm0xnO6GkvoqZtiUB8ljo1kOQYxTXDw8SJbYA9rM9MpgDM8/HJ1zZk
         8ZMxOEw03dKYjTc012qM7Tcp38Ph79YUL+j6lnWdqxq2dz/Jrd8dNrQT10u7Z1NxOFVr
         cB98JnJKiUcfO591bPm5Na1Ci9pI62g+n4wzfzgeuMrxeUtCwovOPFro0mMA4fIx8dKG
         kL2oP26oUGM+aw5QuQYgmINz8q7zhQ1hJ+S8gS4VRlx+2fqtdvG/sKGeITo6x/7wFwv+
         FQkA==
X-Gm-Message-State: AOAM533+4HgqrEi7aLA9em5np23n6pHrbRCtZZLukUsnZdMgvEgGaQNY
        +P5LJwETlLoIDujOsT6P9hw+atc9zt0dBuMqYdk=
X-Google-Smtp-Source: ABdhPJzwuWnWTa8dJV/m6He89KYBMO1Y4xUVDsn3hrJVOZjCaTh+iqtHvbnjEc9E84B1Jj0ycdia/XgV6GsfA8XjU7Q=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr1662418ote.107.1596618091230;
 Wed, 05 Aug 2020 02:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-10-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-10-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 11:01:20 +0200
Message-ID: <CAMuHMdW0LNihaPnSdv1RAkbBi6sm-MS5+d5n5jiCHwAEMKj+dw@mail.gmail.com>
Subject: Re: [PATCH 09/20] dt-bindings: phy: renesas,usb3-phy: Add r8a774e1 support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-ide@vger.kernel.org,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 16, 2020 at 7:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document RZ/G2H (R8A774E1) SoC bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
