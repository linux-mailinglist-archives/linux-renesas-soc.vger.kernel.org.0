Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98E0382966
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 12:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbhEQKHp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 06:07:45 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:38860 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236457AbhEQKHc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 06:07:32 -0400
Received: by mail-vk1-f172.google.com with SMTP id v188so1227626vkf.5;
        Mon, 17 May 2021 03:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3GIvUHbLf7bHSRqm2WLTNacDJxM/viGmccF85dLQBwA=;
        b=kgj66GhWBF9lSl5RZ1+KN1t42gwt17XKys+bussDhr8+eyDsLWQ3nUBueSqPlbzBLk
         JmU/MmuWb4K+aNWFOPEAYY+wxWFdmTnMoqYVO17U5ZAfLp0If9EXRsiaHSPifs+jJroe
         036Ht7fQSOTaIkIkCgCumFRsoRZ7GuNskSEFUzk24E/IXeWp1KMba4TEOYKyCdlGPNO0
         KOG0lcbwNYovgC+JQEnPqnnOmBond/4ireIKo8wbUwAqnSHg4rGzJ/jhLQ1onQTWCfsj
         1rIWr16EHCVx6bLOA+mv/uHcKCmTdsqLevaSPETStGtiszQGOJ8E87v1gdH5K2tDUwMr
         cQnA==
X-Gm-Message-State: AOAM530Ydd+lFTvxoGkf9wm9zWQdSJFvJslTnsK2b9Jq/YtQsuzXSGHu
        UgGztXq1bPkV1GhAZJP6KAYMiQMgzAp7kwH9hP7kKZBqVn4=
X-Google-Smtp-Source: ABdhPJzSuMIbh1shCp6BdMEcK0rCBCq1qUwTtUHKlfzDdiILXCroLjHVOs+3ObXQvUWmkW1diQnXIjz/O7+UgWA0tmI=
X-Received: by 2002:a1f:eac1:: with SMTP id i184mr1956195vkh.2.1621245974394;
 Mon, 17 May 2021 03:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210513114617.30191-1-aford173@gmail.com>
In-Reply-To: <20210513114617.30191-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 12:06:02 +0200
Message-ID: <CAMuHMdXXHbRzRhSZqkh=QaHmndSyjyk5BQrz5-PRVHBLb+qHMw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: beacon: Fix USB extal reference
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

Thanks for your patch!

On Thu, May 13, 2021 at 1:46 PM Adam Ford <aford173@gmail.com> wrote:
> The USB extal clock reference isn't associated to a crystal, it's
> assoicated to a programmable clock, so remove the extal reference,

associated

> add the usb2_clksel.  Since usb_extal is referenced by the versaclock,
> reference it here so the usb2_clksel can get the proper clock speed
> of 50MHz.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.14, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
