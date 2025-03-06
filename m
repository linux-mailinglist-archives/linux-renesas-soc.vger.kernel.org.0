Return-Path: <linux-renesas-soc+bounces-14106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BDAA54FE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 17:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECB6316EF46
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 16:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D369620FAA9;
	Thu,  6 Mar 2025 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clNJBszO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61520B1E4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Mar 2025 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276800; cv=none; b=HVvcG4tZS9QxRAqAVlgVGv12NlYeBzscvJXZd4Lrxb4UPWNi0YsYtP+e2pM4v71P1m0sLEKbMZNZyLrS+gSoyOW9WSdS1Toc2OKx+nEG3CUi3vOX5nX/8uzlyx6UW/MYAI7mkOrBkMGLQbX8cBPqe/DpZ/UDRc/JaMszVtPAcIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276800; c=relaxed/simple;
	bh=QXpC+MkLE58w0wY/AP4PnZL5FZTdegJjvOOPulYdxkc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=aJAe/6S7A7kMQvKTDMWewxhyo9+a9oPUCcIK/R7UtjkC99RZkjD/1XuFQLrc6i/AZrLR73dvqgzZd9jGCD/z1FHcMjCf82kYysjkjdQa//QUlvH+uiaSMKnD2eNYifNVFPlS6BulNjDGO1GDgo+/93Cm8n8UC6V7bpRY1CcXs8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clNJBszO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5F3C4CEE4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Mar 2025 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741276800;
	bh=QXpC+MkLE58w0wY/AP4PnZL5FZTdegJjvOOPulYdxkc=;
	h=Subject:From:Date:To:From;
	b=clNJBszODwhEep5LUu7ZQLnnoxr1xRUxpW1X9gdP8zL9eO2/LT+/qzbXOxXzUtR0s
	 FFF6zW0hi1qpIIeBCOBugRilSBEtP/4HJcWO3He042/wRa99LEVj+Qo3UuOsmGKUpm
	 xFB2CgP2ONQ4CV4TY/DZynxpnvvUs87UK5aUJvltezQ437DEITOuegfHJlsRwDmE1o
	 wXHlm089h8Sf0tOBLnkKK4MjkZutU26xMz8XvO9g13WwDP2sZPStYkFPBJcXigm0nZ
	 OzyB/vO/ZmWfgoeEXhBuvsWVbFNwgVN88uPAcobr5LE82ERUMl4W7jDNWnzMHEqbax
	 b+W/BNhzgIL8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9B22380CEE6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Mar 2025 16:00:34 +0000 (UTC)
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
 <174127683323.1645087.14746751208999273821.git-patchwork-summary@kernel.org>
Date: Thu, 06 Mar 2025 16:00:33 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add support for Mali-G31 GPU on RZ/V2H(P) SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=935079
  Lore link: https://lore.kernel.org/r/20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2H(P) SoC
             [2/3] arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
             [3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



