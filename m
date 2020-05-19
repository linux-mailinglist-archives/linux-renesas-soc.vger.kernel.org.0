Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F1D1D97CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 15:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgESNbj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 09:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgESNbj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 09:31:39 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E22C08C5C2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 06:31:38 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d21so13706539ljg.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 06:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zz4KmcfH8bN5ODG0ex5UZiQJD1c8wBCbG4DymCKep+A=;
        b=JPl11egiC/rpYvWWDESI7HA/BFOmPHzkcaUh+qIBTvnbvsS97QNPgaHNytnZKZc2WS
         urX7266g5l2HYvhERmRCJEAL36Vot0tCVb9ldLccQUFp7AlOM0T/rKzZHFhB3wIGTY0Y
         G9suicr/C8ZuoboVVRpFmxUnj/zGJyaXXQR6AByuU6S/5Pw5nCxfNQ2TVucTiC8EBprh
         RYhHJIGS5ttTrhqQhF9QVM4hgCuAzeMhpnFEvqqZDUBb6xuyhliw+2EMakO9rU/T6met
         nE4zZmk52U5WvroAp/Lbtyu812WeifFTbzfjq2JuP9JIEw7Zq5Nkw7FZLJ7MN0iWZbV7
         Y1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zz4KmcfH8bN5ODG0ex5UZiQJD1c8wBCbG4DymCKep+A=;
        b=hVC1v/Wh6Can537U+tlGnEv51t1wQVNQC4zr4E+iEvYWDjcVbStRk3j3uVs0yui9Ss
         yzk0zQSPWzFLV1sjkagdsucC+caI/XC8VvAG7zyF+QOAWqe/nBLd6nLt3+KA5n8btgW2
         yjvpDPKGcjQMKyqlBN0l8Bgr3WCTCQU2ReTSSUi+KBOUPPerDZv+WWlIthaeYJq2SEkd
         w90zj5szA8LOInlCD2y8CUwl14wVUT5pMGiomYzdtaQ7g4wjWuuQuENCRhnfIX9uOAAO
         r0kGbn/BqkslIsYvs7O+BLsuN9QtEsjw6sTu4ATs7udSG+uVcesWYXkiv2jHxgXVuNoP
         ++2g==
X-Gm-Message-State: AOAM532m3hGf6KT30gIyUmL/PY9BIKKXTmuvmzqcXHMsDUJNNiTGmy7T
        cgFJzrpcnFedDlYEYi5igW2NCg==
X-Google-Smtp-Source: ABdhPJzb9RGwxu+tVzU1e8nCwzm1ZoYzVXHfqQ/a9+EsosV/wCYQzWZU/Q1MGMK7RV4gEl3OaN7u2Q==
X-Received: by 2002:a2e:584a:: with SMTP id x10mr13878719ljd.181.1589895097279;
        Tue, 19 May 2020 06:31:37 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id t30sm8193056lfd.29.2020.05.19.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 06:31:36 -0700 (PDT)
Date:   Tue, 19 May 2020 15:31:35 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Add renesas,em-sti bindings
Message-ID: <20200519133135.GD470768@oden.dyn.berto.se>
References: <20200519081101.28973-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200519081101.28973-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-05-19 10:11:01 +0200, Geert Uytterhoeven wrote:
> Document Device Tree bindings for the Renesas EMMA Mobile System Timer.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/timer/renesas,em-sti.yaml        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml b/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
> new file mode 100644
> index 0000000000000000..233d74d5402cf734
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/renesas,em-sti.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas EMMA Mobile System Timer
> +
> +maintainers:
> +  - Magnus Damm <magnus.damm@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: renesas,em-sti
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: sclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    timer@e0180000 {
> +            compatible = "renesas,em-sti";
> +            reg = <0xe0180000 0x54>;
> +            interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&sti_sclk>;
> +            clock-names = "sclk";
> +    };
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
