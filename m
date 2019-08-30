Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED79A37B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 15:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbfH3NZv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 09:25:51 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39639 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbfH3NZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 09:25:51 -0400
Received: by mail-ot1-f65.google.com with SMTP id b1so6893586otp.6;
        Fri, 30 Aug 2019 06:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ONcxjA/xj5zjcYYIHoKaRWyZ2UyvDe9PGkmssJa9Wjc=;
        b=nXA5/VMaHXil39u3hrhOV8FzXQcK2KiQZ7prDcg0SlE2rGd0VC6VQJ/kJ+OmQ1EVXH
         XDU2VcIpwpymYpFd1ovSXUIxXxWKpvWGTDnzH0lYURMvHsMP8o4ld+RCzaVNPpd3kw6w
         VEIoziEmWgksq64mt98a+hA/ERL7iOq9KFaMfCqSx+m5TXZgkQ+lzE4UMV/FHBhZCjH+
         82tk+prNjV52qqotX3TanY5UEj6I86hn99DPs7GH0KXqtfP8bMlTMZHBwwJhHVi+wlTd
         19spYmdB0PoRQRfVN72GSIoWzFQDPET12RqMo/ruszW0H5px1fuGP2fvwihJXgettx/y
         1JKQ==
X-Gm-Message-State: APjAAAXXRgjwHIDa7Mc/gK3oUQwf1ynXrRoy/y4z6cmfcd5TUiIkJblA
        2+JLTg/hO97zWvmHzZOcbTaChn3e9WiKo2G3MZ0=
X-Google-Smtp-Source: APXvYqz0Cz34xoZDrBsu1TbuTzbiUDn+xogmAbtOvJs9bhp5Oh/MRI+yJUDTF9Kdt6pkfSF4j3BXylaK/kduxPwx3QU=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr11619950otg.107.1567171550260;
 Fri, 30 Aug 2019 06:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <1567170935-19186-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567170935-19186-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Aug 2019 15:25:39 +0200
Message-ID: <CAMuHMdVtkBtVpXo2eCMbZ6MEJskeLHYgC4O=p1SjwOdkHLakyg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Fix eMMC status
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, xu_shunji@hoperun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 30, 2019 at 3:15 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> SDHI3 got accidentally disabled while adding USB 2.0 support,
> this patch fixes it.
>
> Fixes: 734d277f412a ("arm64: dts: renesas: hihope-common: Add USB 2.0 support")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This is a fix for v5.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
