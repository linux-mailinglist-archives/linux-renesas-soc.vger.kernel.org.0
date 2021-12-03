Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF495467B20
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 17:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239265AbhLCQU0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 11:20:26 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:41920 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238837AbhLCQUZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 11:20:25 -0500
Received: by mail-ua1-f44.google.com with SMTP id p37so6415249uae.8;
        Fri, 03 Dec 2021 08:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vTMdRIwsH/kDMVgc+slBPmQYkV1EPreftAfvOdmGob8=;
        b=o0GyXS/16GF68qA/OJFIQRmoks1VeDpOqxYDdXuMlNHgWdvwBpSpmuId3FyhI1JbDh
         nxh+HH5Re66VnMcUiujSG4DmejbFr8k5rAfiNNb42EMHxhjQ8Q3qy9KJSD6gxKIXq5nl
         cvTzeZorhuzPR2XRqbD5cs2ZrLChZLBhbltWU6XCPpamyqJgZsqKmoUb7Tdp2t+xjVwO
         b7amswERAnRqQdHk1x6wRFpfwkp7x9JeEqJVhNk9di/xkwujz8y7h7Z0TvGa2s17vhog
         B76FpX1YRBPbjElrCUQF/PdYbintEGyxiNrWxgeYhcOO88VvJxwx1bqijCXzJVVo23zd
         rFRA==
X-Gm-Message-State: AOAM532NuGPl20aQuhyewvCB5hNRJqK3FTce9gv1F0jYv07RaH+trwLB
        BxsV9Zb2aNIWFnOUnua3XXoZZBQtpHpk0pvo
X-Google-Smtp-Source: ABdhPJw7OxSrUDGoJf9Rp6oMprD5XJCI0qJfGdA/zJpBwoENVbZCz+k5JSfmdd6eGOx00VloEEVrPA==
X-Received: by 2002:ab0:20d4:: with SMTP id z20mr22802186ual.23.1638548220481;
        Fri, 03 Dec 2021 08:17:00 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id g21sm540225vkd.26.2021.12.03.08.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 08:17:00 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id j1so2195785vkr.1;
        Fri, 03 Dec 2021 08:17:00 -0800 (PST)
X-Received: by 2002:a05:6122:2193:: with SMTP id j19mr23812566vkd.7.1638548220004;
 Fri, 03 Dec 2021 08:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Dec 2021 17:16:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvGzEYO84YG2G6RWg8DHwt0FAMu1u727ooSJwfo_66pA@mail.gmail.com>
Message-ID: <CAMuHMdWvGzEYO84YG2G6RWg8DHwt0FAMu1u727ooSJwfo_66pA@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] dt-bindings: power: Add r8a779f0 SYSC power
 domain definitions
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 1, 2021 at 8:33 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add power domain indices for R-Car S4-8 (r8a779f0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17, in a branch shared by
driver and DTS.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
