Return-Path: <linux-renesas-soc+bounces-30525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDdsG9J4x2n2XwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 07:44:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DCB34D879
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 07:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E97830209BC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 06:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075F132B98D;
	Sat, 28 Mar 2026 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hWyq9Wjd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072530594E;
	Sat, 28 Mar 2026 06:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774680254; cv=none; b=rx9gwDiHLbV6HHNNhOJbkHQpoyYOTdiZmG5Zchf0OLia51zrgS6PYJSHv6pIbyqRF8WoOSmtf5kmR2HenAKoKRyBVpu7eXe26nChiXSGZYEG7mV5u7SR4tcNrwifLlHqv9u0Uq/cRraOmAh1RpAobVBQIQKi9YPNQU24SGjEaR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774680254; c=relaxed/simple;
	bh=RBXNJJ8EaafUN/nAGcFL5PvLmEn59wP/OTkqFfmTb6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmCeCGtC6Sc4/HtFaPMHXHoDR2XX7d3u4rPQh5DK49X4AYgrt8Z1IjjPf8sPHEVGCGY8Zee3fHwyWoj2/3TSvYcla0nhbIqPHI7gf55/O/IA1vShN71DH2LEluEzEIPcEjg4p28uZzMAzsi0SqhB75SY73uP7T0lKehR+CT2riE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hWyq9Wjd; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fjSfK20kRz9tG4;
	Sat, 28 Mar 2026 07:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774680249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fl3Rq3/3SgX6MR2829FOQt8jronsIDrj2ERwCx2UFAg=;
	b=hWyq9WjdJv1K/QxX13gkILqsqVkjzrrzJUpfx8AeTXhCYrxiyZus6T/myKG5KS7I4nrdCp
	8G1QV0OOGR9HYwRbDqCXNNj4HfjrUfVaaFmenRa+ZR45N6fFlRC4lvXpEXxY/i7glDzFfN
	C5FIc/oDQBxQCnhQHMqebsAoR9kHj8AP21O51eKdD3VJIn9TCeMf9S11JrvxmZHh0kScy6
	tNTV7gVutXBOahOdMgYWhQ/H9c3JfgRyQq+9VF4BeEaGBE3r2QW6/J1O1Uan01fw0xgGIt
	GJ0rdLmY05rf8hX4vW3PTXmphmef63a8OKwlw05OVVVXMeU6YRtCKk4WKLvMsA==
Message-ID: <b8edd13e-8f54-4479-bf03-96fbf546b317@mailbox.org>
Date: Sat, 28 Mar 2026 01:16:29 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] soc: renesas: Add Renesas R-Car MFIS driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20260325110717.17083-1-wsa+renesas@sang-engineering.com>
 <20260325110717.17083-3-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260325110717.17083-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: my61mtagtobh15t7rpd7ax89t6g616xs
X-MBO-RS-ID: 6893a9ce2cb72a91118
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,renesas.com,glider.be,gmail.com];
	TAGGED_FROM(0.00)[bounces-30525-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61DCB34D879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 12:07 PM, Wolfram Sang wrote:

Hello Wolfram,

> +static int mfis_mb_iicr_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct mfis_priv *priv = mfis_mb_mbox_to_priv(chan->mbox);
> +	struct mfis_chan_priv *chan_priv = chan->con_priv;
> +
> +	/* Our doorbell still active? */
> +	if (mfis_read(&priv->mbox_reg, chan_priv->reg) & 1)

Super-nitpick, please use BIT(0) instead of 1, since this is a register 
bit check. This way:

if (mfis_read(&priv->mbox_reg, chan_priv->reg) & BIT(0))

> +		return -EBUSY;
> +
> +	/* Start our doorbell */
> +	mfis_write(&priv->mbox_reg, chan_priv->reg, 1);

Same here.

> +	return 0;
> +}
> +
> +static bool mfis_mb_iicr_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct mfis_priv *priv = mfis_mb_mbox_to_priv(chan->mbox);
> +	struct mfis_chan_priv *chan_priv = chan->con_priv;
> +
> +	/* Our doorbell still active? */
> +	return !(mfis_read(&priv->mbox_reg, chan_priv->reg) & 1);
Same here.

The rest is very nice, thank you !

