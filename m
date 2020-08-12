Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9F12426EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 10:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgHLItk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 04:49:40 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45599 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgHLItj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 04:49:39 -0400
Received: by mail-ot1-f67.google.com with SMTP id c4so1313184otf.12;
        Wed, 12 Aug 2020 01:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BvD4sWYH/Kf/H6mNjCfudH/resKqqLk98qNS6xsanV8=;
        b=C/IQDqnS3p7dWJL0aDynyRGEORpe+00q3SePZC55iGLI4bgg/2Zb8lOUlC/GoaxGl9
         0HPRZ9m7jWy45jCdfapIcVKrthLGNKOE7VMJiI33jAt5Fh2Ii5j+4tynXmDBFqQpvM6B
         l8PONVvC9uTzPJGQHvrbc/gBN+SyshRkdoeF1NBmQjOBiU+1zqeoc8wtHnXHFXXC+QV+
         0Lp40VGO8d5BoEw0thXGDvvTpB0vZK7u+jayvdFF0+Z8zO2EYWlOJA/W3jE26TsUworb
         Bw8X2Joqg4QWCzQe3O6V+CqHypJaacE8tGXdIeOcsP0y9d/uhHsIXqhYt1dIUyNe/NOt
         6dnA==
X-Gm-Message-State: AOAM532MAakeDwYwbDy37Nm6DgxOJziNVVgOH9+cbHQ/oDUNXM/NGT+0
        VYvdg18VDgSCfp+eHxnJ6nN9e1eqn7jRI26CXVI=
X-Google-Smtp-Source: ABdhPJznvz0qP6irilSKXpNqdZUSqENoJvYhW9GbxkeHiv8PGN4gbBsHkWrrofOQp969mwCDghVtHommqgoWazXU14Q=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr7980784ote.107.1597222178786;
 Wed, 12 Aug 2020 01:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200810171239.30401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200810171239.30401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Aug 2020 10:49:27 +0200
Message-ID: <CAMuHMdVtSwaohhujV0WOBGZcXjQc9d+HaxDEmmVnWbcr5CzHew@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774b1-hihope-rzg2n-ex: Enable sata
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 10, 2020 at 7:12 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable sata interface on HiHope RZ/G2N board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
