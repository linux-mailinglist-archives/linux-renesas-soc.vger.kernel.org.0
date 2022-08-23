Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B511F59D622
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 11:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347335AbiHWIr7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Aug 2022 04:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348721AbiHWIqy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 04:46:54 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C22D7B7AD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 01:21:38 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id m15so5310719pjj.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=fvw+bbRhwdCV5UtLUiogVWbws4qEimZ/u/jIrGCPH6M=;
        b=piHX3fUiIqN0Yu61qjCRt8W9HsIVMlhJpWIb6ptaYVV6fOraWr2ax95ZSfG6kDdNX/
         /TSJFaKzrUanudc86LaM1PggPEh/beB1GfPvl1Xk9Bv3DBgK0jEqibcPo+xrm8LVxL5E
         M+rTI5vNUiP369vJQZlyfN4ZuwVDkun7WH6jHqDCbN3knpPm0pIv6VjGcif/Nn/ytpiH
         1xibtZsBTMcQlvuZqGcmYUHBAqInl53qBF/XxKwBsIMi9YOs/4TFg4mI0kDTsX1I7Ya2
         MWJH1bZx4j9txh3vuwrxtR3OKNp2QRTG99NOnSR2StI2cZiLq1URnZDn3Kef1z3BbU40
         PU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=fvw+bbRhwdCV5UtLUiogVWbws4qEimZ/u/jIrGCPH6M=;
        b=HxsAjG7nPnjs1eY52v1zEfauG6AjGT/2vA9/ttheYW3GBwyLW3jbIM5gINhwhueiZX
         frkOl8ZzA/5Ig7p1304otfu6cT3xdDAio/V0GUz1S4Bubeq/uKRAmW+riNkaWNKVY566
         uCnjmw42hNlWV3I3mkLVdPhJw798TGmd9Pzuco9b6b6KevhMHvihbv4wFzkoAyT9aj+h
         SdQqNXYw2gTK573friKYdbOhgIG8ery4M1naCTybNMv/QXrwoCpM2vcn3odxSsFThK1m
         l2TAJs8P7rw0QHACGZxOy7lG+F/jZCYdgauACrF2tEIC2dqI+LCLzrG7aCh6BDS+agrv
         wF9A==
X-Gm-Message-State: ACgBeo3Iz3EN3CILiS/HxQf7sp+Q+fTjK8qeZ2KNxQZoUQu07rvxogqM
        2tKBQsvasJ2DPB4mKNw4atvzwk8pN10NyEo2
X-Google-Smtp-Source: AA6agR66e+s4zzQxC3kwEJX0nhZuudY7LpbQ5KMsKt56zLKNofWKMpjJsRqgYKq9BtG+nFRudb6kyw==
X-Received: by 2002:a17:902:8c93:b0:172:bb10:214c with SMTP id t19-20020a1709028c9300b00172bb10214cmr21871400plo.135.1661242874642;
        Tue, 23 Aug 2022 01:21:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709026b8400b001729da53673sm9820292plk.14.2022.08.23.01.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 01:21:14 -0700 (PDT)
Message-ID: <63048dfa.170a0220.c8d70.18ae@mx.google.com>
Date:   Tue, 23 Aug 2022 01:21:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-22-v6.0-rc2
Subject: renesas/master baseline: 394 runs,
 30 regressions (renesas-devel-2022-08-22-v6.0-rc2)
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

renesas/master baseline: 394 runs, 30 regressions (renesas-devel-2022-08-22=
-v6.0-rc2)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beaglebone-black           | arm   | lab-cip         | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

beaglebone-black           | arm   | lab-cip         | gcc-10   | multi_v7_=
defconfig           | 1          =

beaglebone-black           | arm   | lab-cip         | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

imx6dl-riotboard           | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

imx6qp-wandboard-revd1     | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

imx7d-sdb                  | arm   | lab-nxp         | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+debug              | 1          =

kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+ima                | 3          =

kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+crypto             | 2          =

kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
                    | 2          =

kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

