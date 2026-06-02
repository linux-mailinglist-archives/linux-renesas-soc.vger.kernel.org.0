Return-Path: <linux-renesas-soc+bounces-33493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ikrwG9vWH2o7qwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:25:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C06352D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:25:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k7GUF5l8;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76FDB327E05B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 07:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC3C3FA5F9;
	Wed,  3 Jun 2026 07:04:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D739BFFC;
	Wed,  3 Jun 2026 07:04:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470296; cv=none; b=d43BQnhN46s4evczW467XSAEVaF33UUQ0L1Mhc1EpWBjkNmSeXGYic4rKds+o/7uy72CE+fgmmL7/MO8w31i8ajP7On3AeyB0COQvQo97CgPjyn/ghznjXzRqA5ysNogeruNJenAOdKADgNOwQkXropVq7MNHY13UkEifGHQGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470296; c=relaxed/simple;
	bh=bTVy3FAIZsqQF1unUBLrL1Tiy1sS6gTQkrGyju0A2UI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZxBNl6hS+vLFQ+GSqi2OTRxTtqegJUVIo6N34LG+wHa+xrwOF/Uj/6joNOwBMliBQQYG6BwTbcdu1oQQVS6ckO0B9QDees1EseYgbuDOSIeY+Ux5jVqa2f3mYrdfbmuDn+jByin8yrZcnbdvydVqmr/4ETmN6MMLcvkGVQhYZ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7GUF5l8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AB01F00893;
	Wed,  3 Jun 2026 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470295;
	bh=Z6/ckCFcgr4XWtYBVVRtL+Ct7dfjpf8dESf8wUMG9iA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k7GUF5l8oVabuD+5BF+MS3uw4cnRpVWa0H9A8XsabOvcehxVWo/UOmOl7lbVnx/xR
	 vXTAqLIG03CbQJJvJ2Xudfmx2KTlfBE6II/bziCPeyHDEx3ItGbaKDCU2iNhpmhj8X
	 nhyCi7ALSVu5THk832x+1HOlZHA+bDbNQ4LNIEUb8XQkl3nuN04yr2yrsLI87QXKVC
	 b6+r/7zveWoKebATm7JJZqLTqcgpWRZF7yf74WcjFe56NfWlWrc+8wotLW9P9EGYl1
	 47PVl5HfiM1W4WxxR6r5SnR11WQglvtEUpxZ3E79C6zLpJpLfkUsgNLUK9ux1E7oqt
	 lQCmLonveBqVw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Javier Martinez Canillas <javier@dowhile0.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Karel Balej <balejk@matfyz.cz>, Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Samuel Kayode <samkay014@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 linux-renesas-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1 0/3] regulator: Use named initializers for
 platform_device_id arrays
Message-Id: <178041297263.93058.3488426549945445903.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:09:32 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bTVy3FAIZsqQF1unUBLrL1Tiy1sS6gTQkrGyju0A2UI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9IR+5XenVVA9mLHD2HeO7sMNeqC+VxerFOpf
 IwsWOpOWzOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/SEQAKCRAk1otyXVSH
 0IP9CACDwCfsHAyOc8wD19LkmpqTPvPL3MCjfuetPTU/gdAUVVKU3hJDg0mrEFSFtECISuQKNp+
 IDZhuxqSzlFO9vZYfTxelGP2i+YDA5qKrvSVWhUh/o2ocvKdqAkCTAbqKDoAO+zPRKhLq8LdQA4
 3vAQ7MaG3XwQh+DPYWKKOf3XpJSfpAewhEfaGYKG8ZCqwCZJM8KNvEUXW4sjxWfxA0b5+BEiNj8
 VtqKQ41+jd8pBtR8CP3onpyOFmb1T4iAKTxhxbub7qPgS9U4TjBvYRFo5RlcuC6CP8ulHLffsFV
 uaG1JcYy7gUAXHRu8KISbRgIZxYDYJgHHdl9F7pN7BIG+fMS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:u.kleine-koenig@baylibre.com,m:cw00.choi@samsung.com,m:krzk@kernel.org,m:javier@dowhile0.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:andre.draszik@linaro.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:balejk@matfyz.cz,m:mazziesaccount@gmail.com,m:marek.vasut+renesas@gmail.com,m:samkay014@gmail.com,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linux-renesas-soc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-omap@vger.kernel.org,m:matthiasbgg@gmail.com,m:marekvasut@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33493-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com,baylibre.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[samsung.com,kernel.org,dowhile0.org,gmail.com,collabora.com,linaro.org,vger.kernel.org,lists.infradead.org,matfyz.cz,iki.fi,kemnade.info,baylibre.com,atomide.com,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C52C06352D7

On Wed, 27 May 2026 12:47:43 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> regulator: Use named initializers for platform_device_id arrays
> 
> Hello,
> 
> this series targets to use named initializers for platform_device_id
> arrays. In general these are better readable for humans and more robust
> to changes in the respective struct definition.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/3] regulator: Drop unused assignment of platform_device_id driver data
      https://git.kernel.org/broonie/regulator/c/4079e9d91b40
[2/3] regulator: Use named initializers for platform_device_id arrays
      https://git.kernel.org/broonie/regulator/c/d35028340d75
[3/3] regulator: Unify usage of space and comma in platform_device_id arrays
      https://git.kernel.org/broonie/regulator/c/0eb17367814a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


