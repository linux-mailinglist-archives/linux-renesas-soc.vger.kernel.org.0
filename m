Return-Path: <linux-renesas-soc+bounces-19698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC99B1221E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jul 2025 18:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AF8317FD92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jul 2025 16:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E173D23AB90;
	Fri, 25 Jul 2025 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ0MB5qh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925C1E7C03;
	Fri, 25 Jul 2025 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753461393; cv=none; b=edCYz3Y5rx+Ul3RIgwv2r/50ai1kTN18pkj0l5SL2vrUtfCDhhghFF3n849Q82HbHWhZiKLLd7e4f3Jsb1hpQCKktlVsnPjWhlyqDbzLoMxdQGPESNY/gkeNDY7GHe1tKIOXvw6QP7RVIhf/xfCdCpHW88fTUNm//nGnRmHKmfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753461393; c=relaxed/simple;
	bh=asrbb6DVZDZ8pIBQBaNChqXRYCThEx6uNq9qc0Q0x74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g8W9lb9znzLgNsDhuaCBotQH9fxnqJ8rdLxA8jSt7S80lqZqVKa1/nP82CUOMewWux2nhUaN5QtXWtFSVvyMtKWj3PWgtvaIuAe+1aKoKQPNuh+rQbzQd6VLb3ofgWlt90w7uelzW6up9g+3KOWMTt+ng0o0SRZwmuUzIecM+mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ0MB5qh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65649C4CEF4;
	Fri, 25 Jul 2025 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753461393;
	bh=asrbb6DVZDZ8pIBQBaNChqXRYCThEx6uNq9qc0Q0x74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aJ0MB5qhsX9jrbNeFCi/49tRYBoAZ/ppOAKmpH7nNb1bARQZM3V3vCXS/JodL+Hsb
	 ptO21p/Qz/AYkaFqUlXtwp+yG3KJz42QXKG12pyzqEuTdb07FozLMwssu6P66OdbbD
	 LB2051qhzUoT8IhzJswsbEv6I5qQ9/ntdOaQxPpk+9WsBbJGt7enqWxMTCRyO0mEKB
	 Ia+tqaM4TtRmhObqsC7vLtfJnVOgcO40ezriyh9P5grQLrkjrA1jWMAUTSIWRUABGa
	 I2EjuVLTPdkkJwwWnTmc2nIETFue9D4DCVR5zU3HCD5K0G3VXBgbjCz7jzRz3D4fT0
	 tEa0CkcV7NZEg==
From: Mark Brown <broonie@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250725110337.4303-2-wsa+renesas@sang-engineering.com>
References: <20250725110337.4303-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] regmap: Annotate that MMIO implies fast IO
Message-Id: <175346139205.1148760.10285893252004086890.b4-ty@kernel.org>
Date: Fri, 25 Jul 2025 17:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Fri, 25 Jul 2025 13:03:27 +0200, Wolfram Sang wrote:
> Document that using the MMIO helpers will automatically enable the
> 'fast_io' parameter. This makes the used locking scheme more transparent
> and avoids superfluous setting of this parameter in drivers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: Annotate that MMIO implies fast IO
      commit: ffc72771ff6ec9f5b431a86c4b00d8ef0fea958b

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


