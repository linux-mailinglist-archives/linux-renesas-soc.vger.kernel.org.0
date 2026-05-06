Return-Path: <linux-renesas-soc+bounces-32187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHEeMq7H+2m6EgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 00:58:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7171E4E16E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 00:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 802B7300B9D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 22:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388E83D1CC0;
	Wed,  6 May 2026 22:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rk2TtR2S";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="f0q+JUWO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990D030EF68;
	Wed,  6 May 2026 22:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778108328; cv=none; b=A57sIe9hv7hyLEzPBctd5WBj0RuQt5Wq6D25kWj4h3ipQqfo2BgB+QasQGj7wjFP6oH7PyT2UlLJLMVLi0OQlqmWzFqX4HeCJg+6iAMfmxhGD74YR8p1hc/HBrihGiGwdi7911i+9pdF4yq6RDougW0gIbG0H/o51T1lc1TlIQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778108328; c=relaxed/simple;
	bh=oNLQZSbK04/prfcMLEioah991sa/+gb+evzqC4vuhIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sC80cxBmcKg9JMl5W7o+EM9VrHVA7gOlSJ0v0tMrto4nc2C7u/bD80bj7OXfLUKhyv+4u9tADCMNtnFl4PS78dYbp8wB7Kuoj2pgmofCHZ+nCj4e9ln5k4UbVBwSSJLdL1P/FGxLI6P/iiIhKvhqkwV8DH6ESzQht0d0dKZXoDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rk2TtR2S; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=f0q+JUWO; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g9rQl2TyWz9vCW;
	Thu,  7 May 2026 00:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778108319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDoZIe7cacwjgr2IgClnfQvj7kilI/Zh72g7ogapULs=;
	b=rk2TtR2SEO2oNt1Mhqh/TZQaAHEKk5x9u2Oy3WARJGQbfKEZu+9ubSIEmGwrRoQ/URnH7E
	qrwdFN40GZ5hvG4FBsRaOLDrbWqxo+9v0jbdpxcrrIWMB/jmEJ6WPJXK71whVJdmc6mtmO
	SXu1+XE5GN0Ns86v8Wo31EercEZ39oMgJNZOHzGojSpLbQtA1Lz1PROsfAnkFEP71b9Hvr
	7UBKRuFsPchRdatHNgIROxG6F/h0JI5vzMbUd/cpICHa/DvtmlZWNPjw6d8vGFwcj748RA
	FS4KahuuBDIaHm2nOGgmVHQHxSvQrLN63moWCMZs4eeOq8DUFjwX/1u1b27Ozw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=f0q+JUWO;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778108317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDoZIe7cacwjgr2IgClnfQvj7kilI/Zh72g7ogapULs=;
	b=f0q+JUWOkGRmhBrE1hoMgtbuAvmQpMU9IKyiIGcxcgLfLHo5EKQRlqadplNqAyenizG/LO
	iOJuyDV9AUUUfheNeME1txDR3uTGo75oAjHLXIcgW+XYlCKQJCeeyRn55j7jqdj98URlYc
	4XXQDgvT0kli2p1FXd13OKiTLnXEDy9Nzzk6xVqCa3mKLp8BfUzF9jw01T97HXSxKND3Ie
	LYb5laSnP9VER6YA3+fuQAz74AGvtGc3wUSvAbmSQ3asCtKtChGVHlByGzUieWvFUFpziI
	ijoad+dGP2r6K24qf14NYrRVhkpGbO4n50rn59j2kdNIauxFrH5OJ2DeC2fvzA==
Date: Thu, 7 May 2026 00:58:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
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
 <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: y67k4gbrwjrropr38ftqiejbbiydm78h
X-MBO-RS-ID: 09b24947cb12ed1c575
X-Rspamd-Queue-Id: 7171E4E16E5
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32187-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Action: no action

On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:

Hello Geert,

> +  '#power-domain-cells':
> +    description: |
> +      - The first power domain specifier cell must be either the Module
> +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> +        datasheet,

I agree with this part.

> or a Power Domain number, as defined in
> +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,

I do not understand this part, please see end of this email ...

> +      - The second power domain specifier cell must be the module number
> +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> +        in the high nibble, and the Module Reset Destination bitfield index in
> +        the low nibble.
> +    const: 2

I am unsure about this part.

There are multiple MDLC blocks, AON, SCP, HSCN, and so on. Each MDLC 
block contains multiple Module Power Domain Gating registers (MPDGn) and 
multiple Module System RESet register (MSRES) .

I do understand and agree that the first power-domains-cells cell must 
be the identifier of power domain within the MDLC block.

However, I do not understand the second cell. The MDLC bindings already 
contain reset-cells, which should be used to refer to a reset within the 
MDLC block. Resets within the MDLC block are operated using the MSRES 
registers. Why are resets conflated into power-domain-cells ?

> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the module number (0x00-0xff).
> +    const: 1

[...]

> +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> +
> +/* R-Car X5H MDLC Power Domains */
> +
> +#define R8A78000_MDLC_PD_AON			0x40
> +#define R8A78000_MDLC_PD_SCP			0x41
> +#define R8A78000_MDLC_PD_APL			0x42
> +#define R8A78000_MDLC_PD_CMN			0x43
> +#define R8A78000_MDLC_PD_ACL			0x44
... what do these numbers represent ? Shouldn't those be register 
offsets from MDLC MPDG00 according to power-domain-cells ?

If those are power domain IDs, then I am unsure why e.g. for SCIF the 
domain ID is R8A78000_MDLC_PD_APL in [PATCH/RFC 13/14] arm64: dts: 
renesas: r8a78000: Add CPG/MDLC nodes . Could you please expand on that ?

Thank you !

