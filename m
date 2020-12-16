Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD6C2DC2DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 16:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgLPPNS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 10:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgLPPNS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 10:13:18 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CCCC0617A6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 07:12:38 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 190so2694987wmz.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 07:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oZtd/MZOojyUezV9z23Z9fCQqGnROjf33vmuahV/KQE=;
        b=FQuIx6ZoOsiK6mH/H9Df1fctAVBWHZwPWW96tJo7ckm4t5qoqYxpxM6tM9X5GCXYtg
         +sgbVkjpHSJ2XL5iRefLFQ8JtKSUuhnfDubWxYpYURLGuUAJ7KMqXB+8ccdQUniEU81E
         67jdrBIPgV+5Dtr7kmc6SJEH2BW3VtXMAjd/b7fey5W7n9OvZOY4mMUq+DUfo8S1FUa9
         ZvkabfMbsxM0SSlJk7LLsSvA5OS+9fedthITD+NuO05X1UdC6wKW2GREsY6PQ9EBo6n2
         yID/Ojxp9+P40XmmXLBl3H7KJ8WhYGBx8z9Cx1xs2PZ73m6ahku02hhGRF0NPdCgx7gK
         P5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oZtd/MZOojyUezV9z23Z9fCQqGnROjf33vmuahV/KQE=;
        b=JT7FEYgmyw4BtlMBygfOEXLxIliUnNlxk90pNfxFYU4kwzLi84ZZuyKCL4jhBXHtLn
         UwA7efhyTveG70I02nnwHrEPIXezDLinDhkCAq0IXyEI/pAHDzOmPMsmXpI0+oNAHrt3
         1f5CqFK0OZrfqJD/HQgp7J6Y2BL/9ywtC85HKuMM6X4bm/bRjNBu7PLSRb2YTJyXxL/a
         SuJAyOR5eDipvw7RfIjQmBPlP2Gd/+z58xDr/5M0Gu+CaHHAgnvJQQcZp+wrt32DEOmg
         RiX9KhtKom3g6HeXF9FYENjzEV9npbmxkKiDhcIzJZWRx/t70mytNsRctM/Oj6yPtEGI
         9Gnw==
X-Gm-Message-State: AOAM531sPWTdNHRBTZSpaowV+CdHEBRHd7LntXedD4zM5GWlrveH52AI
        NK0y7gL7UMLog6vx3/BLUiDSVA==
X-Google-Smtp-Source: ABdhPJyHng1RS764CO1pKAO40j3F2Kr655xLIpX0rld1GEblfmjJ1VPqwxbssYrwFdlZn0+hQSJ9qA==
X-Received: by 2002:a1c:96cb:: with SMTP id y194mr3787778wmd.62.1608131556713;
        Wed, 16 Dec 2020 07:12:36 -0800 (PST)
Received: from dell ([91.110.221.200])
        by smtp.gmail.com with ESMTPSA id t16sm3742983wri.42.2020.12.16.07.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 07:12:36 -0800 (PST)
Date:   Wed, 16 Dec 2020 15:12:34 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Message-ID: <20201216151234.GL207743@dell>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608104275-13174-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608104275-13174-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 16 Dec 2020, Yoshihiro Shimoda wrote:

> Use dev_regmap_add_irq_chip() to simplify the code.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mfd/bd9571mwv.c | 27 ++++++---------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
