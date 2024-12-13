Return-Path: <linux-renesas-soc+bounces-11282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EDA9F09CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 11:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2CE316A2CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 10:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C60E1C3BEA;
	Fri, 13 Dec 2024 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikutkvB9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789211C3BE9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Dec 2024 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086417; cv=none; b=Qx5uKdMkKOVS0wOJ0sg+kIMihpCjDKh5xOTjgHpWVcZOL/QIv06Bopbk2XKh9vSgNIcozC2iSzZPN2nvQ9zepOHtLv4mMPTNjEOl8HTQH+xRYEG0Cm+//PCKYfne9qpLIZmzxmcs1t550pDgJqZIWjOCdAYWxdLLQ8zTk0Buo74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086417; c=relaxed/simple;
	bh=NyCc1pg7RxeZaGj2WkHyw3JVKl7kB9hUjj6sLScAF2w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=uX76XG4HXfIQ/VepU9EmaaptqLBf6+hHOx5TkG1OKt2xR0sDJG1z9qPlg3xf6bM5soPzuFowFJuxxE4rY8p/cPXkfbrv6WUIWhSVn2HuY22nbzah6tpZTSa6oQSkkL00mLyvXUtbIUZnmXOftF6xVoHj0EbPcL2JlPCMgEFRCD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikutkvB9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10A1C4CED1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Dec 2024 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734086416;
	bh=NyCc1pg7RxeZaGj2WkHyw3JVKl7kB9hUjj6sLScAF2w=;
	h=Subject:From:Date:To:From;
	b=ikutkvB9Sb1AIukp3zyNVUG4ZJUfy+jQ552VRdNSSTS9PgmnRKBGXSsslrJdOEopg
	 PHpw6tOzCWDYsEieJRYSKPq46xkij3SbSpR7PPJI9w4JPxie7tNUPllE945ThXCbIu
	 XxcKQ+e2DTUNipA9fqdSCYX1O9Mf0hDO+1krXqhM2i/Ms++yJhcnjwjJ9efKYmh9g7
	 qbas3UkDdI4K4wibc49NaSDarpKRX1FjpEDnNI35qardRminrb6god+VNac7hZQgOS
	 4ibz+DT5ro3CG7Q3SPSMmMv+Of4BuBOca3zpPmAgNxPqIA921H77nKs1RM4uAAgRgB
	 fgS7MU92d79sw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7488E380A959
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Dec 2024 10:40:33 +0000 (UTC)
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
 <173408643230.2939961.9648213152123763715.git-patchwork-summary@kernel.org>
Date: Fri, 13 Dec 2024 10:40:32 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add support for Renesas RZ/G3E SoC and SMARC-EVK platform
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914097
  Lore link: https://lore.kernel.org/r/20241203105005.103927-1-biju.das.jz@bp.renesas.com
    Patches: [v2,01/13] dt-bindings: serial: renesas: Document RZ/G3E (r9a09g047) scif
             [v2,02/13] dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
             [v2,03/13] dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II EVK
             [v2,04/13] dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
             [v2,05/13] soc: renesas: Add RZ/G3E (R9A09G047) config option
             [v2,09/13] arm64: dts: renesas: Add initial DTSI for RZ/G3E SoC
             [v2,10/13] arm64: dts: renesas: r9a09g047: Add OPP table
             [v2,11/13] arm64: dts: renesas: Add initial support for RZ/G3E SMARC SoM
             [v2,12/13] arm64: dts: renesas: Add initial device tree for RZ/G3E SMARC EVK board
             [v2,13/13] arm64: defconfig: Enable R9A09G047 SoC

Series: Add audio support for the Renesas RZ/G3S SoC
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=916444
  Lore link: https://lore.kernel.org/r/20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v4,01/24] clk: versaclock3: Prepare for the addition of 5L35023 device
             [v4,20/24] arm64: dts: renesas: r9a08g045: Add SSI nodes
             [v4,21/24] arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
             [v4,22/24] arm64: dts: renesas: Add da7212 audio codec node
             [v4,23/24] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
             [v4,24/24] arm64: dts: renesas: rzg3s-smarc: Add sound card

Series: iio: adc: rzg2l_adc: Add support for RZ/G3S
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=915311
  Lore link: https://lore.kernel.org/r/20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v2,01/15] clk: renesas: r9a08g045: Add clocks, resets and power domain support for the ADC IP
             [v2,14/15] arm64: dts: renesas: r9a08g045: Add ADC node
             [v2,15/15] arm64: dts: renesas: rzg3s-smarc-som: Enable ADC

Series: arm64: dts: renesas: falcon: Wire-up Ethernet breakout board
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=902296
  Lore link: https://lore.kernel.org/r/20241023154643.4025941-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/2] arm64: dts: renesas: r8a779a0: Remove address- and size-cells from AVB[1-5]
             [v2,2/2] arm64: dts: renesas: falcon: ethernet: Describe PHYs connected on the breakout board


Total patches: 21

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



