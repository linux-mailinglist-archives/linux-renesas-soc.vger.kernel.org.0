Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F62695590
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 01:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBNAuf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 19:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjBNAud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 19:50:33 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA57EFBC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 16:50:32 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id ja21so7803807plb.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 16:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RiHNR2OqC7auE9ho9crCQY0XLIcG+g8Q2fTyQDPmP3U=;
        b=JvdqXVxCQfHvQE/hznoVAdz5w9Gd2HxpDGnLPRXCp1xC4IcJPW2ZR7/kQiUnj81qZR
         mD8KYXVguLv0Gd6RQzAInKZzvtLAG9MkXmIGNUbjAYSjCMzGUfQ3hTbfF3SJA5vrBLOj
         Y2ZFSUz9JIC0Zw5SMLmqXuhwmJUvH9kICuLdxx+jCOGyU3mJHm3N8FMOdx++Ox8aZTdb
         MzzN9sWGWnA6UDKjYdKMAk/ZZIgUBBc+Je2t0efKK07O+WUPImNn3LKGYUcsNjs7m8op
         Q4m3aJyP9jSWTMMliLJsWqDn9yP0nR2/IWUW8Rey6q4WV5CxbAwK6/X8BK3+Zy9pKIH+
         UXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RiHNR2OqC7auE9ho9crCQY0XLIcG+g8Q2fTyQDPmP3U=;
        b=RWzpwShA2m198nqwISmrN57L0m2Hy2Q0Ut6X8m6ayeBj1gQFsUPDYsPX6XxEYzAleY
         5xZKBUlpGFlt45qJGyvKFaC+u9gnrUzNnhQEkHRYt4/GCpQ7fDCNWOfzQPcWjSF+U4Rm
         BO2XYWVqpWcci+xH7PJ1ttva2ZbdxOq5lrCergTLYYww+N7REa1yoALf4MANtqPI4FCg
         6fbHzilzS0MXS0f9J9fh2tr3287qNn9oFJYq4omfpAPOBlUPnX+qpTK0aMpiZ2yID6FE
         04WEgbRXaUlHDtgfrT8Sa+tliljhITchteKt6H9Clckd3od+tsJvhqNXzXmlvqHiw1i0
         Ic6Q==
X-Gm-Message-State: AO0yUKXVnYvpvrG4ahbwQEz/j64U16yNfGwcmJJRl76WyZA78FOiNQkK
        ZXElZKBnXbtf9Kk7aMyzDEpIXZzo7vTbfmOxtGQ=
X-Google-Smtp-Source: AK7set/li00iFnA/wHXlK1gN1AV9RjnfZza/1l6R/yECAUtVhABinlm3F2rwvDN47iCY9BIKhTiJSw==
X-Received: by 2002:a17:90b:3b44:b0:230:c87e:2b2d with SMTP id ot4-20020a17090b3b4400b00230c87e2b2dmr327007pjb.40.1676335831464;
        Mon, 13 Feb 2023 16:50:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cl14-20020a17090af68e00b00230ab56a1f3sm4226951pjb.51.2023.02.13.16.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 16:50:31 -0800 (PST)
Message-ID: <63eadad7.170a0220.e49ba.6ffd@mx.google.com>
Date:   Mon, 13 Feb 2023 16:50:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-02-13-v6.2-rc8
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 185 runs,
 8 regressions (renesas-devel-2023-02-13-v6.2-rc8)
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

renesas/master baseline-nfs: 185 runs, 8 regressions (renesas-devel-2023-02=
-13-v6.2-rc8)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+crypto    | 1          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

