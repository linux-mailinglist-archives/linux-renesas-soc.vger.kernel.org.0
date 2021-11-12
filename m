Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8629844E887
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 15:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235035AbhKLOX5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 09:23:57 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:39861 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbhKLOX4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 09:23:56 -0500
Received: by mail-ua1-f41.google.com with SMTP id i6so19092548uae.6;
        Fri, 12 Nov 2021 06:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d0xUKMNGAKW3Rv2NiR2CE/TSNmlcrsKAFcxfksPwJsc=;
        b=RL3vJ7j9iuORfEq6EvcizcD9TTu1NbRoAESKz+AflnMUvZkgCs8qC1LyF+bM0RM7Sa
         UO+/04mJN5UJDb49mhvaNr22Q+zq41feQuN/XQaUphbw2nMtGW52PFZ/fnqZfaxOksFJ
         t/TAPJnVGkRGtX7yWnBbsi/fKTHcbZ8MRkHm9XqzRmSMSHqgIGxunSG6AQfnaxLHzOYh
         kJfzGpdEsw0Wry2UsWd+HI80ru0o7hXEikqytqm2pU//PX0cOJUw42QDWkH+S0DbELe6
         u2AbDoJaNzYBrdihXB3c0+Hi9mEZCyuHOuXBuP2gc4VLmicGAM7lBltuM8RxLGsWY0DV
         D70A==
X-Gm-Message-State: AOAM532/DgTPe1eJwfTbzNIkU0vpWCOZ8mwn3uYFWy22SSz6zNDNAvrE
        2kiSUqOiSqrEC0o9Ek0F04+P01ykQ/TcqQ==
X-Google-Smtp-Source: ABdhPJwtAZ2nlUntcVflRIDcdzZRS/OxqcqCaQDDg9wv5sciVWz1cJv8uLClM814F9dGHZ4NoOjT1Q==
X-Received: by 2002:a05:6102:dcb:: with SMTP id e11mr10634002vst.8.1636726864420;
        Fri, 12 Nov 2021 06:21:04 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id p3sm4200321vsr.3.2021.11.12.06.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:21:04 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id t13so19083541uad.9;
        Fri, 12 Nov 2021 06:21:03 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr10408439vsl.41.1636726863321;
 Fri, 12 Nov 2021 06:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20211110232920.19198-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211110232920.19198-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211110232920.19198-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:20:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXhBpcL+VrLQCnSNvsdVWLACyBRSGaVKj+F_NZZBxGTg@mail.gmail.com>
Message-ID: <CAMuHMdXXhBpcL+VrLQCnSNvsdVWLACyBRSGaVKj+F_NZZBxGTg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] serial: sh-sci: Add support to deassert/assert
 reset line
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 11, 2021 at 12:29 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> On RZ/G2L SoC we need to explicitly deassert the reset line
> for the device to work, use this opportunity to deassert/assert
> reset line in sh-sci driver.
>
> This patch adds support to read the "resets" property (if available)
> from DT and perform deassert/assert when required.
>
> Also, propagate the error to the caller of sci_parse_dt() instead of
> returning NULL in case of failure.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
