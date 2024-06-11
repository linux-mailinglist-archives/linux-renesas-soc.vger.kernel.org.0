Return-Path: <linux-renesas-soc+bounces-6045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C92C903932
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 12:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F924B20E59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 10:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14DD174ED1;
	Tue, 11 Jun 2024 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eenARt4a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE2174EC1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2024 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102813; cv=none; b=qhHzHJa+8GKnFMAfXEBF3vCNF3Y6aLdtmGefZ0Ld5GC0qpXrEC1XcVYRygscCl17mYoLXXDsJJ9bFWRmpH18d2LigRf8lRjyeJ2TkAdJGgoiMkiRI8mhRbb4uUpKQyRtZ5aMdKA2oschKd8HKyZaMU8grlcCQoFBZDyqlCmoisc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102813; c=relaxed/simple;
	bh=nDrRh+0BzKGjKmDvWB+QCX94rWUDLfInDiNme7JUWYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dDIfhDIT5naNsEl2L3yI+QfvxhtQPIg9Fse3bCg1R1F2szIvlU3I/ExYBGArsiSfxzUHCagCblYPVgfQL3e8ZERqLyeKzBRL8D1Opg4OLiObsoUy+N3nUWMgJ6kxGjyR/lWRFFsWnuqpBZ97fvlesnSG3SS4M0s6ZDaPZFwf8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eenARt4a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D13CC2BD10;
	Tue, 11 Jun 2024 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718102813;
	bh=nDrRh+0BzKGjKmDvWB+QCX94rWUDLfInDiNme7JUWYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eenARt4aeTLTCY+yBW/ndEy2+nkKIod/sCKLFQqQhDa7Myd1QL6/CQLY+qopmFLRY
	 UgymD2YLcr+Di2wyxBcoCqiN2xWpmQJNNsEInJMYnzM2iTJvMwkh0sldZP7gloS2bn
	 u7/BU0CLy3HTSFYT9R6iYZ5WglXE1ZgckhgQUUBIv/DWaq7JpZUz1l9UWPwuZlW8qe
	 XX0MooivD5o1ijwp3MgvIliK4kivLHZrx5xS0zblMAow/A8TtOUw9+sqlkiOCNTLBB
	 vGafEEbctQ02S3A2gmP6xkhrBq67c14prElj7yDeIMMIsjuDEpkya2s1/iulayr16E
	 fwHOXecgaD6JA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tuomas Tynkkynen <ttynkkynen@nvidia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20240610195532.175942-1-biju.das.jz@bp.renesas.com>
References: <20240610195532.175942-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] regulator: core: Fix modpost error
 "regulator_get_regmap" undefined
Message-Id: <171810281111.185664.17441675732764457028.b4-ty@kernel.org>
Date: Tue, 11 Jun 2024 11:46:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370

On Mon, 10 Jun 2024 20:55:32 +0100, Biju Das wrote:
> Fix the modpost error "regulator_get_regmap" undefined by adding export
> symbol.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: Fix modpost error "regulator_get_regmap" undefined
      commit: 3f60497c658d2072714d097a177612d34b34aa3d

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


