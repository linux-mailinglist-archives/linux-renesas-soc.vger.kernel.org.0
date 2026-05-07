Return-Path: <linux-renesas-soc+bounces-32271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LlztAPUJ/WnHWwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 23:53:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 687254EF7D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 23:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C0FF30297AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 21:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D95634C140;
	Thu,  7 May 2026 21:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XiA+ouV7";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pRz70iYR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40892F8EBD;
	Thu,  7 May 2026 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778190834; cv=none; b=V4mRk8HLVq+fouTWs6PsX1/eNklVBpTIot1Qe06r6G+8UwD9xZePU6n+aNdfRy8w+FyKCBzvIQ0Bv4hUxbws8mIDz7vc3gCr9G8zdkfMTMGFilGiy/AT0AaYCuhhgqfPUCpXWel4aacjN+FSgljKBfDhbcSoRgsUPDajfKsoqZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778190834; c=relaxed/simple;
	bh=dGZ2DZ8oN6uc5ihVECHMatrJC+gGm4uDt3Q9fk2imVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnwH9sqKdeKrI4pcnu94z6UDSRYOPZIqiPaWkOh3HOfCY3zHRhZljVYeyUzJZV4d8BLhJLzXfBIFI+jhImIN1Mxu2zk7rbP0yVDjUL3XNQ8TvcRr7eEcIRKuu/pT5PRGL7bDz7vBnz/ujCcKkTgxxrUedgfvWjsTwrpmD6deHSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XiA+ouV7; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pRz70iYR; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gBQxT5l6Rz9twx;
	Thu,  7 May 2026 23:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778190829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3x8MabeutXi5u2ZOxPKzmW168+rCRgMi6Wqf4CXVKE=;
	b=XiA+ouV74XwrFS2c6bCxNrbZF4lGYa1XCo8iercJWPL49ZdSe8kfdzB8tjApOutgCTcpnZ
	CqTOr8C3Spvpn9VDaukgaO9CEDWMwLOim3rETaGi0WwCgVCz8tORmem4S5klqT71tyGfq6
	q9/daLb4ik2BJIOnkME32/g+JPXC9XGddaYUMdpa/S+1doN8qVxZ9gZtLWxrxWC8E6as/Z
	zQT9I63YABLdE8Gixi4HDxY90zjgh2+NesZY6kmJ8NCAI6nLlCilWIqJnsvnMVOLyAqPSO
	C4FXpf1O/RO41PnpWwNARqkC57IT/LPzEnjQCL0Gq09yLkYwBxbwZXHn7OgaOQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pRz70iYR;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778190828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3x8MabeutXi5u2ZOxPKzmW168+rCRgMi6Wqf4CXVKE=;
	b=pRz70iYRIabwZds/zBkOfIz7ffBSzxWr8QrUffnhoqMNYGWEIlt7PVDu3K3nnZGwTE5Ela
	c7x1+KJQxV29dro9uGPtoHlPA1Vvt0AqPnuc5w5UIk0iKvhzBQLNCmfudJzjPtK01v18Yi
	mMes+3se5GI995OFeMmSW7mZK2RQxprHL+1Zh3kfAiX2js5MZR19b/+f5lyxcN/gYX/+Tm
	+uFD73FkDEVfHCgyks7X07UORDcPuVh/pekhNOJb6qiGjPQgUY5ulXsC99jbh8AMEO/8QT
	DFax6wvBEM+q01D7qMts5CKlCnHobpbPhD97DUSjnrQ6lOlhNpMBclmzNdgJig==
Date: Thu, 7 May 2026 23:53:40 +0200
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
X-MBO-RS-ID: 2cc6b046b50a6ef62f4
X-MBO-RS-META: shaqte9razzqy9pddg5m6mj3cujbz7ph
X-Rspamd-Queue-Id: 687254EF7D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32271-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Action: no action

On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:

[...]

> +  '#power-domain-cells':
> +    description: |
> +      - The first power domain specifier cell must be either the Module
> +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> +        datasheet, or a Power Domain number, as defined in
> +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
> +      - The second power domain specifier cell must be the module number
> +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> +        in the high nibble, and the Module Reset Destination bitfield index in
> +        the low nibble.
> +    const: 2
> +
> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the module number (0x00-0xff).
> +    const: 1
Just one more question -- the power-domain-cells second cell and 
reset-cells are always going to be identical values, correct ? If so, it 
would be nice to keep the description: aligned, and maybe even indicate 
in the description that those two values have to be the same.

