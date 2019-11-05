Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859BFF098A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 23:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbfKEWbK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 17:31:10 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35818 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbfKEWbJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 17:31:09 -0500
Received: by mail-oi1-f194.google.com with SMTP id n16so19143986oig.2;
        Tue, 05 Nov 2019 14:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P7DS8UNeHFmRF9Ai42oFGqJ59k+5UylJEgaKrw08XWM=;
        b=Cfbw30q8KU/mGUpS2WendGh0eF7LRluyRstghVZAnNwFrHLJ/x9yheBMff6/F+/7t2
         K5K9rAjVCUjWLLMmXcYCGnDBOW2z1h0+Cb5LThEG82JZBBdboQON/V6fs39f1XDFK8qm
         VSN8YDq6Dwkg/FfaoyCwR02Ds+GIUfMT71ZrMqSExw+0j3Jh6Q4r3lOwsxDbfEv+kuNB
         O7xws/uPd/IWhgMdKOJ8x0wvZchil3aq2199b0C9R0+WVtGJB7cbDfDzbPY06+BwUyPG
         EBTIWi87vSQvGC8lOpAIO4l7AC0CrdVV11AfJeUsfpMXwBDzc6n9Z79OYrbDxmBtPDK5
         H67A==
X-Gm-Message-State: APjAAAXtjeYeJHp5LTjQAYCsttf2XarAe3nel3SvW9r0aA9fq2H1msUA
        vo2a5IjYtdS0PNFvwcZb5g==
X-Google-Smtp-Source: APXvYqwjhmMiPRy7nJVXI6Asqm9ZybIl+fIpC8DPgsMZgHWYu7TXGKfBgJrTq0u5lMK6YlasMsrn/Q==
X-Received: by 2002:aca:c4d3:: with SMTP id u202mr1198832oif.59.1572993068836;
        Tue, 05 Nov 2019 14:31:08 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u130sm6315754oib.56.2019.11.05.14.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 14:31:08 -0800 (PST)
Date:   Tue, 5 Nov 2019 16:31:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2] dt-bindings: phy: renesas: usb2-phy: convert bindings
 to json-schema
Message-ID: <20191105223107.GA16214@bogus>
References: <1572592763-12396-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572592763-12396-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri,  1 Nov 2019 16:19:23 +0900, Yoshihiro Shimoda wrote:
> Convert Renesas R-Car generation 3 USB 2.0 PHY bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Use const for RZ/G1C's compatible.
>  - Add resets' descriptions.
>  - Remove dr_mode descrption. 
>  https://patchwork.kernel.org/patch/11197805/
> 
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  70 --------------
>  .../devicetree/bindings/phy/renesas,usb2-phy.yaml  | 103 +++++++++++++++++++++
>  2 files changed, 103 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