kontron-pitx-imx8m       | arm64 | lab-kontron     | gcc-10   | defconfig+v=
ideodec           | 2          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | renesas_def=
config            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-02-13-v6.2-rc8/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-02-13-v6.2-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1114d4a0bbbebed7e53c9c2279c0c7adab6ca959 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63eab4d619fd79a8208c8640

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63eab4d619fd79a8208c8649
        failing since 14 days (last pass: renesas-devel-2023-01-26-v6.2-rc5=
, first fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-02-13T22:08:16.225824  + set[   26.594591] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 904872_1.6.2.3.1>
    2023-02-13T22:08:16.226002   +x
    2023-02-13T22:08:16.337873  #
    2023-02-13T22:08:16.439865  / # #export SHELL=3D/bin/sh
    2023-02-13T22:08:16.440274  =

    2023-02-13T22:08:16.541437  / # export SHELL=3D/bin/sh. /lava-904872/en=
vironment
    2023-02-13T22:08:16.541851  =

    2023-02-13T22:08:16.643072  / # . /lava-904872/environment/lava-904872/=
bin/lava-test-runner /lava-904872/1
    2023-02-13T22:08:16.643620  =

    2023-02-13T22:08:16.646789  / # /lava-904872/bin/lava-test-runner /lava=
-904872/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eab6528cb98e6ab48c864d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63eab6528cb98e6ab48c8655
        new failure (last pass: renesas-devel-2023-02-06-v6.2-rc7)

    2023-02-13T22:14:34.788375  + set[   27.256967] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 904889_1.6.2.3.1>
    2023-02-13T22:14:34.788595   +x
    2023-02-13T22:14:34.901418  / # #
    2023-02-13T22:14:35.002848  export SHELL=3D/bin/sh
    2023-02-13T22:14:35.003148  #
    2023-02-13T22:14:35.104298  / # export SHELL=3D/bin/sh. /lava-904889/en=
vironment
    2023-02-13T22:14:35.104609  =

    2023-02-13T22:14:35.205784  / # . /lava-904889/environment/lava-904889/=
bin/lava-test-runner /lava-904889/1
    2023-02-13T22:14:35.206248  =

    2023-02-13T22:14:35.209153  / # /lava-904889/bin/lava-test-runner /lava=
-904889/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63eab706583fdeeed68c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63eab706583fdeeed=
68c8630
        new failure (last pass: renesas-devel-2023-02-06-v6.2-rc7) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eab626a423d9274a8c8679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63eab626a423d9274=
a8c867a
        failing since 7 days (last pass: renesas-devel-2023-01-30-v6.2-rc6,=
 first fail: renesas-devel-2023-02-06-v6.2-rc7) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eab689338b8d7f138c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63eab689338b8d7f1=
38c8645
        failing since 7 days (last pass: renesas-devel-2023-01-30-v6.2-rc6,=
 first fail: renesas-devel-2023-02-06-v6.2-rc7) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
kontron-pitx-imx8m       | arm64 | lab-kontron     | gcc-10   | defconfig+v=
ideodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63eab51abafae470a78c8630

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs=
-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs=
-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63eab51abafae470a78c8637
        new failure (last pass: renesas-devel-2023-02-06-v6.2-rc7)

    2023-02-13T22:09:06.937998  / # #
    2023-02-13T22:09:07.039973  export SHELL=3D/bin/sh
    2023-02-13T22:09:07.040414  #
    2023-02-13T22:09:07.141978  / # export SHELL=3D/bin/sh. /lava-274066/en=
vironment
    2023-02-13T22:09:07.142462  =

    2023-02-13T22:09:07.243867  / # . /lava-274066/environment/lava-274066/=
bin/lava-test-runner /lava-274066/1
    2023-02-13T22:09:07.244594  =

    2023-02-13T22:09:07.249433  / # /lava-274066/bin/lava-test-runner /lava=
-274066/1
    2023-02-13T22:09:07.501286  + export TESTRUN_ID=3D1_bootrr
    2023-02-13T22:09:07.504389  + cd /lava-274066/1/tests/1_bootrr =

    ... (12 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/63eab51abafae470a78c8647
        new failure (last pass: renesas-devel-2023-02-06-v6.2-rc7)

    2023-02-13T22:09:11.638851  /lava-274066/1/../bin/lava-test-case
    2023-02-13T22:09:11.700920  <8>[   23.197377] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | renesas_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/63ea9f0c8669bb33788c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-13-v6.2-rc8/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63ea9f0c8669bb337=
88c8648
        new failure (last pass: renesas-devel-2023-02-06-v6.2-rc7) =

 =20
