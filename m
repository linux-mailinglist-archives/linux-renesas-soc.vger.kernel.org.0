Return-Path: <linux-renesas-soc+bounces-31054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GzTKX5F12mIMAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 08:21:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A0F3C688F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 08:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC5983011C73
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 06:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058A3312825;
	Thu,  9 Apr 2026 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tecTUyot"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A862F745D;
	Thu,  9 Apr 2026 06:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715707; cv=none; b=duoDRsPh+RmxnPeXJqI6vuBtyb2K6WTmiNr1wTzCVpI423MyGvER90IWKPPydioyEc2vPIUu74gyNZR5YLUk3uuoQW3mNDswr9JYyE4cBLzOFOdX13u/e2r7vnmSL4hiKkmPfe6he0Eb0ai3b4qkgPPNj4vhxLqJf9rrYRLyoEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715707; c=relaxed/simple;
	bh=Qn4JZaehpW1D4FzWvGTsbu71VymBqoJqc9XDf7PqQm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGEf4uWAJgz1yUjrjo9XqeMtpx/i12qzBavfRmgj6k9a0r0zuHoOHwHAI2xOz2hjO8WhjFVufdrKjoSQ0nJrMRAAoRxWpSEYruUUXKbrA6F8QL5BXObe8vLglZsto7VLyN6E2zisWqDdnxwzH2srTIXuWzi0lyb4TfMFqeDam4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tecTUyot; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB46C4CEF7;
	Thu,  9 Apr 2026 06:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775715707;
	bh=Qn4JZaehpW1D4FzWvGTsbu71VymBqoJqc9XDf7PqQm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tecTUyots3nMLbmUJFf8QGczqvb8m49GlohSdWpE6TQVqQBaKhF+LsrxTM4w4hlrT
	 x2jzV+6L6pV1L+La6z4Ol34UMLrqGcnWPjyufepfm7SP7pKlyHFPJJatEjEDS/3Pz7
	 ARypbiyDyCPoY0EVN0gTlgdy1Nb/HyIyNf6PPfR/W5usmZ4GO2QWxcWfjz8K8u7aRU
	 gc/rjBgmykAR1JJ6Z7bmNnGiuOOqnNHu71T8f09cRG1bjAB5MDsfXZzNBOgepTIqmN
	 SCsgzvt+uDGzWCLe9l8TVM95rEH4EAepBuZrVQqIZHJQZ2focPUyH0fXqRXhEQzKhd
	 HdGBHZD58PJEg==
Date: Thu, 9 Apr 2026 08:21:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org, 
	laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6 09/21] dt-bindings: display: renesas,rzg2l-du: Refuse
 port@1 for RZ/G2UL
Message-ID: <20260409-stoic-accelerated-stingray-fbe025@quoll>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <8a3dd4df30a6d950e5f38d46f4d9f396da67aa71.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a3dd4df30a6d950e5f38d46f4d9f396da67aa71.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31054-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,ideasonboard.com,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 17A0F3C688F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 12:36:54PM +0200, Tommaso Merciai wrote:
> The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
> port@1 in the ports node.
> 
> Fixes: 2ef7cb1cea7d ("dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings")
> Cc: stable@vger.kernel.org

Please describe bug being fixed here in such case.

Commit msg so far explains none.

Best regards,
Krzysztof


