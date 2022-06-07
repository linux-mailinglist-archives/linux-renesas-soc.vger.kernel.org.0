Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416FB540111
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 16:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244308AbiFGOUo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 10:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239473AbiFGOUo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 10:20:44 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EB6C9646
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:20:42 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id f9so4482781plg.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2022 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=v5B+HoqPXYKJ89dd5vHYLqGK0rbE72ISDo6Ur0HadJQ=;
        b=8P4nPoYn6GSl/N6v8RcLLp7J/v1HqCakL1Wqiwcs9t3W+FzZmbBU8bQ4PvOC110ID7
         kui1fOVcvZfOzvushLMGVGsyYmL7k+C/JHq1s+XkQvEG8Se9wr7MURRT1SvY5lH8zVoc
         Jpyqx9vYQIiCNXHn42GyfpTgyljSvlGfESRv2hcaPkwHyqKRAgH0T3EZlARzO36HcyLb
         CMF16hA30OZwJstRzOnmuUIUvFrFXtXdBsn/jgsqFqaQOJtWak+UlsorClnWrKvMMvcY
         cbEH0tOuL4s/+oD5SruwP6WB37+6tal4XRLDT7wPb5OymmcFMTObad9hVWky3fUGzCZo
         jwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=v5B+HoqPXYKJ89dd5vHYLqGK0rbE72ISDo6Ur0HadJQ=;
        b=GSR+eJnECYikJcbNUwMMwuz2S0n6auBTc9NhMgITbHrqVqZWoGhUdp/KejYYfrUO9Z
         b9AbRlqSrviY8CAMnezwTkXcJ47rm02fBDSCULw4erASz/bCOhJl9veUdZ0lJyeIGrZG
         qnNXJRYaXoWzL8NpXW/ZY0NOcqKtK9xbGHBe/bwoNKwoka7KUBbxX68hBLzrKJbh/4z9
         RNWMPbD1IC3oOe7bFv6qsCB1xRgtkDXuqJ748vg6aynXvwPPHz3SxWB4BJq+fGPSTuts
         slnm06PHZOFGsBpqe287+2EYvNYjmItxAIdvpLsFC+steCgOXKeSe8yZucpdZJv5vEn0
         ZfvQ==
X-Gm-Message-State: AOAM531TaWacavJDiGQra6vSmSqKiVFxtfHUhCkCixwTvYfNK5juei4b
        153rye5i8zCU9YLGYNH8qNrskwqaRdjuWY0d3Tw=
X-Google-Smtp-Source: ABdhPJw4GSxm0sHebpKu+5Mv7c327b8N1sReFs+Vys+Cn13OVpyXPZdJ1c8sQYVWWikJETu52oYplQ==
X-Received: by 2002:a17:90b:3ec3:b0:1e8:844f:6d43 with SMTP id rm3-20020a17090b3ec300b001e8844f6d43mr11267178pjb.112.1654611642184;
        Tue, 07 Jun 2022 07:20:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902a38500b001640beeebf1sm12555018pla.268.2022.06.07.07.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 07:20:41 -0700 (PDT)
Message-ID: <629f5eb9.1c69fb81.58025.ba2a@mx.google.com>
Date:   Tue, 07 Jun 2022 07:20:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-07-v5.19-rc1
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 102 runs,
 5 regressions (renesas-devel-2022-06-07-v5.19-rc1)
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

renesas/master baseline-nfs: 102 runs, 5 regressions (renesas-devel-2022-06=
-07-v5.19-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
          | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
          | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | renesas_d=
efconfig  | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-07-v5.19-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-07-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4d4136360b30e8e454df0f7a2166303438081616 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/629f5a4526696e96a8a39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/629f5a4526696e96a=
8a39be2
        failing since 14 days (last pass: renesas-devel-2022-05-09-v5.18-rc=
6, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/629f294c9cf8a0c2ffa39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/629f294c9cf8a0c2f=
fa39bce
        failing since 14 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2ce96af6baa033a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/629f2ce96af6baa03=
3a39bd9
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | renesas_d=
efconfig  | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2db212e5f77599a39bfa

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-nf=
s-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-nf=
s-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/629f2db212e=
5f77599a39c01
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1)
        2 lines

    2022-06-07T10:51:20.601982  kern  :emerg : BUG: spinlock already unlock=
ed on CPU#3, pr/scif0/13
    2022-06-07T10:51:20.605186  kern  :emerg :  lock: sci_ports+0x0/0x4da0,=
 .magic: dead4ead, .owner: <none>/-1, .owner_cpu: -1
    2022-06-07T10:51:20.661364  <8>[   21.512950] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-07T10:51:20.661684  + set +x   =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/629f5bc7f12e30ece6a39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nf=
s-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nf=
s-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/629f5bc7f12e30ece=
6a39be1
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1) =

 =20
