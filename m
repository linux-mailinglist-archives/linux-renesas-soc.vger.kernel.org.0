Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D90742671E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 11:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239485AbhJHJtI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 05:49:08 -0400
Received: from mail-vk1-f181.google.com ([209.85.221.181]:38652 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239501AbhJHJtF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 05:49:05 -0400
Received: by mail-vk1-f181.google.com with SMTP id bb12so1935970vkb.5;
        Fri, 08 Oct 2021 02:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZhkuDcQL9tzn4rlqi3fw3STDZb023NsQ7pw++PUWl98=;
        b=ufPSRqdATuVpXqRL3/Bpn1X0drQ6+HAUIpeMX3lgNrjd3afsYezQK/3vIgorYOw5Ad
         zMvjfnK9l1bPC4bnexdk+1ANLFD1OXBcG1y7oymnUgOQa/mdDBwn9ILw/h4eufsBosYW
         bAk3etWantJpfonHtSgqHLdez4UncsowgHV3tjRjsTX3F1XQnPSpRwIDp0jIUL9JctHS
         WtwRQleIBpK0HrXHVfR4wYbg8gXRNSXjmE8RJqY7li1Sgc5PlLgAKqc81IErNsbx7Uqf
         opZgltp7/kRH2oFgy+d8eTY6Td36CPW3yo95aALTvgzBuUqeXGUdefH/ffAKC2DaZE8z
         3qpg==
X-Gm-Message-State: AOAM533NLkiynhgd29mK6bzYJH1//iStgGc4OWWxP7qYQ2/WdJM7XiwI
        vz5MvEyabrWiCZ7Ra0bbvvTPKu6Jj112a48RJD4=
X-Google-Smtp-Source: ABdhPJx0vp+vewsGH6TcoNQtzkUhJtw6lJRBl36QRSHBSd/FGPv4RBBT40lkJ0ifQL61E5H/rORLvoHMSkvcJhw4fh0=
X-Received: by 2002:a1f:5e84:: with SMTP id s126mr8220069vkb.7.1633686429994;
 Fri, 08 Oct 2021 02:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211007111434.8665-1-biju.das.jz@bp.renesas.com> <20211007111434.8665-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211007111434.8665-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 11:46:59 +0200
Message-ID: <CAMuHMdU0xsy=t=2mdvjEmD_eNjVieHUAZThDQWXC4zz5iyzNTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drivers: clk: renesas: r9a07g044-cpg: Add SDHI
 clock and reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Oct 7, 2021 at 1:14 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI{0,1} mux, clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Renamed the clk source names as per latest HW manual
>  * Removed .flag and .mux_flags from DEF_SD_MUX
>  * Changed the mult/divider values for 533MHz clock

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
