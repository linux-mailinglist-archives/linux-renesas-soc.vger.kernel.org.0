Return-Path: <linux-renesas-soc+bounces-12249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A550A16923
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DB593A4BAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDE5194C77;
	Mon, 20 Jan 2025 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fttCptgO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191771885A1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364817; cv=none; b=CNx5skTz/kmQ4mfGGGAZZdhLdnv4/iYrxZnWVPbtneAPc5e50aHL3YVFwrNn3r7rGe2uA3SlFJNHJI8EeT+LXANH4GXHbq5qWBUi89YovTP5XaLtH5/Rfkj77ktQNl125grHO9jfcAB/QwxTnmNETlJHLXeT1ozf6fEbOvmVOmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364817; c=relaxed/simple;
	bh=ZLZVbxtFYlpDSWnT/OgvqJM7MvDLnT+G50vefzhd/Ws=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Hm6pbLq+2PwifZL5xorn2T8F7/kN2mWIeYrpEEV+iGLwIOpE8L+t4WalGOUWhPFVDETAuFPiPrGQ+2ll7uQUQGW4Kn93YwBjonSh8VE5Qr8jyf4IrfOAa2X+LBw+15nQt6t8GALRaj4GX8JVnBc5yLwzo6SrGvtRbsArBjVUjCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fttCptgO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889B1C4CEDD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737364816;
	bh=ZLZVbxtFYlpDSWnT/OgvqJM7MvDLnT+G50vefzhd/Ws=;
	h=Subject:From:Date:To:From;
	b=fttCptgOxD2QMNWC9q9PQ1GCYgml/3Lwcl0HqUe3DETUxskE9xMdhBX0dnArrg8TH
	 mbiXEKuETJYhA70o2/kNn24YMXemREprx8vgjGc8nk038i1UaqL2dhkpkn6heaK+Kr
	 Biqyuec15NTwKfT97UOLp5WmIdl2lJXkksRG5OwTxw+GCQgXPrB+ppQAfSc+w5cjGz
	 qut/uXtC8BBDPVt4B1T8r0x3h7Uxra7nTI3saZ0OnZBtDMnCAlWkvAnVZixNHn0G4n
	 yZiehDfKjF+Y8ArxmIthEEx0T0Hk7wrxZUx4KbRa5MBpIQu1bls1WWNCcQeB0SKEQk
	 ry16ZKKxsHB3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 79CD5380AA62
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:20:41 +0000 (UTC)
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
 <173736483994.3457803.17985933362517216286.git-patchwork-summary@kernel.org>
Date: Mon, 20 Jan 2025 09:20:39 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: i2c: mux: demux-pinctrl: check initial mux selection, too
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=925579
  Lore link: https://lore.kernel.org/r/20250115072946.7688-1-wsa+renesas@sang-engineering.com

Series: arm64: dts: renesas: r8a779h0: Add FCPVX and VSPX
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=925807
  Lore link: https://lore.kernel.org/r/20250115181050.3728275-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/2] arm64: dts: renesas: r8a779h0: Add FCPVX instance
             [2/2] arm64: dts: renesas: r8a779h0: Add VSPX instance

Patch: i2c: testunit: on errors, repeat NACK until STOP
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=925818
  Lore link: https://lore.kernel.org/r/20250115184609.1844-2-wsa+renesas@sang-engineering.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



