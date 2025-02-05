Return-Path: <linux-renesas-soc+bounces-12866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A75ACA28A9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 13:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BB941636C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 12:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5223922DF97;
	Wed,  5 Feb 2025 12:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTe1WtGJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FCC22DF94;
	Wed,  5 Feb 2025 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759466; cv=none; b=F/ERfK//JPYRpbKXdWaK6e2FX/L+uzfOZUVjScHtqD05CWCuq5ZbnBR9sIyD/NY6ylFllh3L6wnxqk5zFMXc/4E/hZy8eU3+Lvqc8zzedHTHrv3Y8nVYp/XEepovheq4TXj2JDmlt+igLlS+UnunwNKmGkxrun/onfneNC4PyrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759466; c=relaxed/simple;
	bh=8iLfXxhY+M8Fm+e3Wt34iJHyPl/Cf4DZ4AeRbBEWBC0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F1mk5PQqS/6MP5X8iOudQxvlxuXF0L9bO5pltF1sp/RLk4A88kAF0h0AFbt8TalhpP6XNYfhMwLLbuDgRqwVF3rc81iynUR0FFuD5gqCMqhowQYUQHR38kSgRGrgXHsn798Nb27l4Po7Dgzd8kxsCFNZG9XDSRNfPCllwNEEL1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTe1WtGJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0915C4CED1;
	Wed,  5 Feb 2025 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759465;
	bh=8iLfXxhY+M8Fm+e3Wt34iJHyPl/Cf4DZ4AeRbBEWBC0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MTe1WtGJDjMorHOW5FQDX7stZjlSIR5BKBb1nxgTOddR23mvtzJEQp2EjZVzmA3ZV
	 ei0+GAEzHchEnUdtZuCOwUR70IAIDljD3wq+OGubiRws4c3KBEcXPM9JwFjqMDX6Gk
	 lky7XZSV1SQQh52/glHKiLqJ/TdCv3IEsCErZxgT7Uxv/iL7+fAUtiW3MpcUjZFOBV
	 SyoHRBf83M+wojx/QWZqkjyOvhGBY5WXJPrts5deDGTOo78yBsvNIeO/31PsWiXsYY
	 RpRrzKbzFOfiJP7hgh6RT8xYP6wLyWG3c/UqBnSWoLrjM6cUKpQCbJ1T+HjrGNs4Ke
	 ZapRkjw0hNyDQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be>
References: <db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: soc-core: Stop using of_property_read_bool() for
 non-boolean properties
Message-Id: <173875946347.32457.4558405909681470251.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:23 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 22 Jan 2025 09:21:27 +0100, Geert Uytterhoeven wrote:
> On R-Car:
> 
>     OF: /sound: Read of boolean property 'simple-audio-card,bitclock-master' with a value.
>     OF: /sound: Read of boolean property 'simple-audio-card,frame-master' with a value.
> 
> or:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: Stop using of_property_read_bool() for non-boolean properties
      commit: 6eab7034579917f207ca6d8e3f4e11e85e0ab7d5

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


