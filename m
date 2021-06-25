Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D263B4656
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 17:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhFYPJ1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 11:09:27 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:38513 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhFYPJ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 11:09:26 -0400
Received: by mail-ua1-f50.google.com with SMTP id o3so3674965uaw.5;
        Fri, 25 Jun 2021 08:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FkHY1m5dDu4+3zBBtQl2ESfglXiKG4tDFsAgULyx8NQ=;
        b=DLG/Pfv82mMhzc+rHcETbIr9vlN2x1o8nL96eYAL1Dl7M3MPWNThRYV0qnIEyHpHlR
         4ZdkKLO2WYa0O8WFgX+Fy0yKI1/F6ObOU4H4R2Ph0Yeqy+UffCpSU/w0URtA1Tb73Jo6
         UGyaFom8UV7rpcccw7TE5yJkzuwoxGP+PFBoWq8XHv1CHeq366lLsTi20nyyjYPBGVK7
         /mHz0Qq8WBrLiJOqef7W/IiK41M8OROyT+CaCRuJihZl5IR/K/ItL6z7fanBTgTDPr7j
         5gf9p8kro2JpNcJLRAslR4+vAaCT8FasoBBeFZcLM4np++QhrPIx/uhCLMNiabuA1LVm
         MbFA==
X-Gm-Message-State: AOAM530t0w9/68hRlJM2IVOlZvgonBlzxPKMGNcvLr30xTI9tQQ70aMa
        t96Qy6oxD9AXyKFFplDb6CQ3IlpQdYE6B3rJpdU=
X-Google-Smtp-Source: ABdhPJwLGKYtW5JVLwl3N8y//x/wI5ImMtfxni5LGUYc321nRWKjPMUPo40NYAEBcrJN0NFyDLcGOzgWqisDBkjxl/M=
X-Received: by 2002:ab0:3734:: with SMTP id s20mr12244402uag.106.1624633624143;
 Fri, 25 Jun 2021 08:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-10-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 17:06:53 +0200
Message-ID: <CAMuHMdV2kotNc4BW7dVFCbTTqL+mm=M5qSkHMy6=Svx9AR3ePg@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] drivers: clk: renesas: r9a07g044-cpg: Add I2C clocks/resets
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 24, 2021 at 3:03 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add I2C{0,1,2,3} clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Updated reset entries.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
