Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D78C4D0E63
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 04:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiCHDjp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 22:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbiCHDjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 22:39:44 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F83433A05
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 19:38:49 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id cx5so15976292pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 19:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eaDbqvaDzALrPXeDIq/gxzxLwmfun8CTOafxtLwXW24=;
        b=RhphUw6KT0/CtF5rfIbPjdTAnhaVZ303GdAwL059jlc5NXdNjwhdN9UWWKkpb0oiyO
         B4PwVFNR9E8lZrfXTwyd2X7/fz/VhdwmUAo/F/2f+9LpPOm3Au2F91b3UabkvaRdoHDb
         q9osD0fClmjmS34alO23I8TnBYa0hpc15nkiEgPSUYWLTZ235EVby9fxC14igX3gAYMb
         IF20JceIOkmNa4bK5P7m2cEznE8mzb2ect5P7E4YTmHRK+rNnUmSQ8Lh2xCIhTDF+N8A
         U0SKBd1GJmIAY4PzvLhwTA1DqyNrpzptedONkN+tOVX1rhR4/lLhKgQcXiwfymOQX/EO
         mUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eaDbqvaDzALrPXeDIq/gxzxLwmfun8CTOafxtLwXW24=;
        b=FIOlfgT/JhyhfYUr3Agx1gzCs96PutMwTOa3Esc63kcOZD0PFlcQoPGbt3PLEXOqEk
         0bE55rmGE/eisbYfOgjYloOIapkqv9ST/jZ6JnosQfR8p3EZ8ZMrnLknPTL8ZlZJbXjk
         3P+up8nYyTwpPOzj8csaHEJ/woaXaX2PJhMe0w+cQA0F5e4dgpIGzbXBVWy1Nyfkmwf4
         VoT5SoiUA7kMhDMtG7JrM9eldLrXMRaUiEJftCRgyfcY0DHXyvEtqwOJXvy+G4Rlz6g3
         YrUVCh919lRjSBHyu5TOKyQvgqlYLxJCBDIB56qJccNVLyfnNSN+MtPCe99QZBpYzpqi
         gt6g==
X-Gm-Message-State: AOAM532QBbBLxsYF3KjQ3rJnjKQVPvaKieqL/MzAjAVANj05qFwbAIDw
        GuMCPKH81tz077wl9lzEr7OO2hF4RZSHTmu8EvA=
X-Google-Smtp-Source: ABdhPJyXsI28Ay+X1rSaCEzJW7HOEUgu3NSfLtQCI3UbR5Jx4xPW1a7lt9o5cCUfR8ssebD7kbZMrQ==
X-Received: by 2002:a17:902:8b87:b0:14d:7920:e54a with SMTP id ay7-20020a1709028b8700b0014d7920e54amr15321214plb.140.1646710728753;
        Mon, 07 Mar 2022 19:38:48 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t5-20020a654b85000000b00373cbfbf965sm13312818pgq.46.2022.03.07.19.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 19:38:48 -0800 (PST)
Message-ID: <6226cfc8.1c69fb81.f924a.32b8@mx.google.com>
Date:   Mon, 07 Mar 2022 19:38:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-03-07-v5.17-rc7
Subject: renesas/master baseline: 282 runs,
 3 regressions (renesas-devel-2022-03-07-v5.17-rc7)
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

renesas/master baseline: 282 runs, 3 regressions (renesas-devel-2022-03-07-=
v5.17-rc7)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

meson-g12b-odroid-n2 | arm64 | lab-baylibre  | gcc-10   | defconfig        =
            | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto =
            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-03-07-v5.17-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-03-07-v5.17-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      09bb57453137ffbcb765c7dbb8f431a710096d59 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6226ac5a2078c3d22dc62988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6226ac5a2078c3d22dc62=
989
        failing since 112 days (last pass: renesas-devel-2021-11-02-v5.15, =
first fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre  | gcc-10   | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62269875a320fd331fc62a06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b=
-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b=
-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62269875a320fd331fc62=
a07
        new failure (last pass: renesas-devel-2022-02-28-v5.17-rc6) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6226ae23d1fe48eb16c6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-07-v5.17-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6226ae23d1fe48eb16c62=
96b
        new failure (last pass: renesas-devel-2022-02-14-v5.17-rc4) =

 =20
