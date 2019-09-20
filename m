Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF1EB9430
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 17:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392894AbfITPkt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 11:40:49 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34749 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392871AbfITPkt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 11:40:49 -0400
Received: by mail-ot1-f66.google.com with SMTP id m19so4720633otp.1;
        Fri, 20 Sep 2019 08:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zsScXEUmySG43NT07756HjHrKgcNIGYVrWMRIGTV/8g=;
        b=Jx8gZpjCBJaLrRQSsTUm/D+s8N2uo59p10VBkUN9OdYDOpoWtdPGywfkeT7vA6EtcC
         U+RFxI5YKgQhFMQnYxajY04v4ocGbNpEVK32/sN+PrujRdkUoi7RuU4qYZLXhNyq/TgR
         rBcDeI9qdnRwC1TQtRk5XoB7qBy8LisbogIZfFp8RSNT47BZs1RGL02U39gOFchCixXs
         vOuvTvoQj2N8fOop6B1AKldZKvPcHUci6oU1B3A+DQ/TIzUsTRNEx6PQjl7jEaQitKkQ
         4vD++mkzG9i0vquPbR17eWFZWxlGVGbzZFGlMCfLjKdSv+Sk83TLWiflvB5iEKRkkTeL
         krnw==
X-Gm-Message-State: APjAAAUZTKBK6CkSR3XtbJJc0MfncpBVuPHQlXIGz9awSEWc6I4vpYIZ
        KOj9iYa2k/f7mo7DxiMB07YwmOETlWCCtzjHPlw=
X-Google-Smtp-Source: APXvYqztlaVsSbLvtVRamy1dDXJlCc3f3+817Lddei2383DYieWZ5Xt43wiUPdm+rFAcIFDYxauVygBSoLjU2mJfd+s=
X-Received: by 2002:a9d:730d:: with SMTP id e13mr7750691otk.145.1568994048908;
 Fri, 20 Sep 2019 08:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com> <1568881036-4404-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568881036-4404-6-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 17:40:37 +0200
Message-ID: <CAMuHMdXHx=Dbbk39ufdM-+byBHTjWByxcshcj1j2-fNn1LfnOw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: clock: renesas: cpg-mssr: Document
 r8a774b1 binding
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 10:17 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add binding documentation for the RZ/G2N (R8A774b1) Clock Pulse
> Generator driver.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
