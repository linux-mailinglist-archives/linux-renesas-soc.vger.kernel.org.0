Return-Path: <linux-renesas-soc+bounces-29616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HD5GthuuWm8EgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:10:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE72ACB7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 783C13006F3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 15:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74ED3E5594;
	Tue, 17 Mar 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="U86YwYLL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730563E8671;
	Tue, 17 Mar 2026 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759738; cv=none; b=qD4+mlYoEqdf08WTyznN7liwmBMJCBzO5N18Geg1vMa19miUCYBEE5hJ1Om1dYLyGGbPd7KoMESHjTA2oAY94r8fxWnJbjTzhazEjeU2+estaVMX4euDV9y9A9frJdpechVbAlNP0Uik7hVCC3LlmK0RQ0S/gl0++kO7zlD0uBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759738; c=relaxed/simple;
	bh=32Kx8kKf6XDP0XJuoMKWXU4M2kJ5Nhv8yXlsJQMzUqY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=h1ZbI5oz+PquS3PghxffJdSvt9GpE/OOH3Z7mhSopr2RbOZkrJRNWI241iVk18XDS5BkFg9nr21MIiaYsCyis/Zdo7CluPidE36yW4LuSOnPby6OyTVB5sJ6PR1CLDSfGhVmJWWUtbILED1tklF42kfAKXs/O4MihWA36ArbFKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=U86YwYLL; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=ZauWGiw7JSkVbYA8nHrtW6EEMjerV0nDt8sMW92G+so=; b=U86YwYLLO+JCY4KexJ1qSb2wRS
	/5oPEYM9vwD2Dn+HWO98KsUY6qhlHTS0DNh3grwkxkOeT87UP0/gDzxjyGwGpAnRgI6WGQ5fNcXcD
	xoUdR4lDXElt3a2G2dpRj1lplrf9yE7+hRnt0DokeIgZ1Uf0ScsdF9LO8jPcFCeNXJI0=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61] helo=debian-lenovo)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w2Vvy-000000001sV-0XFd;
	Tue, 17 Mar 2026 11:02:14 -0400
Date: Tue, 17 Mar 2026 11:02:13 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>, Chris Brandt
 <chris.brandt@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] drm: renesas: rzg2l_mipi_dsi: Use fsleep() for 1ms
 delay in D-PHY init
Message-Id: <20260317110213.74bbbd19cc81d0918a627fe7@hugovil.com>
In-Reply-To: <20260317123610.329630-2-biju.das.jz@bp.renesas.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
	<20260317123610.329630-2-biju.das.jz@bp.renesas.com>
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[hugovil.com,none];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29616-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[hugovil.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hugovil.com:dkim,hugovil.com:email,hugovil.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7FE72ACB7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 17 Mar 2026 12:36:00 +0000
Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Replace udelay(1) with fsleep(1000) in rzg2l_mipi_dsi_dphy_init() to
> follow the power-on sequence described in Figure 34.5 of section
> "34.4.2.1 Reset" of the RZ/G2L hardware manual Rev.1.50 May 2025.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Seems to me like this should be backported to stable branches (missing Fixes / Cc: stable tags)?


> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index a87a301326c7..e53b48e4de56 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -528,7 +528,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>  	if (ret < 0)
>  		return ret;
>  
> -	udelay(1);
> +	fsleep(1000);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>

