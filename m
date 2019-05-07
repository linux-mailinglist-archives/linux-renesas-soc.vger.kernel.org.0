Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 849E21641B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 14:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbfEGM5f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 08:57:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39548 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfEGM5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 08:57:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id n25so19867627wmk.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 May 2019 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/RaXXBk8jojDKv8ZmQ0ryO/koLyatTNCLWmxjtwxqGc=;
        b=iopnbCEUtg1eAxFuU08UrnyeGqTI+HGYI7hLhiCz6a8D7KehZIhwl7APdw7pnq8V8f
         5v6f2Lclyksgs1+8aRGEqs2y8Zcs9PwH2fjM5t6NYDSozt7EBXN3QoQlitjVL5zfa3t0
         40LZTE68pOiz37WL82Gm43xJG5y8cv4aUlMgGThFR6BR89N3BHdZos+aARYT6ewxG/iZ
         t/yya9uEPJyp8q+5aBvbopkeAgmiUsC/7kRRvdooul36Sc5Sd2XDkc5IkQfNe9g0V4EF
         THePO2G+D4ADC2I6Gl9r3RM1wUB+N3En8hGtRpx3W1tMLZyVzmzqhKm6QK0Dcxj0PtAi
         3BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/RaXXBk8jojDKv8ZmQ0ryO/koLyatTNCLWmxjtwxqGc=;
        b=NmCWYR8u19h3wFHgH4vWKJ7cyLz5o0FAdiDgdGL/4Jl6i+BXiwlJnwqgLkXqvEfKqE
         sHrhsb23o3+SBtada5nsKEdkGpsBxB0CKZXryxfr95JehMDhVvaEngzuSQ2HJUTGfSlY
         YiSIi1K52n1l5v0XUEYECx+5ni0esnSGVpym67wRaPGgFJIKIn94dYWFroxFYMNL1lnN
         yVewS48NenirpG84D/aY4lAqplZ68f0stayZe6jr00RG2dPvZd6qyB4LZPNG+4d7LaO+
         BryU93nZmhwjRnL765bhKGTA4zfaBrUnEbKgi3HYW30pMZCSeOtR8ZTHSEfCDWKVWNjF
         luAw==
X-Gm-Message-State: APjAAAWN0dRWdfJYG1gf0qYb2PmJfL9UYCYlTjZBbuI6byx/oVZ0D8Vc
        fPNtEq6zQl0f0TyS7YRvxt5sv9YjcSE=
X-Google-Smtp-Source: APXvYqxfXo1lWPeAKtlRyEL3cx6RJOPy4WmqDUMfvFj0NINxzhHchVHKD/CQSUXUaH2ov9alSw3E/Q==
X-Received: by 2002:a1c:2c89:: with SMTP id s131mr9244361wms.142.1557233852944;
        Tue, 07 May 2019 05:57:32 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id o130sm13593961wmo.43.2019.05.07.05.57.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2019 05:57:32 -0700 (PDT)
Date:   Tue, 7 May 2019 13:57:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        bbrezillon@kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        sergei.shtylyov@cogentembedded.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, juliensu@mxic.com.tw,
        Simon Horman <horms@verge.net.au>, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v12 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3
 RPC-IF MFD bindings
Message-ID: <20190507125730.GD29524@dell>
References: <1556092536-17095-1-git-send-email-masonccyang@mxic.com.tw>
 <1556092536-17095-4-git-send-email-masonccyang@mxic.com.tw>
 <20190424212356.GA27103@bogus>
 <65853dc2-6f3c-1494-7e72-54877797cdd2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65853dc2-6f3c-1494-7e72-54877797cdd2@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 24 Apr 2019, Marek Vasut wrote:

> On 4/24/19 11:23 PM, Rob Herring wrote:
> > On Wed, Apr 24, 2019 at 03:55:36PM +0800, Mason Yang wrote:
> >> Document the bindings used by the Renesas R-Car Gen3 RPC-IF MFD.
> >>
> >> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> >> ---
> >>  .../devicetree/bindings/mfd/mfd-renesas-rpc.txt    | 40 ++++++++++++++++++++++
> >>  1 file changed, 40 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt
> >> new file mode 100644
> >> index 0000000..668b822
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt
> >> @@ -0,0 +1,40 @@
> >> +Renesas R-Car Gen3 RPC-IF MFD Device Tree Bindings
> >> +--------------------------------------------------
> > 
> > Looks like a SPI flash controller from the example. What makes it an 
> > MFD?
> 
> It supports both SPI NOR and HyperFlash (CFI-compliant flash with
> different bus interface).

Looks like you're registering one OR the other.

Why don't you just do this from DT?

No reason for this to be an MFD IMHO.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
