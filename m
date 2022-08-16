Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8A33595A8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 13:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbiHPLrS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 07:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbiHPLrE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 07:47:04 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB05B69FC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 04:20:55 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id p125so9075507pfp.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=0b86uFZrqS07DOR/Kbl2rafEiNeAu1OyyEdvhjr9BL0=;
        b=r6CJekERugLS8XBX/C6T883uS72NdZ7A6Z9pbMNN2uJNPX9V+iFMTQGTiemQWEMz7y
         Y6g27HtyOnvZXsRu7m3RNBC312zKzNazMpmp27MzyDVOo2Na1zLxLk24LVdNFpTFHlTS
         WfetK5rNVo/N9wGRLaJqR+S6Cd7Q8U6QefSXBVrGtLJdMnv4mNhy4xz/o1+kRplY0xuF
         6tSKbeZm5cObEfhNgnxx2LTEzcvKfTFrZk5A66Oko4M2b6seyfNvKSVbK8uM7DTcG2BX
         JD2vgbYa7QlerkflTBCJBAaLneiUIiRZcDW2tenCjotS5aI9+rG4HU+KexvwlCGLqQnY
         obXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=0b86uFZrqS07DOR/Kbl2rafEiNeAu1OyyEdvhjr9BL0=;
        b=ACoo5xU68o7yfUDWoQbzwXkiJy1Y+YL67Bs0FlRfbYnENazapURgQ9q2hgEXyDcBKS
         z5JB0NhcCxdotwEeKOj/Az4LnflutIJMzJRivDwAuzyRgWXIo+UB59phcLhC2nfTqZ3C
         /7Pz6dozcLj2FVhCA5S8cjXVs4sTagyuqCd2sg6xSxVVwpV4AHVp1yqBgx/iP3qE7ClL
         2iUAqeIcXVKuvaJMMJ/47MgXzMwz4jh+DrE614YX5B7NXVYa8hDv2fR/QpIZYHHdg1ig
         Hiqci7fHYyj6YhxKPn+BO5bUKZn2U5N4btaHct0eUJMxErBx021epv6l4+uKuK1Qv4Pt
         lKUA==
X-Gm-Message-State: ACgBeo3aCaHqdC+zVD7RDLGbXqYvPWokXSkAJcpHc0iV+NyNqZyDR1Zk
        Mp/n0yx/UufRYHaTGSulblvVHV7mse2qIO5m
X-Google-Smtp-Source: AA6agR6XIMuDAwQT8hNipGhVt+SoAcRr2gQpoiEKXlg5RkO8l+0UW5nSyFxAZAHnPm81Pi9cGsDXpg==
X-Received: by 2002:a05:6a00:17a8:b0:52e:6e3e:9ff with SMTP id s40-20020a056a0017a800b0052e6e3e09ffmr20816117pfg.42.1660648854132;
        Tue, 16 Aug 2022 04:20:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902684400b0016c4147e48asm8758543pln.219.2022.08.16.04.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 04:20:46 -0700 (PDT)
Message-ID: <62fb7d8e.170a0220.d1822.ebbe@mx.google.com>
Date:   Tue, 16 Aug 2022 04:20:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-16-v6.0-rc1
Subject: renesas/next cros-ec: 5 runs,
 4 regressions (renesas-next-2022-08-16-v6.0-rc1)
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

renesas/next cros-ec: 5 runs, 4 regressions (renesas-next-2022-08-16-v6.0-r=
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
s-next-2022-08-16-v6.0-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-16-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      328413c2bd85d7011cd71072902a43c448b71f59

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


  Details:     https://kernelci.org/test/plan/id/62fb6665f9fca13c5a355671

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/62=
fb6665f9fca13c5a355682
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
2fb6665f9fca13c5a355684
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-16T09:41:40.662049  / # =

    2022-08-16T09:41:40.668157  =

    2022-08-16T09:41:40.774634  / # #
    2022-08-16T09:41:40.781376  #
    2022-08-16T09:41:40.883961  / # export SHELL=3D/bin/sh
    2022-08-16T09:41:40.889935  export SHELL=3D/bin/sh
    2022-08-16T09:41:40.992097  / # . /lava-7047739/environment
    2022-08-16T09:41:40.998262  . /lava-7047739/environment
    2022-08-16T09:41:41.100271  / # /lava-7047739/bin/lava-test-runner /lav=
a-7047739/0
    2022-08-16T09:41:41.106066  /lava-7047739/bin/lava-test-runner /lava-70=
47739/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/62fb6599415f656f2635566e

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220812.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/62=
fb6599415f656f2635567f
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
2fb6599415f656f26355681
        failing since 0 day (last pass: renesas-next-2022-07-07-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-16T09:38:24.355307  / # =

    2022-08-16T09:38:24.359907  =

    2022-08-16T09:38:24.461540  / # #
    2022-08-16T09:38:24.466272  #
    2022-08-16T09:38:24.567232  / # export SHELL=3D/bin/sh
    2022-08-16T09:38:24.572227  export SHELL=3D/bin/sh
    2022-08-16T09:38:24.673106  / # . /lava-7047740/environment
    2022-08-16T09:38:24.677903  . /lava-7047740/environment
    2022-08-16T09:38:24.778771  / # /lava-7047740/bin/lava-test-runner /lav=
a-7047740/0
    2022-08-16T09:38:24.783692  /lava-7047740/bin/lava-test-runner /lava-70=
47740/0 =

    ... (7 line(s) more)  =

 =20
