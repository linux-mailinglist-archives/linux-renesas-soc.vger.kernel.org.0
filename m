Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B11D721D4DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 13:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgGML0H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 07:26:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36813 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbgGML0H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 07:26:07 -0400
Received: by mail-ot1-f67.google.com with SMTP id 72so9239170otc.3;
        Mon, 13 Jul 2020 04:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GNJ8ThYaQ5lrrM52EJVJL5uwImSFki6WJZMfzYM/MVU=;
        b=DVp2cLyeVif97EJ6SFlWA7KjzT5Iju5Gapgjc5NlR0YJugAGoAiUYEx6UYrnTyfTF0
         AE3t1QVO6bUWpyBFGW2MqMi5Bz7Yu59XjCyn2KFI76wAQxevR4+cht4rEiztX29ZgqTY
         91ML+qg7doWwm6zO2zQt2/D+Y/4D8N7zBHK/SQMiw1PlybpWYsSsc73sO5THWaUr/1Oy
         8FiF1R24CUrjU+DEgS+5CRK/jtOLjsv2SGTwf3RJxhi/EBBF677jIFzXzapGWWZhFlW9
         XG8JXAPj/yZbr87r3f0U+OxV1NkpXsX9UPuD8Tqt7hc6exI9fxTO60pq7xeJ/nw1oAI1
         7dTA==
X-Gm-Message-State: AOAM530quUaV5orTKMjdvIef6lVbcaB6BynSfEsgHz44erYhdEk38h0j
        3KljKLV0Tqm5D9qgs4pQnAtlDfb07w0K7XH87FA=
X-Google-Smtp-Source: ABdhPJxWenmoKU7Obb6+Me6c3mjY3N9aFFj2TNSM8O8+thO37e/BXJ7tWXphVtz8LsdJBan0WCKi8cXM/8PdyVmGYoE=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr65103328otb.107.1594639566051;
 Mon, 13 Jul 2020 04:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 13:25:55 +0200
Message-ID: <CAMuHMdUPYaUQGLAqf-Eh1fyAn4V1-aUz-Om0iHGpa=7FXhtrgw@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: irqchip: renesas-irqc: Document r8a774e1 bindings
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
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Document SoC specific bindings for RZ/G2H (r8a774e1) SoC.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
