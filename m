Return-Path: <linux-renesas-soc+bounces-34915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bO9LDmXITmr/TwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 00:00:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9172ABE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 00:00:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wqwYngLV;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=sw8ZGUcl;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4ED931662B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 21:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EBB3FBEDA;
	Wed,  8 Jul 2026 21:56:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887443FBB7E;
	Wed,  8 Jul 2026 21:56:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547773; cv=none; b=godVnrYlRiWSS/8K1nMV8felnxB0cm9aF3+9JhhuZUmwBRyaCbpuM76dSyvQb7YcVF78T/0vkwzDl8QHc85HDKpKnSHjrTourVFASXRE36/3XkenGITCX10vessXEpKDNy9Y3QglJqKaEom89o1JB97hQT14TBunFk8sUeLlmkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547773; c=relaxed/simple;
	bh=L/V0i+tBTm3xM5Y3CascIjVDxfqTLbMhc/kcakfbtN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOMDK/MFZlgwsbQVvtmaLi0Kfrh3bnVpblzQz2Ue1wplQOJ2lUBpaDiStBM+5u+jDVWlEz3ntQ2Z9v+pDUjY9isPnGI9xrKygWw6vorpPrnPiOQyPTeCStKJuAvzEXP+vr19r3xXbCzPBHxttU3bHjHDnqwVieloLqJG40yMGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wqwYngLV; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sw8ZGUcl; arc=none smtp.client-ip=80.241.56.151
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gwX3R5DgLz8v4b;
	Wed, 08 Jul 2026 23:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzvBEeJ5wdYXClPXLrmc2/W46aJenc8FFAfoLDxjZi4=;
	b=wqwYngLVVmMeY2bpMaFiVTrMKc0ovlIcK8JL1hGtGzfUSV70WkKp/hXAbjWxZ6DkFeT/uE
	TIAJJo1tnFC2PRxiTS8pLkKE1WtkMJfxlUzq+ia1VCZlExZKdplL0hXNS8nMU7H48UJV/+
	HoRgnSl5sjTmb7NF2SvcKZIuriTMp1jLqyoFwcedzh9hQtoAiopJNYLTXOgmHHsFmkzl5z
	96QcIcFixt+GgFGyNaOZOm+3s5y1MvXjP3wUEVlOXluRQOyJQPOsXrZC1DFKPKUmvw5lja
	KZQIXaz6b5nXc1BuqrOlUgbsxKoOetg2J/QL1NhCGLa0D4y8YOECYVxmPBjU1w==
Message-ID: <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzvBEeJ5wdYXClPXLrmc2/W46aJenc8FFAfoLDxjZi4=;
	b=sw8ZGUcl5e3xihbCg2aT+g6H4ko5yZcdtxzrqesfKSBURVIqY2cbMnr0FBZFggidxEcvdJ
	ZD8Mzyx+0bIiJJAbfzzGOwrQyfNfC+cXf1iOb+8Jywj5V3QOfZJDgQK/LI/7XqZMQmi/5X
	jIV2qZPAtS6ptTEls1CFj0bjOuKp2Eryyq27A9MKDCuE3f5OIntcrejoH21iyn/hFi4UMb
	aPIRlYzabNymh/vQeRfijsiwJ8cwhm4geK8NdZMEL1FaNi5uk75OwBc2mPklr3QBL+fM84
	Lx8tLm+rDlVsVGhyrAIrFq4DsK4P9EJ9NP28hA1+yHs/betaDEHzC9wgRSpuIA==
Date: Wed, 8 Jul 2026 15:07:30 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1783505142.git.geert+renesas@glider.be>
 <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ox9kdwr3htbuf418b9dpqo5cy4n7x8wj
X-MBO-RS-ID: 08bf7c3d4b9e58172e1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34915-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82D9172ABE9

On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> Add device nodes for the Module Control (MDLC) blocks on the R-Car X5H
> (R8A78000) SoC.
> 
> Complete hardware desciption of all (H)SCIF serial ports, by linking
> them to an MDLC for power domains and resets.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

[...]

> +		mdlc_ddr7: system-controller@e8380000 {
> +			compatible = "renesas,r8a78000-mdlc";
> +			reg = <0 0xe8380000 0 0x1000>;
> +			#power-domain-cells = <2>;
> +			#reset-cells = <1>;
> +			bootph-all;
> +		};
> +
> +		mdlc_hscn: system-controller@c9c90000 {
> +			compatible = "renesas,r8a78000-mdlc";
> +			reg = <0 0xc9c90000 0 0x1000>;
> +			#power-domain-cells = <2>;
> +			#reset-cells = <1>;
> +			bootph-all;
> +		};
> +
> +		mdlc_rt: system-controller@19440000 {

Please keep the list sorted (0x19440000 should be before 0xc9c90000).

> +			compatible = "renesas,r8a78000-mdlc";
> +			reg = <0 0x19440000 0 0x1000>;
> +			#power-domain-cells = <2>;
> +			#reset-cells = <1>;
> +			bootph-all;
> +		};
With that fixed:

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you !

