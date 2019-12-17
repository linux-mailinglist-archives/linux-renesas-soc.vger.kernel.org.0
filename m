Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9281226DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 09:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfLQInt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 03:43:49 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33890 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfLQInt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 03:43:49 -0500
Received: by mail-ot1-f66.google.com with SMTP id a15so12875567otf.1;
        Tue, 17 Dec 2019 00:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KsLTpBAfAwGzJwqfI26/Vs1UNJxNF1XBusPvuhuxopc=;
        b=Osx4qUAbFeOMoDxrMAnOAL/BKvLKpPtuHZarQDvJII0xDJ04GSv+Y5RDXHw7YXfI+/
         P9v0dY/UAeZzZu1Y+5krjqG8PaylVaODokjFnA5/2O2LJl6pahNcXdfaG5z2YllCpcsP
         vOjKk+wChLeMYIQN2i8gBBVCJE5+pG/SQSmC9qunZ4rc/uB9ozvryfLjI/2x+gXRmGZq
         wDM26G1WdDVw+DOnQ5SlwS27C4T5PxycuY9bzS5vpk/JNyezo23w0eVbwwfmfQvzFXgR
         DMYS28lBFUGRBKBnPzvH4WHnFlOu4n039v+8+5XTySOm7l1J3Jgs32oFD4sFy86bs6kp
         QZXg==
X-Gm-Message-State: APjAAAVzTLktaPqZUxbqsdiWelv2oGq4f+5bS4BbNpU7+1o4AQQ1w0MR
        tTfqhCkGjjJWT2Z6zUQ+I/ItghPZx5C7KEw2s+6MkVll
X-Google-Smtp-Source: APXvYqzpAigI3DXg0KrqzlQBHMh5eXyPCI6zsZ29GgsGgiP/ldWjSKpt4RC6xDs3z5kZ/ZwKeBa5rXEJ0bgMzVgpjd8=
X-Received: by 2002:a05:6830:18e2:: with SMTP id d2mr7031235otf.107.1576572228763;
 Tue, 17 Dec 2019 00:43:48 -0800 (PST)
MIME-Version: 1.0
References: <87h81zh4ap.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUHGXkmKrcZVNQo8nOcGo0h6xYgjZ+XmfGy6bJCPK9ZwQ@mail.gmail.com> <8736djgxg2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736djgxg2.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Dec 2019 09:43:37 +0100
Message-ID: <CAMuHMdXX7wEBSmj-5G-Ya+n1FKMENRxpHuEhh1rmSV9zME_v=g@mail.gmail.com>
Subject: Re: can someone solve string_32.h issue for SH ?
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Dec 17, 2019 at 9:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Unfortunately, I can't test it :(
> Can someone test it ?

make rts7751r2dplus_defconfig
qemu-system-sh4 qemu-system-sh4 -M r2d -serial null -serial mon:stdio \
        -nographic -no-reboot -m 256 \
        -append "panic=1 HOST=sh4 console=ttySC1 noiotrap" \
        -kernel arch/sh/boot/zImage

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
