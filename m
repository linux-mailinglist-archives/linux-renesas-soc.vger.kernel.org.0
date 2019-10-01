Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA8E7C34F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 14:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733193AbfJAM5X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 08:57:23 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45562 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732807AbfJAM5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 08:57:23 -0400
Received: by mail-ot1-f67.google.com with SMTP id 41so11392201oti.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Oct 2019 05:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qdRXJ7/bLimXXoHyGGOJNns+W5w2/rbek84Miv0inNE=;
        b=smAItVtccERJ86VhZ/ds77DCvYEyApoJ4As5fr3wZN81Yhc4CDInL99W8QcCX7q+LZ
         bPJC31uuKC1vVZ853hxcSljDTQrSp70EfESZjwlOJqX2sQmB6ItaZltasfJHkKEtAp+n
         xfutUVWFquGzDsVIuweHX/5gllQzXYSfMrnObPjMPlT5AQFz9G1t1ntRVuM1R+shHBER
         F66cGpcOHYpgdKHxGXxnqPvteVx8cMhQjbQXciuLDROk6KElk7+/KzhSAhz01B9uNIXa
         bqrbB1O2d8nVKH7JGUAmHiwz+5JImusKqqLJEC6qFbyJi2o+qQajRHZrTobBwrpHvUZY
         H5yg==
X-Gm-Message-State: APjAAAWNZZCGMI/jU/vuafg2n+mfk/zE0dcR9VX4K/BsFRpCE6Cc9ER9
        biEfBCVHkUXc+6/hCjkKGVBHxGnNb1qZzzmf6Kldig==
X-Google-Smtp-Source: APXvYqx7YLG4gGbyp+M7AUY2geTJMmYYlLM0isqQaLBE7XV4ung00d4T3m4PbTwfB2burtMBLvB4sH9a3BYpWfjs2a8=
X-Received: by 2002:a9d:730d:: with SMTP id e13mr17006496otk.145.1569934642085;
 Tue, 01 Oct 2019 05:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190628175144.GA1043@ninjato>
In-Reply-To: <20190628175144.GA1043@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Oct 2019 14:57:09 +0200
Message-ID: <CAMuHMdWVsgdsd4=NBfgCt3CUNgQvmBa0T4E1DtW8YApN3XS_AQ@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-manual-calib for renesas drivers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Jun 28, 2019 at 7:52 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> here is a topic branch for renesas-drivers. It was developed against
> mmc/next because there were some patches in there I needed. I know that
> -next branches are not good for renesas-drivers, so rebased to v5.2-rc6
> and cherry-picked what I needed. Further comments from the cover-letter:

> The following changes since commit 4b972a01a7da614b4796475f933094751a295a2f:
>
>   Linux 5.2-rc6 (2019-06-22 16:01:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-manual-calib

I'm dropping this for today's release, as it contains a commit that has been
reverted in mainline:

> Niklas S??derlund (1):
>       mmc: tmio: move runtime PM enablement to the driver implementations

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
