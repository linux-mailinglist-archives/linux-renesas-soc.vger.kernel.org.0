Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D6F2F4C7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 14:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbhAMNvB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 08:51:01 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:33510 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbhAMNvB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 08:51:01 -0500
Received: by mail-ot1-f52.google.com with SMTP id b24so1948205otj.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 05:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UX5/HaAgbmp6/yQnSQr6rgD9/kIE2AIfqcv2njy3Zx4=;
        b=lr+X0Jmc1J9QSAi4YudTWa+7DbCq3u5xUwepibfl+l1YA+wQgySt6WzccBct1RE5kP
         9PAYTU5Wc/vRld35ZmecGQ6dA74QSHf+kB5FImdQHrP09So7siWwxaqLkyZUBP7BdBOJ
         FSY6CJjoCgR7ljdBAt+KJTa/ChROqu+r3tK9pAl4qn20iiSd3xQweIdGmWepCAQ8kL/5
         55gA92qgiUtuRDMS6RVKIrNLDMkwJdsbgm39Xw94neRlNgV6rSKD3gcoI8OcirEJ0Wpq
         SyzmsaK95HO3jzht6oTtwatR16O2tMXv7XW6Dc82Rn7wTHUWbfLyHA5cnd8hQjJkR07L
         sNDg==
X-Gm-Message-State: AOAM531N8yNWwbHpkJJgF7L8t8lEBPc9Pvr5DlUA8le8ZQZmMLQJq1kL
        NZanGAC6VdpYIU5hTD/ok1KVIwK8GepVdCzybQU=
X-Google-Smtp-Source: ABdhPJzmPRbiBDcLcTT79/htHaRfNe8wtm6Fvf/Yu9RnMixZQieGUpyPNbiw7shXkZ8VIAx0wXaCHWLesc7qQLetjvQ=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr1223154otr.107.1610545820712;
 Wed, 13 Jan 2021 05:50:20 -0800 (PST)
MIME-Version: 1.0
References: <20210112165948.31162-1-uli+renesas@fpond.eu>
In-Reply-To: <20210112165948.31162-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 14:50:09 +0100
Message-ID: <CAMuHMdU2NAz+XHXZ9_5gK1vgqe18L5gmwjee-a0ZY5tV9QfqWw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779a0: Add pinctrl device node
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 12, 2021 at 5:59 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds the pinctrl device node for the R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
