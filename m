Return-Path: <linux-renesas-soc+bounces-252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DFE7F8A3B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Nov 2023 12:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5936A1C20C40
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Nov 2023 11:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80DED301;
	Sat, 25 Nov 2023 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIWVavDM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71993D295;
	Sat, 25 Nov 2023 11:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDB5C433C9;
	Sat, 25 Nov 2023 11:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700912230;
	bh=u3Ud7opf3X4nqSGw+IYKVKYse4XkAAm5XbEyGIYTOsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iIWVavDMX8IIeDCrFAW/9zo0uBiYVTpuBL154mdUZyTf/phmfF6G4/Nr/80KelrKX
	 ye78qPsyZfB5pF1+3eooBB24/CtiTaA7i8tf1H4UFk0jYR8oaM+8iVF6a9+gmQlHym
	 HNZ1p5+Z9F/8pua29v34JB4PplpeslfN6VCZ1B9BkgK3K8PAFzjnwwtzoArZFFjBSJ
	 xoK8/T9rWaKH1INhp5+Fj6Czlgt8Pp7jZJ/pifmAw1wmv5RsePb3TUk/DGIeFlHDT1
	 c/Hu4vxkMhsW4SJTeaw78VKNQ5gEVUye/ztPBUtc38IYrhIUH/cmJF6s4i9KeY0Hre
	 MlsikZsY0euQA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Seven Lee <wtli@nuvoton.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231124083803.12773-1-krzysztof.kozlowski@linaro.org>
References: <20231124083803.12773-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: correct white-spaces in examples
Message-Id: <170091222492.2632109.16193424114633167533.b4-ty@kernel.org>
Date: Sat, 25 Nov 2023 11:37:04 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 24 Nov 2023 09:38:03 +0100, Krzysztof Kozlowski wrote:
> Use only one and exactly one space around '=' in DTS example.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: correct white-spaces in examples
      commit: 29b0b68f25ae6f9454c3e1c31b054595af0a80fc

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


