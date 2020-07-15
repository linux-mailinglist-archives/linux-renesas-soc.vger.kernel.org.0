Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D992206C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 10:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbgGOIKY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 04:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729592AbgGOIKY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 04:10:24 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0CBC061755
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2020 01:10:23 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id x9so1568414ljc.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2020 01:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MRPUaYzwY/L8q/ZUeR+9TLj1/Bt/WM7Eyy7SnZCdHSY=;
        b=xOLCSSS3sJvH9X2ijoUcIIvV87T2N9IJJmb+7QU8KQZmjJdx/HblCgpl9fszq0Q0pA
         qepTjM6ErIMGVncC9TCJeecSsJEjpPgbJ1wAWhhiSCOsRnIECjiCxcZnxcP/1Q91T9zj
         h5v0DjD0WFj0hp0SvKSbwcJDsyWSYjDtb0dMGNk/0bauptA9w43COu+TLJ3MPUTaBbbU
         3iCticDDE8YGyDQbTPFN83383a9sRUU6g6VaUJhVgei13OSQV2i1AE4pY6Yc2tjo1E8u
         LlQJIzhRo7XqZ+413qcunAsIz2DboPm7pF3w6wwuHIqcREOa5sIz2JniyPtcXTleAitC
         1Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MRPUaYzwY/L8q/ZUeR+9TLj1/Bt/WM7Eyy7SnZCdHSY=;
        b=mOJX1QoJNTyjajdoTRQ7opkLBDMVeE00iKzcAReZIlAbYKKxnCwfz+EdnxwUbTZcVf
         h9sFfyJCigJHvuZKWSFDaT6cz2ZTSZ6TWyGOIEZ1aPqDMfJNEB3j4jTzfoVbA7Ia9Be2
         7igMy3CXlavS1wRNJgs66dMcYdJQdZalZagVxwsqDy2lLlTMVHsvwbmCAaY4Ia+g1kb5
         159c80LALg/LyHGqm41BMQxO/nThR2Kfo0P2rwTtpD01T1BqC6ioFniModjr2oyDj0hW
         IwLFSQK0xHGohjJzRgmQHEykws9949jqPVSuEZo9HSlU9OpRF8mD8xii1zTrlSmDLeGT
         e1dA==
X-Gm-Message-State: AOAM530ItfeoxgAHG5oZeuia6g+BlJf1jWZhKWtG9UGiFOTLKCh7e4Gl
        tUvaYWDoMz4gLW7JQ+HwWmb4DA==
X-Google-Smtp-Source: ABdhPJwlIOP4brTSkTJ3D4A7TcHEWCFeK8/MZuYI6cRapVOsSbwQLOr4JuZAkIS9/h55GBSi6zVabg==
X-Received: by 2002:a2e:a17c:: with SMTP id u28mr4141264ljl.140.1594800622250;
        Wed, 15 Jul 2020 01:10:22 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42dd:3c8c:7d45:c199:bbef:e36? ([2a00:1fa0:42dd:3c8c:7d45:c199:bbef:e36])
        by smtp.gmail.com with ESMTPSA id e29sm332987lfc.51.2020.07.15.01.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 01:10:21 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] dt-bindings: media: i2c: Document
 'remote-endpoint'
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, dave.stevenson@raspberrypi.com,
        dongchun.zhu@mediatek.com, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
 <20200714142856.58365-3-jacopo+renesas@jmondi.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d00e9b32-5a20-77b2-e99f-ac8822041bbc@cogentembedded.com>
Date:   Wed, 15 Jul 2020 11:10:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714142856.58365-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 14.07.2020 17:28, Jacopo Mondi wrote:

> Document the 'remote-endpoint' property and add it to the list of required
> endpoint properties in imx219 and ov8856 dt-schema binding files.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>   Documentation/devicetree/bindings/media/i2c/imx219.yaml | 5 +++++
>   Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 5 +++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> index dfc4d29a4f04..0251e15fe0a7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -71,8 +71,13 @@ properties:
>               description:
>                 Allowed data bus frequencies.
>   
> +          remote-endpoint:
> +            description: |-
> +              phandle to the video receiver input port

    s/to/of/?

> +
>           required:
>             - link-frequencies
> +          - remote-endpoint
>   
>   required:
>     - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> index 1956b2a32bf4..c1f363bb5aee 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> @@ -84,9 +84,14 @@ properties:
>                 Allowed data bus frequencies. 360000000, 180000000 Hz or both
>                 are supported by the driver.
>   
> +          remote-endpoint:
> +            description: |-
> +              phandle to the video receiver input port

    s/to/of/?

[...]

MBR, Sergei
