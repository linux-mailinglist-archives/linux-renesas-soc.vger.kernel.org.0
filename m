Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8128F216955
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 11:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgGGJm4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 05:42:56 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34828 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGJm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 05:42:56 -0400
Received: by mail-oi1-f196.google.com with SMTP id k4so34373319oik.2;
        Tue, 07 Jul 2020 02:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2/J9ij4w4oagOgUGxJf2swzffQYyMHL1ZD6eawMakeQ=;
        b=A7RqHF6hN7qRfL1T2xRTb+1SugOS9SaPD8LXNihrT5LjViVXbQ2CtBXt0FfrqQuMzV
         iXe4kXwAejRu6pCWkwpS8q3tgI3sNki+/8IoS/ai3weIWNFy2jovDeM6pPW0KL5KRq/s
         WL8CPL2xxt3/6PjylQnb6qr63/I0RGQerdQlBfUjJFBlftIgNJWJeXVsyXN+kPdgivAa
         yPJrfGKr3G78hy76SpzsFS92nL5gUz6tmK1BE3W4vKxDelx2bsUaKkp8B9drqqv4M5YE
         gPbozgqiqdXHx2COblzmSFoMfOapzqeANcGep9e8jCDlQf9zsC35j0GqqTJnzPpFBPLB
         pM0A==
X-Gm-Message-State: AOAM532W9l1jE3sLhEUygNQIxEiBdZcLFgJ2vsFPCspXqXGUXvGqciic
        hD1zdIG98u2vQhAZ9UbUFGPm7FowT6lUlVVRAhw=
X-Google-Smtp-Source: ABdhPJy2sAY8y96MGtqbaBxFvL6ldE/wubkaiemNPB89fcdaX9osclLvSlDRk9Hhu2YzHF4jw/L08DoYguxy4kLxxmc=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr2622536oih.54.1594114976070;
 Tue, 07 Jul 2020 02:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <850d4a7b-4984-eb0f-de89-e5c39d61d19e@cogentembedded.com> <f18853d9-8ef9-717a-9039-2191b26e579f@cogentembedded.com>
In-Reply-To: <f18853d9-8ef9-717a-9039-2191b26e579f@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jul 2020 11:42:42 +0200
Message-ID: <CAMuHMdVBNqCsHE0frgfv3fwC534uhgyvA-vO+gxhDT5qJJsx0g@mail.gmail.com>
Subject: Re: PATCH v2 1/2] arm64: dts: renesas: r8a77980: add RPC-IF support
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 19, 2020 at 10:13 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe RPC-IF in the R8A77980 device tree.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
