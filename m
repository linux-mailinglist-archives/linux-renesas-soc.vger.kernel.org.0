Return-Path: <linux-renesas-soc+bounces-17994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC4AD2856
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 23:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6FFB18929F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 21:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB5F41C69;
	Mon,  9 Jun 2025 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pv/uXhpu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60062222598;
	Mon,  9 Jun 2025 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502852; cv=none; b=NyQhC81KbUWAxF/zQEz/k/uD5QRRxKk2CY9bQ5hgwKDw31bfsjia56frwZS2vr9Y+hi/QOAcgq37yPyAXZf+FW4NL/UUQkJaJirIuEgxAYSAmuXymal03pHhiGEj9dd1lDnb/aG5jbZ47Mz+kiHARhajuu582qk0+AkerNRTd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502852; c=relaxed/simple;
	bh=4kqJW1ciMSPYKms3Y+JdGC7f/q+aGKCLpMKAts86L60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A3mcWssdBIH3WzJNM+khUew62WerBRDg5zhHRzq63KH88Ib29lVMDoD8ZvN8DGrQApbLDlxkUg0fE6rME6XdlODyc0Icva64Qgl7E8oaBOcHZ4ktifeGySdKqJi6vwwvbYvsmrh4MdMIZ0zG0HEuOquW461oT9qKA7VVAno5+uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pv/uXhpu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4ABC4CEEF;
	Mon,  9 Jun 2025 21:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502851;
	bh=4kqJW1ciMSPYKms3Y+JdGC7f/q+aGKCLpMKAts86L60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pv/uXhpuR9ZUpJOCDfH4EtcgNdI2KVijdLyoVEFoklMIpiFMXuyX2w2RiUjll+Dvc
	 epnH1q4y5U/p9R7+bGNyVh3F+MQdhXLSQZ+x8o5rRx0qDW4PUatpKOyj3U0dFTYMJT
	 zqx5VSP9aGlyp5iR9xCEgkHn/GpMkIoyljRmwtR1iAgR3Smy3VySb50Wb92eHG8abT
	 M6byrRuwZZwueXNpDOnevEJgZrHZGA1ohfpmhNVUsgbIfbl5Sr9ukuT9thIptFp/Fb
	 mcuG/xJHfU6Rn/kmzdUWD+JvTaKi6qqhiQFtv9v6qVCMXsUJFal50MzDGwuhHcyAL3
	 ugxLnp5j/933A==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com, 
 lgirdwood@gmail.com, jbrunet@baylibre.com, neil.armstrong@linaro.org, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, Ai Chao <aichao@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250603055109.3154061-1-aichao@kylinos.cn>
References: <20250603055109.3154061-1-aichao@kylinos.cn>
Subject: Re: (subset) [PATCH v4 0/4] Use helper function
 for_each_child_of_node_scoped()
Message-Id: <174950284791.277844.12094958567890827693.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:47 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 03 Jun 2025 13:51:05 +0800, Ai Chao wrote:
> This patch series introduces wrapper functions for_each_child_of_node_scoped().
> 
> The for_each_child_of_node_scoped() helper provides a scope-based clean-up
> functionality to put the device_node automatically, and as such, there is
> no need to call of_node_put() directly.
> 
> Summary:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: renesas: Use helper function for_each_child_of_node_scoped()
      commit: 077caf1d1763e069239101b4a72351fb38d37f13
[3/4] ASoC: meson: Use helper function for_each_child_of_node_scoped()
      commit: 618abc785e0cbe9993f7217c9f8ecb1cd2478e4f
[4/4] ASoC: imx-card: Use helper function for_each_child_of_node_scoped()
      commit: 111a2c8ab462d77d1519b71b46f13ae1b46920b4

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


