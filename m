Return-Path: <linux-renesas-soc+bounces-30111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED1UIstMwWlbSAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 15:23:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9655B2F455C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 15:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC7233025101
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E69A3ACA5C;
	Mon, 23 Mar 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="V57JBstp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7941D63F3;
	Mon, 23 Mar 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275626; cv=none; b=Ki6+Iabh1w8DEY1SXWn7fVXpnPX08pg3mlYxmSip6bi7FoNGR8f2004XSnXDDweGjqp6BdEul1vJIYCGmg/dV6FQ16CbptyHgeLjzT8QsSN56TmHw7xs0QxEKyGzoWZOQFvOALJYH85sxdyEdXEIMFUjFRLV9I9JLbUZTVtQO0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275626; c=relaxed/simple;
	bh=flg7ElwyU59BsGjspbazLSKnxQYip83CnYjxh+Wig2w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U4/c4lyNDQlzzTapwWvl4z4LmqXragNDZKS5hsY7wzdS7wYfmXWL6ZrIsxUi+FYw0kgQUmqJQOPtcwxvzsHCZTK1V5UTEDxn0NX252N1GxE3+2KBo7WtglpPl2m/gymocKSceltZB3ZhJFBxutwIpHz30PvO6iCz4wD8DXgiGww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=V57JBstp; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=OmxJ1apwp+OWULkeu85yy8mpbmRe+k4PsouBkcueBoc=; b=V57JBstp+y9wrbGTRv998IMyEq
	6lIpMt9N5WURxMfOOmTgTV3bZNy/8ZSvBwa3xO53FRSt6aeUfRHx+AKIIxf7SiITfnkMsLf/amPG/
	EI/BNnOVvxnB4TE0l4Yws9m5ORxB+jrsBqVMgYtjE75YTqHJjJWKDvJGKyhWIwkkug4k=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w4g8d-000000006rQ-34YE;
	Mon, 23 Mar 2026 10:20:15 -0400
Date: Mon, 23 Mar 2026 10:20:15 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chris Brandt <chris.brandt@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Sam Ravnborg
 <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/4] drm: renesas: rzg2l_mipi_dsi: Increase reset
 deassertion delay to 1 msec
Message-Id: <20260323102015.957b2f855b7d54aa5d33869d@hugovil.com>
In-Reply-To: <20260319164833.409126-5-biju.das.jz@bp.renesas.com>
References: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
	<20260319164833.409126-5-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30111-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,renesas.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[hugovil.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hugovil.com:dkim,hugovil.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 9655B2F455C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Thu, 19 Mar 2026 16:48:28 +0000
Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
> requires waiting more than 1 msec after deasserting the CMN_RSTB signal
> before the DSI-Tx module is ready. Increase the delay from 1 usec to
> 1 msec by replacing udelay(1) with fsleep(1000).
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

In your first submission, I commented that "...this should be backported
to stable branches (missing Fixes / Cc: stable tags)?" and you answered
with "Agreed, will add fixes/stable tags".

If you still agree, this patch should be #3 in your list, so that it is
easier/straightforward to backport to stable branches.


> ---
> v1->v2:
>  * Updated commit header and description.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 5020be0f72ac..715872130780 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -807,7 +807,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  		if (ret < 0)
>  			goto err_phy;
>  
> -		udelay(1);
> +		fsleep(1000);
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 
> 


-- 
Hugo Villeneuve

