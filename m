Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC2B3EF4FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Aug 2021 23:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbhHQVb0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Aug 2021 17:31:26 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:43690 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbhHQVbZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 17:31:25 -0400
Received: by mail-ot1-f45.google.com with SMTP id x10-20020a056830408a00b004f26cead745so133422ott.10;
        Tue, 17 Aug 2021 14:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L8uWZm6U/wNMBuZeSRyfZraEH5jwhS4TJYlvnaSbDCg=;
        b=msJr8sEWql1IOMKqLJlbu0iWdS++G/GxsSVRHWT/zHgnl+uP+2sHHYSudkfojOER4L
         z2KxlgMKFl/iVziN4ZT2HSDVw5cJx7h+K6Xrfv9ihctGAy22OPvZy4I8NDqdbpEdhbbG
         6Wkm8O6alTA/cZey3Hriya43n+zrgGjqQXWB1A8bv8/LidjHe9BSwwK+SuiT7Up8+XHq
         mieuL1vmkrtWTFJLHpysGQV4aUKszxGnUIJdYeD8mGO2wycWc8E4QJw/ntL5IhSIAhYj
         2w8+58iM0UmEEizSj6pIZnDi2V4k+XUNbGFTDaiYUkLiizEraHiEvtq3sveawlXhY4eM
         TOIQ==
X-Gm-Message-State: AOAM5312Z3IbGi580jZHILngAJaLj6KJek14xmsBWIyMoi8U3A+RlcKI
        RTLn+SsbHqQ3jfl0k+RZuw==
X-Google-Smtp-Source: ABdhPJyR75Ua//1nJMK6e0saEWk+VVaM7OLMsyOyiOR3yKOba13yG2FcdDRgAsTZ+9JDitqNSXacCw==
X-Received: by 2002:a9d:331:: with SMTP id 46mr4271550otv.359.1629235851100;
        Tue, 17 Aug 2021 14:30:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u126sm669782ooa.23.2021.08.17.14.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 14:30:50 -0700 (PDT)
Received: (nullmailer pid 875639 invoked by uid 1000);
        Tue, 17 Aug 2021 21:30:48 -0000
Date:   Tue, 17 Aug 2021 16:30:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 01/29] dt-bindings: arm: renesas: Document more R-Car
 Gen3e Socs and boards
Message-ID: <YRwqiIHa/avcyvQp@robh.at.kernel.org>
References: <cover.1628766192.git.geert+renesas@glider.be>
 <55271d405112f327753945072cde5d158ab815b1.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55271d405112f327753945072cde5d158ab815b1.1628766192.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 12 Aug 2021 13:23:51 +0200, Geert Uytterhoeven wrote:
> Document the compatible values for the remaining R-Car Gen3e SoCs: R-Car
> H3e (R8A779M0), M3e (R8A779M2), M3Ne (R8A779M4), M3Ne-2G (R8A779M5), E3e
> (R8A779M6), D3e (R8A779M7), and H3Ne (R8A779M8).  These are different
> gradings of R-Car Gen3 SoCs.
> 
> All R-Car Gen3e on-SoC devices are identical to the devices on the
> corresponding R-Car Gen3 SoCs, and thus just use the compatible values
> for the latter.  The root compatible properties do gain an additional
> value, to sort out integration issues if they ever arise.
> 
> Document the use of these SoCs on the Salvator-XS, ULCB (with and
> without Kingfisher extension), Ebisu, and Draak development boards.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v2:
>   - Typo s/R8A779M/R8A779M0/,
>   - Add Reviewed-by.
> ---
>  .../devicetree/bindings/arm/renesas.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
