Return-Path: <linux-renesas-soc+bounces-27787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDRPHTtDgWl6FAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 01:37:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E612FD30B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 01:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F9463019FE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 00:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34971EDA3C;
	Tue,  3 Feb 2026 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXyX7Ovk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C82DF68;
	Tue,  3 Feb 2026 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079000; cv=none; b=Aqsae+0R+pS6Gsqzc+WFpAFvwppxEWd8YJ0T8oFLJRtaTiFl5IzU6oqPdSrO6N+YSwOqAbocr0TxPlg30lm2XLMtw/DOqoxQ6jXt8g4XrVdeeYLe+OOq/2BbxEumIjpy1K2WJrUXAAYaj9Bb88Dt4hEVRURUoH0GnIavySzbsxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079000; c=relaxed/simple;
	bh=XsJUttOLmvcvYELVFL7+14GzSjHRUm0N6G2ZdfBBNiw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uuQDF4eyjrX4Zgp4577slsMwr37FXFwDiYx/qfQPPAP3EEyyh8TJvDFyDVZ22ibWeU/Qub/biKXREFcaD+7EVjz6ByS3vN96hhxu1HJuaTpppGUKld+NVHjJPaveoCBMXWxExD/cxh1M6nELP4h/CHJ1gizpUCWbbM/ot+aUwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXyX7Ovk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4532C116C6;
	Tue,  3 Feb 2026 00:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078999;
	bh=XsJUttOLmvcvYELVFL7+14GzSjHRUm0N6G2ZdfBBNiw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eXyX7OvkRT9e7UYBEFO/DB5K6YQKnyakG0tNaniVjm7GuIdqNiPCWk0VPvrxNXl/M
	 c4bPfqmxeDJ7Rvyg/0HKvExJSRgR7RHzKX+aLQXb9OltERUUn2cjxlF62X8vTm4v71
	 Zi/AgbGP93MrJqwKsRd1sTy3xnC6WBt6wkA9a5wdClysQTEdIWyn7bAvW2/vPkCg9z
	 n+4ZtAoilmxyY+EGutkdYDhDb9yf9qxXOvG/HrXuPxhdKP2M0LjPozwR6VPuixaBKc
	 H83uRB3/I0FcfUIjjCpo18QkT8b+9EiAQ4rNZ5qnb9xRsAo29bHYnHEGkc5coX44uZ
	 XfnHSaCkR0bQA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251014104626.10682-1-marek.vasut@mailbox.org>
References: <20251014104626.10682-1-marek.vasut@mailbox.org>
Subject: Re: [PATCH] dt-bindings: clk: rs9: Fix DIF pattern match
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Marek Vasut <marek.vasut@mailbox.org>, linux-clk@vger.kernel.org
Date: Mon, 02 Feb 2026 17:36:37 -0700
Message-ID: <177007899770.4027.7705142903765028675@lazor>
User-Agent: alot/0.11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27787-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email]
X-Rspamd-Queue-Id: E612FD30B8
X-Rspamd-Action: no action

Quoting Marek Vasut (2025-10-14 03:46:03)
> The pattern match [0-19] is incorrect and does not cover range of 0..19,
> use pattern 1?[0-9] to cover range 0..19 instead. Update the example to
> validate all parts of the pattern match and prevent such failures in the
> future.
>=20
> Fixes: 26c1bc67aa2f ("dt-bindings: clk: rs9: Add Renesas 9-series I2C PCI=
e clock generator")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---

Applied to clk-next

