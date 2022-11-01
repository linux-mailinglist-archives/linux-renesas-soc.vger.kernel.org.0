Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6886614DFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 16:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbiKAPN5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 11:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbiKAPNi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 11:13:38 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373B91EAF4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 08:09:12 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id b11so13472046pjp.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QBWXo8PxtkX7AQQlgQCHvMJ2+jVHD7sLWNEFZ6XNIts=;
        b=zF6zGsMrVSLGmPcI4/26pkEb2+lIpYgGivnMMrNbCRzc5Atz1+qPW434Y/LDqqfarn
         Ikx9EcaC0VzVAMnFEToz2tHm6JzvxJfgcK1FLJysFmG7stP5BHp9RNnVPGrRfWXAm3j8
         jZS5uOq1hq+IzKRkgp5WriH5p3xggCHLwmswD7UyS+d2SBuLMn4mhjEKwt8bpB45s5SC
         1DcRKG1c3V+1/Ei6v8lQEtwygbcHm7ZWaESt5VWJvvqGXE+rMhjLVjPVklRqW0m1HgS5
         jXFGyDZqOLqjZk4m714Jjlha943usmM/wpKqw8mbyJGx0H25zMzZjlzpK8xs8i6PsdYI
         lfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBWXo8PxtkX7AQQlgQCHvMJ2+jVHD7sLWNEFZ6XNIts=;
        b=PFMpzYs8uLsB8rytsgd1tkhgzlZYF92DFr3qr+nZd5WGI01+Asnbn3Vwh5ddlxCDhx
         6kt5SWBqQ817pyG0//a+hC5xEuU/DFHpk99S/cdb23o2JewW2vTYHvT3zMnpRTlhHE/p
         Ds8fRgor+g9VlDd7rvTX2l3R2uYPjddbcqBYzQO3waaHnJoIFNLxUR1iT2apWSaKaLP6
         YNdRTzrjYKh016Z1NwpbtG9kl8ak5SOPHkLUV9KP3KPBUwxdGH5oUVd5Fs3K69DxsBaq
         pgQ1LHjXsBfVrgAOfQWnL0WjIDrNUetYoKO+JZ0E1Ncmc1khFvHgogABVkM8zhdfw5lp
         Aenw==
X-Gm-Message-State: ACrzQf28jlKAAGGxy4u1jEHU1I1WlUrLvJ3xbCQvTm+2YN6buYWfkurI
        KZO1yySLdOf4KhqEVpxeq7o8Ek87wwMErtXk
X-Google-Smtp-Source: AMsMyM6TAf0ldllDKPGSIkgqQbGDqPPTSk2Vlcc0dy9HBckuxaadJ3RgfcrwGuLJRAq+U53B2ZB6UQ==
X-Received: by 2002:a17:902:bf45:b0:187:337c:b967 with SMTP id u5-20020a170902bf4500b00187337cb967mr5198026pls.4.1667315351491;
        Tue, 01 Nov 2022 08:09:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e81200b001868d4600b8sm6509728plg.158.2022.11.01.08.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 08:09:11 -0700 (PDT)
Message-ID: <63613697.170a0220.6726d.b436@mx.google.com>
Date:   Tue, 01 Nov 2022 08:09:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-01-v6.1-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 158 runs,
 7 regressions (renesas-devel-2022-11-01-v6.1-rc3)
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

renesas/master baseline-nfs: 158 runs, 7 regressions (renesas-devel-2022-11=
-01-v6.1-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-01-v6.1-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-01-v6.1-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      484e5fc34235bd38f3d58742e7af8455e2699205 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63611fdebf399c1bb4e7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63611fdebf399c1bb=
4e7db4f
        failing since 35 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63612465307e30f778e7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63612465307e30f77=
8e7db4f
        failing since 27 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-04-v6.0) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63612a63d96103a0ffe7db53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63612a63d96103a0f=
fe7db54
        failing since 63 days (last pass: renesas-devel-2022-08-22-v6.0-rc2=
, first fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63612be97d2343cb27e7db8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63612be97d2343cb2=
7e7db8e
        failing since 43 days (last pass: renesas-devel-2022-09-05-v6.0-rc4=
, first fail: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63612f773f21c2137fe7db81

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nf=
s-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nf=
s-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63612f773f21c2137=
fe7db82
        failing since 29 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-10-03-v6.0) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6360ff297d882784f1e7dbf6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6360ff297d882784f=
1e7dbf7
        failing since 77 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6361114bb022534336e7db54

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6361114bb02=
2534336e7db5b
        failing since 3 days (last pass: renesas-devel-2022-10-24-v6.1-rc2,=
 first fail: renesas-devel-2022-10-28-v6.1-rc2)
        1 lines

    2022-11-01T12:29:28.931678  kern  :emerg : Disabling IRQ #35
    2022-11-01T12:29:29.251792  <8>[   44.430433] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =20
