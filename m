Return-Path: <linux-renesas-soc+bounces-32602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7EEtMNP6BGryRAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:27:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B053B6DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C1D03017005
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 22:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3806391517;
	Wed, 13 May 2026 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usmRqyuK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB03783CE;
	Wed, 13 May 2026 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711248; cv=none; b=hV0u4vvypo2SklKooc055+YHcBt60uaYeFO9P4VWK3j6XDwADp4QerQOXPPAA3bVJxAR0jpZMCQ+BFW/dm2YQMEjEbB2DNwM9sgQ1RT9DrAPQprUfRUuSD6yrx7lBvPG0KySFpnpio0SHWyR++J0HKP8xVviTTQGX0zzMe73yxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711248; c=relaxed/simple;
	bh=yMeTXDbCQEz8EGX5JoE/0Wc6TDDp9GFsAJU2DsCuFl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRf7KTsGzNp0/l4c+2ZMK3z4KeiHtIcKldyS48a0Ilb+kzJIcc5Ayo6Bl5sfrBHA4ZYji1HO7iIEVkAPHmEadgVM71Lsa3xdzuZ65eaKEqeFPM9R5xA0WENdCdnQL6PisRGRoesrG8FAdApjp3PKaRRMREL066nB3N4JaA7mA60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usmRqyuK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1CAC19425;
	Wed, 13 May 2026 22:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778711248;
	bh=yMeTXDbCQEz8EGX5JoE/0Wc6TDDp9GFsAJU2DsCuFl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usmRqyuK9pOiEvW8mB+vmkviwJba88lsn/0lKWzJt+QFxHCVq6mmr/ESnXb0hD5qE
	 QyHC86X9bIOw3ql53AjZRDwtDpW4Vp0cMJdDolQbIpYkfPWwFwVlkc+fp38oStO5Mn
	 vguMWBVzGCDkjVhT23lq7EKvbcFny8y+jIyghbw5NSqTJ5kh7ygHwcNfUH/Gs9LzxT
	 9jS9CUaTEC270aHe03fCDMC+hORO6IYt8jwHWhOSTFmZydaAhNSd+zDjnnjWrdhDMv
	 o3YWKb/5FLf64ufkpeASVLMyJIctLWNE/CiSxbqTCRmM+F0hzMyCGnX48VmC9k1ZqQ
	 lBcwEPGn3yoMw==
Date: Wed, 13 May 2026 17:27:25 -0500
From: Rob Herring <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/13] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <20260513222725.GA2069022-robh@kernel.org>
References: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
 <ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Queue-Id: 121B053B6DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32602-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.3:email,0.0.0.2:email,0.0.0.1:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 11:21:30AM +0200, Tommaso Merciai wrote:
> The RZ/G3E SoC integrates two LCD controllers (LCDC0 and LCDC1), each
> containing a FCPVD, VSPD, and Display Unit (DU).
> 
>  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> 
> Add compatible string 'renesas,r9a09g047-du' and extend the binding to
> support two DU instances: add reg-names ('du0'/'du1'), extend reg,
> interrupts, and resets to maxItems: 2, and extend clocks/clock-names to
> six entries (aclk/pclk/vclk per instance, minItems: 3).

Don't write what the diff has. I can read the diff for that.

> 
> Drop the "Each port shall have a single endpoint." constraint since
> RZ/G3E ports expose multiple endpoints.
> 
> Add a RZ/G3E-specific allOf rule mapping two DU instances to two ports:
> 
>  - port@0 (DU0): endpoint@0 DSI, endpoint@2 LVDS ch0, endpoint@3 LVDS ch1
>  - port@1 (DU1): endpoint@0 DSI, endpoint@1 RGB (DPAD), endpoint@3 LVDS ch1
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v6->v7:
>  - Rebased on top of [1]
>    [1] https://lore.kernel.org/all/20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>  - Use single DRM device aggregating both DU instances (1 DU dt node),
>    modelling single port for each DU0, DU1 and multiple endpoints for
>    outputs.

That seems like the completely wrong thing to do and you've given no 
reason why you think it is the right choice.

Rob

