Return-Path: <linux-renesas-soc+bounces-11884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E492DA02FF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 19:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71CD83A2917
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 18:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D861886359;
	Mon,  6 Jan 2025 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNEWKEul"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5347360;
	Mon,  6 Jan 2025 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189330; cv=none; b=fxrRod840zkb9q4FhAP/sIBw4fyN4R5gcjYQwF2bIjUYkC4Tsa/jFdb8cz7FoMC0XzknOmYBIO03Pc6pH0xev6w98In9hWJqVokYGJAmAfWiH3Qz1GwQzKhFLF+nAWpQSX8sIgVF/2v0JZ2sqvfPdTaK22hox2xtPbso/lBND50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189330; c=relaxed/simple;
	bh=xmqQzxW2ZIP2V1N9lpxuogNDi9JLmgL6YehmAoZiAiY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=my2Rr2D748Cw5s6wBI9JnIqpUgFAHrEPz0KaY3nmg20Dz9urXnBbKKK/a9NewmjNFNlCsWjX12P949bPpEPLfXh9RNRqW5oJJt0OvyBu/CT8oqUPGTVXuSSirdj7DT11Ga6ryREz1dl3M0OYINMTUEBvcEtqrx51MPgebrix+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNEWKEul; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97183C4CED2;
	Mon,  6 Jan 2025 18:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736189330;
	bh=xmqQzxW2ZIP2V1N9lpxuogNDi9JLmgL6YehmAoZiAiY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=lNEWKEul+U/WRBsfvs4gqNjA6rD4pILoILVquNUq0rxh884Us05l0yrxDVKDKDyhQ
	 s155BLBF/cEgrRfHYPhpa2OZzdqKFi9TVnHldt2Dk0nmqVwSXG9eOgK0NFtgzaJosd
	 vh5IW4H7G8TE5eu9IqjovklGuXrbmCzvAo7Nsadcdq56UD7VhUWXliDr62lrRd7BIZ
	 izm+Oha5Xx0vy1atHBdOE7GnmLo2k/1vPwvXmCatva+X2pamVIJGjinZu4+S1LUGc3
	 sNg7h+iQuZ3HeO8+/q3NeYt2k+GizDWe5YYqOTqF8+/rBqkY77shZwArJS+SGDUJ8+
	 7UMgYEoTzP2mw==
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ikrhrfws.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikrhrfws.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: renesas,rsnd: remove
 post-init-providers property
Message-Id: <173618932836.201670.16655064635317526485.b4-ty@kernel.org>
Date: Mon, 06 Jan 2025 18:48:48 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 18 Dec 2024 00:30:43 +0000, Kuninori Morimoto wrote:
> commit f8da001ae7a ("ASoC: audio-graph-card2: Purge absent supplies for
> device tree nodes") marks multi/dpcm/c2c nodes as no suppliers. We no
> longer need to use post-init-providers property to break fw_devlink cycle
> (And no one is using it yet). Let's remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas,rsnd: remove post-init-providers property
      commit: 530e5ada1c8efb8bac7dad668f4176260d13d4da

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


