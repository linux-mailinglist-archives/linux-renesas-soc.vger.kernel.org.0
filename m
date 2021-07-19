Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726003CF08B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 02:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234943AbhGSX2A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 19:28:00 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:40710 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349383AbhGSWH4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 18:07:56 -0400
Received: by mail-io1-f54.google.com with SMTP id l5so21935879iok.7;
        Mon, 19 Jul 2021 15:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H+s1FDJ9EwBpkzI+GJ2O2JpJDnxLYii183SrSuO+Z9Q=;
        b=dtEoXoCtREb3czbexVOw1AGQx6cB/jsFV2I81fAJiuHV+jYo6djKR3IPau5a7vVh4x
         KdFrGd6nnZNQCSjuvFmrLwb1EXVP09w7zo+b+g4aTwlyDuJ38r+qZZozsL9ms93zRx/G
         DEABxchHBkR7YE+aaCCEVpR5xmn7m8GWvELlKQD8eZw/yXF7iRYiwS0V3ZEdeNCcIw6o
         Tc0wdbX+4QSWRPqn7Mf62QJdoRCcj1xansSWRTDZnINums5vl4xvEFvpZWtTbSJjkxPx
         588OviQkJ6KrIAWjG2vcE7whbRS+HR6LeApZb/9ZWX1ZHgrrkC7faTGehU0den+9B1OM
         OY+A==
X-Gm-Message-State: AOAM532EFVKhKcBaOTZkccjsmfRNYKqGakayMBoMXrSt5qQYgGTViNy/
        3wzu+opOw4Nj3MN30sf8vg==
X-Google-Smtp-Source: ABdhPJyyAAbHjlBKXIRhGHRG8Vcao9f7aE9QjW/W+gSmpqk3LF8NcoieqQS9WPRPZeZvmJfv8Uqycw==
X-Received: by 2002:a05:6602:198:: with SMTP id m24mr7802813ioo.144.1626734886835;
        Mon, 19 Jul 2021 15:48:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v11sm10296671ilh.52.2021.07.19.15.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 15:48:06 -0700 (PDT)
Received: (nullmailer pid 2769072 invoked by uid 1000);
        Mon, 19 Jul 2021 22:48:04 -0000
Date:   Mon, 19 Jul 2021 16:48:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     robh+dt@kernel.org, geert+renesas@glider.be,
        mturquette@baylibre.com, linux-renesas-soc@vger.kernel.org,
        david.cater.jc@renesas.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        michal.simek@xilinx.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: Add binding for Renesas 8T49N241
Message-ID: <20210719224804.GA2768983@robh.at.kernel.org>
References: <20210719182001.1573-1-alexander.helms.jy@renesas.com>
 <20210719182001.1573-2-alexander.helms.jy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719182001.1573-2-alexander.helms.jy@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 19 Jul 2021 11:20:00 -0700, Alex Helms wrote:
> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> The 8T49N241 accepts up to two differential or single-ended input clocks
> and a fundamental-mode crystal input. The internal PLL can lock to either
> of the input reference clocks or to the crystal to behave as a frequency
> synthesizer.
> 
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> ---
>  .../bindings/clock/renesas,8t49n241.yaml      | 190 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 196 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

