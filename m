Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070DA2E2586
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 09:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgLXItk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 03:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgLXItk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 03:49:40 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84FDC06179C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Dec 2020 00:48:59 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d13so1491275wrc.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Dec 2020 00:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Bf2hjmeWUBOoZDSd+ZovErTLhb2oyAevrpdvEm1NOiE=;
        b=oMQ4srYOta6lqjRVO8iaBTZ0DiMTAiCfp4Y/igy35NSUbko0I0Qcj5SRBVDoK37Em2
         n3KXt/COY2CViWBh8xIyYnoIMKKrVQPottMMJ0Sz4i2x62UPWDnLB9WZkSi0jHPS93KB
         wu+snoMiNMtyxmKldIwQaitfHRh7ohl2/72/cOhwLRb82h6+Np+Hge4sRoq2YF6eTtFX
         2f+ff0EfoNchpHXMhuVV7p14MNAt4YvfgBxTYgJD7tmPKPYJMrChPkfoQ4KRqKrrKl7m
         O3C3evhI/AUAXcoD6sYU73dfS4U2qunpFoV1lLgt8Tz/ObghfK2ntzXEEyGbGvCk1EBT
         cHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Bf2hjmeWUBOoZDSd+ZovErTLhb2oyAevrpdvEm1NOiE=;
        b=UboF+XfYGBtIaupP485yRy5SJ8DENfBfiygEBnBWxhxjvgWdNqZBWc1DvnLhw4DBOn
         jYDY77kuvb25F7Xy41bqxFRO/qfLlOVoqtszOlhJgn0TZRr2BbUrnBBYsZ+rkNNjAXNy
         B9ob7gz6b1Jbx8G4PWIh/R768aPwiwDMjUhKibdpgEcT13hBKurGfOkc1t6l+SKpKrPT
         A4CTw+BgCLPcCzUVygBxPEc1PSfMWXbwM9gjDe/BceqzCTEsE7BgX3FdQJko8eHesz6+
         ORwrnur7kKTkGUiWu5TC4VGbZk77HkObrMaSxSYOvFnwvIG22nwnbONJeN0zBBhLFSeL
         YWmw==
X-Gm-Message-State: AOAM530cICyN6jUM1MqQ5vjJk1v3SVU8ywoz8z2xH867u4rs2O0nx+uy
        dNrZy3Pmbup/vETE/rkmG8cD7Q==
X-Google-Smtp-Source: ABdhPJyTfK/DdMwxy2t8IweQ0JPKwkI+sJJm5XD2VY5Jnm6GAk+QAn9hGj/oyL8wE06cU4jLbisGzA==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr33560339wrc.240.1608799738477;
        Thu, 24 Dec 2020 00:48:58 -0800 (PST)
Received: from dell ([91.110.221.181])
        by smtp.gmail.com with ESMTPSA id t10sm36898086wrp.39.2020.12.24.00.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 00:48:57 -0800 (PST)
Date:   Thu, 24 Dec 2020 08:48:56 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/12] dt-bindings: mfd: bd9571mwv: Document BD9574MWF
Message-ID: <20201224084856.GG681741@dell>
References: <1608793457-11997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608793457-11997-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608793457-11997-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 24 Dec 2020, Yoshihiro Shimoda wrote:

> Document other similar specification chip BD9574MWF.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/mfd/bd9571mwv.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
