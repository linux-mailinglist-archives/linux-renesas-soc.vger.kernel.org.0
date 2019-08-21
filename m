Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28A5D97592
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 11:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfHUJFS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 05:05:18 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40796 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfHUJFS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 05:05:18 -0400
Received: by mail-ot1-f68.google.com with SMTP id c34so1367098otb.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 02:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BcgOugiEfu/sl/GJ2HeNJnHlOVsMexHqTjarEG68Ugc=;
        b=U6lZvCJ8psJxSKJWYVYMYCVDFULiW9jmWgewg7oMCEYS2a/ZBv0dnF2YnDDrIRuoZW
         Hsqi3/McMhXkLgta+LiO8H0Vi2yFr5UBpxWx6hDB/IOJni3o0GEFgy24a1ry1ceXlt1F
         rymA/cupgcOumSL5Rb492uhUZtWRuT0mqFSonqzDBB+NGMQtIhR2YxB8V54gVtjPOSND
         +QEyoEnbzQul9KTkBUfTYwJHxlcS+4xt0InAYKIOk1jZHWc487mo39z0E1xFRdNmtbYj
         Su6huR4aweUgk+/repu1et3w+EL7vPdpUkb/4YtSrq9ce06k+KkIiJH7gX3xpOwwrlbG
         WLYA==
X-Gm-Message-State: APjAAAUvh8dxF/yftXzdLHdQ2Jjwoq2h78ih/CuUQ4iGdnyKAPBJVA3Z
        iW0Tl9gZa6ViEJ0TWkuATcuM9x3HXLEnadPiIvhH+qCR
X-Google-Smtp-Source: APXvYqwEABXn/5Y7xZ1yMJQ5jtcZAzzIPZrRHhAN9UIfIM30szjKc85rvBFGGhyNChxWiqjaQDvn93tBXtOgNhBnBvE=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr2623806oto.250.1566378317253;
 Wed, 21 Aug 2019 02:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <1566219393-23169-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1566219393-23169-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 11:05:06 +0200
Message-ID: <CAMuHMdU7QFNhfgy8Ow_Y3iJOJRgrAad7tSGgOKRvgMC_ZwmdCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 19, 2019 at 2:56 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
