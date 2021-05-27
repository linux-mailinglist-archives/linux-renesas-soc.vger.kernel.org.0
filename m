Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AA4392A4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 11:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbhE0JOR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 05:14:17 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:36466 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhE0JOO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 05:14:14 -0400
Received: by mail-ua1-f43.google.com with SMTP id b1so2420841uap.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 02:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzL7g/tJBUv3e2nDslbAaKCd0n5ss/lsUcvA7NsnFdg=;
        b=XMbClFSzBp/ZetGAdEgVmnSCAeJqAZG+e4xU+nteQRWHniWjQ+oChgZn/Wv2tBq8n2
         FMKD56j7g64At9mZ6fhxTNp6XRDf+92SI4Nt3krGve5OuypWifI7/AZZewIEQLh8zkKq
         P9eve1poMGBq3w5hkomvW44GJ7v4trTld14YlIM9W5ozW10PUHz4n5YaPkxGoNfRYdU4
         qvh+dk2uaYMjtQ+wm5FQspWX4Og6Ea5f5fIfH6X67FDSRTbwVXGw8umcfjfzemnISuSK
         pd1FFYGVGUTqYvptj/fDBHl+r9Xh4sdQtFDUYnqqvtPZUkS1Yfcoy7rwCXB9TMRsSjx0
         kp5Q==
X-Gm-Message-State: AOAM533DJAWvoYy9HW1zd6SBXUhsKzxKCnPVgkeoUtXiLTU9LfM75lVx
        3UTwlZCRZOHYXr2aQ92b3fGOwD8Pm10x6EtKSqo=
X-Google-Smtp-Source: ABdhPJwcehiOpwMDvYIjm0g32cCwx5TuecNhRwMmeuI83sGo+345AH05UwvSEBdMe8AqRHQWP0sHl86SWv2EkyZz6L8=
X-Received: by 2002:ab0:3d1:: with SMTP id 75mr376926uau.106.1622106759471;
 Thu, 27 May 2021 02:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <87r1hslrno.wl-kuninori.morimoto.gx@renesas.com> <87pmxclrmy.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pmxclrmy.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 11:12:27 +0200
Message-ID: <CAMuHMdV7YGP0rTeDngdCWxRMcpeGi=56wFUGWtLnULB4CuPohg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: renesas: r8a77995: Add ZA2 clock
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 27, 2021 at 6:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> R-Car D3 ZA2 clock is from PLL0D3 or S0,
> and it can be controlled by ZA2CKCR.
> It is needed for R-Car Sound, but is not used so far.
> Using default settings is very enough at this point.
> This patch adds it by DEF_FIXED().
>
> Link: https://lore.kernel.org/r/87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87sg2boi3h.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.14.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
