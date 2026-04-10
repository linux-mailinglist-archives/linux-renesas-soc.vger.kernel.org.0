Return-Path: <linux-renesas-soc+bounces-31149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMdVGScn2WkPmwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:36:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E505B3DA750
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2E2230BA746
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0B13DBD70;
	Fri, 10 Apr 2026 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDMz/eBL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9E23EA92;
	Fri, 10 Apr 2026 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838565; cv=none; b=UZI7VW8+3GP2rbabonyaDWRGAwBe45nL6Jxdu51S0g3Fhg6eVLlYan5bsrkiAlbCTXNgU/Lnx6aPtUh6/VlOi8y/nWTWd1OYj9lhLsrGnu5hVoSoHEC1GpDjHUEsfo1HdUhfPYtCOjpKOaUkZBgAR1EqyRNQ7BX3PZqdZeZYDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838565; c=relaxed/simple;
	bh=Yjk/98TJLyq9/SO5ax/zuYcqbnEKqgEWfUM/H/5nOFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P/niHmnC7MmamKpOAJwo/f99816FmjUvFSQ7mxxpE2GedCK+K7Ryxt/3EyxrWOc4CZQ3IC30fqPRPeVBhm4/bRhBVZHB9dD3EqZM2LFojtMMOBtsqIVf2VWDQlDuNIwY2PwMgTyISuYeU68q46Mtlu6rS41XMORLbwquoIDAYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDMz/eBL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E89C19424;
	Fri, 10 Apr 2026 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775838565;
	bh=Yjk/98TJLyq9/SO5ax/zuYcqbnEKqgEWfUM/H/5nOFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XDMz/eBLMNQD/aoBj4eR2IRHsB9kbk/X2mFw9ZTN836e49Oed3Rs7uzeNhBB0Hf6R
	 fDSZ80ZbHWemyc+lLt55If40qT1j4EsndOJfEGBgb1tR8GtqScY6eM+sy6ztNdVClP
	 bic7Yi9Hf/jEqo7mLKv+DiPHugiTATLoz8HrdUDqjXIiuRG1haBW5+DXIvShodHOOw
	 DTiA09HOreogd5RIczTgCBIHB1M0GkFq9r91faY1eM1aRx4iColZQivRCnReOaPRp3
	 1Yr5BafkbgzaBA8aWSze2D/D02pOSnikqOUbIdCb82uBbdbyB2ZwvCQ/6LEP5/lo7g
	 chloTTQu5mzsA==
From: Mark Brown <broonie@kernel.org>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260410080517.2405700-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260410080517.2405700-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/3] spi: rzv2h-rspi: Fix max_speed_hz and clock
 configuration issues
Message-Id: <177582360550.1175120.15096708255588882361.b4-ty@b4>
Date: Fri, 10 Apr 2026 13:20:05 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Yjk/98TJLyq9/SO5ax/zuYcqbnEKqgEWfUM/H/5nOFY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2SVi98uv4C18ECGZw51oNttJcT0+YbzCgJ7eL
 zoqfCXdkuqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadklYgAKCRAk1otyXVSH
 0BJyB/4z8/7oyUzP12RlejYlVqD8U/omzYrS74b+XGy9upM7MEagK2CMoKk3mRErjYgeflrDVNa
 mN6SYVyV+aG9u1G58Ne+laco997hVHyayFckkbFuJKieawQkqoL40j90n0EKSeuP1DRQgf1rciq
 D87qnJZNHrLbDdEAw8bI6wFiTiA8eAwQXU6XzoDhbM2ogI1sGSXjvWCCwKOHiiNMOLhG22CKDLd
 hNMmdjLDCf4QBDbMO9rr3GwcGQWUYg2KkkAKl8oTp79ymUFQ2ica2bviz8xzmy39Cp8i+HP9y6V
 IjPaQdd5GkB/lNXyhY9AtKPRZA/egPKCS4OnIhunbMTWaEnZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[renesas.com,glider.be,gmail.com];
	TAGGED_FROM(0.00)[bounces-31149-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: E505B3DA750
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 09:05:14 +0100, Prabhakar wrote:
> spi: rzv2h-rspi: Fix max_speed_hz and clock configuration issues
> 
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi all,
> 
> This patch series addresses three issues in the RZV2H RSPI driver:
> 1. The max_speed_hz field was advertising a prohibited bit rate, which
>    could lead to incorrect behavior when userspace applications attempt
>    to set the SPI clock speed.
> 2. The clock configuration logic allowed for an invalid combination of
>    SPR=0 and BRDV=0, which is not supported by the hardware.
> 3. Simplified  the clock rate search function as min/max speed parameters
>    are not needed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/3] spi: rzv2h-rspi: Fix max_speed_hz advertising prohibited bit rate
      https://git.kernel.org/broonie/spi/c/4e292cbf3890
[2/3] spi: rzv2h-rspi: Fix invalid SPR=0/BRDV=0 clock configuration
      https://git.kernel.org/broonie/spi/c/0335767dd8e7
[3/3] spi: rzv2h-rspi: Simplify clock rate search function signatures
      https://git.kernel.org/broonie/spi/c/c958bb67b2df

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


