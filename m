Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CCD3EA724
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 17:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238362AbhHLPI0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 11:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238349AbhHLPIY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 11:08:24 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002C1C061756;
        Thu, 12 Aug 2021 08:07:58 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9E1D02CC;
        Thu, 12 Aug 2021 15:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9E1D02CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1628780878; bh=Ir7SHWH+PuCwXz2BKzIlhif8rFKrQ9xaedDIeOtDmVs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jvEiCujtVz3wh/UXFCHAo5zNx0zj0ssX7GDVOvPevyRxaqklcL3NmdicVrPwmA7XP
         WTIxVPFTwHqWDPcZOwZ4Nf6d2HMqyx3+ccJDJaZuEfAgWACv57ZCeIysxUonqrrbjm
         /2fTrMqadC32/7fiI65vT8+R1HNECcXnAktbJ0akYv5HtEXbVCIQVgdzLjNhHXlyJE
         ns7OyyS06utzHCyusaDMjUIXwsete3fbErN4NKTNvplRsrpoWWLHydp5D1hcwC1iVm
         3yPwB7J14QYXBaB038F+U2PtzTDpNW2dufL89v/DnBKxaT/HDH8ck2HWGvl6p0BbDT
         SApRNRWAYZdbA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-doc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] scripts/kernel-doc: Override -Werror from KCFLAGS with
 KDOC_WERROR
In-Reply-To: <20210730225401.4401-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210730225401.4401-1-laurent.pinchart+renesas@ideasonboard.com>
Date:   Thu, 12 Aug 2021 09:07:58 -0600
Message-ID: <87sfzezooh.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> writes:

> Since commit 2c12c8103d8f ("scripts/kernel-doc: optionally treat
> warnings as errors"), the kernel-doc script will treat warnings as
> errors when one of the following conditions is true:
>
> - The KDOC_WERROR environment variable is non-zero
> - The KCFLAGS environment variable contains -Werror
> - The -Werror parameter is passed to kernel-doc
>
> Checking KCFLAGS for -Werror allows piggy-backing on the C compiler
> error handling. However, unlike the C compiler, kernel-doc has no
> provision for -Wno-error. This makes compiling the kernel with -Werror
> (to catch regressions) and W=1 (to enable more checks) always fail,
> without the same possibility as offered by the C compiler to treating
> some selected warnings as warnings despite the global -Werror setting.
>
> To fix this, evaluate KDOC_WERROR after KCFLAGS, which allows disabling
> the warnings-as-errors behaviour of kernel-doc selectively by setting
> KDOC_WERROR=0.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  scripts/kernel-doc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
