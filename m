Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CADDCADD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 20:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfJCSHR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 14:07:17 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38759 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729906AbfJCSHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 14:07:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id b20so3802161ljj.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2019 11:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=N/mJZilBLcuyYM21YbNAp5LlHGZH661dkE0xtMw8GgE=;
        b=zOVdgR+6aWNDAYNeMAWmZZglhNE05fn/+3B0fpFslTKOWQs0mjRrYeIAd6gu2n1XlA
         XfKgAa62ANbv1iMZUTqkxPOaP1cCyimedPb7KfuNBzXqo3jdcxSPivEHk9yEvV0NXkh+
         L6YAWfaj7I0FZkZKL7uHZTm+KKTMd4De1pm17WK3H+MK9GirzBFpVYI7BmqML+OMwoFd
         uPJ684vzULADPUfbI94ZE0Loycq6YBvpUw63BYSRk7Pj3e5PpghaLcQyhhrz4AhZUbYg
         dEk0pSH9xrsoikjYQ3dPHZS+OLhn+1+H65l4roHSME9bd8nrdmFOl+mBHkCXiajJkHkp
         U4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=N/mJZilBLcuyYM21YbNAp5LlHGZH661dkE0xtMw8GgE=;
        b=fpsSSV9RH8DhImDNfYLhwhS4GJQT+PaBZZRgcZq/Ftm1naUmkj3nYOW9/dANDPS8Q8
         lTGmWK02rX5+3P7cwjEExZGbc/QQervggq89lmE/lEyuMOvNrZdynF/sJo1yrUVxHCEZ
         ITkzzbrKnLMmITfgnPxVXQTouFHDWSNtR97ISCXNuZxAJKnQxxBSOBeD+uBpIbcvQg3J
         lamxOuZBOQGu54yPjJa0iaRmBUVAXqDydB753Wk/urY2DXcsMJYSSIGjl7sBGwR5Vs+T
         SL+vdx59gwstUPJQrEyJt1out0BTAu5uy2BE4Ccchg10eIcJ9b+Exy6jQrlTEK2sRmgl
         1KYQ==
X-Gm-Message-State: APjAAAX5Ri7NG7w55AtSyo4Jl/F3TKv+qR7ijJ6CHUuvo22Ex6sTSc4h
        udqgthNoeoanNRln0YVrYLbrJw==
X-Google-Smtp-Source: APXvYqzKBmnwIKBmOuM0I58PqfGQ/NH8z7FmbhjT+RXBO05d/o3L92o+oJeZ8UmZuOicpYiDlpJGQQ==
X-Received: by 2002:a2e:b0f4:: with SMTP id h20mr6933923ljl.10.1570126035055;
        Thu, 03 Oct 2019 11:07:15 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id i6sm581210lfc.37.2019.10.03.11.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 11:07:14 -0700 (PDT)
Date:   Thu, 3 Oct 2019 20:07:13 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     vkoul@kernel.org, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/3] dmaengine: rcar-dmac: use of_data and add
 dma-channel-mask support
Message-ID: <20191003180713.GC1322@bigcity.dyn.berto.se>
References: <1570075086-25126-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1570075086-25126-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimodo-san,

Thanks for your work.

On 2019-10-03 12:58:03 +0900, Yoshihiro Shimoda wrote:
> This patch series is based on the linux-next.git / next-20191001 tag.

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Changes from v3:
>  - Rebase the latest linux-next.git.
>  - Add Simon-san's Reviewed-by inio patch 1/3 and 2/3.
> 
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=171621
> 
> Changes from v2:
>  - Rebase the latest slave-dma.git / next branch (In other words,
>    this patch series doesn't depend any other branches.
>  - Cherry-picked a patch which is contained in v5.3-rc8 to solve any
>    dependency. (I'm not sure whether this is a right way or not...)
>   https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=169317
> 
> Changes from v1:
>  - Combine two patch series into this patch series.
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=166457&state=*
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=166457&state=*
>  - Remove a patch because updated patch is already merged into
>    the latest slave-dma.git / fixes branch as described above.
>  - Add Reviewed-by tags into all patches.
>  - Rename a member of rcar_dmac_of_data.
>  - Just ignore the return value of of_property_read_u32() for dma-channel-mask.
> 
> Yoshihiro Shimoda (3):
>   dmaengine: rcar-dmac: Use of_data values instead of a macro
>   dmaengine: rcar-dmac: Use devm_platform_ioremap_resource()
>   dmaengine: rcar-dmac: Add dma-channel-mask property support
> 
>  drivers/dma/sh/rcar-dmac.c | 47 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 9 deletions(-)
> 
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
