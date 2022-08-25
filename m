Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FEC5A098C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 09:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237392AbiHYHLJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 03:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237524AbiHYHK5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 03:10:57 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CBD7434C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Aug 2022 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=hCmswr5Z93pbFdrgeeTwmh0vcmA
        wuFaQRDCDpt1vV/0=; b=m5AGxYlrPo0HrDAnCq+k+NY2wvBimMOlcvuiLy39Ogl
        m9j1Z7OTkgGUa6N3HM5Y2mh+34kkIvIysIZDLQ7J876DPF7lJVWLdmI5vlp/D/NS
        B3L2kYmthX24y+UtGMR7W0MGhBKs2zl+Kr/JvgCyrbHo7ClGn/21PCj+8qfl2GrE
        =
Received: (qmail 2556343 invoked from network); 25 Aug 2022 09:10:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2022 09:10:31 +0200
X-UD-Smtp-Session: l3s3148p1@ONgnfgvnepwucrTo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/6] arm64: dts: renesas: move I2C aliases to board files
Date:   Thu, 25 Aug 2022 09:10:16 +0200
Message-Id: <20220825071022.7864-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Change since v1:
* converted r8a774a1 boards, too (Thanks, Geert!)

Old coverletter follows:

For R-Car Gen3 and Gen4, we had I2C aliases in per-SoC DTS include
files. That doesn't really fit as bus naming is a board property. This
series moves the aliases to the board files. The following procedure has
been applied to avoid regressions:

1) move the aliases from SoC files to board files. Keep the empty
   alias-nodes in the SoC file and add the new aliases before existing
   ones. This ensured that identical binaries[1] were created.

2) Once all aliases were moved and all binaries[1] stayed identical,
   then the empty alias nodes from the SoC files were removed.

The result is this series based on the renesas-drivers tag
'renesas-drivers-2022-08-16-v6.0-rc1'.

It could be discussed if the aliases should be sorted alphabetically,
but I'd think this is a seperate series then.

I also leave it to Geert, if the commits should be squashed. At least
for reviewing, I think this separation makes sense, though.

Looking forward to comments,

   Wolfram

[1] For desired binaries, of course. For r8a77961 boards, the binaries
did change. This was intended, though, because I wanted to add I2C
aliases there which were not present before. Also, the r8a779m* boards
now have I2C aliases, too.

Wolfram Sang (6):
  arm64: dts: renesas: r8a779{51|60|65}: put I2C aliases to board files
  arm64: dts: renesas: r8a77970: put I2C aliases to board files
  arm64: dts: renesas: r8a77980: put I2C aliases to board files
  arm64: dts: renesas: r8a77990: put I2C aliases to board files
  arm64: dts: renesas: r8a779a0: put I2C aliases to board files
  arm64: dts: renesas: r8a774a1: put I2C aliases to board files

 arch/arm64/boot/dts/renesas/ebisu.dtsi                |  8 ++++++++
 arch/arm64/boot/dts/renesas/hihope-common.dtsi        |  8 ++++++++
 .../boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts    |  8 ++++++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi             | 11 -----------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi             | 11 -----------
 arch/arm64/boot/dts/renesas/r8a77960.dtsi             | 11 -----------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi             | 11 -----------
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts        |  5 +++++
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts        |  5 +++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi             |  8 --------
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts       |  6 ++++++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts        |  6 ++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi             |  9 ---------
 arch/arm64/boot/dts/renesas/r8a77990.dtsi             | 11 -----------
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi  |  7 +++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi             | 10 ----------
 arch/arm64/boot/dts/renesas/salvator-common.dtsi      |  8 ++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi                 |  8 ++++++++
 18 files changed, 69 insertions(+), 82 deletions(-)

-- 
2.35.1

