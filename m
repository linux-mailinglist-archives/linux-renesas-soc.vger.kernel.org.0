Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278373309B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 09:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhCHIpN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 03:45:13 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:42742 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhCHIo7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 03:44:59 -0500
Received: by mail-ua1-f46.google.com with SMTP id o20so3069276uaj.9;
        Mon, 08 Mar 2021 00:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=owwCORv4BLcbVhC0xUWnywi72Tinq+aKifrHa6Yxlwk=;
        b=DfFN5tzVebpqH9V4aVu8y39QLy4hQia0S1X7xpDuvkO5ZKzKUDisg7od0idva4HTiO
         YFusHB2R84Ng2YXqkPbjjoLGjTo0E4tvOBZBKjVPucg3OqGOoNx9uo0Cx/VKa/hEWOHg
         ChOHlol7HTNLkJMpGt1ZdxRHGj9GJJrU75pF1I09L+ZX3ltCxOsRfx/U+H5Np4Z/2x8g
         84euQlp7r3XkHum0zHn1Mhyb/GspLRldKMAGIPxHnLy8wr22TKal+uHrX1dGoVReD5+W
         Jzj42WGtipr1foPmt9jfrli9DCGO0UM59uBXUzubCNkeY8xJAi9V0zox9uxzNLu0QZ+x
         EnxQ==
X-Gm-Message-State: AOAM531zgUM0HZ0KMH8MUUu1OKmIaPJQc32vnb81PO9oTnBYb8fwa7Pw
        V1WhxGGJ19R8o52wQmEY7q7cF/6SyMWIFlAl4nY=
X-Google-Smtp-Source: ABdhPJwUy62f9DERQowQ18mItx2Zii9uEg/QPjkhnBgQYWSZ5SJULZvhgURvHyFEEjTAIa2B8JtqsWG3243hodmNh1k=
X-Received: by 2002:ab0:6045:: with SMTP id o5mr12332739ual.100.1615193098661;
 Mon, 08 Mar 2021 00:44:58 -0800 (PST)
MIME-Version: 1.0
References: <20210305142359.11992-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210305142359.11992-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Mar 2021 09:44:47 +0100
Message-ID: <CAMuHMdUibg-bv_pwXf3v-KNpKMv-bZGtur0=AOgWahnMGQBmZw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: add r8a779a0 TMU support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 5, 2021 at 3:25 PM Wolfram Sang
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
