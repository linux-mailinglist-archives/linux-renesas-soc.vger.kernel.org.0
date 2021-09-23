Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67354415A06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 10:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbhIWI2f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 04:28:35 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:43942 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239676AbhIWI2e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 04:28:34 -0400
Received: by mail-ua1-f41.google.com with SMTP id 10so3717537uae.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Sep 2021 01:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=erdzLNOy23rIXH8VrTZ0UGFWfuTGScay+iSwfziVL1s=;
        b=5uvDvDfflyUhcRum/TOx6JXlPQtQ0VHKro8vqsKQ7Pmq2a4UfabOpyXZEHXEw84xXH
         aAWxTltkK2hLAPb+98170pBKD4z/gjJEc0O5kgIOhq58KUznQiYNcbBDowRDheYXe1Uh
         qjCHNHdB9w0LIfynrNRLEjGOsyIroLN4O0P+pOG+meIDCXEuDn1GEtG6x/Hd3zIflHaj
         KN2jBoLXLL6rPed2qSzv4O46SIFbHDBvTjAyhnog2TaG+4/3ihaAPvnQzcfxk4KT3EoY
         vNFG16YPK3spuqswoCgfK9HvzR3O5nFHrrGnSBP297pGhsG5H2UuBcJG5uJNisCgezZR
         h3Lw==
X-Gm-Message-State: AOAM530cu0FPcwfczC9+yOJTByNxw8Nnei7hSh16imTT3Tkt/QD2R/0J
        r8a0mBW4jkG3B30tGWX2r49ffQfEIC1PsK6aA0ZTDHp3
X-Google-Smtp-Source: ABdhPJxraIv9ccjBkP0cgE652qdF0XECvoNu0uZER2QeOhov3fgam0UEeMuTCa/lSX2ZtqF5yqd0BrrJ9WohjMExsnE=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr3095384uaf.114.1632385623190;
 Thu, 23 Sep 2021 01:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com> <20210913065317.2297-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210913065317.2297-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 10:26:51 +0200
Message-ID: <CAMuHMdVWbLV1JWR5JPXfuALm4eariJBqWVRiWVKqy-Jdjxx2rg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] clk: renesas: cpg-lib: move RPC clock
 registration to the library
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 13, 2021 at 8:53 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We want to reuse this code for V3U soon. Because its RPCCKCR register is
> at a different offset, the moved functions do not use the base register
> as an argument anymore but the RPCCKCR register itself. Otherwise it is
> a plain code move. Verified that an Eagle board with R-Car V3M still
> works.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> These new library functions use CLK_SET_RATE_PARENT in
> clk_register_composite() as flags. This is what the current upstream
> code does. The V3U BSP, however, doesn't use this flag and passes 0 as
> an argument. It doesn't matter much currently, because the RPC drivers
> do not use any clk function calls. Yet, I think the flags provided
> should be consistent, so I kept what was already upstream. D'accord?

Akkoord ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
