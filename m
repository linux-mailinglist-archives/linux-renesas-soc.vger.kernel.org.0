Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5BDA7C77
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 09:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbfIDHP7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 03:15:59 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:42337 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfIDHP7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 03:15:59 -0400
Received: by mail-oi1-f182.google.com with SMTP id o6so15023188oic.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Sep 2019 00:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fgv5ucks9JqJeucfLpT12cl9J45/7/nkr6LLzr2izWk=;
        b=aBGgOpBJcGg4NrBUQxc4GKgFVUF6fo4oykSP7qlnJICfc/Ts5Jb0JV2fKmrgg0n0DZ
         okLdH6+ZkkXD1M8tZblNbmEWYUQgvoZw4afflPLdhfrK8Dpe3K82RtUv8g/WkrEtX2kl
         Z4a7BJq6VUaokjKzl4LoCUi8JTsFHX/leqWKCbOa/5fB08SrGIE+aORkuwlO6bhF5U4Q
         FL7ss9ptwW7zyuu4AvDk8yM4PQTv1WdiJdtMIsyA/ByRYfQ37D/uijnDIrfHbl1t8sJ1
         sbfew3CtmQ251aK1w1XHhVs61uIlbhEs+YmFOk/GymSKNNLL7u3zaW3Cf7wUv4bigvg8
         rQKA==
X-Gm-Message-State: APjAAAU/SCa2oGr5LNXPfwWXJ4nqeNFMuZh6OkibT5SddxVzzVGQj3pA
        bRZzugX8dt87lVYV7zQn8vGXsOGpYFfSe/6MhZA=
X-Google-Smtp-Source: APXvYqxLc2EhXZhftPgeRfLRRdjdPCuNGx4NeDTs9OkB/LUjEafw3ZWncRNiAh1GjPJ+06Dm2UCrr3biTsphV5tO4vs=
X-Received: by 2002:aca:cdc7:: with SMTP id d190mr451591oig.148.1567581358045;
 Wed, 04 Sep 2019 00:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190823123643.18799-1-geert+renesas@glider.be>
 <20190823123643.18799-3-geert+renesas@glider.be> <CAK8P3a11EfOXfwZ5Xx3vYJwfBGPh=yX73f_=3u7Zmm+hJF6HVg@mail.gmail.com>
In-Reply-To: <CAK8P3a11EfOXfwZ5Xx3vYJwfBGPh=yX73f_=3u7Zmm+hJF6HVg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Sep 2019 09:15:46 +0200
Message-ID: <CAMuHMdVaw8KGgxbahwyHv+-PabQSrktjEyrTL1xP4SGgLTdaHA@mail.gmail.com>
Subject: Re: [PULL 2/5] Renesas ARM SoC updates for v5.4
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Tue, Sep 3, 2019 at 11:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Aug 23, 2019 at 2:36 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Renesas ARM SoC updates for v5.4
> >
> >   - Low-level debugging support for RZ/A2M.
> >
>
> Pulled into arm/soc, thanks!
>
> This should be the last of your pull requests for the moment. Can you check that
> everything is there once it hits linux-next (probably Wednesday, I may have just
> missed today).

$ for i in $(git tag | grep renesas-.*-for-v5.4); do echo --- $i ---;
git cherry -v arm-soc/for-next $i; done
--- renesas-arm-dt-for-v5.4-tag1 ---
--- renesas-arm-soc-for-v5.4-tag1 ---
--- renesas-arm64-dt-for-v5.4-tag1 ---
--- renesas-arm64-dt-for-v5.4-tag2 ---
--- renesas-drivers-for-v5.4-tag1 ---
--- renesas-drivers-for-v5.4-tag2 ---
--- renesas-dt-bindings-for-v5.4-tag1 ---
--- renesas-dt-bindings-for-v5.4-tag2 ---

Yep, all included.

Thanks a lot!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
