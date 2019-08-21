Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6639754E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbfHUIrF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:47:05 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35859 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbfHUIrF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:47:05 -0400
Received: by mail-ot1-f67.google.com with SMTP id k18so1347440otr.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 01:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2UU1LvAktINA7rZOqc7JKeHUMfREBfar8DY/lNyPx0=;
        b=ABDaLtLlbmyOY7OBRGF6K46IUqhnNt5HBq7KEzmAMQh5pw/6foBkpSffDXfPQOlmto
         iBXl0aO6gwziFXygsIj2uZJzvm1Xgcj1+OHNlvS5SZxBNjB7/nqBVtQCoruOIeU6l0fP
         NF+4bdLjztsbldPaj3LVnNvIj0eYMWnt2kMvxliCm3GLQmOlqchqmmG5g+cmdlS3xxxQ
         TMiCGwifczX3NZzod4al0nqzIp6RFnzqqR1kAbhqzK9EYRo2//QqY2TeYapTdSr+IC9i
         0MePkO+Lu+NMUdMgTZaNp0uu9Y8nrg5MPNxn98MRfJBGi5/C+kT/W2LKPh6qisXb+Egn
         eU3Q==
X-Gm-Message-State: APjAAAXgm5epNs/9EE6JM/MinGCAmLLmlQC5qikn+SEptsXBiZ034xA7
        YtQYQJwfMmjPd0svA6jD8uAaZMeYVZKTlQMDjYuCUw==
X-Google-Smtp-Source: APXvYqwOLkVYccbsCTHi0L2R1Rlv+0n/kkDXGg1Oh1WXHpSa9Ea0ccF5B+Ol95POupR7fObO1DA5X97L7fgDcamgiLU=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr9067488otk.107.1566377224105;
 Wed, 21 Aug 2019 01:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <1566219341-23048-1-git-send-email-ykaneko0929@gmail.com> <20190821084101.evn6xeiqcqv772um@verge.net.au>
In-Reply-To: <20190821084101.evn6xeiqcqv772um@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 10:46:52 +0200
Message-ID: <CAMuHMdWnAMH2VOcwk9oJs+r_NExHhGn4qMUTAuGjrZUSsvAXRg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: sort nodes
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

On Wed, Aug 21, 2019 at 10:41 AM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Aug 19, 2019 at 09:55:41PM +0900, Yoshihiro Kaneko wrote:
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
>
> Thanks Kaneko-san,
>
> I think that the i2c1_pins and hscif2_pins nodes
> are also out of order.

You're right.

> I'm not sure if Geert would prefer you to respin or fix that himself.

Will fix myself.

> In any case, with that problem resolved:
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
