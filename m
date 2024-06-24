Return-Path: <linux-renesas-soc+bounces-6684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C29149B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 14:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9202281F74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 12:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A18513C67C;
	Mon, 24 Jun 2024 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlaIoamr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC513C672
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231656; cv=none; b=GxfVAgB6SHQZRznPr4AVbykhPpSDk5UimM/ATlaSWyiEe38KDsF2sREeaM78T76BVRn/lK7R4Fd8mj6sNrQ3iafwbcqhcfWBu8yrCOKJHCC8SX/f/R9eUBxSxGBVFZxwawao0wIZqXbPnMKGZzJ4l82HC4NftMOBBxwaNrvBs00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231656; c=relaxed/simple;
	bh=lf0XH3N+y3mMekjv4RYUtHCSDvu5H8V3vPjOV/XL/zk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=E296QlHv/RqTeMwbBHDMxiOv+VZnDaIzktudcH73oaSOg1V6dsHMNZ3+hloi1ETPGfhMtx/R17RYgdLZFfMPdk4r9c2MEfM6Jg+lFVvKN+BpgfUJmfB3v0ZToSymBDAgtzfDHQExUrl5jGSK77NN5Onr30HQ0W0BuodS+KjfRDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlaIoamr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B9C7C2BBFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719231655;
	bh=lf0XH3N+y3mMekjv4RYUtHCSDvu5H8V3vPjOV/XL/zk=;
	h=Subject:From:Date:To:From;
	b=LlaIoamrfcXsBE+aPH3/NJPd+8+F8NxpZxD5PCS/joVXY+aM1JcKz1/AvrYRplaP+
	 +YCSTnoKs0SCbE/Ks25GLuCXlUCE5iW5mRC5AN3edi+3WB8HlD23OnExMN1fIXX5cM
	 cVX9G33/LYSWem9wQbu4CmrFlPmXFM7FV9NsoifzjxjP4oHF6tySZfFzcqJKo01Wg9
	 rvp9Qij1yNi24Vgb5Hh04p7XGrOZQT/G4EhyPd0j7GW+DmAj6p8K/UqMj0lm2VxNzI
	 8SlESOvCN1cQnHpwXNrvhnKjkjtIa4Sb/x0i4Na7lFE/ufFvmgD84bex9TZsmUTShu
	 flh4DqdLbih+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BA23C43446
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 12:20:55 +0000 (UTC)
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
 <171923165550.8358.5610520392432286559.git-patchwork-summary@kernel.org>
Date: Mon, 24 Jun 2024 12:20:55 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: dt-bindings: i2c: few fixes and cleanups
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Andi Shyti <andi.shyti@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863804
  Lore link: https://lore.kernel.org/r/20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org
    Patches: [1/7] dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
             [2/7] dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema

Patch: regulator: core: Fix modpost error "regulator_get_regmap" undefined
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=860528
  Lore link: https://lore.kernel.org/r/20240610195532.175942-1-biju.das.jz@bp.renesas.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



