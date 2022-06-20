Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3E455163C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jun 2022 12:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240153AbiFTKtB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jun 2022 06:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240434AbiFTKs5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 06:48:57 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780F113D48
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:56 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 68so4530163pgb.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2fgIFDSdEwnVhxMcjghLAwCbUIH2gsYdrlCZFlQRU8w=;
        b=fBetj7/jD6lzGvgeDyH6gxXOoGN10VKx6IYSJeXSRWraUTfZ9YuxC8qKUG4E4kNiTG
         mhFiqrbrtNX4pyvAmQeDV1xT8+sDfc9JEgyKJJF/EEclzKhUzcz2O8QqG+mSxO/yVPMI
         5lVD150FCANa/XTKZnXMTU+un6FmrjUP6H8O38KA2kY8iJ8j5cQs9GkSfzj1+n5BInL3
         cmZPBDvMEtFSCIxVvbWS1rOKsUJgKs/seL1puoWcjKV444335tLZRneqbIvhZVVRw5yy
         w2AEA+bkjKXzSY0fgWMXqJij7tiqtR1s2yIM0B6uoonSYtOJP2eK0S7vfiUtiWt4tGdO
         C6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2fgIFDSdEwnVhxMcjghLAwCbUIH2gsYdrlCZFlQRU8w=;
        b=GX5hGc3opZ3J2SxICUO9VNiqnokuUoBat/DysVvRKIjqs7l1QHeRy5rpdBhlX8LqNi
         6TqpvKJ/Nn7DLaJiA56X9odkiubR2kn1LiXCzcXacB7r4MR6utqVI3hx7G0lcgN215u7
         rxqkP6VwcZnKVHrPXBYpCT9kY44cU2oR8hFVpHr8jzuNEz/v+1dEPKXHStRwMhL3iGKt
         ZPXBlRq/0mDbrnvDU+Yh0m99xmEKUepCNxNzfo4uinapziKF6CbWAGGP5KDFueQaEn55
         OndxxzgbVlyidvVca8s0Dxbdxruh0isWLbI8O8gsUYcoHu9h5CSknB+3OIwKHGrEl2L2
         D4AA==
X-Gm-Message-State: AJIora9G5OEDPp1RtiXToL7VabEo99enn2bwI2f6stRbIe7eYx7+CS/R
        2xjWF9KlYm9yS8Q58jqxFK3b+fuZHOtoVCuefeA=
X-Google-Smtp-Source: AGRyM1s3cF4r0fYaq+hiTTVs7kVH3qH6V+IY0bXR5zluI2+q7FWKnTW+34snxD0sK2LV7yeEWAmBSw==
X-Received: by 2002:a63:8c5b:0:b0:40c:d256:86ed with SMTP id q27-20020a638c5b000000b0040cd25686edmr1249499pgn.212.1655722135842;
        Mon, 20 Jun 2022 03:48:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d6-20020a170902654600b0016357fd0fd1sm8342472pln.69.2022.06.20.03.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 03:48:55 -0700 (PDT)
Message-ID: <62b05097.1c69fb81.9dc0f.b831@mx.google.com>
Date:   Mon, 20 Jun 2022 03:48:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-20-v5.19-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 4 runs,
 2 regressions (renesas-devel-2022-06-20-v5.19-rc3)
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

renesas/master usb: 4 runs, 2 regressions (renesas-devel-2022-06-20-v5.19-r=
c3)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-20-v5.19-rc3/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-20-v5.19-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ebde835d00b25f6852cef819b7b8c96e07c709b5 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62b047e0a93f0a3e25a39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62b047e0a93f0a3e25a39bf5
        failing since 13 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62b042c9ca20ea1858a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra12=
4-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra12=
4-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62b042c9ca20ea1858a39bd0
        failing since 27 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
