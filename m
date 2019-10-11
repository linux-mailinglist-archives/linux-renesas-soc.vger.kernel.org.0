Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C7AD3E8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 13:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbfJKLf6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 07:35:58 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43050 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbfJKLf6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 07:35:58 -0400
Received: by mail-ot1-f68.google.com with SMTP id o44so7642641ota.10;
        Fri, 11 Oct 2019 04:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eQSek2+Ho2Ulz7LNP3UdpjPuZ/YQSt2HjlRgL5fCL6Y=;
        b=d3FTUNpWqPpaRdt8FEuyUldr0i3BafhdWp1r8Zq0AAKsUCn2riz3SV1Jtn4IIjmHLm
         GZFylZ6ETs5fFWHzIAqVtpoEFLLdw6OaztYNoP31JbHARFdBfDg5YmjphbEA4GBTlC+b
         rVvvg71QVpGqKRH575rCaADqcxVMuRAAe7UAfP/nftQDWqDZVZmETRHYxKSQ8gwHNVVp
         tKEMWoE8nANFaTAHnqY52dbya0KxQk0UxFHYHZ34S3n21VXfMMkGdElrmpxlml43HtOH
         f7rVdJBmNzziqh6fy4eDbiyKrSHnMfK8QQHz5+LjQqK7ANXVHXnui8+sY0weQJ73Cg4g
         c8Jg==
X-Gm-Message-State: APjAAAUVlyMEizYCdYQ5JUm8YMGu0XDcR2aTRYpmwRym0HDKH60sJNVo
        Ime33vyA8+IZ+4QQ81UtPXBGj6Vt4L8KSI9wYZR0AA==
X-Google-Smtp-Source: APXvYqwzhaMNxsHt9lNC9D5mBZHX/T/3d317QVtdONRKrfd357WKkSloDwVAzMu5lCQ7i1vNHEvtgf6aeQxQsbqWjno=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr11357390otj.107.1570793757276;
 Fri, 11 Oct 2019 04:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com> <1570029619-43238-10-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570029619-43238-10-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 13:35:45 +0200
Message-ID: <CAMuHMdWnzydAvfdTD2QD=sHaRmN5HR7gsX60iJZTJtg_8mGK8w@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: dts: renesas: Add support for Advantech
 idk-1110wr LVDS panel
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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

On Wed, Oct 2, 2019 at 5:21 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds support for Advantech idk-1110wr LVDS panel.
> The HiHope RZ/G2[MN] is advertised as compatible with panel
> idk-1110wr from Advantech, however the panel isn't sold alongside
> the board.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, queued in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
