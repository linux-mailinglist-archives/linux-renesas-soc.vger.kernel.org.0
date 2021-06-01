Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0099C3973AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jun 2021 14:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233934AbhFAM7G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Jun 2021 08:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbhFAM66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Jun 2021 08:58:58 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C695BC061756
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jun 2021 05:57:15 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q7so21653024lfr.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Jun 2021 05:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UyP+0EPFTBrks12sY/2I56eEacli51Tu11/I2xxc9HE=;
        b=E1hZg5c1Lk3fXS8yK88pjfcdHCfVaYPKA5JmBmFk/p3wIQf6DYTsz8UGO4CJtjyZd/
         Jfgdq9nuTz9KSdqFdY8t4e9G170zSdaq8g6ZzqN8qFGr9Vywn4RVcmv6lCyMS9UlfDoJ
         MdNUmnE1PTxOQ/lRADk3j2rnG61OcEOF5Us06A1Y5oXt2tIX7H+i+XkL6EPVnQH7aUy5
         yQeMFeuH7f6kOM/A+IuwWsArF9G7LehonvuZvXxiBvIfgYbM8pgIICxqHU6/I8MkFGty
         9HJHaW+YFjfbV9S5Yw3TERPSrlkxn9Gxeb9nR7vd4sqjxlyGeuaBKh+ELfyrMt+VDRU2
         EcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UyP+0EPFTBrks12sY/2I56eEacli51Tu11/I2xxc9HE=;
        b=hAw8/IwqzdhtawJTXd4gL6Sv9Wi9EdaDjGwbFw0dFxSMvst1q3E2p0SXXuWIFGtnz4
         jzrKJB8HetAhsXHF6xtPN7+yrDj5ynPUYz8n57aLIuml9bljpvB8VjWkt7oOF7uoskMv
         e4cfcq4QKZufEXjoJqxwFVE28VB5X2yUt9TUQrsRakciQgqZbwJ3VZJSzx3Ksd6yOkws
         qJLMASu7F/Hyul6P5AH7iEJVJ/APoiKRJfz917VMlCXyli1j/HhSFIKRZwBS208dsaTx
         mTTmttiSyvsc29E8yj3AmPNJruQ4St3/pIcOFIrS4NdALq0wwUb++Wkj5GqLUUuq9YvM
         u0Eg==
X-Gm-Message-State: AOAM533ikfszgK3Pyn1q0P9KyIyc328Z53vysRGIImInFN4c4snim9Lc
        Zc2JpjCp6TfkD1qp8LQ3gtXpSA==
X-Google-Smtp-Source: ABdhPJzaNWdjj0O1nd9Z8ZpajRkyJ1stnAonHJ1d1UdiqD06szd+RCWXnhp5aaPoy+ERAI5u7g29qg==
X-Received: by 2002:a19:c511:: with SMTP id w17mr18919091lfe.113.1622552234168;
        Tue, 01 Jun 2021 05:57:14 -0700 (PDT)
Received: from localhost (h-62-63-236-217.A463.priv.bahnhof.se. [62.63.236.217])
        by smtp.gmail.com with ESMTPSA id e8sm1271423ljj.28.2021.06.01.05.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 05:57:13 -0700 (PDT)
Date:   Tue, 1 Jun 2021 14:57:12 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Add R-Car M3-W+
 support
Message-ID: <YLYuqG/Z9V/AAonF@oden.dyn.berto.se>
References: <55d2c30cb14b2e10193a7fd4aa7670c70f360037.1622546880.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55d2c30cb14b2e10193a7fd4aa7670c70f360037.1622546880.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-06-01 13:31:55 +0200, Geert Uytterhoeven wrote:
> Document support for the Interrupt Controller for External Devices
> (INT-EC) in the Renesas R-Car M3-W+ (r8a77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> No Linux driver update needed.
> 
>  .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> index b67b8cbd33fcb1a0..abb22db3bb28be29 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> @@ -29,6 +29,7 @@ properties:
>            - renesas,intc-ex-r8a774c0    # RZ/G2E
>            - renesas,intc-ex-r8a7795     # R-Car H3
>            - renesas,intc-ex-r8a7796     # R-Car M3-W
> +          - renesas,intc-ex-r8a77961    # R-Car M3-W+
>            - renesas,intc-ex-r8a77965    # R-Car M3-N
>            - renesas,intc-ex-r8a77970    # R-Car V3M
>            - renesas,intc-ex-r8a77980    # R-Car V3H
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
