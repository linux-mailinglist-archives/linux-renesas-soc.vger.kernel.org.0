Return-Path: <linux-renesas-soc+bounces-29617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOQTIjlvuWm8EgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:11:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 146862ACBAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A75E31AEB7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 15:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635223EB7FA;
	Tue, 17 Mar 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="FSLPBW3U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E633EAC8C;
	Tue, 17 Mar 2026 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759911; cv=none; b=VxMlXId0uzlQLqDoqrXDB7jIC/7+Wz6N++7vyfKF7BB5pLuI3a73ffZt4z2trKyNmiNVazkJE4tKYkXdOf5EdP9YFTo99W91TmVd8ndWB/jB2x6Ba5Rkw5otBCsh0hTw952ETXYt0x40BPcnh5kjqisNZ4La5Ig39edEmMWYCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759911; c=relaxed/simple;
	bh=6uAm27Ql5xQeTLaGM87R8Ws4yEgQXp9j5VjfQBBlIeQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bcBXtveXUOmJSeWas5dmLRZ6FS/CEWRnTNavlWT1TAEomoQXEKu4eaLa8L1nr6YIWPzpjwGmvKh0ANSer51BviN579S5/ZqvRdvbR/KmO1FCqF/VwxIr6lsu+vfvsfod8AQQ8cJ6GWjAkwzUJFZyJmrJZrsG9NbBoIWUuCWlWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=FSLPBW3U; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=koyUHICUcLifjkIlRusqBeAiTAEOVXVIw8qXKtQGB+o=; b=FSLPBW3U1WbAetHnlPjPQ0tMuc
	uh2rP0SzSey0mDYpFwmjTfEoEADtqyDjK+CVv1EybBQMCgsdOEViUJuMARKE6gC0RXWCvHvJ9o3lU
	TgXIgpbZnjm/cdXq5270EEE85JSK7AyCy/OI6zQEjojvKqnSHtpZpKEydapfVsxa9ziU=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61] helo=debian-lenovo)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w2VhY-000000001jf-0EqC;
	Tue, 17 Mar 2026 10:47:20 -0400
Date: Tue, 17 Mar 2026 10:47:19 -0400
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
Message-Id: <20260317104719.e251fb0feb2e99b7569c2dc4@hugovil.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29617-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hugovil.com:dkim,hugovil.com:email,hugovil.com:mid]
X-Rspamd-Queue-Id: 146862ACBAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 17 Mar 2026 12:36:00 +0000
Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>

The commit message seems confusing to me, indicating that you only
changed fsleep, but did not change the delay? Maybe change it to
indicate that you increase the delay from 1us to 1ms, which is the real
reason of the change (why).

> 
> Replace udelay(1) with fsleep(1000) in rzg2l_mipi_dsi_dphy_init() to

Same here, the real reason of the change is to increase the delay, and
this is not obviously stated.


> follow the power-on sequence described in Figure 34.5 of section
> "34.4.2.1 Reset" of the RZ/G2L hardware manual Rev.1.50 May 2025.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

