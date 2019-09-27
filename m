Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE4BC046A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 13:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfI0Lc4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 07:32:56 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37636 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfI0Lc4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 07:32:56 -0400
Received: by mail-oi1-f195.google.com with SMTP id i16so4903856oie.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2019 04:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=52oc49zh7xP9ugcHXWAKNaQdpwyL9K7pB6SwdLPEacg=;
        b=b/jP7dW1teFNJQNCA4gYcAPlKiFwjA+trt3tf9FOGEtlx8y5T93+anazLtCsYyZnS6
         p2PekArwPqYMUwHDe0R8yYFcepmz703hnHDfZz9aTOGKgP7osq3y/cZTopAUXqV2/A1u
         gv3AGgzZDuIOMX2qk9jLe7Xz8Mw8eWC3GW9eBsFDR4nummslOIRF/7HKQtNNxUApLGBv
         qxe+NZSgwZlPG73i7/AhjxxpQ95IlKM1gvO14Oras8b51kKSpMx41sW0M6ZDSgtBVrHo
         2hY+/OPKkRmHBKdQv/Vi9uxFdWRSm6SK4TirG7qj5wiUEFNfDY0Dk9UUvdCWTzTVDigZ
         ZmAw==
X-Gm-Message-State: APjAAAW19w/F2066l4oEzNu3Shbkq4nF0oTQy3gHV94xZZdE7UvvGCnq
        Mq4ye03DK+ScNmktY5CQALCa/s5GbHDs6sQYKUM=
X-Google-Smtp-Source: APXvYqywyz6+bxWj3yKGdFYQ7bsOUDSxIgHeeez9U9Z9Ue5iEGi+i0pGl7ggi+L5NUT1V3JOLD1JcBQB7e4iwWufDgk=
X-Received: by 2002:aca:cdc7:: with SMTP id d190mr6474121oig.148.1569583975648;
 Fri, 27 Sep 2019 04:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <1568725530-55241-1-git-send-email-biju.das@bp.renesas.com> <1568725530-55241-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568725530-55241-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 13:32:44 +0200
Message-ID: <CAMuHMdXBqkmf+g-Q7OnoPh1Cn8Yt2Fy1MrhGZs7=zE7OiD=HPQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: defconfig: enable R8A774B1 SoC
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 3:12 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Enable the Renesas RZ/G2N (R8A774B1) SoC in the ARM64 defconfig.
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
