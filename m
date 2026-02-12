Return-Path: <linux-renesas-soc+bounces-28170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MlKNvC2jWl96AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 12:18:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 754F012CED9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 12:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84CD73014650
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 11:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B7732938D;
	Thu, 12 Feb 2026 11:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJNwmr+x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BF929D29E;
	Thu, 12 Feb 2026 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895039; cv=none; b=CTSAmuFLbqB+Fs130TCAS937OoETk6b+4E0Y1DJwnplFi1RK3q1hzluH9VRb4IO8UDJj5+Ov+jSZrrRVNpD1dnfRrIUrrn38gehTaXGicl+ps2F39Fc8cG6HChlwBAiKmAX3mKd5CWMxGDQyHCvEJlv9wBCFxUkrFcbElRHICeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895039; c=relaxed/simple;
	bh=OE95iEv5hbPxhjUCx2mMjsub+XUE22v7OakoLEelgVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilaIuUbK42O8g1TB1SR0RUhUYi71PokHsnuQRJYwIpZf/UCyehAaQTpb4wL3D24tKetm+I/vGetRM2avNm20+FuochIO4IbmZ+m8FL5pvv3XRbQowCCpbEx93QJ2hcPG800m7231rRKdIG3ZAN+z3loL+03QNaLbhOeB7WXa+7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJNwmr+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606E2C4CEF7;
	Thu, 12 Feb 2026 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770895038;
	bh=OE95iEv5hbPxhjUCx2mMjsub+XUE22v7OakoLEelgVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJNwmr+xLGPlQ/JDiqh03dsABOaOdsbwQpJBXvNEuRa/nSHhhN+ug367o00A9EJ3B
	 LmIIL6t7HuqEqAor0q9+qFqkReSzi/qoeajF2nR0+cGr466r8L3vVXiSkjluj0N5QE
	 h2fO6k+trYuckwiZVqQqee7aBSNFfjO85OYNHmWpCHRd2VIXge2KnPUsoGjvnGFUbx
	 rqh78fKf75yWz0yxQXi/FiID9nA/mmGa3CNyBI7hBFe0dhCeL0NwqqA6Fhqd6ZKaCO
	 J261hyDvN++QBfnTjjGK/VreMU1p6hDAgqJz0oSq8OS+Cp7rPTxlYFNafMbGodczpP
	 UP3ZTow/9zkcw==
Date: Thu, 12 Feb 2026 16:47:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <olteanv@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local
 devm_mux_state_get_optional()
Message-ID: <aY22u1rDDWuU53zP@vaman>
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
 <CAPDyKFpY2X8hephSfHq7rj_DaKX76ZSkWSCYXrGTEBUFHkvOzg@mail.gmail.com>
 <aYyrsPTH1923jV7y@vaman>
 <CAPDyKFo92pOimvtGdN4yvFtFkc3vB+ex2OH10WmoKXcVSS+iAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFo92pOimvtGdN4yvFtFkc3vB+ex2OH10WmoKXcVSS+iAA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28170-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,renesas.com,linaro.org,solid-run.com,sang-engineering.com,bp.renesas.com,lists.infradead.org,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 754F012CED9
X-Rspamd-Action: no action

On 12-02-26, 11:39, Ulf Hansson wrote:
> On Wed, 11 Feb 2026 at 17:17, Vinod Koul <vkoul@kernel.org> wrote:

> > Should I drop the 8bb92fd7a0407792 and it makes things easier for
> > everyone and then we can pick fixed commit for 7.1 cycle..
> 
> Well, my pull request for MMC was broken (the mux patches didn't get
> properly tested in linux-next, until it was too late), so Linus will
> not take it.

Yeah I saw that one, sorry for that

> At this point I would say that 8bb92fd7a0407792 is still a bit
> problematic as it uses the same name of the helper that the mux core
> intends to use. It would be better with a phy specific name for it, so
> it becomes easier to convert to the common mux helper, later on.
> Although, at this point it's still okay as is, as we will need to
> defer the mux core changes to v7.1 anyway.
> 
> So up to you!

In that case, I can keep as is for now. We can rename the api as a fix
and proper changes can go in for 7.1

-- 
~Vinod

