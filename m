Return-Path: <linux-renesas-soc+bounces-24948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BBBC7A366
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DD689363DD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4B934AB06;
	Fri, 21 Nov 2025 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5oGmVT1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D83446AB;
	Fri, 21 Nov 2025 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735223; cv=none; b=XznJlV9xhhhSBPXcEgg5CVpp2ewuWpSql0DGz5qhT849yNW9HEDKm2xuyUUDynSggo7ry61+jx5rVDMT48L0MPyDxQ0Pmnhn22PDPcqUl68d0pPI1fqGVNsXjUN5JJC4jqvTTegKFLINMWjP3MvNGZ/cn9ARCaEJ6E8UBj/+Xk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735223; c=relaxed/simple;
	bh=EjcuqxgCwNdCpmS/HyzXbelwiQmAF9pC47lj7fWA1FY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u5qGQDonUQRufMageqTDBZDhAQLRfY6/drq1j70lIv1M7ImmCd64qP/f50pK7jjgXSR6o4hNJTbaedwKdn4kOExVXBrqF+B4R3fMa84XiyDtzRnlf10ryH++buS3H22WG3QrchCeO4ZxSOQRXXyd+Pi7TRYxaC/TO2NudmqPxfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5oGmVT1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CC3C4CEF1;
	Fri, 21 Nov 2025 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763735222;
	bh=EjcuqxgCwNdCpmS/HyzXbelwiQmAF9pC47lj7fWA1FY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H5oGmVT1ucH9/PxIYZOtAWU7hTIhC0JSjxLC1qsBc+u/eT5Cvuz6CXYm7njGDEciq
	 vsbTMUoNIG7lsZ7S0tgnrUplnJz6HwKcpTiC39bnS2MxcM1Ca4DtVfbbt8Ahl1CMsD
	 Kbg3hDrmeTFzHDgBwf6p54aKh95K7Ejss57ScZLAZZIOayaf5c4r/fKWoHY/c74rNJ
	 zaFGtWdCwTmeJz2pWjW3Qo66i4PulE6sydCai7nKTD/OsZkXegbYbdY9ccyPm4xnHe
	 /PohZ7Qo91QH8Zwu7zemZbBkEoUyr4PM+J5V/fWe8hCcU1oPJWszClmixwYcOoVXSS
	 CBq54k9TDXJwA==
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Biju <biju.das.au@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20251114073709.4376-1-biju.das.jz@bp.renesas.com>
References: <20251114073709.4376-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 0/2] RZ/G2L SSI full duplex fixes
Message-Id: <176373522063.27158.18194207753711685036.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 14:27:00 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 14 Nov 2025 07:37:04 +0000, Biju wrote:
> The first patch in this series fixes audio channel swap issue because of
> half duplex to full duplex switching during the streaming that involves
> FIFO reset which drops the word leading to audio channel swap issue. The
> second patch fixes sample width value in the hw_params_cache::sample_width
> 
> v2->v3:
>  * Reduced the indentation by restructuring the tests in rz_ssi_start().
>  * Retained the tag as change is trivial.
> v1->v2:
>  * Split the fixes patches separate.
>  * Improved code logic in rz_ssi_start() by using else if
>  * Collected tags from Morimoto-san
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
      commit: 52a525011cb8e293799a085436f026f2958403f9
[2/2] ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
      commit: 2bae7beda19f3b2dc6ab2062c94df19c27923712

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


