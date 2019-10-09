Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C31DD11D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 16:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbfJIO5e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 10:57:34 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38203 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbfJIO5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 10:57:34 -0400
Received: by mail-oi1-f195.google.com with SMTP id m16so2003042oic.5;
        Wed, 09 Oct 2019 07:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S0mjj61pjl8Z2+bI/poAjgaDtWPBdBYv++ThqivtWyc=;
        b=gWCc6x6y4fr/GC2e2lpDk6rXRe1onAHukOvR8brX5XIC61uJaYYDDFMLIRtpNwHvdy
         A09MQWDStrsxGpEfG6NLXlRmDccBRPG6EJOVo4FQI6sfqI1M66m3UWjnOSNV9KpUkcBo
         ZsnlAxB2ZXq3U071gXg1vrYR5+fON64IfrUdgMYfpw8j2kWjNJB1DPKuN8CMG77STr5/
         RA9GFsTxI8Ij5ML8pPFrMgSzDQsjOHpnRE1uemIKX8NkGZckzqzb3tCgdYFe1uxFuqkl
         xnGPiJJscl5QHuiSZc7fBSinGUaDmarV/sNyKrJQ4C87YM2KlgeRvxHPFtVLzpTAYmOB
         HvnQ==
X-Gm-Message-State: APjAAAWS19Y59+FMLAdZcIdUMEhCtYy85ALRcTxFHl3R9+wANilacZ+v
        ZyTP/Aq7cqsHFgcr+de6z/JCZP1lJZ8Da0h1qrM=
X-Google-Smtp-Source: APXvYqyIp0VHiNv1dXN+PP2N+gXpRos5ibqoqHaM0fwo1bh3iRyX9Unqv7AoNvfdGTmxvK/AVSnQDrFbJaISqCSdC7Q=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr2586543oiy.148.1570633053102;
 Wed, 09 Oct 2019 07:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com> <1570029619-43238-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570029619-43238-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 16:57:22 +0200
Message-ID: <CAMuHMdVwEuBoeBu7B9MJo-P+jApuYpS=pfZCMKyiWYML-8PuzA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] arm64: dts: renesas: hihope-common: Move du clk
 properties out of common dtsi
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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

On Wed, Oct 2, 2019 at 5:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> RZ/G2N board is pin compatible with RZ/G2M board. However on the SoC
> side RZ/G2N uses DU3 where as RZ/G2M uses DU2 for the DPAD. In order to
> reuse the common dtsi for both the boards, it is required to move du clock
> properties from common dtsi to board specific dts.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
