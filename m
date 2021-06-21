Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F063AE7EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 13:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhFULMU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 07:12:20 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:35411 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhFULMU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 07:12:20 -0400
Received: by mail-vs1-f50.google.com with SMTP id j15so8985969vsf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 04:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kXa6rvfs6uN01KbWoFxFQZ3yWISmcVbXZxi/qnudyqQ=;
        b=O5NHzVO45Pi1OZEhJs1slPpEaTUPD6GSb5YdDZasBzUwilt2yCHfrZ0+hz2CUgMBaR
         t2XWZweh3R5OTiUZOAbLEGPn480stMaBDgUD0mzPPuzCAY7yA6CETk5JjdGamWSqSOLH
         2Sa6NwIcZmh0CFU2++SOTQ6b4uNEiQmq0ehZxwL60fowyz54jv4QOW9xsCrMDfbXRdyP
         B/3qiZS17wOZAoGR1491rGXrluRl0SBoTMkHg73dTeBz1wVVTbciJi777+7ssWvLFt+u
         xfcJZ/FZqLEWlKyRXJdE2sbu4DFaLoduZkcEjQcBBU1hEbrYjEre/ru3ooNYE+YBUJPM
         Q5lQ==
X-Gm-Message-State: AOAM531TxnaiKNkfQCDq6gfYI/rKAR7FLWURBnJhkDbxk4O6vRd0OOPS
        1etZd1+XzBnqTyzbp65mKNaVLBAc/XhWPKn2bYg=
X-Google-Smtp-Source: ABdhPJwFITQqEFectNtg5eJ5gZaGWmZ+tCz7dF3YqmD48MtVmvjpUpIcBZBsp6V64Y3FPecmwEtbWCnwIS01j/MxTiQ=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr16321877vsr.40.1624273805365;
 Mon, 21 Jun 2021 04:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <162416647337.11444.4467438519249633023.sendpatchset@octo> <162416649714.11444.12659951671817146236.sendpatchset@octo>
In-Reply-To: <162416649714.11444.12659951671817146236.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jun 2021 13:09:54 +0200
Message-ID: <CAMuHMdWy=cffrnZdYvJ2Taj7=E9vUyw6=r12HVajWV-YKDHEmQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77990: ebisu: Add SW4 support
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Jun 20, 2021 at 8:01 AM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add support for SW4 via "gpio-keys" on the R-Car E3 Ebisu board.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
