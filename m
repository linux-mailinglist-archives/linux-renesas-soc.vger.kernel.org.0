Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6DA265AE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 09:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgIKHy1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 03:54:27 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40403 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgIKHy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 03:54:26 -0400
Received: by mail-ot1-f68.google.com with SMTP id e23so7622303otk.7;
        Fri, 11 Sep 2020 00:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRv9yIHZZUvAx/sjt2B6TJL/6NYp5TV525d+8nPrBR4=;
        b=fh/O5fUtsq5Xf1bbPkKUfnqzg6UvHmmlucNN0EI/12o4RFljr3dQtw3Bk66X33EzN9
         HPN5hOz6k5kKLoCCcRni1Sny5LYN07nfZ521w4lqgOKbpSVIuP2M4P30iov0YJmnQI3L
         Hod8dQEeqEv2XzoP0DNDoanFn5c4LXZSCFohSDzKLjKZicoH1kyaiswmZk3uLSNCyPnl
         KiiQLdp3UzpnmIMl62MyG1PMZ1JfIdOGz3ym/LmuUheck/s3Imb93zGYMP1aNTWf7A0s
         3BFq4A0+LseqrNeIYj8wIR6ltWhj14nO74hsqOYBxfUhSJlJNEVEPQwl6iXaZ4Apd0vv
         p9QA==
X-Gm-Message-State: AOAM5317wgNxP01rLo1nMLKN1d658a34utl1Ehtcq2Q1T7sBWRbhOdCZ
        j6PjC71LQtNg2Zrj0QGnvFYuJ3yL53P7cyTv5uM=
X-Google-Smtp-Source: ABdhPJzfYgS+XIweSuz4KWbw0J+8mr1lBKPTB2E+08G5MRtC2rI6aDS+r0yC6XPxYBq5m1BBJrK1GA/NBSzzIcumv9Q=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr447420oth.145.1599810865961;
 Fri, 11 Sep 2020 00:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87a6y1rtun.wl-kuninori.morimoto.gx@renesas.com> <20200908060657.GU6047@pendragon.ideasonboard.com>
 <87wo14rd9v.wl-kuninori.morimoto.gx@renesas.com> <20200908063732.GW6047@pendragon.ideasonboard.com>
In-Reply-To: <20200908063732.GW6047@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Sep 2020 09:54:15 +0200
Message-ID: <CAMuHMdXb4G65k_Scp-0qakedg0kNYM3d3Nm6_ZsZuOEdygn8mA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: renesas: r8a77961-salvator-xs: add
 HDMI Sound support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 8, 2020 at 8:37 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Sep 08, 2020 at 03:33:29PM +0900, Kuninori Morimoto wrote:
> > > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > >
> > > > This patch enables HDMI Sound on R-Car M3-W+ Salvator-XS board.
> > > >
> > > > This reverts commit b997613fad58a03588f0f64a3d86db6c5bd76dd2.
> > >
> > > Which tree can this commit be found in ?
> >
> > Grr, I forgot to remove it from git-log.
> > will fix in v3
>
> No worries :-)
>
> I've applied patch 01 to 04 to my tree and plan to send a pull request
> later today. Could you just let me know if you're fine with the small
> modification to the commit message proposed in 04/10 ?

And I'm queueing patches 6-10 in renesas-devel for v5.10, with the "revert"
line removed.  For patch 6, I took v1, as it matches what we did for M3-W.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
