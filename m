Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE68413955
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 19:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhIUSAP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 14:00:15 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:42497 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbhIUSAO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 14:00:14 -0400
Received: by mail-ua1-f54.google.com with SMTP id c33so14026109uae.9;
        Tue, 21 Sep 2021 10:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eN5S/o/6ZloiDosjfceNAZozrz4WT1eN1DDS1RVQO0E=;
        b=61MC5UDjLYyNfvo6Ty0fEks3ZvFtLBS2TDJmOOSCEUMNbWPMTR8F9pGRyAXjCqerKX
         ALyoIv4OApgQK2K4Kj411UPpyHTfA3g87wUX+JHSNQz/CqkMKI5IgXVM755+ssu1Nvtm
         FKQrhYCpxJUeKZyWUYB2jchruCERgjOKO54HK64EEB6jy72RCN0XQe8Jrf6fV9YbCqaC
         HuR6PXM3IuVjh6XL931gwFD4riiZT0b31N4y6SU9t+zIG54va6qtV3JDxkGkVo9tPnHO
         a0g+QxL/4HGL9WmbX+d9pvCtfn/ElMd87N0tsZ+KR+kcwn2lARwuaS8rXiHf8YzwedIO
         rBfg==
X-Gm-Message-State: AOAM531JMCKnfSlJZN433uqEGmMuq53Yhqx/2kV0WAEDK45Tv2S645Fi
        fdpzk3UpLM46U7LOokvhjz/CzRbUaA56G5qSlEksSGV3F/4=
X-Google-Smtp-Source: ABdhPJxMQ2nFN6PIjrwmkoP1lufQmTQnSJFz5f5acjsBInqKMaoWARFb8TRVDP0sGzIEGgBVpWFPUWcjfjszXJy9nr4=
X-Received: by 2002:a9f:35aa:: with SMTP id t39mr17168979uad.89.1632247122322;
 Tue, 21 Sep 2021 10:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210920182955.13445-1-biju.das.jz@bp.renesas.com> <20210920182955.13445-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210920182955.13445-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 19:58:31 +0200
Message-ID: <CAMuHMdWG_pR6JmTa6J8Vkad57i9iveqqGfhAUvs8XcQ=CTUiKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg2l-smarc: Enable I2C{0,1,3} support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 20, 2021 at 8:30 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable I2C{0,1,3} support on RZ/G2L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
