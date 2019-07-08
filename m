Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F94761E18
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 14:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfGHMAq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 08:00:46 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43873 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbfGHMAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 08:00:46 -0400
Received: by mail-oi1-f194.google.com with SMTP id w79so12369242oif.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2019 05:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VUxgAcEdpWpy6eMj48+vvq2z4KygVwiiC+k3eAVcWDk=;
        b=hRTwo/t7lLQ0fkZGxcYOP6ISdP1HWEYT23P4VotR1gVBck9+E+PBiU9xwUHNvKiepd
         naH0xu2RpyO7AHSqImT+KWoHHsF1Jgl4Cyx6AyLr4CuN00T4fVMK0ROsilTdPC80HY3k
         vkfXNncynCRJCAUJvLshkE4Ov18m04NLVISMYZ2AfjeInTyW+ysWtqjfOy5+oj40iJo/
         pCJXSiPZA6xIEJ5HEJh9Og7ljteIal6et99EIntam4IJ0Ej/x/G+W21sDtsZhwdF0Rzq
         v3cf3d77TSkEC1csin39Z1HLqNYVmHWcffRwpoTt+xgLHQznFDwLYwM8lYfxkaIAAj8P
         lMJg==
X-Gm-Message-State: APjAAAWBePJGCR9RkXpFJ07EZMCVPFcok9/TgOEuAATNoKEdR7CApjMN
        HmRAX3uGuWRZl9oB2zeBYGLPQ6WQ9odnAExFu0Y=
X-Google-Smtp-Source: APXvYqw0rEMuqFJbFPt5P+HVqx9fxEr4lI9SFvDGX9FYFpyUv2BG2z/NIYF3X0UsIFmrQHIlYIyYr/IpaKms2zsg9BM=
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr9212616oie.102.1562587245851;
 Mon, 08 Jul 2019 05:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190619124637.12873-1-geert+renesas@glider.be> <20190619140928.scjgtnwytr46jnwu@verge.net.au>
In-Reply-To: <20190619140928.scjgtnwytr46jnwu@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jul 2019 14:00:34 +0200
Message-ID: <CAMuHMdVUG_sqcjmoyntbvzhTVnMRPVxqLe++ptu8wynFbs4JbA@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Use [] to denote a flexible
 array member
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 4:09 PM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jun 19, 2019 at 02:46:37PM +0200, Geert Uytterhoeven wrote:
> > Flexible array members should be denoted using [] instead of [0], else
> > gcc will not warn when they are no longer at the end of the structure.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
