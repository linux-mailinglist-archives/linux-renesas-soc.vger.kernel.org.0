Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D539E33721B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 13:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbhCKMKs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 07:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbhCKMKl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 07:10:41 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A3DC061760
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 04:10:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 18so39340662lff.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 04:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6WQ2Uh7ZOAQINzgbxJVZJPF3m1HcFUAUJ1TDlBBkKGU=;
        b=fnSJ5ej86s4V4r9U4SJ8ZESf0GGr65kdYnTpHxuPvMrZZM2a8V7V8kD2aUbI3WlWSE
         reBjdpVpvYvbknHvJIFv8YxJrtq2wBbCPEGbE61oj9MnZMTYnH4DPRZ9mnDioh9apkLt
         hohpS3IUsqUtQctDHBV2zGBWr+JRFRHABGIFSypEjaAzpjEcPwJxGTRmqlMOKCnYBbvY
         2XqRn7UYfirpUEB31r/3YfejMEQrjxmkDbGAY8MTRzOdC+9fXQ3k6vExf31FhyTkXkrM
         26t3E60ybFd1ZvpkAL975586gUuhFeSQykQvlMnTZecz7cCbTie0KWbYwHe+S9QS3bsq
         mccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6WQ2Uh7ZOAQINzgbxJVZJPF3m1HcFUAUJ1TDlBBkKGU=;
        b=oiwADmlmdUFE2Xnv0itxMYs22a6JkxE+cYZx1ybWkTWgTrd/eyc8lDgF6W2Sy1aG1K
         b0AO7qLfmBRxP12C6jeWVwszs8xYqsKaPRFSviBHRbVQIZdce8wKFNu61hhtPWQ7y7Zh
         aIw9+7sGQAHPku8gXHx9D2/PKKV0uBjznvhSi9TqGYZFNF6s4RYHQsxRCerrJ/kuVOmw
         q5bOGbdcK3UplVXyXaTGKBrdc9qZ5Q/rWzVToEEvvIhj5Bac2HL7Z3gECx1gGCGCXGYn
         kkHXQZWttS+ho1ucpK6ZlPS8uTz4HtJxX6PPQAkd6xMe4u8y7AKIftY+2uJP1w4wKv54
         Dklw==
X-Gm-Message-State: AOAM533CX8imG8WMFXR9Rk714E+X2KpT5AOfvZ0vafz+CyAuu66d/9vX
        5iVzD9JS/IkmQ3TZRQCIwslQoxDtLDL9Zoac
X-Google-Smtp-Source: ABdhPJz6SebrF7Fq9Ak8nU8uXD4GLzklZ6aTnlCi+eN90s+eykOW6giy7THR+Lp1cpEjQOJB/9DgJQ==
X-Received: by 2002:a19:8048:: with SMTP id b69mr2196729lfd.458.1615464639071;
        Thu, 11 Mar 2021 04:10:39 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j2sm782133lfe.47.2021.03.11.04.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:10:38 -0800 (PST)
Date:   Thu, 11 Mar 2021 13:10:37 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,cmt: Document R8A77961
Message-ID: <YEoIvYLcPbzS6VMC@oden.dyn.berto.se>
References: <20210211143344.352588-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210211143344.352588-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Gentle ping.

On 2021-02-11 15:33:44 +0100, Niklas Söderlund wrote:
> Add missing bindings for M3-W+.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> index 428db3a21bb9c384..d16b5a243ed48eef 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> @@ -74,6 +74,7 @@ properties:
>                - renesas,r8a774e1-cmt0     # 32-bit CMT0 on RZ/G2H
>                - renesas,r8a7795-cmt0      # 32-bit CMT0 on R-Car H3
>                - renesas,r8a7796-cmt0      # 32-bit CMT0 on R-Car M3-W
> +              - renesas,r8a77961-cmt0     # 32-bit CMT0 on R-Car M3-W+
>                - renesas,r8a77965-cmt0     # 32-bit CMT0 on R-Car M3-N
>                - renesas,r8a77970-cmt0     # 32-bit CMT0 on R-Car V3M
>                - renesas,r8a77980-cmt0     # 32-bit CMT0 on R-Car V3H
> @@ -89,6 +90,7 @@ properties:
>                - renesas,r8a774e1-cmt1     # 48-bit CMT on RZ/G2H
>                - renesas,r8a7795-cmt1      # 48-bit CMT on R-Car H3
>                - renesas,r8a7796-cmt1      # 48-bit CMT on R-Car M3-W
> +              - renesas,r8a77961-cmt1     # 48-bit CMT on R-Car M3-W+
>                - renesas,r8a77965-cmt1     # 48-bit CMT on R-Car M3-N
>                - renesas,r8a77970-cmt1     # 48-bit CMT on R-Car V3M
>                - renesas,r8a77980-cmt1     # 48-bit CMT on R-Car V3H
> -- 
> 2.30.0
> 

-- 
Regards,
Niklas Söderlund
