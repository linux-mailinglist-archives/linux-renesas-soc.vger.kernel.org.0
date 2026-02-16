Return-Path: <linux-renesas-soc+bounces-28257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOwjMj0vk2ke2QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:52:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40291144D50
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E9553008211
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 14:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0623E313276;
	Mon, 16 Feb 2026 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="HBGVAsml"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3797C3128CF;
	Mon, 16 Feb 2026 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253534; cv=none; b=LlTxtNmb0bRwRhvvy0whduHRgKh6UcdCGK5ue/GUEZr+bHakdJwNH2hsddVMAjx0bIXYHDM1hrsM5ZVkcfM0mYz/HzBUyvaxpzg7cSm9FJ7jlFT2F4ULaG8/+2j71sFeEW34Mu55aC3RB1meJRcS2WmcWfoCR0rUi/G6rzo3/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253534; c=relaxed/simple;
	bh=pp5KALY37BRgqXcaZ/tw5QIMdqA4TE/5rH42IBU2z9g=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=s3/CrQxvbbJTk0pLKIRpAJe4czbF+UTSIoq29i3Pl7ZOalvnjBJPWBQoVTVLjL31G0do60yaR2NUqE12gujjhmbz6k/lvccM8JJDI7o1ExKMrc2hsXTpyneNavU2fYYaJ+P/OrixyqbPUTx/iMIfilHwbDZLecZrYVHJW2EetYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=HBGVAsml; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=RPnQgcHxYfbqFjlRYnFLS1cwYlgOh/zM07Hp6vPSqdM=; b=HBGVAsml8V0fl71ZgnRoczazyI
	Der0yqO2h4bblNHhZAYf2fh6fL8owWxjRzX+m8xKcgS4ufglrfccsTPGkFVzD+2mIsYFYgxyfyKA8
	StXoXhESvNmqWNFM94SsXnR84zI3G60QQF8dVhvUKUWe7duwmqK0pvP9BQgwBbn43spk=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:34398 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vrzxD-0003SL-Gz; Mon, 16 Feb 2026 09:52:04 -0500
Date: Mon, 16 Feb 2026 09:52:02 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-Id: <20260216095202.0d28465b7059aaf8b7506f2c@hugovil.com>
In-Reply-To: <20260214010245.3671907-37-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
	<20260214010245.3671907-37-sashal@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.4 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH AUTOSEL 6.19-6.18] drm: renesas: rz-du: mipi_dsi: fix
 kernel panic when rebooting for some panels
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=x];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28257-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hugovil.com];
	DKIM_TRACE(0.00)[hugovil.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dimonoff.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hugovil.com:mid,hugovil.com:dkim,renesas.com:email,msgid.link:url]
X-Rspamd-Queue-Id: 40291144D50
X-Rspamd-Action: no action

Hi Sasha,

On Fri, 13 Feb 2026 19:58:37 -0500
Sasha Levin <sashal@kernel.org> wrote:

> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> [ Upstream commit 64aa8b3a60a825134f7d866adf05c024bbe0c24c ]
> 
> Since commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for RZ/G2L")
> we may get the following kernel panic, for some panels, when rebooting:
> 
>   systemd-shutdown[1]: Rebooting.
>   Call trace:
>    ...
>    do_serror+0x28/0x68
>    el1h_64_error_handler+0x34/0x50
>    el1h_64_error+0x6c/0x70
>    rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
>    mipi_dsi_device_transfer+0x44/0x58
>    mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
>    ili9881c_unprepare+0x38/0x88
>    drm_panel_unprepare+0xbc/0x108
> 
> This happens for panels that need to send MIPI-DSI commands in their
> unprepare() callback. Since the MIPI-DSI interface is stopped at that
> point, rzg2l_mipi_dsi_host_transfer() triggers the kernel panic.
> 
> Fix by moving rzg2l_mipi_dsi_stop() to new callback function
> rzg2l_mipi_dsi_atomic_post_disable().
> 
> With this change we now have the correct power-down/stop sequence:
> 
>   systemd-shutdown[1]: Rebooting.
>   rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_disable(): entry
>   ili9881c-dsi 10850000.dsi.0: ili9881c_unprepare(): entry
>   rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_post_disable(): entry
>   reboot: Restarting system
> 
> Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Link: https://patch.msgid.link/20260112154333.655352-1-hugo@hugovil.com
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> 
> LLM Generated explanations, may be completely bogus:
> 
> This is important context: The MSTOP commit (56de5e305d4b) that causes
> the regression is only in v6.18+. However, looking at the commit message
> more carefully — the issue is about the **ordering** of DSI stop vs
> panel unprepare. The MSTOP commit may have just made the issue more
> visible (by making the clock gating more aggressive), but the
> fundamental ordering bug (stopping DSI before the panel can send its
> shutdown commands) could potentially affect earlier kernels too, even if
> it manifests differently.
> 
> That said, for stable trees before 6.18, the triggering commit doesn't
> exist, so this specific panic may not manifest. For 6.18.y stable, this
> would be very relevant.

This analysis is correct.

Hugo.


> 
> ### Summary
> 
> - **What it fixes**: Kernel panic on reboot for systems using Renesas
>   RZ/G2L MIPI-DSI with panels that send commands during `unprepare()`
> - **Severity**: High — kernel panic prevents clean reboot
> - **Fix quality**: Small, surgical, follows standard DRM bridge
>   patterns, tested by maintainer
> - **Risk**: Very low — same operations in correct order, limited to one
>   driver
> - **Scope**: Single file, ~15 lines changed
> - **Dependencies**: Driver exists in v6.12+; the specific regression
>   trigger (MSTOP) is only in v6.18+, but the fix is still correct
>   ordering regardless
> 
> This is a clear, well-tested fix for a kernel panic. It's small,
> surgical, obviously correct (using `atomic_post_disable` is the standard
> pattern for this), and has been tested by the subsystem maintainer. It
> meets all stable kernel criteria.
> 
> **YES**
> 
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 3b52dfc0ea1e0..b164e3a62cc2f 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -646,6 +646,13 @@ static void rzg2l_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
>  
>  	rzg2l_mipi_dsi_stop_video(dsi);
>  	rzg2l_mipi_dsi_stop_hs_clock(dsi);
> +}
> +
> +static void rzg2l_mipi_dsi_atomic_post_disable(struct drm_bridge *bridge,
> +					       struct drm_atomic_state *state)
> +{
> +	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> +
>  	rzg2l_mipi_dsi_stop(dsi);
>  }
>  
> @@ -681,6 +688,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops = {
>  	.atomic_pre_enable = rzg2l_mipi_dsi_atomic_pre_enable,
>  	.atomic_enable = rzg2l_mipi_dsi_atomic_enable,
>  	.atomic_disable = rzg2l_mipi_dsi_atomic_disable,
> +	.atomic_post_disable = rzg2l_mipi_dsi_atomic_post_disable,
>  	.mode_valid = rzg2l_mipi_dsi_bridge_mode_valid,
>  };
>  
> -- 
> 2.51.0
> 


-- 
Hugo Villeneuve

