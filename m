Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACDD4CC206
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 19:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388148AbfJDRwo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 13:52:44 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50818 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388197AbfJDRwo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 13:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=YUurKKcNX2A3p1DuzcEuNuIKK3zu/r6glue8wknPYmY=; b=x3vprIromulT
        fEalh3TZGPmRL7UV31cjbzSK5166YQ5d7y07Id1d7z0P4V38+gDaMM/qq3BayewZvSV40amI4DNBX
        vWRimf37Ir8cCSYM7NblzV9c/KeUjWJlR5EhlycPj2VEYULZI1lVjW1AHxwjKjMC3vFARwT1IFnew
        jHikE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iGRkp-0003ug-2j; Fri, 04 Oct 2019 17:52:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id F20E92741EF0; Fri,  4 Oct 2019 18:52:33 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     alsa-devel@alsa-project.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Applied "ASoC: rsnd: Document r8a774b1 bindings" to the asoc tree
In-Reply-To: <1570171940-42937-1-git-send-email-biju.das@bp.renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191004175233.F20E92741EF0@ypsilon.sirena.org.uk>
Date:   Fri,  4 Oct 2019 18:52:33 +0100 (BST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   ASoC: rsnd: Document r8a774b1 bindings

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 01400bfb2ea76a399448486e2d26f2f1b5a77787 Mon Sep 17 00:00:00 2001
From: Biju Das <biju.das@bp.renesas.com>
Date: Fri, 4 Oct 2019 07:52:20 +0100
Subject: [PATCH] ASoC: rsnd: Document r8a774b1 bindings

Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Link: https://lore.kernel.org/r/1570171940-42937-1-git-send-email-biju.das@bp.renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index 5c52182f7dcf..797fd035434c 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -268,6 +268,7 @@ Required properties:
 				    - "renesas,rcar_sound-r8a7745" (RZ/G1E)
 				    - "renesas,rcar_sound-r8a77470" (RZ/G1C)
 				    - "renesas,rcar_sound-r8a774a1" (RZ/G2M)
+				    - "renesas,rcar_sound-r8a774b1" (RZ/G2N)
 				    - "renesas,rcar_sound-r8a774c0" (RZ/G2E)
 				    - "renesas,rcar_sound-r8a7778" (R-Car M1A)
 				    - "renesas,rcar_sound-r8a7779" (R-Car H1)
-- 
2.20.1

