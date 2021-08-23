Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810893F473C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 11:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbhHWJRw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 05:17:52 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:39666 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235681AbhHWJRv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 05:17:51 -0400
Received: by mail-ua1-f45.google.com with SMTP id a4so7606455uae.6;
        Mon, 23 Aug 2021 02:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9QLjRZu+Qt7qgSvBEQ/53pbQu1xoAU50oF0hD2z0Qgk=;
        b=dXNDm2dOIspLVSKshmZAcZWzK76K1wAR0YK+SGgew2NlyOUUeIRlVr5tb9noV3ZO6W
         GEfxgzaksOIGC7dtjNpW5uFuCEiGCPBQdhSNPsOZMbA9S58sB2bhQ/K5UTXbsf/WU8l1
         bCuFYV7jLTwBd6qmVlgYS08wk9a1JpPAm6r8WJ7NUiwaa6as7MulnpbH0S5j3yOAee4n
         AONWKS5m5OAaC8ReC99TjOieqH9Dp7yMDO45tVK3nHKkI99MJYZsPOf5QdF71E/SaQdV
         XTLUBayFdnWoCnY1poOrk4+86bWV1WUsvgzld7K8GHJHGuieLesgx5sClvPcmG40SHmE
         2B7w==
X-Gm-Message-State: AOAM5320adD/AhkCHQBKpGh4az9GMUWGcKtKdhq6TQCzEbomie/C+Wqz
        Ysisaj5uyaOuy32mS5ARVAnk2FtvSZkkuHE9tlQLUcDD
X-Google-Smtp-Source: ABdhPJzpNaAdaSSJdpn6BAK/7CLSD19FVvFR1f0/X4YuiaF49K46oNfMaKRHGNKHoksTYDNTArhskhCJmDpP/82y20A=
X-Received: by 2002:ab0:545:: with SMTP id 63mr21148288uax.122.1629710228796;
 Mon, 23 Aug 2021 02:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210816162201.28801-1-uli+renesas@fpond.eu>
In-Reply-To: <20210816162201.28801-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 11:16:57 +0200
Message-ID: <CAMuHMdVw-mZKcPuZ9ZtqMPqCTp9bcjHm0Yy8Zb9KtfoM5me_Cg@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: fix break handling for sysrq
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 16, 2021 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This fixes two issues that cause the sysrq sequence to be inadvertently
> aborted on SCIF serial consoles:
>
> - a NUL character remains in the RX queue after a break has been detected,
>   which is then passed on to uart_handle_sysrq_char()
> - the break interrupt is handled twice on controllers with multiplexed ERI
>   and BRI interrupts
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

FTR:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
