Return-Path: <linux-renesas-soc+bounces-32609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG4dNOsJBWoeRwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 01:31:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3553C01F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 01:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFDA03019FEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 23:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E2E3B7B9E;
	Wed, 13 May 2026 23:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZbEZzfdN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EL8Z9YTl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007323CAA5D;
	Wed, 13 May 2026 23:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715111; cv=none; b=eQczuAgNHzKRyphZed5eX9lvOgmuXvMaOHlzm0ZqrZiXCNFKp76EQKI9QA9jsLOteaM5n5TzsEdqmJv/tknWwaupAx0egXV0RcDCeHOprE7FgZE4p6Q/ufaI6QQoFWzHj1Q5HzQn95PZMy4jPEruI128fACxsdHDm5Y/M2miXT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715111; c=relaxed/simple;
	bh=eQGOXdB0CBovIWGJ7egFaGigS8NYtK1YuuMzaYsNTSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a64z3iBwmQdToG4+0n1ZDlqI3qvaGXHaJs/VUMmnrHtkhcduRkwXdSmsAkTXaewATySeB58w/8zoaXmL2u17AQcV4GmQegKOuZpWivHfacVzmvQ5U+PZJO0a3B89ztsytW0tTpIWBZzjiimYeNQiEpS8LIjLPkybYOA0nUP4RKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZbEZzfdN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EL8Z9YTl; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gG8qc5q18z9vGq;
	Thu, 14 May 2026 01:31:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778715100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1GVpz7zUi0aa32m2cLjJs4osxlT2wkEWkq8DiEqL8I=;
	b=ZbEZzfdN3v96XPb1O7zJC0ciUUh4M2SjH3OQrY90BC2BH7uTZpha7MN6f0r6X1lToXO55q
	amrwRDoxkWaP4uZ581Y3gFqS1cw/HOafkrI4bwlnktbyOMXPcbtN8uUj286CHKO0NlJwRf
	0zR4ETqjCbi4G4jlqwdSKx0AHbfQWOM75ZMVWiP8awO7icpIq9YEQjVd7dOHAlyalvK2wN
	hpe7ViRgOtWo6/D3gczNUjZ6/Fj7nZAYu5jolp+jFtG4lGP9ziagmZgVcMVNZ0tjg76pjY
	DAGRbtim3VH525UeI2C4FHYynWF4AfflNPV6XePjo8UzsIqhcQZpwSECw9pDaw==
Message-ID: <58894f67-1985-4e0f-9648-c568f681691b@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778715099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1GVpz7zUi0aa32m2cLjJs4osxlT2wkEWkq8DiEqL8I=;
	b=EL8Z9YTlqG8TBCL8ROv5ei71tdSRBfdXblm1gERwQiHWGK/FlK2i/kJBwy56oamGOzeRkK
	LwGxkQ7j/gExtd+mmeZO9U1ha+p2+OHUUk/abKthMkRa3lEmpXQ28tLhFgceJwZAGcQDWt
	vPCaXrB9uxtXWZEojnc28g5kkfuTqCWQJMhMy0OZ1MiWHRSI38h0ZL1jyPijZxepHomNsa
	K2chfG4va5Vt0fXST0lIowaxK/qI1jFGOm9tDBts62OjauiiMvnwmLlXGm9k5aRNEwFx5D
	o5eunE+4IYtBZQaI+tiPAlEJWmPsNGFtjlQOP309kTlMnSI/jcpFyhsVK/uu4w==
Date: Thu, 14 May 2026 01:31:21 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH/RFC 04/14] arm64: dts: renesas: ironhide: Enable SCMI
 devpd, sys, and reset
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1776793163.git.geert+renesas@glider.be>
 <2eb3c62df7b6ccedb525569fe34c10403e2fdcf5.1776793163.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2eb3c62df7b6ccedb525569fe34c10403e2fdcf5.1776793163.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 9oi1c88nhrnr1xcg6nynjdfitrstd1r1
X-MBO-RS-ID: a9fef77da217165e93b
X-Rspamd-Queue-Id: 4BB3553C01F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32609-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.16:email,0.0.0.12:email,0.0.0.14:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.11:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:

Hello Geert,

> SCP FW SDKv4.28.0 and later for Renesas R-Car X5H Ironhide not only
> implements the SCMI base and clock management protocols, but also the
> SCMI power domain, system power, and reset domain management protocols.
> 
> Enable support for the latter by adding the corresponding SCMI protocol
> subnodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> index e2470257d2f32a03..2fb9557a7eb9dbb7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -31,10 +31,24 @@ scmi: scmi {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   
> +			scmi_devpd: protocol@11 {
> +			    reg = <0x11>;
> +			    #power-domain-cells = <1>;

Please indent with tabs.

> +			};
> +
> +			scmi_sys: protocol@12 {
> +			    reg = <0x12>;

Please indent with tabs.

> +			};
> +
>   			scmi_clk: protocol@14 {
>   				reg = <0x14>;
>   				#clock-cells = <1>;

Here it is OK.

>   			};
> +
> +			scmi_reset: protocol@16 {
> +			    reg = <0x16>;
> +			    #reset-cells = <1>;

Please indent with tabs.

I hope it helps!

