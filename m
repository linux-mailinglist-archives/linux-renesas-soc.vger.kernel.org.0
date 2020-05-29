Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4851E8052
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2020 16:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgE2OfT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 May 2020 10:35:19 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39151 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgE2OfT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 May 2020 10:35:19 -0400
Received: by mail-oi1-f194.google.com with SMTP id a7so2365984oic.6;
        Fri, 29 May 2020 07:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y9LiOYcebJaNxvRjrdt7zFFu7LQbbd1IIjUNNutYteg=;
        b=cViXyZ16WatSZl+UxTjej6mTKdIp1giy3yLb9r3zPcWl66hmzPWW1A875y7C9W+Cga
         2ciJKKVLRRk/4wIFSo7NxwKjy6aPRGFsCijzLoXYoMoMCujBDZCUQZg2888oru6nhdKn
         UYdi4yQTxvkd3Q0Ul39jpkL8zO6yWW24n/aH1TMwT5GFoeF92ktFEzacWBo6749ev+80
         4ahjRRCuIZdKxME5dCpypL9hImaz5SfgwWmpKY5wLqLnUJiYF7Rd76lTmoAytg8KU4uV
         /b11K4H3mC9u7YoaPjzxyBnBYN9bptKQzzY+6oQFDQckDVP15yb8Zd2jP92GR0UpB6Ln
         yeFg==
X-Gm-Message-State: AOAM5306u66KrPEgKRUdiAwLW0Vd3TTFxdDv7R+L+h393SV3rnY+7zrh
        RaNIom5x5sDeYKocBrQwEXqc8om8lx4QRQ1W/Gw=
X-Google-Smtp-Source: ABdhPJyWgCgrgSwTeKdNPbduEl0CH+QtvdTGaS+vJDD2fGaalwlT7p0RT5Kvlu7eP/Si6N7AasF6CssYyEAeSi8aVoc=
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr5971012oic.54.1590762918236;
 Fri, 29 May 2020 07:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <1590611013-26029-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590611013-26029-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590611013-26029-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 16:35:07 +0200
Message-ID: <CAMuHMdUORdW4EcDLsS0gF9nhQpmOQqceJQzkLXUb9BPs5Av9ig@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: r8a7742-iwg21d-q7: Enable SGTL5000 audio codec
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Wed, May 27, 2020 at 10:24 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch enables SGTL5000 audio codec on the carrier board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
