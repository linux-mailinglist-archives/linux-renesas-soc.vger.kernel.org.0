Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5082D8F81
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgLMSi4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727463AbgLMSi4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:38:56 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DAFC0613CF;
        Sun, 13 Dec 2020 10:38:15 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id z136so14774711iof.3;
        Sun, 13 Dec 2020 10:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v12qW1WArY2nmQqwqjA78iRrbrWEFcVhgErCQdvW398=;
        b=Q859RKNndI7WoxAr0KoGUezxtMVYM9tq492r4b5OuNe+70lqW51E7subO/sznphmit
         hW5zD72+D9+Bukv023ALNQLlu5LRySGFXD+G/devKxqQ+7bw+Q7l6XPuuOyqAVS9pvht
         PAAPIcLNgoaRPjxsdd3rPHk1C/kcmoZps1Cr2eXBuC7Gktjh68BpoL6D6nII3+4R2f3b
         G3vWDeIhE5zZpIpOp9uEnBhh5gtRqEMLIyKDr3ef//V2sbHShI2XAo0AlZb4KjqIHSpo
         PnvsT7kjkzbO+BBpCFxckX6YhhaeUWQQKD+AcO3sXFZy7JQPp/V1u8DLz1YWEV4ceV1S
         olEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v12qW1WArY2nmQqwqjA78iRrbrWEFcVhgErCQdvW398=;
        b=ukICr1VM5Y+4eL28rus919YHuviZNldzdcL4E+8B5D7iPJ1UJZqrfDRe0kV6uOyuq9
         T+EnFSaBOCYm7KpkLfw4nms2yGoxpLwPBqWJohpwyg3ZOP3mifHVM6VKpeqSfpLEN82t
         ZMLq9gQmuqzMAujHaYS1PyCMPdAIHBFvlanDQrfGHmKWX5SjAvrovUwLDNmT5dezBwt7
         hFP4FUGi92AnJEFvQ81EDCKvFLe/0Xxgj34XnhlPgkBi8iGTQGYU8LQX8jlG1eu6wVcG
         mON1Mjg6iuWGFk+jdI9adnNsqveSN9ewVQqI8Xc9wafSVrKWuNROgcbV6JZKzSn7+iUO
         s6aw==
X-Gm-Message-State: AOAM530v3iMn0s4hKflT9XCvsqKoMvVO+5UE2RKn3pHAkpgiGqMQL57Q
        89AvxyR0AaPb5zfckx8iFvxoa+xd8SPyrQ==
X-Google-Smtp-Source: ABdhPJz3SgCO8HH+X83wjPzLPfuiwV9MT6P0JwxLf61OCj+oErEI2mHyZIjUzwwElyCOQ3Fv7UovdQ==
X-Received: by 2002:a05:6638:2a5:: with SMTP id d5mr27951920jaq.92.1607884692462;
        Sun, 13 Dec 2020 10:38:12 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:11 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/18] arm64: dts: renesas: Cleanup Beacon Kit and support more SoC's
Date:   Sun, 13 Dec 2020 12:37:40 -0600
Message-Id: <20201213183759.223246-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series contains minor fixes and some reorganization to better
support the hardware and add two new kits to which reuse the same
SOM and baseboard files.

Adam Ford (18):
  arm64: dts: renesas: beacon kit: Configure programmable clocks
  arm64: dts: renesas: beacon kit: Fix choppy Bluetooth Audio
  arm64: dts: renesas: beacon kit: Remove unnecessary nodes
  arm64: dts: renesas: beacon kit: Fix Audio Clock sources
  arm64: dts: renesas: beacon: Fix audio-1.8V pin enable
  arm64: dts: renesas: beacon: Configure Audio CODEC clocks
  arm64: dts: renesas: beacon: Fix LVDS PWM Backlight
  arm64: dts: renesas: beacon: Enable SCIF4
  arm64: dts: renesas: beacon: Fix RGB Display PWM Backlight
  arm64: dts: renesas: Don't make vccq_sdhi0 always on
  arm64: dts: renesas: beacon: Remove redundant audio code
  arm64: dts: renesas: beacon: Better describe keys
  arm64: dts: renesas: beacon: Enable SPI
  arm64: dts: renesas: beacon: Correct I2C bus speeds
  arm64: dts: renesas: beacon-rzg2m-kit: Rearange SoC unique functions
  dt-bindings: arm: renesas: Add Beacon RZ/G2N and RZ/G2H boards
  arm64: dts: renesas: Introduce r8a774b1-beacon-rzg2n-kit
  arm64: dts: renesas: Introduce r8a774e1-beacon-rzg2h-kit

 .../devicetree/bindings/arm/renesas.yaml      |   2 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../dts/renesas/beacon-renesom-baseboard.dtsi | 150 ++++++++++--------
 .../boot/dts/renesas/beacon-renesom-som.dtsi  |  43 +++--
 .../dts/renesas/r8a774a1-beacon-rzg2m-kit.dts |  16 ++
 .../dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |  43 +++++
 .../dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |  48 ++++++
 7 files changed, 224 insertions(+), 79 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts

-- 
2.25.1

