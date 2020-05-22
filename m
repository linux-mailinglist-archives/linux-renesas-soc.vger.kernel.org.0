Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A904A1DEFC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2020 21:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730871AbgEVTKf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 May 2020 15:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730840AbgEVTKe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 May 2020 15:10:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D41C061A0E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2020 12:10:33 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i15so11142500wrx.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2020 12:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZDrFYGrWrVsCIkx8qKuv8iEUIl6kOcW7vHkHGNRlea4=;
        b=mSr4CjG32jy8N7/5mg9nrwpUrlK9RPsy1lwO/tyey+HZr+kXR0uZqfSpL7HLb6M0G1
         vuHgFAYJdD+tMfP6tPO6hOOm+uN/iSGeBM106aKxhQ0sHK6WdoclG3u7nF1YaEhz/wx1
         HCJUefGb1xiAdDzq4AqVMvMjogmtdDUAXYCgvhM2Qb4o/rL/LTHmLOdRPTX8c17GKXQY
         S0+wtKG2Ke+gjtxHUhsULlD/6Qevzl6vUhjX9R61IJJyLEACffMQcgGAhlii0IQQpKrI
         oFUZsy9iaRSr7BzBIVN3c47ObStl1Dm7qQ75OHN4pi29Y+3tOXl85V3EikuKDv3h3WP1
         fK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZDrFYGrWrVsCIkx8qKuv8iEUIl6kOcW7vHkHGNRlea4=;
        b=T4EERb3mZV4oF/5er49d1vT1E9gMQ5w7/291XL229SPi6B+AnfQZP5SvURsCU45Kwe
         rvVgdboWweIJqSY2C2Ax8hEzbfej/wh0gbrI2pqzN7uBh8oNrLSbGwwukZ00ysvmtD74
         ZSqn6bsky/lWxRD1gPKoo1u5oLR+X9mGHEsudrJBYy/M9drWd5c6bhhbOBNAh8C5ln84
         quq5duXTOKma6ggXMtkd70NJP7V7wXoG7HhUGw5UZjJk3jBTDn6BckK5cpiwiUlh5coV
         KKLz33ezaGr1jtIpLLXeaksbf/8q1tdAj5pTqeuIz78yIezniPEi9zHo0+vmhrIIts/x
         nvbA==
X-Gm-Message-State: AOAM530z4uCsSbQYZXpaUepB8E/nj8/94D5MMEaOqukRqXCRfT0LrXxp
        gUcMJYGwmNfQTDiCChGtYAUUgA==
X-Google-Smtp-Source: ABdhPJzmCW8G2dlXPmH1vJk4q8Fo1xc6n46MamO3vno5CtDx8C72BI+KPZdBTtxnSZIYtHUS0FD/0A==
X-Received: by 2002:a5d:42cd:: with SMTP id t13mr4390290wrr.355.1590174630793;
        Fri, 22 May 2020 12:10:30 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id x1sm9847747wrt.86.2020.05.22.12.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 12:10:30 -0700 (PDT)
Subject: Re: [PATCH v2] thermal: rcar_thermal: Clean up
 rcar_thermal_update_temp()
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>, linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20200514152505.1927634-1-niklas.soderlund+renesas@ragnatech.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c5e4d3a1-4b3d-545e-f683-6ccf2ea1f7f1@linaro.org>
Date:   Fri, 22 May 2020 21:10:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514152505.1927634-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/05/2020 17:25, Niklas Söderlund wrote:
> Moving the ctemp variable out of the private data structure made it
> possible to clean up rcar_thermal_update_temp(). Initialize the local
> ctemp to the error code to return if the reading fails and just return
> it at the end of the function.
> 
> It's OK to change the datatype of old, new and ctemp to int as all
> values are ANDed with CTEMP (0x3f) before being stored. While at it
> change the datatype of the loop variable 'i' to to unsigned int.
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
