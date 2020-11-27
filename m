Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E31A2C6151
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 10:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgK0JCw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 04:02:52 -0500
Received: from mail-oo1-f68.google.com ([209.85.161.68]:45164 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgK0JCv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 04:02:51 -0500
Received: by mail-oo1-f68.google.com with SMTP id r11so945099oos.12;
        Fri, 27 Nov 2020 01:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WCDGStRGrWljlmeCrp0x/menr4lF/jcnjR6aNhcAfIU=;
        b=G4yGPqmQbsmhg+LAXDZS4673NHxjfQlXEDvQgxJlHiT/esJEIhe6GrIfTwZJX1wUq7
         UZESEFYLwA9fchNgpAFOdA4NOO0Ku1OLdHZBuxZ+HYxbSeNbe45K2YxPRQY8qs8MHutG
         JWqGpQ0PxOCKmKcEOHSXoK/xW3Mdtj0yZFapuJQDlbn9njGewMpGpyjLQP/kEiaQzI5M
         LJ+5a+O7aBR4OtmA7+vs6BG7gWxlFMXNwei3f/q9NhbnIPSrpPuFxuz+6lK6JeS/PccA
         qX/cUwYV7pKM5+qLbR9pZhLug4cGVp8JkCIIy48kNMgw0UVj7EjpAo9rjtnSdJS65i4U
         W9DA==
X-Gm-Message-State: AOAM5339cMIkSWwhyoo6bf8eS4F13y8r6rnE3G7e6nV5aPhc4mq681HV
        PQR4//IQbi9PERDtk8If2vU5Yy1xluo70FwfZRei2g4cyzs=
X-Google-Smtp-Source: ABdhPJzO+PJ++vIKkExLnAjex6zGrSuq2307OjOyS7/RQY+seoCu+D0sprha5UA1VcUK3FZQIpQItpeO6JbRjPaXH4s=
X-Received: by 2002:a4a:274b:: with SMTP id w11mr4835946oow.11.1606467770714;
 Fri, 27 Nov 2020 01:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20201126221416.3110341-1-niklas.soderlund+renesas@ragnatech.se> <20201126221416.3110341-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201126221416.3110341-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Nov 2020 10:02:39 +0100
Message-ID: <CAMuHMdVWqES8xWWedmbXJO2d+8CYneEteWzsuzuvVxi38TWXLQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r8a779a0: Add CP clock
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Thu, Nov 26, 2020 at 11:14 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Implement support for the CP clock on V3U.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that this change was also included in "[PATCH/RFC 3/6] clk:
renesas: r8a779a0: Add PFC/GPIO clocks".
https://lore.kernel.org/linux-renesas-soc/20201019120614.22149-4-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
