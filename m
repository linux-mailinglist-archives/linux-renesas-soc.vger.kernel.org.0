Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F186A3E582A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 12:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239802AbhHJKVV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 06:21:21 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:36598 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238988AbhHJKVU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 06:21:20 -0400
Received: by mail-vs1-f43.google.com with SMTP id y65so1569144vsy.3;
        Tue, 10 Aug 2021 03:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l1gBoiYEO7XbkRs8hlFE3qe793CSdQbcY1z2rTY4odU=;
        b=gWRnAcOQk9Pex17gjG0S/ABGc8h7dC4xQDvnTqANgZjvI8B2q4RMD+MHUBy5973i3h
         2ntf9bcoUKwbDflhbV+0oaw5d90qnUOiDWFH0ndfFHyoSXN40BPo9+Q+diqb5citDSD5
         GeKg444LRioVVoXvSnWhN464/6FY7Tz4tM7ZjtoLhe8zoskwxfohimQJ+3BQYFKpAX7+
         DDRAKp89Gl3gT3lEow7PfD0AqQNbcmp8MdJffCgsJ3jeViPAzvkQsDXJE6CQAC0iIkKa
         7wQtIq8Da5y3rsk0oLVivzsmr59YYF5aYBO8OqhcjK0fRtbxUCJs3yq0fCH5ALApCW0t
         7hgQ==
X-Gm-Message-State: AOAM533My07AuOD1YCdQDSr17F2VnBgqCRtIm9/hC1q8l1pgqhVayLku
        EDup/TlOutkiJJzeu4sROBIrW6AXBvJkp4Chu7Y=
X-Google-Smtp-Source: ABdhPJzOym84ueJA1uKY9xnfxHaBxHX6hUvp89HqSHr+H8RurhngSChw9Xes3S5wV6h+vA/1VtUSBq+Od6PYuOZNVR0=
X-Received: by 2002:a67:ca1c:: with SMTP id z28mr13062605vsk.40.1628590858048;
 Tue, 10 Aug 2021 03:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com> <20210727185527.19907-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210727185527.19907-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 12:20:46 +0200
Message-ID: <CAMuHMdVgafPA9YT7gkqcZidJar+Mpb_m1DyYFqb6PXMWGfZQbg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] arm64: dts: renesas: r9a07g044: Add USB2.0 device support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 27, 2021 at 8:55 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add USB2.0 device support to RZ/G2L SoC DT.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
