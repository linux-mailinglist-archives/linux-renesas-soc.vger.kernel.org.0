Return-Path: <linux-renesas-soc+bounces-31903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE3MEgR/92lsiQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 18:59:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A19914B6B45
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 18:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3064830053F4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7778D37648D;
	Sun,  3 May 2026 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1iDIZ0s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E202D877A;
	Sun,  3 May 2026 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777827463; cv=none; b=eVCHCDw/81Hhf4VQWGk5JCICQmz1KpZYVvLc7sWsNvhRULF1XLnF8Xz3eAal+EDYyCyv+7IYhlvlUvsJ5pqWBoDBNcZUYEem+57x8XDH0fjfXO5r2Cw4kngk2V9kYdwR6wefYGjcQuZddDBu4jAqL6dZqr7jNGhsOKvTsMHyvzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777827463; c=relaxed/simple;
	bh=T9k76UIlfgn5aHBqK2gi3rGusZZXx87NFJ5kF/vgN2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRVn6vdb53er+dop4OBoG0nlQtJwJ7VCeXQjL0S4QeVbcNW4CmQac3ciATp5KELnmBgSZMztuhEmCS+tyF8BzEFS+l4QAQloWxVjZUeo29KSNckoeQemuzSrBAj9F6BDiGd7drYiazQZcJtFQH+Ehh3bq0zgFVOqyj3vCzN2TCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1iDIZ0s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7473AC2BCB4;
	Sun,  3 May 2026 16:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777827463;
	bh=T9k76UIlfgn5aHBqK2gi3rGusZZXx87NFJ5kF/vgN2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1iDIZ0sU+H2ARQR0a6JW8S8kGNBEO6wzX+Ag5koZKKhF2xyzKZkfMsuOkDZKc1O+
	 Nmn0tGnIv1FGZJQdcG9+RIoYA3EsYiUvRiLkSY2/XQQdjiW7RXBQrLjrfKVKNRlpLX
	 inNOwrBJ/B1m4pTYIjuedlvyfc2O0N1M2qpVivgH8FKDYje9coLyw1NJ8SZIdbHCR5
	 ZQqKYj0oVm4Md7vtPs1kYStorsrLo5fwuOKBj1q1Vq8adKB57aVzjdxzmj2Gfe1CmS
	 wNpq5unWOzIM5iVJgPoCmo3L7fw7qV9czud0/3XupqxhNE78l14Zpo63c0RB60NX3q
	 BoMLZf7bFfYwA==
Date: Sun, 3 May 2026 22:27:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: neil.armstrong@linaro.org, biju.das.jz@bp.renesas.com,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
Message-ID: <afd-gj-F3OYDfCwJ@vaman>
References: <20260427194741.161533-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427194741.161533-1-ovidiu.panait.rb@renesas.com>
X-Rspamd-Queue-Id: A19914B6B45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31903-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,renesas.com:email]

On 27-04-26, 19:47, Ovidiu Panait wrote:
> On the Renesas RZ/V2H platform, if the xhcd driver is unbound and the
> system is suspended afterwards, a PM underflow error will occur:
> 
>  # echo 15850000.usb > /sys/bus/platform/drivers/xhci-renesas-hcd/unbind
>  # systemctl suspend
>  15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq returns -13
>  15870000.usb-phy: PM: failed to resume noirq: error -13
>  15870000.usb-phy: Runtime PM usage count underflow!
> 
> Since the PHY framework is managing the runtime PM of the PHY via
> phy_power_on()/phy_power_off(), there is no need for the PHY driver to
> manipulate the runtime PM state during suspend.
> 
> To fix this, remove the runtime PM calls from the suspend/resume paths
> and add a get/put pair inside rzg3e_phy_usb3_init_helper() to make sure
> the clock is enabled during init, even when there is no consumer for
> the PHY.

Ok

> 
> Also, change the suspend ops from NOIRQ_SYSTEM_SLEEP_PM_OPS to
> SYSTEM_SLEEP_PM_OPS because runtime PM is disabled during the noirq phase
> and pm_runtime_resume_and_get() would not actually enable the device clock.

This is a fix, so split this up please

> 
> Fixes: ee5f1a3f90a4 ("phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
>  drivers/phy/renesas/phy-rzg3e-usb3.c | 31 ++++++++++++++++------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/phy-rzg3e-usb3.c
> index 6b3453ea0004..055775e1a0f7 100644
> --- a/drivers/phy/renesas/phy-rzg3e-usb3.c
> +++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
> @@ -64,6 +64,7 @@
>  #define USB3_TEST_LANECONFIG0_DEFAULT		(0xd)
>  
>  struct rz_usb3 {
> +	struct device *dev;

This does not belong in a fix, please split

>  	void __iomem *base;
>  	struct reset_control *rstc;
>  	bool skip_reinit;
> @@ -130,11 +131,21 @@ static int rzg3e_phy_usb3test_phy_init(void __iomem *base)
>  	return 0;
>  }
>  
> -static int rzg3e_phy_usb3_init_helper(void __iomem *base)
> +static int rzg3e_phy_usb3_init_helper(struct rz_usb3 *r)
>  {
> -	rzg3e_phy_usb2test_phy_init(base);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(r->dev);
> +	if (ret)
> +		return ret;
> +
> +	rzg3e_phy_usb2test_phy_init(r->base);
>  
> -	return rzg3e_phy_usb3test_phy_init(base);
> +	ret = rzg3e_phy_usb3test_phy_init(r->base);
> +
> +	pm_runtime_put_sync(r->dev);
> +
> +	return ret;
>  }
>  
>  static int rzg3e_phy_usb3_init(struct phy *p)
> @@ -143,7 +154,7 @@ static int rzg3e_phy_usb3_init(struct phy *p)
>  	int ret = 0;
>  
>  	if (!r->skip_reinit)
> -		ret = rzg3e_phy_usb3_init_helper(r->base);
> +		ret = rzg3e_phy_usb3_init_helper(r);
>  
>  	return ret;
>  }
> @@ -187,6 +198,7 @@ static int rzg3e_phy_usb3_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, r);
>  	phy_set_drvdata(phy, r);
> +	r->dev = dev;
>  
>  	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  	if (IS_ERR(provider))
> @@ -199,7 +211,6 @@ static int rzg3e_phy_usb3_suspend(struct device *dev)
>  {
>  	struct rz_usb3 *r = dev_get_drvdata(dev);
>  
> -	pm_runtime_put(dev);
>  	reset_control_assert(r->rstc);
>  	r->skip_reinit = false;
>  
> @@ -215,27 +226,21 @@ static int rzg3e_phy_usb3_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = pm_runtime_resume_and_get(dev);
> +	ret = rzg3e_phy_usb3_init_helper(r);
>  	if (ret)
>  		goto reset_assert;
>  
> -	ret = rzg3e_phy_usb3_init_helper(r->base);
> -	if (ret)
> -		goto pm_put;
> -
>  	r->skip_reinit = true;

https://sashiko.dev/#/patchset/20260427194741.161533-1-ovidiu.panait.rb%40renesas.com


-- 
~Vinod

