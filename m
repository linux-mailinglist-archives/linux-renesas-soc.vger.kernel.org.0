Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CF947A7D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 11:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhLTKkF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 05:40:05 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:39608 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbhLTKkF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 05:40:05 -0500
Received: by mail-ua1-f46.google.com with SMTP id i6so16823977uae.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 02:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CUnc/WpFMfAn+HclArx34aF544c/PNks1z6aA5FV/9Y=;
        b=zh+SoferOVof3hGNU3XaIB81gK33KMRIEp/eoWH+4jQztS4W36PMI6PAvUumMzAW3e
         Fizl86FAyAX/wjLUrW6gxGcgwrY+tIjPlkDUMay6XxFviU7Dua63AkhWsVq9ckxLN+FV
         r6yFAZX98P2nePtrMwOM6rbd3oKqvJVFLxLf7SLkgInRvDvJgn58eZUFHLYFZ7Pbx9Qs
         SqJwMd/RVtfCwcJrbY0s2HtGLsKayhO49OsTWx8RvHf8C4inBCZ1NK5ZZ6vv1RVLDsqm
         E8l4cQESgcmXDXeplr2cCzw64n0hTs/VyoXWllN9Jtmy1hiA9uQyepPV2JfPBEZ76zSq
         KYzw==
X-Gm-Message-State: AOAM5330ZDz85thqRoPzNWQHD6LdqiBNjfyWSlymGi9xm8gvaQnutZCN
        +L/DrF/WQgVIu5oat77JHc7TWlbnsgcNrQ==
X-Google-Smtp-Source: ABdhPJzj7bpy9TZz4mOJ1dtibiWbo4NJwtHUbWWuECQ1+8P9mK+1PpnvgcveqvVNDtnr3JD3diJXmg==
X-Received: by 2002:a67:d304:: with SMTP id a4mr1258599vsj.53.1639996804226;
        Mon, 20 Dec 2021 02:40:04 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id g21sm3349511vkd.26.2021.12.20.02.40.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 02:40:03 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id s144so5825233vkb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 02:40:03 -0800 (PST)
X-Received: by 2002:a05:6122:21a6:: with SMTP id j38mr2619020vkd.39.1639996803751;
 Mon, 20 Dec 2021 02:40:03 -0800 (PST)
MIME-Version: 1.0
References: <20211208195624.1864654-1-festevam@gmail.com>
In-Reply-To: <20211208195624.1864654-1-festevam@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Dec 2021 11:39:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVus_ukx35VQqMgKW6Nzst+3AJLyj3Aqp9bGrYsMNTwMA@mail.gmail.com>
Message-ID: <CAMuHMdVus_ukx35VQqMgKW6Nzst+3AJLyj3Aqp9bGrYsMNTwMA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: beacon-renesom-som: Remove the
 'pm-ignore-notify' property
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 8, 2021 at 8:56 PM Fabio Estevam <festevam@gmail.com> wrote:
> The 'pm-ignore-notify' property is not a valid property and there is
> no bindings documentation for it.
>
> Drop such invalid property.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
