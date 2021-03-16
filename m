Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD2933D035
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 09:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbhCPI5y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 04:57:54 -0400
Received: from www.zeus03.de ([194.117.254.33]:33812 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233070AbhCPI5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 04:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=0eWuABZzt2y3YmESLoPkr/Wo+VE
        351mAIuEA+1OQEIg=; b=Wp/8xvngCUi3q8DiblvMpdJ4Vql99swIqNYkoGKnYlv
        MIGXjyv+cL6ggrix3iAU9Yu+PoWuOMawtxJkjEb+p8iCbnXmyooTD3lv/Gct+XgV
        W4OMFOs4mKLQnwaJRix9swptKWdgUR1D1E8kkl05eJLkkJ+qMpUm1IMdppz2/B3o
        =
Received: (qmail 1697707 invoked from network); 16 Mar 2021 09:57:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2021 09:57:21 +0100
X-UD-Smtp-Session: l3s3148p1@zIfbjaO9cpwgARa4ReUdAWIPBxWmfbkD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 0/2] mmc: tmio: make resets more robust
Date:   Tue, 16 Mar 2021 09:57:15 +0100
Message-Id: <20210316085717.7276-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here are two more patches improving the robustness of resetting the IP
core. Patches are on top of mmc/next and this series "[PATCH v2 0/3]
mmc: renesas_sdhi: reset via reset controller", especially "[PATCH v2
1/3] mmc: tmio: abort DMA before reset".

Tested on Salvator-XS with H3 ES2.0 and M3-N. A branch for testing can
be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/for-5.13

Some additional testing by Shimoda-san or the BSP team would be much
appreciated!

   Wolfram


Takeshi Saito (1):
  mmc: tmio: restore bus width when resetting

Wolfram Sang (1):
  mmc: tmio: always flag retune when resetting and a card is present

 drivers/mmc/host/tmio_mmc_core.c | 37 +++++++++++++++++---------------
 1 file changed, 20 insertions(+), 17 deletions(-)

-- 
2.30.0

