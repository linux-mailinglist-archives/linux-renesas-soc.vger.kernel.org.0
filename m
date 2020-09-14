Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AA2268883
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 11:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgINJfU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 05:35:20 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37694 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgINJfT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 05:35:19 -0400
Received: by mail-ot1-f67.google.com with SMTP id o8so6571899otl.4;
        Mon, 14 Sep 2020 02:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/XOQMti2o5TdQD26BdfsaJdcVh4iwq1IcP+P1ZlkUUI=;
        b=Bvlav15M3YTQWKcMGM+TojtVZrEqp8clZEEkNVs74OoX3J868+QMqivTkGZsUnOd/w
         dTdMSu/q1uTFrUfEOoH0HpGOXGERVrsJGo2o2Nu76zgfKg8jMO3pX/pslj09zJ7G3LwX
         TlBdL9k6KEMKI5OCRyYc5L67gZw9JFoh6hBvqJT6NAQHdrMpwh/Il+GLDpuugTFGpI3/
         0cushT30HYP2TwOUyVBcWcYpoNGWwFsz8ema3l2sqV3NH5BFY/kX7b3o2KKlxhKs/a6R
         bbbiodgAh3sLpWb/XYU2wK9pUJl8sse1zmcn+9CdQfTamYKnkpANL2vdu+Wf128mCvDW
         QBUw==
X-Gm-Message-State: AOAM533m1FzeOH8o8309s0vuFNtZAOZQI2ZTPq6ZN2f3Mw+OXZFKr5wr
        gffVXlnZHixGMymCfSnLhJTcRL++xYl1L/b7k4X4wNmS
X-Google-Smtp-Source: ABdhPJxJbQKQQXp7lTmFHbW0ztPsAgJFbvkKfOdQ2RgxdYfpOg/GMwwwx3/Wea5uDS+S4dDMWIx7UnUNKhegfDFLjZM=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr8916835otb.250.1600076118534;
 Mon, 14 Sep 2020 02:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200914090426.16022-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200914090426.16022-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Sep 2020 11:35:07 +0200
Message-ID: <CAMuHMdXCQ3LQDWWwOUndkXv15USfX9YFnWtw9JvUcqNyJ7-gBQ@mail.gmail.com>
Subject: Re: [RFC PATCH] clk: renesas: rcar-gen3: remove stp_ck handling for SDHI
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Sep 14, 2020 at 11:04 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> There is no case (and none forseen) where we would need to disable the

foreseen

> SDn clock. So, for simplicity, remove its handling.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> One paradigm is to stay minimal and remove unneeded things. Another one
> is to not change working code unnecessarily. I favor the first one a bit
> more, but would understand arguing with the second one.

Indeed.

Does this make the code rely on bootloader setup or reset state?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
