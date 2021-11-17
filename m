Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA72454365
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 10:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234275AbhKQJSD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 04:18:03 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:46790 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbhKQJSD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 04:18:03 -0500
Received: by mail-ua1-f47.google.com with SMTP id az37so4301681uab.13;
        Wed, 17 Nov 2021 01:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2yw0daN24K7Z3l7UJaapRLUGRejP8tOZUJiOqwwQGLc=;
        b=A9A4YeTpB1AkhgoR0o0ebxel/gOx/idH00182blEiDV/f1UjPOFcdXZn2O00AXneqk
         fez1270AaMFKRxK9UkobNW7KepHSzSpUvFPFk8CUCpohhRN2ygbN5K3YjGC/ZbTwnK8M
         EabKyvR8tw8qIPBUlUGs1EUU9jXBAbFBfy4fTzvgXAqFvlehEVNqLI/R0QJBAqCXLOV0
         D4iBvTYdhZeyrp/ndGbRfxVykTSXmbY5PDp+kJsshy677bto4FGHauEinmW7NVhKT0pU
         tNt6+JnY7T9cKLUh2+Rf5qhhjInyn1+kbfM/1eXxzyDD2Dcwb+eWkOfnhj+X67Fum5gu
         RZWg==
X-Gm-Message-State: AOAM531MFj+jQ7vt//JwgHB/qcF9BGXVO64Qq3q1S1YPu1h4lDWGW4/W
        /7BXCei8mXjtK8dWmeTfjfwgX3p+f8clUA==
X-Google-Smtp-Source: ABdhPJw9CVUa6TCIz54tqwze04Q1IdxV7ktHv2XEoL4/TVdVOMrivo1GEjflpj+ydqnOAqgcGiu6oQ==
X-Received: by 2002:a05:6102:4ac:: with SMTP id r12mr66053179vsa.32.1637140504388;
        Wed, 17 Nov 2021 01:15:04 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id y7sm13210876uac.3.2021.11.17.01.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 01:15:03 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id p2so4308494uad.11;
        Wed, 17 Nov 2021 01:15:03 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr66012549vsj.50.1637140503208;
 Wed, 17 Nov 2021 01:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211117011247.27621-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211117011247.27621-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Nov 2021 10:14:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxuVYMrgsN4cfLaZG=_nhPkwm-At97EcxX59cvTHrz4Q@mail.gmail.com>
Message-ID: <CAMuHMdUxuVYMrgsN4cfLaZG=_nhPkwm-At97EcxX59cvTHrz4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add RSPI{0,1,2} nodes
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 17, 2021 at 2:13 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add RSPI{0,1,2} nodes to R9A07G044 (RZ/G2L) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
