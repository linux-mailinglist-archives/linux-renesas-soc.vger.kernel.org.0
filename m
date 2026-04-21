Return-Path: <linux-renesas-soc+bounces-31445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAgrLeQu52mf5AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 10:01:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4CA437ED6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 10:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61F66300D144
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 08:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A91837EFEE;
	Tue, 21 Apr 2026 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onxTJEfF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C042D3EC1;
	Tue, 21 Apr 2026 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776758492; cv=none; b=YD9D23O/fJJzRf/AgNiO+kO/bzj3nLzV7QELXwoBetNjbL4DbaKdOpov4N02Pe3XYy/JAoCYWRtS9AEJT+bXbxSg8TEjh6Qhp7XMQCVnKD1vLzkXHQwhGpUlBF8QNipSDRsghvMP0ipCc2zj4luYvzmxE2+wstEt9Z24bwRZ7ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776758492; c=relaxed/simple;
	bh=Bh5LRx81nbqhJwYjgRVmUhWRtZK8Afq26DLHliNqUQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y979ovL1Z1AERRJG8t9CDwagD9DKDCKqbwGyK30720ENbRUIvU0gY1l5fVaTf0Oc6MH2hq0bWwoUZbrGBYY6h9sR94jJqSHLpRiff8DuJZVvX1DQrUjhfr86WaLcTn+gQdbXbr3sMPnP4f6OzW0cHdsztPVt8kOqgvckg6R5gBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onxTJEfF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60075C2BCB0;
	Tue, 21 Apr 2026 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776758491;
	bh=Bh5LRx81nbqhJwYjgRVmUhWRtZK8Afq26DLHliNqUQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onxTJEfFcyepC+3QmTMGPLzrFKWFrQIHJhWvIUp0H6bL59wPSK7h8qqZJSdzr+TO4
	 Ttk1WlQ6WyS8AD+jnDTKypCv3WVoPNu+6uRJs0ficKNS9OGY1yec1zlMdN1iWk1del
	 x5kiJfIrBj638U7mXv5wPiYSmZyZ7pxHkBOii9cADCKB0qXo7GUt6dUPpBbxkhJMn+
	 KClavwfNMF8Fzuji9qwiPV6U+bpGsY2xuOYMl+mSq9udqwMS7TtFwvu5tuslnH9vdG
	 vYVwzxK2jSa4osaBoTrnbupnZ7LHMdgHN94OduGIwiola9lZe/cgDuKSZNT84C7JsL
	 VMwfmxHLFewMg==
Date: Tue, 21 Apr 2026 10:01:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile A1
Message-ID: <20260421-attentive-cockle-of-finesse-e5bfb1@quoll>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
 <20260415233300.457892-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415233300.457892-2-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-31445-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[marek.vasut.mailbox.org:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 7B4CA437ED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 01:31:38AM +0200, Marek Vasut wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile A1.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

This might affect ABI, because you are basically requiring DTS to have
additional two clocks.  Probably it does not affect anyone, but
technically is an ABI change, so should be explained in commit msg WHY
you are doing it and what is the impact, instead of saying WHAT you did.

If there is going to be a new version, please fix it and please keep the
feedback for future commits.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


