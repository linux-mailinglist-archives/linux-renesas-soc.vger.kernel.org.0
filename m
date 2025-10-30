Return-Path: <linux-renesas-soc+bounces-23902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC5BC1FB5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 12:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E7653A8DEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 11:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D672FB09E;
	Thu, 30 Oct 2025 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdrthlms"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ACC2E0B5D;
	Thu, 30 Oct 2025 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822543; cv=none; b=EhPYQBAdc5TiSCNMgO/O+Pi9DZaUNAaCf5z2wD5UQvDIqwezL0spujzps6BWwdCked881XpDp20oDSMZihcqVxTYgUkeuFWY/L6Wzs50Mwc355c2O3HOOA3SZotJUxOua7Ro8AMsg5RdIXYV+fR5PFuKwFBuBrddzvd/h4t3T58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822543; c=relaxed/simple;
	bh=LdRb7dIwGQ8g4MbOV0cQSZTSbAi7GxFs7VxhE+9JaSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tRrdANnOBDoLUshzOHiRzyVqicA13aYJamr7FpKZ5HGC2Kvbc5+AFdU9yeYShzZwf4LwkISlgnv1DcMXYBX1cdElfvJftQXVPkZA3w/dY15T3UkRm658ANtL3LGau/vKbOMRRa+K/ZkmSrXqJwyk1Gb2trFa9vpZJ3hfiFNafN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdrthlms; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA55C4CEF1;
	Thu, 30 Oct 2025 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761822542;
	bh=LdRb7dIwGQ8g4MbOV0cQSZTSbAi7GxFs7VxhE+9JaSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mdrthlmsBjCWKYF3UigvX2apk8OcQJN9OreG5B6ZbS5ABSgB/efG8HSlE8/03S9Ic
	 pzIvKQfetSkMe99DJMcRgGXtKZDb1LWqs9DLoj5WjxC7TQ6k+1eFXPoq6YB+ZlF3ak
	 rKVM1421Pus21DPMmXv0LIngC7ScQDTpf/Ej47NnXeB6XCftyQyu4fQq9GnZR2Kv+E
	 0vOlusOBBDIMp2fHad+1BUZIZnn8W5IyfIK7NoTwdsA7yteecAftLO9m+RgQFfjSDI
	 ZCFdh4Z/foY+PerZSwJczf3vMtiML8pcXZ2KajywP4fE+p/+vFU13uaCp6SefmrN0+
	 SaqJOmY5yTnFg==
From: Mark Brown <broonie@kernel.org>
To: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, biju.das.jz@bp.renesas.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH 0/2] ASoC: renesas: Fix clip sounds
Message-Id: <176182254030.10093.1174073238934583094.b4-ty@kernel.org>
Date: Thu, 30 Oct 2025 11:09:00 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 29 Oct 2025 16:11:32 +0200, Claudiu wrote:
> Series fixes clip sounds that are reproduced on suspend/resume, from time
> to time, on the Renesas RZ/G3S SMARC Module + Renesas RZ Carrier II board.
> 
> Thank you,
> Claudiu
> 
> Claudiu Beznea (2):
>   ASoC: codecs: Use component driver suspend/resume
>   ASoC: renesas: rz-ssi: Use proper dma_buffer_pos after resume
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: renesas: rz-ssi: Use proper dma_buffer_pos after resume
      commit: 22897e568646de5907d4981eae6cc895be2978d1

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


