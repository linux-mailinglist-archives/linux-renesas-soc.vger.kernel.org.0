Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B191944E74D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhKLNa5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:30:57 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:44957 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLNa5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:30:57 -0500
Received: by mail-ua1-f44.google.com with SMTP id p2so18730195uad.11;
        Fri, 12 Nov 2021 05:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9iJ184pTnCaa6ehbVjWTeQI8DGobiB3mmOI1dCbKMU=;
        b=Sk97xZahKCn5uG+mxtFcV2ut+m0g42roBdEzcEheY+og1ektTuzpeigcQIaYqIxmvW
         HqYzEKxNr0vTxWfUWKdwW6IhrQlN94c2gCyFz1ZvYIwkebp9TuyCRWLGq4u/uwWsNpad
         nCEG+9eBRRZlgTMj+Qg7jLgL6ziIkDjC22ZahaUlN/vXV82FOSz2bCZPQt0df3wmtxgS
         Tfqjd6Wbim7sLIxrZ5yy50EbK43dNsw5oEy2amAP1WSGyXTWdRB+RkrCDA/UdpDop24D
         YDhVWOiF1MmBtxZPTXUH47mR9Hrl7ZJsQ5vZjYVu/t5sDVufkErzU26ywymcxRuC+dZI
         9Spg==
X-Gm-Message-State: AOAM533Pnpzz+6/VFqimoUYeO5tf/9PuX8kYR4FYNiMTjy8RRRgSgTX5
        v6dqEKkCM8+KnZgOd3PX4KeCV2r3ftaUPg==
X-Google-Smtp-Source: ABdhPJy/pJh52OckUpgyUqw+AUf6r1+L7KFFy8jCmXGun2d+KPGlQQ6sJVKTsjkIwLJJjeEkkMkqKg==
X-Received: by 2002:ab0:6354:: with SMTP id f20mr22743532uap.116.1636723686106;
        Fri, 12 Nov 2021 05:28:06 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id p18sm4178446uaa.16.2021.11.12.05.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:28:05 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id p2so18730127uad.11;
        Fri, 12 Nov 2021 05:28:05 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr18067621uar.14.1636723685377;
 Fri, 12 Nov 2021 05:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-12-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:27:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSG6E0_1ZBs4EE4kEFDAjqMYp1yji0DPpgrk2Wqufp5g@mail.gmail.com>
Message-ID: <CAMuHMdWSG6E0_1ZBs4EE4kEFDAjqMYp1yji0DPpgrk2Wqufp5g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/21] arm64: dts: reneas: r8a774e1: add SDnH clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
