Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F17D0F0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbfJIMpB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:45:01 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41463 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbfJIMpB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:45:01 -0400
Received: by mail-oi1-f196.google.com with SMTP id w65so1593223oiw.8;
        Wed, 09 Oct 2019 05:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KI2p6yASvaa53fTG+HGDyVmbz9VBdc/XhEdF+7bJLpI=;
        b=AQdBR+dVIH12zKB2lIZ8Ce0Nr+r8VSMFILdAK3ezrnbmdetrtawHVnyJjz19tP253N
         Eqfst1ZTaAUmDc6/QL7WxlIoBm1kaOilfTpGASEf++g0wuYzLCaxFNUfvRrM2gLBcgh8
         o5NnrZgIbuu4N7zAKh48dgzqjwAlYgqrTVoYFh7L1Tbwy6/si1uPK9IXudSkt1MuvWtj
         iThkUlrBzNMG5fn0/ndGhQcw2EYS8cMxiaNAKO0NU6L1H/NabjLaDYsCvE6hvpQcekWX
         sl3uhNG86NbN121vt092ofh1EK/0kHyTE2h5CYWxCfakxGofjtaOPuQWcBHM5rEjzrRF
         OmAQ==
X-Gm-Message-State: APjAAAWpHEsG81nNcEyDSgtb2FkfGuBWe7PPUjSqrDmWxdIvvgdYaJVY
        jvG0d32oP5gJCad8uXctRd9V8N+sLb5T4NvCSSE=
X-Google-Smtp-Source: APXvYqxEj2HnZNWzHde/r5mgE0N27aWCk9SXL9AnWoYn48pZFbauH2+D//6NXwuEYdN8EGAugaCUknZRU6R74kGl97Q=
X-Received: by 2002:aca:882:: with SMTP id 124mr2135720oii.54.1570625100245;
 Wed, 09 Oct 2019 05:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com> <1570029619-43238-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570029619-43238-7-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:44:49 +0200
Message-ID: <CAMuHMdX3yNxX03F0R-dHGGPAN1Yk3cqcQ11fmNyP21qdF+gi+g@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] arm64: dts: renesas: r8a774b1: Add PWM device nodes
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
> This patch adds PWM device nodes to r8a774b1 SoC DT.
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
