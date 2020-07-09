Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3E521A945
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2020 22:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgGIUrF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jul 2020 16:47:05 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41277 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgGIUrF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jul 2020 16:47:05 -0400
Received: by mail-io1-f65.google.com with SMTP id o5so3750500iow.8;
        Thu, 09 Jul 2020 13:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wXXetMyLt/JXq+hf7AG79iHe84M94giegFW5eS3ahKs=;
        b=OxLrrmW5tVTj0PNeeMnqvCCciUqpmk3j7n+vHHBWkGN3TECy/tFoUx/et2flAIBSyD
         sqYUx/LC116hlwh2cpdp9Um/qpmsq1jNGtCMoJ0MonyN3PhljappnSrELWkzmrYE9mGk
         pdwBZ6N8R4ZodLVH3MfiM3yBVzP3MSlx+J1cR9LQFnH5XH/RMp/ditdeVa474pHzIpCC
         mbZRNSC6FhnXLLDAex+mT8jxILrv59SFGI+6RLjlDATY65WQP89scUwG57iwD23CobLc
         b3bxtITfIqkKHCTV96dHQP4x3OnH4DjNhzYnX5K9Z+NJBh/VSs2HRXHgZbppH0O1R16u
         PdDA==
X-Gm-Message-State: AOAM532ub/XT5Y4t3zWBnvRyDTihXMco7LTGQJlJN7pO4AWI7qjoMzgS
        JOH4uOQ4TZYHfHlulqiC5g==
X-Google-Smtp-Source: ABdhPJxJwu/bLkwKh1Qj4fGMPW6l0RUYJssfxN/DYQHYqD3aqKgdw2S8XdoTT0TXkLkuh9TaCWkqZw==
X-Received: by 2002:a02:854a:: with SMTP id g68mr17132692jai.24.1594327624709;
        Thu, 09 Jul 2020 13:47:04 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id p22sm2563681ili.88.2020.07.09.13.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:47:04 -0700 (PDT)
Received: (nullmailer pid 859528 invoked by uid 1000);
        Thu, 09 Jul 2020 20:47:03 -0000
Date:   Thu, 9 Jul 2020 14:47:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 1/2] dt-bindings: adv7180: Convert bindings to json-schema
Message-ID: <20200709204703.GA859433@bogus>
References: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
 <20200704160644.3040636-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200704160644.3040636-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 04 Jul 2020 18:06:43 +0200, Niklas Söderlund wrote:
> Convert ADV7180 analog video decoder documentation to json-schema.
> 
> As the examples in the bindings can be tested add another example to
> test the more advance adv7180cp binding description.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../devicetree/bindings/media/i2c/adv7180.txt |  49 -----
>  .../bindings/media/i2c/adv7180.yaml           | 184 ++++++++++++++++++
>  2 files changed, 184 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7180.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> 

Applied, thanks!
