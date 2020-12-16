Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E0F2DC2C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 16:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgLPPKW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 10:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgLPPKW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 10:10:22 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AABC061794
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 07:09:41 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c133so2671463wme.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 07:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NPjZ/RDAaWvWMr0ln74non1ejMYZfnjpPMZWamobE3E=;
        b=vkCy1V6TPbAr06ulkvg4+xjIPv1X9ogGT1LQZljftEUiViZbaY6IdV1mryqxIE00xY
         PS6D4m8ZHLU6D6C9u59uDZ8Q6jSY4X0eh1N8mtDyS8OIu74ViBeKSem64VEWAB/hE0xt
         /rdhwCy7WXNqodAgRq6wpVsDWaVLIUPG9HaCk0RoEazD297vzR0kTciY8TL/+Hs3qfGb
         2rYRf2lcatcozVmAh9KY1N/Iw/ec2/E22e9uKInenXJjSthRDgjHjcLkI04H5W7DHUXb
         II2iD7+qDjyLwgB/EXdAjB7fG/CV8ekoaNbhBrBpRe0Kug3NqgJ5dCeEbMJUdNu+JUyj
         mB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NPjZ/RDAaWvWMr0ln74non1ejMYZfnjpPMZWamobE3E=;
        b=OgRT+VGz0/Pb3JVnqgmXHSWrm2GfN10uVQh4JIOFlWVqeUIdxkJo1+BQuZpK/igrMR
         e43tdsrCrzPFSaxF0KUceHcdEJeYS1O+juwNkqzhYOBD5cXO9UiEYxzIamyeyW7+F9eP
         XeyrMkOS1RLh8/+jR9wrbAQbTRE245S3ubX4zzz6jAqdiHZQMXPbD6ybBx7XsZnJdf2N
         ppSmdTLWe/QL8ZbKJiUeqDOu6/O9HgOSPJGNhapa86ln4YxV/FDfZuraXV1Is3U8gHYR
         B0izVkwjHoRdwuDLvc5lGfDo2NvQgDE/zxSbp6AILdAVz6hWXyalSanQICDFCc0ckhby
         csbg==
X-Gm-Message-State: AOAM531xnmgvnhMyOm9WAyLD8kdiIql+61APrb9f2luFAMZN3OQQCsNf
        xoLmMMFNPYhNy9yhn3gKl8rS1A==
X-Google-Smtp-Source: ABdhPJyh9WgmW0YegBIZ0o8kVSETiMAk3c2yd09To3cprFySGo/mHAG547nV9WIcrq8ev4hLSSJmyA==
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr3953349wmj.134.1608131380460;
        Wed, 16 Dec 2020 07:09:40 -0800 (PST)
Received: from dell ([91.110.221.200])
        by smtp.gmail.com with ESMTPSA id y130sm3333289wmc.22.2020.12.16.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 07:09:39 -0800 (PST)
Date:   Wed, 16 Dec 2020 15:09:38 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/12] mfd: rohm-generic: Add BD9571 and BD9574
Message-ID: <20201216150938.GJ207743@dell>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608104275-13174-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608104275-13174-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 16 Dec 2020, Yoshihiro Shimoda wrote:

> Add chip IDs for BD9571MWV and BD9574MWF.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  include/linux/mfd/rohm-generic.h | 2 ++
>  1 file changed, 2 insertions(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
