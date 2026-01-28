Return-Path: <linux-renesas-soc+bounces-27499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ACfOvGGeWnjxQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 04:48:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4A29CD8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 04:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8CD63004934
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 03:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6DD2DC32A;
	Wed, 28 Jan 2026 03:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKgnenya"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815C2264D6;
	Wed, 28 Jan 2026 03:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769572078; cv=none; b=kyuJ6/Z4MrLyCjIibIMnLFWmhcEzZ50zu20WrsXUXWJFUo2PP7qWGyUGnlAioC+G8R11hMvKPlfXwT9LO3PT4H9LhxJ5gtkGBaJLhnn0XdeDfwFQ6KjDCxI161/SaqYKizpgrR1L6QQ1We6mSJq4/tTY89S97okyGWij+yjFJwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769572078; c=relaxed/simple;
	bh=iE1Q97lr2OicQXuPjduInlrCf1W6awoCKCLB/QJxY/w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gVFpeUKCoS/Kpt1FCZwN8WPzXBfZ2oSkx2Od9J9Cf9xaljrj48mNYJWv724Wg8dD3ioRPgXxR6UoHQDrcosjvQppw4d0wJRfPTnXnBOpk1Ru8bsM56DzFboXVJ4/rBNzNew6j7BAhUb6vCzx5dZ3Yp1fVpGoe0p0VtIT5Ij+V+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKgnenya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68AEC4CEF1;
	Wed, 28 Jan 2026 03:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769572078;
	bh=iE1Q97lr2OicQXuPjduInlrCf1W6awoCKCLB/QJxY/w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UKgnenyaMhuEnvUNolwkDjdBHrHEb3Uc9G2kUs27WWoztnU4tjlVuW7ukuoh5N4uR
	 savlf5LJw5TuY+gjlk20H5Xn8fdvqL3BQDEAiKST1Jxm3ZxOqA0LH12rS+FYnHJ2Fq
	 WrDvaXdhBKkOZ30fQbu0OfBHvsIuD3JJGD9hGUouKQ1eZsyiAvU2sCaQikDTftwaNs
	 up9fCGK938arJOLdwAKg6hmTQvRaLIp0tSixDimcYK1GeLOOIwqtEgOjcOchOl/5Qb
	 ZJIhdd+G+o2e5D4XviADF6246pPfO3kjJ4YrllRwSf8dxRvSOpnSeHzQpnDfwcHbfJ
	 PpuJeVTSBS01g==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260121234309.178391-1-marek.vasut+renesas@mailbox.org>
References: <20260121234309.178391-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] regcache: Demote defaults readback from HW to debug
 print
Message-Id: <176957207640.1527248.2919232835233944822.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:47:56 +0000
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27499-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B4A29CD8C
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 00:42:58 +0100, Marek Vasut wrote:
> Since commit 632e04739c8f ("clk: rs9: Fix suspend/resume"), the
> clk-renesas-pcie-9series driver produces the following print in
> kernel log on boot:
> "
> clk-renesas-pcie-9series 8-0068: No cache defaults, reading back from HW
> "
> This is caused by the presence of .num_reg_defaults_raw in its struct
> regmap_config, without a matching .reg_defaults_raw table of built-in
> register default values.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regcache: Demote defaults readback from HW to debug print
      commit: 6ffdc7eb48bd2268c37c2accad454c043b9cc987

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


