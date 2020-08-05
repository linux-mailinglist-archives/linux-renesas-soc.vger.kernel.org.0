Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3734A23D2BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 22:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgHEUPy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 16:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgHEQUG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 12:20:06 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F79C0086A4;
        Wed,  5 Aug 2020 07:43:39 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id a9so8816689oof.12;
        Wed, 05 Aug 2020 07:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GHOG3MMfsS8Q4iK2eQgCcwA2GFKcb5/CggWXLB2DZwI=;
        b=cdEwdP7dZcXvRLz38WwI2mBl6cQMeZH/O+UvjcNDzp+zaB+BzerBdoEo5rGyh9Fsht
         FYCfq2oBaMBbdhOVFkui+n03ocYTEE1tlNlT5pY1/W59I0y32FyqnorZlbJMLDvcYsya
         iedZWWisMJF3LouBc6f5yVucWaMPev3oQc9upmWEGvIVDzevQP2e0I4lCnDGQuECRu1s
         NfSa9hNHZ6Dkd3tKlytQwvE20tRa1Xq/JL1MwAhsCVVPH0WABe1Sy8BHhPjDqzV0IDbh
         e5Q1OiZSMOpR2g3tcDFqLmpC83zdKTtgbxzPvj6dOd2KZ65lIbXqP0kD+G3X4UlTghEV
         T4cQ==
X-Gm-Message-State: AOAM5314XgY4PcOsBDQHJnm/v0v8tscUalkQt5+4Zx0z2oLfETNDe/7+
        CZeAJ/1RDpP/+gtPZwloNgeBCeI/Cmaw99viN4E=
X-Google-Smtp-Source: ABdhPJw9RW5CudcHTtQDFGv1V5QDzRVBcVFCwYbJOv2CTxkyE1KBLND9KzWPONo2u/qPu+8W70ut9anlzKiuUHbnLAU=
X-Received: by 2002:a4a:9d19:: with SMTP id w25mr3187978ooj.11.1596638599474;
 Wed, 05 Aug 2020 07:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200805142634.12252-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200805142634.12252-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 16:43:08 +0200
Message-ID: <CAMuHMdVBFQ79Bqd7qn_AEvHSeJ0P8GRVAKSK2VFwB8YM9sQ+qQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
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
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 5, 2020 at 4:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Some r8a7745-iwg22d-sodimm.dts device nodes are not sorted alphabetically.
> This patch fixes the sorting of nodes and also fixes a typo in the stmpe
> node.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:- Fixed sorting of sound node
> v1:- https://patchwork.kernel.org/patch/11690969/

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
