Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9FA21D4E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 13:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbgGML1E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 07:27:04 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35799 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729143AbgGML1D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 07:27:03 -0400
Received: by mail-oi1-f195.google.com with SMTP id k4so10663442oik.2;
        Mon, 13 Jul 2020 04:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZfdrESmTkh44pExrcL33u4SHqgxscd/TdxVBNeiFI8=;
        b=M+fYUSfKfzooFJwQIN5/nEiopIrHweW3vPgROyrfqGWxKax1a7W9qe/zKdZPwKMy5m
         8WAkBNHHxRcZnMSZrcNGCf+9Xbcg6HLBzy3TB8vPjJNSJ6OAKF0r0MY0nbnoROXnoLHJ
         OTqdkMoqje3rVDgJmv+O10KZhoIJip+yq4/OXIBUSVBA/0BMfG7kIaAs6SrlCZl9QO8h
         x+ypS2hruvc2zUOetIaqrIzwvcxBdJVjUqz4kmXELbgjywFYXt98YAAW6E4ZrnOUoo7r
         UI+sGPJZ3rGvLOIt9qCTempoMqXvVMjslxWzGKRaIbJt11y1WiR+WI5CzpTK9eJ888+w
         YK8w==
X-Gm-Message-State: AOAM530gdG5dn8vqBYMhUkZxi29vPEnrDGC/f2AaYpIRz3tMSML9+4RA
        MBYnRNUYMXUsqww4zejj/yshQ38l16Bx5l71kjM=
X-Google-Smtp-Source: ABdhPJwAa+vsekdcbdiwbMA9snm8YofJa4TUmXKKH+oZAM2R4RD3MZVuzCKpKjtvYCyXBAHd59NorvzkCCAiGn3OcEM=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr13558051oih.54.1594639622718;
 Mon, 13 Jul 2020 04:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 13:26:51 +0200
Message-ID: <CAMuHMdXppLj2Fc4AyNOoSrF9Vb5GJTZKJui3ahmGnTy533qp=A@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: mmc: renesas,sdhi: Add r8a774e1 support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 8, 2020 at 7:48 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document SDHI controller for RZ/G2H (R8A774E1) SoC, which is compatible
> with R-Car Gen3 SoC family.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
