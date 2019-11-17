Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61775FF8A5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2019 10:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbfKQJUA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Nov 2019 04:20:00 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42482 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfKQJUA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Nov 2019 04:20:00 -0500
Received: by mail-ot1-f68.google.com with SMTP id b16so11854333otk.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Nov 2019 01:19:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kzGYCQ4Pd5uhSAWGAqgMQR7uXDgZgBWQSN+yuPE4duM=;
        b=AIzcOWZtERNQL/C4WnDChADukmK9VRRY/fPPpu0u9uQwGN0MvEFPF7sxaLVAjP7+Ir
         gGrMh3MRPqIHa2wlAdYsEQmpuPFUEal4Z3Fwm9pqHCbd2V8kewQoJKrlghlENS9de37x
         aNAqxmdSLAAjdLxUa2IPIqzMuEb9mjcJnFy7rYYD86bYRnHygDcK6aXEo+9nd/WaCrQj
         4gXaHpzZOxkAmJB/SXM1W2EwIf0zL83YcMUUDtFZu/Badk9QtUICjA5WzOU/btUG1+lb
         Oil0JVpTLHzJMpIZ0DPuAl4Ln7EPHwtRhTGlZ3mXSdIvWQU3ZzEa/XvSmVhVEPoruJuy
         docg==
X-Gm-Message-State: APjAAAX7pX7+6+mzCa8DZKC95BoRmOp4c2tyAhOO/1ElRM1pe8YCMmev
        kBpHvd1oQjbSDlPm4LODoIVB231xKWVIwO+QQVbTWw==
X-Google-Smtp-Source: APXvYqw16JWFXq1iradRtcY8u/wv4hH4n4EtgRUr2VXqU+l8zI9yG1+BTm1AKHAdFrCdzZ83k7KP989+lhoBOQO9LkY=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr9830964oth.145.1573982399301;
 Sun, 17 Nov 2019 01:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org> <20191116165034.39001-5-jacopo+renesas@jmondi.org>
In-Reply-To: <20191116165034.39001-5-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 17 Nov 2019 10:19:48 +0100
Message-ID: <CAMuHMdUne50U_fVZDB3+9wcQ809uhzoTPRTV7Gjbkj_887_q6g@mail.gmail.com>
Subject: Re: [RFT 4/4] arm64: dts: renesas: r8a7796=salvator-x: Include GMSL
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Sat, Nov 16, 2019 at 5:56 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Include the Maxim GMSL expansion board DTSi for M3-W Salvator-x board.

This and subject says M3-W...

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +

... but this is for the (rare) combination of Salvator-X and H3 ES2.0?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
