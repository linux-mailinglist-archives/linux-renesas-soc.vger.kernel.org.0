Return-Path: <linux-renesas-soc+bounces-31370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMC5EfyC4mlW6wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 20:59:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7194441E1A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 20:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 472EF300BE11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 18:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07360349AFF;
	Fri, 17 Apr 2026 18:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="J7o8Uin6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4138F92B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 18:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776452337; cv=none; b=bSPS3S0NKjKIsLyMoxwdDFYe/IuTur/KHWXelOf/LZgEnD6duBqgMYrzqGWJj1dnoFQIvJsHgZNcrnhsro9E14r/oNZspVLToEqiE8G7RQFtH9fwh+kiZIBcUopgvbFHcRCxCdWNK+mi4FasbdeJ7kL9HImJUB/c8xOFB4npTYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776452337; c=relaxed/simple;
	bh=pAhmA2flSWRgvSggA1uR5y+OSxHtXNNDQacGU0stpkA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=C0YJEiQV/RGUR9xiUaRx1nbLlyN5U4AZpRgXq0I9t89JWvWXcsDeP1a2ya/S6E2Tj+y/ci3xhZoQQ73fLtljqXzPpJlfW1VjpPzxUEDrp0ZR/4W19U/FUh3eJ7mDKVFS0IqvGc27CKiZLm3b1SDPS6LInZ1KpodGDhuU2D2relQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=J7o8Uin6; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=iSdycSiP5esxiXkmf5jgR1xrey6IchJab4DsyuEFOg8=; b=J7o8Uin6ImzqMX+KPax8BJ7oJ+
	Cb0v9P9UtzsxzUJ1PiDCPiHvp7I9rSe78ThYD1Tt7h+3XRwFSZg0ecRb5X5Hr7cz7JBut5A7xOPSK
	VwbILE8E7ELijmYSfw3MXYywI7xW9CBw7+pAqxrUXfIGiHlbriPuqzw1IHp0o1MAGlB0=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wDoOu-000000002y1-3QhF;
	Fri, 17 Apr 2026 14:58:49 -0400
Date: Fri, 17 Apr 2026 14:58:48 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Pavel Machek <pavel@nabladev.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: renesas: rz-du: mipi_dsi: Fix return path on error
Message-Id: <20260417145848.aae623dee5356ae715ea1faa@hugovil.com>
In-Reply-To: <20260417140231.3972749-1-chris.brandt@renesas.com>
References: <20260417140231.3972749-1-chris.brandt@renesas.com>
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
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31370-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,nabladev.com,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[hugovil.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,dimonoff.com:email]
X-Rspamd-Queue-Id: 7194441E1A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Chris,

On Fri, 17 Apr 2026 10:02:31 -0400
Chris Brandt <chris.brandt@renesas.com> wrote:

> In case of error, we should unwind correctly.
> 
> Fixes: 6f392f371650 ("drm: renesas: rz-du: Implement MIPI DSI host transfers")
> Suggested-by: Pavel Machek <pavel@nabladev.com>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Acked-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 29f2b7d24fe5..92ea26ce723f 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1476,8 +1476,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  
>  	dsi->dcs_buf_virt = dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE,
>  					       &dsi->dcs_buf_phys, GFP_KERNEL);
> -	if (!dsi->dcs_buf_virt)
> -		return -ENOMEM;
> +	if (!dsi->dcs_buf_virt) {
> +		ret = -ENOMEM;
> +		goto err_pm_disable;
> +	}
>  
>  	return 0;
>  
> -- 
> 2.52.0
> 
> 


-- 
Hugo Villeneuve

