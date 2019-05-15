Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C36F1E909
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfEOHc7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:32:59 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:35876 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfEOHc7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:32:59 -0400
Received: by mail-vs1-f67.google.com with SMTP id l20so1052721vsp.3;
        Wed, 15 May 2019 00:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=63PbjB7UdYhqTNNPPsmHQYlaQBvvu/A5a7yF4Ay1Too=;
        b=aZiODAYGp6IHku2L8bSHhn5WP5C/+iG4rCaxUEXJqZyGWVzafQQktpYInD9XUxmKmx
         ky2XtiTVt5VmdvmD1NCWNJH69/4Siv/8DqbNJB1y/f/XOjoQuJu9yr7ikMDFIEc8JMyF
         o3pnU3SxEzoRO+pLLMp3T+wxAbtB3vZs/Z7oyAcd4qX3QkmZk7zuGqYpNlFzhIFyHilD
         qEIa+H/EM3Tck5O/Uyv5vMLc7fi3vgKdziWxZ/pLLPS/6QqTGQzGWoA/sKtYLwJ8tm+H
         05F4SJFitJKEz1Eg+f5xCXutMjQLB1jxSTcCYFl1I+ecWsu9smHjo0aULZim+ngDj3nq
         MQ/g==
X-Gm-Message-State: APjAAAXKuQ3RK33OOUXjF6/AIbesuVd7gmsjfb+Y3Z96JDIiidxFxhMj
        FOTVMNC0Rcv67XAUW/3V8Y7Mc13H+3hQ2olumhU=
X-Google-Smtp-Source: APXvYqx+ZUYs18MbtRjnTbPUMiASkQei/CMMiW4NKXUKV6JAfdVlAyntvioIPDq7/MjfR/M6OvqAMmaXc2Db387tQPc=
X-Received: by 2002:a67:fdd4:: with SMTP id l20mr15039485vsq.63.1557905578319;
 Wed, 15 May 2019 00:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190514153341.22540-1-chris.paterson2@renesas.com> <155786877257.14659.6751252865489860937@swboyd.mtv.corp.google.com>
In-Reply-To: <155786877257.14659.6751252865489860937@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 09:32:46 +0200
Message-ID: <CAMuHMdWPSyrhYx5Z5mgmKrR68cHL6owcRT=B3+DD3GhhxuG4zw@mail.gmail.com>
Subject: Re: [PATCH] scripts/spelling.txt: Add spelling fix for prohibited
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 14, 2019 at 11:19 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Chris Paterson (2019-05-14 08:33:41)
> > Misspelling 'prohibited' is quite common in the real world, although
> > surprisingly not so much in the Linux Kernel. In addition to fixing the
> > typo we may as well add it to the spelling checker.
> >
> > Also adding the present participle (prohibiting).
> >
> > Fixes: 5bf2fbbef50c ("clk: renesas: cpg-mssr: Add r8a77470 support")
> >
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Acked-by: Stephen Boyd <sboyd@kernel.org>

Thanks!

So I guess I'll queue this in clk-renesas-for-v5.3?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
