Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084BE55163A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jun 2022 12:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240321AbiFTKs5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jun 2022 06:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239006AbiFTKsz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 06:48:55 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378A363A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:54 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id x1-20020a17090abc8100b001ec7f8a51f5so6377023pjr.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pfztnla6QFH9zEyJ37f/WprLdC9c2x1cvT/BfCVrom4=;
        b=BT+Po+XHFPNLr8GWW8DGCzasnte446t6KbCEBICBuXgmXWf8d1rdyemO7oCryP2pjQ
         avPao7xRwxhZGaQ9Xw7YCrJV+X33DfeOanbm0j35koZU8UIruXn8x/wE1T252nzNGzhM
         IPPQS5dSXXcDhes5XBJbjV9Q1F3WZjv3kvkHw7D2QCkvTKDAovzOCjDPt67OjLXVM2rm
         iKkatdLs7ejxJPjeelWSDrXP0Cq+UtZHOep/EL++bGkap9Gec77qk41IRlFVDU7iPCL/
         IP500561jBzIXMLVluGPvNGBqP46BtPJ6F1vK0x9QWP/PSe95LqaDpBgjO5MhgCnwEzh
         WLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pfztnla6QFH9zEyJ37f/WprLdC9c2x1cvT/BfCVrom4=;
        b=ABRLhqQhfK8eGWSLZcWYgE8xPhz6RkRuSZ2WSbH7TKEmkGqyk/JX+sy02QLmh7kCMJ
         4Oc/I+mynZjzB6NECzntJ+oLHN0ibI35H0h3OopElCKAfIh3neL376VVoklA19g5JTdq
         NYBFkjXIr+qKXbCQaQyw46aWfihF043ZV1iyy/48vvTF4ltW5EGj2aHIaD29YSdAMqxH
         URZa99LC6pbR+UENrOLKE9JXocGf6oqSUYGPv7FWUD/4CYYBvbVfB5hpRWTOZu8s3RNl
         faV2r1aGtAFpCvjnEnY35TqzjG3yFDVTfNZ5OZCZ31b5VLYmL+QH9PRaO/2LwqqtwU0R
         soWA==
X-Gm-Message-State: AJIora/xElmb9m/BApm2uRWUOcT7TwALQz5njBtxPr5EVmQP+NiNgm54
        +mPh2v77nrFucWQat/35JtGQhovdGBIaON7TFgs=
X-Google-Smtp-Source: AGRyM1utSPkRh4n4CORZ5UtF6FTlPUqfOACqld8OZO1xFhzgrlyLzlhOheju1ClBQNnVeOqYMYwOPA==
X-Received: by 2002:a17:90b:1e0e:b0:1ec:b2a6:c9d0 with SMTP id pg14-20020a17090b1e0e00b001ecb2a6c9d0mr2684240pjb.230.1655722133654;
        Mon, 20 Jun 2022 03:48:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h4-20020a62de04000000b0051bb61c0eacsm380305pfg.20.2022.06.20.03.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 03:48:53 -0700 (PDT)
Message-ID: <62b05095.1c69fb81.4fdb9.060d@mx.google.com>
Date:   Mon, 20 Jun 2022 03:48:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-20-v5.19-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 10 runs,
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

renesas/master cros-ec: 10 runs, 2 regressions (renesas-devel-2022-06-20-v5=
.19-rc3)

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
sas-devel-2022-06-20-v5.19-rc3/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-20-v5.19-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ebde835d00b25f6852cef819b7b8c96e07c709b5

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62b04a855efb14cecba39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-rk3=
288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-rk3=
288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220610.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62b04a855efb14cecba39b=
f0
        failing since 13 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62b046e5a67db929d1a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-teg=
ra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-teg=
ra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220610.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62b046e5a67db929d1a39b=
df
        failing since 27 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
