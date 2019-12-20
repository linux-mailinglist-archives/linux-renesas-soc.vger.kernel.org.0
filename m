Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA892128083
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2019 17:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfLTQUU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Dec 2019 11:20:20 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33820 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfLTQUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 11:20:19 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so12488619otf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2019 08:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0UubteF9HSn/CNJTb8i68Bsr20JigbJ/t6EehbdyX4Q=;
        b=R+/gJqbvDEWdF+hD1VChZLCTX2QaIyTkV9C3oxQG51/KWa5+BqlSyFBuf7Q7m2Ots8
         qdx84blaungM2ReiGmHib457JUyKfo5wHZCV3AFFgciRt/Pje8xj0U/4tAgrqGOgyjNZ
         r6sdugyqdCeUu27pHWa3P37aykQK45L+RSaNZmxB0shROPbxZ9KOeSid/50KXigpCde7
         M+xRTDKg/LcZQAMioKTylU4dYUlYuqsmPF+WlkUDrXAk/0sjDcqP8X86r7QEukDbvFIo
         60h3SiH64bwVRwx7g8yksgSKoSZWT+wzwtdGEQWuRYALb6DvR7WgIjxbT4VjMoZekCZd
         K3LQ==
X-Gm-Message-State: APjAAAXOso9jSFq0b3/uC3HtI7fMbB+qewgrpUZw+NrA7SfQ8/nIFkqS
        aAYLM9fT2+Sgau3lQeImZT8Dk3JkGwiuUfx2MKg=
X-Google-Smtp-Source: APXvYqxZOrtM7FuUyaUw0GuxZH78XWTNoQmBVKqc3fMyj7+wiRFM5cobCdRcNk7TotzkSMFmzUaZ64BumW2ZQ+AZe8Y=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr16174895otm.297.1576858818963;
 Fri, 20 Dec 2019 08:20:18 -0800 (PST)
MIME-Version: 1.0
References: <1576679259-20535-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1576679259-20535-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Dec 2019 17:20:06 +0100
Message-ID: <CAMuHMdX+KRoYenhXPoYS6wLaATfSitKYqYzfF4sBEH82Jh7AsA@mail.gmail.com>
Subject: Re: [PATCH LOCAL] arm64: renesas_defconfig: Enable DRM_PANEL_LVDS
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 18, 2019 at 3:28 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> The EK874 supports dual-LVDS panels, therefore enable the
> corresponding panel driver in renesas_defconfig.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in topic/renesas-defconfig.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
