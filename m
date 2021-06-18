Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CA03AC8E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 12:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbhFRKgs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 06:36:48 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:14253 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbhFRKgr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 06:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624012470;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/dVcbnREEYcZgxJ0g1I1q/NVGHK7J/3QRwomRLsRMhA=;
    b=pzJYy2KeYxIh9tWW/0uWDIAiic4XYjuskn6Nnei2mX0jzVvg3Q3t91e4gNgbJO6j/5
    I7X1X2pMxz4Ri1HBZTJwUR38euE8VxN3NoceMWjEySJIs3D/MBTJyAPwylTyGMCm2uB5
    GHGYwXzsuptAVM4h4RjWOZ+KsJh7r2GzJMYSmpltnbdYC57zFmD+TDPqc1pCkH1wbhhT
    MHGP75T6VNw34atSr+ENpAD4d+TefsF8nVSfrP0xMu0mW+Go9HJqdxQ06iMbQOGrxbCr
    XKP2IZg1Nxk3dreRfsWFVy+j/YyjXe5bqqt9BicpgO5gnpGUhOamiEX/D2xjtokKnWzQ
    xRNg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGk/2mpg+g="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.27.3 AUTH)
    with ESMTPSA id x09e06x5IAYU46k
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Fri, 18 Jun 2021 12:34:30 +0200 (CEST)
Date:   Fri, 18 Jun 2021 12:34:30 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Message-ID: <1933675781.264632.1624012470082@webmail.strato.com>
In-Reply-To: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
References: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev25
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 06/18/2021 10:23 AM Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> 
>  
> When we use the alive callback, we expect a command to fail if the card
> is not present. We should not trigger a retune then which will confuse
> users with a failed retune on a removed card:
> 
>  mmc2: tuning execution failed: -5
>  mmc2: card 0001 removed
> 
> Disable retuning in this code path.
> 
> Reported-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/core/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 54f0814f110c..eb792dd845a3 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2088,6 +2088,9 @@ int _mmc_detect_card_removed(struct mmc_host *host)
>  	if (!host->card || mmc_card_removed(host->card))
>  		return 1;
>  
> +	/* we expect a failure if the card is removed */
> +	mmc_retune_disable(host);
> +
>  	ret = host->bus_ops->alive(host);
>  
>  	/*
> @@ -2107,6 +2110,8 @@ int _mmc_detect_card_removed(struct mmc_host *host)
>  		pr_debug("%s: card remove detected\n", mmc_hostname(host));
>  	}
>  
> +	mmc_retune_enable(host);
> +
>  	return ret;
>  }
>  
> -- 
> 2.30.2

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
