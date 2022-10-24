Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6525B60AD6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 16:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbiJXOXc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 10:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235762AbiJXOV7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 10:21:59 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DBC80EAC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:58:33 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id u6so8338315plq.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jAU0xSLWApN/12EOntvj/YIWR2xlwDnCBQOXCI8njAQ=;
        b=q8V1e+KeS8msXdTKhSbrZ4UvgYHf46X3b2XPjhPI2g6+n9S5EbMiEV9PEx3+YCNPDa
         VZtoElvuPm9ViQoUKs1Cy6+egc+X4suPfiOqOHMSaQQ9F6kAT+SS2mbNi2k0rkR/F4qG
         cpI2yn7GnvWzafA5fSuE0ygU6QyL1+5+jmc/6jFkVSCiEi45YVu4DdZpuJ4lLDQ2hA23
         0JB1rI+Zermnqmqk1gxzkZxQHfeaIDFS0/pAydw+Et0WDZOJqew8/6fz+9emrxxkFg4Q
         AB/RyGIAGipLmW1ZwRYcW6llvykEeroD/l2GOpCELtOSmb5AnlOzFZHN/JS1IDV/NIia
         UO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAU0xSLWApN/12EOntvj/YIWR2xlwDnCBQOXCI8njAQ=;
        b=kxMm7oq6RLYJcR2ozlUE1p5sGw5sHp5kF1Ht61z+XwDGw60Aa0ILMkg24WV85DHaio
         7utOpiyABFgDAO98csKA1iQTdRCapaA6O1uM1GlthBtOAYAPTJK15ku9snfg4nlRWHv3
         pxdtMZbQtCif3iG6R25612k+DbcoQDQCYkyfQ2/IM2QFaucMQLI4rnHzTrjZeK9JqK3W
         n+t7AMRbeZL4lQoDm8w+qA50vBsj52b6PrJL1JPByJxiriFrxrBGvqtoM6VlDYEB7CS6
         EO/5hsz/gVb6V/qMB5BG1IqhQJIaNo9InY7j6D3Qi+iYGY00BRqUWtupSOj9WZxyRCpd
         Raow==
X-Gm-Message-State: ACrzQf3ZWflTAsLiFhYZ9KP4hDPb45rw3ocesdk7/hlB2VBfMPViqTi7
        xj3VRsjHYrITHMguTUU6/kkLeprgYrYO+WB3
X-Google-Smtp-Source: AMsMyM6bMo29aco/+gdDMxFgOh0OVqEd3kQnOi/rDE3HzE1ITHKZIUdOo542HgAmpq3/vLp34yD6yw==
X-Received: by 2002:a17:903:1c2:b0:185:47ce:f4d2 with SMTP id e2-20020a17090301c200b0018547cef4d2mr33749511plh.101.1666614599941;
        Mon, 24 Oct 2022 05:29:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b11-20020a1709027e0b00b00176b63535adsm19132141plm.260.2022.10.24.05.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 05:29:59 -0700 (PDT)
Message-ID: <63568547.170a0220.b062a.4c8b@mx.google.com>
Date:   Mon, 24 Oct 2022 05:29:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-10-24-v6.1-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 8 runs,
 5 regressions (renesas-next-2022-10-24-v6.1-rc1)
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

renesas/next cros-ec: 8 runs, 5 regressions (renesas-next-2022-10-24-v6.1-r=
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

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-10-24-v6.1-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-10-24-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e165b026d6f6a9f7c09e956119621b2f05b5f42d

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


  Details:     https://kernelci.org/test/plan/id/63566f2267bc274f2f5e5b62

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-24-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-24-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
566f2267bc274f2f5e5b6d
        failing since 70 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3566f2267bc274f2f5e5b6f
        failing since 70 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-10-24T10:55:13.056481  / # =

    2022-10-24T10:55:13.062990  =

    2022-10-24T10:55:13.170002  / # #
    2022-10-24T10:55:13.176179  #
    2022-10-24T10:55:13.279022  / # export SHELL=3D/bin/sh
    2022-10-24T10:55:13.285149  export SHELL=3D/bin/sh
    2022-10-24T10:55:13.387450  / # . /lava-7695450/environment
    2022-10-24T10:55:13.393464  . /lava-7695450/environment
    2022-10-24T10:55:13.495826  / # /lava-7695450/bin/lava-test-runner /lav=
a-7695450/0
    2022-10-24T10:55:13.502005  /lava-7695450/bin/lava-test-runner /lava-76=
95450/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63566e90f19cbbbc2c5e5b3c

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-24-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-24-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
566e90f19cbbbc2c5e5b43
        failing since 70 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3566e90f19cbbbc2c5e5b45
        failing since 70 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-10-24T10:52:46.505146  / # =

    2022-10-24T10:52:46.510312  =

    2022-10-24T10:52:46.611995  / # #
    2022-10-24T10:52:46.617260  #
    2022-10-24T10:52:46.718128  / # export SHELL=3D/bin/sh
    2022-10-24T10:52:46.723000  export SHELL=3D/bin/sh
    2022-10-24T10:52:46.823917  / # . /lava-7695446/environment
    2022-10-24T10:52:46.829372  . /lava-7695446/environment
    2022-10-24T10:52:46.930155  / # /lava-7695446/bin/lava-test-runner /lav=
a-7695446/0
    2022-10-24T10:52:46.935566  /lava-7695446/bin/lava-test-runner /lava-76=
95446/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6356736f0c8551c40a5e5b5c

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-24-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-10-24-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
356736f0c8551c40a5e5b6f
        failing since 70 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-10-24T11:13:42.122384  / # =

    2022-10-24T11:13:42.125469  =

    2022-10-24T11:13:42.229650  / # #
    2022-10-24T11:13:42.233192  #
    2022-10-24T11:13:42.338114  / # export SHELL=3D/bin/sh
    2022-10-24T11:13:42.338420  export SHELL=3D/bin/sh<6>[   30.290578] asi=
x 5-1:1.0 (unnamed net_device) (uninitialized): PHY [usb-005:002:10] driver=
 [Asix Electronics AX88772C] (irq=3DPOLL)
    2022-10-24T11:13:42.338512  <6>[   30.293965] Asix Electronics AX88772C=
 usb-005:002:10: attached PHY driver (mii_bus:phy_addr=3Dusb-005:002:10, ir=
q=3DPOLL)
    2022-10-24T11:13:42.338621  <6>[   30.295571] asix 5-1:1.0 eth0: regist=
er 'asix' at usb-xhci-hcd.13.auto-1, ASIX AX88772B USB 2.0 Ethernet, 00:6f:=
00:03:0b:7f
    2022-10-24T11:13:42.338721  <6>[   30.296156] usbcore: registered new i=
nterface driver asix
    2022-10-24T11:13:42.344912  <6>[   30.315798] asix 5-1:1.0 enx006f00030=
b7f: renamed from eth0 =

    ... (21 line(s) more)  =

 =20
