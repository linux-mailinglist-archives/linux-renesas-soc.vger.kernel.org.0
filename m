Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD951D43B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 04:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgEOCqe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 22:46:34 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45762 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgEOCqe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 22:46:34 -0400
Received: by mail-oi1-f193.google.com with SMTP id d191so929705oib.12;
        Thu, 14 May 2020 19:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rgRUhKFU4pBvvn1tTMvoNRwP0Gurxkjj+BJJg0aouHU=;
        b=dZbGDiRCznvhP3q3nvEMSnm/HVRibJZ2H0rfxtZ84AtcSHmvh3j6WayPil7Zs9wBBy
         jceUKNihXXDA4qvIKaZqeh8nTFeTY8uSg/fl0UoKFYMlBF+FweUlDqbSRo8G0QxM2Zp2
         fUtSFMn+AApJ4V24A3/Lrw+abbPatGwT2wk7PL4hBAXvHVCLpzDEkxDWANncb4KxpZok
         KaTSpbxZBnOFMFT5mYajgx/XHRf3deocIdBiPHkxcY48ERQsOe3UjjCpaRjPMmAlWN/6
         TreABIKBpMxVDZysyOS/KGdhQvKdEjDFIM9h7fY/Temnr3RV2Fnobl4NGnlBnRteVEcb
         S16A==
X-Gm-Message-State: AOAM532VfTnFaKGIGmXPBlr9LCYAIW/DPwjwBu5u2XiewYfyikqpFbIJ
        0+yTzpVcA7Q8AJR/CWonRw==
X-Google-Smtp-Source: ABdhPJxmJEjrgNEqN6uOy2pGyE0gZeNpbrPEgge4j3tWnUvak95+Yw67rYWRGoWGGgLu3AC98l/s+g==
X-Received: by 2002:aca:f454:: with SMTP id s81mr641592oih.138.1589510792869;
        Thu, 14 May 2020 19:46:32 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w82sm292622oig.45.2020.05.14.19.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 19:46:32 -0700 (PDT)
Received: (nullmailer pid 24326 invoked by uid 1000);
        Fri, 15 May 2020 02:46:31 -0000
Date:   Thu, 14 May 2020 21:46:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v3] dt-bindings: irqchip: renesas-intc-irqpin: Convert to
 json-schema
Message-ID: <20200515024631.GA24137@bogus>
References: <20200507075503.32291-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507075503.32291-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu,  7 May 2020 09:55:03 +0200, Geert Uytterhoeven wrote:
> From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> Convert the Renesas Interrupt Controller (INTC) for external pins Device
> Tree binding documentation to json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Take over from Kaneko-san,
>   - Update license,
>   - Fix title,
>   - Remove standard descriptions,
>   - reg: fix minItems, add descriptions,
>   - interrupts: fix {min,max}Items,
>   - sense-bitfield-width: add enum and default, use description,
>   - control-parent: use description,
>   - Make clocks and power-domains required on SH/R-Mobile,
>   - Group interrupts in example,
> 
> v2:
>   - Correct Geert-san's E-mail address,
>   - Delete Guennadi-san from the maintainer of this binding,
>   - Give 'sense-bitfield-width' the uint32 type,
>   - Describe 'control-parent' property as a boolean.
> ---
>  .../renesas,intc-irqpin.txt                   |  62 ----------
>  .../renesas,intc-irqpin.yaml                  | 108 ++++++++++++++++++
>  2 files changed, 108 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
> 

Applied, thanks!
