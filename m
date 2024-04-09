Return-Path: <linux-renesas-soc+bounces-4394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B642689D423
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 10:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43B77B23B96
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 08:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EB17EF1E;
	Tue,  9 Apr 2024 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="py1M0N7k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05167E119
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Apr 2024 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712650827; cv=none; b=qMGrDUWFWAdd1a/0d9KVgIQpaknWA4NLdR4idFjR0FBQnlMqElBa0y1/BSolH4X1TEUkTDoxuZ8rieX4Tsp31MHZLH08leXywXnlqFW5+lsS8pivUvGztWnhCcgtPVY+kBloZqB/H7kVW0nIDIWGWJi2Y3VLPAOyrv8wQ+6mbsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712650827; c=relaxed/simple;
	bh=w4zbChLEi4WVYNVjfk7Alj/TVWF2NX/CZwBbVRSL2t0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Q4u5u2/8AoOIbK3Vu0uBeAKa1169fKKMLeHOocFdtyRKC2rwJaWjfIvBdgFBUYOgeoOfVuQF30cw/XKZUXhRUSbHBKLvTl0wD6/e3ZL4Vp0B/xAwYFTu4frkLXmjvypbyVfVPSGf87EiCte+soCbu+lFkiwdbCI/SjmO1AyD0y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=py1M0N7k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BC42C433F1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Apr 2024 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712650827;
	bh=w4zbChLEi4WVYNVjfk7Alj/TVWF2NX/CZwBbVRSL2t0=;
	h=Subject:From:Date:To:From;
	b=py1M0N7k6swQMFX4gOfJhziq49DHslRXXYIDFsBJ2BSFQ3rjpWg7j7HuuaZMdOD36
	 e9d7vAIWk/Efj29+gPnXs5PVoLeFCjJjZ32a8/K19U05D/QOeqzQ/ZDohZBltzh0zx
	 yn7OpeMaaoSGPu9aytYiaTMeoRAcSKw0fBLymCQ4n+yjKpiWDNznBZ5MY34wNmC61W
	 EngiL3WM+VQSAgL1BnVD74KgHVUFtJZ+yVICChGFgaM99xffBjCaFR+6XZiRDT7sSQ
	 eI8jWqfH7hMWXPDCBdM9pO3c9iVUSTq8Q636QQNMhkYBLv61jKiOOp6lk9KEXqQBj7
	 TIj8y/dNUG07g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4D9DCC54BDE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Apr 2024 08:20:27 +0000 (UTC)
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
 <171265082725.26791.12452823039748982666.git-patchwork-summary@kernel.org>
Date: Tue, 09 Apr 2024 08:20:27 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: rzg3s-smarc-som: Fix ethernet aliases
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=839194
  Lore link: https://lore.kernel.org/r/20240328065738.3049316-1-claudiu.beznea.uj@bp.renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



