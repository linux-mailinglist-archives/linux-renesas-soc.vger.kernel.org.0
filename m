Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB10473473
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Dec 2021 19:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242025AbhLMS5G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Dec 2021 13:57:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242039AbhLMS5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 13:57:05 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A4CC061756
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 10:57:00 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so15314563pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 10:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SJQo48NUmZkGZt1euitJNnArwB/A5OwQryrDW1DTEUY=;
        b=mR4sP0FAduGkecIn78GO9pfQYM8sqxaO605tT2SSIoABlfHhgJEJtGLj1fKdGDYyha
         JGusEx08UFDd9brckayAl3rjS3zMN9ufR3X1jGkfyUOMa1ukqvCyminJ3i5hRLHHknzf
         Yk3sIFomgNgoq8rQ0hZA405oKbUVgSBZ/FCSZ7stLCH52jESvlh2txxomi8Ik+Gj9ivS
         EsTK8YqAGFxPPDZBpnbNAkz6/60K4ZAXqoQdtAT7Y7dItfzAn5juFFIioZQz/vyisf+n
         IZXjPKX7GOrmcrku+Z7/BwQZfyZwt8IS+BwZZmtcJ2PlvjYa1cnoDIGiGV4j4oXo+ho3
         j9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SJQo48NUmZkGZt1euitJNnArwB/A5OwQryrDW1DTEUY=;
        b=IsnqXn9kbvpa4IyoHdw76ge9YwMUtvFHtv20gFpV58bdLPdfmJznhBrqoEpQOpwAGp
         hkFQJb/MVRc5m/Ty5MvHI5QBw3Jz+1+1afCDrSYs4gUHi0AYp009XnI/Pr2+ETZje8cy
         GqJ+hy8GYThVgxRXQBiDJZfHZffJwldcm5gj6a9Kyjjlv5XXBAJNvdXXS2Ywxs4yFSHc
         DyEWxKkyWeAwtr0H2aXG+Nlbm4WAMMRnYhne0vkB+Adq41Jj42chQRnkRtJTR9C1sIJC
         AQ0cShDgVR2zRsbW8oBgPNWb5XtED/UNVF6M4k6VDvT4RCW7t04gFL4s+JGVsgYoSPpz
         dGVg==
X-Gm-Message-State: AOAM532+pJvbf2wjOdOrDauZcnSKHvr86f9mMR2iCuPbI2YrSCX2UoNj
        fKjT0K4xUzzbybO46BM5lZGiqA==
X-Google-Smtp-Source: ABdhPJxNnuxdKkqPual8sYPX1MjA5j+lejydfjOREey1YjoX3NWB2OsK6FTTT64wcd8+cJTIvJ6K5A==
X-Received: by 2002:a17:90b:3850:: with SMTP id nl16mr160887pjb.10.1639421820424;
        Mon, 13 Dec 2021 10:57:00 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t191sm5615027pgd.3.2021.12.13.10.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 10:56:59 -0800 (PST)
Date:   Mon, 13 Dec 2021 11:56:57 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Initial Renesas R-Car remoteproc support
Message-ID: <20211213185657.GB1474575@p14s>
References: <20211207165829.195537-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207165829.195537-1-julien.massot@iot.bzh>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 07, 2021 at 05:58:27PM +0100, Julien Massot wrote:
> Most of the SoCs in the R-Car gen3 SoC series such as
> H3,M3 and E3 have an 'Arm Realtime Core'.
> This Realtime core is an Arm Cortex-R7 clocked at 800MHz.
> This series adds initial support to load a firmware and start
> this remote processor through the remoteproc subsystem.
> 
> This series depends on
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211022122101.66998-1-julien.massot@iot.bzh/
> to be able to set the Cortex-R7 boot address.
> 
> One of the way to test this driver is to use the zephyr upstream support
> for h3ulcb board 'blinky' demo is my favorite testing firmware.
> 
> To generate a firmware with the zephyr project.
> 
> follow this starting guide
> https://docs.zephyrproject.org/2.7.0/getting_started/index.html
> 
> Then compile your zephyr demo
> west build -b rcar_h3ulcb_cr7 zephyr/samples/basic/blinky \
>     -DCONFIG_KERNEL_ENTRY=\"_vector_table\" \
>     --build-dir h3-blinky
> 
> Then you can use h3-blinky/zephyr/zephyr.elf as a testing
> firmware.
> 
> Patch 1/2 adds the dt-bindings
> 
> Patch 2/2 is a small driver to cover basic remoteproc
> usage: loading firmware from filesystem, starting and stopping the
> Cortex-r7 processor.
> 
> Julien Massot (2):
>   dt-bindings: remoteproc: Add Renesas R-Car
>   remoteproc: Add Renesas rcar driver
> 
>  .../remoteproc/renesas,rcar-rproc.yaml        |  65 +++++
>  drivers/remoteproc/Kconfig                    |  11 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/rcar_rproc.c               | 223 ++++++++++++++++++

I have applied this set.

Thanks,
Mathieu

>  4 files changed, 300 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>  create mode 100644 drivers/remoteproc/rcar_rproc.c
> 
> -- 
> 2.33.1
> 
> 
