Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB3334315
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 11:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfFDJXu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 05:23:50 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42611 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfFDJXt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 05:23:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id y13so15875980lfh.9;
        Tue, 04 Jun 2019 02:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WEKyb8uTtW2nlixza2b1BlJpCFBifaSgzv/gxrO/6ig=;
        b=GNeDiTWVgsAZFAmgADmEBgqkx+XU7jNRC0ceUpGlsFtK73vs5uSafjv9fysnpMH4Tk
         pnMiSoXUksk69BacuYWTkDtQyBpxw0mBWAxzIf8WvkXUAEIAD+hh9qrSTk1USt4tMSJP
         neyqokNqTN9Ww3dDfWlHrTQ5j6pRq44aHbD7xhe7yLzqDnLr56rlEIGm1FGv2d4ZQ5xy
         4EmMx3FPqn4KoyAvse5gDzv0+zp54VcndavfEsgnA65kOW58D5MrOCcQU8+XxPTdE8cT
         RI1StvryIj5d/xzx0zmancpjUnVfqS9xxR+4jYQqesv9HgfqFP2oFbet6o9KvxOIIHAv
         asxA==
X-Gm-Message-State: APjAAAW/4tnJPlmyCGZfg/PgM5k12KYBKZ3jFDS+DQlxiXnPoURZieto
        MRi3R4+cjXo4b4ReqkGo/NO2S5Ew/BeUJ78/q/e/0cE7
X-Google-Smtp-Source: APXvYqyIxr36IS1LAnUxZlMf951L1abvvle0io4evXb2lWXMADRTLp/O8+KlJT32mDqkGg8eynLJnJiZyeiAdNC9O4U=
X-Received: by 2002:ac2:546a:: with SMTP id e10mr16257154lfn.75.1559640227823;
 Tue, 04 Jun 2019 02:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1559621375-5436-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jun 2019 11:23:35 +0200
Message-ID: <CAMuHMdX7CBOZsJ5YwLeN7ay=P8z+o6kVK0W68gMXXyqo=XOaLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: renesas_usbhs: remove sudmac support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 4, 2019 at 6:14 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> SUDMAC featurer was supported in v3.10, but was never used by
> any platform. So, this patch removes it.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
