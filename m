Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF56E415A94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 11:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240077AbhIWJJ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 05:09:29 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:33542 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239985AbhIWJJ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 05:09:28 -0400
Received: by mail-vs1-f48.google.com with SMTP id 188so4814924vsv.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Sep 2021 02:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y6/R10PDbDtN/0h22VBBRsYOlzFdnG+ar9DsTriionk=;
        b=1svVSwOW1pQ/DhkQADqTrw9BDkDI0JFZiEUBogBAxIXfHu+K08+0yF7q92JbtIkyXV
         kxcVgoTfdv/rpaS2m2igcaZ2gAv47sc0rmmvasnlL7JTYEYbrzR+GXwgeCIYZ3R1SmhW
         xPNf6gyfxrF6/Wq0YIWXVVnzaxvTgNCN5G6THYyuOAPryptm9d0a4WjZgip0SEeHmhzO
         o1r54XToG6KqkEDkD2fTU/8DD/1ObCZHQwn9yosFJAjcl0+jfdggSTtj8+owkByzHQxo
         ECEEzL5KeWCpzEYB8UsePOxzUBJLXXSO4w8+nMQ7mElMLgbmPukkOjJttSbKePagLkWT
         f7RA==
X-Gm-Message-State: AOAM530qVkDHWTqSrt19i4kqEZfPGW4/L77SxEEYlsvzk/mphjMJyDdL
        ghMB7MgzZxXmJ/nHh1p47KMuhpU0Xc8AnwkvE64=
X-Google-Smtp-Source: ABdhPJyD9aJpjCw8SDVuhLhTL8VK/sDdtMw/exnbFC0SCbZgtpalNzvLBCYl5jzBTTJZqNXv16UZAjCDNSfCJV7BwgE=
X-Received: by 2002:a67:f147:: with SMTP id t7mr3030093vsm.41.1632388077120;
 Thu, 23 Sep 2021 02:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210920093905.10878-1-biju.das.jz@bp.renesas.com> <20210920093905.10878-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210920093905.10878-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 11:07:45 +0200
Message-ID: <CAMuHMdVH_xiz+TyUbZ3aGZ37mUGxyDw7pyKeCVvux5V=5Rzhmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable SOUND_SOC_RZ
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 20, 2021 at 11:39 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable sound driver support for Renesas RZ/G2L based platforms.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
