Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E58416D87
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 10:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244647AbhIXITm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 04:19:42 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:36799 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244632AbhIXITk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 04:19:40 -0400
Received: by mail-vs1-f52.google.com with SMTP id h30so9207311vsq.3;
        Fri, 24 Sep 2021 01:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/3IfEQJiIby8GE/392VqcsWOtroXLW3OthQD6zbtdno=;
        b=ENkOqrabUK8Zj3D2ne+q5wH2atoIvczl3UmSb5YqzTYlEWDz4YrYh7oxd5+5m9gN28
         J86SsbWcHd9061KbZcZRlXBevwXbrFf1X1WjxEK6j9hcqVDUN2s4H0haCnCCg2Iq7oi7
         PSHcR0QIdJWd813zav2FE0Lx4qShYIaJAHvX26LeXNleC2/ywJTVYjb0GdfIawCZiMW4
         p3gkzdiF3W2vdd55y5Shx8wQ4vdXDOAVCLHvncQwAaKBe7KInkrDlovEKybQyTnKKYuo
         vkI3gOewGJf5QfQe8/a9XTgLk9ks95i5+ks075MhwhLbwsNecjtfMa8DHl9sMZOsoQ+o
         OeMQ==
X-Gm-Message-State: AOAM5307LcVo3TQZcN4qdutEFHnEGj1DIqquT6sKGXZdyHBGhFWPlts/
        C6jrQKoFHYxBsZmW7gzjGzceCGwJ/frkoa2ADBk=
X-Google-Smtp-Source: ABdhPJx2ZIbKoXWch/4CA9Lonmi68k2jEwvMwqKu8UkS0h9DoY4nY6cn/SHyOXDbCiNOrjmps6FWOb2GS1PHJOW/mr0=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr8346863vss.35.1632471487397;
 Fri, 24 Sep 2021 01:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210921084605.16250-1-biju.das.jz@bp.renesas.com> <20210921084605.16250-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210921084605.16250-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 10:17:56 +0200
Message-ID: <CAMuHMdVKXLCmEm6ZoWEBp+7LP6n1tKPombYxRrjQPZ-RFmHaeA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Add Mic routing
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 21, 2021 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add audio routing for Mic with bias to reduce noise when doing
> audio capture.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I'm completely illiterate w.r.t. to this, so will queue in
renesas-devel for v5.16,
unless someone objects.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
