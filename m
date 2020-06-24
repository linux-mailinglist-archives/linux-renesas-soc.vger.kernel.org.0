Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D2D207456
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388123AbgFXNUo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:51408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387915AbgFXNUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593004843;
        bh=7sm5kpSt/BXDy3KEHFUH+6inxHuH7lwitg/cy1rhUzk=;
        h=Subject:From:Date:To:From;
        b=Jw15gz5S4nC7bCMcmpAxr5PaA0qaU36pitj6Kg3TotchriitQxQtK3BOgZA1qv/jK
         j5Jpez+xPGvkTenC9BMTv2D7YA/Qj3zTqwaBIIdFFvUd4cLR4zXL40OPZDtVGJTEsA
         zLKAzIxxH2qPAoNyds/4qfHE2UvqTva08fNscdw0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159300484337.14195.7228507137282580345.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 24 Jun 2020 13:20:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] Add support for HiHope RZ/G2M[N] Rev.3.0/4.0 (2020-06-24T13:11:59)
  Superseding: [v1] Add support for HiHope RZ/G2M[N] Rev.3.0/4.0 (2020-06-07T18:34:35):
    [01/11] arm64: dts: renesas: r8a774a1-hihope-rzg2m[-ex/-ex-idk-1110wr]: Rename HiHope RZ/G2M boards
    [02/11] arm64: dts: renesas: r8a774b1-hihope-rzg2n[-ex]: Rename HiHope RZ/G2N boards
    [03/11] arm64: dts: renesas: hihope-common: Separate out Rev.2.0 specific into hihope-common-rev2.dtsi file
    [04/11] arm64: dts: renesas: Add HiHope RZ/G2M[N] Rev.3.0/4.0 specific into common file
    [05/11] arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 main board support
    [06/11] arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 sub board support
    [07/11] arm64: dts: renesas: hihope-rzg2-ex: Separate out lvds specific nodes into common file
    [08/11] arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 board with idk-1110wr display
    [09/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 main board support
    [10/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 sub board support
    [11/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev2.0/3.0/4.0 board with idk-1110wr display


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
