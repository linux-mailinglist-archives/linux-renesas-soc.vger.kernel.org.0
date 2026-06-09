Return-Path: <linux-renesas-soc+bounces-33807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8X3PGxg7KWrRSgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:23:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 107F366837F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:23:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kvvMwC5h;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73520303969A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4955B3EFD26;
	Wed, 10 Jun 2026 10:23:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4283EFFB5;
	Wed, 10 Jun 2026 10:23:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086998; cv=none; b=VrLBx43G4UFBT4hnLQR/ofToKpix0A1euRftw3XwZGlEqRPod+mp3UUTFfd1VPz8dDw1zZyXTyO+y+4wwKogbzZIQ8NQqInjOIw3ZfL0FwvWZimeKWNFnkGY0ItWF2hMXgKVOO8AWtzSWBqA4rbo9GzanLDssxQiKa/oxZ2Fc3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086998; c=relaxed/simple;
	bh=GjQoMSl+S+ijDAnNQXjwhwnaSIySn/7/CBufcCjNSyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mx2qZxLuOVVxR1mvvLm0CZevZswHcf6vXR2BPtFLq3GbrUraOZ/MLHlCVWvHAAF96EKNZl//EcKA225c4OtksBy8KRK+YyAsVY/vKVIgDPvfXVtSuRXyL4XINEmZUOiR28rcTLjo1fjXq0tYNxoJtVQGaRnGrEHieNNFoPhdNn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvvMwC5h; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416461F0089B;
	Wed, 10 Jun 2026 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781086994;
	bh=Hu3axCTPjfMs3cUhhhjRYZSUzNrC+vMNBMn69voBuMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kvvMwC5hvuAadTTNgtBkxkJ/4i/OhV97HPFAOGw04yvN/C0tHKMtwfFN+CFBYYy+O
	 fQX8hRrnql+Sn/jhjXmSLaJ6ZYoV4Kn7IGZtTzTUjf20k0n3+f6mRQaUT6j4qFM/n2
	 QESfwtwsftiUZ+msK/fJA2Iuyq2V0x1ftbZm7XqyRI38XhT362kwIqqxlruKMtJYDN
	 cbg/JESdE/r7/W9IYFSza4/OJmD8C/Q8W0BPieEnVmrjtvhGOGeTfLeQ1qL4eTN5Sn
	 EgmYWWqsqiMB0lQ54TuyT9VutGFMxAYxrtNZLon3F2+qYdh00qdL5U7CeuWGShS2sJ
	 iYNTHzYNOmVMA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v6 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
Message-Id: <178104804456.232889.7203992010119048881.b4-ty@b4>
Date: Wed, 10 Jun 2026 00:34:04 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2546; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GjQoMSl+S+ijDAnNQXjwhwnaSIySn/7/CBufcCjNSyA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKTsORBTxRP91rPH4QXSV+YoHKfvpSBoH9EWz4
 WPuauw5ch6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaik7DgAKCRAk1otyXVSH
 0F9iB/0bvlHYY5F8KFfNZKW4GcfAdhhY74UpfzFD5YO+aoOgnhk0ebhuMJoGoYYaMbERCbsEmxi
 RgKTPEe6o0s+Wgo2k2TnfZFDn3EjBlnTuZK+5B0QzMM4Fv799zLhm62nCPnxeRrIggfivmAMKIS
 L9poiI/RUR3qZ5mSQKrxvTHVj83Dnnoc43XQ9vEwIhFG7FiY5UNZKVx7wPEwMpYyhxxFgGoDcvx
 YKBO6ZsH++QESoEuUsS6W/F/6cNlmDgsrjaL2bxED9SChoaPJm9JGN9xwqTy9iHbl6bEPCw4pC3
 83N3BDd6DbcNGUb4yfvDUifktXojtCv4W7U3bxEyWqNPtR94
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:geert+renesas@glider.be,m:phucduc.bui@gmail.com,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:phucducbui@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33807-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 107F366837F

On Tue, 09 Jun 2026 18:38:25 +0700, phucduc.bui@gmail.com wrote:
> ASoC: renesas: fsi: Fix system hang by adding SPU clock
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> The FSI on r8a7740 requires the SPU clock to be enabled before accessing
> its internal registers. Without it, register accesses may hang the system
> even when the FSI functional clock is enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
        https://git.kernel.org/broonie/sound/c/955fecff55c3
[03/11] ASoC: renesas: fsi: Fix trigger stop ordering
        https://git.kernel.org/broonie/sound/c/859efe92b0bc
[04/11] ASoC: renesas: fsi: Move fsi_stream_is_working()
        https://git.kernel.org/broonie/sound/c/c9e05e2fa089
[05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
        https://git.kernel.org/broonie/sound/c/e813df3ef529
[06/11] ASoC: renesas: fsi: Move fsi_clk_init()
        https://git.kernel.org/broonie/sound/c/cfa1466e6dfd
[07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
        https://git.kernel.org/broonie/sound/c/5fb4660ce59b
[08/11] ASoC: renesas: fsi: refactor clock initialization
        https://git.kernel.org/broonie/sound/c/2330e0b49f14
[09/11] ASoC: renesas: fsi: Add SPU clock support
        https://git.kernel.org/broonie/sound/c/39033b278f9c
[10/11] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
        https://git.kernel.org/broonie/sound/c/05e1ebfeb726
[11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
        https://git.kernel.org/broonie/sound/c/26deeee42f4f

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


