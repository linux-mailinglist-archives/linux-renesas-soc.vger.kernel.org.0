Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D5628CEC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Oct 2020 14:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgJMMxl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Oct 2020 08:53:41 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44002 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgJMMxl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Oct 2020 08:53:41 -0400
Received: by mail-oi1-f194.google.com with SMTP id l85so22318315oih.10;
        Tue, 13 Oct 2020 05:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lLpi5gX2AWf9N5i+PdzNY+1CKnb1B74wtafuKP22jQE=;
        b=EariUWMizAT2XGYRQDa9u0cbIK9PHijqXwho1/ysSrwziVqbKRcR4JHqUkCKPdVOSg
         zxyTnNvLbx4aQQbN9QtzP7hjzcEmbHX5t351Y+UYi6R13hzTLWuiDKauRB6IWvClUjab
         9TYAaFXc1DgFu8/2rUdHPFP6suqhn1v8rUcUt+4mV9yxVNX2f56Gf5CyJbeDckiSJj1r
         OENQDzxPcjo3K+Cy8NwA/7uA6lWPjxVVEbWIotfbEu1qmNgkeFuD8yY71RZmE/XTR+g3
         gL9ceHenfNTwahrsJp/HneK631AH1vT/Xf3A7+1jj6E6H3oM3lvQTNIOymczuIuKmfHF
         JSVg==
X-Gm-Message-State: AOAM530iUHGbiWIZUmfIc3n+EfoMuHWJKSzkrXIdzBA1tjEdSYQMa3Hg
        DGkLpW5uR9bjR4sBMbIixg==
X-Google-Smtp-Source: ABdhPJwgiU9BD4Djl8oWEWKVwO4WDGAK0EcB1hj6qnZZ7P5IlEB84GVLuU+Y9y3R9bDnGZIY/L2uvg==
X-Received: by 2002:aca:d982:: with SMTP id q124mr14261256oig.103.1602593619151;
        Tue, 13 Oct 2020 05:53:39 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t22sm9941841otk.24.2020.10.13.05.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 05:53:38 -0700 (PDT)
Received: (nullmailer pid 3331295 invoked by uid 1000);
        Tue, 13 Oct 2020 12:53:37 -0000
Date:   Tue, 13 Oct 2020 07:53:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Thierry Reding <treding@nvidia.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Prashant Malani <pmalani@chromium.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: update usb-c-connector example
Message-ID: <20201013125337.GA3331203@bogus>
References: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
 <20200920134905.4370-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920134905.4370-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 20 Sep 2020 14:49:00 +0100, Biju Das wrote:
> Some hardware designs have USB typec connector attached to both
> SoC and super speed mux. We need to use separate connector node for
> such design.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  * New patch
> ---
>  .../bindings/connector/usb-connector.yaml     | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 

Applied, thanks!
