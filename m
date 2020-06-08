Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0CF1F1A68
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 15:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbgFHNuW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 09:50:22 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45804 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729674AbgFHNuV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 09:50:21 -0400
Received: by mail-oi1-f194.google.com with SMTP id p70so15293947oic.12;
        Mon, 08 Jun 2020 06:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LoBXZChFhFBHCAkIAQbE9ACXjpMIB+fC8bSF51f2aWc=;
        b=Oi1JV+iOrC6Fz0vZtz9BnXQLvULm/VK9Zn12fvWo1ZfOLbKHXFz651IV7Se0j60b6b
         e3oA2859K9ksf52g2x9v+FCvGbWNa4pFFwieXf8Mfjd5Lw2Qz7n4bzs0b3rGDHsKVEE3
         +M+pdruzQIPjFNvP1FGn8mkpVzU13EKTxbTNdblvWWMFvKoS9F3GDrwaqIwbhXMYhqQd
         2JGCHqDlFGNHJeQNHWKtQjnmIM9YDaAOsLxuhMlGqW7mgupIcxrZ7PMwNWK3wt73V6oo
         vijEfM+B0cRCqXXu+gYv5cNW7NBN6ObZ+2lxp8GOqxxleqUqOM4KjbSXrUFUVD0fWmD3
         6dLA==
X-Gm-Message-State: AOAM5312+E3y7k+dEM5/6aD85V1km5Lm6HtG3Fim23+EAYRW6mQ7jO3w
        UZ1sqwY2zTS+tnkNJHZlHjJdAGeTogDb16w/1f4=
X-Google-Smtp-Source: ABdhPJxu+xASA+2ZNb44ekDJEVwU5qFhT7U9QCnbCegaQTenwVkQmEVG4N8NU8yCgqlmPa3KP9HE51+OyaTr6GMiSHs=
X-Received: by 2002:a54:4006:: with SMTP id x6mr3364279oie.148.1591624221004;
 Mon, 08 Jun 2020 06:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1591555267-21822-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jun 2020 15:50:09 +0200
Message-ID: <CAMuHMdVjHdwpm62mephmGPtDrYOeQyP38PaQD2=SOYD6Xj5ZaQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] arm64: dts: renesas: r8a774b1-hihope-rzg2n[-ex]:
 Rename HiHope RZ/G2N boards
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

On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The existing DTS files for HiHope RZ/G2N boards are for Rev.2.0 version
> so reflect the same for the DTS file names so that the existing naming
> convention can be used for Rev.3.0/4.0 boards.
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
