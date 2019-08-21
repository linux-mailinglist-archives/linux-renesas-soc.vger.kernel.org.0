Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A47097585
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 11:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfHUJCt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 05:02:49 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33090 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfHUJCt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 05:02:49 -0400
Received: by mail-ot1-f67.google.com with SMTP id q20so1396197otl.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 02:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7cg/if8xMyv2xZ/fkTmB1UcQjPFUbR3bWkGPbx5QE3w=;
        b=fy4xLc33peTBxGWKjOLGtjJIUC2LvLNGl+KDS8DuHA+IbTcmRyacAMCJdo08ccQTTF
         M/OS8xCoqBCIIxabYSs3niG8wWzq25Nth/7ZGciIHpZ19KeVGSksSgzFuD0irvezdbzP
         nD3uoIoDMDGNGC+drkMnprLhrEosoWgauy1UbQqL9Md5sB5o1YIDqfk5Jm1AP24A4p0W
         Qd0VG6mjd7vZUGPEYMbP5Q1VCCPw1UqXkRDe7ys6RtF4ZELgF9+o7Dy71OFXBCdZAD5n
         4NzUOHrdB6T1toY1HcN+GrfM3NPiyG/UE6Rc1G7Rv/sAoLV01agMqayR5q/1cs1vGo6F
         gxDA==
X-Gm-Message-State: APjAAAXZlsyeMgzotD4sYBvuUVZisZOLJKckbr2Qvk42HM296RXKoi/4
        5xtpfT4sESW0a4gA8NYDxcxgNMeBDSxidBmNMjg=
X-Google-Smtp-Source: APXvYqxm7h3BGhb2nTaO0TRFEmMhI1Dr7vA+vtEpKooPjV0IP6kH3MN7VOfdj68FwNDdHJXUPZbjhB746bm+q5wcQWg=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr2615380oto.250.1566378168114;
 Wed, 21 Aug 2019 02:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <1566219378-23126-1-git-send-email-ykaneko0929@gmail.com> <20190821085710.ywva3oz733hxagnc@verge.net.au>
In-Reply-To: <20190821085710.ywva3oz733hxagnc@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 11:02:37 +0200
Message-ID: <CAMuHMdW-K9s55TaRMKyNThMfUP7j90sjCK5vEeL8hZd6SCPsTQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: sort nodes
To:     Simon Horman <horms@verge.net.au>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 10:57 AM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Aug 19, 2019 at 09:56:18PM +0900, Yoshihiro Kaneko wrote:
> > Sort nodes.
> >
> > If node address is present
> >    * Sort by node address, grouping all nodes with the same compat string
> >      and sorting the group alphabetically.
> > Else
> >    * Sort alphabetically
> >
> > This should not have any run-time effect.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

> Sorry, I feel that I have missed this in other review's too,
> but, isn't canfd out of order. Its bus address seems to place it
> before dmac0. Or do we prefer to keep it grouped with the can nodes?

We always group it with the can nodes.

BTW, i2c_dvfs is similar, but it seems we deviated from that in at least one
case.

Once the nodes are sorted, we can run my soc-dts-diff script and fix the
last small deviations, crickets, and typos.

> The above notwithstanding,
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
