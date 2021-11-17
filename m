Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461634542BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 09:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhKQIib (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 03:38:31 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:34426 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhKQIia (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 03:38:30 -0500
Received: by mail-ua1-f50.google.com with SMTP id n6so4255059uak.1;
        Wed, 17 Nov 2021 00:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKIA1upJqygr//sjp58akhT1zX2W+sdXN8b5hk4xNeg=;
        b=IyvezFj2kQ1Z63MNr0AeXY6pnQ1yJfGgscuGbYT7NgruaNyKwKV9pn85h4fNnOsDNv
         dNX+SJTeD6duwn1BRfmnMbP6CCq/KQMeWzmcKJd9DekvOXCprKWE5ddAbLmwm2JJPSKj
         7ggDT7aAaUHc1qbH9RTK2ZBgXvg4DCAd7AAWFXKji5/Ybtu8otOfTN7f05/twXbkl3WZ
         oEqrlx+nTkukyCAKmh/FVuopXg3dIexOZaR58TjcYe/hXnCju4b/HtLWb5UBp/Zdmvdj
         SnjtZlSw/vAvlt0GLkj66EOs40CIz6zR1uJk4lYiQ9YxxO9qpCv2uSjSWVE0WYMQI7oG
         cknQ==
X-Gm-Message-State: AOAM533MT3ETyG1U+6UUBSz1BdjXff9zjwQljxEUikuwF+t+H25qurHp
        fXzNPmL7CzXJSdragUvlhYQmkfEsHpi+4A==
X-Google-Smtp-Source: ABdhPJwe8lIUD0WHjtuDCoKY2ae8+gVFj6JjVkV1GY0fzyprwwy/3k46cN2X0MqOPFkZuz/UWQZFCA==
X-Received: by 2002:a05:6102:ac3:: with SMTP id m3mr49055434vsh.1.1637138131210;
        Wed, 17 Nov 2021 00:35:31 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id p69sm13515202uap.1.2021.11.17.00.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 00:35:30 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id j1so1191059vkr.1;
        Wed, 17 Nov 2021 00:35:30 -0800 (PST)
X-Received: by 2002:a05:6122:20a7:: with SMTP id i39mr84861911vkd.15.1637138130556;
 Wed, 17 Nov 2021 00:35:30 -0800 (PST)
MIME-Version: 1.0
References: <20211117002601.17971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211117002601.17971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Nov 2021 09:35:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyBcJ8FB+AQ4QEVFXnCH32kJwNmRqs_FqYpmtWcVMxBA@mail.gmail.com>
Message-ID: <CAMuHMdXyBcJ8FB+AQ4QEVFXnCH32kJwNmRqs_FqYpmtWcVMxBA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Add RSPI clock and reset entries
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 17, 2021 at 1:26 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add RSPI{0,1,2} clock and reset entries to CPG driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
