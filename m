Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C3744E756
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhKLNdI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:33:08 -0500
Received: from mail-vk1-f182.google.com ([209.85.221.182]:34573 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLNdH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:33:07 -0500
Received: by mail-vk1-f182.google.com with SMTP id bc10so5099554vkb.1;
        Fri, 12 Nov 2021 05:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9iJ184pTnCaa6ehbVjWTeQI8DGobiB3mmOI1dCbKMU=;
        b=4reSoTStwVgAEOGFYpZ4St4/jBYfyQ43yu3iMDwRe5/8+11aApwYKA7e9P7OE+qCwv
         o1N0iHjzsmJ3yIrWh+X6d9njbDpQBEHEw7iOob50FrzEA20R21DgB/hs/E03xfvEjgBf
         XzsTNndUwollktDENONV2ZtJLQgVbg9XVD3r4VF0r06EYC6P9Xt4lsA3d1fLWnc+rAZA
         UAUqRqPfGfiW0xHsN26WgMqY7QCfiSf/QRuZ94bOdwl1qv9mpGkiT4XJjIUkU2inwxsu
         b7FEouuCF8AmxpGvQblESqH8/OncQNVd+RHvKTLviaR4CIusv1+lVDTMAIYQVkzWWipW
         0hzg==
X-Gm-Message-State: AOAM530SsBLdzWeQdZRj95lmWcaZMZ1ZNXPIcjM9/Fb0vudkHIPbjDfz
        WCDfJhlJpD+7A6e+jt9wbIFsH3UtcPRGjQ==
X-Google-Smtp-Source: ABdhPJwvCV/HDAC92+N5fksP6ZeM7kfzcXr17DHlkDHFn1AtkOXKAPnw0bOIIxfZhtHKLSqg86cwIQ==
X-Received: by 2002:a1f:a046:: with SMTP id j67mr23479760vke.17.1636723812887;
        Fri, 12 Nov 2021 05:30:12 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id u16sm4412552uad.2.2021.11.12.05.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:30:12 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id b192so5095877vkf.3;
        Fri, 12 Nov 2021 05:30:12 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr23730624vkh.11.1636723812181;
 Fri, 12 Nov 2021 05:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-14-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-14-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:30:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVWL3kYwtt3+c0kqzzvBcuo_m+gH6bXCahWsvAPkwsqg@mail.gmail.com>
Message-ID: <CAMuHMdVVWL3kYwtt3+c0kqzzvBcuo_m+gH6bXCahWsvAPkwsqg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 13/21] arm64: dts: reneas: r8a77960: add SDnH clocks
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
