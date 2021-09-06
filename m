Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A792B4018F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 11:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241384AbhIFJhl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 05:37:41 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:45996 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241357AbhIFJhk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 05:37:40 -0400
Received: by mail-vk1-f180.google.com with SMTP id h13so2002590vkc.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Sep 2021 02:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kx5CHIwdbz1sns6tWIZi+lgKXX1uo27pM8b/M9IRHyc=;
        b=TQMIG4jkQzVa311XJq1JZS/jHMkWJB5DyZYHHKWC4MzcHwweFcZF8uCCTQ6C7gZTFZ
         Pe3Q+hdOnVN2mVq0rwX1566XJGAmpZ8gDvvpE0TatOS88ExQZ7DspWtVAWkR/JPL+J/N
         Uy/0a8c6/pe4dgNn2pWbbPA+qI/7BNA8FcwhyJ+Qhhd5G0E4t+qz8eXmD6iLsUyI5EBb
         tsapcYs8T/lkU1OLcHZwOleOeMBHOwDb6YxrxmbENFq8wMsjP2eskhhip756vM8vQyvp
         Oh2ksRwyGbSteFDfIQItA8+vv5BQjwNksgLMSo4qQovCt+sTwd/KuUgsI0lpR8rtYs0n
         HAXQ==
X-Gm-Message-State: AOAM532Ck72eeW3bm8L8zPf+CdgtYv7CMNuIFXBxwLctCr79v68jWfP3
        Xde3N/OuhN/0AvcHw1jnDRoE8RT6nbiNA/OeJWNrNPS/
X-Google-Smtp-Source: ABdhPJyK9arCX/wbrPmFaR2FW9OjnRijw6LzZPGsmHsRwsDr67UvknpydPDBhKJbE1XBhxganfvr9SSE8EB/D48+o/I=
X-Received: by 2002:a1f:9743:: with SMTP id z64mr4616907vkd.15.1630920995903;
 Mon, 06 Sep 2021 02:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210901091725.35610-1-wsa+renesas@sang-engineering.com> <20210901091725.35610-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210901091725.35610-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 11:36:24 +0200
Message-ID: <CAMuHMdX=+fEEnWq8zZfCdLWLLhv01_2WfDTjK7_+uSPmmj+f5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779a0: Add TPU clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 1, 2021 at 11:17 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
