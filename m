Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D67BF922FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 14:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfHSMDR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 08:03:17 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36932 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfHSMDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 08:03:17 -0400
Received: by mail-oi1-f194.google.com with SMTP id b25so1087162oib.4;
        Mon, 19 Aug 2019 05:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ijOFVusoTLOmU5ph3quXf2gG1oB8BslX0qrCBrJ/xi8=;
        b=P6e054DfHxHt8SDe+BerC3OACmfKfecIzmanvLzjlEWWTRWIuPkOhX3tROGN++1NHs
         rjr+CAAYYxrBD0B5JeXch6T0BFpLiMpVERa/SvcKNvKJNRTCsEboN0x5NcgwYvnYWwry
         LgYw0N2jMZCg4ueCUkeK+r8NL19CCekO/4flb7iEe7h+NrhtWteH5ABTSfoehnrIl6wD
         kyO8wd9yP16ThqtwRIpREPOaBC7KZnpK1LnupIR2i6NIyb6uFehcxuD8m7Q2R/j1lcHQ
         a/eaoY+Dec8fLF8vTLQ2uLPA6jch5aFrK9ppfVhXVRROuNGPl20w5EGc2pr8erY1Ss/o
         SkEw==
X-Gm-Message-State: APjAAAXQYgfDgLpHOAeqo64Z+exOW188WJayzVsww7+i/ItpFmErWEGd
        tlXVyyZYvBPeiT+4iZkupOn+6760PoAWzWcxn7M=
X-Google-Smtp-Source: APXvYqwn7d8JB0PZSyAMOAXPNrtAVqfP2DT4v1dniEWdLSgCoMSLbUTPZEQv+zB38SXRW98RRtJvEWb87FW1k4TIkJE=
X-Received: by 2002:aca:3382:: with SMTP id z124mr8844468oiz.102.1566216195970;
 Mon, 19 Aug 2019 05:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com> <1565867073-24746-10-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1565867073-24746-10-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Aug 2019 14:03:04 +0200
Message-ID: <CAMuHMdW9Lx_x=tgTXxpKAqTxY5w_b06y7Httky-ks8jj3zQHBg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Thu, Aug 15, 2019 at 1:05 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> The EK874 is advertised as compatible with panel IDK-2121WR from
> Advantech, however the panel isn't sold alongside the board.
> A new dts, adding everything that's required to get the panel to
> to work with the EK874, is the most convenient way to support the
> EK874 when it's connected to the IDK-2121WR.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> Geert,
>
> at this point in time no other board uses this display, can we
> postpone the creation of the .dtsi file to when there'll be another
> user (if any)?

OK.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts

> +&lvds0 {
> +       renesas,swap-data;

Wasn't that property dropped?

I'd be grateful if anyone could review the panel parts.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
