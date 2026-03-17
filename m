Return-Path: <linux-renesas-soc+bounces-29615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOGsOJ9tuWm8EgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:05:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E51862ACA41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F5D5302643A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 15:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65E73E928A;
	Tue, 17 Mar 2026 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="d9tCc5PK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B067271A7C;
	Tue, 17 Mar 2026 15:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759683; cv=none; b=Ey0wMVpXkklpD0kpDJ7lqdNI7j/uTS6w+hzIoObNwfUyYBdIwHzyPxQaAbYMu4rdgyoteyUBvTEUhk90WE6H9VVSlkF2yLIyEXJRVte239PeLVeWTGEbKJ5/C9/u48umM5Osv7DNt2F7Qu8uG0GlVlkuppq61Y8kS92GOz8sg04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759683; c=relaxed/simple;
	bh=LBJva8wI7KyVaQFf1bMjsCpiSAV6M/eEGMK9uKFDYis=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fwmTIGtI4u6fJxdHV4itsqWbgyMzQgBLUKRQ/8tHdwfRHOAX0IU0BN4W7M7kWppOMlmktxVGmnqnjxdhPFN/aPcZGVmCbm8sZvKRRu8S1uryLoMHMVE55aV9lPz7Zg5ssMhHzfhvni0pjzQaIRnQQZR2cKcv24Nf9x+LT2mZeiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=d9tCc5PK; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=XCYyXVnCj3LjH/L3tyOH+FjiqP5njEBjbPK3Y0oQ8oE=; b=d9tCc5PKiKdFmK9IDlg39Q9x5s
	QS87Zrf5sABWAqfjHXzhNr2q9Q0mFfvE0MCjWZ2NnEersi0XpOghy6BvtpGk+pkpXL9DkxlEUmAgN
	I0XoQdLoGuvvq5P81+klWWpFfZ2WwHXpU4LLEbd+ygErxqSDNOMOBg7UjMYldD9BsrKw=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61] helo=debian-lenovo)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w2Vuz-000000001s3-2rYt;
	Tue, 17 Mar 2026 11:01:13 -0400
Date: Tue, 17 Mar 2026 11:01:12 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Brandt <chris.brandt@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Message-Id: <20260317110112.338259354289bb60a57fc259@hugovil.com>
In-Reply-To: <20260317123610.329630-3-biju.das.jz@bp.renesas.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
	<20260317123610.329630-3-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29615-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,hugovil.com:dkim,hugovil.com:email,hugovil.com:mid]
X-Rspamd-Queue-Id: E51862ACA41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 17 Mar 2026 12:36:01 +0000
Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Move reset_control_deassert() and reset_control_assert() from
> rzg2l_mipi_dsi_dphy_init()/rzg2l_mipi_dsi_dphy_exit() to
> atomic_pre_enable() and atomic_post_disable() respectively, and move
> rzg2l_mipi_dsi_set_display_timing() from atomic_pre_enable() to
> atomic_enable(), to align with the power-on sequence described in
> Figure 34.5 of section "34.4.2.1 Reset" of the RZ/G2L hardware manual
> Rev.1.50 May 2025.
> 
> According to the hardware manual, LINK registers must be written before
> deasserting CMN_RSTB, and the 1ms delay is retained in atomic_pre_enable()
> after the deassert.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Seems to me like this should be backported to stable branches (missing Fixes / Cc: stable tags)?


> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++--------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index e53b48e4de56..9053ce037b75 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -484,7 +484,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>  	u32 dphytim1;
>  	u32 dphytim2;
>  	u32 dphytim3;
> -	int ret;
>  
>  	/* All DSI global operation timings are set with recommended setting */
>  	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
> @@ -524,12 +523,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
>  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
>  
> -	ret = reset_control_deassert(dsi->rstc);
> -	if (ret < 0)
> -		return ret;
> -
> -	fsleep(1000);
> -
>  	return 0;
>  }
>  
> @@ -541,8 +534,6 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
>  
>  	dphyctrl0 &= ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
>  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> -
> -	reset_control_assert(dsi->rstc);
>  }
>  
>  static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
> @@ -1030,24 +1021,37 @@ static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
>  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>  	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
>  	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
> -

This is not related to your commit message (coding style change).


>  	ret = rzg2l_mipi_dsi_startup(dsi, mode);
>  	if (ret < 0)
>  		return;
>  
> -	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> +	ret = reset_control_deassert(dsi->rstc);
> +	if (ret < 0)
> +		return;
> +
> +	if (dsi->rstc)

This seems new and not documented in the commit message? Is this a fix?


> +		fsleep(1000);
>  }
>  
>  static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  					 struct drm_atomic_state *state)
>  {
>  	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> +	const struct drm_display_mode *mode;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
>  	int ret;
>  
>  	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
>  		goto err_stop;
>  
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
> +
> +	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> +
>  	ret = rzg2l_mipi_dsi_start_video(dsi);
>  	if (ret < 0)
>  		goto err_stop_clock;
> @@ -1074,6 +1078,7 @@ static void rzg2l_mipi_dsi_atomic_post_disable(struct drm_bridge *bridge,
>  {
>  	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
>  
> +	reset_control_assert(dsi->rstc);
>  	rzg2l_mipi_dsi_stop(dsi);
>  }
>  
> -- 
> 2.43.0
> 
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>

