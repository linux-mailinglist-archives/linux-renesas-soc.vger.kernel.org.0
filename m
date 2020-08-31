Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113C92579B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 14:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgHaMv1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 08:51:27 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39562 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgHaMvZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 08:51:25 -0400
Received: by mail-oi1-f195.google.com with SMTP id z195so852979oia.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2020 05:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AD8J7kXXhSUpASwScT9d7do417XfWlrQTqvKYTQleD0=;
        b=m157avGIN2S3m6Cmrpvlfcm3ncsnsmbQHbQroO33ndUTsvL2/qkrpw/sEIWQIvCb6r
         BUVIWq01muJ2rey4giDC6ei+lIY5U1AtJohF14W6udm1OZFAzObPzbJEo3G0nqhDrIk9
         QZpDC+qPP+3UrGFfQDwHfhETq+Em2Kz4tBzNmkEwpn3UE/6XYJpIGQez+BU7lhuMexgA
         NycDLjLQXGYr/Cce91PoF03EddvmJvlaeCZu03w+XlVgXVPNlRd0gM46EynZn0t9Pg2N
         bk+vq9yop3eqylpoulfmB3Yql7J0KafwNc8plXsd58YCEDikwLXIWDQVdbnKzQap931c
         VkzA==
X-Gm-Message-State: AOAM533Qw49a1Z5nsGitz3TA/KCjXy88fB5K/ekWtZ7ABskz/LGQsEv0
        2Xr0qWrI6SfXT+e4H/Wjwqra7SnNwtEeKHK2Sd+lJ4xXV0M=
X-Google-Smtp-Source: ABdhPJy8Kr9Di6qcI3hRscVzpF6+7dKwV97jJKegovjc9E2RVVmzxQ6P/Nx9eldqC9VW6KpQZcWKq7fUDmhz+ZnftPY=
X-Received: by 2002:aca:b742:: with SMTP id h63mr614686oif.148.1598878285299;
 Mon, 31 Aug 2020 05:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200826100358.5936-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200826100358.5936-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200826100358.5936-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 31 Aug 2020 14:51:14 +0200
Message-ID: <CAMuHMdVGjV_DXkgEEDcoKwwTwKyxiMuLFMPdHU9HOurs9DnL7A@mail.gmail.com>
Subject: Re: [PATCH LOCAL 2/2] arm64: renesas: defconfig: Enable R-Car PCIe
 endpoint driver
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 26, 2020 at 12:04 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable R-Car PCIe endpoint driver on RZ/G2E board, including enabling
> endpoint configurations CONFIG_PCI_ENDPOINT, CONFIG_PCI_ENDPOINT_CONFIGFS,
> CONFIG_PCI_EPF_TEST and CONFIG_PCI_ENDPOINT_TEST required to use and test
> the driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to topic/renesas-defconfig.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
