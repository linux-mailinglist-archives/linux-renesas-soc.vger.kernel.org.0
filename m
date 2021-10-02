Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA52C41F8D1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Oct 2021 02:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhJBAzX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 20:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbhJBAzX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 20:55:23 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1345DC061775
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Oct 2021 17:53:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m3so44529399lfu.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Oct 2021 17:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WcEn+xDwdE6ANwPheEYJ3oKi+dkCUQOxoB+aEfMXDQU=;
        b=UKNNFxLkOmXxEm8PTFodJLrnzuOX+eFVXK0edxl3dV9nbczyMakfr78HdxNzh+O8RL
         fBdNDqOUPR5wSsgUcthGQWYNF5R9JerTXPAW5eUn1gxXzdioqsHzdTPfeSAxDJwUcD04
         NrtjxyT0p0u5jXOW80e7pBw4BUIgfB+smAtL0pliuSNZN+8V7jzXMFLN6zHm7DZlBlEc
         m0rm3ZVk44rPuHUjG1SGUpGrX6fFSM0eUATpkySn+VfvWYz9A+RnLILipUZM6/luanDo
         1SzsbAhEmcVfyLL2uhK+ZNJ6mwfOZN0JgIBP5C1IizNk/yxnpUyfNoVD1btWDG8iecm8
         ZH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WcEn+xDwdE6ANwPheEYJ3oKi+dkCUQOxoB+aEfMXDQU=;
        b=xevdHOln6rt1Ty56BCNhfYxxFVQ7gWAjbAD/bt5E1FuC4c69/kcoiI9ZlEx9N+qqzV
         yuf3dP7TGIdmsOTVgvaLcNqL2LFo5actzc2KOfjwRmj011ZNSn2hXqz+SedkxycYQC1d
         uI4k49mNL6h2qtbjfvOLghPop0OrUxmWS8QDaS6ogQTd2tdOsIgmV6ulywyegs6M6HLZ
         lJrTXEeAuPCTUM9p7ry8s7JsVfLqi+1op6w7FYnABnwM1fntKJtCQhysUqqvk+pIKZZF
         IYxR+wU6dD3VdVKSCxxaUMj7gpnUImPKTsq4hETunXB4IgH/Wj2J3KDf1ntpMsxRC2mH
         shTA==
X-Gm-Message-State: AOAM533UnpDd/WncOGmPdgKcxUdxZVSlAh/X2QqkxZefLoTYQLcl25wG
        pL0JginN1o6zwi+nIr3lLPgGuDqePDYttb2s
X-Google-Smtp-Source: ABdhPJyU2hgzqqtbWAN8CVVV8cWykNdLr8xwwLnsgGOXHHoAdg8EPMNwGiTmPmrsU++Qnr8ibfpurg==
X-Received: by 2002:a2e:a596:: with SMTP id m22mr1118720ljp.262.1633136016474;
        Fri, 01 Oct 2021 17:53:36 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id j16sm564960lfh.119.2021.10.01.17.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 17:53:35 -0700 (PDT)
Date:   Sat, 2 Oct 2021 02:53:34 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar: pcie-rcar-ep: Remove unneeded includes
Message-ID: <YVetjjnDTuMrEVrB@oden.dyn.berto.se>
References: <7c708841a2bf84f85b14a963271c3e99c8ba38a5.1633090444.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c708841a2bf84f85b14a963271c3e99c8ba38a5.1633090444.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Geert,

Thanks for your work.

On 2021-10-01 14:16:09 +0200, Geert Uytterhoeven wrote:
> Remove includes that are not needed, to speed up (re)compilation.
> Include <linux/pm_runtime.h>, which is needed, and was included
> implicitly through <linux/phy/phy.h> before.
> 
> Most of these are relics from splitting the driver in a host and a
> common part, and adding endpoint support.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pci/controller/pcie-rcar-ep.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
> index aa1cf24a5a723d5f..f9682df1da61929b 100644
> --- a/drivers/pci/controller/pcie-rcar-ep.c
> +++ b/drivers/pci/controller/pcie-rcar-ep.c
> @@ -6,16 +6,13 @@
>   * Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>   */
>  
> -#include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/of_address.h>
> -#include <linux/of_irq.h>
> -#include <linux/of_pci.h>
>  #include <linux/of_platform.h>
>  #include <linux/pci.h>
>  #include <linux/pci-epc.h>
> -#include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "pcie-rcar.h"
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
