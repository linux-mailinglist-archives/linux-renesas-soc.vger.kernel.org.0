Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E3D333D91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 14:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhCJNXb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 08:23:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbhCJNX0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 08:23:26 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8004FC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 05:23:26 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id f12so23312037wrx.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 05:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C1riStuZvroX7osFRH+wGsNryHjN58V31vmWLCfsSAU=;
        b=ihncK1kArv11gkDmKGjQ7tOH9WiwbFTLafa/ho8rWdjWwNr2gMO2YitOf0Y6Y/Ym0F
         3uavxY4jDPtThRGzw61P9dhD5ZnAO+Q2j5+lVmx8iCPG+QALVDyZxsDPLTuQvlCUXTBe
         xFhh5K99JvvI+o+cmQTjzdbJqsvsx3DpTNd+PWunDtQhg154uJlA4mbCxbhKP8p4HGEY
         mrkBcU/IQByuCpUEz1SSzugm/oxZIQVXqJUhseRnslQ3XR6s86Fv/TIjTfUHBnp+lPP3
         miuad+8qMbfZ6xHwIScU8i1f+6Rbnj0a2QiNYJdXDCITiPIUy+CzcplvQdj2RNckhBMn
         0oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C1riStuZvroX7osFRH+wGsNryHjN58V31vmWLCfsSAU=;
        b=oEdmHdcXKrzQSstR0Tqpf8aZ59gjWBmDNxew3i5JoPVrVdJyPu2A6GadwzM1m0bm91
         B9TF04qpKhAK/sdSqAPfaYUddJaXGIeBpZdQWDUN1SiPgUBw9obfjmoJELpvHN1epYRw
         RnfZsurfpOAF2x+h6r0ZDPC6DKdp0wOBtKopHRgWW+BjlXEzXBwHXeFC90I3NYWaRJ/E
         ugvTCfKp4nxQB6pQTDnpFlS9uUzBXSGqdLi/UsoKoTvmWp9mlRhwplw0dwlal3PHbV4+
         2/MskC++pwGJG4nnOHhgocEytlA4lEJT1JVXyJ1P2guCcKM5iY0veqaMalytIqmc2FcT
         oSpQ==
X-Gm-Message-State: AOAM5328rOPW1GeN1b7UHeeOqK441VEgGRFw4wrvDyvQvH1AZW5jW7CL
        Me8z0JjcWKMxPUQsIroi7Zv/hw==
X-Google-Smtp-Source: ABdhPJy6qzJB2s0RsnCOW2r7Rpd6qlvznVMwhYl+GLA33b8pPzObM/4xP3Qn9wna7bcQXEXf0rDdHQ==
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr3504901wra.419.1615382603472;
        Wed, 10 Mar 2021 05:23:23 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:8018:efa9:4421:9140? ([2a01:e34:ed2f:f020:8018:efa9:4421:9140])
        by smtp.googlemail.com with ESMTPSA id j6sm8767348wmq.16.2021.03.10.05.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 05:23:23 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,tmu: Document missing Gen3
 SoCs
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>, devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210211143102.350719-1-niklas.soderlund+renesas@ragnatech.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c12fd07a-b653-4269-1f3e-24d2a15df931@linaro.org>
Date:   Wed, 10 Mar 2021 14:23:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211143102.350719-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/02/2021 15:31, Niklas Söderlund wrote:
> Add missing bindings for Gen3 SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Appliedn thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
