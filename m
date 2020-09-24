Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B59276C6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Sep 2020 10:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgIXIwh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Sep 2020 04:52:37 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46754 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbgIXIwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 04:52:37 -0400
Received: by mail-ot1-f66.google.com with SMTP id 95so2394439ota.13;
        Thu, 24 Sep 2020 01:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CzZp4L4gULRfeROfeqkWa4ky2SyBZZojQlp8JyiVvXw=;
        b=AK8AoPZY3a4v7yI2nyXEmXFACDWKgYXDitOXdWe86xtT3Bpao+GEycxDAgzheHUgXs
         ZeZymbJI5LXrxt+fXlo8TUnWy4xkoGAK8Id9mh/Y3+3qfNhSuVfsCgNRVDcBkMouyHPo
         0Afqyc1BQlPiQtA0Lv4wfNJ0wMkPioHROG51utKRtNQIp7coi4ugw8WR3MKOkFHax9uc
         fTxkfyvf6mesdOg3ORnr70Y0s+xBI34V3CrovfSuQqSIkk0bGqmkw6zzLSOaaPmvd1jw
         ifHWkzUzEfC123/IPJEXns/FI4nmqjqazuktZ5XHcUxr4dVWQ2NuOOhVL6y7Xvlak59E
         OMKA==
X-Gm-Message-State: AOAM531hXo71lU2sT71BW7AzRMgOAQN1wipaxtIJPhbYsjRUCqZyScSo
        Iq2fPRDlqyxOKQ/oI+JEhVuOLSvZ7b95N0+jtlI=
X-Google-Smtp-Source: ABdhPJyKiqfghi6tkPbYi6Xu/6Avs18q+hfIn2yS449T0DfzNqXqixq/VlHrUje6887LmYuGwohGhsIlsYlor+RHDYQ=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr2331895oth.145.1600937556444;
 Thu, 24 Sep 2020 01:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200924080535.3641-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200924080535.3641-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Sep 2020 10:52:25 +0200
Message-ID: <CAMuHMdV5m3LH9QyX=Gau5UsDz3AZvqNOgCJiHb6Je+7qS0Ltvw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure
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

Hi Biju,

On Thu, Sep 24, 2020 at 10:05 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls supply
> voltage for touch panel, LVDS receiver and RGB LCD panel. Add regulator
> for these device nodes and remove powerdown-gpios property from
> lvds-receiver node as it results in touch controller driver probe failure.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v4->v5 : Restored Laurent's Rb tag, since it is minor change, renaming vcc-supply to power-supply
>
> v3->v4 : Incorporated Laurent's review comments(https://patchwork.kernel.org/patch/11707887/)
>          Added Laurent's Reviewed-by tag
> v2->v3 : Added the missing part from the patch. removal of powerdown-gpios property.
> v1->v2 : Add regulator in touch panel, LVDS receiver and RGB LCD panel device nodes
>            (Ref: https://patchwork.kernel.org/patch/11707559/)
> v1 : https://patchwork.kernel.org/patch/11705819/

Thanks for the update!

As the prerequisites are now in next, I can queue this in renesas-devel
for v5.11 after v5.10-rc1 has been released.
Or do you think this should be fast-tracked as a fix for v5.10 or v5.9?
I.e. is this an actual regression, or just something that never worked
before?
Note that v1 had a Fixes tag, which was lost in subsequent versions.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
