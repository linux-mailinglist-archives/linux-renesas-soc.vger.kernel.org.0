Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE652D0E1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 13:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbfJIL6B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 07:58:01 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33428 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbfJIL6B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 07:58:01 -0400
Received: by mail-oi1-f195.google.com with SMTP id a15so1504118oic.0;
        Wed, 09 Oct 2019 04:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hOYiZT2eKXZFWPTJSee1+v6tjeFX23Tuj/d91OwpeuU=;
        b=bhXJ6S9BViREjSTcu90ZrpFxTihgdDluiRDBb1uuJiXGxl1SDj9fSx4aXnLW1ZpYhC
         HNFIfaZBo73C7Z5Xl7I8RIXYqq4VuilBS6iWy8x/8FCBD6UDY6RL2neDVfJ6gsgcVeKL
         p84wki2mo3Fq46+8KIEaDjF6ho+PrjFbKR3iIKw7Ud/BWpoG9NciYKq1vgHzOTkMpz7s
         aUuQ4MB7mqBVQksoua+gPnORLXz2/OCq6qjtvbdjSYBYdf15OIYGvFbx3jn3SvUpTtao
         I935YeeRGv2ztTKCAMkwxmaYD7xjZma+51fZKShoScNndWlUUQ3wsoDIL9IiXlsaOsuS
         rGyw==
X-Gm-Message-State: APjAAAWodh+h4Jna+h0hzpot6S7en9OCokSMmN45CBI/17wjneBNHXAs
        sevBKSyg5tnacAyszTtc9It8gwb/tUZZuXz78KI=
X-Google-Smtp-Source: APXvYqwPbNqwlKSS7UFXOgAr9J+uUsP7SRo05YvbvcugQjdYv+KPK0paU7nq9wQFJbSuFBDw5qnr9kLdSsGdiQSIc84=
X-Received: by 2002:aca:4bd2:: with SMTP id y201mr1980958oia.102.1570622280333;
 Wed, 09 Oct 2019 04:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <1569831527-1250-1-git-send-email-biju.das@bp.renesas.com> <1569831527-1250-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569831527-1250-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 13:57:49 +0200
Message-ID: <CAMuHMdWnwESZkd6UJGxb50Vqgpdihn6n4zXfnbgA6TbeoUg=Vw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r8a774b1: Add SCIF and HSCIF nodes
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 30, 2019 at 10:19 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add the device nodes for RZ/G2N SCIF and HSCIF serial ports,
> including clocks, power domains and DMAs.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
