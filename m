Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BFA45C9A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 17:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242141AbhKXQRd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 11:17:33 -0500
Received: from mail-vk1-f169.google.com ([209.85.221.169]:33450 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhKXQRb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 11:17:31 -0500
Received: by mail-vk1-f169.google.com with SMTP id d130so1909331vke.0;
        Wed, 24 Nov 2021 08:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pXQV8sW+uQGtr3RxeTdbe2IdMqmBjjU8yPhZ5dZ/OkU=;
        b=IVWeDR7DXmy95rDl1bZGoB2AGVGZWjDGuIyjofvd7N2DgojHLyk9sL35F5ys2ALT1K
         k7L8T/iEgy2nY8ywVSUU0E9mldhubckFlH9g5BIsu5qOEQMU9OMzuZE5QUusIqEu8Nsb
         EjysFrj8/hF+hCg4vIucyBKzP5eKtyjzHAVbqpmPAHKReN0+KRcn4+bGynnBjZdyHd/d
         Gr0u93TUwK4O9UgMsyjZh5dFl3McjWhBCTM0CYgfHsntiNulVHIoXnlNPClVYi36UKGl
         jVQeVP7llphN4RSFmFeDr+hWvhDEJ5uI3GbefywZuwmWiH0Qh333eMeCJ11tCLmQgyz3
         Qzaw==
X-Gm-Message-State: AOAM531rnPO56Q0vQVPOyTWZONhZVs6AVUCVJHU9myE0fyfwbM9tbtbN
        GiiIKX6oFuK6PDcA7C1UNkq7M5+kOI+c0A==
X-Google-Smtp-Source: ABdhPJyhOQxrSnLS8YZpapfoUMT57/ry3aLPevJAXPANp1oMSqDevXcon/H9QAc9oYLHoCTB7HgxSg==
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr28828166vkh.11.1637770461294;
        Wed, 24 Nov 2021 08:14:21 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id y7sm141198uad.2.2021.11.24.08.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:14:20 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id n6so6244047uak.1;
        Wed, 24 Nov 2021 08:14:20 -0800 (PST)
X-Received: by 2002:ab0:7354:: with SMTP id k20mr12289366uap.78.1637770460777;
 Wed, 24 Nov 2021 08:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20211124152815.3926961-1-kieran.bingham+renesas@ideasonboard.com> <20211124152815.3926961-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20211124152815.3926961-2-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 17:14:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsjs4950MmD53e87NEfbPQEBn_Ji_xN9y32hJF2EoXYQ@mail.gmail.com>
Message-ID: <CAMuHMdVsjs4950MmD53e87NEfbPQEBn_Ji_xN9y32hJF2EoXYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: ulcb: Merge hdmi0_con
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 24, 2021 at 4:28 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The remote endpoint for the hdmi connector is specfied through a
> reference to the hdmi0_con endpoint, which is in the same file.
>
> Simplify by specifying the remote-endpoint directly in the hdmi0_con
> endpoint.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
