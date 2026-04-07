Return-Path: <linux-renesas-soc+bounces-30953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGc/GzZg1WkF5gcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:51:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C373D3B40B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EE92307C8A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 19:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CC333A718;
	Tue,  7 Apr 2026 19:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oU98tDzX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130CA22D7A1;
	Tue,  7 Apr 2026 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591130; cv=none; b=rTl0nShbmvN+MDrF5m0xyAHI4MNR2fEw2q/4dMA/ni+ZOcebFxFFpsLqQwSOStfrrP3QP2ch0h9BdqPFcS8iHt8U4SfM+7wM80a/LNsLOaDEemxSH096JOKDdfI5td9vjy2tOauPadIPFd5cuTgqBU2IVxe5FPTpPOluvl/fO9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591130; c=relaxed/simple;
	bh=Ah8/FKt1VTydatHJgworMEuzZIhEAZk8RHGKfkLNyCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skxj0SnILaO3Qn9Pce8kKNg6j42wFjBMAXvQPVHolITatzC2NCHSrlhKwSNqNOnLgQU5QhuAW3TchtPlyP6JxRNj/GwZ05DxQLfVx5MPPx9CVqIfptmCX/lOJCxRDtAAGyCimPex4v7/4c91c68GMYiwqwUrXeQb26izf4Mo/Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oU98tDzX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63210C116C6;
	Tue,  7 Apr 2026 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775591129;
	bh=Ah8/FKt1VTydatHJgworMEuzZIhEAZk8RHGKfkLNyCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oU98tDzX3OV+BkNl1SOcj728FCKBfWdHypKLgkyXro2eHH9AunABq/SFd23eZm/Cj
	 QwgQ7K7ZsJFhC2qnEaJiKNMBQ1y2v1gNBezLmrE0miEAY0qDS6kp+Pcg+0z08zhLb5
	 9qztyFPpyhp60FjycCFs/vlcBWAT5sBy3hGUHfdiL+3eCGW3t4hn0VnSMig+H27gZy
	 OxDix21PfAtWjLjCX7QeM+YJ7x7TfgN24AMiRSkKXy6gQE6MhhPkQOc+bFkSJxRp+v
	 5K8VHkKjkn0XpQQ+7FcB2UXMpLoFzvTbX0h6kyWufvdKjbo7UNHUvQV5bfTxfkrp1R
	 5EN9nr3k4SKpg==
Date: Tue, 7 Apr 2026 14:45:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Olivia Mackall <olivia@selenic.com>, linux-crypto@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"David S. Miller" <davem@davemloft.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Thomas Gleixner <tglx@kernel.org>, devicetree@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/16] dt-bindings: interrupt-controller: Describe
 EIP-201 AIC
Message-ID: <177559112687.3558327.5810092232075238606.robh@kernel.org>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-2-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-2-5e6ff7853994@bootlin.com>
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
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[selenic.com,vger.kernel.org,glider.be,davemloft.net,sang-engineering.com,bootlin.com,kernel.org,gmail.com,ti.com,se.com,gondor.apana.org.au,baylibre.com];
	TAGGED_FROM(0.00)[bounces-30953-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C373D3B40B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 21:09:24 +0100, Miquel Raynal (Schneider Electric) wrote:
> The EIP-201 Advanced Interrupt Controller is part of a bigger container
> block from Inside Secure nicely named EIP-150. It typically takes one
> clock from the EIP-150 and offers basic controls through a few simple
> registers.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  .../inside-secure,safexcel-eip201.yaml             | 41 ++++++++++++++++++++++
>  .../inside-secure,safexcel-eip201.h                | 14 ++++++++
>  2 files changed, 55 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


