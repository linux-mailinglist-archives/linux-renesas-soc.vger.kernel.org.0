Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C955C54E44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 14:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfFYME5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 08:04:57 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42138 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfFYME5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 08:04:57 -0400
Received: by mail-lf1-f68.google.com with SMTP id x144so4989953lfa.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2019 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UhScOA90VXtVJS4x9i4Gk2pOhonw2Z/B22mNRgYqq3o=;
        b=sbBiDFY4OODmp04zHw61iFgtLLHubW6+XpFG/uGwOwv9jwrSWxb4cWCmCeD/dCrEFH
         +j+ebwJqV/qDZxEu18Xfd8h43pVwPLlfb2Z7NeJp46HzIb91v9AARAN9TL4yjbc7SChO
         0FkWn2RrMnhcoMZzmnG/cpewJV1MY0CMNzU3YKvMvOyQ++r0y0T8vI5JXCDW51l3Jtyy
         bZmQBlkWKjkb7JNgglna9GTa1ZeO1NIf7psEN2f+F4fK63cU408LtcTRtN6Nh7QAJ3Qv
         Teg9SA43cs4wq0pAmJ02VH5SHbgi73dwzZ/Atd9sI9O5N4XN2fGr+eiwGc8iiP7g7Img
         009w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UhScOA90VXtVJS4x9i4Gk2pOhonw2Z/B22mNRgYqq3o=;
        b=rz6yrFmUHenyymaieg+RqohcOvc0GQdOoR9e3/t4FmcJj483anwUVpLrdG0gO2SSGZ
         1TzBhVtaKXNixM2a6NawerC5qP8c9ZJN1Q8B9TuLgpB/brCK8MM4Tq9n1x0GKDLAWKZJ
         ILgN63C08Jm3dwp+7qQOkXpFU/zRe/uZ4NilG0dW//izpaJ6n7FlS/olWtoPREuPnOZj
         I6PBoaooOQWVuGGKfE3l2xflA5GbSMDUl5A9WM6z4hyctML+vZotlDGnDmQq6VnTRjXC
         YQZDBasXxCJVMeBB6cY7ZwsfBF2MMXn5728NGVx16kNYttCD83BDYFNv9Dr3+ul21R25
         ZMzw==
X-Gm-Message-State: APjAAAXcUIWREshgjT4ovn70e/kOHtAU6f6BvMLi5VA/ri8LVngrOG2L
        XxOm8+0s9auw0G46gHcd6HGypg==
X-Google-Smtp-Source: APXvYqxV2l6C/DQls4VaBZ2SkmM271ZlflX8ZCJnccbJ8E+x6RBifPuueO672MLbMq3sKgZp6z+k7w==
X-Received: by 2002:a19:710b:: with SMTP id m11mr73758759lfc.135.1561464295322;
        Tue, 25 Jun 2019 05:04:55 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id z85sm2221991ljb.101.2019.06.25.05.04.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:04:54 -0700 (PDT)
Date:   Tue, 25 Jun 2019 04:45:22 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Updates for v5.3
Message-ID: <20190625114522.42wgthk5cbdzmssm@localhost>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 11:13:44AM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC DT updates for v5.3.
> 
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt-for-v5.3
> 
> for you to fetch changes up to 9dd6f7c484fd2aaa468dfdf5087425ea9e4c7bf8:
> 
>   ARM: dts: r8a7792: Add CMT0 and CMT1 to r8a7792 (2019-06-21 09:45:37 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Updates for v5.3
> 
> * Renesas SoC based boards
>   - Use ip=on for bootargs
> 
> * Renesas R-Car Gen 2 SOC based boards
>   - Configure PMIC IRQ pinmux
> 
> * R-Car V2H (r8a7792) SoC
>   - Describe CMT devices in DT
> 
> * RZ/G1C (r8a77470) based iWave SBC (iwg23s-sbc) and
>   RZ/G1N (r8a7744) based boards:
>   - Correct SDHI2 VccQ regulator to fix SDR50 mode
> 
> * RZ/A2M (r7s9210) based rza2mevb EVB
>   RZ/A1H (r7s72100) based rskrza1 board
>   - Describe input switch in DT
> 
> * RZ/A2M (r7s9210) based rza2mevb EVB
>   - Sort nodes to ease future maintenance
>   - Add USB host, Ethernet and SDHI support
> 
> * RZ/A2M (r7s9210) and RZ/A1H (r7s72100) SoCs
>   - Describe IRQC device in DT

Merged, thanks!


-Olof
