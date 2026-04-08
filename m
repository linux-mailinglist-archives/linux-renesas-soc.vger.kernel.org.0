Return-Path: <linux-renesas-soc+bounces-31048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJC3EuuY1mmTGggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 20:05:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C92053BFEF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 20:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31CB63006466
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 18:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF5A3D75C9;
	Wed,  8 Apr 2026 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBHl+gQL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7ED2BEFFF;
	Wed,  8 Apr 2026 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775671529; cv=none; b=lF7s23sQ0rimBau/d3CM+I2z2D1xg4wldB4W8NUY1l56dRhSknwGg2wLSgjTsxLlV+0K/9ERXeFrEqPxNlYb0EZaMPCqIsb/A2y/YO4p5D/8ZOMfTQTTweoCpQ4aJb+Jah0agV7fmZcMkgabjLgFnp/mh+a00mDF+iHY8U0VTws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775671529; c=relaxed/simple;
	bh=GhyHRrnRDdoZEf3u2lIzQom5Mm/U0u0XxoBDoA6t7sQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dD6TdzzEfO54rnThdlts/qNOG5JJ2XzTDXrKAgHfkzkrrihXqWKYyBmzQ3UqGgPABkzLmAhTyN3QmM7yMnNEOUKEn8PrxL8rtbVStj8pCLdSHl7qnPbZfWcu6L+wNRO7hSzk1bD5SCe8ddP2533XMe5GsoCdih/HiiFKs2IGK5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBHl+gQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211FBC19421;
	Wed,  8 Apr 2026 18:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775671528;
	bh=GhyHRrnRDdoZEf3u2lIzQom5Mm/U0u0XxoBDoA6t7sQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VBHl+gQL3K0YD8ZaOTd/UgUkLx1IRN4VvaitxXgAUlcQSTUTXK/WbIkIPncHv6f+H
	 00ZmLuF0C/2s2iUahTvvd2f5aimVVdhyVMlvnLdLmAOVRupoMOPqzLXUSSprahyeAg
	 YGjWuAMdVip4A9G/beaqSSqOGvlxoxjZr6fNbx3NAbR+FQThvj/iWP0nI840AJyJ4C
	 7IBwi8U2kA0T+92AnAQ+5YIj8rEbWFre21HU810K3IiPXBzt/YWMjIaTzLBhk+4dta
	 +j53W/SXt1ar/18EWjZ4G9Kwi2XIa4hMQKonVh9NsVSwM6qL9G5XQ80J0NfSBVwMyB
	 5NzB7UfIo+YtA==
From: Mark Brown <broonie@kernel.org>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-spi@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260408085418.18770-1-biju.das.jz@bp.renesas.com>
References: <20260408085418.18770-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 0/2] Add Renesas RZ/G3L RSPI support
Message-Id: <177566031748.101848.1310660051859646381.b4-ty@b4>
Date: Wed, 08 Apr 2026 15:58:37 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GhyHRrnRDdoZEf3u2lIzQom5Mm/U0u0XxoBDoA6t7sQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1pjlO0VFZ9Mmwr4g5MPC/IjkRBKXtwYYKcO94
 Ggex8iGxACJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadaY5QAKCRAk1otyXVSH
 0NcFB/sGR9+36PoNhe+h8cpOP4fDRRiY+KFWWoAlHZKhSzdpfxzb7uu/wtef2wma5PehJf17mS/
 dHTdnMtKyqfKQP1ZVovAG9BYtP3d2NMPpA+LncgzMsIb1Q62Bk1/VNjv6y6Gw5Whuxa8m7D+kzh
 zThI/bpVYi/t3vejjuAyUEzP0XbNysf/vGONV1jY6TyhZf9V1vMipRTqMfPE6pw57/haYG1JEkw
 OTH3x+iEmLkxQwipk+61ddGcnwn62jiAzcJpEiH6iyApcZ+hn+wIsfGY56E9/rnnyy4G+wnWbpf
 Oi40zvR338BOo6rwvCvFXEzssZCNkAJ1gRW11/wPQpSBmrJY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31048-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C92053BFEF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 08 Apr 2026 09:54:13 +0100, Biju wrote:
> Add Renesas RZ/G3L RSPI support
> 
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> This patch series adds binding and driver support for RSPI IP found on the
> RZ/G3L SoC. The RSPI is compatible with RZ/V2H RSPI, but has 2 clocks
> compared to 3 on RZ/V2H.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
      https://git.kernel.org/broonie/spi/c/5277c291968d
[2/2] spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)
      https://git.kernel.org/broonie/spi/c/9be114351647

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


