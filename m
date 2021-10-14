Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534AE42D739
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Oct 2021 12:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhJNKlD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 06:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhJNKlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 06:41:02 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98E2C061753
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 03:38:57 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id e3so17806437wrc.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hx6K7zYx5URgAfRevdpaYK+lSZyZaeuF1ChEW2kpG0k=;
        b=1dMroV826FTmbNiGjW2O7cbotuAp2rPN0M0RiumRQCfxoW3q8STja5Dp3kby30Yogw
         BBUFkArRN9P3bokkALzpczgUSQJQKh+9CMXpXt8j5MDX4v5cx0123YsDsL6DyB1SzgxQ
         ybHUxaH65cu3/7B3z55gC41JhKWOrR7C+nIL1iukO845efv7Jddf1yTG5eTMyGepi34z
         1j4O7Hdo5G4kDMc9HbBrXUxqkJXOB3FhUkC3F7dfAf+U8LvVoAt5aYivYkGZkRFjDmZ7
         N70iYsuHhRyywTMX6XVuqguHWB8BGSmy3g+/c1jy7AFYrGYhVsdgpbELq9IeXWqxYKjN
         Lzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hx6K7zYx5URgAfRevdpaYK+lSZyZaeuF1ChEW2kpG0k=;
        b=jA19OMAM4CRrgVbS2vtJdfVvtpgrL4k+40PlNJy2A3JLpk8PohAMcTQeaVOoM/hkPw
         jwo8MbNtEmdfzAl6h8Rmi47Yr/jQV3quJUgw+Bcpf5zgGuViAWxjc2HI80M23d6ERTqT
         fYkOX7SLFVnqIlFLTmWDigTDhiEeyOmb2KR2vCFDIlqRfScJG9NasQcaiP33Ifwoq16s
         kkXfyl9yTckwEaZK7EfqDi/ZZnBcFMFyjOdQ1DVUkVoOgtb5re2zYSFGx/WeI53KdJsm
         Oe+KIA+eEPAi0Qpptqg/MG3SBKXJKGPN09Mm3zOwkO6Dh+uboN0GYk7sFSaxu1/ZP6QX
         m9GQ==
X-Gm-Message-State: AOAM532G5Zn5eA1WrbZSuVx3ZhwHH9OT54T8zpnVhiSbJvFYzJkp+X97
        OTSgHvsSB1oLhfLSJbCL37pk/g==
X-Google-Smtp-Source: ABdhPJweRRoGCSRLiwKX/c/4ot46TsiiU/Cice0OPhC7ADhLwtx3MTXNKEH9ZR3yvyCjdo+EwhSSEQ==
X-Received: by 2002:a05:6000:154f:: with SMTP id 15mr5848735wry.254.1634207936575;
        Thu, 14 Oct 2021 03:38:56 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id f6sm1744976wmj.28.2021.10.14.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 03:38:56 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] thermal: rcar_gen3_thermal: Read calibration from fuses
Date:   Thu, 14 Oct 2021 12:38:14 +0200
Message-Id: <20211014103816.1939782-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series allows the Gen3 thermal driver to read its calibration
values (THCODE and PTAT) from the fuses, if set. If the values are not
set the driver fall-back to the previously used pseudo values from the
datasheet.

Patch 1/2 prepare for reading the values from fuses by moving the
storage of the values used during calculation from global const to
members of the private data structures. While patch 2/2 populates the
private members with data from the fuses if available.

Niklas Söderlund (2):
  thermal: rcar_gen3_thermal: Store thcode and ptat in priv data
  thermal: rcar_gen3_thermal: Read calibration from hardware

 drivers/thermal/rcar_gen3_thermal.c | 113 +++++++++++++++++++++-------
 1 file changed, 86 insertions(+), 27 deletions(-)

-- 
2.33.0

