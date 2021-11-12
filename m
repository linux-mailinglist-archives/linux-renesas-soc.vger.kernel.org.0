Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01D944E910
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 15:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbhKLOlk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 09:41:40 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:33445 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLOlj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 09:41:39 -0500
Received: by mail-ua1-f44.google.com with SMTP id b17so19336163uas.0;
        Fri, 12 Nov 2021 06:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RJ+UbO1XlTn+a5bEKrJdgxXRE0fGry1ajxGH+r1uHc8=;
        b=2K+0VX8h+lKzrXltQr9R6PtTmcYZgyqSsy8mT1zqhmfM/8+YyQjUJHKNm9q4NWBxS8
         RYtevtHuk78lbbXxrDZ61+lIX5/ZF+vz4j4Km/Vrp4NAaKHSUa3oTxq0xacWPn+pIJAk
         N/o6PuS/v6Xral00/bnl4AHojCEBAWx9mVPvdUykWQo3atMx+rZMN7Og3JfCODwOo/hd
         eDiVHnnrgZdLJu0ihZTxm9LEkOOHsSNjKDScn74S8fWKMl8nC5EEl8HiiAgBKJ0acNw4
         81w9ZycUEZe4cHycimOKBdxz89/qls9emZ3Q/Y9jVD7GkZrlLOKawvMeJUtbri8tZngp
         WjwA==
X-Gm-Message-State: AOAM533A98veHl91KmMfqMZ6PK5AwUNnjOnCo9yKOd3jH//yYXRXzp/s
        dzaYQIW2epIJC0YX01hge4bpCFpkk+SR9w==
X-Google-Smtp-Source: ABdhPJzOUAJIk/gaDImdp0HF5uBL5VoD5mgx/kDNRnCIWSAgqwEYFdAq6SeAqt4oyjvCERVm4yhW6Q==
X-Received: by 2002:ab0:3049:: with SMTP id x9mr22921586ual.55.1636727928167;
        Fri, 12 Nov 2021 06:38:48 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id y24sm4664403uaq.17.2021.11.12.06.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:38:47 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id b17so19335987uas.0;
        Fri, 12 Nov 2021 06:38:46 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr10597139vsj.50.1636727926568;
 Fri, 12 Nov 2021 06:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20211110153142.3451-1-biju.das.jz@bp.renesas.com> <20211110153142.3451-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110153142.3451-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:38:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuLrhi29L9BUxB=XrhORGtei-skxSXa5AJw6rwANXQ2g@mail.gmail.com>
Message-ID: <CAMuHMdXuLrhi29L9BUxB=XrhORGtei-skxSXa5AJw6rwANXQ2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: timer: renesas: ostm: Document
 Renesas RZ/G2L OSTM
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 4:31 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
