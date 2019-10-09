Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 482BAD0DFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 13:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbfJILwf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 07:52:35 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42328 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfJILwe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 07:52:34 -0400
Received: by mail-ot1-f66.google.com with SMTP id c10so1436207otd.9;
        Wed, 09 Oct 2019 04:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KVHLQjNWxvYRmshyMYw/gi35m7+OrE3WV8vC99l1C2c=;
        b=cGcCwHKtMRmXM7Tx6mT+rH8G8/Km5M6/fDNUZ/KlYTTfIkb510KmxPtp2wx352lF4G
         UbycKeAURIGsxQjuulV9cfwiAWu/PGRWaQZcn011n29uSJ4vZ6vAgVdWKvqs9PmrfC0w
         GA3fG4unVKheQLQOScsdv1LPy2Hf048+yuxI1NUFtD4KXyePHH8jLc8cJtCEAASHuwf9
         eLIVZxecEwMxA/JdXlUnyiurpYaOuapkqtbdNkPZT2eBGa8l2PxanmvMhvZtaC+r6AOD
         34ChMVo1ymObwWKsVs4N1TAXb98oh9EcULk3kfvLahbpIzVX2ZIhuBlQWhaVfdDscnYC
         BxOw==
X-Gm-Message-State: APjAAAU+htJhHvhTqQYkOH9dvgN54B9vGJanDeKumrSASFOV1JuhzeRE
        AggJISRJqaXlQNkHmgxXVKJt+lLWv8XkSEQcs64=
X-Google-Smtp-Source: APXvYqzSRG/aEwWP0KGLYwQOucI5+t8MBsJMuF+o5Z+rWLJKg8KQ8QT3VeBdK9cgWHIqwtZ8kDr0xZ6XIL9ExGdm6jo=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr2328731otj.107.1570621953600;
 Wed, 09 Oct 2019 04:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <1569831527-1250-1-git-send-email-biju.das@bp.renesas.com> <1569831527-1250-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569831527-1250-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 13:52:22 +0200
Message-ID: <CAMuHMdWU_YOpMWOrm9ENox8a40RG5JgkWuWqKWahuwVoXGWdfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: renesas: r8a774b1: Add SYS-DMAC device nodes
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

On Mon, Sep 30, 2019 at 10:19 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add sys-dmac[0-2] device nodes for RZ/G2N (R8A774B1) SoC.
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
