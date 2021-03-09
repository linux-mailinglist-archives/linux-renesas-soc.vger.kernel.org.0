Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2C7332CB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 18:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhCIQ7b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 11:59:31 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:44406 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhCIQ7W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 11:59:22 -0500
Received: by mail-ua1-f51.google.com with SMTP id a31so4736168uae.11;
        Tue, 09 Mar 2021 08:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XCvYpfzoKzKTKDp1QXX9VmpkRBgj4/yBOtg/LfXDr1w=;
        b=Fzd+AEm6IWpsKYSg6gHXMVUUgQyQWMtOVmE/yiCmkSonKKrF6zdoMy/w3Nw4WWEB0g
         13x1M6rnO2tjDaUG9qqaKU0Z4JrG/rR3j+O7f+XUs4/9hDzg+nmF/ordU2/4IWxtdQkM
         gJfkwbDRXIJz4o39ApQzNgK0k55zU5KYODR92c4zJdr38ZOR5yeRuxpE++kNMheRmkCX
         Wh0AQL+WjR4BY6LxIrOeT4q1mLBHo8Hhq2TimyHrcXRo4zs+OEeSFpH5jxaB75yEBH1J
         vPMAE8NLq1AH9f0fyVYLiAjwyEFrvY3R01wzc958m7zXf+Wo9JT6RVQ56xd+gu2S0QBv
         ICqg==
X-Gm-Message-State: AOAM533TLIDI1DoH/WlBvGSJ4iRT0qRh+cJSgcApJCK6NplmhkGkJ77K
        /3+q5vilE2scJUiOifuAmR/i2tCyDqz+8VT3dnaCXQNb
X-Google-Smtp-Source: ABdhPJzryIfdhUQrVQzIC6pzc/Cca71PAjHg8J4xH1qgaSPDR0W6rS7x2N8R2zUdivThVOwrp5V/HxN1OAdQgP6+yxg=
X-Received: by 2002:ab0:20b3:: with SMTP id y19mr16846500ual.2.1615309162004;
 Tue, 09 Mar 2021 08:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20210309165538.2682268-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210309165538.2682268-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Mar 2021 17:59:10 +0100
Message-ID: <CAMuHMdV5Zi4hPP7PsfB7_hycen534_zBjE0Et08Q2BwNrcZppA@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r8a779a0: Add TSC clock
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 9, 2021 at 5:56 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Implement support for the TSC clock on V3U.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Reuse R8A779A0_CLK_CL16MCK instead of introducing R8A779A0_CLK_CL16M.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
