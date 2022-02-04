Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273AD4A94A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 08:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353150AbiBDHh2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 02:37:28 -0500
Received: from mail-vk1-f176.google.com ([209.85.221.176]:37780 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbiBDHh1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 02:37:27 -0500
Received: by mail-vk1-f176.google.com with SMTP id v192so3211756vkv.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Feb 2022 23:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UPsyAoEDjHQEKvGihxwwZge/vwcmTXbu1tF7YJTM4+0=;
        b=NMSo7oFkUSmQh4o4N2TZ1cL1XZJrKsHA/+gyFPxGVcvfxd8VRxeIvm+m3KFSZ2C+mu
         44qpa+e6m/vFdkY5T9AgW/YlqsMz6WwYz+ST8jSGjmTOjYU4Zm6vVFQCKOrCiJQ53/TM
         3cXbDFWhviDI1oKW4lCQaKM67QSO+gIaPMRf6CfakiyjR/2U9gPbSpweSomWJe5a0T09
         ItHbXK+fu8uEaMQPFHAOaffw1P4zjInQ7SfNlXdj/gynTf0gk0NRX07cyV5pg1Nsoc/I
         iAS38Nn4rwJyeoyr6MBnkR2VqpZTREUd9l7F9nyOocJ+XKdwdYiiKhsHGfXzF9KHTLYE
         Ofhw==
X-Gm-Message-State: AOAM532eUlM0mt7eg5Ar6bRVKZO9IC0Y6k2izHhgJh9UBMyoau2gi9U+
        L1OCjRgKII4WwQMYM7Xk5g/6R2pgKnKrqA==
X-Google-Smtp-Source: ABdhPJycWx61z0zp21O9xXD+2ZtFRYce+ZC8rxeU4WmsxoXk7y5yhiXPWoYBzqYxuZN6H6gNlelcaw==
X-Received: by 2002:a05:6122:1353:: with SMTP id f19mr554382vkp.35.1643960247183;
        Thu, 03 Feb 2022 23:37:27 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id k203sm288839vka.56.2022.02.03.23.37.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 23:37:27 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id m131so3198514vkm.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Feb 2022 23:37:26 -0800 (PST)
X-Received: by 2002:a1f:b287:: with SMTP id b129mr660978vkf.20.1643960246591;
 Thu, 03 Feb 2022 23:37:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643898884.git.geert+renesas@glider.be> <e1c7fb17801bc82a74aa5364212d02ba51535dd2.1643898884.git.geert+renesas@glider.be>
In-Reply-To: <e1c7fb17801bc82a74aa5364212d02ba51535dd2.1643898884.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Feb 2022 08:37:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdJHXvKWvd4XFb3CqSE3jjdKhz-iwyd_8JzK+TxPyyzQ@mail.gmail.com>
Message-ID: <CAMuHMdVdJHXvKWvd4XFb3CqSE3jjdKhz-iwyd_8JzK+TxPyyzQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a779f0: Add I2C nodes
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 3, 2022 at 4:26 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add device nodes for the I2C Bus Interfaces on the Renesas R-Car S4-8
> (R8A779F0) SoC.
>
> Based on a larger patch in the BSP by LUU HOAI.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> R-Car S4 Series Hardware User's Manual Rev. 0.51 states I2C2 TX DMARS is
> 0x05, which is probably a typo?

This is confirmed to be a typo.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
