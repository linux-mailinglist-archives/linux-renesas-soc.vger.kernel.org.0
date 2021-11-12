Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF6544E772
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhKLNgZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:36:25 -0500
Received: from mail-vk1-f172.google.com ([209.85.221.172]:45891 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbhKLNgZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:36:25 -0500
Received: by mail-vk1-f172.google.com with SMTP id m19so328557vko.12;
        Fri, 12 Nov 2021 05:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=etPRGi11AY4ky7LtzUdH3OQHWHSllnwezdLYHe0lw3k=;
        b=p6QTP9DZyGk/aCw1CeJe2MTIBHZ+aH95FFr82lkFBFwq0I1wgc6RfFy44hR+f9+9KR
         8wlfIWixuyzsTEeIglkTkT7AdqtqCltqC4BAUfaui2jeAm4DmNP/ABcsgfClB4ROI8c6
         BemKU/Fg9ShATgfqFD4kWR03q+7kfnx6e1ZfUvQ9BM3/T1z0pa86uJZW8FkFNV+RhR38
         ssbWrwxu0E8NF88ehr8alNpZDUg1eWlbeXym2eZvTCz9cXiWK8RQsUjRlAAit2OFnwHY
         F2qqM6nKUWiIYcOgEYEavXGaK8ggY6IAUPprUkQLttnrYn1ZzUJlYJVTSHavexy1Ml2Y
         m9AQ==
X-Gm-Message-State: AOAM530tkDoPJljW/MD5bo/Q20eZmlNsHvEjE6/mc6hk+PPBmfamP2e5
        BOQB1c8pxqzNO31mosAMO/kpEp3RpbThqA==
X-Google-Smtp-Source: ABdhPJzmDACCm3Q2JlegJuBGOrkR5zxAbOG2S1Z+MTtyITc1QRGikItUANGaKtCbdEm2m11kQ0an1g==
X-Received: by 2002:a05:6122:16a3:: with SMTP id 35mr23311457vkl.11.1636724013954;
        Fri, 12 Nov 2021 05:33:33 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id y2sm4073790vke.43.2021.11.12.05.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:33:33 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id l43so18825996uad.4;
        Fri, 12 Nov 2021 05:33:33 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr22602878uae.122.1636724013010;
 Fri, 12 Nov 2021 05:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
 <20211110191610.5664-20-wsa+renesas@sang-engineering.com> <CAMuHMdX7wrHvBEjB+EbA6+vgCsPJdx0yh8Jx4eFuX9nPCf5bqA@mail.gmail.com>
In-Reply-To: <CAMuHMdX7wrHvBEjB+EbA6+vgCsPJdx0yh8Jx4eFuX9nPCf5bqA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:33:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYZ=oHoOHxR9MMNTq-QY9DbUYxuTgQRqmdXK92aA2==g@mail.gmail.com>
Message-ID: <CAMuHMdUYZ=oHoOHxR9MMNTq-QY9DbUYxuTgQRqmdXK92aA2==g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 19/21] mmc: sdhi: use dev_err_probe when getting
 clock fails
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC clk

On Fri, Nov 12, 2021 at 2:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > This is to improve deferred probe in this driver and to keep consistent
> > with an up-to-date handling of a soon to be added second clock.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.17.

Oops, renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
