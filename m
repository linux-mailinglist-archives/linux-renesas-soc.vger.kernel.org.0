Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFA34695E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 13:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243315AbhLFMrW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 07:47:22 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:38548 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243297AbhLFMrV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 07:47:21 -0500
Received: by mail-ua1-f42.google.com with SMTP id w23so19197567uao.5;
        Mon, 06 Dec 2021 04:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=diTFsItQxsjlWEXrD9HKHMo7eDvHbW5sddSfozLs0bY=;
        b=0xfpd5gDO1e1iCiPxmQJK6YfNzBl9kE3xzHtWPQDM2KiiTb5KTT1kvK+8t7mtLe06j
         eGaDUyCX+/RgSv0jY+e4R5sjN+XlNN0e3kS9H19Mr1R36LwF/JRiGcbMZCnrq6j4EFLc
         Fr+HSAEh9ftXrtatP5wH8vp9W3yZy9iRnvq9mEjl70mHvUZfEbWSBJsdBgDAZFb8tXT3
         safkNO7ZxdvKeFsDsSwdF2QEajAVc/zkkciVGo/9xnMldWVEPJxC17RMckLJwDvVnKzN
         BX/x6pANtw+tQHrtR0FGf+9HwvD14UrYEZjR7lWNi1ObSqzqcognbKpZE+EGYO6hsnYi
         gSIw==
X-Gm-Message-State: AOAM530gikKoLZY+YIQqb5ozqL30jto0I4WN0Q+4plIIB4QTgKOayeXe
        DAI118zj3XHssvrF6Ysx86P9Z+VqbPCUxA==
X-Google-Smtp-Source: ABdhPJzl8vb4F9/DBncbNNN0L0/+LmmA8Bd348cKYUiTebxrsT93eWlfk/xwhFEaF9fGvRGHBe7Z5A==
X-Received: by 2002:ab0:22d6:: with SMTP id z22mr39607552uam.65.1638794632414;
        Mon, 06 Dec 2021 04:43:52 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 186sm3934633vsd.30.2021.12.06.04.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 04:43:52 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id t13so19161730uad.9;
        Mon, 06 Dec 2021 04:43:52 -0800 (PST)
X-Received: by 2002:ab0:7354:: with SMTP id k20mr39571944uap.78.1638794631869;
 Mon, 06 Dec 2021 04:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-10-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-10-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 13:43:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWx4fxjHrQn-7qbFkZwa31W_D-5zGnxRQqb+VRezjzs+w@mail.gmail.com>
Message-ID: <CAMuHMdWx4fxjHrQn-7qbFkZwa31W_D-5zGnxRQqb+VRezjzs+w@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] clk: renesas: cpg-mssr: Add support for R-Car S4-8
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
> Initial CPG support for R-Car S4-8 (r8a779f0).
>
> Inspired by patches in the BSP by LUU HOAI.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
