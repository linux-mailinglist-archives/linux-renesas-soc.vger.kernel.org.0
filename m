Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DE02EB243
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 19:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729891AbhAESNY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 13:13:24 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:45797 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbhAESNY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 13:13:24 -0500
Received: by mail-oi1-f179.google.com with SMTP id f132so452814oib.12;
        Tue, 05 Jan 2021 10:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G8/iSpkWTqT0hqWEMMWaDftZRaKY61rN9Q3XB1gDQ04=;
        b=gzK4NEHOBqOfyn7PFZWP5PxbvONpyY2DzKyXBMxu0s3J4BCO3AVkOX/sqSabJcpj0S
         kedhCaWhtOQnZz4ARYSu6nJBuFMuWt9ElBGyYbUQdGhs4sfuc8H3yHtzAYpXt9pwqW/E
         4oZAxOzHd6G/WYA+0+XqO1Rf7+EPOJ+Lhvv9+CtWzw0OORkA+dbyILUB43BYqF/UX+l6
         0IUUmwsSzFV/qqjwKHq4Sgf24lPXQdbyzm23+4/rNWHNwo9oir360IxytydROd+A4u/3
         JTWY+4Al+PUPclaA9cIbdSkkhfLFKmdIXVemnAS+yzXIr3No8bh1AS7+8CseFBc4RVRg
         R0Hw==
X-Gm-Message-State: AOAM533EgpjnFXMCjl9xyihgNwSOvmFRpPMdmh7x/TWliW/PsFXdzk0D
        AtWbIw4zaTlQZmpJslQAy4Wl3agdAvqK3dGbqf4=
X-Google-Smtp-Source: ABdhPJzFa0+x63nGw/fV4bz/r5gujqFM4sa5vx0VFFsmqeu3eHSppNCbCNiMIVnO+RaeLc2RRRURz1JxzYpSt1st6VU=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr559858oih.153.1609870363113;
 Tue, 05 Jan 2021 10:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com> <20201228112715.14947-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201228112715.14947-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 19:12:32 +0100
Message-ID: <CAMuHMdVzQVBvsUhpZF5A9qoijA=thVPq4tBiRnAVyFrX2aD+5w@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: falcon: add SCIF0 nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 28, 2020 at 12:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> SCIF0 has been enabled by the firmware, so it worked already. Still, add
> the proper nodes to make it work in any case.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
