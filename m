Return-Path: <linux-renesas-soc+bounces-34385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EktNFGSmO2pTawgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 11:41:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB16BD04A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 11:41:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CJshYpNX;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 795303010BBA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 09:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773BB3B8922;
	Wed, 24 Jun 2026 09:41:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768703A782B;
	Wed, 24 Jun 2026 09:41:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294102; cv=none; b=EcgfoVBuUqXKOqZE5HqjfkPvjK9e4Jw5DyUf4D8QbWnm7MNPMMj7vZHlK2K22xroT9/4GwadrC40UT1x5HTwu75Rbl44nN9S5QcUYecxK4GdU1qP3aNLtGyusvoNQFCqHpOXZTIDBsS06U7b3ymuTLzNX8AyE/3fllVsPX7pBVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294102; c=relaxed/simple;
	bh=0ARcy57yhCmFwp8XBYd/7T5rk11cP9t+HAJcbxN51jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqXAjziXFkuwpRsZpRAt04BGc56/xDj+CAwjXxnYrdoNW6Gh/+j5YW1fa6vsilN3Gg64nL8Nw7/bRP2sW5FsTP5271UAkYNUs5sXeD0hDEW9YlslHk7RSmQLPFR97pK01lyDX3Ff5ysmQP4pYi8q4mYquiwaINquet+ULlA3xOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJshYpNX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E611F000E9;
	Wed, 24 Jun 2026 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782294098;
	bh=SiKhRMofp8HLMU4VsMK7pmTBrxy4O47vi3cOBi0Af28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CJshYpNXSFVkYq4KPkj9C7cJxRotU5Vqe819FM9T74tX4InFeZfNa1On7qw0JuEoF
	 eB37t6x6nXmhefhLD32WqqE4O7ddLOOzmJDvsCTDl/KJTJJZ7j78zmL+PRcI4vR95n
	 9GpfhYADcxcpUqUpRRpNgCjn/imae85+QepUBCtwdza6R591yMVVKM8NHlCPYHuEpi
	 iI10bcTxn1WlYNOw5EoJMUwukpwlStMSb9CIN0ripxXp0bluT9CcjRzete0u7xLGI2
	 zqurpkby+5u/bfR78JODIRiVIxtU1O+hnMBITvbPV6CFAR0CRqC+yYm2uAf+evtXny
	 gnMsC1DeLSNgg==
Date: Wed, 24 Jun 2026 11:41:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Brian Masney <bmasney@redhat.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Message-ID: <20260624-advanced-pink-dinosaur-ebe720@quoll>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:alexander.helms.jy@renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34385-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,renesas.com,baylibre.com,kernel.org,gmail.com,bp.renesas.com,redhat.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0AB16BD04A

On Tue, Jun 23, 2026 at 05:20:37PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Alex's email is bouncing. Update the maintainers list with my contact
> details to take over the schema maintenance.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref [1]
> [1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/
> ---
>  .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please also update MAINTAINERS file.

Best regards,
Krzysztof