qemu_arm-vexpress-a15      | arm   | lab-baylibre    | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15      | arm   | lab-broonie     | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15      | arm   | lab-collabora   | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9       | arm   | lab-baylibre    | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9       | arm   | lab-broonie     | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9       | arm   | lab-collabora   | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-22-v6.0-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-22-v6.0-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0b923c18404277346b012fab71a5bf981e8ad927 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beaglebone-black           | arm   | lab-cip         | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63046b9eb419a3d2db355673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63046b9eb419a3d2db355=
674
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beaglebone-black           | arm   | lab-cip         | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63047f76c7eb339297355660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63047f76c7eb339297355=
661
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beaglebone-black           | arm   | lab-cip         | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/630484bc82fd3f7c73355654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-be=
aglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-be=
aglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630484bc82fd3f7c73355=
655
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6dl-riotboard           | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63045bd86362bcbd5835564c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63045bd86362bcb=
d58355650
        new failure (last pass: renesas-devel-2022-08-11-v5.19)
        46 lines

    2022-08-23T04:46:58.828110  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:2  pfn:397c4
    2022-08-23T04:46:58.837062  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:397b5
    2022-08-23T04:46:58.845951  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:397ba
    2022-08-23T04:46:58.846162  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:397b9
    2022-08-23T04:46:58.854934  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:397ad
    2022-08-23T04:46:58.864182  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:397ac
    2022-08-23T04:46:58.864335  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:397ab
    2022-08-23T04:46:58.872996  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:3974d
    2022-08-23T04:46:58.882094  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:39767
    2022-08-23T04:46:58.882245  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:39766 =

    ... (22 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6qp-wandboard-revd1     | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63045b8837338186a7355674

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63045b883733818=
6a7355678
        new failure (last pass: renesas-devel-2022-08-11-v5.19)
        51 lines

    2022-08-23T04:45:48.277238  [   71.748715][  T278] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-08-23T04:45:48.578054  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:0  pfn:38fb9
    2022-08-23T04:45:48.586902  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:0  pfn:38fb5
    2022-08-23T04:45:48.595834  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:0  pfn:38fb4
    2022-08-23T04:45:48.596000  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:0  pfn:38fb3
    2022-08-23T04:45:48.605210  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:0  pfn:38faf
    2022-08-23T04:45:48.614052  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:0  pfn:38fae
    2022-08-23T04:45:48.614200  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:0  pfn:38fad
    2022-08-23T04:45:48.622929  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:2  pfn:38fa3
    2022-08-23T04:45:48.632091  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38f9d =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx7d-sdb                  | arm   | lab-nxp         | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/630456e16abebff4b135567f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sd=
b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630456e16abebff4b1355=
680
        failing since 6 days (last pass: renesas-devel-2022-07-22-v5.19-rc7=
, first fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63045c04b92c8d8cbf35564c

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
045c04b92c8d8cbf355659
        failing since 49 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5)

    2022-08-23T04:47:37.482174  /lava-158047/1/../bin/lava-test-case
    2022-08-23T04:47:37.559216  <8>[   39.107198][  T313] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+ima                | 3          =


  Details:     https://kernelci.org/test/plan/id/63045524361c9e1996355666

  Results:     49 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/63045524361c9e1996355678
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8)

    2022-08-23T04:18:34.829072  /lava-158008/1/../bin/lava-test-case
    2022-08-23T04:18:34.829374  <8>[   19.390544] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-23T04:18:34.829530  /lava-158008/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
45524361c9e199635567a
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8)

    2022-08-23T04:18:35.850842  /lava-158008/1/../bin/lava-test-case
    2022-08-23T04:18:35.851261  <8>[   20.434883] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-23T04:18:35.851598  /lava-158008/1/../bin/lava-test-case   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/630=
45524361c9e199635567d
        failing since 11 days (last pass: renesas-devel-2022-07-22-v5.19-rc=
7, first fail: renesas-devel-2022-08-11-v5.19-rc8)

    2022-08-23T04:18:36.888388  /lava-158008/1/../bin/lava-test-case
    2022-08-23T04:18:36.888640  <8>[   21.498326] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-08-23T04:18:36.888791  /lava-158008/1/../bin/lava-test-case
    2022-08-23T04:18:36.888933  <8>[   21.518349] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-08-23T04:18:36.889074  /lava-158008/1/../bin/lava-test-case
    2022-08-23T04:18:36.889210  <8>[   21.539760] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-08-23T04:18:36.889347  /lava-158008/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/630456296aacdd8dbc355656

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontr=
on-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/630456296aacdd8dbc355668
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-08-23T04:22:45.285434  /lava-158015/1/../bin/lava-test-case
    2022-08-23T04:22:45.286083  <8>[   19.332882] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-23T04:22:45.286378  /lava-158015/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
