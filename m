Return-Path: <linux-renesas-soc+bounces-17239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CEABD098
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 09:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E05294A4C48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 07:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7784A1E5702;
	Tue, 20 May 2025 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NV3w8nnr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5317F25DAFF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726795; cv=none; b=MPNf7pGP2BN75hn+3xX8LWTPuI4I5FXW9aKBDa+v6c+qsqK/tXNDAy/L/1oeePpE53oksx05gaqwgG2sKmb0PYoCw5SFbZybHhiDYm0xPYp/xXW16DbzVfNsImWQFpAhrF+aRSvPtvpMrCiB6Po16kbYbxMBWJ1TYLut7LPj+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726795; c=relaxed/simple;
	bh=p8NsnCMEauNwHW53yEk+qpmo3w+d8a9waOZBhqJPMqs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=propLbz7iDrHeDfZ1eupUVyPUJe8UrNoNELJ77KPVoyKe/R3Til9TSRQxZ8HeTXLTPW0d04m4byob/64Xfialqs4GYmoaGcgalulegOPskfJH5QmS0i98Gq3da4bZ8qNFgPV4QuEJd+0+BV8d05zUfIzQkDTQbaddO+HV3XJ6mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NV3w8nnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD257C4CEEF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726794;
	bh=p8NsnCMEauNwHW53yEk+qpmo3w+d8a9waOZBhqJPMqs=;
	h=Subject:From:Date:To:From;
	b=NV3w8nnr5YBljof4Iiv5/t9v3JYXcSGUHIxE4Trsvj4t6lmMgBI4shPQXn4fdlTDY
	 pejmYChMBeGaaxLS8FAjTq5eJ8JB0QRNV19yqmpyBHYj1Ug1qzxz8Q4A6MClr2iXc8
	 gpW+VKHw9W9ev1qAH8SBAm3z1ikIZ+DuYvv9HppNeS8MPj3BGfNZi5KGoTgxHjGVWZ
	 7g2uqFl+IC3lbskSGXigWPhY3DmJFAQAn5WQ7NQpHtwxmXs8+jxU2DkfdXhttoL/e3
	 rOAhWtIPg/oq22jB0B6m8ENmwVvX0oPPBY8y+SFu49APVZ2qqhGXPUdmiNeupZid6o
	 F6s3f1DbaE/7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE9CB380AA70
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 07:40:31 +0000 (UTC)
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
 <174772683043.1201691.9375359741678588714.git-patchwork-summary@kernel.org>
Date: Tue, 20 May 2025 07:40:30 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups
  Submitter: Duy Nguyen <duy.nguyen.rh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=964038
  Lore link: https://lore.kernel.org/r/TYCPR01MB8740608B675365215ADB0374B49CA@TYCPR01MB8740.jpnprd01.prod.outlook.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



