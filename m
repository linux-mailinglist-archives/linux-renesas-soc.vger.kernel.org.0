Return-Path: <linux-renesas-soc+bounces-34912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dhh1G9PHTmqyTwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 23:57:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D672AB46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 23:57:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=iJMDKEbY;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vAinF9H8;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94F1B30ED2E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 21:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F5C3FBB5E;
	Wed,  8 Jul 2026 21:56:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AFE3F787B;
	Wed,  8 Jul 2026 21:55:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547761; cv=none; b=EDScrZP54faieukX/h86yEsXnB5poVCzu/FSFiEPywvoXYpuCLmbr7Nzt6PtbQbmiJTYvWm3PdgStARZiMVdC04HPgF/kKL8KW7YFrxx8/wlqlR5svRDUyy3ty4rgIRWiKp8KiMbeHo/7ktHyqxDisgrouLoAxybhT4nPI8o9Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547761; c=relaxed/simple;
	bh=aqbq3MbKamEavxx/DQE5lkfZzeNuTkx3XxEgnidbj2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vpm/LpUdTK6Vw0eumfRvGA45SszCsPuA8HqlpSoCmkqK18SgzEGamX2vN9iEOyw9jcu7AQHUZAetx5g3VHmZTsG6lvY88ZtzS1w+Sj/QrFZwviQQA74d1uVrF3jKkQHmvr5atPOyQXRuNR66Z9DQmy2HVhS/y0MF7P3eSPhYo5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iJMDKEbY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vAinF9H8; arc=none smtp.client-ip=80.241.56.172
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gwX3C6zbmzMlH6;
	Wed, 08 Jul 2026 23:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BC1xt3U6mv0ThZ0HpbTY/TM5EPeMYpFZHKvVhnEdkt0=;
	b=iJMDKEbY61gAoZ14a5iYqseNegQINPiC0SHMANNzvWz97euF0D5KWV7RDzPR68wZNobLgy
	PyledHyVnq5nj9qhjCS4t0zp3/8iWREWd1afnseaxmrC/yPOWGTC1zzLtO1bSaRRlAqRwp
	ocqjXhb6T8gra0Juwc+lDlPaJlss08B/w6ua5dT3pNHk2mUWvCokPNYostj53mK3futKXd
	yuPSGuHa9gKGSqOz6dW5timDiLf1IH4t4Hy4GLqdwmzkSzhgkxmyibOtQF/iZHOludJIxQ
	/CJNWxTcEchdCHTrIQfgT81+valKzAkMbzUFzitT0YwIWHfZdPolxdwPlBmzdA==
Message-ID: <80a31a21-9876-48a7-a9ed-baac4f87bc11@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BC1xt3U6mv0ThZ0HpbTY/TM5EPeMYpFZHKvVhnEdkt0=;
	b=vAinF9H8piMFbSnVT7eoVjPaZOCwOyUyA+dvZgqr7pbw6EF/AS1S+qWfA6hSn7mHtR5P9u
	M9x+pr4fIplkrqDIO/SovotBZAp5Np1j//ykEpvzKcVEq1/b89KNMn/k8Pmx/T1NQUgHRW
	/CckA4hwZXJhQkw9/6Vj01O+WdZ0usajWempmFdsDlmn6F/D4OrUTSkE5mZKz4xeYrQHUS
	4kDKqfKhr1tETdjB4e9XdulrtMmKRM33+r1231OBJnuRL/HKMJiBSaK/B0CRO83BqiBLvf
	27G1sMfKjgjs8FzTuYE/fD1DXUcTxZ03haENO0D8gRV8cyoLdxhxPgAzVt2NDg==
Date: Wed, 8 Jul 2026 14:40:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
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
 <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: ef0b45d8a788b902f24
X-MBO-RS-META: jobrrtndyqmfohyy1rg3juf185ahus75
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34912-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C31D672AB46

On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:

[...]

> +static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> +{
> +	struct device *dev = priv->dev;
> +	unsigned long rate;
> +	struct clk_hw *hw;
> +	const char *name;
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> +		rate = fixed_clk_rates[i];
> +		name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> +		if (!name)
> +			return -ENOMEM;
> +
> +		hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);

Would it be viable to use devm_clk_hw_register_fixed_rate() here ?

> +		if (IS_ERR(hw)) {
> +			while (i-- > 0)
> +				clk_hw_unregister_fixed_rate(priv->fixed_hws[i]);
> +			return PTR_ERR(hw);
> +		}
> +
> +		priv->fixed_hws[i] = hw;
> +	}
> +
> +	return devm_add_action_or_reset(dev, unregister_fixed_clks, priv);
> +}
[...]

