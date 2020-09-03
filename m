Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87C825C141
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 14:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgICMqq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 08:46:46 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39757 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728964AbgICMqG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 08:46:06 -0400
Received: by mail-oi1-f193.google.com with SMTP id r64so2974650oib.6;
        Thu, 03 Sep 2020 05:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ml+p0f4/lZUonascXc6jcxVxCdORbfnV0c6JRtVN0WI=;
        b=LzRU28HIrkxAkGLDjs76uVr4b+0TLwmDgfebuoIwmRATq6cQ/HKfpcSEsNjnyw2i1S
         b9iIWk8/Qf6+3gNWDFaRCR8vHymet/vn1IorV5AA+QFxT3QH0IkGp/v7ThVa/tHG3S3w
         QdN8wqBAp/0YRNcqmx73JKlnnA1mU8BrLzj/Kbtm8BCuaKf7P7N2wsRbpvfKliBChkHC
         iNd4eX+r/It7H1G6wZY+qMS3s45+GSQLclW0aRoqlQNHaKXYeXbq4LMrjmUilgZI7hAl
         xLakXTCqWHPd4RZCU1G9l871Z3bhNGWVbwPC3DutXI/9n/yjFu8s3ZDYVJOdVNZ2076r
         pu4w==
X-Gm-Message-State: AOAM533lkYUAia/gXXZWtqCny7LydH5gxP9+DuUjgDE7Gdbcgs5hxzAw
        J+G+HcZ7gSRyYLqA73TzholfhfrQjZhJGf0iFQE6/6Bp
X-Google-Smtp-Source: ABdhPJwZcz/ujowdJByh5kbHpCBfa3Mpr/OPyUnuyyZK6ceNjumcCEmczP0uPpBwRxXaF/qOFQ+eA/665+uKpJ+OxTA=
X-Received: by 2002:aca:3402:: with SMTP id b2mr1797687oia.153.1599136958847;
 Thu, 03 Sep 2020 05:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200831180312.7453-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200831180312.7453-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 14:42:27 +0200
Message-ID: <CAMuHMdXWxYgAZx7bCET-U2S9KUo2tAT2gqKn3W5LTTtH-oRS0Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a7742-cpg-mssr: Add clk entry for VSPR
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 31, 2020 at 8:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add clock entry 130 for VSPR (VSP for Resizing) module, so that this module
> can be used on R8A7742 (RZ/G1H) SoC.
>
> Alongside rename clock entry "vsp1-sy" to "vsps" (VSP Standard), so that
> VSP1 clock names are in sync.
>
> Note: The entry for VSPR clock was accidentally dropped from RZ/G manual
> when all the information related to RT were removed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2
> * Alongside renamed "vsp1-sy" to "vsps"
> * Updated commit message

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
