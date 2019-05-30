Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78A272FC8F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2019 15:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfE3Nmw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 May 2019 09:42:52 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:38062 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbfE3Nmw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 May 2019 09:42:52 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1hWLKM-0005dG-Lx; Thu, 30 May 2019 21:42:42 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1hWLKI-0003fX-HI; Thu, 30 May 2019 21:42:38 +0800
Date:   Thu, 30 May 2019 21:42:38 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-crypto@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] crypto: jitterentropy - change back to module_init()
Message-ID: <20190530134238.y6pwi2ybib5vdk4p@gondor.apana.org.au>
References: <20190521183417.GA121164@gmail.com>
 <20190521184622.37202-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521184622.37202-1-ebiggers@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 21, 2019 at 11:46:22AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> "jitterentropy_rng" doesn't have any other implementations, nor is it
> tested by the crypto self-tests.  So it was unnecessary to change it to
> subsys_initcall.  Also it depends on the main clocksource being
> initialized, which may happen after subsys_initcall, causing this error:
> 
>     jitterentropy: Initialization failed with host not compliant with requirements: 2
> 
> Change it back to module_init().
> 
> Fixes: c4741b230597 ("crypto: run initcalls for generic implementations earlier")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  crypto/jitterentropy-kcapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
