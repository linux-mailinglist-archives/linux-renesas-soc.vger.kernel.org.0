Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2832421B18
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 02:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbhJEA12 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 20:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhJEA12 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 20:27:28 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D38C061745
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 17:25:38 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v11so5569283pgb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 17:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ua8sO1ng9te/BNqaPAK6HMifMSIcNxoV6qUBl2Soav8=;
        b=tCFY2CpoN6+MVb/BgR+jKmeO+E9ENNANsDbVrJp4SJiThqoK7veMO4xdjNyzcS/wq8
         Co0YOpVbL+G56D7LteD0pDBtoFRq61EGaEZFgLCzIrRBPEACpLgFmAII9C8034FlDnCv
         Bezk3GOoZvrwC5/bR+MLJbtBz+bGOLI0PAQRq6FadWah9tq4DSLBUAuV1/HE88TdAovd
         ri88zudlbnMAhFxAV5zTFKTIvKV0FpR7zxP1MIbkN8BfOTjdlC17z981xtfyRMl3mowD
         cSzN6zObV6AnnhQGEIcq9eNFV5jLezf+kYEE735sdniYxOmXUYIc+l7h7IeP8ChZR9/P
         jUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ua8sO1ng9te/BNqaPAK6HMifMSIcNxoV6qUBl2Soav8=;
        b=JM7d2l43PqEyD5Uf477i3bwL42oF+KFoonzwhfBjYCJlq3YrmsWF2ps6dJdgc7EE+h
         G5Je54YiQVdo147yZCsz1/OZly2b9hf9YuZbkoYhz2/ucGEFSWMXgn8aunmbB4tptpQq
         NJzMIiceeIKQtR93dB6mS2cxeh68P5JtsfAFvdWxy/XXoev3QW1cAW8hFf9Owfh4PKJT
         Ll6+23xY2QNEfZi3d8xHhVfdgq4DL83S7UwF2ij2nPnJDkSDle3yvjuXPVkadjwO/Ins
         yGTOs1xoguduWTqBrVAApMOtjTTttZcDV+MvipFqSI9rXKSfXERManRkXA7md/XqiKWj
         JSZQ==
X-Gm-Message-State: AOAM533fI/+Dna+r39uZ+iRlwA2BfLKr6eIm9qL79SgtCDUGiFSH5Q8W
        nhVpPBNiikxXr2yKQQRHFQBUxwu8dp8JUCDi
X-Google-Smtp-Source: ABdhPJzuDnFD/JTqCrpjljuzPq4HydMBYZUmoCzFENArB/BInS6YE3Erw8Emg8u/SQhwtgNa+QPoHw==
X-Received: by 2002:a62:e507:0:b0:44c:6222:3554 with SMTP id n7-20020a62e507000000b0044c62223554mr7549256pff.13.1633393538080;
        Mon, 04 Oct 2021 17:25:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z22sm14753690pgn.81.2021.10.04.17.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:25:37 -0700 (PDT)
Message-ID: <615b9b81.1c69fb81.32d68.c139@mx.google.com>
Date:   Mon, 04 Oct 2021 17:25:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-04-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2021-10-04-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2021-10-04-v5.15-rc4)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-04-v5.15-rc4/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-04-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      022b9ed809ab70e8e1cac03f6a50d8cb91cf4098

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  05a468e033af0e4c775aaa10fe4d02c45de698ae =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/615b8765084cb5ef0e99a2ee

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210913.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
615b8765084cb5ef0e99a2f0
        failing since 21 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a)

    2021-10-04T22:59:21.879388  / # =

    2021-10-04T22:59:21.881188  =

    2021-10-04T22:59:21.984869  / # #
    2021-10-04T22:59:21.989292  #
    2021-10-04T22:59:22.093419  / # export SHELL=3D/bin/sh
    2021-10-04T22:59:22.097493  export SHELL=3D/bin/sh
    2021-10-04T22:59:22.199870  / # . /lava-4644967/environment
    2021-10-04T22:59:22.203883  . /lava-4644967/environment
    2021-10-04T22:59:22.306899  / # /lava-4644967/bin/lava-test-runner /lav=
a-4644967/0
    2021-10-04T22:59:22.310572  /lava-4644967/bin/lava-test-runner /lava-46=
44967/0 =

    ... (7 line(s) more)  =

 =20
