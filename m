Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E57B44E760
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhKLNf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:35:28 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:46675 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLNf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:35:27 -0500
Received: by mail-ua1-f52.google.com with SMTP id az37so18747079uab.13;
        Fri, 12 Nov 2021 05:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKZ0jId7Tfb3kM1dpOwM9Yn5i65rf9uQzqNaQifu4Ek=;
        b=rtQlNWcSafUpioog1dXm1t+mSrL2DF3qu0jdrrBJVbOBuWHXcjpMinShx1M74qPBOB
         DdWzpjFOPBv6hg7l7iOJWGp2FpASf/ziJo/YKQLsm1ndXXOLyBTj3JnEnaZnEc7Sb+Qw
         Se1PeWDEM9rdp4GN/K0ktIAdMuvWIuRG6GrS5qxdQ4sO81e0IyWabqdIyata1coRlyWn
         0HgcJ+2C1adnt3vvkyBStAGds5nXrjUsyS4hnh5MswIGCkYOuYUc55T9OktBSvAYFhZl
         8vnuUuji8jauYWqf+KdXUOHoWIt5Nf8D+ZVsMEzs+EDT+Jha2ga5IJNxgp+l0p4SyHCm
         YFqw==
X-Gm-Message-State: AOAM530UZj9LPwsHf1TGSYwmLhX0eWVQR+gGLIcGxzLAOuMo9Krjg+uP
        emFp32p9XMdQX50RJXP2hZXQZIi1eOltrw==
X-Google-Smtp-Source: ABdhPJwQ03T8yaFn1c5cgXacqFejJyy+cq/0+RCKOQ2DnMY0YRSXyX09z32Svd6ekiWwjGe/EipDOg==
X-Received: by 2002:a05:6102:418c:: with SMTP id cd12mr10115833vsb.17.1636723956776;
        Fri, 12 Nov 2021 05:32:36 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id j126sm3886197vsc.17.2021.11.12.05.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:32:36 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id o26so18855743uab.5;
        Fri, 12 Nov 2021 05:32:36 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr22258763uaa.78.1636723956220;
 Fri, 12 Nov 2021 05:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-20-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-20-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:32:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7wrHvBEjB+EbA6+vgCsPJdx0yh8Jx4eFuX9nPCf5bqA@mail.gmail.com>
Message-ID: <CAMuHMdX7wrHvBEjB+EbA6+vgCsPJdx0yh8Jx4eFuX9nPCf5bqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 19/21] mmc: sdhi: use dev_err_probe when getting
 clock fails
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This is to improve deferred probe in this driver and to keep consistent
> with an up-to-date handling of a soon to be added second clock.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
