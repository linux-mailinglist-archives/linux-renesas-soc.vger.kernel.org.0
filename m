Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE113BA137
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 15:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhGBNbL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 09:31:11 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:45640 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbhGBNbL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 09:31:11 -0400
Received: by mail-io1-f45.google.com with SMTP id g3so9671982iok.12;
        Fri, 02 Jul 2021 06:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=6VAjp+1g1/6JxjvtnTpo35j86mJBNoZO/+9hIOMNiL8=;
        b=Ovf2Murioq8ywPycdwkNGzkOETxRepQk2GGoOIQZNS7lXhuMKYUUvzkI/M/Awoy0Ws
         rYlEFnste69TmDcEpazJAGxyvRiHhSTaObimML4S+Fa7WxwN94YkPGD8c8MTRWmSs4O/
         /1z02XhZfANMS8B3EfUgVy84Wn3/GV6YUYpZLQVP0StHbmZWJzdcQRhfRhHvpUpcFlZ9
         ouYCHofP3Y3pj+Y8HMuR8N4ZaGJldK0dezijyaI97YuPcsQCQ9ri97GbAh1X/86O11by
         IszN17j4tAX2z3KTg2sEyftNqZuxo3yZw/5SxgAl2TtQhxZejRY8cVDh9RXtY6TEYan5
         IC+A==
X-Gm-Message-State: AOAM533WYCM1/cxj9FWCjLCsgKIOt0TfmOGDgLOstkJXu8hnC7pFqI0l
        keBW+Xpt90WTCCQ5PWMnfQ==
X-Google-Smtp-Source: ABdhPJzT6n33b3xKbEvJpC4uROSwAAAPdrO/QZIfQETl3OkC0z4NKXvm3j5l1qv2BaaKbjvD4xtxgA==
X-Received: by 2002:a05:6638:4199:: with SMTP id az25mr4238547jab.45.1625232518931;
        Fri, 02 Jul 2021 06:28:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a12sm1820482ilt.3.2021.07.02.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 06:28:38 -0700 (PDT)
Received: (nullmailer pid 274908 invoked by uid 1000);
        Fri, 02 Jul 2021 13:28:35 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        david.cater.jc@renesas.com, geert+renesas@glider.be,
        devicetree@vger.kernel.org, michal.simek@xilinx.com
In-Reply-To: <20210701232258.19146-2-alexander.helms.jy@renesas.com>
References: <202107020640.YyVoU69S-lkp@intel.com> <20210701232258.19146-1-alexander.helms.jy@renesas.com> <20210701232258.19146-2-alexander.helms.jy@renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date:   Fri, 02 Jul 2021 07:28:35 -0600
Message-Id: <1625232515.402706.274905.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 01 Jul 2021 16:22:57 -0700, Alex Helms wrote:
> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> The 8T49N241 accepts up to two differential or single-ended input clocks
> and a fundamental-mode crystal input. The internal PLL can lock to either
> of the input reference clocks or to the crystal to behave as a frequency
> synthesizer.
> 
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> ---
>  .../bindings/clock/renesas,8t49n241.yaml      | 183 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 189 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/clock/renesas,8t49n241.yaml#
Documentation/devicetree/bindings/clock/renesas,8t49n241.example.dt.yaml:0:0: /example-0/i2c@0/clock-generator@6c: failed to match any schema with compatible: ['renesas,8t49n241']
Documentation/devicetree/bindings/clock/renesas,8t49n241.example.dt.yaml:0:0: /example-1/i2c@0/clock-generator@6c: failed to match any schema with compatible: ['renesas,8t49n241']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1499761

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

