Return-Path: <linux-renesas-soc+bounces-31510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMucMInk6GkHRQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 17:08:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D587B447B2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 17:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A07F301B17D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 15:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD059221F0C;
	Wed, 22 Apr 2026 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="UyOfh6L3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37D32BD0B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776870166; cv=none; b=nwtI4CRGnbWT+SVsayYFOjFcG94WnB5GigpbraFJukX3AorrDG9e1OJlA5pHADHgbs5rQmkkh6+hQrzH/92vK5ZHcf+cGVw0KWWv9aS5I/4iPSNfDqN1s6TGVR6IwFaQlMk0LVSrl2kamIgL2rPDsVKYTkx0JaN1zASn7v8MF/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776870166; c=relaxed/simple;
	bh=N33CaBAoLvf/zC8aHvxJVp7GYX2jZjhBpS9ofzTjmaU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EgkYzsIfogN/XTwMgGNnvGsq/WaelEMsSXI3WZo7w/+dJPIOt5SQbaUHA0d8jvZJCeuoXlSpTBIrJ7ZGOAz0nevDsR9OTWWBtXPlZyzR2qUsMLDKaxGR2OQGPvQf4NyRfvno/F3ksxib0t02nG0jk0AOu051RnWOF/kLw7WYrpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=UyOfh6L3; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=d1DRDQK2BzfYXwf9aVhwoDO1MQzx5va/tsd04ZS3/zE=; b=UyOfh6L3n1HQrgpWfJsoUapMK2
	Mms+xkV8SndVoV5jkfwqMhv88CX4fFsz+rmmcaafyR5mMqdwZM7rO/DxVxx8Kp063hD7Cy80jHPWK
	77zlsQy4M22uIGaexR7jfbz7nitv0G1XacatGlGDsGwIZl+DYBWA3714d3BZVanfHJE4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wFZ65-000000007n7-3ML7;
	Wed, 22 Apr 2026 11:02:38 -0400
Date: Wed, 22 Apr 2026 11:02:37 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Pavel Machek <pavel@nabladev.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2] drm: renesas: rz-du: mipi_dsi: Fix return path on
 error
Message-Id: <20260422110237.15cd5208452a1d6d842ab5dd@hugovil.com>
In-Reply-To: <20260422145146.1638998-1-chris.brandt@renesas.com>
References: <20260422145146.1638998-1-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[hugovil.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,nabladev.com,vger.kernel.org,lists.freedesktop.org,dimonoff.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31510-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[hugovil.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nabladev.com:email,hugovil.com:dkim,hugovil.com:mid]
X-Rspamd-Queue-Id: D587B447B2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Chris,

On Wed, 22 Apr 2026 10:51:46 -0400
Chris Brandt <chris.brandt@renesas.com> wrote:

> In case of error, we should unwind correctly.
> Switching to using dmam_ instead of dma_ and moving the code earlier
> fixes the issue.
> 
> Fixes: 6f392f371650 ("drm: renesas: rz-du: Implement MIPI DSI host transfers")
> Suggested-by: Pavel Machek <pavel@nabladev.com>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Acked-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> ---
> V1->V2:
>  - Need to take into account mipi_dsi_host_register was already called (Geert)
>  - Switch to using dmam_alloc_coherent to automate unwinding (Chris)
>  - Added Acked-by (Hugo)

You should not add "Acked-by" tags if you make
modifications _after_ someone has given its Ack (unless it is just a
minor cosmetic or coding style change)...

In other words, my ack was for V1, not V2 which is quite different from
V1 :)

Don't resend a V3 just for that, I will have a look later at V2...


> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 29f2b7d24fe5..b908e702b607 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1442,6 +1442,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
>  				     "failed to get prst\n");
> 
> +	dsi->dcs_buf_virt = dmam_alloc_coherent(dsi->dev, RZG2L_DCS_BUF_SIZE,
> +						&dsi->dcs_buf_phys, GFP_KERNEL);
> +	if (!dsi->dcs_buf_virt)
> +		return -ENOMEM;
> +
>  	platform_set_drvdata(pdev, dsi);
> 
>  	pm_runtime_enable(dsi->dev);
> @@ -1474,11 +1479,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_pm_disable;
> 
> -	dsi->dcs_buf_virt = dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE,
> -					       &dsi->dcs_buf_phys, GFP_KERNEL);
> -	if (!dsi->dcs_buf_virt)
> -		return -ENOMEM;
> -
>  	return 0;
> 
>  err_phy:
> @@ -1493,8 +1493,6 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
>  {
>  	struct rzg2l_mipi_dsi *dsi = platform_get_drvdata(pdev);
> 
> -	dma_free_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE, dsi->dcs_buf_virt,
> -			  dsi->dcs_buf_phys);
>  	mipi_dsi_host_unregister(&dsi->host);
>  	pm_runtime_disable(&pdev->dev);
>  }
> --
> 2.52.0
> 
> 


-- 
Hugo Villeneuve

