Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADC44A5915
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 10:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235903AbiBAJTt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 04:19:49 -0500
Received: from mail-vs1-f54.google.com ([209.85.217.54]:37769 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235902AbiBAJTr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 04:19:47 -0500
Received: by mail-vs1-f54.google.com with SMTP id v62so15237741vsv.4;
        Tue, 01 Feb 2022 01:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7I8nPISUsO2F3nrpCuldfTalFkAdDooFUp4tCJPgQlA=;
        b=CXVVJLB0cW3ExHea1aRcscGmy3yH20RRNPKLEYcNveqSXdEg87+baz4ArBOJW3881/
         wrzZnr68rH9i0iU9GthvNUUJxL2uNP1kzp0Tej8Awf1Umng5yQL4ZrpXnazFVZ8uBYYr
         B0z9nIYj5fH8p11wkqtOTxkk9X6pL9GJnsMNzzIx9NNxDBR38XmeAeTqEzvCrkUdjjYG
         tI+pQebIgqhVSdKF90HYJwrIwQryHQykao9/Bidby3DHYpvHmoM99IURm/x/oMI/4r0T
         7/Oabop4thJv+i+wkib9m2TeBbWHDegPIjDMxiFBFe5Xea2DUoE1BY0NkkKkCzdtJQ3C
         TPYQ==
X-Gm-Message-State: AOAM533hVbCn+epS3b6x7JqCikslKbmnxldoO5USXwiopS4g7Ce9vJ9D
        Pv7l1GEdwrMpVAnuy6hudurbw/YQFRn+aQ==
X-Google-Smtp-Source: ABdhPJwp/W7hqhWPrDZmSLcwve5wMymmgoM3KAAM80o+BStSLYv+5SlPfaTR+U6oBt/dcbwA25P/kQ==
X-Received: by 2002:a67:f44f:: with SMTP id r15mr6650101vsn.80.1643707186911;
        Tue, 01 Feb 2022 01:19:46 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id x20sm4021055vsr.17.2022.02.01.01.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 01:19:46 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id e17so13444648uad.9;
        Tue, 01 Feb 2022 01:19:46 -0800 (PST)
X-Received: by 2002:ab0:44c:: with SMTP id 70mr10130274uav.78.1643707186162;
 Tue, 01 Feb 2022 01:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 10:19:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYtgGY1sV6i=55DuUCXBv5nUb0MevQS73RW1CStdJSfQ@mail.gmail.com>
Message-ID: <CAMuHMdWYtgGY1sV6i=55DuUCXBv5nUb0MevQS73RW1CStdJSfQ@mail.gmail.com>
Subject: Re: [RFC 06/28] clk: renesas: r9a07g044: Add M3 Clock support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for M3 clock which is sourced from DSI divider connected
> to PLL5_4 mux.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
