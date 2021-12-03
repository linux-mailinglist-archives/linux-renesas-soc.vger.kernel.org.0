Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2CD467B32
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 17:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245428AbhLCQXw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 11:23:52 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:40753 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245403AbhLCQXw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 11:23:52 -0500
Received: by mail-ua1-f48.google.com with SMTP id y5so6453449ual.7;
        Fri, 03 Dec 2021 08:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CQhSTy+p2z5oRD9KKed8N8532PPEd7oUM5RarkTfuaw=;
        b=yXw6OmiA/Ye7R+9SoDl/aDH6/J6n476ZV8hH1vLrZNUJ/niDP5irRUhY0YT+vcYLFa
         JY8rX3yDWRCWZu7+/l9qEadQNKGML2kTb1IDQcE3MJdNO8fqCudWvYugJhgCvjUPidgd
         Sbugu1MRGzV15q02B1CEdThQPAO4PKHipg5oNPfS+tSDQsKCvYoFDgXQTYDh5l4BNCEx
         iVcu/rh1kCab2tels8S8wwe6itfpM0bIx7ITqlez9nHZ65BU4ZGmQmscdp3mCvP4C5yF
         6LB+1ie1o3SsKSEE5dRaqufhC2nhuO3VPou8F76LW5nPdTWSPpDjd5d8uto9x3IFL/P0
         WKZQ==
X-Gm-Message-State: AOAM533mop69CUmDSv/KJ36M5eGINN9Swxb/s3o1nFI06aTpTrWqcl/T
        4alMVKmre8kWE18PSysQeG4ZUEbxyPYX995M
X-Google-Smtp-Source: ABdhPJxB5Wbs/1izbOadP1EeE8TiGztGcQohE8p1PYBE+XX42GkE11yHLuUz+Ebbl+nW5l3P7jJzEA==
X-Received: by 2002:a67:32c5:: with SMTP id y188mr20868630vsy.70.1638548427578;
        Fri, 03 Dec 2021 08:20:27 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id t11sm516067vkt.34.2021.12.03.08.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 08:20:27 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id p2so6414473uad.11;
        Fri, 03 Dec 2021 08:20:26 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id f9mr21794734vst.68.1638548426724;
 Fri, 03 Dec 2021 08:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-4-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-4-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Dec 2021 17:20:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFZPCkmfXAzx+Ddnd95aqR6onCtCfLiYWQ76kQ4JmboA@mail.gmail.com>
Message-ID: <CAMuHMdVFZPCkmfXAzx+Ddnd95aqR6onCtCfLiYWQ76kQ4JmboA@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
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
> Add all Clock Pulse Generator Core Clock Outputs for the Renesas
> R-Car S4-8 (R8A779F0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17 and renesas-devel for v5.17,
in a branch shared by driver and DTS.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
