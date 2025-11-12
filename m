Return-Path: <linux-renesas-soc+bounces-24492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7F6C51C28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 11:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FD773A9576
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 10:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DC63043A2;
	Wed, 12 Nov 2025 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJZtoY2F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39F29BD9B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762944037; cv=none; b=ANFRBixmLsTTRezuWMWmfuJT2fUYB5CooPi301fWnIXaSiw2zoaflA/o4ZcjPcsjQYCtZ3EBpKmqmnce8mvFD8fh71kmZ9Yz8XRPfvNhBYYB5F1J+gONfaEEmv4ujWpg1mZv9txTs60J2X5ODEzTbbT+Pro8u10GOswjKoQGPlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762944037; c=relaxed/simple;
	bh=Hz6EK80QQyDE+5TrotaEKreoD8d+Qs4ZDAI6lJZpj0c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=E/HHFE34hsd/eoHRalvS9RfIgpHNn/6zFd48hW+IudHBAYOj8cWTQXECwaSqUeuHQWHznwJ/gkExaYoqAz27GN5/5P3uE+1uUmqs/m4OfUMGcqiB8ltN7hzAvDBpCXfdGhzAsWZA4UoJ4LPS/GRBx2QWtebkwhOZPwvUVtub5U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJZtoY2F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8050C16AAE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762944036;
	bh=Hz6EK80QQyDE+5TrotaEKreoD8d+Qs4ZDAI6lJZpj0c=;
	h=Subject:From:Date:To:From;
	b=CJZtoY2FAWWPzJc23s5VlLEBlB2CfoNGQmrPLzPYwHM7R/0UZ9zrwpXfrYyB8L0+t
	 cO8N3liNndNvFJeDH9JVH6e83MvHU1wEE93UxoqCpUApH8oQq0t87R5kOw5OlZRtDq
	 RSjlBsiLgntsSbKGL9L8LKxZCmzBDyCfamlbpnbmNUQZw6rOfYAjiOiBrZ3EjxrS8e
	 GpcAoF83FRA6tOLXmBxzDEBvXKXsJqVElVdQTrnVWzCU+p3m6QF+chtksROXsMp82k
	 qvGHRsWiqhpjRaEmsVisgNvnzFrVFgC9qFQgWO99HvtMXhgwf6NQPAbFsRd09qiNPW
	 SPeZoZs1Gs5uw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1E0339D0C13
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 10:40:07 +0000 (UTC)
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
 <176294400633.4150786.5019434327016919403.git-patchwork-summary@kernel.org>
Date: Wed, 12 Nov 2025 10:40:06 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add support for the Renesas RZ/N1 ADC
  Submitter: Herve Codina <herve.codina@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1018966
  Lore link: https://lore.kernel.org/r/20251103141834.71677-1-herve.codina@bootlin.com
    Patches: [v3,1/4] dt-bindings: iio: adc: Add the Renesas RZ/N1 ADC
             [v3,3/4] ARM: dts: renesas: r9a06g032: Add the ADC device

Series: Enable Ethernet support for RZ/T2H and RZ/N2H SoCs
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1016863
  Lore link: https://lore.kernel.org/r/20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/5] arm64: dts: renesas: r9a09g077: Add ETHSS node
             [v2,2/5] arm64: dts: renesas: r9a09g087: Add ETHSS node
             [v2,3/5] arm64: dts: renesas: r9a09g077: Add GMAC nodes
             [v2,4/5] arm64: dts: renesas: r9a09g087: Add GMAC nodes


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



