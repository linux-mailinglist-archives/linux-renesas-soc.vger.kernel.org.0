Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1767447AAB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 14:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbhLTN4D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 08:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhLTN4C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 08:56:02 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0693C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 05:56:02 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id n16so7434453plc.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 05:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bSv1sBn7UwgH8wiqq2N3nMRC+eu1Ml55fK79APkgBlw=;
        b=WUPkYfWFJg9J4/oy0jHtr9kxC1LsGvWZxgAlRizN4QULqBuVrOVLVQWJMosdm6x7Ll
         aFEx/JCOyQ3ncINlC5ra+kYEpljEoIqS6QQs4hAAhTa2jQ6tvnVM6xkf+nOCwzJ7hjLT
         86ZMQVAqjCRXKaARjnoGbbO/rreqAPH4goPxN3qsB/y5HcJ6nmKc1voFOQREJjAk+HLw
         FyCFStTPlo/uz+BhxIhS5gFtUksAHXCowoMhFLD+zMlzujj42RHZWrjhlQdb2E/o7+eY
         v3lIqB897UyqA7wLBJ7trHo1UZHUTAZAb97cdPlKUE1VpCLAe1YC/MGFukbgHbi3+/pk
         ZQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bSv1sBn7UwgH8wiqq2N3nMRC+eu1Ml55fK79APkgBlw=;
        b=HwkMYa3K5EQ1avR8UmPFflaXT+oja3PLFJ10i1ZQKI30qLpofW/MoD4ZGx6rFnx2ZU
         okXtilCadvAasjoXTM+P0JG5v5PTy57LYAKr7CmpFO9p8q/x0dvEt2qwUVi/ILwFtoFg
         wQejta9SywESpaMbJ2ZmSZh37r40sBWmgxue4QISSwjCvQdEQ8A+u2EvFP+LoSHmSU/0
         9ab/EaBnxzm62VNirUTBusZAbo2Ackll9gEA06Wec0dclvz/aK/6UkorUq2XtylRKeBX
         /q2hslv68D9tQSUnxhWBbZd6S6/LEOfI9VUL6bJUEetUHUDHaTQj4saA1x80lmZ9p9C5
         XZvg==
X-Gm-Message-State: AOAM533MHKU3z6IEAjIGtVycqbU5zolL8QORsafUu7ZmGRWPzjkfmRvZ
        qsYvTTiS/QS7+GxO++9bpGGNrRCobwhu8t98
X-Google-Smtp-Source: ABdhPJyFu2J6CFGLRAzFU2Rac4svVL7rfRyLncOOzbwASM757dnpk6GGCu/TWJ4pmu+IhL1yXv5Icg==
X-Received: by 2002:a17:90a:9603:: with SMTP id v3mr11947161pjo.203.1640008561981;
        Mon, 20 Dec 2021 05:56:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z2sm19848930pfh.188.2021.12.20.05.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 05:56:01 -0800 (PST)
Message-ID: <61c08b71.1c69fb81.5ceee.5bc4@mx.google.com>
Date:   Mon, 20 Dec 2021 05:56:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-20-v5.16-rc6
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 55 runs,
 2 regressions (renesas-devel-2021-12-20-v5.16-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 55 runs, 2 regressions (renesas-devel-2021-12-=
20-v5.16-rc6)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+ima     =
           | 1          =

rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-20-v5.16-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-20-v5.16-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8398a361cd075d8ec3e1d68b246a67148a1486d1 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+ima     =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c053dade636a4e5a39722a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61c053dade636a4e5=
a39722b
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c057cff8e81f231d39713a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-co=
llabora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-20-v5.16-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-co=
llabora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61c057cff8e81f231=
d39713b
        new failure (last pass: renesas-devel-2021-12-17-v5.16-rc5) =

 =20
