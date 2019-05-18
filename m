Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0D9222FA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 May 2019 12:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbfERKCb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 May 2019 06:02:31 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35255 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfERKCb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 May 2019 06:02:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id g5so4496254plt.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 May 2019 03:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=GDAKeJ9jUdIyQwbJpwCXHt6OAnSal3pFpCPTwdmu7fg=;
        b=oS0nMTQAfmkMAXbY0PZLssbiTKHYMjI4rE0x66AgruqYwldhQ85wFfDuajhhJr9Vpu
         h/qLuTjQT4wtLBzjZUh+vLmn0EUI4cEHXNqYw+flw5Hqpgkc0H95SnnzcJ6m4ilauwCY
         PQTFdxMfdTTCHiFUOjudJzQIiNjaiBdahxm6O55Ax997NpeandQNM/T/YRFDuRkrn43T
         YIn7arI8eeeWwi2gb8Awm4Gmxp7gTleQAzL1iOnqvflN+9Q0JspkKqfch9BR7fFC0QDG
         83Y2ozhxwxogFXGUwA8kotz9LIhW8TxguWjRvSFiezYGAXg0jTPDvd1Zz9N1D/e3wx8L
         41Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=GDAKeJ9jUdIyQwbJpwCXHt6OAnSal3pFpCPTwdmu7fg=;
        b=VKN/k0ULrHd8FPrTVZ1zD2jEGlVg4UWTPsFMJKpnOQuCsoJMI0XzSMJ0qSM0MVsnsP
         toNtqsKdUJIptZLEGPgPmOxjmFlGLGYOnoOgTkJhKfelkTQqGjW3zEYVR8GB5DX68qhg
         FUP44BhPCp/17k+TrOvxQHEdbC/CGFZBUsJi//WyeD9ot4ksED2vdkPj88We8X0GwVUW
         drw/6tZ3dbpvHP9WcqYDacOvSvM4XQadyQauPWe5rODIrsimTvPbO4Hu77o3qGvch2cd
         ZbOQareHs/KMhaYwPhyJFmw2w8kq6gGhbNU6VoI3qcrOYxsqELtoaLyzp7fxAOkUmNEB
         WubQ==
X-Gm-Message-State: APjAAAXsjaQ42/1cFHmb0+bOX2pZ/jlLyIUmCvnubL3PwihRatL4AXcX
        s2XgbwuPihSvugOsVdoIuVBXJd7m
X-Google-Smtp-Source: APXvYqz4RH7qoiYlK430HDQdif1b4QeF9aBg0CSVIlowxzePU1Y7bYQF4CYRCVdFkenOF20n9umFbQ==
X-Received: by 2002:a17:902:6b81:: with SMTP id p1mr61557198plk.207.1558173750522;
        Sat, 18 May 2019 03:02:30 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id j64sm13814749pfb.126.2019.05.18.03.02.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 03:02:29 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Sat, 18 May 2019 19:03:48 +0900
Message-Id: <155817382883.14383.9127828804463512592.sendpatchset@octo>
Subject: [PATCH 0/2] arm/arm64: dts: Use ip=on for bootargs
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

arm/arm64: dts: Use ip=on for bootargs

[PATCH 1/2] arm: dts: Use ip=on for bootargs
[PATCH 2/2] arm64: dts: renesas: Use ip=on for bootargs

These patches convert boards from Renesas that use ip=dhcp in bootargs to
ip=on to allow more flexible network protocol auto configuration support.

The supported network protocols used for auto configuration depend both
on the ip= boot argument and the kernel configuration.

The arm64 defconfig currently contains the following Kconfig symbols:
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_IP_PNP_BOOTP=y
# CONFIG_IP_PNP_RARP is not set

Unless overridden by the user the above kernel configuration with ip=on
results in that the kernel will perform auto configuration with both BOOTP
and DHCP during boot. Compared to DHCP the user will not experience any
real difference unless he/she also has a BOOTP server on the same network
and relies on ip=dhcp to pick the desired protocol.

I recall the ISC DHCP server being a helpful tool to test BOOTP and DHCP.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20190516-v5.1

 arch/arm/boot/dts/emev2-kzm9d.dts                |    2 +-
 arch/arm/boot/dts/r7s72100-genmai.dts            |    2 +-
 arch/arm/boot/dts/r8a73a4-ape6evm.dts            |    2 +-
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts    |    2 +-
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts           |    2 +-
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts      |    2 +-
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts           |    2 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts        |    2 +-
 arch/arm/boot/dts/r8a7778-bockw.dts              |    2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts             |    2 +-
 arch/arm/boot/dts/r8a7790-lager.dts              |    2 +-
 arch/arm/boot/dts/r8a7790-stout.dts              |    2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts            |    2 +-
 arch/arm/boot/dts/r8a7791-porter.dts             |    2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts            |    2 +-
 arch/arm/boot/dts/r8a7792-wheat.dts              |    2 +-
 arch/arm/boot/dts/r8a7793-gose.dts               |    2 +-
 arch/arm/boot/dts/r8a7794-alt.dts                |    2 +-
 arch/arm/boot/dts/r8a7794-silk.dts               |    2 +-
 arch/arm/boot/dts/sh73a0-kzm9g.dts               |    2 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts  |    2 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   |    2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   |    2 +-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts   |    2 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi |    2 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi            |    2 +-
 26 files changed, 26 insertions(+), 26 deletions(-)

