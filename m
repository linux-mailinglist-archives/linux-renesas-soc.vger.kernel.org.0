Return-Path: <linux-renesas-soc+bounces-28296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8lLUK39ulWmgRAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 08:47:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9C153BE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 08:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F0393004C88
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 07:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4DB3081D2;
	Wed, 18 Feb 2026 07:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VupicOOc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3413EBF02;
	Wed, 18 Feb 2026 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771400824; cv=none; b=XryVULgF5gXlqjfuaFIO6j3owQMstxp901VqP5QwpNrd8BbZdywm6HMVIhZzrdw+xvNpyLWI2Yr3RZMD6JtI/GRt3oHD7AL2Jddu9vn0mBXuFdYR4edOcoRbAWxjQhPkXOxxqugQSaOOrH3kAgqWTg/m9xMxLWeaWJDVYdwp/Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771400824; c=relaxed/simple;
	bh=x3uMMgrQz5LgkjVbNCzGY+sKvBJr5F05qUWXDzQChdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT/XQH8cLIN0aeA+LNip0qOb7Rzz26kIvyKWa0AOPURYlfOSl7WGyEFQS7IHJWXcZymsOLjKcITL1GMfzyXJJSOxaJNelXq0cPvSpj+TvX9XIyAPDHI/j0IyHs+5EkwT2FFDFuZHmZlviXvhVzqBjqUxrkNojddMMI/eQ6lSM8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VupicOOc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20721C19421;
	Wed, 18 Feb 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771400823;
	bh=x3uMMgrQz5LgkjVbNCzGY+sKvBJr5F05qUWXDzQChdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VupicOOcDLjE7thhBzdPmlHxO/R7scUlUGDRMXtpFCbWNXWP+5TYIRpJp0bI35Sm/
	 uOa3Z9yNWow3EcHs2Z8goxqS0zRpAknz0GmTEryr8asmZGGAAW1najVGzuF4wjGeSC
	 FZRf+dtY6EE+T2i/u9K5wrjlct4zJ+ljZu4uh40zTsvs/jPKGldeHqyvQVp9SykNBy
	 qB5A0GSY8yNrgcx55sRjbut41Ekd51LdEkwYY+SRtAdAhLDXNSoyrlZbLQ5ML7+B5I
	 DRwp6amOS1Eds89CXF6MyTvOqZLJHBxJwg/RcOlyQVDC1XnzH9GU4eHsUHnU+02pDY
	 OddIM5djHWwqQ==
Date: Wed, 18 Feb 2026 08:47:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] spi: dt-bindings: renesas,rzv2h-rspi: Document dmas
 property
Message-ID: <20260218-handsome-wakeful-swift-7be541@quoll>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
 <ea6ed3b82c5a326732adfc0fcdb2922bfcad2591.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea6ed3b82c5a326732adfc0fcdb2922bfcad2591.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28296-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,baylibre.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DEF9C153BE8
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 05:23:46PM +0100, Tommaso Merciai wrote:
> Document the dmas property to state it must be specified as TX/RX DMA
> specifier pairs.
> This clarifies the expected ordering and improves binding readability
> without changing behavior.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  - This patch depend up on [0]
>  - [0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

So just squash it there....

Why are you adding comment to correct code which is in-flight, not
applied? Just REVIEW the other!

Best regards,
Krzysztof


