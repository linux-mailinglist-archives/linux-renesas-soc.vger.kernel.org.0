Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430087D9783
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Oct 2023 14:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345787AbjJ0MPf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Oct 2023 08:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345740AbjJ0MPe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Oct 2023 08:15:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1F2FA;
        Fri, 27 Oct 2023 05:15:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DDDC433C8;
        Fri, 27 Oct 2023 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1698408931;
        bh=kZXcL0pvG1L+KmFF/HHHVHZZ3cpx4UPBud9Z2XG1+jY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Na83yLsXQ8cVXeHxNSVwKpp0JHPuEx2sxfV9fovOyYIALNVibwtYGGnfH062AfuT0
         S1YuGZbE6dYzksX2Tkn2C0sFdrBGKccEx7YT3Sb/eyTO/fkNxErzvyIHG8YtWmj7xH
         32m+hHq73zdINDvnx//6sMrgp4r4Xox6uqEEAMMo=
Date:   Fri, 27 Oct 2023 14:15:28 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sasha Levin <sashal@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@denx.de>, stable@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v5.10.199] mmc: renesas_sdhi: use custom mask for
 TMIO_MASK_ALL
Message-ID: <2023102722-parchment-repeated-f684@gregkh>
References: <1b9fda30f2d86fab50341a947d17b5206a2c7507.1698321354.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b9fda30f2d86fab50341a947d17b5206a2c7507.1698321354.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 26, 2023 at 02:18:56PM +0200, Geert Uytterhoeven wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> [ Upstream commit 9f12cac1bb88e3296990e760d867a98308d6b0ac ]
> 
> Populate the new member for custom mask values to make sure this value
> is applied whenever needed. Also, rename the define holding the value
> because this is not only about initialization anymore.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Link: https://lore.kernel.org/r/20210304092903.8534-1-wsa+renesas@sang-engineering.com
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> [geert: Backport to v5.10.199]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Fixes: 6d3745bbc3341d3b ("mmc: renesas_sdhi: register irqs before registering controller")

Now queued up, thanks.

greg k-h
