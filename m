Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3848946940A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 11:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238292AbhLFKpr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 05:45:47 -0500
Received: from mail-vk1-f179.google.com ([209.85.221.179]:46725 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237524AbhLFKpq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 05:45:46 -0500
Received: by mail-vk1-f179.google.com with SMTP id m16so6357348vkl.13;
        Mon, 06 Dec 2021 02:42:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+zCCWmhtbmFNgNFX1WhKzLOjZMyBbv+PDKFoPCAd0cw=;
        b=0Wp15ZOc1HY7wgMkas+exwy5aR4gRw/Bzeze56EWupMv9qGupGphNLdxY1twhedukq
         KS0/9kTH0q5vwZad2HMwjxUafTBa46qRtd8v/CjWmuKXOJg3b9yXieD7xlj5x4Zr9d72
         G0CLIPGXiFS4M9WcErHIQ0VZjI0SC19SKMOZb6Yj5pRlSaNA1S06DW5hq9ghp11HHiiR
         kS9fEHejJ/dSKj8wD4tdbY1MPv7HvHj/T7YpsNGwwbFVIRXuD5EenRL0d6c/KlHuf7JT
         Ay6w0Fc9ZPUdaS6SbpceWCWYzV/vj7ZEDnieVzbqVnqj9uu/zGhKrr20U2gNUd1eSx8O
         C+SQ==
X-Gm-Message-State: AOAM532VyMWipOp1tK1yfeBwyek7Auil2hkPSa3t0UUfGMidNX7vZttZ
        Iufbgedvv3Ab9zPTdcRLb7J4i9fzQQrDVA==
X-Google-Smtp-Source: ABdhPJzJoNKxgxhPwO4T963Z7jfkxq/HNgr23EAtRZww4zsC641AXaKkZWZBhosHrIqLKh9k+cRlJQ==
X-Received: by 2002:a1f:a857:: with SMTP id r84mr40297970vke.0.1638787337806;
        Mon, 06 Dec 2021 02:42:17 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id o7sm3871480vkl.41.2021.12.06.02.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 02:42:17 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id q21so6440148vkn.2;
        Mon, 06 Dec 2021 02:42:17 -0800 (PST)
X-Received: by 2002:a05:6122:2193:: with SMTP id j19mr40312371vkd.7.1638787337326;
 Mon, 06 Dec 2021 02:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-7-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-7-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 11:42:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+0goQmmWs_Jv2GbCCyv2eYKK_TaQ+5V7t8-46eL6eqg@mail.gmail.com>
Message-ID: <CAMuHMdW+0goQmmWs_Jv2GbCCyv2eYKK_TaQ+5V7t8-46eL6eqg@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] soc: renesas: r8a779f0-sysc: Add r8a779f0 support
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
> Add support for R-Car S4-8 (R8A779F0) SoC power areas and register
> access.
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
