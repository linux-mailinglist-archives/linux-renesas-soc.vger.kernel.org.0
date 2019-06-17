Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24BDD47E13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfFQJPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:15:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40440 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbfFQJPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:15:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so813279pgj.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=FR+4U1QocL1sY50JnELWHPtMK47SyaQLPuRmrr5oLuI=;
        b=uyOYDFGIX6bInJ90sv5WA4RHpi+iGmcWLeOvTC5ZkKj1B1pUl8OulXVPSQbNwDZHKh
         b56Yq/9WIVLC+QwlntnNIhSFFRmK8/FPNY/nxLyihzR4OGIThA6bdL85WVKs2CH4/etQ
         DldqUtolRwAPQTs7njz+A94sBCIRU1yickcOsUpA4+qQrGqaeb+ADja+fp8gCm8Kzm8j
         MzYGNuLjQ0CLjoiiNMuGNMaZBz3tkLqCdL/TI/3p5lKgER/Bs2s753Ty24Hrry0Ff5Yc
         SsE2ZIQFX5XVv6JObDK6Sjeq/pyks2yjiP2KLnrkVzoxJm2R8gYoXUacAxvQVckQ9JQW
         p51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=FR+4U1QocL1sY50JnELWHPtMK47SyaQLPuRmrr5oLuI=;
        b=GbpGRzgnThlZSxhxwdGiiQwSqJt60dU2BscOCdyISk5rueQJcZtvlqCXxzXheEhtKx
         v9pv63hrl2poHSBpX1ckG5dRA6U872JiiksZOA55UY4E6XdSrkANoRj+jZ+N15O4QXb/
         DmDMXXfuJ2/iT1imBQurGC4Pe7afvDvCbksGIopPosPPlVwP6jRSTpygx8/rzctJ0hLa
         E50ewIpu2p+0TU4+3z86mojLx91K8pBqQnTKLq8mFPdg5J7b+zn0uv9zl6Zpef9r17TT
         mPreMJPFSOGx1jsoT6b57KLZTZdGv2nUNmBWI5WQKYDKtvwO683dV+7yLWOqc/J4evrS
         0SMg==
X-Gm-Message-State: APjAAAXN2Sf6NEt/2oK3udYo8X6d8hVGvRvg8iSKMH3PU0LUhpVhwyry
        EwMIClKp9xTT+sBgh0ry6fBiCLMv
X-Google-Smtp-Source: APXvYqw0ywGYe2usu7PadXXR9GqmPZd6nT3vwVenk4G0o40+BMoKranD5T962szqLCRLA6QDQe0vbQ==
X-Received: by 2002:a17:90a:db52:: with SMTP id u18mr25294242pjx.107.1560762916603;
        Mon, 17 Jun 2019 02:15:16 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id k3sm9448761pju.27.2019.06.17.02.15.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:15:15 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 17 Jun 2019 18:16:42 +0900
Message-Id: <156076300266.5827.16345352064689583105.sendpatchset@octo>
Subject: [PATCH 0/3] ARM: dts: Minor CMT update for 32-bit ARM SoCs
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

ARM: dts: Minor CMT update for 32-bit ARM SoCs

[PATCH 1/3] ARM: dts: Update CMT1 DT compat strings on r8a7740
[PATCH 2/3] ARM: dts: Update CMT1 DT compat strings on sh73a0
[PATCH 3/3] ARM: dts: Add CMT0 and CMT1 to r8a7792

These patches modify CMT device support on r8a7740, sh73a0 and r8a7792.
In particular r8a7740 and sh73a0 get their DT compat strings updated
and r8a7792 gets a fresh set of CMT devices.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

Patch 1 and Patch 2 depend on the following DT binding change:
[PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740

 arch/arm/boot/dts/r8a7740.dtsi |    2 +-
 arch/arm/boot/dts/r8a7792.dtsi |   34 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/sh73a0.dtsi  |    2 +-
 3 files changed, 36 insertions(+), 2 deletions(-)
