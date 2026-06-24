Return-Path: <linux-renesas-soc+bounces-34397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8ot2OD/XO2oleAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:10:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF446BE729
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:10:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UJmZbtJF;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 642A2301C11E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 13:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9CF3AEF59;
	Wed, 24 Jun 2026 13:10:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5A28E0F;
	Wed, 24 Jun 2026 13:10:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306620; cv=none; b=N6CNoOZBHf9qvEle/S+oJHi91ljicUb3/IfH25nWylbgF429+dtvdDTQ/4fTzOvM/HTZdqGBD/2s8h4bN4aAatpOHMlah75xG+a1+WIf/26yLj3LlgQe0nsQylFDnSG3D7OJ3FCcRXFDc9tOtXSAkPemKCLl2bCxp0aU+haz5xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306620; c=relaxed/simple;
	bh=ZbK6nVA1ysTxa8u/JHp2FMaHKcnkB9wdMeMvpPYsm+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfA1YPBXdE/+8+SOPSCTAMeKHGlKUGj/f2o/gJbQMO/l3aQ8BS75xoc/xQ0DVFc7wxAyiK8MCG1t0eUEshPnhMl8dhgFBowzKybVgogLIzLKENhRhUjm/b7ahYRvznavUiMwilzmayvWNuItlhEmvVkddltuHzEKycaszxja18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJmZbtJF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA02C1F000E9;
	Wed, 24 Jun 2026 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782306619;
	bh=gQTOfWdw1qdEOgKqwNzVR7Pe01y3HaMQ9/zsv/ctqT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UJmZbtJFiDGZuKk+oxyxHxmOVjjwlf2PrzJBQ0W/VK8/shpCklgAx5ZSiowjXEDNP
	 lIMFdlglSHIJRenUx0LhvtJuMxW27HGieQKwwZcVkQ0gas6Ug2+RFVq685c6UIjqMd
	 m+CKpnotDFCJUZRdBS+ABSHFoJ136FK11xwJt0LiKy+2qS8v5Dx7/CvDWtCMbamktE
	 AHlAMOdMw9BzgIwZ9XGXhQtlt94KIye1QWJ0pxgoj7KQlgow/eBiPPDM5/hyPOeYI7
	 zA/8OmZczX+lw66yiKAZyPcQ8xA6Hde98vt5CtNRgwL/HDm+WPkkuG4xpXMiqi5v1o
	 YhX6/RZ9J94KQ==
Date: Wed, 24 Jun 2026 08:10:18 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace
 clock in R-Mobile APE6 example
Message-ID: <20260624131018.GA4064376-robh@kernel.org>
References: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34397-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-arm-kernel@lists.infradead.org,m:bmasney@redhat.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FF446BE729

On Sat, May 23, 2026 at 09:25:50PM +0200, Marek Vasut wrote:
> Since commit 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks:
> Document ZT/ZTR trace clock on R-Mobile APE6"), the APE6 clock node
> expects two additional "clock-output-names" entries, "zt" and "ztr".
> Update the example accordingly.
> 
> Fixes: 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for rc1.

Rob

