Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14DF4140616
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2020 10:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgAQJc7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jan 2020 04:32:59 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34352 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgAQJcv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 04:32:51 -0500
Received: by mail-lj1-f195.google.com with SMTP id z22so25787074ljg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jan 2020 01:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FlrrQ/nssXV3OvXK75kddNho6rYCmJKAPSJyNmFq/w0=;
        b=sfIxgB7U1bB9LTHv0aHc7+QPCc3l8aYtittaJhGCf65F4xYxO3R+NyNy7CBNHdyLGp
         uMwnKyb0dIEMTY7wxolA0Reylx3j0aNQDjR5xJdjPg0xM/WiO27fLuMH/GkWsLvSI+DN
         iXoFD3iOr9AcURuzFrX3i3T/lG9a6+XXG9VJfSX1VT5+4j76mU+al5u048Crn9z26bbt
         KWdiosskdzObfWZYDQ5ckAF7/hPZ7OLqLW3+q+3sl+grqKpCTrus8UssWJ8X/ilZp2Yj
         lT+OZNAbPsUpJfmqA9JaeSgVDb4PL0+EUdbH8znbwp8c0STIJvyAD7iVTTy98f/myk1O
         fbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FlrrQ/nssXV3OvXK75kddNho6rYCmJKAPSJyNmFq/w0=;
        b=Re/WbQc8Ert1qnydvNkpSKyKtuFXz5Eyqn6DTI2gcmItl1+wuXpzLTpr3zXQmZ6Z3X
         CQKbvSQfz5Z+LhveNnANksQ6neviMk9r/MZilcsD/2AjPApfch6vZ6uUy2ol1iTgsn2d
         2ZPycpcyP/9kUZlBMdFGJjdpFDfNyYt5tjb0GcUudtHQPvdZcS2dFfSOK75U+M3Qtzmy
         KN3xirFLntw7xLkprGSjrtITQRukclcHSdwS23TrY/0AEpS0hPXh9BUEas7Enb1YE5+A
         UgwjZ/AwkFI0fsQMmc4n3NQvGAXYOUBxBWDYh1zrwTOQnlV6wva8usaSUWIphK1Aq9Vx
         M6eg==
X-Gm-Message-State: APjAAAWLLd3Q54zpWw2tc9FNdtA5wRU/6+085Z8afj72abHORtlpHuc0
        T+MTrP8INm0I97ZQzTjjr9O7rA==
X-Google-Smtp-Source: APXvYqzgGR4ExJ+km0xQAR1IChwYbjGAZZkFrIRdRT9Cl7m98qU9fIismOpqDd/0unVYDWccrg14LQ==
X-Received: by 2002:a2e:858b:: with SMTP id b11mr4984229lji.135.1579253569462;
        Fri, 17 Jan 2020 01:32:49 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:671:f22f:7825:2eb6:5778:a5ff? ([2a00:1fa0:671:f22f:7825:2eb6:5778:a5ff])
        by smtp.gmail.com with ESMTPSA id h19sm12050355ljl.57.2020.01.17.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2020 01:32:48 -0800 (PST)
Subject: Re: [PATCH AUTOSEL 4.19 104/671] ARM: dts: r8a7743: Fix sorting of
 rwdt node
To:     Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20200116165502.8838-1-sashal@kernel.org>
 <20200116165502.8838-104-sashal@kernel.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3a84e4dc-1d2a-3809-ffac-33d75eb73351@cogentembedded.com>
Date:   Fri, 17 Jan 2020 12:32:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200116165502.8838-104-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 16.01.2020 19:45, Sasha Levin wrote:

> From: Biju Das <biju.das@bp.renesas.com>
> 
> [ Upstream commit 383f6024981d32425fa453bf2e66b546fdbc1314 ]
> 
> Watchdog node is incorrectly placed on r8a7743 SoC dtsi. This patch fixes
> the sorting order.
> 
> Fixes: b5beb5d4c81c358f50a8310108 ("ARM: dts: r8a7743: Add watchdog support to SoC dtsi")
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   arch/arm/boot/dts/r8a7743.dtsi | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

    I doubt that the DT node reordering is worth merging into the -stable 
kernels...

MBR, Sergei
