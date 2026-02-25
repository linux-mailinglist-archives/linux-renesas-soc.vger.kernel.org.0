Return-Path: <linux-renesas-soc+bounces-28468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLQGLOtJn2lEZwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 20:13:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97019C9E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 20:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 152EB31CA68F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 19:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683BC3E9F7A;
	Wed, 25 Feb 2026 19:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDa2LDRw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4416A3D6488;
	Wed, 25 Feb 2026 19:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046465; cv=none; b=cvW0Q+UFm/TQ/f+AoS83hV/ddYpARhpaMFTAjm2HDmr6d0L7FwajCMjlEbXs7SqROroPopOigpr6KvWUhDs32NTkgfZ2mUox4zNxEfhFPEPbw5K4v8cygVZHoLRpAsph7Eyb+nw5e//hi+uJjTOwSakvQi9g0cKJzxnq0q/LNIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046465; c=relaxed/simple;
	bh=PiDW0q+4QNESSXA7sLgepEPjfL/u0WLT2kREDP9X0IY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TJT/Pdw0BkpR/hkJeUz6LP8GChcmUg4YRNTQN9EiUo4s9j4pEXQun2zAStU8ooK9Ny+Y7aos2evBr56h5j6Yhyxql8nnGvpYTOrs1nF9CbgzevmJ9i4Wpb2eyqvHRQAGzscFQ/Z46PihsXS41wCP2xVDNJEuAYbSeym53Rvc3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDa2LDRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9F5C19421;
	Wed, 25 Feb 2026 19:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046465;
	bh=PiDW0q+4QNESSXA7sLgepEPjfL/u0WLT2kREDP9X0IY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bDa2LDRw+egmKVhsjwL8cb0y9ICwRAXbvUwotuSrguwNZLgUXTTfQJhYLqbMEA6/9
	 ikUHrxHv9+wGmU6703KphaUKzO0Mka+eQ/3jZOI0w+bkPI9TKiHhLKD197H2mPXent
	 h9n5eNwowkbUKkmiASjLHaaJPYFIg0KVnXpyiuF3X/8kFjneqASgXMQx6aON0PbluG
	 W38ydlckemBH9mQwqENqunCGaHK5BCFzvMZ2bVhyDgLm3mi4Q3kcjyaYZg6YeTKuHw
	 xdbaHH92MaXcgTNi9CdIuTHb5rEYwwbihoCSPgAKZ74jBfEOrMjJpLNJ7KoYcVi+SK
	 b5CAerljthhrg==
From: Mark Brown <broonie@kernel.org>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com>
Subject: Re: (subset) [PATCH v3 0/3] Add DMA support for RZ/T2H RSPI
Message-Id: <177204646186.169139.3925826072902502630.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:07:41 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28468-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A97019C9E0
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 23:51:29 +0200, Cosmin Tanislav wrote:
> The DMA controller can be used to transfer data to and from the SPI
> controller without involving the CPU for each word of a SPI transfer.
> 
> Add support for DMA mode, and do some other cleanups while touching the
> same code.
> 
> The dts changes in this series depend on the DMA series [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow multiple DMAs
      commit: 4d28f38f64ef69ab27839069ef3346c3c878d137

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


