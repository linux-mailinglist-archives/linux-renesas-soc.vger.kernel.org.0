Return-Path: <linux-renesas-soc+bounces-29640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHnwOfeiuWmiLQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:52:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BACA2B13AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 696AC304F32F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 18:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15F63F660D;
	Tue, 17 Mar 2026 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="H7qLQ8Ee"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0616D3F54CB;
	Tue, 17 Mar 2026 18:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773556; cv=none; b=Lm1uzDwPM7gGcvEv2P+aWuXcgvlP50Y6VoPX364PvnxrrK9bs+Ab2JmdExlSHHD9MQtNkNhA0XEMKiaxJt1Hk2aHmD2Lts05I7QOSSDZu/vX0ZvoCu71HN2VSz+2jXAbItucBqrETN7XMMZ52VD4Qd2pYDn6o5x9XRnUjZZ+1p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773556; c=relaxed/simple;
	bh=S52PQamOIiS7FO0lbQLNo7CLHPkPo8RyVB6dE/Wr1Ug=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rRPw/nd7tzz/RP+796lp+SJlt7jKf+H10tXSlL0HScswlcqb79PC+kw/qW1pF/dGFynNbWfyOaBKeNE2/Bnf4PmIwdr6/9DF28942nxpbPTv+YX/Rhq+ipfBKc+/xoA6/GjbwEZ2bw1VW2MaAaYOdZnxFRFofGDaNgnjvcShIUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=H7qLQ8Ee; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=lbEMV683ybNlBJAFBbt85OiP3go1IJLUYEyx22C0aAY=; b=H7qLQ8EeNnB2mDF9GiJZyAsruI
	CpiwnefLXZYYSCtqFNvJ8Ubba2H9bbPBk4misDxmqBGkykboZxe3e9xn4L5EDgVBQBqUxFggaMQEq
	63pCg7G72R1rQezkgb7GFa3uhb7xs4P6BigEKsog3zD3nlMnfMwOXkD8V/fyZXTPHrEE=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61] helo=debian-lenovo)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w2ZWl-000000004y3-0Uv6;
	Tue, 17 Mar 2026 14:52:27 -0400
Date: Tue, 17 Mar 2026 14:52:26 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: biju.das.au <biju.das.au@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Chris Brandt
 <Chris.Brandt@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Message-Id: <20260317145226.b84c29335c5badfdd257d0df@hugovil.com>
In-Reply-To: <TY3PR01MB11346B55F3F5C28FE9E763AF48641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
	<20260317123610.329630-3-biju.das.jz@bp.renesas.com>
	<20260317110112.338259354289bb60a57fc259@hugovil.com>
	<TY3PR01MB113462F9E8CEA0506984299768641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
	<20260317112052.3dc4b56b42b906381df80e94@hugovil.com>
	<TY3PR01MB1134627E19FCEA40819F8C6578641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
	<20260317121232.39b1728e4d53d7243856a403@hugovil.com>
	<TY3PR01MB11346B55F3F5C28FE9E763AF48641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam_score: -2.0
