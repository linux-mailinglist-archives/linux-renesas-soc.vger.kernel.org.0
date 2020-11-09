Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487D32AB431
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 10:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbgKIJ6c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 04:58:32 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45242 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727906AbgKIJ6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 04:58:32 -0500
Received: by mail-oi1-f194.google.com with SMTP id j7so9607489oie.12;
        Mon, 09 Nov 2020 01:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSaJwl298zJwu450VpXZtG5wFytz2EgELoYznGvjlD0=;
        b=UM9k/mxFdb4v4BtToQTfNI1iDUSQw9fJ/fTC+2VGoxlgWIy8bhY7Mj+h6NOTBreIBC
         alV0v2L8iCvL/cdbaKkRp/Qhp4nHGfpke6agzS2w1Vp2DDEWsboQi44Mrt/1HBq9L8wq
         D6XPuOckdCVJIulx6CP7ELgx3ynBBy70BbWVL2rt7zB9q0iX9gXvlj5gBo/g/HIzOnRL
         DqwRB2ybMW+W367qVCsJikAVyzmyy/9zzRCWfH7ok0vi+66D+bL5JI1kCaxcy+onmTBD
         zXeiV3kzNDV7OC/nOdx5P58AfURTyd8Osf40DbWp3YUqeHNhDvLIFuwb6DTJtPWp258d
         i6Ww==
X-Gm-Message-State: AOAM530U2Fo7cM135y5arAl4mTu+lZodaEcZ8S5Lg72KCzKMsmu4tIA+
        uQw2eeFbdW33j5MuFhxetYA1QgjIgAAYk/zyS/Y=
X-Google-Smtp-Source: ABdhPJwbZnVB1sIrhj2hKmEdMsFQ9IbeVtjBMKPHRgInIQhbCJas58UzDk5a+yECZ1x2kzJtLe0rdOWRONoijV/fi/Q=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr8091535oia.153.1604915911336;
 Mon, 09 Nov 2020 01:58:31 -0800 (PST)
MIME-Version: 1.0
References: <1604654877-30010-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1604654877-30010-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Nov 2020 10:58:20 +0100
Message-ID: <CAMuHMdUxcuafZ_AV__DG1vWoh1dqv_7z7-f85-t5GpzuuKs4eA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: add sdhi/mmc aliases
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

CC devicetree

On Fri, Nov 6, 2020 at 10:28 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> After the commit 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS
> for drivers that existed in v4.14"), the order of /dev/mmcblkN
> was not fixed, so that we are hard to use the device as rootfs
> by using a kernel parameter like root=/dev/mmcblkN. So, add
> sdhi/mmc aliases.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> ---
>  I'm afraid, but I only tested on r8a77951-salvator-xs.
>
>  If possible, I would like to apply this patch into v5.10-stable
>  because we are hard to use the device as rootfs as I described
>  the commit description.

Please don't add aliases for various devices.
You can specify the root file system to mount using PARTUUID= or
PARTLABEL= (by the kernel), or using UUID= or LABEL= (by an initramfs).
This is the same for /dev/sd*, which may change after a kernel
upgrade.

>
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 4 ++++
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 7 +++++++
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 6 ++++++
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 7 +++++++
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi | 4 ++++
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 4 ++++
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 7 +++++++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 4 ++++
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 1 +
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 1 +
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 3 +++
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 4 ++++
>  12 files changed, 52 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index 8e80f50..9165e88 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -26,6 +26,10 @@
>                 i2c5 = &i2c5;
>                 i2c6 = &i2c6;
>                 i2c7 = &i2c_dvfs;
> +               mmc0 = &sdhi0;
> +               mmc1 = &sdhi1;
> +               mmc2 = &sdhi2;
> +               mmc3 = &sdhi3;
>         };
>
>         /*

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
