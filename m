Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6AB562E89C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Nov 2022 23:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiKQWoH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 17:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbiKQWoG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 17:44:06 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D124490B4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 14:44:05 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id q71so3401559pgq.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 14:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bbb6GqKEnRyCeHnQa4NNfZW8RMZ1ZukjwazFBMCP7uo=;
        b=th3JGmxyWtzj0X+KcQXFZM18mS94qFYpxWNaluuFxaPU5RE5gy8Cw1wHZNFfnLTXSW
         NV0kMzowE4s+ki9k1hhbde1JE1MVG6cELES7I7eHdaHLm4IHdmtTis9w0X1omUTCwntZ
         n8PIwQoL8Wxu2JkPdl+9SwpdDutvu9D8quJHCtJ6Gxr5wI5UM5PVrw0+rNESBFv8rnvN
         O/Lzvbnu6CCTlA9dchYFX9nMDPhglXTM8YrURliBj+lH6WaZnPRem3MvlGRO1nOrHtay
         3RjicQ3sBXFeSIlqLONV3094j+oqFuV1YP8uQm59+KRwtd3E1SnwQPuTyStkxMagEyLY
         S/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bbb6GqKEnRyCeHnQa4NNfZW8RMZ1ZukjwazFBMCP7uo=;
        b=JbgfAyljE+dGQjVMQqOmn1OdMzZZHZJda9MJ6bvzcqgJr7DbAw/Dy6WYBI7o8cfzkx
         0Zul/wfnXezzIGt9jLy/gBAyZT6lqYoII6gAK4MopnIs9wPjnuoIFJowOY1cXJdgxoII
         +K+5rD7LEnhir8hQAO5FyzR1ElySx1sqwbWBaswNafPVHs881GuX9UBBAWhgrgnTLJ2h
         t2KtNY83EXsP4b/qCJt6vMXT1Wijib4TeHWfACm97CQ4UxwxYjmPaNkvx3C3ajnCJ4jK
         4Q17I+frjFEp1Z1/IoaTd7rICzH1eI9QxqDq84UfxK5JiJE1ESSLMSE4c+yVogszgZM0
         B1mA==
X-Gm-Message-State: ANoB5pkxAh0/sXJdu+8LMJPnE7Ui7tzogWnKwh0Lj6SLU2VKl9ZXxNWj
        a9PDbG5lNLs4ieXR7PQNnPMaDPfmrPtPdXq+rNY=
X-Google-Smtp-Source: AA0mqf5MMmbrCV5ySW8MdsubeUy9ozqzNukuopWRMkoR1Gfpu+3C9AtBC+7/6xi0USbNFp4gr6WSWw==
X-Received: by 2002:a65:5a46:0:b0:476:f6e2:69e5 with SMTP id z6-20020a655a46000000b00476f6e269e5mr4035617pgs.48.1668725044784;
        Thu, 17 Nov 2022 14:44:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j23-20020a63e757000000b0047063eb4098sm1557877pgk.37.2022.11.17.14.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 14:44:04 -0800 (PST)
Message-ID: <6376b934.630a0220.61f57.23f7@mx.google.com>
Date:   Thu, 17 Nov 2022 14:44:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-11-17-v6.1-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 5 runs,
 4 regressions (renesas-next-2022-11-17-v6.1-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 5 runs, 4 regressions (renesas-next-2022-11-17-v6.1-r=
c1)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-11-17-v6.1-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-11-17-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      22360f65e18b2935b5e4695b868a6ef310f46a11

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6376a25cfe2dafc0cb2abd28

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
76a25cfe2dafc0cb2abd39
        failing since 94 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
376a25cfe2dafc0cb2abd3b
        failing since 94 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-17T21:06:19.887329  / # =

    2022-11-17T21:06:19.892137  =

    2022-11-17T21:06:19.993884  / # #
    2022-11-17T21:06:19.998650  #
    2022-11-17T21:06:20.099667  / # export SHELL=3D/bin/sh
    2022-11-17T21:06:20.105194  export SHELL=3D/bin/sh
    2022-11-17T21:06:20.206076  / # . /lava-8022538/environment
    2022-11-17T21:06:20.210825  . /lava-8022538/environment
    2022-11-17T21:06:20.311781  / # /lava-8022538/bin/lava-test-runner /lav=
a-8022538/0
    2022-11-17T21:06:20.317065  /lava-8022538/bin/lava-test-runner /lava-80=
22538/0 =

    ... (8 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63769eb1e1c58a30f92abd4c

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
769eb1e1c58a30f92abd5d
        failing since 94 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3769eb1e1c58a30f92abd5f
        failing since 94 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-17T20:50:33.407310  / # =

    2022-11-17T20:50:33.412812  =

    2022-11-17T20:50:33.514479  / # #
    2022-11-17T20:50:33.520390  #
    2022-11-17T20:50:33.621377  / # export SHELL=3D/bin/sh
    2022-11-17T20:50:33.626771  export SHELL=3D/bin/sh
    2022-11-17T20:50:33.727656  / # . /lava-8022405/environment
    2022-11-17T20:50:33.733552  . /lava-8022405/environment
    2022-11-17T20:50:33.834462  / # /lava-8022405/bin/lava-test-runner /lav=
a-8022405/0
    2022-11-17T20:50:33.839689  /lava-8022405/bin/lava-test-runner /lava-80=
22405/0 =

    ... (7 line(s) more)  =

 =20
