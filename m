Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222B52E0880
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 11:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgLVKGE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 05:06:04 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:39350 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgLVKGD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 05:06:03 -0500
Received: by mail-oi1-f176.google.com with SMTP id w124so14244519oia.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 02:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hk1vYrcuNOLW0JOVvbwXyiAooTAIyw8am6v7sF/hhJQ=;
        b=luyJeFBhmDq16AsIQUQFa2FMrcQnU7D9QhqRMHX9vGn3QwDZOyYMGsKa98575pRPTo
         M7B7UqjTlKMAEz9keDNkMGQXiO8+KOnmB1tylqMMR4vgxtjK6EzS2QPretPnq993HoYN
         /JS/vCPbRtZXRD+2w+YYDAUcPljxSjmlHTqanZURU2EMcs9g7L2EJG7dy2o88uk1Mxcq
         RTN0I9bO6D83RMMUHhWokyCW/aYvVyaHeLCqSP+WragPbJDnQUIfprCBLnOdEduQqof3
         77k4s8w/glu5qgm2hiq5/6vxrCXMcLYHoIylyq3mnrCDgvpSHZyKg8BKDqo7MDut618f
         4tRw==
X-Gm-Message-State: AOAM531a46VCkKLNu81txIqUNBXC5EdQquDPz4TRKNM7ohFojCz3mfPG
        AH2ob4zaHat4KKWFKncG06Pcb/21wUo0qXXRwaOUdlw3
X-Google-Smtp-Source: ABdhPJxeiTQESQXWFwoNzQIdjf488cZSOXHqu9FfUJAXByXk6rW8pGYfJyuwGmQ8iMpLxItXpv3TEXu26SXm2BWnbNg=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr12507362oia.54.1608631523070;
 Tue, 22 Dec 2020 02:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20201221165448.27312-1-uli+renesas@fpond.eu> <20201221165448.27312-6-uli+renesas@fpond.eu>
In-Reply-To: <20201221165448.27312-6-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 11:05:12 +0100
Message-ID: <CAMuHMdUsyNm9e+H3jMWoR=86FYHTdbebHrGjrPVne832oKFLSQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] pinctrl: renesas: r8a779a0: Add SCIF pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds SCIF0, 1, 3 and 4 pins, groups and functions for the
> R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
