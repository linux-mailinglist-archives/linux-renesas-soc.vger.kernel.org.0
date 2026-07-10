Return-Path: <linux-renesas-soc+bounces-35076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MZp/JMFwUWrbEwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jul 2026 00:22:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB973F7DA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jul 2026 00:22:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oeLBvzjk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81B19303B7F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 22:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DDB431E4F;
	Fri, 10 Jul 2026 22:21:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA52428461;
	Fri, 10 Jul 2026 22:21:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722077; cv=none; b=TNsDymVcZO3cWUtiYIN1w6+kmVAfd86lbAgu1ENiydaIM8XlDkWCDeZisMGCKMW7WHYQGv/7wbd7C8Mui1zh6QFhrWFj94tuHHJpnY7bn65XagQsnDdBDD0OTw9IyxDVkEuZEzyDlJaKAHbA2ovx8ocZM3bcqyZZabMpYuw2E+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722077; c=relaxed/simple;
	bh=bJl5fQPl/8SCiPA7HP6kJnaSwYgVGISoszxcNL4MMmc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=irE98ehtBjhqu/JAMsmvYSu1f+37zPojeG4EWIgd4Z0bviVWKdF78v0RJA+/HMoW03lWcGdLhayr0b04O0FuoyFxVIRIel5Yv5e69uHafP8QsKR3YzGhZ8OcSGdJJmtN3UjXLQAAnQr6Izkxfm5PwghB5DMzi7uBRCDYKxwv0EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeLBvzjk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A2E1F000E9;
	Fri, 10 Jul 2026 22:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783722076;
	bh=e5VaWoT+JyBfzZCc0Ceb0NCpR1zGV0RFto2LvwVs61I=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=oeLBvzjkEq9TS4WuRj31zDBgX/HfWKxSEpQHWmuTdgaSxHM5NbiOHqITFT+L7RmpA
	 ThVJHHRXLI/Xw26Mrk5PgtbEmNJ+eFT7W+ppnEqsFSo6sqArjkoYVAM7DZWJ0+1/4g
	 siANgGFUYh38EQyHU9dnzjk/NCt9ZiciUaQAiuVmXB/pRibhwdnuCX6lDCodPA7bUv
	 pAyy57PeyMV/OUbR6ofnZa1zntYRj/I+txpZ2hfK06TsrY6iPGnOXF5DQeGOnJmgjG
	 16VPSdYJohdl/xM3pO0jRkkf1QVRMAFc2s73jlT+WQi1p05UH+4gYOPtgPo2O0clUU
	 8YPHw29nHBXnQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ASoC: renesas: adg: Drop redundant NULL check on
 clk_get and clk_register_fixed_rate
Message-Id: <178369992206.82617.16738196828533126762.b4-ty@b4>
Date: Fri, 10 Jul 2026 17:12:02 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bJl5fQPl/8SCiPA7HP6kJnaSwYgVGISoszxcNL4MMmc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUXBZ+rZGW2WKc9HLptVS1mb7yESq5dqGgoQvR
 sBlAoMRvLGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalFwWQAKCRAk1otyXVSH
 0PB7B/45UpBS6WA7tvCTfKnhJgxO+JY52/cun8iMdLzjHUSETkn1u+0tCsMdzTaYEjdSPCo7Twp
 ngHnUD7kt+IXhfkqclWk7MVHUMMWePDiGIUu3xziyRw0MpLnzJlNQ5xxHzUeA41sgaqPzUA41Ub
 wv8J8hkAs6Cfluc6yQfVtGjzgnQZpSjSDGrEmTB28sWmuC/BASDgLpson7bns8XWMTgdwVl8Dy9
 bXNWPPCdwIPjMnFv5JFOQibAgfNNCmT5TNHs2jsHNLfBK8+xMaVXbnFACTbvH55bjlhPZTXXG6X
 wiJWOvYqS9+ZqSEaTFNHwJL2uyMzNZfkICSp0beA8vvqAqL0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:kuninori.morimoto.gx@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,perex.cz,suse.com,renesas.com,glider.be,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35076-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19FB973F7DA

On Sun, 05 Jul 2026 19:23:26 +0200, Krzysztof Kozlowski wrote:
> ASoC: renesas: adg: Drop redundant NULL check on clk_get and clk_register_fixed_rate

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: renesas: adg: Drop redundant NULL check on clk_get and clk_register_fixed_rate
      https://git.kernel.org/broonie/sound/c/af58a647f9c9
[2/2] ASoC: codecs: es9356: Constify regmap_sdw_mbq_cfg
      https://git.kernel.org/broonie/sound/c/6ef98181eac3

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


