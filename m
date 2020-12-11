Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A042D760D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406007AbgLKMvt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:51:49 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41038 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405984AbgLKMv0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:51:26 -0500
Received: by mail-oi1-f196.google.com with SMTP id 15so9672473oix.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Dec 2020 04:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XODk7vx/kezVA+uqz3mqm8tv6+XzVcvTimopyR1Prng=;
        b=exukkurJPN8DoYgMEWiWroKStv1GDE6YWEiouLi5Ry1ImZkAKJwTdedNiwtAxsYNO6
         u9wL9WlRxE2cecOex/AKWlwa38de/gUUjH0sP/gL+FX7bY6LtUsPjAD/N6Rl3Z4Ael2J
         7T4ClYyJ5WnPHLZk99JdcoE4Vtwq2enE778T+es4wilQpfDXcIK9dy8WL301Li4jVKo5
         JgJYJCGEvh7gObQRr8v+poSU1BQU52/a2BJcw/dA0pq3WVhV7S8d5YV7NdaOt2EGlR7k
         pabtJ70yBsRireGV22xi6Odb7lK3wurUigIWRj5rLnuVlvFpfvFP+dN7+upgdNRL/J6o
         YTwg==
X-Gm-Message-State: AOAM530Rcj0lD8ZNKU5NdnEVGSquVCPN4GvyKN1mqtB5NRiwWFYbVjfS
        NdRMDw369rfjLyBd9JA5jogl36F5ur1D3tnmlw4eYO2bZLA=
X-Google-Smtp-Source: ABdhPJyElj1CAPimWv4oaBj0pYGNgWGiD+eGbPBIHGAmMKgXvgVVQaD1N4zcf3uMHynm4Kxw//aQQqLAgufIj5uE2xU=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr9037866oih.153.1607691045590;
 Fri, 11 Dec 2020 04:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210142021.163182-1-julien.massot@iot.bzh> <20201210142021.163182-5-julien.massot@iot.bzh>
In-Reply-To: <20201210142021.163182-5-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:50:34 +0100
Message-ID: <CAMuHMdUaosTSECrQgwnyG+xOOf=k65jzm+f3emP86Nqx7QHukw@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: renesas: r8a77990: Add MFIS clock
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 3:55 PM Julien Massot <julien.massot@iot.bzh> wrote:
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
