Return-Path: <linux-renesas-soc+bounces-30869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBM3B3/wz2nt1wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 18:53:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5E2396A38
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 18:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BA1B3028E82
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 16:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265A03C7E0C;
	Fri,  3 Apr 2026 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqqFh5ra"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CA53C3C14;
	Fri,  3 Apr 2026 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235170; cv=none; b=ksrNGbGeePeYhxhyawM90h3n+OYP0pWT1GQGqjjhiLsNPZTMOaw2THqLslrCnOvIO11oCWLK7SL7cQT04lJLsSa+X48zLUAMRxn0XbTdjSaMIC6wTPTKuMEGx4N9+PWFPNdwJkwJ1VgZAuLM8hCp9QrCJe4jVsihYFfwtruudTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235170; c=relaxed/simple;
	bh=vCoVFS83GMxcqes22sQQNNl91YTGHbwjVg8XtiCaJ6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AIEs3pYKUPYcQa9/IFOTQ8Ak/OfsxVTJFGoAslde/ozvv00Pr119nZmB4qSK+8PFAjfBIVIStCZ7FDTOBV5XgXt9+v4soDcOrubN6f3hBvDsdzaPbQZy4WunrU0UsUE0WUGZxMkwGjt2YhnDrvaN8jUEGNNznQ1YVJ43L1sIDec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqqFh5ra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C4DC19421;
	Fri,  3 Apr 2026 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235169;
	bh=vCoVFS83GMxcqes22sQQNNl91YTGHbwjVg8XtiCaJ6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TqqFh5ranXn7Z4rifdfNAG22UHTpVtdS6DRdzPQVXWkNjxNA5RFyQwy3ZNqHZNXmE
	 CcqZ1aqQCDwX6jJNCB5KVcRWKj1IJW8d0q8dUgshqIC9v5X/SsTcDh6N9pRBuqYU1H
	 7iJ1IhSROfBkH9VIHNPqW37VwrP09shiMvgX4qx7MG/VGBQm342UmtCQqfnT8M7ug9
	 nq/9uKv8iv7mwRWFf02n1XrCN2K+4UqJW0Y/tIUZwx1cMyewRe2po4fX5NdopkPkYf
	 2Da+UI98dHgC9fsF3f45iSc63xf0Wv02Wk2LitSMWAKA9aR+FXZZ4Ek+mz9dFAimp5
	 8YcFP25/PHNWQ==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, gerben@altlinux.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, linux-sound@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
In-Reply-To: <20260327103311.459239-1-gerben@altlinux.org>
References: <20260327103311.459239-1-gerben@altlinux.org>
Subject: Re: [PATCH] ASoC: rsnd: Fix potential out-of-bounds access of
 component_dais[]
Message-Id: <177521987204.52946.17534773200894862665.b4-ty@b4>
Date: Fri, 03 Apr 2026 13:37:52 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vCoVFS83GMxcqes22sQQNNl91YTGHbwjVg8XtiCaJ6U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpz/BfAr6T2OhXjWQoonBqhuwNYJXZI2UP0Dy8B
 V4ApGoJR8CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac/wXwAKCRAk1otyXVSH
 0BlCB/9W0bGlY0GSxmHn+ihXuN6U38G7bfRxITxQhZGHQhDYSVFkquU86qsLnCGgVzEWNu31ewe
 P4QX8NlESVQ594i5R375Sx2n7IGd69n8P4sEXN2IGKlBhZMuOhsUxaGKHQcMpgA1pBpKOYFijuX
 6LsgUtGMWfK10MR6PLjz2szDiMiIs5EDoM/JCG0X/rFzPOApvrKL7gXCr1hvndMb9I/2Uen77+9
 lpU2iytf3myZ+ayRcoAgZthmRnWoNwwyTN+1UvHeHokoG65NutXuTrLMQlfRG1y3NRvEEKExDE0
 vg6N3R0YVUM+/P92bEK1WfHbEaHy0+jYKmeo8IQrUzle3Uty
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,vger.kernel.org,linuxtesting.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30869-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 8A5E2396A38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 13:33:11 +0300, gerben@altlinux.org wrote:
> ASoC: rsnd: Fix potential out-of-bounds access of component_dais[]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: rsnd: Fix potential out-of-bounds access of component_dais[]
      https://git.kernel.org/broonie/sound/c/f9e437cddf6c

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


