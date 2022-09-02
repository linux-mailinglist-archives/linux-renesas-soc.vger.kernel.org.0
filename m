Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5DE5AB7A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 19:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237126AbiIBRlZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 13:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235637AbiIBRlY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 13:41:24 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392CFDDAA7
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 10:41:21 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id bh13so2547139pgb.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2022 10:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=eBSt5Ah1WtLu+X4brGQ290my62rMVU1G1wWJ7tvinD4=;
        b=WQOy9wypVz3Iil6SOFgMWcvsHQMVli7SXgxJidl0IgsG53vywdVGcBOa6wE5yNP7pR
         KiVkPOe5iMVTucT41D7toxGvmTDP13MhBxCqR96MW9Gz+MulSsgG/0f4yd2mimfSi6zm
         SqzUvFk91FxGhRYEjvJLG/YFb0exy2ULT1YzE45OZ9vCQnJCE2BAaxShlcDPSHmou6km
         MbO2zPwlVg+29/MwcaQZSV2xXvjqhG1HLC0xWWcs13EjLmfJSQZXW4zva6WGUSZUDHo0
         UA1ALyDK3hv1COJErIt63MxeyCCsVoGBgry8NyS/5fqxcNIQrMGI6pClfOwlthL89QEY
         2U9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=eBSt5Ah1WtLu+X4brGQ290my62rMVU1G1wWJ7tvinD4=;
        b=ezvVEwwtS+mxc4CrNb/aCvlaAZCbPnwsrI6XUYyQk31no9fQbt1H0ngL/PaZiYZHLz
         xUi8Uc5S3TJPguF9YVUw7SXYFY+L3Q9fj/wlxsUvSZlJVJWZX/JwNNBEFOPVMGK9FwZ2
         chyRQU/m6+vMWaczM49nBwMy+wxRlgC5bvDN3HS6KiUBBJJlNPSpylYKcriGrBd2NDaY
         EBduy5bTDDOvhPU8uZLZDvBLSCpYi6ykHNsMxQdYupCJIGU4Jj/Z2l5NYOGCILsKlO1a
         8s3hcNuDfQ+dwaToKELk/yEE8vFuXJVTEzB+OvOEN8KK0jg1i07Wan6opIugm3lg0eXR
         gDDg==
X-Gm-Message-State: ACgBeo0MMI0JUzqpVxQsMNF8B0UL6rKcJsDaSEu8Mr47IFz7bCp4lKwY
        y6uM5IpmobtqzuzA+Nr9iguWueUztP/gZcpQVXI=
X-Google-Smtp-Source: AA6agR7QnWQWN2BiOyVc46qb3FJuj+tN2cUeCgsKZho29bhL4fZL+bw59yKZB748xtLhhA5eesodkw==
X-Received: by 2002:a05:6a00:1785:b0:538:751e:d5c6 with SMTP id s5-20020a056a00178500b00538751ed5c6mr20938560pfg.12.1662140480514;
        Fri, 02 Sep 2022 10:41:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902d2cc00b00174c1855cd9sm1916077plc.267.2022.09.02.10.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:41:19 -0700 (PDT)
Message-ID: <6312403f.170a0220.d3fb4.33f0@mx.google.com>
Date:   Fri, 02 Sep 2022 10:41:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-02-v6.0-rc3
Subject: renesas/master cros-ec: 9 runs,
 4 regressions (renesas-devel-2022-09-02-v6.0-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 9 runs, 4 regressions (renesas-devel-2022-09-02-v6.=
0-rc3)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-02-v6.0-rc3/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-02-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cac9a30c2d54cde55723b592346005941a139ded

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


  Details:     https://kernelci.org/test/plan/id/63122a61054642e9e4355666

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
122a61054642e9e4355677
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3122a61054642e9e4355679
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-02T16:07:45.186728  / # =

    2022-09-02T16:07:45.192381  =

    2022-09-02T16:07:45.295327  / # #
    2022-09-02T16:07:45.300727  #
    2022-09-02T16:07:45.402236  / # export SHELL=3D/bin/sh
    2022-09-02T16:07:45.407816  export SHELL=3D/bin/sh
    2022-09-02T16:07:45.508735  / # . /lava-7168527/environment
    2022-09-02T16:07:45.514109  . /lava-7168527/environment
    2022-09-02T16:07:45.615192  / # /lava-7168527/bin/lava-test-runner /lav=
a-7168527/0
    2022-09-02T16:07:45.620506  /lava-7168527/bin/lava-test-runner /lava-71=
68527/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63122bdbae54421e7735565e

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
122bdbae54421e7735566f
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3122bdbae54421e77355671
        failing since 17 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-02T16:13:59.837431  / # =

    2022-09-02T16:13:59.839400  =

    2022-09-02T16:13:59.942953  / # #
    2022-09-02T16:13:59.944639  #
    2022-09-02T16:14:00.047071  / # export SHELL=3D/bin/sh
    2022-09-02T16:14:00.049081  export SHELL=3D/bin/sh
    2022-09-02T16:14:00.152016  / # . /lava-7168686/environment
    2022-09-02T16:14:00.154356  . /lava-7168686/environment
    2022-09-02T16:14:00.257147  / #/lava-7168686/bin/lava-test-runner /lava=
-7168686/0
    2022-09-02T16:14:00.259564   /lava-7168686/bin/lava-test-runner /lava-7=
168686/0 =

    ... (10 line(s) more)  =

 =20
