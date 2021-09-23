Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C8A415A21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 10:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239934AbhIWIjT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 04:39:19 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:33659 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239825AbhIWIjT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 04:39:19 -0400
Received: by mail-ua1-f42.google.com with SMTP id r8so3808250uap.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Sep 2021 01:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U/pFrYTob2ifKcgVKwLtm1GfZ3n4MB/R4ebsnK8iJ2g=;
        b=2ZngOig+EnRF591sJPRZCBw5clPqP74MhzkgMraBIGqFimew3Ez1HHiqnFmMOVpUHW
         JKKTSzttAW9dzkvl1mKWiIffazY3oeb1/J071zNNT5hVMZtHfqIjEGdzyJpTzEDdYDMC
         2JS+tAdkvaDe1TxSlYTiLhkb2PE5UiXGD01roC/Twd/ozT6o5mhSP8cagbOY48qt/vac
         qwGk4Tl1TwMqgpauUFAj8YEJK0I9TEGr28EiFD69iExE4M9P7d2VAHFIw8i/eq58BM1N
         Fe5E4Bzaqa0H3vaItAVrp54sQWiEYeuVR/U2uVdxxgf4BNfxUajTofg5EMpUZciPpDVy
         6PnQ==
X-Gm-Message-State: AOAM5336Sukt46bBEdGUFwidF7g84VXUmf2CH15YPK9XX/cUuUTR1yec
        JLJklQwpqMdHi77h6LeKUT1zpY/GIFVloGZAGGc=
X-Google-Smtp-Source: ABdhPJy0mj4YShSDy2bFa5tGjYTo6ueTdRSfQcOqMTH3XiEZW7XGiKHg4T6UabRk3NiLTLIpc7YNSklnPBwlD+VxqiY=
X-Received: by 2002:ab0:7d5:: with SMTP id d21mr3217756uaf.78.1632386267563;
 Thu, 23 Sep 2021 01:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com> <20210913065317.2297-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210913065317.2297-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 10:37:36 +0200
Message-ID: <CAMuHMdXQqFV+s850H77surH=zqVJ6YpL4Er=G-1sUNnNO-8x8g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] clk: renesas: r8a779a0: Add RPC support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 13, 2021 at 8:53 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
