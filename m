Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 540D855163B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jun 2022 12:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240264AbiFTKs7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jun 2022 06:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240153AbiFTKsz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 06:48:55 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0A4B1F2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:54 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id f8so9380094plo.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1EP9zU2CMp72DCAojd2wN+dIHgB+eaLhdWU4xSahf38=;
        b=WG5irN1WeO6tffu4CjawhvAsxonFzAwMonKtT7Lfqyot7oHofNcOE8L9FhhRmKZZJW
         XjPKuC13u9CU6+a02DhN839LayixsgmrHpsN4IFF/x1iPOaFoH6Eqts75D+IBhqQuAJM
         k7l7zB2ZPJT2yE53sZpJNmxeXF30ZN3Nk8AtT62Jtg5/hq7Ih/wOVDQu3Rs6xjqUjXdz
         BhtS9rsHBO9mLcB5WApgRxru3LqdaERQi6yM7rSt8PNgF25F615Jr/OhaElV/Lxtpayy
         5Ms4Z6a6jCJa3r/Q3USo9r2l7GYZtVJPvHVTWhuMWxAPBSv1VCPcyFQharJA+OlOUtez
         28FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1EP9zU2CMp72DCAojd2wN+dIHgB+eaLhdWU4xSahf38=;
        b=IrgHhjlMEvODGFIC5/JAuU2P06w5nkL1rSIOvi6Jxl0vw7WvVfhB8kLseNJ+qlROh0
         3m/oVMIiZpTgy99LB+EWH9Dzav0XKPunyxALgt4KnqNkuKbYWLx4nHy0hQAappDHzitc
         gvSgbJq89aK+mNw3KMZGG03at8EwOVP+2/aU6E+0A+PY/Wer9Q50iWP0GJxliLGLfJz9
         IhuNgOgtotrKLJyJNhKb7Z5JhpbuDavJJF8KpiLfnFr0yzpcaHMbUG5QAl5JMyCCtrp4
         mZMZL8QTjNsnbT922iNt6nc4Zn9KMatWEtQJI6ZY6t5noD136roQz3KXiI8sJxG77dXu
         MiIw==
X-Gm-Message-State: AJIora9ZmbGV9ce0TXXo5RRAI6XOd4nhXgD5DQN3cbgXTLLHkPdg9hPd
        /U9wXX52+42mgf+dDBbGIX+WKsV/mWLYcijMzkk=
X-Google-Smtp-Source: AGRyM1vTXHRpqOe4OLB9r7pjOyf2ZEbMvV4THSTBpcozFoMn1Dc7mp9ZlT29bTXhl1qHFa5EjvewzQ==
X-Received: by 2002:a17:90a:2d82:b0:1eb:6ee0:9d68 with SMTP id p2-20020a17090a2d8200b001eb6ee09d68mr22040755pjd.28.1655722133877;
        Mon, 20 Jun 2022 03:48:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902d89000b001616b71e5e3sm8368602plz.171.2022.06.20.03.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 03:48:53 -0700 (PDT)
Message-ID: <62b05095.1c69fb81.c602d.bb17@mx.google.com>
Date:   Mon, 20 Jun 2022 03:48:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-20-v5.19-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 2 runs,
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

renesas/master igt-gpu-panfrost: 2 runs, 2 regressions (renesas-devel-2022-=
06-20-v5.19-rc3)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-20-v5.19-rc3/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-20-v5.19-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ebde835d00b25f6852cef819b7b8c96e07c709b5

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f83ad09dc04c9f918ee8836bac9d88dac5de6745
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  0189ca288f7188e60f5eda356b190040bf8ec704 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62b04bf2180d4c198aa39be7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220610.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/62b04bf2180d4=
c198aa39be8
        failing since 13 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62b03f7a3d29062d8fa39be1

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220610.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/62b03f7a3d29062d8fa39be4
        new failure (last pass: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-20T09:35:35.705712  <8>[   41.320703] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-06-20T09:35:35.728405  IGT-Version: 1.26-g0189ca2 (aarch64) (Linux=
: 5.19.0-rc3 aarch64)<6>[   41.347421] Console: switching to colour dummy d=
evice 80x25
    2022-06-20T09:35:35.733544  <14>[   41.347510] [IGT] panfrost_submit: e=
xecuting
    2022-06-20T09:35:35.741829  <14>[   41.359328] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-06-20T09:35:35.742334  =

    2022-06-20T09:35:35.746139  Starting subtest: pan-unhandled-pagefault
    2022-06-20T09:35:35.843921  (panfrost_submit:349) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178:
    2022-06-20T09:35:35.857071  (panfrost_submit:349) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-06-20T09:35:35.858437  Stack trace:
    2022-06-20T09:35:35.863430    #0 ../lib/igt_core.c:1819 __igt_fail_asse=
rt() =

    ... (10 line(s) more)  =

 =20
