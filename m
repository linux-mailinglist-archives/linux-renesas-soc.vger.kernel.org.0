Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F138BD5F4E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 11:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731073AbfJNJte (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 05:49:34 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45068 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730941AbfJNJte (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 05:49:34 -0400
Received: by mail-oi1-f196.google.com with SMTP id o205so13203048oib.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Oct 2019 02:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nf+fM/3PuyBlhAi8/6Sa2Tnn3eMSHcjqaBNGv0oGHEI=;
        b=C1N6i+KGR5beHjJrNBbOss0PhSnIH7kgSSDqRWUzOzWYaSi5qptK7yzOZ0wRAgVzFc
         /4IW/Gl+T5XeB+FTMi6+4Ljuhaye2I6thwOsVl5DgALoJLJLxpnY2Grn26W2BVxuQ5o+
         bc6dXD0z2chRWpIZGTN5EKPctG/UKSTBgHu5RTBGuJh7nbxzu2iBioPTzNByUDtXOlEv
         Vg7d3UXiGtn0vjy2x5YYOeKnZ/jFD38kp/aKjdRCxBk6L5hpQ7fozXWgKnWE48qCbI24
         pymMv7PdQN35pkLM5UzMkx9Tv0voCx3d3hTd3wdqGBVukXKw/vfQ2TyJuRIuUaLUXlfD
         uXmA==
X-Gm-Message-State: APjAAAVVVxoAKW2jS+I2FK9RHsISj3KlM1Y9xQv50BiI5Xu0jHjX9/E1
        ULRrFCkSoFpgc2xtoSx/lxxnkMAjpADzVSHOmg8=
X-Google-Smtp-Source: APXvYqyqsYafD1ffC3ybhHM/Gkki83bdcpsNV2rgnmLDlVJYxwyrYX+g61329klXGzwrA9sAhsgv4VB8yK0syB81sZc=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr22536336oiy.148.1571046573419;
 Mon, 14 Oct 2019 02:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191008060619.30237-1-nobuta.keiya@fujitsu.com> <20191008060619.30237-3-nobuta.keiya@fujitsu.com>
In-Reply-To: <20191008060619.30237-3-nobuta.keiya@fujitsu.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Oct 2019 11:49:22 +0200
Message-ID: <CAMuHMdXZL3AbxRVSoSz5f7qenj6KqALLVtWk0Bk0sWJ=dxthgA@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: pfc-r8a7796: Fix typo in pinmux
 macro for SCL3
To:     Keiya Nobuta <nobuta.keiya@fujitsu.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 8, 2019 at 8:06 AM Keiya Nobuta <nobuta.keiya@fujitsu.com> wrote:
> SCL3 is assigned to GPSR2 bit7 referred by IP1_23_20 macro.
>
> Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
