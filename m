Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA5B3BA1E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 16:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbhGBOFs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 10:05:48 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:33757 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbhGBOFr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 10:05:47 -0400
Received: by mail-ua1-f54.google.com with SMTP id q3so3651073uao.0;
        Fri, 02 Jul 2021 07:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3sdua17fppYVCyd0A1RC6ECzG0D7HbDuo2RWvtjwE1c=;
        b=XKnE2qNdqAz/eFJotD8goSJG1+85lc2St/LDhyiefPTsUEdsMO/k2U6JRb/H5olTFy
         AOkDJwfPA8JgjKVNQA9X+HtvLd13ejzAW1rwug7IKTR3XtV3G16pRc7PJwTmbmRCvlTk
         OvJNw83D6V2HzJd26Jvf5X9AdiYIP+G/9o0bpwFNlxGhiJ1yIZh2cNFCppYE+PVZm1OV
         lJaLGIXmck8D9VQlRxr9sk0leZBp20LD0ITqY5qvLnqvseNep8c8485PsoQbLHMZQAap
         fuel6DSpv+D1lmgemEzmVFEbD5TuBgmxtBk7aeQchY2Bw8bMf1xo+dQLPov5ChEGygLR
         orHw==
X-Gm-Message-State: AOAM530VG2uBzXwREW4RpqwdZ/zG1UeLkwzJDfJ5igLHIVb5OF33KKEW
        qrK/aJlv8tDhjyiHMl0+n74yebGf0y/LiTufW1A=
X-Google-Smtp-Source: ABdhPJzHZp++2Q9zRjj4qQ3HOrjOqkshqYufMhBoKUPp8vHrNtCEacV7HlqpZnRsq/G2IX9EdrTHrv022c+Jk4F4/Wk=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr6794455uad.100.1625234595248;
 Fri, 02 Jul 2021 07:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210702135010.5937-1-biju.das.jz@bp.renesas.com> <20210702135010.5937-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210702135010.5937-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Jul 2021 16:03:04 +0200
Message-ID: <CAMuHMdWYkgKWxK3aU3_Gz5PTawPPT3UxDz_AfmJ+0u+Gpqo50Q@mail.gmail.com>
Subject: Re: [PATCH 2/9] drivers: clk: renesas: r9a07g044-cpg: Add SSIF-2
 clock and reset entries
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

On Fri, Jul 2, 2021 at 3:50 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SSIF-2 clock and reset entries in CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
