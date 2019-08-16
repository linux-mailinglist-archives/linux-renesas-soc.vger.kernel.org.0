Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F368FC42
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 09:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfHPH1I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 03:27:08 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43748 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfHPH1I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 03:27:08 -0400
Received: by mail-oi1-f196.google.com with SMTP id y8so4140099oih.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Aug 2019 00:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYn06rQVCWr/xHbuls3eexeoV5PBFYW4r8q5eGYJO9w=;
        b=WcugUG5W/eCkqiAr8R0dBEketLucDRFoRrUQycvWqI7G5LqspBJ1Dv5eJwcbyrLQFn
         NkQY2zzkGhFNKG7+LOnCR7hbJGNThYsXc+EMnMdD4kZ4JiDNzxB2OS96mN9USOesCd08
         4qibd/DK7UjSZN0Qkwf8FPdgwRiMhy/7uyKnZZUylJc6xOFODb+wjrr18BH2THiOxjlb
         SCuo1zRFS/+zuPnb47B3bCgB0U5B2xy6WQjMjE/UOoKOuDsw9KdkaXkLV2/+A9Y6XP4j
         ODX3goJbAQaeduxZXcom/U19Fc7Fovmhql47O2MbMsTYvmj7SutjRhTsG6wPFabyP+Zi
         hOyw==
X-Gm-Message-State: APjAAAUnPCHoo+tJRB9xypb3opEtFXSD3EsYUHjzYawgMo9S3gT67see
        iy3rMGGr0gyiP654jdukMtWvjfKVF+JETbBOGys=
X-Google-Smtp-Source: APXvYqwDDr7GscejpmuVIN6KpfEjd5gflUcN0RNsaX5RphMhs11TXPMJjVMpu6sEAyRJjfgO7z6Vf/gJdFitvbT5XsA=
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr4252277oie.102.1565940427050;
 Fri, 16 Aug 2019 00:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190815061355.4415-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190815061355.4415-1-nishkadg.linux@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Aug 2019 09:26:55 +0200
Message-ID: <CAMuHMdXJVit0F+KO7DL2t5ZJ14MYb7R_yi=OUuQ_9Z6cLgA=SQ@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Add goto to of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Thanks, applied and queued for v5.4.On Thu, Aug 15, 2019 at 8:14 AM
Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:
> The local variable np in function rcar_sysc_pd_init takes the return
> value of of_find_matching_node_and_match, which gets a node but does not
> put it. If np is not put before the function returns, it may cause a
> memory leak. Hence, remove the return statement that does not
> immediately follow a putting of np. Replace it with a goto pointing to a
> pre-existing label that first puts np and then returns the required
> value.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Fixes: afa6f53df6052968 ("soc: renesas: rcar-sysc: Add support for
fixing up power area tables")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
