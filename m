Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0A92F9AFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 09:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733251AbhARIJZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 03:09:25 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:45397 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733218AbhARIJX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 03:09:23 -0500
Received: by mail-ot1-f49.google.com with SMTP id n42so15424386ota.12;
        Mon, 18 Jan 2021 00:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QpDzGIVBbYEco6RAafAKtGUYoFM/UMj629CQOFKn9sw=;
        b=s82t1LffZ71jgAJ9Hec4xS8g4P7Ij6qH2J3e9kp3JXgwQsbISxl8qjnlbdb0tnHe1B
         DjW5w/CcgJ8/58QVS8Bb1rKmAedaxYqW0FpBGV4DK4nwgCgRmQ5c9c8X73KAluF9qPMx
         wI+9E4R0ANll5ACbEOcUpA0asfUObre/1vajUdWTyedzYaGpk3m0BKqmEtqddO1WZAA7
         203CupWda36KXkz8kdE0kX91p8CUXA3rhFuhtrtiuZhMi1gB5XU+fKbHt0KTW6FNq7kz
         kpY0kRxkgNR61vXFqZRbakfnMHt68jXVfwRfMYAelMMxUcbGxLWgL1WAhpmVUT93QNiq
         Wg4A==
X-Gm-Message-State: AOAM5313XFXl2dkcxu5fbp+Ebomb0v71WTpYi5UzRSeEP3qc1uYCQZKv
        1Jiwk4c7Z5LiAtrx6jLPkAQV5dkYFYJ8TEJYaao=
X-Google-Smtp-Source: ABdhPJz6E5rYTn4BlDUweSYAYPmPFr2zeRdP4qj7iaXD7O97tnKyPzYv37ySEgWivsWC+kF3vWrpeiiptZZkTu5YINw=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr16764312oth.250.1610957322297;
 Mon, 18 Jan 2021 00:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20210112134555.1787924-1-aford173@gmail.com>
In-Reply-To: <20210112134555.1787924-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Jan 2021 09:08:31 +0100
Message-ID: <CAMuHMdU6bc1hH2a8gCTAE3UvnxgQ+P93Yg7We578GHbYRH2c=g@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable CLK_RCAR_USB2_CLOCK_SEL
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Tue, Jan 12, 2021 at 2:46 PM Adam Ford <aford173@gmail.com> wrote:
> The RZ/G2 Series has the optional CLK_RCAR_USB2_CLOCK_SEL.
> Enable it by default.  It's disabled by default in the
> the device tree, so it should be safe to enable it here.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I will accept this patch once the Beacon Kit DTS starts using this, and
the patch description can be changed to "... enabled because it's used by
Beacon Kit".

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -932,6 +932,7 @@ CONFIG_SM_GCC_8250=y
>  CONFIG_SM_GPUCC_8150=y
>  CONFIG_SM_GPUCC_8250=y
>  CONFIG_QCOM_HFPLL=y
> +CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
>  CONFIG_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_QCOM=y
>  CONFIG_ARM_MHU=y

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
