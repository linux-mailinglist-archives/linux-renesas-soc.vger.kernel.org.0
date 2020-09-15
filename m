Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF1526A166
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 10:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgIOI7W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 04:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgIOI7R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 04:59:17 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6938DC06178A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:59:16 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x23so2552086wmi.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I+pbT1inBl3n0lqbrLVg66bp8zNdCDEV4y1lVPSy6l0=;
        b=BZKOuerOrNiKoqZ4oLXn8qN+SN/oZGF43V56o7NN+7e+Q+Xz+iW5tEV0tm6hazl6xD
         3+P4KW8GSm0NLpiXBb+TaOEAo6bhgVyQ5ehL54Bm+r/au+qo/dksX56pSHTPx2u0Bu8j
         POe9WXbghsUq4kWKhGDX4/VlK9uL5kYzosWSWsQuD3HBtfq5O0gBqMsscJRF+9gTNlA+
         QNFpNobaM/JSRpve3hNx4NNjNZbigQgR5KzmGILri1ef/uxLK8gRBm8EORZt2aWFDFrb
         KwaLL98M3WxNDlGyEbjfjZBErbKWVEhhoE+HI5PKTvLyfuPHWJLlSjwJjVWtAHkUaRNw
         YFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I+pbT1inBl3n0lqbrLVg66bp8zNdCDEV4y1lVPSy6l0=;
        b=ot1RUyocwsrP938l+zI5UafifU5dF9mXD6YtSm30KMiWHAkaSq31wMTamNaVfpEgz/
         5VrI4EZjrYxkdKoV3Zvr6I6LqJ78PqBXqGKPC9SgKsrBHl+leDUNNlIidWydjz/Jg/Vn
         OONN5QegJh9VJ5iiuAbwkIfEG/DNWUHUPjRsI5l4A9IrjTWmrtQsXqPekGIOFPn/oiZj
         y5kyetDKpqZBggWGmItXJH5umfDSaSj3YVueoBCsWvyBqDLFgMNk/zIbj4eG4PXro8Q6
         rH31hv+cELh6pBudMO1qehX3/LBlJ7uZG7zUkKAgk5rKIuCahuuEbHVLq2Fwggl9fx5t
         T0HA==
X-Gm-Message-State: AOAM5315fX2RuM36TrtU6T//DQQeAvIndAIE2CGe2m9oaAMZt/0oF0ph
        +M6Y3oIqfdyeWTGUc4KLn1u3RA==
X-Google-Smtp-Source: ABdhPJxwl+AR0veGFI3LbaOBK0x/v70KjIHfeeKzmk5Q9nYP362xI37wxMCUtVU9pFmj4dxpOO+BLA==
X-Received: by 2002:a7b:c404:: with SMTP id k4mr3575686wmi.168.1600160353652;
        Tue, 15 Sep 2020 01:59:13 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a402:e7fb:d494:d130? ([2a01:e34:ed2f:f020:a402:e7fb:d494:d130])
        by smtp.googlemail.com with ESMTPSA id n11sm25365785wrx.91.2020.09.15.01.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 01:59:13 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,cmt: Document r8a7742 CMT
 support
To:     Rob Herring <robh@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20200902091927.32211-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200914201503.GA164883@bogus>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <657f4e13-7d5e-0885-a8ba-c692e97e3cb4@linaro.org>
Date:   Tue, 15 Sep 2020 10:59:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914201503.GA164883@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/09/2020 22:15, Rob Herring wrote:
> On Wed, 02 Sep 2020 10:19:27 +0100, Lad Prabhakar wrote:
>> Document SoC specific compatible strings for r8a7742. No driver change
>> is needed as the fallback strings will activate the right code.
>>
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> v1->v2
>> * Reabsed the patch on top YAML conversion
>> * Restored the Acks
>> ---
>>  Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
