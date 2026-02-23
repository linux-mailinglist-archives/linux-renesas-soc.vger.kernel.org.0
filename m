Return-Path: <linux-renesas-soc+bounces-28411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Dr9BpaPnGnRJQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 18:34:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BC717AE15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 18:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A533007F6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 17:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D8D3314B9;
	Mon, 23 Feb 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSn0GqUR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6CB2BE7DD;
	Mon, 23 Feb 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867826; cv=none; b=bWPEm2K2EO3DtjV1I1BqdQkrLYgwcxO9X+xZqhUsvwBEV4Jj5DpPVsHGXaaXJ1+quSwkw3jjbQ3dHPSt3Gt1ZuXZZUZUyVi8JIqtzCgi0SC2lz5BAnrfBNufy04YQAwILP864FteB2yUnNdVcJ+bsQLLlQoqve/Wora4z5chq/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867826; c=relaxed/simple;
	bh=ZIp+kH88X+B0codjMbbTpuBKbLjpavW3xKLfbpEfNXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuMt0giO/iAffMFPmN63TUgmN6ssWQZ/nV3xAhf6uDOPPQBLxnDZoXRxRF5Y7/EpMu5FiOrU6v2RH8VZjI9yJJIHfSImh9PmrnwEOt79zxmOqlMeqkKIVUK6bIEYuF+PMNlgkdNpViT3/52csWYnRzKbf6V4A9Fd9R9YC5V9VLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSn0GqUR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3DAC116C6;
	Mon, 23 Feb 2026 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771867825;
	bh=ZIp+kH88X+B0codjMbbTpuBKbLjpavW3xKLfbpEfNXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sSn0GqUR7vhTU5DIVNM7kuo2FSwuPUWI3LczA7UndLmCS+Aqc7cnuOaSyYYwA31rP
	 jJanQofNa540NlippSBZehdVE+iNA51eYptB0TlNcwGtWS4oj7w1CQGV1h7e+tfw9X
	 RuABMKZ6KEfIs4coZx53S4769hgox53TC5fDVjdc4ZE1ONYvzKlxSpznW0qIKLNN3b
	 bzqbb5angnT+xmBP80pH6nb106cXoSdSQ4k34NpM520/3j60RCQW1yFQQd7p5/Y7aD
	 7B8OP38qt/dglCLbKYObYgXOufBKAPbUzev04g3uYVoTDz/jO08mFs5AxrgWr8sSj/
	 ZXjO8gxOObCgg==
Date: Mon, 23 Feb 2026 11:30:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, linux@ew.tq-group.com,
	Pawel Laszczak <pawell@cadence.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Roger Quadros <rogerq@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	Peter Chen <peter.chen@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: cdns,usb3: support USB devices
 in DT
Message-ID: <177186782426.4146809.2746797277313553789.robh@kernel.org>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
 <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,baylibre.com,ew.tq-group.com,cadence.com,pengutronix.de,kernel.org,gmail.com,lists.infradead.org,linuxfoundation.org,glider.be,denx.de,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-28411-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tq-group.com:email]
X-Rspamd-Queue-Id: 72BC717AE15
X-Rspamd-Action: no action


On Wed, 11 Feb 2026 13:34:28 +0100, Alexander Stein wrote:
> Reference usb-hxci.yaml in host mode in order to support on-board USB
> hubs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * reference usb-xhci.yaml# directly (suggested by Rob)
> 
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


