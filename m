Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710C9459F4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 10:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235008AbhKWJe1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 04:34:27 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:33398 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbhKWJe0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 04:34:26 -0500
Received: by mail-ua1-f47.google.com with SMTP id x14so1833446uao.0;
        Tue, 23 Nov 2021 01:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ka+eO5aFCWtseuMTQkGg3kQstjMkO2UGRuVElhrFmmM=;
        b=AqoMPjosaeAuIwhIeh25M6X3onwq49iAUE1xgrKE9aShqfnY4TalEyARAXOoz3mVIo
         Dpj9pbeANGScFhzGyqnOUfXYgzJXufjuvQ+ffjXlCoeVvn1Mh1ShM7Rb1ONBf9oTCnKB
         NNiQ9k54iszV0IoWXYSiPxpQEJe44x844tpsaKErDqvZ+qfl6zy9jQvh6JAozRi3GF81
         hBvXZUwGRt9uWg0Tq1SSiowUQpzcQdL4uQWg2aYu5snvymwLz6/lHNoo4lT5Pu2LUYkK
         zfzkIIt78R/MzTD8u98If8OCbXPTBOmt2Z5P9pVUAOftF3e7yqmo1pdRFcE9Ayo+oqGM
         DCwg==
X-Gm-Message-State: AOAM531iYDw6XBgZ9BoP/NDPcHKXhlujpVzMhL3VOe5+L8+uH5YcnYhw
        2TPapVv5tmQ7QBc2EubqY210ApES1232Vw==
X-Google-Smtp-Source: ABdhPJzAFHLg5OgIayJsm7amIrLNz1zxMRXi37ItbyLwm7Tv9LWtHSWvniPWBrVfr/i393u1P2h0lA==
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr6909155vst.37.1637659878385;
        Tue, 23 Nov 2021 01:31:18 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id f7sm5831004vkm.31.2021.11.23.01.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 01:31:17 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id i6so42366690uae.6;
        Tue, 23 Nov 2021 01:31:17 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr6077943vsl.35.1637659877515;
 Tue, 23 Nov 2021 01:31:17 -0800 (PST)
MIME-Version: 1.0
References: <540d803d31bf9aa1d0f78f431cae0ccd05387edc.1637069733.git.geert+renesas@glider.be>
 <CAPDyKFphP-Zx878DOw9YaVKE8EvBPhtq9SdJNK5HEDiW8Ly50g@mail.gmail.com>
In-Reply-To: <CAPDyKFphP-Zx878DOw9YaVKE8EvBPhtq9SdJNK5HEDiW8Ly50g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 10:31:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUa5J5bpCck9tBy4bA0wBU0YJ3ze1ry56bYM5j5bJKCag@mail.gmail.com>
Message-ID: <CAMuHMdUa5J5bpCck9tBy4bA0wBU0YJ3ze1ry56bYM5j5bJKCag@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Use devm_clk_get_optional() to obtain
 CD clock
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulf,

On Mon, Nov 22, 2021 at 12:26 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Tue, 16 Nov 2021 at 14:36, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Use the existing devm_clk_get_optional() helper to obtain the optional
> > Card Detect clock, instead of open-coding the same operation.
> > a side effect, real errors will now be handled correctly instead of
> > being ignored.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks!

> I guess it's best if you continue to funnel renesas_sdhi changes
> through your tree for the current cycle, to avoid conflicts. Right?

Sure, will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
