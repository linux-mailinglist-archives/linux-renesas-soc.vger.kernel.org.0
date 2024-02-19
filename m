Return-Path: <linux-renesas-soc+bounces-2951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38985A19F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 12:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D7ECB21BE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 11:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3C228DDC;
	Mon, 19 Feb 2024 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ih/bVORY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CD128DBC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708341049; cv=none; b=FoH2jgb06jgACWWnZRF3ds9srVRhBWjBtqKzI5Qf6V4u87uR4ntUvZ04SjfIWo/28g8BzAVFcj9Bax+wdMD+mlBYjzEsZxPfJcNdI089fMHOedZxpER8nuezKbUI1FX2xSoLkxgEoZIKGd22I7q2GwFnjWRAo6IQg5W282//DmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708341049; c=relaxed/simple;
	bh=ExH5gFMR3bmsC+LpsOzFCbrsmQvvghd3L/rsnEh3Kd4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=JM+r/EwXeamrHcMqO8aceUS8s6UCmb0HAmZ7KRmaFNKTcBtOdtZziSc0p1wqBd8f/xmQg9oXwCF9vbHsf33yPuRyGRqseP6wT7bUPFZruvG+gXoJ76BJePyNjB74IlCUO+43bVCDWOk5V/elJBlq+aAlgjv1xwv3eF+pfmqgJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ih/bVORY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0C7EC433C7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 11:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708341048;
	bh=ExH5gFMR3bmsC+LpsOzFCbrsmQvvghd3L/rsnEh3Kd4=;
	h=Subject:From:Date:To:From;
	b=ih/bVORYN1EmPfRR+6zyhRzTiPt5SaG8E7Q7wYIQcn6L75TM68TYdvBcPXswKIjH2
	 9BOQ8nxKfXTka6oA7lQnIsEK2m1NNtO9i8eC/TqpuJSt1SkUypp2mbi4gxZwb26IkW
	 Ni8eE3b0LT1K567NnhGNSIeR2jPhePQjLcxQkg1G6tR3XTXHwRYO9yMnQjTnRMBMMI
	 nZcNGziG95Kxze+hfjueka1k02pfjSvAfbdPzN+QJEJJHZkYvXL0OQ6Oton4Cfc5yq
	 GV5uy1h4H0v0aT9DIKtiOmbltsWDzAa6M5YD0NEa9Z4Ns+LHwHvYfTa1KxSBsrthar
	 wonaXY+G+jzPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B730DD990CA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 11:10:48 +0000 (UTC)
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
 <170834104869.24445.13556357764176642350.git-patchwork-summary@kernel.org>
Date: Mon, 19 Feb 2024 11:10:48 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: ARM: dts: renesas: rcar-gen2: Add missing #interrupt-cells to DA9063 nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=826040
  Lore link: https://lore.kernel.org/r/a351e503ea97fb1af68395843f513925ff1bdf26.1707922460.git.geert+renesas@glider.be

Series: clk: renesas: rzg2l: Add support for power domains
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=824310
  Lore link: https://lore.kernel.org/r/20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
             [12/17] arm64: dts: renesas: rzg3s-smarc-som: Guard the ethernet IRQ GPIOs with proper flags

Patch: [v4] dt-bindings: renesas: Document preferred compatible naming
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=825816
  Lore link: https://lore.kernel.org/r/20240213224259.2967533-1-niklas.soderlund+renesas@ragnatech.se

Patch: ARM: renesas: r8a7778: add missing reg-name for sound
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=825855
  Lore link: https://lore.kernel.org/r/87cyszpwmp.wl-kuninori.morimoto.gx@renesas.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



