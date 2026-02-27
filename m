Return-Path: <linux-renesas-soc+bounces-28587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KPnJkgpomn/0QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 00:31:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 449EC1BF01E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 00:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3E8630DDAAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 23:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63261392820;
	Fri, 27 Feb 2026 23:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u08WgcF6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B18B1C1F02;
	Fri, 27 Feb 2026 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772235058; cv=none; b=GxxMpijHGEEJIh136kSMNSfzmjsf6VUiPXv1h3CYUlDKpFHZG/3tMA/ZMR0lx2/Swbwgqvg/TZ9LBGbE5WlkSbKOO/FASv38lF+JHKr8jZxBt09Y+BRYGw+Z3+tEGSuS5TKLTCMzBchATpeOxhsPazFmBuLE5Jgye5KShoUF1cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772235058; c=relaxed/simple;
	bh=Lwcc9URf14dHVzzxPtmFHc76iirTitobfd0XRDxX8Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VodkDdXpzpTJTgKciad0yDm72kl909sZgMHDDwjDw6WPDc6WDRkI6dZTf76UF1shgWBpe6v/FpBc+U3HDuRvrRj/w4DYaVmA7ZTcqNh3FA5gy/HcxIrKAmraHYN2lX1ZtbxpZAza1/nwb9JsL4U4CZA9unBIrftu0hfwQQ97ln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u08WgcF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3586C19422;
	Fri, 27 Feb 2026 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772235057;
	bh=Lwcc9URf14dHVzzxPtmFHc76iirTitobfd0XRDxX8Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u08WgcF6VOE4UW2WXxINT9tUE+z80VYkHkl8lpYH+0C/t4hBgwoSYmEI7fJktGJtu
	 acPA19t2lS+7bYJK4cXImNMlkiwR8AU/joUdK1ZoYJW4R/vFn0iSIOQMUrVYdpNaqi
	 yTS9kOtaaHpAfPTT2Sa7UCPhsDD3FuAdhUtcMN0GFESIC9GC/pCTtsgzgZN3vD8cUv
	 s3ES7ybw8A0sJDhkdbZWVkMoJIzyIRYnaN0FUqwlxIEyvl8oTDtiaztsoyKQf69Wk6
	 2nsOQUIqbs+rI+8sj+VN5CTPfiPJ/DBfpp3JmYyfhQwhHMdtEp6AmbMYx2QLqzyKfW
	 agt0YI3MwLLMw==
Date: Fri, 27 Feb 2026 17:30:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Peter Chen <peter.chen@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Marek Vasut <marex@denx.de>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>, linux@ew.tq-group.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 1/5] dt-bindings: usb: cdns,usb3: support USB devices
 in DT
Message-ID: <177223505600.967600.5996144600232538797.robh@kernel.org>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
 <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
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
	FREEMAIL_CC(0.00)[cadence.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.infradead.org,gmail.com,baylibre.com,denx.de,lists.linux.dev,pengutronix.de,ew.tq-group.com,glider.be];
	TAGGED_FROM(0.00)[bounces-28587-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tq-group.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 449EC1BF01E
X-Rspamd-Action: no action


On Thu, 26 Feb 2026 16:38:50 +0100, Alexander Stein wrote:
> Reference usb-xhci.yaml in host mode in order to support on-board USB
> hubs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Fix commit message typo
> 
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


