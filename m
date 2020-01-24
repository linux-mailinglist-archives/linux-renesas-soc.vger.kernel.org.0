Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B847148BF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2020 17:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388134AbgAXQY4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jan 2020 11:24:56 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39612 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388002AbgAXQY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jan 2020 11:24:56 -0500
Received: by mail-lj1-f194.google.com with SMTP id o11so3145257ljc.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jan 2020 08:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2ZKQV9EUYn6O4Dwbxq9ZK3GxrnLNGiu/KoVo8Ur0eNc=;
        b=1mGfJTx6KGaWGxumVkRlwu8JFX/T7ZxAi/ZPOibqWqzJC0d3Q6qE/tOOl1kSg0+arG
         D+PfJu2DBY2lwp7fRrB9iFZ8Kr5f8m1MnAXwgNUfBLiHhOplxnUQLiRv/XHQI6S+EYuH
         rpbt9IJH9DSh8+FVausrel1GvuhSQ6rZXs5HYp/wKDRdwASexD4MFTHeJ/MlErj+G0Dl
         KFa4TU/4uMQL8oFQEGVlSczqhIBQiIhhNyMfoLHbPL6rVEBHh/jdu4mapAPNAS/p5I6M
         VQgNDC1USFdKJQfbBnSsLWvtMEcip/ygylNCs8Vloj9hboY9ZfPNvoEYtqHp2P4ZcRCK
         D51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2ZKQV9EUYn6O4Dwbxq9ZK3GxrnLNGiu/KoVo8Ur0eNc=;
        b=r+fxqvhgDkOH5iTr0YbHregXUVejNmCnG0Ge/wKVBgGMPFN0eIK/R5r1Tx1bJHFj9r
         +9DK7qlGKGaJw2uWl66R0CrecAaZgkXxMUqtxLQyGgA3DvJOk4+Ldyn/NBha8CWZMS8M
         8chNT6bsfudqgUzTaZ99no75r2A82B7XJZeTkl3rW2GlktHQAqPC0RI2AQnK7NFJdZIa
         3CNim9veoLR8I2J1S6uaDoOaY12U0cRLMhSKi4JRHgKhal6D2UcCF9ZKSaLRHRMDVFFr
         t4GbyWfBejD+M/Kdi74DnUYceN/I/cecFBF8s8O7c/X4xB/HJn+XAe8mHOnJeUFhFggU
         dtkQ==
X-Gm-Message-State: APjAAAUMC1cDCrPxf8K6Fltktc1Au9B5T5dyfSttPTN1JafCR1C8QfGr
        05OPAutnMSw6dYQkhajl3Csxlg==
X-Google-Smtp-Source: APXvYqwD3R6qmy6UAfp7uxu+afZInN2SHuLh7/0SKxfwyTm+CAMduCTdKlx73HrpU5r6GS5WWyvYzQ==
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr2778997lja.16.1579883094015;
        Fri, 24 Jan 2020 08:24:54 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id q14sm2974605lfc.60.2020.01.24.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 08:24:53 -0800 (PST)
Date:   Fri, 24 Jan 2020 17:24:52 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Bin Liu <b-liu@ti.com>, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix debugfs register access while suspended
Message-ID: <20200124162452.GC286344@oden.dyn.berto.se>
References: <20200124132957.15769-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200124132957.15769-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your series.

On 2020-01-24 14:29:55 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> While comparing register values read from debugfs files under
> /sys/kernel/debug/ccree/, I noticed some oddities.
> Apparently there is no guarantee these registers are read from the
> device while it is resumed.  This may lead to bogus values, or crashes
> and lock-ups.
> 
> This patch series:
>   1. Allows debugfs_create_regset32() to be used for devices whose
>      registers must be accessed when resumed,
>   2. Fixes the CCREE driver to make use of this.
> 
> I have identified several other drivers that may be affected (i.e.
> using debugfs_create_regset32() and pm_runtime_*()):
>   - drivers/gpu/drm/msm/disp/dpu1
>   - drivers/usb/dwc3
>   - drivers/usb/host/ehci-omap.c
>   - drivers/usb/host/ehci-tegra.c
>   - drivers/usb/host/ohci-platform.c
>   - drivers/usb/host/xhci.c
>   - drivers/usb/host/xhci-dbgcap.c
>   - drivers/usb/host/xhci-histb.c
>   - drivers/usb/host/xhci-hub.c
>   - drivers/usb/host/xhci-mtk.c
>   - drivers/usb/host/xhci-pci.c
>   - drivers/usb/host/xhci-plat.c
>   - drivers/usb/host/xhci-tegra.c
>   - drivers/usb/mtu3
>   - drivers/usb/musb
> 
> Some of these call pm_runtime_forbid(), but given the comment "users
> should enable runtime pm using power/control in sysfs", this can be
> overridden from userspace, so these are unsafe, too?
> 
> Thanks for your comments!

Looks good to me,

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

> 
> Geert Uytterhoeven (2):
>   debugfs: regset32: Add Runtime PM support
>   crypto: ccree - fix debugfs register access while suspended
> 
>  drivers/crypto/ccree/cc_debugfs.c | 2 ++
>  fs/debugfs/file.c                 | 8 ++++++++
>  include/linux/debugfs.h           | 1 +
>  3 files changed, 11 insertions(+)
> 
> -- 
> 2.17.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
