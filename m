Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F30C5F46DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Oct 2022 17:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiJDPnn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Oct 2022 11:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiJDPnm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2022 11:43:42 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C0D4E617
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 08:43:41 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id b5so13018022pgb.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Oct 2022 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=3Dxu880lxqMHxGJkBBv+SpQ2XRHkcUq+saSoR3EOnlA=;
        b=4BYxI732OX5lSrmQEARZPKnuD+2GWwu/ViDiXFjIuOEkBEctQdwC6BMWJu1MaaZa6/
         /1nHhFM589NuYp1fXw3tzHmzIJVi1R+7s4GLjKiRSiLi+QFO5zPeHVGmhnAz5/CJMjvJ
         7UfwZmTv0fwkIBE6MXGPuGHhbMPmpOGKvPXhy+Z03BIWKKN7hKy7vo+UAO4jyxV2vGI1
         dlOlFFIF96PC/3aDdz5SnzRQplYxK+9ZnTszIDXsQR8NfwLMBT0TVYbBsO6RNWCvGvI7
         8hHMcLgT24IN1AzhMEKvS8c+y/T6MTYaBOhcgHoBZDlJMeS0cYfos8TYayNHJxPtbjYB
         PPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=3Dxu880lxqMHxGJkBBv+SpQ2XRHkcUq+saSoR3EOnlA=;
        b=yWdbR/bAwLPkm6pJLgI8X6NaaJC1fZu5Ebbds7jyYDMoIFaoNM3Bw8WoH+6GB98Fjb
         /1WRGxaMtWGNOX/lijrhF17awXUIkJr40ahvR7Kq8Vo33KjElVGOyoOu3pVwzTzG/GHe
         Ce/DII6PfEktOvnfH8JwcwCKuL/ZYxF5Eq9rZj6hdbwbLwJomPzSYPq6WjnNlw6nSbBu
         k49Wl0ArYaaUbU+/ogex/RkqTF39vAZ6pgINt0BZVGOyErZ7j+HWYiMyaoohieXehG+I
         zAFYsMqpV17/CIHfQMoxASA2qNoeQOq5p6Qhf82pwDW8oUrw0n2r/V5ubUvJOfbkqEhb
         qmLg==
X-Gm-Message-State: ACrzQf0XCXqy+zIxoirlPD8ZBms/IdAOuXzUIsirhctnM6FMXEypXUS6
        njL9XSLbfW5OrFcUd3m92mv4V/U95J99mU/8lJA=
X-Google-Smtp-Source: AMsMyM4HA6Yd5YPjYZvhEIxyY6UvBqWzN3rYxqT21qMaOd+ZWxrlZXUIQI1UeXbrHBh86PyyXSdNMg==
X-Received: by 2002:a65:4d46:0:b0:43b:e00f:8663 with SMTP id j6-20020a654d46000000b0043be00f8663mr23563356pgt.147.1664898220457;
        Tue, 04 Oct 2022 08:43:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d21-20020a630e15000000b00456f77f6dd7sm694874pgl.44.2022.10.04.08.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:43:40 -0700 (PDT)
Message-ID: <633c54ac.630a0220.31891.13d7@mx.google.com>
Date:   Tue, 04 Oct 2022 08:43:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-10-04-v6.0
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 99 runs,
 4 regressions (renesas-devel-2022-10-04-v6.0)
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

renesas/master baseline-nfs: 99 runs, 4 regressions (renesas-devel-2022-10-=
04-v6.0)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec         | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-04-v6.0/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-04-v6.0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a341ff11c47c3b9175e02fd34c584a0c19c12e0b =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/633c1d80f1e9c0dd6ccab61c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sa=
m9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sa=
m9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633c1d80f1e9c0dd6=
ccab61d
        failing since 0 day (last pass: renesas-devel-2022-09-27-v6.0-rc7, =
first fail: renesas-devel-2022-10-03-v6.0) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec         | 1          =


  Details:     https://kernelci.org/test/plan/id/633c52c5921a136348cab609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-me=
son-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-me=
son-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633c52c5921a13634=
8cab60a
        failing since 1 day (last pass: renesas-devel-2022-09-19-v6.0-rc6, =
first fail: renesas-devel-2022-10-03-v6.0) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/633c222e2748e3ee76cab60d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633c222e2748e3ee7=
6cab60e
        failing since 49 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =


  Details:     https://kernelci.org/test/plan/id/633c338af8e63e7c12cab639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a7=
7950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a7=
7950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220923.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/633c338af8e63e7c1=
2cab63a
        new failure (last pass: renesas-devel-2022-09-27-v6.0-rc7) =

 =20
