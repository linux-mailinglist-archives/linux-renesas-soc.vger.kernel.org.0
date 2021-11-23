Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8083D45A16C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 12:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236097AbhKWL23 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 06:28:29 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:45705 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236138AbhKWL21 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 06:28:27 -0500
Received: by mail-ua1-f51.google.com with SMTP id ay21so42939376uab.12;
        Tue, 23 Nov 2021 03:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8sSjmpy1re8sH8KGBC0ngI9jm/3/bigOcYcpsRIk2TQ=;
        b=owgKGpZex8zWpXBFYYRcmDiilW4lH3jt8ZGroIBaDK22XkKmJE2ltQeUkrdih22Lrn
         bn6POwcAkOLtHAPOBXvUPKTycNiffR3rm44lzRNf9034ZUBOWdihA6duWvnuQnpIvqBi
         BoC5lfChGG+7dw+Kzkp6s9CH7GRtGj0GtGbXUUsydE0Gbm4Hr1fgGbCKMJWsV4/FFfRT
         1xfuEelVM6/e/uLhA5HJIw80IjNquWxNXyB4SObCWh1D7GCRSds2h6fopfjqAVdHRK+R
         2DUhNmkz8yN4H5E7JDYHyQyhMWCrLtE7jUecBtphDCdLQ1OfFi9vXgSnBNUJ8EHWHf/A
         RXQQ==
X-Gm-Message-State: AOAM532Nbm9TLb4+tHEmWuyEPAU24gW9PiIjsv1gWP7zO0X6kr3lC+tX
        RuQ7laNzKk6sMbHIXbTHONlpFjcV48VRLA==
X-Google-Smtp-Source: ABdhPJzScgeizF9LkpLENHJZo8eG4lT1Uf19A8WspqruAbFVude6adazXrcD/OCYYLegcMGZwO3SOw==
X-Received: by 2002:a67:ed07:: with SMTP id l7mr8139678vsp.40.1637666718876;
        Tue, 23 Nov 2021 03:25:18 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id bi35sm5989625vkb.3.2021.11.23.03.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 03:25:18 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id u68so12167858vke.11;
        Tue, 23 Nov 2021 03:25:18 -0800 (PST)
X-Received: by 2002:a05:6122:20a7:: with SMTP id i39mr8555639vkd.15.1637666718176;
 Tue, 23 Nov 2021 03:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20211120180438.8351-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211120180438.8351-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 12:25:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdagspbPCthRrECcSP08hgZybVj1Rahn4zo8ZN=tke4A@mail.gmail.com>
Message-ID: <CAMuHMdUdagspbPCthRrECcSP08hgZybVj1Rahn4zo8ZN=tke4A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a07g044: Add TSU clock and reset entry
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Nov 20, 2021 at 7:04 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add TSU clock and reset entry to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
