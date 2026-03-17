Return-Path: <linux-renesas-soc+bounces-29543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LI0FAoIuWmEnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:51:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A33E92A51C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6666D301BCC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 07:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF62F3932C6;
	Tue, 17 Mar 2026 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGsDgrDh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA56392C3C;
	Tue, 17 Mar 2026 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733693; cv=none; b=aYT3zz8WTofHmtMx4X5Y2Py7SNZW3hZeDzdUalqDTcFQf2Tilu9HkBPDapIMMMkhRub+tmaZcP4xSwBSoq1MlQOd8PQClH9HPyLwbTZxyZVMfjbobZI6S23QpirahKzrGXonX+ZXxA0+dbOMZvgKNfjrqwlBBGRF5gKmMZ87pAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733693; c=relaxed/simple;
	bh=azG9yf+rqDVRcCgN41tgr864FUR7sxO4tFc1Tow86m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwElLGYTjAl49d+y9PYbMN5mXHsGbmtHhXajmdU3HWpNtfFLiV/k752PDP5vC5PHr9JJAVjY5FL+w4X1ldf6j/JRiDf5j8lHmz1fgoORgGkO0Mw4ZAiiIGY0gf1lnlTnDFGNina6vT7U41SkPZ3nJcP5XfYBcwbrAdacN/BSchE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGsDgrDh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2159C19424;
	Tue, 17 Mar 2026 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773733693;
	bh=azG9yf+rqDVRcCgN41tgr864FUR7sxO4tFc1Tow86m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGsDgrDhfEU/tOIVK2bJzaX9vtMCDRASm14jgp30vStaRs4t9qV5Vumo8vq9K6u+m
	 V44WzpMSV9iqkxHtMD3NoN3L6HhuvhxUQHJtwhkoKNJrDG0MTY++y5ro8t5bbmjHgt
	 CrhOaRFUp9LbO+VwB4uV6bdZqJDwWx8xvoo5tio6zBP/tdlXGkUkWVgImeydLTRigP
	 qcySAK4DVnPNO7g6G0RP9eVNjSZ0O6JZ8cgR9b1jQlVnve5K1Uh5fQk33XdOLG8Osc
	 gaDRMvMtRP6SNboFjGi0egdczVxtFWPjryCutfmJ1VMenIsIcJHmgyMYp+IKYsKsgh
	 liyf3DaauKgZA==
Date: Tue, 17 Mar 2026 08:48:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt: bindings: arm: add bindings for TQMa95xxLA
Message-ID: <20260317-fair-cocky-centipede-aac1c7@quoll>
References: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29543-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be,ew.tq-group.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A33E92A51C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:04:51PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> TQMa95xxLA is a SOM using NXP i.MX95 CPU. MBa95xxCA is a carrier
> reference design / starter kit board.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxla/
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


