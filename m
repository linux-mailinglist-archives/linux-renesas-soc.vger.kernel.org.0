Return-Path: <linux-renesas-soc+bounces-32242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFONM+WJ/GleRAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:47:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F50C4E86A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D434D3010BCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB533B636B;
	Thu,  7 May 2026 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JujDHvch"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F2B33E345;
	Thu,  7 May 2026 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778157987; cv=none; b=A5rhmZ5ZsqviEtyIfWQvuu0Z6yaPN7sLJVOIXvCe5rytibEzZ5IKKZqnSP7NYM6b8/7XVGmiEVG03QrucOOHtSPQT06u/Z1WUWTc/1KlzLNtvtUQkHnlahga6g7PHbLv0b7YZdzdZyqoKebkPiyqh+7TUmgaZbE1imemSPYhXpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778157987; c=relaxed/simple;
	bh=MCVZsR5HzPh6m3Tl7NULfqVTBbuOyj3XwdZNPC2OaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgy0QjB9OzDN1BQWsq7HGswzNIiFYov/DLWJASA7Bcc5t2MnI/I6MjjsQZlHit0qUtRsE4WfKBtAs/ItiYQxbO5SjAV7z216kpgBBckHOBpoysftvQQmG8D45jmGWLQ+6FSAf3XRx06N952AkydwiGY8tsN2zi5wuRHPMiOdktY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JujDHvch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE79C2BCB2;
	Thu,  7 May 2026 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778157987;
	bh=MCVZsR5HzPh6m3Tl7NULfqVTBbuOyj3XwdZNPC2OaLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JujDHvch3M9RUnoOOesFvpyWzkFfagT93Ll5dd1RA1C5nrKCQv22j9n/6CtarjXip
	 aGsHGsAJsF0LrGEttVu7GSn9D+qAQlq2p/fVWNNJkdrCL+PNi+PniX4gxW8ckfHdgN
	 +fIgVTIIi/Btz0b8EddJJgf3gTwHKRjnPdWLgGW/EDlKupG2Kov9FffzDRR3NxcHYh
	 1DbphBaiIZeEurCj3ADAdRZyDyTvZc1tyz/0nOmLttwRjdBFiqnnrckRGDhFbkA3VW
	 F8K+dR7hy32uQVlvO80rCiaPsIzacp3+pKeg5uj+KK3YcYpDd1bAAH/QpEYUk6CVdm
	 QkuGpRJHPgpxQ==
Date: Thu, 7 May 2026 13:46:20 +0100
From: Lee Jones <lee@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 03/10] mfd: rz-mtu3: use device-managed
 mfd_add_devices()
Message-ID: <20260507124620.GJ305027@google.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-4-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410163530.383818-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Rspamd-Queue-Id: 6F50C4E86A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32242-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

On Fri, 10 Apr 2026, Cosmin Tanislav wrote:

> Replace mfd_add_devices() and the custom cleanup action with
> devm_mfd_add_devices().
> 
> Remove the ret variable as it is now unused.

Do this first, then the changes in the first patch make more sense.

> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
> 
> V2:
>  * no changes
> 
>  drivers/mfd/rz-mtu3.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> index 6b9c6831dffa9..3be6f6c900b82 100644
> --- a/drivers/mfd/rz-mtu3.c
> +++ b/drivers/mfd/rz-mtu3.c
> @@ -300,11 +300,6 @@ void rz_mtu3_disable(struct rz_mtu3_channel *ch)
>  }
>  EXPORT_SYMBOL_GPL(rz_mtu3_disable);
>  
> -static void rz_mtu3_mfd_remove(void *data)
> -{
> -	mfd_remove_devices(data);
> -}
> -
>  static const struct mfd_cell rz_mtu3_devs[] = {
>  	{
>  		.name = "rz-mtu3-counter",
> @@ -320,7 +315,6 @@ static int rz_mtu3_probe(struct platform_device *pdev)
>  	struct rz_mtu3_priv *priv;
>  	struct rz_mtu3 *ddata;
>  	unsigned int i;
> -	int ret;
>  
>  	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
> @@ -353,13 +347,8 @@ static int rz_mtu3_probe(struct platform_device *pdev)
>  		mutex_init(&ddata->channels[i].lock);
>  	}
>  
> -	ret = mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> -			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_mfd_remove,
> -					&pdev->dev);
> +	return devm_mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> +				    ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
>  }
>  
>  static const struct of_device_id rz_mtu3_of_match[] = {
> -- 
> 2.53.0

-- 
Lee Jones

