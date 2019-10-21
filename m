Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39C9DE863
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2019 11:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfJUJp0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Oct 2019 05:45:26 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38384 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbfJUJp0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Oct 2019 05:45:26 -0400
Received: by mail-oi1-f195.google.com with SMTP id d140so6177976oib.5;
        Mon, 21 Oct 2019 02:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/BIVqRe9e1+qbtjf6nQVgiNUhRVQqnsmqtD0b6QYouI=;
        b=q3xPbxL8ETtEdZt0JEUZS4EMdXJyIX+nEdImRlM4YYa5n5xRcaRi8goVD8K9afOavr
         YtUPUjmBonnSzd4+L0TRHcWn5I6XkMAP/Giy2Uol/j6KWuIKZoMt5d1WrjAbOwKbShvC
         Z4kQV+TnLpzSL9EQd/6U7X07knOILhl+D76yOnyO1uF8HQ6zxLwhjbgwQDGhuH1XvH6F
         lj3JBZs0LPACt+WOZFrIebLcy2P01tugr3a7jI8qb8ju6fB94FFEz3TfjqUx9kPIb+Tk
         jaPiRsHbIJf8HQDcc5ggI7LmQwrz0QMpxU9FnAITDSGbF9YTO0HXFKHJimx9dtX6LMGh
         1A9w==
X-Gm-Message-State: APjAAAXs+E6m9gYnCqDuqXH3tmEUTuiXC8y3FYjNHLRPSJSxrPYmB7Hh
        papkAtSR89MwXeoJu6FfdtEsalcdGA9mkT4AKsY=
X-Google-Smtp-Source: APXvYqxJ2L4jZ16pz4ZsoqrPbc4GHvuLiMLddP5487vlSqcSPVRRbYGdo5234WGOxjQEIvYBDBWz+jSUeMq6YbJVmGA=
X-Received: by 2002:aca:882:: with SMTP id 124mr18761031oii.54.1571651124951;
 Mon, 21 Oct 2019 02:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <1571137271-33973-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1571137271-33973-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Oct 2019 11:45:13 +0200
Message-ID: <CAMuHMdUkAOE1e5f60pmA-r5ZXRz1ZM=epPdKnja_BkmiwBXzmQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774b1: Add VIN and CSI-2 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Tue, Oct 15, 2019 at 1:01 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add VIN and CSI-2 support to the RZ/G2N SoC specific dtsi.
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
