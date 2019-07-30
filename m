Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 468EB7A3C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbfG3JPH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:15:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43675 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfG3JPH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:15:07 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so64881463wru.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1T7w/YSm1mZ9P2MY1HKuwSxq+rVbqV+bb06Sz93Z0pI=;
        b=jEjLRyYTHoOfaCF6FRuoR7C1TtgH4ebQta3+L/cQ7Zn3pLLUh8fuQtGSNwoAJqI0fa
         sD/eJMONTerpEGIOJHBNnjwO6/j6i2vX0yny3TwmCt6cmaxqYbqc4gORuQHLzNQtjutk
         mUhBrzXnDHzTKO3ysHB8urg2ZK+Wz1bZLFwJkokON5RFlXC5w6rlj7oFsknlgE8k1AEF
         l32W4DkvTDxYQzzGtNVosEWXuGDpwEVyKNmbRmqzwtCBWT2LvVLlsbvy+UNGVjlBWTLm
         vRNe0sKQI7A2b9yGFvJhhj52QqZXnTjl3FKhi30QSNpKXO7M7Hb1MQ4ou9ZWOtfK61QS
         HjPQ==
X-Gm-Message-State: APjAAAXOKT2F2cCHM3AVtwNrCJP24INS0oPAOmIrBLmJPfQyQT7P+Ewf
        IHTC++rLQ8E9Hn5SciSdojbrj8FytTF9btnjrAs=
X-Google-Smtp-Source: APXvYqxoxTT1wmvpyMa8FKPqmggSviDHWrloUn/i6511/eWkiPSVapIUIKi0gXLL53gx/aENhGaRg4iiYwmtUwTqjmU=
X-Received: by 2002:adf:f08f:: with SMTP id n15mr41807530wro.213.1564478105315;
 Tue, 30 Jul 2019 02:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <1563905046-2949-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563905046-2949-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:14:53 +0200
Message-ID: <CAMuHMdXqEB-=Hd=X4Wyg8MUTVYmhpyFf9FGEqUrV6vcrCO8aRw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 23, 2019 at 8:04 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
