Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C82253EEC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jun 2022 21:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiFFTlC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jun 2022 15:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbiFFTlA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 15:41:00 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA3DB0D1D
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 12:40:59 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id w13-20020a17090a780d00b001e8961b355dso1545552pjk.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jun 2022 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xHuWJ/rX2lggRISBO1l0/Z8vZPMATApQiwdDo8HcPpw=;
        b=ErBKzjU56J5PUPxrgeVQTZBNi85xdOafa+XK8+OTcAJ1K/O4dJqcXa1dUz5hFNGTgi
         7TJlXpugueHPfpN0hX9Xz8zC1VhLmwrb7I8MSDGPnXY5JtC+PW4VxfFqYt/dMb8+5OQB
         X7CQBV6m36CFjyx6LwNf+M/5XYufJZs4DF++Fj5XzNLl/e3C2//VCrIcJzs79dAg20IE
         wjPN/5cq81FM8Q+zHr05QCjcRttDFcrfmHhFVEsPxQqwzhyBdIdOb2hCjGfr/MBcGpJn
         NZFDbI6XJEYZ9Fs+7QunbrvEAFoU1vIJAjdlvIH/bNLZg4tpo/lJNQ03oSS9xAjoH6Yr
         Bfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xHuWJ/rX2lggRISBO1l0/Z8vZPMATApQiwdDo8HcPpw=;
        b=iWEtev3DItU4y8yGXwP/hUXWc2VxM1HHUwxCZaIGAcPTOW62Qa9OMiNGkwk2/ou5dh
         w48mKT6FQg8yis9h/n1RzVqAcMBPR+90+EXwwjDXU1bsH6CQiALPYh0LKeQw/50Fmh6S
         28/5Kf9MFJPlnnOBBY/QpPFdO8SOtjzjbq8WL2XN6u/J0iSMc2RvHNAd7G6StgPs0DB/
         F/5howiEMrI39bvpoPIsT9+g2a9vHMt2DUHvpXHQnc5vkuY5rKWHkuC1oKNMwGq9ahpv
         BpWxWjNXd3kfjNAmG9pXoUexg1UqKMfm6d73b7ZaTyOH0sCBmoRp0Kb69MG87itkLmwH
         gOUQ==
X-Gm-Message-State: AOAM532qiOv0zyjS7InRPQnLIH9IoWsQ28PHQuBzDSQW72RQ9xnUkynm
        TnB6VQktCF7kXwGQz9kCJO9Bea3FhH1RWEmv
X-Google-Smtp-Source: ABdhPJwcMDZzirLstJKwJQBbGa8XYOr+ucANqJe6MADhiqY+tiYprKwax4/y0UQP+PQNE18xH/T53w==
X-Received: by 2002:a17:902:cec5:b0:166:3418:5260 with SMTP id d5-20020a170902cec500b0016634185260mr25593561plg.129.1654544458594;
        Mon, 06 Jun 2022 12:40:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h17-20020a62b411000000b004fa743ba3f9sm11107171pfn.2.2022.06.06.12.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:40:56 -0700 (PDT)
Message-ID: <629e5848.1c69fb81.91c35.8ec2@mx.google.com>
Date:   Mon, 06 Jun 2022 12:40:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-06-v5.19-rc1
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 9 runs,
 3 regressions (renesas-devel-2022-06-06-v5.19-rc1)
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

renesas/master sleep: 9 runs, 3 regressions (renesas-devel-2022-06-06-v5.19=
-rc1)

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

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-06-v5.19-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-06-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      997b2d66ff4e40ef6a5acf76452e8c21104416f7 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/629e50534a2462ccdaa39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/629e50534a2462ccdaa39be5
        new failure (last pass: renesas-devel-2022-05-23-v5.18) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/629e4429a5083db59aa39c1d

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/arm64/rootfs.cpio.gz =



  * sleep.rtc-exist: https://kernelci.org/test/case/id/629e4429a5083db59aa3=
9c1f
        new failure (last pass: renesas-devel-2022-05-23-v5.18)

    2022-06-06T18:14:59.078243  / # <
    2022-06-06T18:14:59.078652  6>[   42.293949] input: hid-over-i2c 2D1F:0=
163 Stylus as /devices/platform/ff120000.i2c/i2c-2/2-0009/0018:2D1F:0163.00=
01/input/input4
    2022-06-06T18:14:59.078747  <6>[   42.295062] input: hid-over-i2c 2D1F:=
0163 as /devices/platform/ff120000.i2c/i2c-2/2-0009/0018:2D1F:0163.0001/inp=
ut/input5
    2022-06-06T18:14:59.078826  <6>[   42.297183] hid-generic 0018:2D1F:016=
3.0001: input: I2C HID v1.00 Device [hid-over-i2c 2D1F:0163] on 2-0009
    2022-06-06T18:14:59.078896  <6>[   42.298573] atmel_mxt_ts 5-004a: Touc=
hscreen size X1920Y1080
    2022-06-06T18:14:59.080092  <6>[   42.298807] input: Atmel maXTouch Tou=
chpad as /devices/platform/ff140000.i2c/i2c-5/5-004a/input/input7
    2022-06-06T18:14:59.085065  <6>[   42.524343] cpu cpu0: EM: created per=
f domain
    2022-06-06T18:14:59.085668  =

    2022-06-06T18:14:59.091009  <6>[   42.541160] cpu cpu4: EM: created per=
f domain
    2022-06-06T18:14:59.097032  <6>[   42.561154] panfrost ff9a0000.gpu: cl=
ock rate =3D 500000000 =

    ... (32 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/629e48bd82080dafb8a39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra=
124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra=
124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220603.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/629e48bd82080dafb8a39be9
        failing since 14 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
