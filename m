Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973C7162683
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 13:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgBRMzW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 07:55:22 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36069 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgBRMzW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 07:55:22 -0500
Received: by mail-oi1-f195.google.com with SMTP id c16so19987155oic.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2020 04:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=wT538E2yeXhdAbLdX+E97i1bBFY4CFx+RpRhZlQ+JW0=;
        b=X2lbowJRTGv6iCXMRtl4QapJXHnr2fL+GM70J41AXIDSrUZxc+7nR8HxVuHD9odjgF
         BJhlrS36culc9rIFwwsr2jhR7QESrBVif2NRKvcn5/1OMHTOfTpma055kwUOZmH3GK6f
         seKcfIBBfiOAGVR37XPMIXgAZtliUShtRhmAochbXULVMzyIuhq97WgZjTA/mun0b1gl
         REcO6vKmoFZ1JO/m7DVKF5yzLbmQuh9ksolnTTsLSs+voTChGYRTU9W5Hd4XUQUGhPvW
         niKNxHx9Zv+o2LxHsKdQ1vEupuL2OkreM1H1mfZF+4OgDQENtROOf0/juwPQ1PMR1J5G
         2YWw==
X-Gm-Message-State: APjAAAXeMfPHJhD6AbZqgmc15D5s1gj1QtSEoP/Aw/wAYBnQnwNNAsls
        08GZMX8VdUWjjsG3gzb81WiZ7F/rJtxt/8ZGJi4=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mt1397003oif.54.1582030521511;
 Tue, 18 Feb 2020 04:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20200218112525.5834-1-geert+renesas@glider.be>
In-Reply-To: <20200218112525.5834-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Feb 2020 13:55:00 +0100
Message-ID: <CAMuHMdVAOknhwO2J-vkRSO47uJJn873J-4mPvAMq+vQgE_nk9Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Remove use of ARCH_R8A7796
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 18, 2020 at 12:25 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> CONFIG_ARCH_R8A7795 was split in CONFIG_ARCH_R8A77950 and
> CONFIG_ARCH_R8A77951 in commit b925adfceb529389 ("soc: renesas: Add
> ARCH_R8A7795[01] for existing R-Car H3"), so its users can be removed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

 ARCH_R8A7795 in the one-line summary, of course (thank you patchwork-bot ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
