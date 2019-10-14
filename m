Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7285AD5F47
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 11:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbfJNJsn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 05:48:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39782 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730677AbfJNJsm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 05:48:42 -0400
Received: by mail-ot1-f66.google.com with SMTP id s22so13255141otr.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Oct 2019 02:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nf+fM/3PuyBlhAi8/6Sa2Tnn3eMSHcjqaBNGv0oGHEI=;
        b=UWuK54orMTQy4TS5wnlzehXJI5Ol8dZXxHqOg4hIL7ZKEuPbI5T7aeGQ5AXPja6hbm
         v2zlkGFhUkpqpLxz5zmm0t9EMA/7v8yo8Sqow0xtLrsfxKANb/qpddp+3gqhlJNLlP5X
         ZrlIKbtM5MD2wiEwNL4TjwDuZAfqw/LjQAzStz3WLUHgJ9yKeAWNSc6us6+J5lrItWf2
         1nzLI8ia85cHA72kNyNjgz+poNoQ9c2J3GZ0A7fG4qG02le518HC6l6aPbFaByuwcNFU
         kHKza99nNdFEnSzJbG98LoLkZVOQobfzPWL8xLobz/+QV9LC6RzLGWJn0P1duzM68J1+
         1v+A==
X-Gm-Message-State: APjAAAXriPonTdFpeJ/HxaSt8WAZZCMPAG9xyWta+PvhaAsFsFBiUls3
        d7nw4n0k3k0XsiVevyDlRDr0brYKooxQzXQ6NgAAJw==
X-Google-Smtp-Source: APXvYqxDH32qfzBVZLyIQre2LqFRGk5S7D9TMpV23fJ0IDHphJ7xjpyQ8H547gGib6H5rxbf8ZAunqaZ3GbPYpYQzng=
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr23903359ote.145.1571046522288;
 Mon, 14 Oct 2019 02:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191008060619.30237-1-nobuta.keiya@fujitsu.com>
In-Reply-To: <20191008060619.30237-1-nobuta.keiya@fujitsu.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Oct 2019 11:48:30 +0200
Message-ID: <CAMuHMdXLztQVeVTw6MUfGL-v5hD2HKUsecYZyN3oX=Ojpch1SQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: pfc-r8a7795: Fix typo in pinmux
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
