Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8E23B459A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 16:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbhFYOew (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 10:34:52 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:34650 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhFYOet (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 10:34:49 -0400
Received: by mail-ua1-f48.google.com with SMTP id c47so2927174uad.1;
        Fri, 25 Jun 2021 07:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dsz49e/2NwfOTqNhnIgPmeusYc1ZyQHSh1En7e1zHbo=;
        b=mAT+Si/1+fRYTcloWHEB0EyKPa+fdPbyINNp4bFuv4c/pOS5jghaWS+SpGcRyAN1Iu
         dmHNsOJqAjWl+55lxE7Pt5X+NNK0jYJqGu35ggTY7oi3M/dCzEDwq4wrQY11JeM0QmNF
         eu0aS5ODFSp5rOf74qodmS/56Hb3T7dlpSvDKLSSGLaD2qF5SGqX3BQ5Syn7NN7Or6pX
         nEvmUQHZfVr+QlprU3ExUlF+kNqHFaB0nd5yfq9LzXBmagmHUEGju/5KxpRXcqv+OX5M
         cicNQInyxCmoQnC7+C+yDasEZVyIN/Z2tZ0/VfjBcR5em2lENcxjTVEIwikTkrLNYDHg
         IdgA==
X-Gm-Message-State: AOAM532AUqRm1h9hCm/GL5mcprvnrnPIBHd1dCfIKY1aeunUcCprtHys
        Fo0RnVpDhGiNeWi9hKVOEe5iayJ8sJT7BqUIvvw=
X-Google-Smtp-Source: ABdhPJzZYt+YPio3lZKuN5vTWW7DVTXYcPipcHUEaQfGq9Fs7APpxX4DDz1r6/Fn8DTnGdhYeCeAx0mTmF+vIv89MdI=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr11833856uad.100.1624631548452;
 Fri, 25 Jun 2021 07:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 16:32:17 +0200
Message-ID: <CAMuHMdUrd2yN-vGpk9b7X=AqFrHAsQzCGVar87KR61=KhhXdUg@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] drivers: clk: renesas: r9a07g044-cpg: Fix P1 Clock
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

On Thu, Jun 24, 2021 at 3:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per RZ/G2L HW Manual(Rev.0.50) P1 is sourced from pll3_div2_4.
> So fix the clock definitions for P1.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
