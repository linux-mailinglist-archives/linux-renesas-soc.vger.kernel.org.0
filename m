Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3BD841D06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 08:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407172AbfFLG4w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 02:56:52 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45724 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfFLG4w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 02:56:52 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so11167355lfm.12;
        Tue, 11 Jun 2019 23:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pcg9vO0F5Uy05vwXRYU1W6YzDLQgrgBv+1bXWAP/r28=;
        b=gNqGRAhV/2OIE+8yJQl0T/gr1rXcsc2bGAtTLkpeeUbgQ4N04WjNdGFs/Fk4B6teb0
         pCP9WctzPJHDlQwK/6rU3bTt0MjDv4c/+TpG5+85m85jILgvhRs9t2QAS4EB566KSS+q
         /BJUFNexb2psXwZQ0KeMiv/U3c8rQMMyBhWBn7uiuPvQiMPKfCBiGdxMwKj4guZy0S5U
         Jhzfrla/UvwWI14ehFO2uH73csr+JyDln5pur7Gsrc50IK8/pFrC3MsofUr0JOM4jVYn
         qTD0A8bX/XvVZ37lxLOQZwQtJGe/1I/JwQDZirrSFIpvQYfJGXhow3UwtXDeiawcb7hs
         6NWQ==
X-Gm-Message-State: APjAAAUJigO99/J5tPis0CU8+BAwM+b7zceOEjWYEvm7WoB67KX94Hyo
        se92TIZ8kcYY+R9UH52gWe+onbVg6eZM2DECvys=
X-Google-Smtp-Source: APXvYqzQZNpGrjm8ZQK7jA47/gjz1IyzL+fY0Xnb8/PsqxWOE3NJEhFt4DNXskimcYz2ZAsNxjNHDZUSJGKymlusMi0=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr16770554lfn.23.1560322610289;
 Tue, 11 Jun 2019 23:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com> <1560258401-9517-7-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560258401-9517-7-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 08:56:37 +0200
Message-ID: <CAMuHMdVHNv4-x_xdiX_ZbQk=oK3S3ZiNb9_Ukb9L-GGc743O0Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r8a774a1: Add TMU device nodes
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 11, 2019 at 3:07 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds TMU[01234] device tree nodes to the r8a774a1
> SoC specific DT.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
