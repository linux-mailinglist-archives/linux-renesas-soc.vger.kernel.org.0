Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B12D358828
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Apr 2021 17:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhDHPXL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 11:23:11 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:39819 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbhDHPXJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 11:23:09 -0400
Received: by mail-oi1-f177.google.com with SMTP id i81so2536320oif.6;
        Thu, 08 Apr 2021 08:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4llz4XYWXMndwJpppIiyVFWKBOdhjg6iCs+2LYmaVNo=;
        b=gs/UJZyx1oN5qFfbRYkUTdhS7B2+BqA+qGRrOpCGZRETIoMKxgOy10naE0E3tplJaC
         0KGNOQvveuuOK/BpcTWWWxeDrbYBLgTHooQhxsfbkbNeFlRTE4wHebJ6E8WKeZjQWgIU
         igOeQRYbI+z09EzLMBHPMAdWiexlVfPFG+j8bCQHDnUHb4BzAWSnqxXbfg+1VWKHByah
         g/MeqJxyq3Rx6+O65PY/JpFoU/NRGQXg/VPRKyP5a10pEq3Yh7nWIONyH4nFx4ypFAB/
         k2aea6y3M0xBDbsWcfYM6wbh7sBaZ7r/UCvb+fX2/+dWUYHQuGUbZozFbNsw9kMzNfsy
         qo+A==
X-Gm-Message-State: AOAM532JTDMV6lNVh+47hOFJfB3o/wXNKbDx/QzlhNGf/P892i9kbhja
        Ab4/ViN6r8HdW8jjlW+h5A==
X-Google-Smtp-Source: ABdhPJwxaquNxoAO7pXm6YYqah5vdkdygqpIVC3ka0QaM39f/fvv3hOXRNMbbkvHYC8/TTOni4oBBw==
X-Received: by 2002:aca:fc11:: with SMTP id a17mr6473252oii.68.1617895377368;
        Thu, 08 Apr 2021 08:22:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v23sm6287262ots.63.2021.04.08.08.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 08:22:56 -0700 (PDT)
Received: (nullmailer pid 1509329 invoked by uid 1000);
        Thu, 08 Apr 2021 15:22:55 -0000
Date:   Thu, 8 Apr 2021 10:22:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        linux-power@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andy Gross <agross@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 5/8] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Message-ID: <20210408152255.GA1509290@robh.at.kernel.org>
References: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
 <78743b448814a85280c484c0b2d4f4207008fd6e.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78743b448814a85280c484c0b2d4f4207008fd6e.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 07 Apr 2021 13:04:51 +0300, Matti Vaittinen wrote:
> BD9576MUF provides over-current protection and detection. Current is
> measured as voltage loss over external FET. Allow specifying FET's on
> resistance so current monitoring limits can be converted to voltages.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> v5 onwards:
>   - No changes
> v4:
>   - Fixed the description indentiation
> ---
>  .../bindings/regulator/rohm,bd9576-regulator.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
