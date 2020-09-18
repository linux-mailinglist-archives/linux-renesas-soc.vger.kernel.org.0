Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0399326FC6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 14:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIRM0b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 08:26:31 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:42689 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgIRM0b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 08:26:31 -0400
Received: by mail-oi1-f179.google.com with SMTP id x14so6758714oic.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2020 05:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eMrB6Af4rVFK1w1ERdsSpfe2JblVilnsdJttwM3Nx9k=;
        b=QLAPEX28HIIb/WHJ+VFOAMj2kuQnErehX7vXe+3quy26Xcmh7vZuPI1aavJh6aaQOT
         wnbeg3OCS+XzuXHQ5A4ScwyirRH4nLrpXjbnxZIHczIZzyGN12abjBJupQ2QhpfJT8lv
         CO1N9D+yOF3jVidwb2zoT4pVkOtm9MJ76K2NSPdURqjGbrTHYSrFV+cZnUQsd9p2PSdV
         r0RQPffUMuCvTieIEd66kMOS3r2ykVU0/DuoeK95yxkz9FltSCyXP+QKgRqwoov8GoYY
         ijogBgx2+OqVmgusvqq0EuR6q6tb7YeNXDzDTxia5DRssKcZAIo/j4oB90ufP6lIusiH
         RQJw==
X-Gm-Message-State: AOAM531jl+LILS0chxC2dG8nklHbb0UcevXpET2nd4pkfAfvjk72NJO3
        RAuenAOUr24N9e+baExeF9bxf9jXIzYXoO0CK6g=
X-Google-Smtp-Source: ABdhPJxrNqnlkf2H6axBaLP0FS/iHQsjug6M7fB/23ifuVOFD6Z6TDT3cY6LSsUTZvqS9TXwUll0CN33upIYsBgQW/U=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr9247550oib.54.1600431990422;
 Fri, 18 Sep 2020 05:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200904114819.30254-1-geert+renesas@glider.be>
In-Reply-To: <20200904114819.30254-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Sep 2020 14:26:19 +0200
Message-ID: <CAMuHMdUPhTs=Ok3WT3e_uhW_bJW=wUDmdp9ZQvk4v7KUyfqUgA@mail.gmail.com>
Subject: Re: [GIT PULL 0/3] Renesas ARM SoC updates for v5.10
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 4, 2020 at 1:48 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.10.

>   [GIT PULL 2/3] Renesas ARM DT updates for v5.10

>     - PCIe endpoint support for the RZ/G2M, RZ/G2E, and RZ/G2H SoCs,

Sorry, this should have been "RZ/G2M, RZ/G2N, and RZ/G2E".
You will receive PCIe endpoint support for RZ/G2H in take two.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
