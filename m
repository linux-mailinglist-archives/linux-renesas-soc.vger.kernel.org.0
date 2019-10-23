Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478CAE12F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 09:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389459AbfJWHW1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 03:22:27 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33838 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731524AbfJWHW1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 03:22:27 -0400
Received: by mail-oi1-f194.google.com with SMTP id 83so16542084oii.1;
        Wed, 23 Oct 2019 00:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TOaUWyi/x9JZGeLAJtv/bTsxt59bZqT5nf8AkAwdah0=;
        b=PasBKWcsWtOxaUcd3g5c5Y9cea1AmFsYgIg6FUvSwgdLmXyK7Ee12Kx1/KU0TwaOKf
         oOHF3JnrMB+AmTjhWN0lGkU4FQxZotQme4x6dMz5ApMMuNHLfikXExOJJB0DTWx5KXKy
         UcyD5Z+vCO7DfCC83rLJCR4/j7BgjquCZH94uGi39BVlgpYTp8hkjdiENa/zpfl4pHaF
         P3HXb+BjHL5noNJsdaxfGOIWk6hlWTy2WYrU/7bXxsdMCDVUqvRSIDGjn006QAAtsVE4
         M/rsPwBrmPnMeTCThI4226Q6p+6fF2K7z1pyok0z0L6G79bogrhgFvjeI+ybqo+M9vB8
         oE0g==
X-Gm-Message-State: APjAAAW7KNj+tRvbFZPWf4N5ylGiPUV18hlCsSG1MbhE6YxiF15zSDn7
        flwJC9HPydRxT4ldvEqBgpP2is1DQ8/7X1cArSA=
X-Google-Smtp-Source: APXvYqzsr3XeKcQn61PFHf2SGc7J2g+d0f3gAwX4hrPcrdjZJlMXSyaeDBlcX+lUVj31AitjhNwWrzH38NO0lFIscTg=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr6106926oiy.148.1571815346600;
 Wed, 23 Oct 2019 00:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <1571761279-17347-1-git-send-email-fabrizio.castro@bp.renesas.com> <1571761279-17347-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1571761279-17347-3-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Oct 2019 09:22:15 +0200
Message-ID: <CAMuHMdXOr_kyZbva5Es8awh9J63w07KS_iJ+J_2bCyBKxB=uPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774b1: Add SATA controller node
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-ide@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 22, 2019 at 6:21 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add the SATA controller node to the RZ/G2N SoC specific
> dtsi.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
