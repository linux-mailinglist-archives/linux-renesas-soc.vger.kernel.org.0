Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B8D1BBD62
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2020 14:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgD1MUd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Apr 2020 08:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726361AbgD1MUd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Apr 2020 08:20:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD25C03C1A9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2020 05:20:32 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g12so2604719wmh.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2020 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uYEFetyk7yEs/OGLXEbC40B/ODDkCIuOofswNQx6m3Q=;
        b=Y0p4SIz9LbLJwJdtP/PUq7sX3+J1vVPvRDG3um0FP+GytxpeFoL6MQyREG+Z3o6Qy+
         u5SDN6+bgTGJM0zS8YVrl4qxdwrWFdOeSNQ85W9d8jqZIKJO9dUnk+pb+9U7YxD9HfcV
         fasHgozehvw7NAUf63BejZrbSYTarTw50/V7z1obfvd52A+jKnePsC2oCHjaL/VeYm6U
         c796VIBRTtjDXHBjPFxtoE3+14snc7NA2qDGm/S8FaJvLz1RSZWqQhR8zrHx5kOAK6iq
         S2kpEXPby/7VS1WuKSpe9e0eDI9wpDvmPXpnMCSD17aV1TdhrNLuFkMOAszVWOJGNnzn
         bYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uYEFetyk7yEs/OGLXEbC40B/ODDkCIuOofswNQx6m3Q=;
        b=LkpvhedNFmQv5BNUsLjuOThhxlnIh/Xz8WPNVt3sgdBCsDzSgxQ4dftJ3ig0fxLV4Q
         Azeb5G+qUo4ZOUA+ORhfMZuInYY02g4SNbxDuxp7e080kz/nmagVGR1fEuGu3EYGUjpq
         svtU7mr7rK2V0rXL6Cw7u9nnuNYmbW485w4tKLNuHxRNlWjXqpMq6Hv0Pd1mWJyvHRfB
         xMnzOOOB5QhnBONopy0fI1Vin6yu0uStqU+WDl8p8aIRXg/afi/S/iGEB1u0h301SRGT
         5eYJMht1nkj+NcykKTT79BbYEea0nWP6h6U8pqNdl61LQFacBVaKouLZRQinkVcjVTq3
         0Syg==
X-Gm-Message-State: AGi0Pub5U0XoZxFKhjgA1BWnIWJGyQlRuv47SgMbt6lBVQigvj2z4Qhp
        zmP3jo37jVXN5UP93ifB7nH+Ag==
X-Google-Smtp-Source: APiQypITMKQ9lco4YT7FUuHdJwGGqttr7okyyvyCCDhpaCuHf5y4Pb8Dm55YxiwryGh6kqkGkODbWg==
X-Received: by 2002:a1c:98c3:: with SMTP id a186mr4330037wme.178.1588076431369;
        Tue, 28 Apr 2020 05:20:31 -0700 (PDT)
Received: from [192.168.0.41] (lns-bzn-59-82-252-135-148.adsl.proxad.net. [82.252.135.148])
        by smtp.googlemail.com with ESMTPSA id s14sm2965062wmh.18.2020.04.28.05.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 05:20:29 -0700 (PDT)
Subject: Re: [PATCH v2] MAINTAINERS: Add entry for Renesas R-Car thermal
 drivers
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20200305012721.425330-1-niklas.soderlund@ragnatech.se>
 <20200428120325.GB1372619@oden.dyn.berto.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <84f05c3d-319c-10a9-df5f-15a19d663de9@linaro.org>
Date:   Tue, 28 Apr 2020 14:20:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428120325.GB1372619@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi,

On 28/04/2020 14:03, Niklas Söderlund wrote:
> Hi,
> 
> Soft ping on this patch. I'm unsure who to pester about this patch being 
> picked up, should it go thru the thermal or Renesas tree?

Applied for the thermal tree.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
