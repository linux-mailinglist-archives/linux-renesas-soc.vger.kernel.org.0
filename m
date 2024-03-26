Return-Path: <linux-renesas-soc+bounces-4031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4806B88BD44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 10:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C911C36887
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 09:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607AA3F9ED;
	Tue, 26 Mar 2024 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukBM56vL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E993DBBC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443934; cv=none; b=J7rIbrZD7k8cZuLon0r7MUqmGsmALucSlHStUxO2BP9n7hmNCDSjDq2LOb/B81IxQrhci7wV4NYsnF9XuIJ4/uTB+wBkOJk+jyats5HsYe2WOjFgKwhup/u2TwzMa8/aqAsvhpe5qc8iijj+ZiK8icA63/rvjN5SL/ThkMkoqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443934; c=relaxed/simple;
	bh=P/qJ0M7erkkrw8f59Wz4D4aLsDBBxJmRc/Ov93PT9bc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=KrhYJH05Gk1hsBG9RwiYFG8/QmTAoaFg5Wz4LEt8HyrChHulUrZVpvfBdKFQkMiQarjJwxo2jU/RJxku65+299I6tZN8ZpJdFbxvHO5mDBnL2nrQuswYQmtIyivLXIOYdHkFdamTQSsUWg9rsZ3OHMQ19JBacjT+JpczGgv3cIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukBM56vL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2A02C43390
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711443933;
	bh=P/qJ0M7erkkrw8f59Wz4D4aLsDBBxJmRc/Ov93PT9bc=;
	h=Subject:From:Date:To:From;
	b=ukBM56vLjSuc17J49z9M/zxbkndjE8X5QM/cNOxAEayEGiDsF2oXTGtMYGsbTkmQR
	 xszQ6zTCvYv/lChp5KKemKE5LfcoAmtiFd3zQ77afUvICxLpdfR085tkoOnQRItPz9
	 PryxgtdDUGqCZrFzA9W1Gkc3mtC8UKEogGgrkalneGLOuk/KWHRi4yAKCLeSSmHjBW
	 M2Z9rkcPa/OcKyv/JVVQ4G9V8cVckR2WwwSYorrF7VThnzyExuaBJ8fNk05aj+uu4w
	 fzur4itTttHrtwbZkNJIdvLIVRUJ+ZbgokKPSDeZ2oW69jw3+vy6tlb6r4ZbQvdJ2O
	 Ethwi1tHNDwRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5958D2D0EC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 09:05:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <171144393360.18039.7079110180300121440.git-patchwork-summary@kernel.org>
Date: Tue, 26 Mar 2024 09:05:33 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ARM: dts: renesas: Add more TMU support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=836468
  Lore link: https://lore.kernel.org/r/cover.1710864964.git.geert+renesas@glider.be
    Patches: [1/3] ARM: dts: renesas: r8a73a4: Add TMU nodes
             [2/3] ARM: dts: renesas: rzg1: Add TMU nodes
             [3/3] ARM: dts: renesas: rcar-gen2: Add TMU nodes

Patch: soc: renesas: Enable TMU support on R-Car Gen2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=836469
  Lore link: https://lore.kernel.org/r/b7b9fdd6f517a8b29bf5754e7f083d3b71805130.1710865761.git.geert+renesas@glider.be

Patch: ARM: dts: renesas: r7s72100: Add 'interrupt-names' property in SCIF nodes
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=836158
  Lore link: https://lore.kernel.org/r/20240318174345.46824-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



