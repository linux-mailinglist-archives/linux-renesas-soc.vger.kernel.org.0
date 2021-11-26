Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C256245EE50
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 13:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377480AbhKZM4l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 07:56:41 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:35338 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232097AbhKZMyk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 07:54:40 -0500
Received: by mail-ua1-f51.google.com with SMTP id l24so18435608uak.2;
        Fri, 26 Nov 2021 04:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/rnmb/InE6v1bIFF6J5KRBRwGAqDw2ehlGBUgCeFUDc=;
        b=1k7pUOEKzjIN2nRqVSMPYSC/Bg5hEf9M8ELmyM+eiYKYo4dB5/2f1Ej73OvjE8PRiv
         FtzkgEC6irUMSjttKt4NOr3W2QxaJmh78sR+b3owQmvzi1dyGJqf+PlWi7HLBMuiXa34
         wAVTnATBW0kV4CREnVayyg/2jRz2bAcIsv9mmEqPvGIwW8WhKSYHQb7T6pUVSuOMsgQu
         S5gVO7aa7DS8w98MkSOVy6zTaOcheVEOQBcGrjbJ/amTXoPA9IaYgHijnuXMujOYMgIj
         eSmz2aXPN52+pzuu2EMoiRrH3klhodDdPHCkQIqOfLU+udpq+I9w7a9wpq3+U+G8MV8w
         wEvA==
X-Gm-Message-State: AOAM533jId2bDRKLx99SpMXkwKS6Zb24of690a/HlC6pNneReAGyQvEs
        lKZIVkRvI/gPtqxvl72cx1WSvizlDAKfuQ==
X-Google-Smtp-Source: ABdhPJxX23i/NyZFkE70IqAsrDhRCzePF03JRVgsqO2NK8NajZNudPiTljaSKmGoyjVwD9muBg0q6Q==
X-Received: by 2002:a67:7247:: with SMTP id n68mr15610559vsc.6.1637931087191;
        Fri, 26 Nov 2021 04:51:27 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id r20sm3402885vkq.15.2021.11.26.04.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 04:51:26 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id n6so18414590uak.1;
        Fri, 26 Nov 2021 04:51:26 -0800 (PST)
X-Received: by 2002:ab0:7354:: with SMTP id k20mr33348196uap.78.1637931086446;
 Fri, 26 Nov 2021 04:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20211126095445.932930-1-kieran.bingham+renesas@ideasonboard.com> <20211126095445.932930-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20211126095445.932930-2-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Nov 2021 13:51:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXv_XcGX3N5iC3zN=sYNEnxHLzgM4BnsWyrnA9OErXVdg@mail.gmail.com>
Message-ID: <CAMuHMdXv_XcGX3N5iC3zN=sYNEnxHLzgM4BnsWyrnA9OErXVdg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: renesas: r8a779a0: Add DU support
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Nov 26, 2021 at 10:54 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Provide the device nodes for the DU on the V3U platforms.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2
>  - Use a single clock specification for the whole DU.
>
> v3:
>  - Use 'du.0' clock name instead of 'du'
>
> v4:
>  - Add in missing reset-names
>  - Use full renesas,vsps

Thanks for the update!
Will queue in renesas-devel for v5.17, with the du-node relocated to its
final resting place.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
