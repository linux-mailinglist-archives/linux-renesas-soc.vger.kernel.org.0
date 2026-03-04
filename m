Return-Path: <linux-renesas-soc+bounces-28773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBT3ImFCqGlOrwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 15:32:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E199C2018AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 15:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C1FA3173A95
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 14:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8E33B8940;
	Wed,  4 Mar 2026 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQR13/ZH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6537B3A4512;
	Wed,  4 Mar 2026 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633082; cv=none; b=nXre8naVXOiusTMyZuCgHacqen/u0cYE/qGhrWVpKunbmka9AjkNMp/eLYU7uULNiTm9lAA9MqMj4MtfTHexrEgcBUCo3s9zOxpsT2/yQrRMWxJwG2UqYQ86kUYlASDUpO5CO1nG4sw0ykKD9r1ek9kQgrUA3EBf+B4bi7icHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633082; c=relaxed/simple;
	bh=nJlM3uqhcdtv948kNs3zutBgWNIPD3VVSvIYRFuWgas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kl8eml/ra7EbXcd/q7o/KRo7k9RGugHY7SS3nfQa0nofksy6+QY5hrW1HQM1aReFIUdriyJc1nMVjmcBkUWs3nQEwOqrX7mmxMMDyu0T+L3sT6xfZaCH7Ig2lMRS6daZ3SDg0aPEoIqMCXalqEvgX/ztq9ly+w4OJRU0QBpeP+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQR13/ZH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8433AC19423;
	Wed,  4 Mar 2026 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772633082;
	bh=nJlM3uqhcdtv948kNs3zutBgWNIPD3VVSvIYRFuWgas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RQR13/ZHOPgwvVHfqE6n2f0tncVYAlkmBndcaOJ3G8T2tIQPyC5e2KpqdiP96w7yp
	 fy/7KYvqOqjxgBDkC2O2FwB5qK37qR3zk/sa/1/VUfjI9YsbPy/K7D/lYR9Arn0p9/
	 A8yKHc5ABj/BWal5Lp1nlQweE9m5+YVTkD5tEllllxTkGGGtfX5FJ5TEWcQfjXJ8h8
	 smuW+LpKOczErVcmbKGiObB3LID/FGvcamGUxkyN/Q3BpUwC8Uh2VmXwWeaqKKWBvz
	 oBi1HgKpufrZCKR6mIL8p9m/KxJYyc65kwM9bXFKiHYNq/i9rQWtyRuywgtBSXe6SM
	 n3sh9iRJEvLGA==
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju <biju.das.au@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260304072000.6787-1-biju.das.jz@bp.renesas.com>
References: <20260304072000.6787-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G3L SoC
Message-Id: <177263307926.96340.355429636551743485.b4-ty@kernel.org>
Date: Wed, 04 Mar 2026 14:04:39 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-6ac23
X-Rspamd-Queue-Id: E199C2018AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,kernel.org,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28773-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 04 Mar 2026 07:19:55 +0000, Biju wrote:
> Document RZ/G3L SSIF-2 bindings. The RZ/G3L SSIF-2 IP is identical to one
> found on the RZ/G2L SoC.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G3L SoC
      commit: fbb143e4a6efa4a175e856fc898754b06cb13c4f

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


