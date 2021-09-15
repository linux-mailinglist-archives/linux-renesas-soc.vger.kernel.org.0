Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453DE40BD58
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Sep 2021 03:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbhIOBv7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Sep 2021 21:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhIOBv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 21:51:58 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76754C061762
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Sep 2021 18:50:40 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id z184-20020a1c7ec1000000b003065f0bc631so3583310wmc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Sep 2021 18:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnzgP/qqicRIPZKqRt4/Yh4sXYnq0DWhZShP0b5lRgM=;
        b=qGWTMPesKciL+0EJnHbbQ39wpphg3YkpdaXhGnwwJ71iYesWBDPyaF5b4oW6+P0EGC
         MAjPWXtomc23Hb65Yw34YuDo+qG9UNFd4ES426Oy6zyNXGa5eUNtUG1h/p3aF9Za3eCJ
         UEuMMW79nCoQz5Q/q9fHyzz7KDcBEPeIzn8mRRUUQjElRzTK4GmGWHM7i86BPps3luXr
         jhpwQ7hNhvzKnmyqR/RHsW7fldykcmjayJPFEaFoBKkAIOnVVzDU49S1MA9IF89co2iG
         4LgimIa3bhuYzESTzUBnPRP7X6ReAY2I0gamupy3l5DW5yFeFlkwLed3clJoiD3ntIUD
         i07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnzgP/qqicRIPZKqRt4/Yh4sXYnq0DWhZShP0b5lRgM=;
        b=HcasAqWeV1Ri+LJXDPePSO4KyJ5mN6HiupCUd0Xjk6VhrG+XEjgv31R6P6Y4HiLLly
         sDX1L7kM94xi81vjcVPWTCerb8Juet8hPtVsNs2qSmdOfl09EuHSvoKUrGSe1o3vx2UK
         iCtdKh8DWTY8NfyjWAJ6ThkSRlN5YUtN02PeSkGKjVvGAPX5BTlmWmKd7G/FxA5CwmpM
         jsV6hlxercHzOQMrdm9ggCB47f/39rhzl/6ED59OvPNGONb1fFGeBPMDNZsurlXwHCQO
         0bYGSCMDt7938B9Snx8qP96uNGnRsfaBnJ0dV4inN6A4w1KZ1fQBDb/MJHBGCYHZTjzz
         fctg==
X-Gm-Message-State: AOAM530IONodta5+LQinfguBlNnoCrd37q0ZHauyd4liO40MrYs0eIWK
        vZiqY0997UAHLbf25QE/M5dhwQ==
X-Google-Smtp-Source: ABdhPJzmthYhyrsatvMJ0KfmOl3k7yncZgLrZW6fx/cyUF1nWKmXQQRrE6/PEjN3Y/2/xdS6TXM5zw==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr1827293wmj.169.1631670639067;
        Tue, 14 Sep 2021 18:50:39 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id k17sm3486863wmj.0.2021.09.14.18.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 18:50:38 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] rcar-csi2: Serialize format cfg and improve mutex handling
Date:   Wed, 15 Sep 2021 03:50:11 +0200
Message-Id: <20210915015013.3169934-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Hans,

This series improves the mutex handling of the R-Car CSI-2 driver. While
working with other drivers it have surfaced that drivers are responsible
to serialize format configuration.

Patch 1/2 adds a bit of housekeeping to the mutex used in the driver
while patch 2/2 adds the format serialization.

The series is based on the latest media-tree and tested on M3-N and H3
ES2.0 without any regressions found.

Niklas Söderlund (2):
  media: rcar-csi2: Cleanup mutex on remove and fail
  media: rcar-csi2: Serialize access to set_fmt and get_fmt

 drivers/media/platform/rcar-vin/rcar-csi2.c | 25 +++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.33.0

