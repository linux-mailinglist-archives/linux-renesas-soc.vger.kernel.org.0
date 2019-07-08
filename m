Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8D5061F1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 14:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731123AbfGHM5b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 08:57:31 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35082 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730854AbfGHM5a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 08:57:30 -0400
Received: by mail-ot1-f68.google.com with SMTP id j19so16093523otq.2;
        Mon, 08 Jul 2019 05:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dst/ZKnlJ0ItyVrcpMtEKx56mLdW3e2g3M9apIYQQUw=;
        b=Fhh3vhRDiZrHUP8Htc2bTdQrfcr+kC6tyvKInTL89OahgU1pCHHWky4V5dxiitHrVc
         Sdo+ZLyExUn8jJHib3FaYG2YAgnDuUWuFh/FoHGDywjx7/13TMALRLQBJArav7NUDYX0
         L9uZQAzlT83dKuh+OPjYGVLYUVA4B6z+tpH9pKbxmQIfzbBPW+4H3v+VRHaDRJCYjUvw
         fpoqmrVEOSnd4VK5v+OXq66l1D9USNAdox7kIlVz2wQpKkokELmwBvR1WyXouHcZciqo
         hK2zM5NPK+V5JgF212zQTmkwoaeIatF3e16VjF8AmW9fm/sbzCfLWyFOIIPcdbQsw4z9
         qpnQ==
X-Gm-Message-State: APjAAAWUbLXGnE/USWpfyUCHCLi5pZBDKvEgbNnHzoIE49Jpto/LXoLJ
        eiKVC0bBl5s6XtdYOOlnB9PSq/v9+CiONkgt+qo=
X-Google-Smtp-Source: APXvYqxcIhSXj33tAS3UPQ6wQzAiVO3PbTTicd+0EncQGnXm2M4jep6X6Ytl/tLXpWbhEoRp6rhCpv/0c6Cr17JaPXs=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr2426434otn.297.1562590650086;
 Mon, 08 Jul 2019 05:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <1560513214-28031-1-git-send-email-fabrizio.castro@bp.renesas.com> <1560513214-28031-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560513214-28031-4-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jul 2019 14:57:19 +0200
Message-ID: <CAMuHMdXXd4_Vk5zH5TOYUuA7-LjCtMqFWbC2is1DCJ7TzXvOUA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a774c0: Add missing
 assigned-clocks for CAN[01]
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Fri, Jun 14, 2019 at 1:54 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Define "assigned-clocks" and "assigned-clock-rates" properties
> for CAN[01] DT nodes, as required by the dt-bindings.
>
> Fixes: 036bc85c1d06 ("arm64: dts: renesas: r8a774c0: Add clkp2 clock to CAN nodes")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
