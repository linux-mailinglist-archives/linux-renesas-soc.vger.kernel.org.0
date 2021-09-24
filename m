Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECD84170B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 13:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245248AbhIXLSU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 07:18:20 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54754
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245195AbhIXLSU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 07:18:20 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 655F24019D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 11:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632482206;
        bh=aiCG4TKCxB5pDlfBPhlfyfaq05mK5AFrA1zDk3YN3Zk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ngDW21P5rKH5E31yuLlMk08oOy3vPKncyS9rnm7+CUuqxZ9rpsReH6P0E3XP7IsJL
         2h3UK9PvjUrKdJv0B0LGkuq53XQv7F5VU/C81WF2MFVL/IRr5wvB4OIEF+Wq4IexkD
         fPqqU+yAdS4tM4q78QaIyeVWOUW5t5L5u5YW4biyr9km3wPnMbczydTE9u1xQO+KLF
         RduzMjk0kh8+mo6tYVNxEpJQkMHPU8EhWIiRIOKaey+APgEIZVXiknGSg20PFSG7Uz
         CV4gd1bKSf0xzPzrg4OHyndDJMZGEAE16T9Kyh40t/y0++L+WdCxuJ2D1YRk2pZF0r
         TcTk39hKxElBg==
Received: by mail-wr1-f72.google.com with SMTP id r7-20020a5d6947000000b0015e0f68a63bso7746042wrw.22
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 04:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aiCG4TKCxB5pDlfBPhlfyfaq05mK5AFrA1zDk3YN3Zk=;
        b=mxlJP/1lwAYHTFkTRJ2pbhc4uThm/+nMYI1XIRLv60AL69/d+aMgDpcc8QxRz0i7Tl
         N63dNmqAxBQMzG0t2qgSGEl6E0NtOBkzF94JblgMNvK/t/F1jslgo7zhX/R84jyd1Kf0
         80DEmy3zfMSE4xYEqZ3EUO0/z34sfnzN6qm7Ov3Ph9aQGSl4pIpgV0fs4NeydgULNj01
         8sIn1D9v76wZ1gt/Ytdcx24vsAFpiTQn+zestz1Ynz0yPhvPDLTFjIYJeStYPt2JvfSP
         riD4BDnOyOss0Yc/C6/BV+Nci/P5VrHS+c8A4VJODJrdbLw5obJ/At40bpJ1+w4Za32V
         DBQQ==
X-Gm-Message-State: AOAM530Z05UO5CbbezKMZTMQPaS8SxVM4Ubt6aEZPCdb2WIX8yY2li3Q
        O4JZPWQEi0xag8fJZs/eAs+Nw6H+v/bNKjSykjY7su2dN7kumEYFmDO6+HUd5pFIQdGrihdTPcP
        2SLc8u52pCLDRL25UcvZJghx00r95G8Mk7OCK3IgHuDxa61uC
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr1445590wma.83.1632482205430;
        Fri, 24 Sep 2021 04:16:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+ZIBTe1TLhsLs5L6B4mgKWTfR95aGpSX0d+JQJIY6OfeZcyVoHaFWVremJOS2a55z2/0e4Q==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr1445571wma.83.1632482205225;
        Fri, 24 Sep 2021 04:16:45 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id o7sm9958016wro.45.2021.09.24.04.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 04:16:44 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: rpc: renesas-rpc-if: Add support for the
 R8A779A0 RPC-IF
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        devicetree@vger.kernel.org
References: <20210922085831.5375-1-wsa+renesas@sang-engineering.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <75713e8e-f675-240e-b503-99618d07afda@canonical.com>
Date:   Fri, 24 Sep 2021 13:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922085831.5375-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22/09/2021 10:58, Wolfram Sang wrote:

Please write a short sentence after commit title.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../devicetree/bindings/memory-controllers/renesas,rpc-if.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> index 990489fdd2ac..b15992ad3613 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> @@ -33,6 +33,7 @@ properties:
>            - renesas,r8a77970-rpc-if       # R-Car V3M
>            - renesas,r8a77980-rpc-if       # R-Car V3H
>            - renesas,r8a77995-rpc-if       # R-Car D3
> +          - renesas,r8a779a0-rpc-if       # R-Car V3U
>        - const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 or RZ/G2 device

Where is the driver or DTS using these compatibles? The bindings can
come even without users, but are you sure this is what you want?
Changing them later, if ever needed, will be more difficult.


Best regards,
Krzysztof
