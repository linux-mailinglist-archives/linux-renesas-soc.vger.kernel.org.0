Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C5331E178
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Feb 2021 22:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhBQVfP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Feb 2021 16:35:15 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:42198 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232263AbhBQVe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Feb 2021 16:34:56 -0500
Received: by mail-ot1-f43.google.com with SMTP id q4so7481otm.9;
        Wed, 17 Feb 2021 13:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EQ9v6089nQbqVC+c1rW4xqBLyQdWLUpY3DAJ3Yx81jk=;
        b=ppvijYF1r1Mf63eafp79wd5iS/EiD4zB/Rg8kY/7hY8vLg6JAIVr2WqMv53grPirmw
         E0QHbUOIozvRHQuSevpzy0R2OH3+4Tl1s+c9P1xPX9FeimU3LbSOwFiZ6+Xi2b0Rj5Rv
         RrI/rEnBz8jOIeqi23wutmsQKO7w9JGP2YJ36y5vOmqeQCOZrONVooPETBvZepXdHsCL
         mTBCw7N7m8uD0aKqPCA/R/hrqyX4JzHvvW96C1RXJgz6LhFngbs0eMmj1+fWlITn9myF
         ZIn5hwHW/eRPewaR3/uigYv4JSLo1S2nY1SFkgPlYvxBdOCNimSKP9hoVLqndqsvhEUL
         Ai/Q==
X-Gm-Message-State: AOAM530FjHAsARZIo1+ZJlCVS9pyi4arDfZvio7OdzafkqCIwnYHUy3d
        aPN4rCo0ruLE/zpqpe3Sxv+Zf31bCQ==
X-Google-Smtp-Source: ABdhPJzstcf+d2kGGdu0XTCP6MtQ3zVRGyK82Y9VTu1XAg3lIH8M0sXM4Lm39TdBZ3m97rf1coczew==
X-Received: by 2002:a9d:3ec:: with SMTP id f99mr782221otf.299.1613597654870;
        Wed, 17 Feb 2021 13:34:14 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a28sm632901ook.24.2021.02.17.13.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 13:34:14 -0800 (PST)
Received: (nullmailer pid 2803990 invoked by uid 1000);
        Wed, 17 Feb 2021 21:34:13 -0000
Date:   Wed, 17 Feb 2021 15:34:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH 5/7] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Message-ID: <20210217213412.GA2800178@robh.at.kernel.org>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
 <b7025d14fc8eb0eac95437ac62e74f64a7cf2b4c.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7025d14fc8eb0eac95437ac62e74f64a7cf2b4c.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 11, 2021 at 02:35:41PM +0200, Matti Vaittinen wrote:
> BD9576MUF provides over-current protection and detection. Current is
> measured as voltage loss over external FET. Allow specifying FET's on
> resistance so current monitoring limits can be converted to voltages.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
> index b6515a0cee62..ad3f57e9cd9b 100644
> --- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
> @@ -27,6 +27,11 @@ patternProperties:
>        Properties for single regulator.
>      $ref: "regulator.yaml#"
>  
> +    properties:
> +      rohm,ocw-fet-ron-milliohms:

We have '-ohms' and '-micro-ohms' already. Neither range works for you?

> +      description: External FET's ON-resistance. Required if VoutS1 OCP/OCW is
> +        to be set.
> +
>      required:
>        - regulator-name
>  
> -- 
> 2.25.4
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
