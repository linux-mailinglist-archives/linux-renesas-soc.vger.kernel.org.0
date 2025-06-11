Return-Path: <linux-renesas-soc+bounces-18122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D032CAD5AFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 17:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C71B0188B302
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 15:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE471DE894;
	Wed, 11 Jun 2025 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxqzvwU8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F81DE4E7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656609; cv=none; b=jqUalIxt9dq4/Ycszs5LRz14QGsxs/6JXnhregJYGxyWVnqf26EkM3pM5iseq/lx2zhqs9hJGDkL4Bbjol3hpEVOZm/sWKBIOwd76/n9nzbCTwZPb+GF1GjHuCY4x9cVtag0S2/JWWQfNL5tf4s1a6tMyjnybY1tUeu/RKl+JpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656609; c=relaxed/simple;
	bh=nYOyxTm0Jn2vrAgeyWkPSPKnq9L/YExq6J4YfvCyaPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ePvkBhPAopsePg0Po9txmuCa/3oPERa8/dV1fJucYhGkQnRwHZKG1ip/zkBRWwUp0M6hLBplbg6JOfs3AXVQFdQLrMdGeXjXQPKQWvbOFSG3X7aPt+gyKQpQfSEe6i6Nv6ICLVJm6HX62IVLZ4lTQF9khV2bcOGTkbOAl5LVh6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxqzvwU8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9BDC4CEEA;
	Wed, 11 Jun 2025 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749656608;
	bh=nYOyxTm0Jn2vrAgeyWkPSPKnq9L/YExq6J4YfvCyaPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AxqzvwU8TebnHervLM08aFajfTNx3pw4mNUc1mA+AgAwPRaz797sASz8gqr5gCAzJ
	 Ioivlu7Vy4mpJ9f/AOkue7jvoTpVAUMivyb9gOhp2P65I9owP5MWByFS7COutemSkz
	 5lKUFa4xAQQHEDJEr1MSujWaID/75iKSWEaUW40NvqXmmoshoSRdBadmRTxtoL6oDK
	 WfDxFmp1qHoj+YMa8QAxiYdIPeIcUI90bBjxKbYSbcwgN9zbRGmioGDDjL4YNEhF9s
	 O7HmYzjV/NMmuKs+p6J1GYxCuEuGkJpd5K++Zx0gK1f+imCYYNVVkoNYEYNq41WdJU
	 jAGFLqhKIMXYA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: kernel test robot <lkp@intel.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20250609223012.87764-1-marek.vasut+renesas@mailbox.org>
References: <20250609223012.87764-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Fix missing OF dependency
Message-Id: <174965660685.52384.1301110608042859548.b4-ty@kernel.org>
Date: Wed, 11 Jun 2025 16:43:26 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 10 Jun 2025 00:30:00 +0200, Marek Vasut wrote:
> Add missing OF dependency and drop of_match_ptr() use.
> This fixes the following LKP report:
> 
> "
> >> drivers/regulator/rpi-panel-v2-regulator.c:95:34: warning: 'rpi_panel_v2_dt_ids' defined but not used [-Wunused-const-variable=]
>     static const struct of_device_id rpi_panel_v2_dt_ids[] = {
>                                      ^~~~~~~~~~~~~~~~~~~
> "
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: rpi-panel-v2: Fix missing OF dependency
      commit: a4eb71ff98c4792f441f108910bd829da7a04092

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


