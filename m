Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA5D3CA486
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jul 2021 19:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhGORfS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jul 2021 13:35:18 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:34510 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhGORfS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jul 2021 13:35:18 -0400
Received: by mail-il1-f176.google.com with SMTP id e13so5716566ilc.1;
        Thu, 15 Jul 2021 10:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L/JbGcL5UneA3N/Kc5Uozt/sqM+fxDCCN86JX+ouls8=;
        b=rmRquY++yXkmmDvnK1Pnj0Z80PDIHMlBgNEp7w4PVmMf4gQ4JlCplo5yGfvXSfGFo8
         yu84TsC9DYGnVcw7eKcXJOD20hbyibR5qHE38d5YXRgKSVopVu933GDiauVHzhSArvxo
         Fj9UNQCzVq/445vW8UI+OGkeoN3A69nVSzG1vO8H8EQ2UgqnHJSceuKti14inQYoNddO
         JqBMaeNQHfNc+8JqVI8yn2HVAko8n6djiIL3ak/rxR4hjrgAuZP2j6E4sn68eoV+iojS
         r/GCX69QD+KSImyjcDk9SGaEqpulVgzrTxcq8EQOLPb8n71iUYCYCoTiE7BLz0rMxHUa
         FNOw==
X-Gm-Message-State: AOAM533vaNJTCl0TAaCA7Q2EyUS1ZStMOL2IamEe6rooacZMAXUdojAf
        T7ULFpxSaSmbO27oUShs+Q==
X-Google-Smtp-Source: ABdhPJxRce3xk7bLPbUtrq3dhlbc3XHR2GwbzcDzq62pAY3jd5i1HhXD3Gj/7AQzjzrQAKLR+K3S/Q==
X-Received: by 2002:a92:a806:: with SMTP id o6mr3526259ilh.53.1626370344492;
        Thu, 15 Jul 2021 10:32:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r4sm3316508ilb.42.2021.07.15.10.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:32:23 -0700 (PDT)
Received: (nullmailer pid 1292199 invoked by uid 1000);
        Thu, 15 Jul 2021 17:32:21 -0000
Date:   Thu, 15 Jul 2021 11:32:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     michal.simek@xilinx.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be, sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, david.cater.jc@renesas.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: Add binding for Renesas 8T49N241
Message-ID: <20210715173221.GA1292141@robh.at.kernel.org>
References: <20210713214126.2278-1-alexander.helms.jy@renesas.com>
 <20210713214126.2278-2-alexander.helms.jy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713214126.2278-2-alexander.helms.jy@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 13 Jul 2021 14:41:25 -0700, Alex Helms wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
