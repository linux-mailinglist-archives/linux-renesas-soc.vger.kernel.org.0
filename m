Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDAA44A854
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 09:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244051AbhKIIcA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 03:32:00 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:37887 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241549AbhKIIcA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 03:32:00 -0500
Received: by mail-ua1-f45.google.com with SMTP id l43so36990095uad.4;
        Tue, 09 Nov 2021 00:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2BwDtO1eLZZUZrT3r0fYqPOHZzqJexnawXyMgbqoDnI=;
        b=GaNENQOpuXGSOK8cIg30Sr5cXayCg0wxVRgPTHSeq2oimgKVLk9MdsbNUhpGFe3xGo
         QQ3NhLhYzcwXqKFVoBByiUFtLcW6ZLeg37Nngl04T+1TkvY2VjCGwzWzFqtgLw/Vn/Uc
         mSetXqc85wgq/CmEDpxdRv+aRcWm+hoJ4S67jQKTp7XO9hrf8dbQ49UimG6i2PEr2ela
         XfUf/k+k8dqq0YikIUK/K6BSR7DgCxjY9JG2DNE9V6DHhwmyxhTgzCCBW09tOeGOPR5P
         oAlel0Isl9T+Tf7BV6r3wJCfKAhjt1BS8xh1qMK6BPiUBOC1HEvxhbVIOlk24ekdzwZ3
         gAcw==
X-Gm-Message-State: AOAM532tMBHxvKOjmxmzQCbVqrLNR82BylmgVHlL9gJm1wep6kWGha1A
        y8bDgUcG9jrWFZUetgFMNzdrym5Nz6lfWf6k
X-Google-Smtp-Source: ABdhPJw+1nJ22cjIVAcjGG+O49/MrAAzlOy2atUYq2nF7D+uuXJOqEhoiLJwGDxqbBCZSNt466/ahA==
X-Received: by 2002:a67:2dc5:: with SMTP id t188mr17138007vst.2.1636446553167;
        Tue, 09 Nov 2021 00:29:13 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id r11sm3303757uad.7.2021.11.09.00.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:29:13 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id q13so37048186uaq.2;
        Tue, 09 Nov 2021 00:29:12 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr9524003vsj.50.1636446552558;
 Tue, 09 Nov 2021 00:29:12 -0800 (PST)
MIME-Version: 1.0
References: <20211104224033.3997504-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20211104224033.3997504-1-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:29:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVBj58ZM3LqCN3cudsE3VJV8AQC5OCOJP96RaqYf4NDQ@mail.gmail.com>
Message-ID: <CAMuHMdXVBj58ZM3LqCN3cudsE3VJV8AQC5OCOJP96RaqYf4NDQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] arm64: dts: renesas: Thermal binding validation
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Nov 4, 2021 at 11:40 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The thermal sensor bindings were not matched correctly against the
> expected naming scheme.
>
> r8a77980.dtsi also used a different naming scheme compared to the other
> related platforms.

It lacked the labels, which you added for consistency.
Is there any point in providing them, as there are no users? Or should
they be removed instead?

> This series cleans up the dtsi files for the CPU target thermal sensors,
> allowing the validation to run.
>
> Enabling this validation shows up a new validation failure:
>
> linux/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dt.yaml: thermal-zones: sensor3-thermal:cooling-maps:map0:contribution:0:0: 1024 is greater than the maximum of 100
>         From schema: Documentation/devicetree/bindings/thermal/thermal-zones.yaml
>
> This validation error appears to be pervasive across all of these
> bindings, but changing that will be more invasive and require someone to
> perform dedicated testing with the thermal drivers to ensure that the
> updates to the ranges do not cause unexpected side effects.

Niklas?

> Kieran Bingham (9):
>   arm64: dts: renesas: r8a774a1: Fix thermal bindings
>   arm64: dts: renesas: r8a774b1: Fix thermal bindings
>   arm64: dts: renesas: r8a774e1: Fix thermal bindings
>   arm64: dts: renesas: r8a77951: Fix thermal bindings
>   arm64: dts: renesas: r8a77960: Fix thermal bindings
>   arm64: dts: renesas: r8a77961: Fix thermal bindings
>   arm64: dts: renesas: r8a77965: Fix thermal bindings
>   arm64: dts: renesas: r8a77980: Fix thermal bindings
>   arm64: dts: renesas: r8a779a0: Fix thermal bindings

For the whole series:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
