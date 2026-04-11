Return-Path: <linux-renesas-soc+bounces-31196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEWTAs2H2mkO3ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 19:41:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC33E1173
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 19:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 721D83015A63
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 17:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538F73BA25F;
	Sat, 11 Apr 2026 17:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWMe6+nM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2728C3B9DB3;
	Sat, 11 Apr 2026 17:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775929287; cv=none; b=uSoAFw7rqREACKMqb7EzgMEtT2MvmwlKjrpHLKIq48zmJ1+zmr6bfYoh6NbiwgyBUbBuqvK37oS8SXG1p/Qo6Wyc+vUcEZuhjIH3sMGaZadFx/dqfjinWaWgECfq92WHLUttK28i8R3QfIn0f3zJqeUInQj7oLsymM0h3/om0/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775929287; c=relaxed/simple;
	bh=/DQ7HVNRXx7m8000Zg8l40K+eA6BYCD8ejkHrrjEhvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qn3LtjL/HbzjNWmF11L60/8e+0f+q+W3Lq/zYVB5T16amBX4oCI61cSmUZ6i+2PHeGM8xWGNeYUwh+AYN/F8oePuk9KVeH3PahFkMg48uWtxo+zSunSWfDYY0r+k0MBOULRkZFisr68Me+9uf1E56jJln5kMaXi1WWYV42uaNjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWMe6+nM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5F8C4CEF7;
	Sat, 11 Apr 2026 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775929286;
	bh=/DQ7HVNRXx7m8000Zg8l40K+eA6BYCD8ejkHrrjEhvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWMe6+nMFoOGF2h+dtgHyWlmSQoPQjWvj9zanstYdWqXw2g+jZKO13PFK6frgUTj8
	 mQOrOgQk4gZm/cxm/6StK2WEHTBgtIwURY1mNPAbtL5LNRZJTPUNEk9IonpglI/YdN
	 c/zyGX73BjQMt/IZAoOdSkzJxcOUYNJ9UOHb22dyUOod8O3h2i7QNpqvbcjhBqRhWZ
	 QYHAeRFeL/39EzdU5MfMwebB84NWSl7HE/BRv2JI9vc6juBJejyziW9dMtSSICOJCR
	 yYdoazp1mDLrtM5PBtOJodUQUjWhtuEfMNu/2h5Z05fbeQ5l+sXd/ULHatW8MpU2p2
	 qMKm0NSkmAp4g==
Date: Sat, 11 Apr 2026 18:41:21 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] mailbox: prefix new constants with MBOX_
Message-ID: <20260411-malachite-phoenix-of-discourse-bdf44a@sudeepholla>
References: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
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
	TAGGED_FROM(0.00)[bounces-31196-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,cixtech.com,nxp.com,pengutronix.de,collabora.com,kernel.org,nvidia.com,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Queue-Id: 6FEC33E1173
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 02:49:12PM +0200, Wolfram Sang wrote:
> Commit 89e5d7d61600 ("mailbox: remove superfluous internal header")
> moved some constants to a public header but forgot to add a mailbox
> specific prefix. Add this now to prevent future collisions on a too
> generic naming.
> 
> Link: https://sashiko.dev/#/patchset/20260327151112.5202-2-wsa%2Brenesas%40sang-engineering.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> This patch improves the above mentioned commit which already sits in
> -next. It is not really a fix but it probably is still a good idea to
> apply it before rc1 to avoid confusion.
> 

Agreed and makes sense to have the mailbox namespace for these macro.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

