Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1039DC55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 08:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfD2G4R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 02:56:17 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40901 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:17 -0400
Received: by mail-lf1-f66.google.com with SMTP id o16so7077792lfl.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Apr 2019 23:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=soVm4aaVWtNv0/v2MssMy1Ehr4h+hozIKfy3y9hTvhs=;
        b=zmMr/isEbf0K7llNokiW88YF2PQ5F5y+WqRAqd5gy847/eFZHQX6fUs8B1RMyjyg9Z
         fNIFweXYJr8xSp5z7XW1BYPY3LB/Xw2wXLNFHousvexHX7e8tJ5+8U+SMq13jxGpdKLt
         SyNm1+MfOxQDEhAYVJz5i7PVNE6QMgda2Wek3fdhT9ocAc7FilFPEDrJhrDOFg5Yh4OT
         EFP84cy4MN+uqo2qIzihpvuPIKOIkQ/iWef1Q93b0GapbULPxZBPPr/MbDOzRHtAbWMV
         wwYAgO7G8vhDLfwCUG1VUem+HYMeUM9BTujMYupvpp2EBkMGmxGmxQNcIoIYppfl4MgK
         YVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=soVm4aaVWtNv0/v2MssMy1Ehr4h+hozIKfy3y9hTvhs=;
        b=JT+IDohFxoJykv15Jw1gbbJiHNGN4w7WuHZrviZaDs2ekQ3uvtxgEjVKnlOG2Wt4J0
         Im6u8TPH8LIBb0uIksxR0z25MBVDom8eT0SE/QgMOi14qQgGYTqJksrMX7FTIVZWBybH
         KtmbSXvuLawECdOUxO9YjYDTZYz3YjBa95QnjScfWt0eKYKIVcTheHsuXJWtIZHDVqCA
         hKwnwdLoE9UrslTfl5mXyqQCMsSKn770jxn99GFZoA/lyyJrkGzee8ZTO4XIW3r4aNPq
         EJ+SeOcn/OLgZuJsg9pjlGeFQrQDsIv5efhaTFyRc+foCuMavDUEEf2nBke6ZdUsCHNd
         ezEQ==
X-Gm-Message-State: APjAAAXJosqPadsNZeNVQi3ZH+ojYQ8I/9rtleYr1qyPjk8tJfpr/6Am
        t8TG/ImdJ7UhmjOTiRrAejRjJQ==
X-Google-Smtp-Source: APXvYqxQJW1XSVt9TMavEbM0xIHixil8OrQltgMCM89uJU6/ENroIZon4qben5SYbfW3K6tscJsQgw==
X-Received: by 2002:a19:7406:: with SMTP id v6mr7508583lfe.9.1556520975833;
        Sun, 28 Apr 2019 23:56:15 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id v28sm7217734lfi.33.2019.04.28.23.56.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:56:14 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:39:32 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v5.2
Message-ID: <20190429063932.iipl7p7j5irv6ili@localhost>
References: <cover.1555683540.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1555683540.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 19, 2019 at 04:33:02PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC defconfig updates for v5.2.
> 
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v5.2
> 
> for you to fetch changes up to 940d1a288a598ee18afa25ee74f4ca124bddd364:
> 
>   arm64: defconfig: enable RX-8581 config option (2019-03-18 10:32:55 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC Defconfig Updates for v5.2
> 
> + Enable support for RX-8571/RX-8581 RTC

Merged, thanks.


-Olof
