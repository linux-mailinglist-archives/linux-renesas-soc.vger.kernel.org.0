Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B265308111
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Jan 2021 23:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhA1W0I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Jan 2021 17:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbhA1W0I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jan 2021 17:26:08 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3C0C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Jan 2021 14:25:27 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 604186173;
        Thu, 28 Jan 2021 22:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 604186173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611872686; bh=qQbtP2Dn03VQjBluckzrepkv+tQCQzx5n99qCMWXWfQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qwc4/A9UtlSJz2lO2RrPNyO1yVZ8epYaYAgg7ex2y0/na13TyTSGMqL6swwTWfyaq
         qTJXctnMpDJ101yIyKz+8BAcUMMLTL302yXr2X2QIr5ORMcmMArPTbgm30UaTv9TWb
         1Xvj0rTpVL5YN2fnd/Fkp5PyCnKre71/Q7cETLGRLv9v5Tez5BKRourwnZrOoG4wtM
         G7DgE4EVa6wqP6dkoHaR5kFrRkaK6SVkDPv68H4aFKUQZJXwEvZq7qCIzYvK4zrQyP
         tAN8s0mIcJr5fUrIitd3wLhyWpQNrP4kPp3+iApKs07g2KtPmNAwPkS/bcbfIIm13p
         nl3tJl3v7JeNQ==
Date:   Thu, 28 Jan 2021 15:24:45 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] Documentation: kernel-parameters: add missing
 '<'
Message-ID: <20210128152445.62402f73@lwn.net>
In-Reply-To: <20210127104343.5647-1-wsa+renesas@sang-engineering.com>
References: <20210127104343.5647-1-wsa+renesas@sang-engineering.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 27 Jan 2021 11:43:43 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 06fb1b4aa849..202fac80ea0c 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -60,7 +60,7 @@ Note that for the special case of a range one can split the range into equal
>  sized groups and for each group use some amount from the beginning of that
>  group:
>  
> -	<cpu number>-cpu number>:<used size>/<group size>
> +	<cpu number>-<cpu number>:<used size>/<group size>

Applied, thanks.

(FWIW it looks like the original wasn't sent to me, so I didn't apply it
then...)

jon
