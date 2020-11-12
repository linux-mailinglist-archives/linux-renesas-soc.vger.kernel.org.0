Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EF12B0438
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Nov 2020 12:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgKLLpN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Nov 2020 06:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbgKLLpF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 06:45:05 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883FBC0613D1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 03:45:04 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d142so4984919wmd.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 03:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W4rTVHjbd+mpguywWNkSROq0hOpiSxqsmTDa7iGbWzE=;
        b=DNCauhmrLLDTzPZ+mQbVBE0eqe/PQovUWayd6SBm7RrhfibTuoWKWG0EWv3oHEhUwE
         FVgr/6Rrg3Y+NcpsqF5u0zlvXOlJ0VnIB6hCciiAebVa1zVaG9TenreCe0QjoQ3R0xRc
         IyACffreqtASl9MdO4+nLmgZbhDvXWrSZkkpOn8PHOU/uT6PUZEUJYQjr9WC/xzoku4z
         FxTjaOEnhNR08GW0xyrZY+uyTfDDOazCtoMMjR7a37auwVi9r6K1ySWeaOVQXQp/BRd3
         IzraqvYlBkxo+tGSBgxGDaAGnqm2Lfc/D6IIwxasUBraNQqG/YYxpJuXXwDB9ONdvMl2
         9/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W4rTVHjbd+mpguywWNkSROq0hOpiSxqsmTDa7iGbWzE=;
        b=Q3XckiLPIiqHIeGhDfrnDFoQF2XhJW2km+pTY7QqMlp3uLhRLrxaHVBsMcc64zPRuy
         f4IXzcvwdCuSqkOYZ4d+eJug5Gjz4HIOVgfxEuX7rXJx1kh9JC/8TLx0nq32tNg4Q1xX
         po1rpsfOUam1YEpEO6vqrGmgqafDaYaJfeNM5I2T8TKu5oDc1pDDwsKzfIixdiUsb3Ua
         GT8TdRUm9BngBteZavtbsFPBH1TKCblpO3B2EHFiije/8k3CGjf9lyCqALNxo7S408JX
         PKvyGUCqp3wVZAx9O9eT8ONIssMKG3SJcxxzZY3p/thzG8IUFKs3gxfegKvfnA4sRSmc
         VO+A==
X-Gm-Message-State: AOAM531F3QPtrgRnBAgZoot1/yJr+XACqoGWK/+j+vag/88+Tq7Q5ZGt
        iJ5i3PlmX/yO/oOcu0E0mR3ffA==
X-Google-Smtp-Source: ABdhPJx6GWoJgz5qXJzSTiQQAr2TDZDRCT0AUD+HPdj5y/7wWse8oZFJ5ZN/sD6m25n3mlGvcJg0Ig==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr8822414wml.57.1605181503138;
        Thu, 12 Nov 2020 03:45:03 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:6971:b700:3764:fa96? ([2a01:e34:ed2f:f020:6971:b700:3764:fa96])
        by smtp.googlemail.com with ESMTPSA id o184sm6215357wmo.37.2020.11.12.03.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 03:45:02 -0800 (PST)
Subject: Re: [PATCH v5 0/2] dt-bindings: timer: renesas: tmu: Document
 r8a774e1 and
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201110162014.3290109-1-geert+renesas@glider.be>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a70ced89-3e47-9211-e914-84e3fbae0583@linaro.org>
Date:   Thu, 12 Nov 2020 12:45:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110162014.3290109-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/11/2020 17:20, Geert Uytterhoeven wrote:
> 	Hi Daniel, Thomas,
> 
> This patch series picks up missing Device Tree binding updates for the
> Renesas Timer Unit (TMU), and converts the bindings to json-schema.
> 
> Thanks for applying!
> 
> Geert Uytterhoeven (1):
>   dt-bindings: timer: renesas: tmu: Convert to json-schema
> 
> Marian-Cristian Rotariu (1):
>   dt-bindings: timer: renesas: tmu: Document r8a774e1 bindings
> 
>  .../devicetree/bindings/timer/renesas,tmu.txt | 49 ---------
>  .../bindings/timer/renesas,tmu.yaml           | 99 +++++++++++++++++++
>  2 files changed, 99 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/renesas,tmu.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,tmu.yaml

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
