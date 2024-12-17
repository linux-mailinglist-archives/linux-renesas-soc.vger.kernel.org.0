Return-Path: <linux-renesas-soc+bounces-11452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A299F46B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 10:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29EB4168179
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 09:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749F81DDC05;
	Tue, 17 Dec 2024 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEprdshO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC431DB520
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426016; cv=none; b=lcQBc9OFCxK+vdfQxEnk8N4SDuv1eFsSy214CUFzZx7EhjKnWqh+xRYVSGzsNWWGnRfDPyr1/UIS7/A5bqei02FMgikYPiqb1BYTvHRgrWETT5HRYopXrMy2QWZ3ssr/ahV7s03SR2W0gv6mTGYAwcLyN7Yw1VvrNj/PjPRnUMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426016; c=relaxed/simple;
	bh=RCwmFejMk61qo7lHisH2UWh5ICNZ6KPlliSA4HXp5sA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=gH31rqbyCH2RmvlufYEf1fY3zmLLTmfxMtMpCXiITeQ5HEM8bvUc7gEd+fmkBUNqn2UhFZzuRRXvcge+fqBicXOZT5YqlGIQziNqf7rbkPKDFCo9QXw9fdsLJUqnkd6xm+VatgliQzUB+QGW4jn4FVqCRL3Bv+ERSUIWKBtFjW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEprdshO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BAAC4CED3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 09:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734426015;
	bh=RCwmFejMk61qo7lHisH2UWh5ICNZ6KPlliSA4HXp5sA=;
	h=Subject:From:Date:To:From;
	b=rEprdshO3UP7C8bY1/TnEjHrXniGJ1GOJSeHgsPQnepE/PTfiX6WtaTFKVTxykzis
	 smOBIWEVQTfzZsI6Q0V2NtNumKd5pQwNLhrt9eKv19WtEji62FBiO9W1v+hPX3LOTr
	 P+0ZEzq5twegB5Yc7eS32mg/QUx6Z2dVqeJEIDMsQyfQa33RFEX8PsvVgqkN5BHRwO
	 pcSQTApNw5Ua+GSTh7t4zrItRl3Gre0PSEwKEMcr/NfA1V79MNTI0zvBt7AqITEKJM
	 IS2TyHNULz5STNiNKZEgVwD2uxFqgtOXlLSdj7+3iFsfvx8NyCCAc65/fyV1+X6gQV
	 I7H+b8ltBkcSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 259F73806656
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 09:00:34 +0000 (UTC)
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
 <173442603277.821155.15863869518446199222.git-patchwork-summary@kernel.org>
Date: Tue, 17 Dec 2024 09:00:32 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: renesas: renesas_defconfig: Enable RZ/G3E SoC
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=918188
  Lore link: https://lore.kernel.org/r/20241216115327.138833-1-biju.das.jz@bp.renesas.com

Series: Add RZ/G3E RIIC support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=918190
  Lore link: https://lore.kernel.org/r/20241216120029.143944-1-biju.das.jz@bp.renesas.com
    Patches: [1/3] dt-bindings: i2c: renesas,riic: Document the R9A09G047 support
             [3/3] arm64: dts: renesas: r9a09g047: Add I2C nodes


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



