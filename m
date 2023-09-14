Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676067A04D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Sep 2023 15:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238608AbjINNDj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Sep 2023 09:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238630AbjINNDh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 09:03:37 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5B41FE0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Sep 2023 06:03:33 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d8168d08bebso983973276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Sep 2023 06:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694696612; x=1695301412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OGBNv/WCy7mlfSU/rquHrfUjucCsufeS4fxpOpJpRLo=;
        b=Fm5n8fCEQoCvtP/ZiYEwftfaaRFRcsT1NGihjTABbR0yJareDaZkWKN6WwdbBFHDld
         mY/zwWAf7Lu/Cfa+q6+zFjinzDKHNpEvzjG2Bqc+qdBBLIOxABJiFShj+ZB3VC+wjqkY
         njFAeq7MYc4AmDaRz3s+SPx9kV5+Y7mU+WjvcCwVA5iZSe+66l+NSegMK5lfRktFcc/9
         KbmQnX4aMD25AWv1NtwOq6S8v4+F6bb7Zfcdis3FH8x46+mQdvYLZbUn59wVRc4xsM8l
         YMVYyWJkTbN+1pFJAZq3+CMZ0IJYcdPM+TkQv88QR1Evh01uz+YWoB32Fp+rc7x4eMt9
         DkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694696612; x=1695301412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGBNv/WCy7mlfSU/rquHrfUjucCsufeS4fxpOpJpRLo=;
        b=qQDgxuhZtJfIvctF4N28GNjensI8Eim1tVuiE5AEL2s7mnLG+1jPfUnBZLi6dZHUx7
         1xJB5LpSCYqklmnYmsvaXJzsTjS3xO/xJtAsFEeoAr9SOzFl/L8QvuSZ3SKMM3hM6m54
         rBsRsh3ixbVgwldpqd1DXUNFxZTg1cGL8j0PWdoDyfPQF1avj/68Vb8x7vIhysFpgvLn
         k2tAFk4025wkO4kkXMh7+ZBFWzqTqpTXa50N9GAAIIJlsu6YM+b+TYEJiyU9g7hgMJV1
         ca4ZXG0DUh23MzV2ONXzm8J9KFNUv/KPKoQgGxTW1GTRUoANpr3nLYYKCCcc/Mib/6OC
         SSHQ==
X-Gm-Message-State: AOJu0Yz+wU/X51n1dJm+C29CsqabXlBT/8WhJws1edr57EDhbiI5fLts
        YkbxWTyYZJQABaNSpq+OYp0slhXhc1cgN7XqlcqNkg==
X-Google-Smtp-Source: AGHT+IHPMzUI/ot3DCoZ/iT1g4muQjpo9ZWKdRV8KZQpwQK3nU4X4TeTU3Js/qM/a3ER6+dKUgmedezyGL+8aAKDGC4=
X-Received: by 2002:a25:1545:0:b0:d81:6116:ac2d with SMTP id
 66-20020a251545000000b00d816116ac2dmr4087422ybv.59.1694696612626; Thu, 14 Sep
 2023 06:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230901122701.318082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230901122701.318082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 14 Sep 2023 15:02:56 +0200
Message-ID: <CAPDyKFrmQs76oDbDrza=CKsp0VLHj8xTn9smUwvpXFbKaCZpAA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: host: Kconfig: Make MMC_SDHI_INTERNAL_DMAC config
 option dependant on ARCH_RENESAS
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-mmc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 1 Sept 2023 at 14:27, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> MMC_SDHI_INTERNAL_DMAC config option has dependency on ARM64 and
> R7S9210/R8A77470 this dependency will keep growing for future SoCs for
> varying architectures. So to simplify this configuration make
> MMC_SDHI_INTERNAL_DMAC solely depend on ARCH_RENESAS, as all Renesas
> SoCs inherently depend on the ARCH_RENESAS config option.
>
> This allows selecting MMC_SDHI_INTERNAL_DMAC config option for RZ/Five SoC
> which is based on RISC-V architecture.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v1-v2
> * Add dependency on ARCH_RENESAS instead of RISCV
>
> v1:
> https://lore.kernel.org/linux-renesas-soc/20230901113703.314667-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  drivers/mmc/host/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 554e67103c1a..2e8476db2381 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -677,9 +677,9 @@ config MMC_SDHI_SYS_DMAC
>
>  config MMC_SDHI_INTERNAL_DMAC
>         tristate "DMA for SDHI SD/SDIO controllers using on-chip bus mastering"
> -       depends on ARM64 || ARCH_R7S9210 || ARCH_R8A77470 || COMPILE_TEST
> +       depends on ARCH_RENESAS || COMPILE_TEST
>         depends on MMC_SDHI
> -       default MMC_SDHI if (ARM64 || ARCH_R7S9210 || ARCH_R8A77470)
> +       default MMC_SDHI if ARCH_RENESAS
>         help
>           This provides DMA support for SDHI SD/SDIO controllers
>           using on-chip bus mastering. This supports the controllers
> --
> 2.34.1
>
