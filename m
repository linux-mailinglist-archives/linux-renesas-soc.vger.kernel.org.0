Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5CD276AE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Sep 2020 09:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgIXHfl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Sep 2020 03:35:41 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41367 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbgIXHfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 03:35:41 -0400
Received: by mail-oi1-f195.google.com with SMTP id x69so2691692oia.8;
        Thu, 24 Sep 2020 00:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xl2EFGQPvuqoLJbUjzAYBTmBWNQ75rGGXOTTdtaKRjo=;
        b=EtX+R1o8DrgxkFJoOqwHUOyCbkDffDjgUmKOZey98Kfn6JXqsG+JokTB1H15qokvWL
         PUYTCSWkyv/3ozR5hgmYAgPuKrTqFYlu3vYk8DZB+JYPFPYRpG3YKwUKu80fEQovgJ78
         IURn9aGSMc73WOEWRQNvISxFstposqv+U3IhZaHiSnWHXpQAe8XoEcAAleP5oHUvj3iT
         ye0EjdKwiNilVmkovGYD6RVa5iRdmIUkESpUXqWnYaHZmEZxKnke3taUj1HHdzYY8Cg9
         hhM+xNo1oJ48M74hir4+Taww17JKfYyWKMFUhIhvEGx0KFOtoce008cWAvArd5iC3bJL
         2Bgg==
X-Gm-Message-State: AOAM530dNWj985EwwVl0y8PXESFWpIQ3/9K7QL9cYkVgSqey7p1IupyK
        aNJT4bALPv6+SFaoRoKkUgLYxoKKlnvbiZIhfwc=
X-Google-Smtp-Source: ABdhPJzqmYNIURPJwfJmYo3J8MZendZ3Uzlq/W5kTwxcKmw67lfhsTT/uOphb9Idz+1OB+4cVXtKh+J0dCZQT1dRyzI=
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr1689092oia.148.1600932941074;
 Thu, 24 Sep 2020 00:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
 <20200923113142.GC1473821@mwanda>
In-Reply-To: <20200923113142.GC1473821@mwanda>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Sep 2020 09:35:30 +0200
Message-ID: <CAMuHMdVgZTLExon1JCDmAZaM+iB_yngTQvoXEuFYw7fRF39aGw@mail.gmail.com>
Subject: Re: [PATCH v2] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 23, 2020 at 1:31 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This code needs to call iounmap() on one error path.
>
> Fixes: 2173fc7cb681 ("ARM: shmobile: R-Mobile: Add DT support for PM domains")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2:  The v1 patch potentially led to a use after free.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
