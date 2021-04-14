Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6D235FD4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Apr 2021 23:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbhDNVae (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 17:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbhDNVad (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 17:30:33 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EA2C061756
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Apr 2021 14:30:11 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 12so35478758lfq.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Apr 2021 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+8jDbRYpf2+3MLXejbj9s6bo0ZqIqzLMTExtFok79dQ=;
        b=cq74Xqk56OAReUniCHNV8wmJmylv646o+yGJ0+gk77n0P0HCRECjfEdILzqp4prtd1
         /VAKu0OxFGFP6Ye6tsLBt7pX4wu+Pcoq1cv856IFgZrGL/AaiBvommp1+L1+osOkVNQv
         PIZwjvwzu7wvKkSTocwMiOdWG3IUwUQ3bq6MQcL4cR4A1dDxmUNAYOYJKyaLhpLHvKR7
         5KgI6Lro0ctEBkKZKHJMA7Q7kVFGyt4sS/mR14JlfLrKlzC54nFzvXFosWb7q7Sx5xxz
         RtPjuOkiVpTKvrC1S1/Hrl7OQYhAXR7FbiNPiz4jNPfvTHuSCgYzes6XXqf7ARKORpU4
         2JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+8jDbRYpf2+3MLXejbj9s6bo0ZqIqzLMTExtFok79dQ=;
        b=SSFDzSoDdFWcjkqTbnjOD6/MxquMKIZ3fyiJjg33H+ofoFHsnap3bjtUMNaLCkEFob
         GfeGh0KBylJdD3Tp3r+ZK0ZF5JJ7TjfAe/vnXInERT2LXAYQOZcvsPGJLohMjN0iSZmt
         /cwsxd0aGbIfpAz7EOqe2pbCHVXJ+zKOId5SqPZ1NaE8zrBjw681BdLcfJHEw3c+o+hX
         TxgbUHTyJj3OHEIfSOmJPlw0pWxNFonhkDyLSBwkR4v0VQoeXeFovgTUavLrullLmsPt
         xr4hJmOstl283WvaSLWcEMUMc1OFRNCQgV7GTdKNLnvFYcopiidWgxYRPc6SZCdYw39M
         RmAg==
X-Gm-Message-State: AOAM530ct3D7rNp3n3KLb9Papi5Jmb5g41ak6/qo5b2Es0TlTP9/I85q
        4GYygRF0/zmU4Rw3wKofMlvq8FCBh/yCfg==
X-Google-Smtp-Source: ABdhPJxjyRxlRHCJ8qVJ91kQLkVBuV/dPICrhilRx8DFulPWCL5/JldLLYGO1kcDk0xJDi+6hKimvg==
X-Received: by 2002:a19:c70e:: with SMTP id x14mr149720lff.52.1618435809824;
        Wed, 14 Apr 2021 14:30:09 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id r11sm253795lfp.10.2021.04.14.14.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 14:30:09 -0700 (PDT)
Date:   Wed, 14 Apr 2021 23:30:08 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-isp: Add Renesas R-Car Image Signal
 Processor driver
Message-ID: <YHde4J3daEc1VRJq@oden.dyn.berto.se>
References: <20210413173552.2560222-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413173552.2560222-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

I managed to screw up the order of the compatibility string in this 
patch, it should be 'renesas,r8a779a0-isp' and noting else.

On 2021-04-13 19:35:52 +0200, Niklas Söderlund wrote:
> Add a V4L2 driver for Renesas R-Car Image Signal Processor. The driver
> supports the R-Car V3U SoC where the ISP IP sits between the R-Car CSI-2
> receiver and VIN and filters the CSI-2 data based on VC/DT and directs
> the video stream to different VIN IPs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  MAINTAINERS                       |   1 +
>  drivers/media/platform/Kconfig    |  16 +
>  drivers/media/platform/Makefile   |   1 +
>  drivers/media/platform/rcar-isp.c | 500 ++++++++++++++++++++++++++++++
>  4 files changed, 518 insertions(+)
>  create mode 100644 drivers/media/platform/rcar-isp.c

<snip>

-- 
Regards,
Niklas Söderlund
