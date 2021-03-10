Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712B4333CB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 13:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbhCJMhB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 07:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhCJMg3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 07:36:29 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE959C061761
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 04:36:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id d3so33116353lfg.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wvY76eg99jBTqNYFmy4gDh1iQNs6zhJ5b0p9932USQw=;
        b=QRpTJn8ThdXUV39lDd8cnveIRC8086K9/qIj9AwNHSWl65IyxP9tIScbPeLKO+3E1J
         y1XQ+pqMn2MCz0OCRk0p1Cqey8Lb54d+tVIV+7nsEVy8Lx/Cnvx605uodP/QM9THH4m7
         hZwba0y+ue+6LRuqyI0C3B+D5XbyFNGcDj7sBRh8Ybj26mQCLklhmV94mQPUqgpnxFnq
         FaZhKGksWphzJxNScyTGW9LIat3TTkRtSwFpRJ1VIANyheVHjbhBrAP0hWkgsd4htuQJ
         gXOLFbpz8EX8D/GYxQa+ofz/YN4dyZ0uKl7dDFvEoeeUmgDuAmeKHgjmYMZo8YY/y60r
         ZdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wvY76eg99jBTqNYFmy4gDh1iQNs6zhJ5b0p9932USQw=;
        b=IWRQ/MyZJSii4y9Q0zrS4HEZkbx/GPHlyLBEVH2DqCkueEPNyNSO1Pbw5d3K2dutQA
         QC2axMd1fpkdrWMlKMx7d7evHlgpEK00jc/Bfe0NEuL2suWp9wgFxiOsA+4EsnnkXn4Z
         wLcNMfGSwpjZPVTzdDlYfPoJqi9odk0S3/i2ccIf92RBqUsiJtg9a8++Rb1YkIzETT/E
         8hfeQC+B7ZolCYm2kdxLghsGXNbKsJuLSTbcI3UcIBCP7rZ+RnufWQcPc8Iz4HaXIROc
         ycLB3xTnjIyKR9262zn/82uYZ/E1YoNG7tjhdOrT/GM93ZJDunMK7De1i5lY599hJMP+
         q/uQ==
X-Gm-Message-State: AOAM532DDoBaivBY8twktklMmm9QllIALIses3eEtrnKTrhpnFQtenCg
        BwDsS6pz43TUf1urh0Ziv1obZw==
X-Google-Smtp-Source: ABdhPJyF1X1wi9PasHv+1Zwkn73qFo8J6v+WdbE+N5nUdQLBatPlXXALEpSTIirwd8JIZCrmyt//sw==
X-Received: by 2002:a05:6512:1054:: with SMTP id c20mr1884999lfb.170.1615379776478;
        Wed, 10 Mar 2021 04:36:16 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id d21sm3145211ljo.55.2021.03.10.04.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 04:36:15 -0800 (PST)
Date:   Wed, 10 Mar 2021 13:36:15 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,tmu: Document missing
 Gen3 SoCs
Message-ID: <YEi9P8Hr6O48nsR3@oden.dyn.berto.se>
References: <20210211143102.350719-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210211143102.350719-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Deniel,

Gentle ping on this and "[PATCH v2] dt-bindings: timer: renesas,cmt: 
Document R8A77961" both are reviewed by both Rob and Geert ready to be 
picked up.

On 2021-02-11 15:31:02 +0100, Niklas Söderlund wrote:
> Add missing bindings for Gen3 SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> index c54188731a1bd7c1..f0f0f121c355b159 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -28,8 +28,14 @@ properties:
>            - renesas,tmu-r8a774e1 # RZ/G2H
>            - renesas,tmu-r8a7778  # R-Car M1A
>            - renesas,tmu-r8a7779  # R-Car H1
> +          - renesas,tmu-r8a7795  # R-Car H3
> +          - renesas,tmu-r8a7796  # R-Car M3-W
> +          - renesas,tmu-r8a77961 # R-Car M3-W+
> +          - renesas,tmu-r8a77965 # R-Car M3-N
>            - renesas,tmu-r8a77970 # R-Car V3M
>            - renesas,tmu-r8a77980 # R-Car V3H
> +          - renesas,tmu-r8a77990 # R-Car E3
> +          - renesas,tmu-r8a77995 # R-Car D3
>        - const: renesas,tmu
>  
>    reg:
> -- 
> 2.30.0
> 

-- 
Regards,
Niklas Söderlund