456296aacdd8dbc35566a
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-08-23T04:22:46.323280  /lava-158015/1/../bin/lava-test-case
    2022-08-23T04:22:46.323691  <8>[   20.377238] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-23T04:22:46.323954  /lava-158015/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/630457b7b303d0d1fa355658

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/630457b7b303d0d1fa35566a
        new failure (last pass: renesas-devel-2022-08-11-v5.19)

    2022-08-23T04:29:34.218878  /lava-158029/1/../bin/lava-test-case
    2022-08-23T04:29:34.219224  <8>[   19.400111] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
457b7b303d0d1fa35566c
        new failure (last pass: renesas-devel-2022-08-11-v5.19)

    2022-08-23T04:29:35.256503  /lava-158029/1/../bin/lava-test-case
    2022-08-23T04:29:35.256918  <8>[   20.444659] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-23T04:29:35.257170  /lava-158029/1/../bin/lava-test-case
    2022-08-23T04:29:35.257406  <8>[   20.464677] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-23T04:29:35.257660  /lava-158029/1/../bin/lava-test-case
    2022-08-23T04:29:35.257890  <8>[   20.485053] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-23T04:29:35.258122  /lava-158029/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63045fb016a7474f1d355642

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/63045fb016a7474f1d355654
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8)

    2022-08-23T05:03:21.758795  /lava-158054/1/../bin/lava-test-case
    2022-08-23T05:03:21.759092  <8>[   19.509525] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-23T05:03:21.759245  /lava-158054/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/630=
45fb016a7474f1d355656
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8)

    2022-08-23T05:03:22.796295  /lava-158054/1/../bin/lava-test-case
    2022-08-23T05:03:22.796556  <8>[   20.553573] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-23T05:03:22.796708  /lava-158054/1/../bin/lava-test-case
    2022-08-23T05:03:22.796850  <8>[   20.573738] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-23T05:03:22.796992  /lava-158054/1/../bin/lava-test-case
    2022-08-23T05:03:22.797130  <8>[   20.594086] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-23T05:03:22.797268  /lava-158054/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15      | arm   | lab-baylibre    | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63045713227f9824ce355661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045713227f9824ce355=
662
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15      | arm   | lab-broonie     | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/630457aaddbc4d13f1355687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/630457aaddbc4d13f1355=
688
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15      | arm   | lab-collabora   | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63045a81de12e9cbcf35568b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045a81de12e9cbcf355=
68c
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9       | arm   | lab-baylibre    | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63045712227f9824ce35565c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu=
_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045712227f9824ce355=
65d
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9       | arm   | lab-broonie     | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63045796ddbc4d13f135567a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_=
arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045796ddbc4d13f1355=
67b
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9       | arm   | lab-collabora   | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63045a6cf5c49d0ff9355662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qem=
u_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045a6cf5c49d0ff9355=
663
        failing since 6 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63045c3a16e7c2b45f355653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045c3a16e7c2b45f355=
654
        new failure (last pass: renesas-devel-2022-02-08-v5.17-rc3) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63045ced66f9adbc6d355649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045ced66f9adbc6d355=
64a
        new failure (last pass: renesas-devel-2022-02-08-v5.17-rc3) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63045daf00d184aac4355676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045daf00d184aac4355=
677
        failing since 49 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63045e550105de752d35565c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045e550105de752d355=
65d
        failing since 49 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63045db1d289889f9a355658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045db1d289889f9a355=
659
        failing since 11 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63045e7ee7b22924db35565a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045e7ee7b22924db355=
65b
        failing since 11 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63045644cc20948ab03556b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a7=
7950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a7=
7950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045644cc20948ab0355=
6b6
        new failure (last pass: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63045a90e4b78af0b73556ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-sa=
lvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-22-v6.0-rc2/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-sa=
lvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63045a90e4b78af0b7355=
6af
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =20
