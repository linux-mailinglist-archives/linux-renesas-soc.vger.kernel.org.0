Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9622418125
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 12:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244073AbhIYK61 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 06:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243920AbhIYK61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 06:58:27 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9021C061604
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:52 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id s11so12449826pgr.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HJ2UPQ8xSsYWqvAFuBnvNH7vwD/zPd3dxyeuRHu9+Oo=;
        b=aHstUbjfkmwSsjiHvH17bvFkHUp7tCbwbZBmI+XcwZoUhGYPDKGaWiQBh6tTmwJyw6
         T1Y0ProdTY/CF/CfMgn98tW3iIfLTYOhS020rvrQUbaUfC0Cu6m8FvfuRORrGqkpGkr5
         02TlpN3nD3/0djUVq4DxoxVIWAQbZdYwy2tW/tlQxRDhtCkswqkwIBmVUCQzAu7YNYRi
         x0zp+tcDHlGt9lc9wIX84vaoy9xB+ABAbEZ2KWR7QllHmnPsnnGqnS33EgT8PW0RVV+J
         Ndnpl5CUlpFzHdtXruSmokC1UHQkqgwX3EZQtsgnzUARwVXosen/h43wqmMp/1jwx9eW
         kisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HJ2UPQ8xSsYWqvAFuBnvNH7vwD/zPd3dxyeuRHu9+Oo=;
        b=IQum3n1Tafe2a0gsD7R/EXMNiy4iDWfTNXB7tuBSEgXaStWmI5k617KkkXipSg468r
         /Gh+U7p/luA7gn8vTCD2D6/tcQE1jGi4zUF8jk4pCVvaCitxRWv0a3LtG57zRnTx0G7C
         ulXHBnQjHCx+iPG+ZHo6Vv/IdFVjmdgNx9M+S7HU0od/0RzWPtgL13ZjO1TijpUN+Tka
         +L60QUBxuy/t29Ayl7su19FWZIDguYvYUUaoSDCXFuqLPgvLBcH3FxLxuA+2EC7JnBiV
         4a954sNC3E0u2AI1yZ7VNrFMjPfawezZt8Us5AqddVHFOsCvTXP9L1CLQy5lR/Cj1Z9n
         VtXQ==
X-Gm-Message-State: AOAM530SBShAq9xQBSHhkHvtI1LCMvc6YNMy9/cBJ3cc8c0O5aEO0htg
        SHd/d8/ApQ9YUoY8S1HQtGuJ69OY3hrZDsP0
X-Google-Smtp-Source: ABdhPJwY7wtF3vie4gINcy85Fqs0hIfgogKxN4N89LhGVm6F/W/Gg2rivKLQN5mzvyfYsiMlXLZiKQ==
X-Received: by 2002:a63:4c5c:: with SMTP id m28mr7722731pgl.67.1632567412234;
        Sat, 25 Sep 2021 03:56:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u16sm11518620pfn.68.2021.09.25.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 03:56:52 -0700 (PDT)
Message-ID: <614f0074.1c69fb81.98232.4703@mx.google.com>
Date:   Sat, 25 Sep 2021 03:56:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-09-24-v5.15-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 5 runs,
 1 regressions (renesas-devel-2021-09-24-v5.15-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 5 runs, 1 regressions (renesas-devel-2021-09-24-v5.15-r=
c2)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-09-24-v5.15-rc2/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-09-24-v5.15-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2c0b11dd6f8ce5c74e91b71a38505ae9088bf68c =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/614ee83d74aa203eb199a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-v=
eyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-v=
eyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/614ee83d74aa203eb199a2e8
        failing since 11 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =20
