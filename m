Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EE7343354
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Mar 2021 17:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhCUQFX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 12:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhCUQFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 12:05:23 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0CAC061574;
        Sun, 21 Mar 2021 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
        Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=bRZkMDyVjEHYQP3aS4EHghK5KTFY9dCEonp0Ggkl0WM=; b=I4tVtOwMges9O1MI9txjFLx9mD
        F/fxTJGlxxEtOLPsLOChvC5Cp5Ey7c+zdT9h90Oh/NfUPfQ99N4MbtQwHtSvB2SVv5YzBTCNdONBM
        tL1NBrLwU1BkxJN58FlX3BHA3d02x/IQ0stGwjYPCzI4WcocIUVNUPc/FpP+yw+wx8JqmBMeyLcS0
        wbYQTHd+wyAMzMjbHvZfQHkpoPXyLZLnmT76+oWzXmwgQtDpZuEBPVdVhuoT9u//Pry4OMD3D1kda
        Oo3tUQcNyk7UBy8fhN+qW40q1qw6eeyVpTjnNhdQdR8gk9i58pZGg2IQtmNTl++6fJ7dc9EqN6JkM
        JUyXCy2Q==;
Received: from rdunlap (helo=localhost)
        by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
        id 1lO0Zo-002OLF-QV; Sun, 21 Mar 2021 16:05:17 +0000
Date:   Sun, 21 Mar 2021 09:05:16 -0700 (PDT)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
cc:     renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Couple of spelling fixes
In-Reply-To: <20210321075813.9471-1-unixbhaskar@gmail.com>
Message-ID: <53201147-ac5a-c5a1-b6c0-240d9423c61@infradead.org>
References: <20210321075813.9471-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210321_090516_880398_011AC1A0 
X-CRM114-Status: GOOD (  15.01  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "bombadil.infradead.org",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 21 Mar 2021, Bhaskar Chowdhury wrote: > > s/suposed/supposed/
    > s/concurent/concurrent/ > > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
    Acked-by: Randy Dunlap <rdunlap@infradead.org> 
 Content analysis details:   (-0.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 NO_RELAYS              Informational: message was not relayed via SMTP
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On Sun, 21 Mar 2021, Bhaskar Chowdhury wrote:

>
> s/suposed/supposed/
> s/concurent/concurrent/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> drivers/clk/renesas/r9a06g032-clocks.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
> index 892e91b92f2c..1fe166e7f8bd 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -279,7 +279,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
> 	/*
> 	 * These are not hardware clocks, but are needed to handle the special
> 	 * case where we have a 'selector bit' that doesn't just change the
> -	 * parent for a clock, but also the gate it's suposed to use.
> +	 * parent for a clock, but also the gate it's supposed to use.
> 	 */
> 	{
> 		.index = R9A06G032_UART_GROUP_012,
> @@ -311,7 +311,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
>
> struct r9a06g032_priv {
> 	struct clk_onecell_data data;
> -	spinlock_t lock; /* protects concurent access to gates */
> +	spinlock_t lock; /* protects concurrent access to gates */
> 	void __iomem *reg;
> };
>
> --
> 2.30.1
>
>
