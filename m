Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4787A3C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbfG3JPx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:15:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36871 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfG3JPx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:15:53 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so39829405wrr.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7p0S88q6+XKwX8nM1vn9ytVwUof8aNjUGgnKhdm0yLw=;
        b=AYgGnsNnK7beo13V9RR69eXnhClasdI21iBeexMq4diSlqsjoexGUz+PWfRCZe31j5
         9h9Zh9EY0HrDDJrrIsNgAgJAKr15l79XzYJOOXOVM48vOM017D5r783up+1CVEjI/Sie
         cdxjerLbkcOLUdrJ4cME9DAPD6W9l0oFJbKbDUvfMLLx7u9D1IXxtlsFe4IUMArz7To8
         LEeMpXHgnDIwSiPo+EM9T1ndtVS319fmMBBuUAFpYzmqRY35h3rBfkNKncl+6QW5wxXG
         6l1sR2WR7f/xy3V653o/66WW2aIfnbWDad4m5UPYUj7V4+W2joTQFj/DrAbcHHMmuRyk
         iJtA==
X-Gm-Message-State: APjAAAVll8jicwHUrg6EdhjWmh/WvYqqfYJjmNGFl4M7ZUiO2KXS/r5c
        y4sqyOTVzUOJjuZVeZ2HLItCJMjouUsnlhXRc4Ffz5jF
X-Google-Smtp-Source: APXvYqwFq8tNlizKa4xwwnwOIsApULbIfdjo4PywI+8FPcpDJoetPdAip7VupgqUk3oill6YxGGIPMtZ5oH3osoVAt0=
X-Received: by 2002:adf:ab51:: with SMTP id r17mr100214527wrc.95.1564478151165;
 Tue, 30 Jul 2019 02:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <1563816172-17864-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563816172-17864-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:15:39 +0200
Message-ID: <CAMuHMdXCNk918JKdudm7Ww34aRGm34zUh7wnQ4=PDGN=XK_Ncg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795-salvator-x: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 22, 2019 at 7:23 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
