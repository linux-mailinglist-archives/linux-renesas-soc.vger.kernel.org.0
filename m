Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1BA3A99A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 13:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbhFPL4v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 07:56:51 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:45870 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbhFPL4u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 07:56:50 -0400
Received: by mail-vs1-f46.google.com with SMTP id y207so839470vsy.12;
        Wed, 16 Jun 2021 04:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIMdD+DC2D0RdmuD95Uw5dpAwzapXJa70AOOqXem39c=;
        b=ZHiaGs8iHAqnpO760slxdQO53fA88y9UNiTv85O8VfUvHWmLeBnScu7V6L0kVsQPLA
         RsdsOQoyMpFbr2+2Ib7SAa7Ex4lRoR1ew8pzJy09gKk1LXThZScbsJh5yqMITYrd2fSJ
         Jar/ZI2NE1q4bxbwv7gI1wN/pI+zxIhFsVahSLxRqvrCyPgjmZKJ+9wYxd4wBQwIvDBp
         rxkJeJJM6juUnBzV2ojPwmwUlNjRfTbPnt7oVloiJ5qYqkGdGQx2/fy+m00RTVp9J7Yt
         s9DBPqKd3Gdqbi0ycRE7gN39l2o9Zh7ILgd3/40HkNyqnUi+zuKDdGnFEiStkYkO/4hq
         qLNQ==
X-Gm-Message-State: AOAM531snReMos/ldKsh/YgiZh/azUXwWj6jHuPSln3uPy1/Lre0EjWa
        uYP04evsGjFRn4hU7JrD4T6ES97iISzdG596qsM=
X-Google-Smtp-Source: ABdhPJygjj/GQan14TLrrLCU+7ALlhFGG2bi4LaHeg93hOogHE6YIpuPFVMx39j4+/3QRMZBcGy3HJjIMmXnc5Ez6zc=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr9908186vss.18.1623844482960;
 Wed, 16 Jun 2021 04:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <1623749970-38020-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1623749970-38020-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Jun 2021 13:54:31 +0200
Message-ID: <CAMuHMdWghY8Ktx1o3tQxxcvrL2eoN1jD47kFPFtsU=whjqjwAA@mail.gmail.com>
Subject: Re: [PATCH -next 1/2] clk: renesas: Remove unneeded semicolon
To:     yang.lee@linux.alibaba.com
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 15, 2021 at 11:39 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
> Eliminate the following coccicheck warning:
> ./drivers/clk/renesas/renesas-rzg2l-cpg.c:299:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
