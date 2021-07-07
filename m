Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAEF3BE88F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jul 2021 15:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhGGNQY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jul 2021 09:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhGGNQW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jul 2021 09:16:22 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8804BC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jul 2021 06:13:41 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id d12so2398853wre.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jul 2021 06:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rpnf5ui3+hnRrY8YGy8rXi5xfNzvjgI0JQwfh/q3EXQ=;
        b=A+dROaEL7bCBWiUmI8lBLdEC/lc9Sy2rh7+vdSTNbzjYBg3472ZuPMmdwRjufGy0fV
         It7dj4eHCpP6GQVHDvvOLEBi6XEs9TVzRFmKunJQGIrpKaIl8if09zuZ/8adMPOxnnS5
         H9zisXyoLmSKqosGfhTZU26j1910lTfn5ZaxMLY8TLmZwRJZDdwoZ4qP4jzFPbuI7b35
         vqqY5utc7W9mMtdaYFm3mgmvw4BL4ToVv+QYNUjG6xPWZvKiyUdMauRDfmry4QlJyFwO
         N2YWUR/xifzonDnRF3ekkMwOGQxIDuGYFvqZNGEXoAK+abkDBqVrb9WNEx3+ciQBmEi9
         7z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rpnf5ui3+hnRrY8YGy8rXi5xfNzvjgI0JQwfh/q3EXQ=;
        b=HjfkMdErMiq7qdBJ6MX5ukoDnaPUAbSE7majqF9DXmD518w3+I9CbejEVZKmPBXHrj
         IfXoEeSl/u8Dcn9WywABDAJuHvKuEJnNNnzuftM8iqFxLs07rCe19fXdm5JvmdIUMM8t
         98MZwbktOs7TUFW2C7VfnS1l3oFjgF/WPIwsN3YFgkaOAJydb2vHDH+LrWzPqZ72mG4r
         st5dUWMVYsrF8Fisg3ZUKuDOkkdh+5HRiiGCdlrPWiNpCraJLklk8GiYRK2xjY/hIo2F
         2gqDMGUm3iOFYGV/X8aWvu4V6HECvF0PiyfW0teKyVIK95Ql+d9/miU0BGiusDv6WUuA
         UisQ==
X-Gm-Message-State: AOAM533SBAUd57KW+CjvseIdHyocT/OB1yom3Mk2eghaDUTssZ3rcHYT
        e10PiZVH2aHveLEHf28CbRSwjdQHDi3YDA==
X-Google-Smtp-Source: ABdhPJxpLc/cU0rZmKkqSAhSoisQ07hiLtrU/n9NHfWMJzu5RI/qj5Ap1lugexNGg5YdyYtl6V26cg==
X-Received: by 2002:adf:e743:: with SMTP id c3mr9100943wrn.354.1625663620040;
        Wed, 07 Jul 2021 06:13:40 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id l20sm19233670wmq.3.2021.07.07.06.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 06:13:39 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] thermal: rcar_gen3_thermal: Add support for trip points
Date:   Wed,  7 Jul 2021 15:13:03 +0200
Message-Id: <20210707131306.4098443-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

This small series adds support for the .set_trips() to the 
rcar_gen3_thermal driver on the platforms that supports it.

Patch 1/3 prepares for the new feature by expanding the OF match data 
while patch 2/3 adds the actual change. Patch 3/3 is a drive-by fix of a 
datatype found while working on this feature.

The work is based on-top of thermal/next [1] and tested on M3-N and V3U 
without any regressions or other issues.

1. fe6a6de6692e7f71 ("thermal/drivers/int340x/processor_thermal: Fix tcc setting")

Niklas Söderlund (3):
  thermal: rcar_gen3_thermal: Create struct for OF match data
  thermal: rcar_gen3_thermal: Add support for hardware trip points
  thermal: rcar_gen3_thermal: Fix datatype for loop counter

 drivers/thermal/rcar_gen3_thermal.c | 170 ++++++++++++++++++++++++----
 1 file changed, 150 insertions(+), 20 deletions(-)

-- 
2.32.0

