Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8210D0E64
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730546AbfJIMJj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:09:39 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41484 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbfJIMJi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:09:38 -0400
Received: by mail-ot1-f67.google.com with SMTP id g13so1485540otp.8;
        Wed, 09 Oct 2019 05:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIjSVBZmtm0Otik7JWZfUZ9HsFljLvwHz+QmgNOsc8c=;
        b=qdu8bllMfa/SYh/JiXtMFz8b+jqVO/FjEasefb2bBtJ5TLUnjgkG32o4OSjQWKyS0Z
         U/z78MOEzueOvZjzUpxyT3HhJ4K5HGbrrg8WKDKXnTZtQhoypiCyeXbuCgbk77PyTTCE
         14XGjR13bJpUa+Ef0jFOV9K3M/T3b67tobGPt0eyoyHq19iF6jJfsbaH9v3YwJZwrv7a
         FHlmM4mMXGx+qEhbq5YamXVkIi+4VsU01Wbjyjj6d8oC0SaDYN1fcKVT/TE1o8/pmCRo
         A7B5jOG55NLL4gk0RO4kkSnli6wGaqxJuYOVTX0kVYoTjBlOKLpC57iRyt/dGEJQwzFE
         csyg==
X-Gm-Message-State: APjAAAX/DTfb4Rr/Z/7XYblSoE53K9k2sTh298ZVvXjan9YIqMZxIV2X
        lnYV8NIBz9+E5E5cWtKYnBWB9zSBoJtXmk41JPY=
X-Google-Smtp-Source: APXvYqxLra08cpdJ988uLNoCE6mhhQC5Agmzb8H/8zZtO0yLIXlLuzrS9xX554mSQ9QOOYMDIfTGwAM1ygWcn/ZDda4=
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr2566140ote.145.1570622978029;
 Wed, 09 Oct 2019 05:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <1569250648-33857-1-git-send-email-biju.das@bp.renesas.com> <1569250648-33857-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569250648-33857-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:09:26 +0200
Message-ID: <CAMuHMdUGpObYsdNX2cVcP+5tTmOW_rVgL7KgQWfcZcOzmRxTyg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a774b1: Add TMU device nodes
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
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

On Mon, Sep 23, 2019 at 4:57 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds TMU[01234] device tree nodes to the
> r8a774b1 SoC specific DT.
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
