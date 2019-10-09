Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24F6AD0E92
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfJIMUj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:20:39 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46273 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfJIMUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:20:39 -0400
Received: by mail-ot1-f68.google.com with SMTP id 89so1490613oth.13;
        Wed, 09 Oct 2019 05:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sMZmeZ91tc3eTjn2dCbCjSeu5TER9RNCYr25XhWJTFs=;
        b=erS7QNjbGA14DeF8w4OAnFU2H/PyvI3IGmNhbmm+F5cJigjkTbwbNdTpiVR6FyoGEg
         YehVSc1osFEFFiAcxeDAr3kun0EWmFo+QDlZAkM0+RRjwP819/QVoqI7Rtu37JlBf7AV
         0jgojLsZGDwcLUvUYcrxNnujNv1DrvGyYVGLMv5vLS8ANcR3UN9nOGDVJMEJMpmf85jq
         OQ+7Nn7IaFv5kmn7ABXPZPPshSyN4pNGRG/H2oheLxnVMAf9b0+FgPungWTuJE242iWs
         lYn2E+ICnomc9Y9qjZKZAYE7fuwd5t5Qva9hOXdJepC2eI2fkQ0XvdoPh82NpDryVrZX
         3cXg==
X-Gm-Message-State: APjAAAUblJLb7dCth/DPC+xAhTv26OCukLLDj6ZRmcBi5zub9zeu9RPS
        PQnhzN3tW1yOqyNuNvjAusqtNVbRZujkNW9A2iA=
X-Google-Smtp-Source: APXvYqxq+xUNzlIMTEsDZeRybnfFWzwOgNCiigrz3K/ATwM6cGXFjbS9nSoUVUZBtaf9Jsza6PXJBg28YzsNUb5RfX0=
X-Received: by 2002:a05:6830:1685:: with SMTP id k5mr2589262otr.250.1570623638580;
 Wed, 09 Oct 2019 05:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com> <1569313375-53428-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569313375-53428-6-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:20:27 +0200
Message-ID: <CAMuHMdW6c7k29vggaMDdpiz6z2zDFFY8M3KfhYX_8sJ1ueDqwg@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: renesas: r8a774b1: Add VSP instances
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Tue, Sep 24, 2019 at 10:23 AM Biju Das <biju.das@bp.renesas.com> wrote:
> The r8a774b1 has 4 VSP instances.
>
> Based on the work done for r8a77965 SoC.
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
