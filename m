Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5524D136A7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2019 02:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfEDApQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 20:45:16 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34784 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfEDApQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 20:45:16 -0400
Received: by mail-wr1-f67.google.com with SMTP id e9so9890996wrc.1;
        Fri, 03 May 2019 17:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8VwFKzzRbLWX4hrPiMqxNUfmabJrkNHd9w6xJf41fv0=;
        b=FFctQLEfxvEoAsqU4bSjqDc7VCXplurecawm7GYV8g6MaI9McurKHGn8bCUOdfYj+W
         lNCqTHnZqxc4FxB2GazKevK99DFl50K3qZguO8UfLUu1gJLqjdIMu1s60khZu/XfF/Uf
         8cEZNAQgCcFVrH7YaN3bNvSAEPkizc13v2rh5P4hHyWKcGmaH9YUAUfCS4kTvPDRNtsX
         DYctTZ5MqSYikYXqs0Yx7AEZRgEK6X28uSHGn+mF48PFvvmeTTwJquwrZMZv7m3nXFN7
         AWeGEz6bGP+ccISx5RLAujEn7S6YFilSc9j2RozEbfxoJjRWo1FQuYW6QLRXLP88Hy0B
         EzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8VwFKzzRbLWX4hrPiMqxNUfmabJrkNHd9w6xJf41fv0=;
        b=oojV0EoTe0DW+LlZfy2rVBjoFoV8Lor6Dyw+8X7TI+/xSVebHLxBY/a4z6/7W901/g
         n+OY67qRXvl9iA0/iSU1PFZZwaLVdMnzZBOT7HilYqQQ3tGs9RoJvWsyuKYSbhwZkLVh
         Nqudb12Rh9OTOCTgIPHOpGV5SSjCAz/jqhdcmyBUfdtVKuM5gqd3xYXNkSgrGbCds7Eb
         2EDfsx/xO8LBCG07lMX+0bg/wkH/DQ4Y/bVYR65ErBxI51swzC0IP59EmR4DDtxvRQDP
         LwJGTio+hCybLYIMlhJPgVuOIl3P6Ob+IqT6wO1b0anLZhJ5JYqIiG3ZScXFFvNE5MCo
         eyrw==
X-Gm-Message-State: APjAAAU11b11p5tJMU7IBkO3J4sKJcq+jm30QMibwUbBs6D/EInsGA39
        eT8zcgLvXClW44lLzi7Z3vM=
X-Google-Smtp-Source: APXvYqyK9YUQkHKVjtH6dPewEE0ZYFQDZ7WJBX0XymDviA/UFFnvDcdpOSMbiHrrzdIbrVasy/VIug==
X-Received: by 2002:adf:db8a:: with SMTP id u10mr9525582wri.82.1556930714443;
        Fri, 03 May 2019 17:45:14 -0700 (PDT)
Received: from localhost.localdomain (ipb218f40a.dynamic.kabel-deutschland.de. [178.24.244.10])
        by smtp.gmail.com with ESMTPSA id b11sm5979161wmh.29.2019.05.03.17.45.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 May 2019 17:45:13 -0700 (PDT)
From:   Eugeniu Rosca <roscaeugeniu@gmail.com>
X-Google-Original-From: Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "George G . Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH 0/6] Zap SCIF2 DMA configuration in R-Car Gen3 DTS
Date:   Sat,  4 May 2019 02:42:52 +0200
Message-Id: <20190504004258.23574-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series is triggered by a regression on M3 targets caused by
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=703db5d1b175
("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"), when applied
on top of rcar-3.9.x Renesas official kernel.

This collection of patches attempts to consistently propagate the fix
across the existing R-Car3 DTS. Full story is placed into
commit ("Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"").

While debugging drivers/tty/serial/sh-sci.c, a minor update avoiding
__ptrval__ in dev_dbg() is included here as well.

Tested using v5.1-rc7-131-gea9866793d1e on:
 - H3-ES2.0-ULCB
 - M3N-ES1.1-ULCB
 - M3-ES1.1-Salvator-XS

Eugeniu Rosca (6):
  serial: sh-sci: Reveal ptrval in dev_dbg
  Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"
  arm64: dts: renesas: r8a7795: zap dma configuration in scif2
  Revert "arm64: dts: renesas: r8a77965: Enable DMA for SCIF2"
  Revert "arm64: dts: renesas: r8a77990: Enable DMA for SCIF2"
  Revert "arm64: dts: renesas: r8a77995: add DMA for SCIF2"

 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 3 ---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 3 ---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 3 ---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 +---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 3 ---
 drivers/tty/serial/sh-sci.c               | 8 ++++----
 6 files changed, 5 insertions(+), 19 deletions(-)

-- 
2.21.0

