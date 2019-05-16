Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B49420708
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 14:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfEPMeS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 08:34:18 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38515 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfEPMeS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 08:34:18 -0400
Received: by mail-vs1-f67.google.com with SMTP id x184so1165365vsb.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 May 2019 05:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PM1qngWjwgdIjnMY6gGnrSPh8XqrRXVBDjjXGOvKIY4=;
        b=DDm4MSEuhYbySVqfrMvk9HPd0z6VNwZ+s5IRZc/aCpKTcmSUfW0MwIo7SMCO8lnyYj
         bmLjpaI75Qrj03qpApSJ4tNZiMEU7sR6cEvI6fNSXxvz9TnsTk0C/QuCiLHVcIlRXlRU
         iKB1EO4YsfMzQ9lj4KJ4rhtaiBhfsUzlkYwNS+1fKR+lAiApk/LOreZKUurkr4UyiYRj
         OO17Qm900+PhRuWGj6lvbiA6iZg71kHMPJmhBr/s5+cOo3atzvhU20l4/BA2CQAmPbHx
         75rXgxplr+nwtou4+OYdXRIACDUulcBrVPJayG1Wrf3D7fbayjwNoVno+vdP7GYT4iqF
         vUNw==
X-Gm-Message-State: APjAAAW2TSwRqh2SLbTHFPS9hbbSJt9FLk/o3zdmtAesjdfsQRHi+fC6
        Z81rJ9+7n2Romn54dw6zP5Dw4+LtooxxhzBm+MI=
X-Google-Smtp-Source: APXvYqz4MJ2LyVq7AD/1SiiEJ0gOSXV+RuU3CD0zRANRLh7HBTtGX9Ke0jofJT2pnhWFH+bvzkXhv9R9o+bFmgaCfbQ=
X-Received: by 2002:a67:8e03:: with SMTP id q3mr24076104vsd.152.1558010056807;
 Thu, 16 May 2019 05:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com> <20190516121659.GA2832@kunai>
In-Reply-To: <20190516121659.GA2832@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 May 2019 14:34:04 +0200
Message-ID: <CAMuHMdUpqbQ=3hBzt9nYfy-jwSbPQ9kF8Q-org=fecR_RiDN4A@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one warning
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, May 16, 2019 at 2:17 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> >               error = of_property_read_u32(np, "reg", &channel_num);
> > -             if (error || channel_num > 2) {
> > +             if (error || channel_num > data->last_channel) {
>
> Just an idea, I haven't tested it: Couldn't we use
> ARRAY_SIZE(data->select_value) to avoid the extra member in the struct?

No we can't, as the sizes of the arrays pointed to by the various
SoC-specific structs differ, and at this point in the code, we just have a
pointer, not a fixed-size array. So you cannot use ARRAY_SIZE().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
