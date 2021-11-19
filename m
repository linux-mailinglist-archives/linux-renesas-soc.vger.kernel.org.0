Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FED445775E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 20:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbhKST5X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 14:57:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhKST5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 14:57:23 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCC7C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 11:54:21 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id t4so2198377pgn.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 11:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vtLfdeu5/ffB34X/CglPhPl1ty2vHoybxvywq5gkqg8=;
        b=jgESj7i/8llPG7PM1a8MIiWBmDy7cdCaOfz+ONqCzO1kPGFAylj5z2gWlIeQS0hdFO
         Q7QJLQT3Y9iDA6Wfq6jWgKibjrihSZ5KBxMS4xr68T9EG7fFzq1FI4C/+P7dAMl5sWhE
         ek6JxT78R9+lU8VgXgkDdaGx/4vFUl9OSMJW3L8qf0UeomJ4+GKMGLOL/PhqR6+RRNP0
         wY/rGsAsn0fYhBN5RfYCwpnp3gp1uV5wZz7fGvBaTAbVHqvj9vGaqttfdPgDUu1zUTTJ
         U3EMYaV77zK9iwDDmgXuzrksBCN9I7EXEaPukvY1Ldgw8Hznm9r4WG0Gt8YMZjyX6euc
         zq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vtLfdeu5/ffB34X/CglPhPl1ty2vHoybxvywq5gkqg8=;
        b=nqNGtIUt4ANG/VBlpXOabyaNemg4K0WsbRoEjUDBlfuuR+wNTfSh0Lpaj1hEmfSfh7
         F7oIB3zuY8GLBIMlOwppC5gFqnCK7C6TCh2RMBGuaXIuJ6fiu5dd8m1ox0IYAcToum/j
         D36tjXLODeDnlj5U+ae7aZbya6XSa1XGcnUw+P4qmvu0nOzEdebsJPJsvIlgaaqs1ciw
         mF/JogwLFLKHXPZl+hPVPHpC8TYyDsCEbjjIfrSb4m19c2p4aBDt5kmqPRs7c0f+vATe
         hCgVJCGwdYxwwCNIoHc+8f8ridQpUul/5N59G4gqw5x8KyLLU0k+QZYCvBONxZ1yEGQV
         YtKw==
X-Gm-Message-State: AOAM531s6yTlLgT2pTD1mCXqQd+bhtg2ZuG3Lyuv2zHLuH29jQjn7bZY
        3RCugOQq3sLNumVLBHDOikz4z2qVhyVuwKtS
X-Google-Smtp-Source: ABdhPJxJ50okHBuvbKqCC/BCVzUXZPuhojByzuqInc2FN2Xkpt4gwxCiWE+1bXEqN8dzW84fnUz0fQ==
X-Received: by 2002:a05:6a00:179a:b0:49f:a821:8233 with SMTP id s26-20020a056a00179a00b0049fa8218233mr25437248pfg.66.1637351660754;
        Fri, 19 Nov 2021 11:54:20 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a26sm408642pfh.161.2021.11.19.11.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 11:54:20 -0800 (PST)
Message-ID: <619800ec.1c69fb81.be88e.1b3e@mx.google.com>
Date:   Fri, 19 Nov 2021 11:54:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-11-19-v5.16-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 455 runs,
 1 regressions (renesas-devel-2021-11-19-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 455 runs, 1 regressions (renesas-devel-2021-11-19-=
v5.16-rc1)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig        | regr=
essions
----------------+-------+--------------+----------+------------------+-----=
-------
meson-gxbb-p200 | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | 1   =
       =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-19-v5.16-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-19-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a160c872955290b77744bcb39d7566c4316f227a =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig        | regr=
essions
----------------+-------+--------------+----------+------------------+-----=
-------
meson-gxbb-p200 | arm64 | lab-baylibre | gcc-10   | defconfig+crypto | 1   =
       =


  Details:     https://kernelci.org/test/plan/id/6197cabd3ba658690fe55250

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-19-v5.16-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-19-v5.16-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6197cabd3ba658690fe55=
251
        new failure (last pass: renesas-devel-2021-11-15-v5.16-rc1) =

 =20
