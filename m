Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81BCBD12D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 17:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbfJIPcE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 11:32:04 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40751 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbfJIPcE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 11:32:04 -0400
Received: by mail-oi1-f196.google.com with SMTP id k9so2104355oib.7;
        Wed, 09 Oct 2019 08:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pj9tjAnDc8iLQihhsMD5mfW9PPSTfA4XaUb/MOWRYIw=;
        b=AAxTZdfkp8E59/y4BrjgmywUnhKETOP76D0f1jXZcfVqnJ89A2XH3TGwqtoKt9rQhe
         sW+Pmbq2LE3l18rpTKar7pP6aGNg+F3KRyXEb0aCMxgTVF1Yg9pzq/eMDbVRlFKAKKjX
         3qt1KPLVwXMZdu6kcIDxdKNteLebLmG+NELmpHlEuxCjCjC5XyT/lLd4hMiV2kObG+Zo
         EmhWlqXWEDUs3PP3hcPUvNvWmbxsCU0E94skbVF2mosIFqkTuf1XX8770bBq497h7aVL
         SJsvv1sg+qNmGAEoQGYNKkqCoXL7MJc9pGtQQh6CzhlFQNoF4L3DA1pv3R8Qxb3a1XnU
         eQ0A==
X-Gm-Message-State: APjAAAVJcJElPdEMposT9iDsJFke4qCTIaHP676o+d8zyZY9wDXxDrdL
        Spp7iRqHjWestc+zsYDe2lfA2bAz/IAUpe7yhYY=
X-Google-Smtp-Source: APXvYqyg0DPnkodAIUWYnwxuCI1rQIZYcBCt+bZis9NcW1GFg24xT11r34A8e3ZC3j752zjco0fFSC/uxrAdeFBEuRM=
X-Received: by 2002:a05:6808:3b4:: with SMTP id n20mr2808137oie.131.1570635121721;
 Wed, 09 Oct 2019 08:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com> <1570029619-43238-9-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570029619-43238-9-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 17:31:50 +0200
Message-ID: <CAMuHMdWWekewwvASHv+XPdUqFtUUBiHVG9wNi8h+uwMKKnO_6A@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] arm64: dts: renesas: hihope-rzg2-ex: Add LVDS support
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

On Wed, Oct 2, 2019 at 5:21 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds LVDS support for RZ/G2[MN] boards.
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
