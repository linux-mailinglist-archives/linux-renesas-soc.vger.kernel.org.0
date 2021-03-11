Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEDE336ED4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 10:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhCKJ1o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 04:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbhCKJ1d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:27:33 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B8AC061760
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 01:27:33 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id v9so38633938lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 01:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZZ1x3fJR13IDUlUyTLHC+9HHZmA4FopKKf9o0ET7Ois=;
        b=Nu9MDG1LrqxFH9bUgBNJTxCNCpR3pc0ivzxTmeLt51unRsWlKszi2vKr022Sxj9r2G
         QhoppkyKGE7doO4chceZf1n0qjr1jZPeG4ImbhQT8MCI0dwF2CFD9vTF4q2PR/J8CIFX
         4e3HacgGH9vzE0UjRuFrAP/rN/ZYDGfZ9rB+x0lXagC+oh+xWGOiOhiIvsZRGMOwYl7w
         wC/0bvdnRE84VQIT0sQcFx6YVMQdpYI9RuSLgK7oejmpj/q1lswGc3Ta4FjlnCaAWSQz
         7fSPcXAj0q342yHeEvbiLpwqiJ7YZr6X4ouOicSt92fTlsFVX0TAi1l6WM4JhK9r4K1O
         AQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZZ1x3fJR13IDUlUyTLHC+9HHZmA4FopKKf9o0ET7Ois=;
        b=k6i21MMEWJZf4gvO2OejVDRO/Z/N2xEgwSyFGxvdjMLADZ4WkM7oCqmz+DG5wBX2ua
         frkyTxDbE60yEe6EP8U921To9k1hi8n3U3UsdKApVdtMxSQZuei2+iHqXgOAD9ombFwJ
         KWiVDmIU8wBuJIFb2O/FAn3vgegvhOK/9l2KI9oClzZHDvDX8HRumZyhIfCWioI6gXia
         Wo90kuaoCxoDcjQHPYc9ugx2udIkqGiu55wCk9l6G2bwdcowLXohLnHwLmzlUaYNY9t/
         0IKBl/cRFQ4eM2E5K+ZNfQVL471w0Mjyj6XLTtA97SD7nQ3wguknUxs/5cbN0M0at3jm
         hHzQ==
X-Gm-Message-State: AOAM532s6V9UBgG55l2obt90jc/VYbFWLjfcQVRKQ8hCaxxLQJUP52dq
        v8y3UC7gPVHZMKrZDyl5PzJFbA==
X-Google-Smtp-Source: ABdhPJyGMjQZ7RqqpLevOepJ//qmtKzapvMKD8KBPgOElAjgYqyPPJLWUVeYJ+a6+PwdO3iUZvFcOA==
X-Received: by 2002:a19:7e97:: with SMTP id z145mr1952003lfc.280.1615454851921;
        Thu, 11 Mar 2021 01:27:31 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w28sm656845lfk.185.2021.03.11.01.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 01:27:31 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:27:30 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,cmt: add r8a779a0 CMT
 support
Message-ID: <YEnigsubARUgLe7u@oden.dyn.berto.se>
References: <20210311090918.2197-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311090918.2197-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2021-03-11 10:09:18 +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Changes since V1:
> * none, but additional testing was done which revealed that this CMT
>   in deed behaves the same as other Gen3 SoCs. There was one hickup
>   which seemed unique to V3U but has been reproduced with M3N meanwhile.
>   This is something we need to tackle, but no reason to prevent adding
>   V3U support.
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> index 428db3a21bb9..363ec28e07da 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> @@ -79,6 +79,7 @@ properties:
>                - renesas,r8a77980-cmt0     # 32-bit CMT0 on R-Car V3H
>                - renesas,r8a77990-cmt0     # 32-bit CMT0 on R-Car E3
>                - renesas,r8a77995-cmt0     # 32-bit CMT0 on R-Car D3
> +              - renesas,r8a779a0-cmt0     # 32-bit CMT0 on R-Car V3U
>            - const: renesas,rcar-gen3-cmt0 # 32-bit CMT0 on R-Car Gen3 and RZ/G2
>  
>        - items:
> @@ -94,6 +95,7 @@ properties:
>                - renesas,r8a77980-cmt1     # 48-bit CMT on R-Car V3H
>                - renesas,r8a77990-cmt1     # 48-bit CMT on R-Car E3
>                - renesas,r8a77995-cmt1     # 48-bit CMT on R-Car D3
> +              - renesas,r8a779a0-cmt1     # 48-bit CMT on R-Car V3U
>            - const: renesas,rcar-gen3-cmt1 # 48-bit CMT on R-Car Gen3 and RZ/G2
>  
>    reg:
> -- 
> 2.30.0
> 

-- 
Regards,
Niklas Söderlund
