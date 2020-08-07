Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCFC23E9CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 11:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgHGJKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 05:10:19 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34952 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgHGJKT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 05:10:19 -0400
Received: by mail-ot1-f65.google.com with SMTP id 93so1098833otx.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2020 02:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DXQdkSJ8D6trkET0ksBydYMEriW+jYPKwcXIMPlanUw=;
        b=GDp2+w7GVEKdH/XWfVidVUbT1WCmVidCfy8Xi4mh5xEkdAoDaK0D6iOGKRHLXRRQb3
         /Hv9j+sqAS6pL7j/Q6Rp4dAtZml53POHrA9hXdLAGgIcjmZTeD6E3nCXlcd1+4yNSUBX
         lepoIVudbw/UlHD4L/ZWYSA5j2sSyQO1kU33eNqRXjwp47nF4+RR+ZIbgun8Pd4NFosT
         xko9ishUxYz9cPWuIdWs/eOIT81khY8mT9Wpb3Nu78mby2PQFI1CB0+I42jdCcASEsG6
         RtL1ecxrVWsVlV31PSvrY7o4k3X9zI/npMwJAghagJ10lGQwEChKdoJW7jnlzccQaYJl
         mzNw==
X-Gm-Message-State: AOAM533xfC4xazDQRpolDmJYg7YTrB094P8vCEbj5vKNdfhSCTeJy942
        dSlMdMP2BMgORlOjPNVUbw+gNLWj3NhPOxukYsE=
X-Google-Smtp-Source: ABdhPJyPNNXKKQHO2De8AAiO6rSG4I/psknzBCz/axfdP+XN+XxqmqFalGQ7lEpPvIceUOsUhXG90amrqD5eQtjNwkY=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr206146otl.145.1596791418311;
 Fri, 07 Aug 2020 02:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200806121704.3192-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200806121704.3192-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Aug 2020 11:10:06 +0200
Message-ID: <CAMuHMdWyFqsTw91Wg0LASB+B+w=FY4aV1FDEGS8sjTN=LEs0AQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Enable TOUCHSCREEN_STMPE in shmobile_defconfig
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 6, 2020 at 2:17 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable support for the stmpe i2c touch controller, which is used on the
> iWave RZ/G1E platform.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