X-Spam_bar: --
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[hugovil.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29640-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[hugovil.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BACA2B13AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 17 Mar 2026 16:36:05 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Hugo,
> 
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Hugo Villeneuve
> > Sent: 17 March 2026 16:13
> > Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on sequence
> > 
> > Hi Biju,
> > 
> > On Tue, 17 Mar 2026 15:45:29 +0000
> > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > 
> > > Hi Hugo,
> > >
> > > > -----Original Message-----
> > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > > Of Hugo Villeneuve
> > > > Sent: 17 March 2026 15:21
> > > > Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the
> > > > power-on sequence
> > > >
> > > > Hi Biju,
> > > >
> > > > On Tue, 17 Mar 2026 15:13:07 +0000
> > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > >
> > > > > Hi Hugo,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > > > Behalf Of Hugo Villeneuve
> > > > > > Sent: 17 March 2026 15:01
> > > > > > Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the
> > > > > > power-on sequence
> > > > > >
> > > > > > Hi Biju,
> > > > > >
> > > > > > On Tue, 17 Mar 2026 12:36:01 +0000 Biju <biju.das.au@gmail.com>
> > > > > > wrote:
> > > > > >
> > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > >
> > > > > > > Move reset_control_deassert() and reset_control_assert() from
> > > > > > > rzg2l_mipi_dsi_dphy_init()/rzg2l_mipi_dsi_dphy_exit() to
> > > > > > > atomic_pre_enable() and atomic_post_disable() respectively,
> > > > > > > and move
> > > > > > > rzg2l_mipi_dsi_set_display_timing() from atomic_pre_enable()
> > > > > > > to atomic_enable(), to align with the power-on sequence
> > > > > > > described in Figure 34.5 of section "34.4.2.1 Reset" of the
> > > > > > > RZ/G2L hardware manual
> > > > > > > Rev.1.50 May 2025.
> > > > > > >
> > > > > > > According to the hardware manual, LINK registers must be
> > > > > > > written before deasserting CMN_RSTB, and the 1ms delay is
> > > > > > > retained in
> > > > > > > atomic_pre_enable() after the deassert.
> > > > > > >
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > >
> > > > > > Seems to me like this should be backported to stable branches (missing Fixes / Cc: stable
> > tags)?
> > > > >
> > > > > OK, will add fixes/stable tags.
> > > > >
> > > > > >
> > > > > >
> > > > > > > ---
> > > > > > >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++--------
> > > > > > >  1 file changed, 16 insertions(+), 11 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > index e53b48e4de56..9053ce037b75 100644
> > > > > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > @@ -484,7 +484,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> > > > > > >  	u32 dphytim1;
> > > > > > >  	u32 dphytim2;
> > > > > > >  	u32 dphytim3;
> > > > > > > -	int ret;
> > > > > > >
> > > > > > >  	/* All DSI global operation timings are set with recommended setting */
> > > > > > >  	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings);
> > > > > > > ++i) { @@
> > > > > > > -524,12 +523,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> > > > > > >  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
> > > > > > >  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
> > > > > > >
> > > > > > > -	ret = reset_control_deassert(dsi->rstc);
> > > > > > > -	if (ret < 0)
> > > > > > > -		return ret;
> > > > > > > -
> > > > > > > -	fsleep(1000);
> > > > > > > -
> > > > > > >  	return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > @@ -541,8 +534,6 @@ static void
> > > > > > > rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
> > > > > > >
> > > > > > >  	dphyctrl0 &= ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
> > > > > > >  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > > > > > > -
> > > > > > > -	reset_control_assert(dsi->rstc);
> > > > > > >  }
> > > > > > >
> > > > > > >  static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi,
> > > > > > > unsigned long mode_freq, @@ -1030,24 +1021,37 @@ static void
> > > > > > > rzg2l_mipi_dsi_atomic_pre_enable(struct
> > > > > > drm_bridge *bridge,
> > > > > > >  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> > > > > > >  	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> > > > > > >  	mode = &drm_atomic_get_new_crtc_state(state,
> > > > > > > crtc)->adjusted_mode;
> > > > > > > -
> > > > > >
> > > > > > This is not related to your commit message (coding style change).
> > > > >
> > > > > Ack. Will restore it.
> > > > >
> > > > > >
> > > > > >
> > > > > > >  	ret = rzg2l_mipi_dsi_startup(dsi, mode);
> > > > > > >  	if (ret < 0)
> > > > > > >  		return;
> > > > > > >
> > > > > > > -	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> > > > > > > +	ret = reset_control_deassert(dsi->rstc);
> > > > > > > +	if (ret < 0)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	if (dsi->rstc)
> > > > > >
> > > > > > This seems new and not documented in the commit message? Is this a fix?
> > > > >
> > > > > RZ/V2H does not need this as it uses different IP. Previously
> > > > > fsleep() is in RZ/G2L specific function. I will update commit description for this change.
> > > >
> > > > Suggestion: maybe move this to a separate patch, to facilitate review/understanding...
> > >
> > > The only way is to introduce a new callback to handle it for RZ/G2L SoC.
> > > Then we won't be able to apply fixes tag as it is not fixing anything.
> > 
> > I am not sure what you mean by that callback? How a callback is needed only if you split the patch?
> 
> You cannot split the patch.
> 
> Before:
>   atomic_pre_enable():
>     startup()
>       dphy_init()
>         write DSIDPHYTIMx         (F) PHY timing regs
>         reset_control_deassert()  (G) deassert CMN_RSTB
>         udelay(1)                 (H)
> 	  setting below link registers
>         − TXSETR
> 	  − ULPSSETR
>         − DSISETR
>         − CLSTPTSETR
>         − LPTRNSTSETR
> 
> Current patch:
> 
> atomic_pre_enable():
>     startup()
>       dphy_init()
>         write DSIDPHYTIMx         (F) PHY timing regs
> 	setting below link registers
>         − TXSETR
> 	  − ULPSSETR
>         − DSISETR
>         − CLSTPTSETR
>         − LPTRNSTSETR
> 
>       reset_control_deassert()  (G) deassert CMN_RSTB
>       fsleep(1000)              (H)
> 
> > 
> > In this original patch you test for the validity of dsi->rstc to determine if you apply the delay or
> > not. So in the case of RZ/V2H, I understand that it is NULL?
> 
> Yes, that is correct.
> 
> > 
> > > Currently this is optional reset, and it is no-op for RZ/V2H.
> > 
> > Does this means that the call to reset_control_deassert(dsi->rstc) should not occur for RZ/V2H?
> 
> reset_control_deassert(dsi->rstc) will return immediately as it is null.
> 
> or
> 
> We could add this check instead
> 
> 	if (dsi->rstc) {
> 	    ret = reset_control_deassert(dsi->rstc);
> 	    if (ret < 0)
> 		return;
> 
> 	    fsleep(1000);
> 	}

Yes, like Tommaso suggested.

But I don't see why you cannot simply implement (split) this change as a
separate commit just after commit #1, or after commit #2?

This seems like an optimization for RZ/V2H, so I think it doesnt really matter if
it does not go to stable branches?

Hugo Villeneuve <hugo@hugovil.com>

