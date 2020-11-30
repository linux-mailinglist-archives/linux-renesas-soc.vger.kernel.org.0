Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE152C8533
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 14:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgK3NcU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 08:32:20 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34725 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgK3NcT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 08:32:19 -0500
Received: by mail-oi1-f194.google.com with SMTP id s18so14155744oih.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 05:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wm2cLZmb0JuqDIKNNno9NeTFn7vVuFyPy5GcXlOo+Y4=;
        b=gJJQBPKb+lbilkkg1CUvFH6ar6+MLzuhUF7XMpz8CsXSpFvENYAuqykDYmV0t+IwZm
         Cv069a1/Eqk6//vOiOsrjuoMyMNApjp/kgH+h9hAC87dqmVX5zIf6eCb0UHciXtwIGzY
         nsUu5Cs7MWH+DR5XK/5PPrNjgh2fXClFrIXiT4G6MoK4XGHlK1AWwEiE9W5bxoxad8bL
         vdfZ9jWqyTWBoNyRqt8U23TRBkh7w312sY5iJaqd9HVzANux+P3kgQMrUDmr+uU6h3yW
         OE8plFJOW1S2D4abFPIhL7PppLRxMYS6iPS2BD7rI4NkvQhvj+aKWvQupGKNN8kFnouh
         8GcA==
X-Gm-Message-State: AOAM532RGEhFlw+NplJJ2jUpsVnMAZvtKbwlDqBcXOG4o9q7EUa2ORN5
        D0GLZeFYKPpDiCyu1GusvXl/zsZs/CLzIeoBV/UzgwWD
X-Google-Smtp-Source: ABdhPJxfIfah5bF6EpZdig9wLnxeg97W/L9kK85fmNX5wQtDGIQX6lRSu/LRbWZ6UEsiwpS4mrBg+VCaLljxqfgyv4g=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr14535258oic.54.1606743098960;
 Mon, 30 Nov 2020 05:31:38 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-5-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-5-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 14:31:28 +0100
Message-ID: <CAMuHMdVxnaxtkgWquSRinuVGrbj3Rvx-3uVhD=q+YJvmVeGzXQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] pinctrl: renesas: r8a779a0: Add HSCIF pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds HSCIF0-3 pins, groups and functions to the R8A779A0
> (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
