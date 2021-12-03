Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6A4467B84
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 17:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352827AbhLCQjx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 11:39:53 -0500
Received: from mail-vk1-f178.google.com ([209.85.221.178]:35834 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbhLCQjx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 11:39:53 -0500
Received: by mail-vk1-f178.google.com with SMTP id q21so2220986vkn.2;
        Fri, 03 Dec 2021 08:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WcRfyfKkPGWaIlUiOT4omcrsKA2HNvkYw3lYrLLVlwA=;
        b=ukYY2XEnWhvMz7e/ccd44giQtJHwfG+tPWH6z5oRYyMy9oXCmOb6gv7HJsLD7TMOZM
         xByH2UIiHct59oQikSDfnpWckLvjNtkP+CIR9UWe962bXq66EHAVtKM2oY9MKJil3/GY
         jR0dNFDYipjdm/e4rga+1osC5QNpy3VI53Aa36IUbtDn9wZj1uXYXrBnXLh1HFgQzdEK
         vtbuw7Wz6lrsoNMj8vdmGR5L3esaeilQzrnWBy2s72iisb0weinaWKPgZlMWSt2U7k0T
         SEdtJDsVfU10L7eb83GScYWmWd0yU86whX0dRcsdKonAstdfIivvVUWVFZCn08HNe1Rq
         rv3w==
X-Gm-Message-State: AOAM533WFKWfkDPKQyVf3BhXOsAjETueEeplfCoTknNj2GrTvuQjjbL4
        mr9nhq3XaTjUR3/0hC1T+OWBznJEqy5BjJQN
X-Google-Smtp-Source: ABdhPJxzXFR2aXPAlRAf8yT5XoBzPg5ZJC4WZI7keHW3xXvnBHJfd9VW8nYKT9cOGQmAIb5au8SsbA==
X-Received: by 2002:a05:6122:2210:: with SMTP id bb16mr24863609vkb.28.1638549388382;
        Fri, 03 Dec 2021 08:36:28 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id g21sm547292vkd.26.2021.12.03.08.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 08:36:28 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 84so2206593vkc.6;
        Fri, 03 Dec 2021 08:36:28 -0800 (PST)
X-Received: by 2002:a05:6122:104f:: with SMTP id z15mr25000533vkn.39.1638549387000;
 Fri, 03 Dec 2021 08:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-8-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-8-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Dec 2021 17:36:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQC-_xGREYB_Zj=g1Fe2ptNO+YVjPJ4jzvEN8WShdG=g@mail.gmail.com>
Message-ID: <CAMuHMdVQC-_xGREYB_Zj=g1Fe2ptNO+YVjPJ4jzvEN8WShdG=g@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] soc: renesas: Identify R-Car S4-8
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 1, 2021 at 8:33 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for identifying the R-Car S4-8 (R8A779F0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
