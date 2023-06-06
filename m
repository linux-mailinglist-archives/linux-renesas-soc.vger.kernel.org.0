Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 697D3723FAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 12:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236830AbjFFKfa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 06:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237069AbjFFKfE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 06:35:04 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D44910E4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 03:34:47 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-651f2f38634so5485787b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 03:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686047686; x=1688639686;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b9e51awqtOqedIut0RfPUcZUEwHMOaDE1gKjxeflMSc=;
        b=vZFCrrra39z5dtO+kbnc6DZuobBQ/jvXUSAs5qGE/dP6rBrsAVFGkqRJ+9ZKFZsbIr
         dRbHdvyLm/F/pOMewr4xvdJlp/ULOuKIgSazTlQj5sZFTDrAbzMY4c7VsLxM6I02q5wy
         nm80v6fKMy3OWdrtMKtFZFb0OEZpPjFvPPqcgKzx/0ADS7BY8Rqor28j26/GlcvQDH2S
         oVQlTFD+54+93fVVpkXlChFJkFpWkuDG7UjK+OwHoABX+DYMt6oBn1xRRPnCr8YIB1+k
         UGgyp/j3pfXLYS3/Jq4FXXk3AKbJPt1buhYIsC0U3l4EK2IklF3icm9GzkXfLu2nDHj7
         mYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047686; x=1688639686;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9e51awqtOqedIut0RfPUcZUEwHMOaDE1gKjxeflMSc=;
        b=ScrVUOSGgoT/xIdS6uk8WMYLK6uG5utrUgQmedxOfRbEYZrr1HbD2QegTD9WFYIQJw
         9w6RisGfq7yzEMbHhYyy7Muabl2DPrQMVqlIjclk8PBRJuguoxzR0S1vYUd1DvSddsVe
         vCM6eh/itzqjIy+WqyyBMWkdQSHPZgzah9SCiaTkvdvjD6b4q1yUPvJoC7/zW6wdQr03
         NcuigjtpIsj7oPCI+cVwBxjhpjM0swasGoCn5Nn+kz4ZoyMen9YlbfIDCTnYMqHnpVw4
         1tnwjVnIvM8y33ijGPYu/K123jsSUAK349vBueTb5gAjafSBhQpn+p6IISzWKnHBSH6d
         HIyw==
X-Gm-Message-State: AC+VfDzfkig3K7lNlwSO2smKD4FUeEnI2IKfVACM8L/OI+b7S7nbjZy0
        3nI0Ij4wRP0gU/KP1mPaK96TzFqtKLKOyZXwlCoG0w==
X-Google-Smtp-Source: ACHHUZ7lBU7f0Y8vhu9h6febb+UWBInWBJGUgp4cdlcxfrXhc7CJzdTrDptVKcp1LeVouCOAT0hhzQ==
X-Received: by 2002:a05:6a20:3d82:b0:106:11fa:192c with SMTP id s2-20020a056a203d8200b0010611fa192cmr2153845pzi.61.1686047685972;
        Tue, 06 Jun 2023 03:34:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b16-20020aa78110000000b00660d80087a8sm684054pfi.187.2023.06.06.03.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:34:45 -0700 (PDT)
Message-ID: <647f0bc5.a70a0220.25449.0ef2@mx.google.com>
Date:   Tue, 06 Jun 2023 03:34:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-06-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next v4l2-compliance on uvcvideo: 4 runs,
 3 regressions (renesas-next-2023-06-06-v6.4-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next v4l2-compliance on uvcvideo: 4 runs, 3 regressions (renesas-ne=
xt-2023-06-06-v6.4-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-06-v6.4-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-06-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7762defcdaf029da668d5af3304d3d940d43199e

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  52926c1f2f03aebe34d96056e8380ab07c8f512d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef8c5ac9d1a51a0f5de51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/647ef8c5ac=
9d1a51a0f5de52
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef880c995f9b4b0f5de71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/647ef880c9=
95f9b4b0f5de72
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef5fef85f673f80f5de26

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
647ef5fef85f673f80f5de28
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)

    2023-06-06T09:01:36.527583  / # =


    2023-06-06T09:01:36.529604  =


    2023-06-06T09:01:36.633787  / # #

    2023-06-06T09:01:36.636240  #

    2023-06-06T09:01:36.738452  / # export SHELL=3D/bin/sh

    2023-06-06T09:01:36.740374  export SHELL=3D/bin/sh

    2023-06-06T09:01:36.843344  / #. /lava-10602675/environment

    2023-06-06T09:01:36.845339   . /lava-10602675/environment

    2023-06-06T09:01:36.948423  / #/lava-10602675/bin/lava-test-runner /lav=
a-10602675/0

    2023-06-06T09:01:36.950807   /lava-10602675/bin/lava-test-runner /lava-=
10602675/0
 =

    ... (62 line(s) more)  =

 =20
