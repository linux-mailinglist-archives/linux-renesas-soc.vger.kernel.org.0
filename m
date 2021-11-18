Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA03455915
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 11:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245253AbhKRKeZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 05:34:25 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:33457 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245194AbhKRKeY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 05:34:24 -0500
Received: by mail-ua1-f52.google.com with SMTP id b17so12651421uas.0;
        Thu, 18 Nov 2021 02:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urgLeqavleorgzQqsupgeowcrEUJP19OSswfhnTfXUA=;
        b=RJXz8isN5//MhkqNdymqJeCZdxHVBkRR/cOup8PrCCLtasbljXYbjuH8equOO+r3N8
         f7OzevrRN41d8nSRhTQ21WaBgY1R6JC5f4kTX5XiGI8e6OejDLF16AGPmojmYQLcZ6fY
         4Twde5OyfCpWP6/34o4dzmZtv1I2GJwIcdAxDoUmYvZuzGSuPMuACv13/+deVKb4L7Ta
         LxMHn3sQhEl0AsxJLpM6Ngn0jptIdmmkOcOXiWJCU923b94WElaxOdp8e40ymh/zOqGw
         1hKnjddMS5xs+ZWXAufyQ5JpIkDd/V/wiE8bCHKeUi7y74ai/AtR0ridlNKX5kBeV4oC
         jxTQ==
X-Gm-Message-State: AOAM533l+4i/VNQuoSrUPZaX1u98mRM7KtntdGfrIw2bc9KUvY3GE8aG
        k0RJPIYbOswwz1AGPnhWB8xXrRmtYaKAiQ==
X-Google-Smtp-Source: ABdhPJzOQjrlJCLMbATdNqyWjmasaz7nJW+a9TBjpCtV7PBv3uGRXUUwTuKC+XwmmcYRh5Jq+hwxyw==
X-Received: by 2002:a67:f754:: with SMTP id w20mr78189594vso.3.1637231484309;
        Thu, 18 Nov 2021 02:31:24 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id bi35sm1373367vkb.3.2021.11.18.02.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 02:31:24 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 84so3490762vkc.6;
        Thu, 18 Nov 2021 02:31:23 -0800 (PST)
X-Received: by 2002:a05:6122:7d4:: with SMTP id l20mr6043529vkr.26.1637231483636;
 Thu, 18 Nov 2021 02:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20211112081003.15453-1-biju.das.jz@bp.renesas.com> <20211112081003.15453-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211112081003.15453-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 11:31:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvo9favMM8Dci-=jniPqK6GkC5TNGfx86qmROk6MR+NQ@mail.gmail.com>
Message-ID: <CAMuHMdXvo9favMM8Dci-=jniPqK6GkC5TNGfx86qmROk6MR+NQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: r9a07g044: Change core clock "I"
 from DEF_FIXED->DEF_DIV
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

On Fri, Nov 12, 2021 at 9:10 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Core clock "I" is sourced from CPG_PL1_DDIV divider as per HW manual
> Rev.1.00.
>
> This patch adds clock divider table "dtable_1_8" and switches to
> DEF_DIV for "I" clock.
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
