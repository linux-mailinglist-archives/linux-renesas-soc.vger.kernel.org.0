Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 423C563936
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 18:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfGIQVe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 12:21:34 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33959 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfGIQVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 12:21:34 -0400
Received: by mail-io1-f68.google.com with SMTP id k8so44511854iot.1;
        Tue, 09 Jul 2019 09:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tdnazXLhlcJEQoEf7y5DGd94e04z/ROl9oLTu403rzE=;
        b=fvzj8YgqhSZrwYYIpacy6icja8gMDD3iypp0hu3PO63iO7lUAFDQTaVYPQ5A1gwMoy
         nu9jXDTxgvGzdEkxQK1rCJXieKTmfx7pksPELcaDBGQ88PKzNUDAm4hT+G+Agd+o4R3R
         DG7RffiCuSd2S4hnt+EQP6OPpW4a8F9MN0eb4OI3Ckg91x5IC0UAggdJcR9fZNFj/v3S
         refrHN63uriwewKwy8HwCH62ZbqcbwOtzUE76EDmEEjwq3qsHb3AtqjEtcZHIkxvdvNW
         7VjHftOxFwc8T082WQAfHsX4250nrC/nfB2trftreftb2BkI/KldCWw8vmNBtWfec4SY
         FVFQ==
X-Gm-Message-State: APjAAAXKuMYEdqR1VERcy7SJRmDvu4cZqoh6fqcjJ+R4J40oaIdyb3eE
        X3NyqRp6UuxtzQT+S6jWgJ6aEPw0Cw==
X-Google-Smtp-Source: APXvYqyn2+bZBGQnaQ8PEBAI1NK1Q0hq/8r85tftmHQ/WurdZftHs4Hcn0ZqD+Z58LlLwrSzD7XcxQ==
X-Received: by 2002:a05:6602:104:: with SMTP id s4mr26033545iot.200.1562689293596;
        Tue, 09 Jul 2019 09:21:33 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y5sm27713627ioc.86.2019.07.09.09.21.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:21:32 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:21:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: timer: renesas, cmt: Add CMT0234 to
 sh73a0 and r8a7740
Message-ID: <20190709162131.GA6037@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076217672.4736.6510117188637868943.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076217672.4736.6510117188637868943.sendpatchset@octo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Jun 2019 18:02:56 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Document the on-chip CMT devices included in r8a7740 and sh73a0.
> 
> Included in this patch is DT binding documentation for 32-bit CMTs
> CMT0, CMT2, CMT3 and CMT4. They all contain a single channel and are
> quite similar however some minor differences still exist:
>  - "Counter input clock" (clock input and on-device divider)
>     One example is that RCLK 1/1 is supported by CMT2, CMT3 and CMT4.
>  - "Wakeup request" (supported by CMT0 and CMT2)
> 
> Because of this one unique compat string per CMT device is selected.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> --- 0001/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:26:56.325963995 +0900
> @@ -22,6 +22,10 @@ Required Properties:
>  
>      - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
>      - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
> +    - "renesas,r8a7740-cmt0" for the 32-bit CMT0 device included in r8a7740.
> +    - "renesas,r8a7740-cmt2" for the 32-bit CMT2 device included in r8a7740.
> +    - "renesas,r8a7740-cmt3" for the 32-bit CMT3 device included in r8a7740.
> +    - "renesas,r8a7740-cmt4" for the 32-bit CMT4 device included in r8a7740.
>      - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
>      - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
>      - "renesas,r8a7744-cmt0" for the 32-bit CMT0 device included in r8a7744.
> @@ -48,6 +52,10 @@ Required Properties:
>      - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
> +    - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
> +    - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
> +    - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
> +    - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
>  
>      - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
>  		and RZ/G1.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
