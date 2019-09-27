Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB6AC0A9D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 19:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfI0RwH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 13:52:07 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42107 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfI0RwH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 13:52:07 -0400
Received: by mail-oi1-f195.google.com with SMTP id i185so5898277oif.9;
        Fri, 27 Sep 2019 10:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZbDBLpkCaFop2cTquA8oNIrLDUYKHpEiFXnkBADI8Do=;
        b=dEz7gaHWzkn8vZ82FVftwMeQsZ2qoU6GhvbLVPTWuW2anyK3BjGjHFlMKSM6Hr/z1k
         QZONDxcL/Noa/FmLDqTqFd3ZzHsg9RPwTfmY5qpHwxUKlz/msWj8jiWMfFB8lkpttHeT
         PnJa4+HvpeKK+d6SMnLyguXYXZZtIusUfnXlYsNqZjAUVkeSS1Oy3BcMvnXL42f89/Vf
         f8oVAI72RWDv8XD4I/c5d4joP5EejURszpVUlCVGYmXdHjuSSNdywWXlnCATdNfiQTv2
         CwMUX7x6YI7DHwTigDutmVPF85zkmZm9lueEWjg/VocYt2Bca5sLZQ+LOPM72iX3i86R
         0coA==
X-Gm-Message-State: APjAAAWXrRj/yuPKS6/lhsebTFWgikqGroN8z4zCkAzUoZa9XzMDhBl6
        IONW4/6TSx12KoXLnBZicA==
X-Google-Smtp-Source: APXvYqyC0MuUIaHugqUNSHPTcxipjw4lnRgFwF3wzFjdTJ8s4AL0gIBRkZgKDEB+LgLlaZVAxuF9yw==
X-Received: by 2002:aca:fc06:: with SMTP id a6mr8360150oii.28.1569606725111;
        Fri, 27 Sep 2019 10:52:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q124sm1892105oia.5.2019.09.27.10.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 10:52:04 -0700 (PDT)
Date:   Fri, 27 Sep 2019 12:52:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: irqchip: renesas-irqc: convert bindings
 to json-schema
Message-ID: <20190927175203.GA9117@bogus>
References: <1568915311-28928-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568915311-28928-1-git-send-email-ykaneko0929@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 20 Sep 2019 02:48:31 +0900, Yoshihiro Kaneko wrote:
> Convert Renesas Interrupt Controller bindings documentation to json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> 
> v3
> - Add interrups to required.
> - Update the example to according to the current implementation.
> 
> v2
> - Add SPDX tag.
> - Document interrupt-contoller, reg, interrupts, power-domains and resets
>   properties.
> - Add addtionalProperties.
> 
> ---
>  .../bindings/interrupt-controller/renesas,irqc.txt | 48 ------------
>  .../interrupt-controller/renesas,irqc.yaml         | 86 ++++++++++++++++++++++
>  2 files changed, 86 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> 

Applied, thanks.

Rob
