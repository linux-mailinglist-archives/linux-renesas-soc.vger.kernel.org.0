Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E220418126
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 12:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243920AbhIYK61 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 06:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244055AbhIYK61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 06:58:27 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12ADC061570
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:52 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id dw14so8783945pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tQV1kRQ20YwhnWLmHfqr2w2A3Kc59XbkN+jbNl0MHpQ=;
        b=P9qZZZBqQ2b9bgZAt+c1xrOCmn534nM30bNIz7RzN8KpF2N51iw81ljQILEOPCt76i
         6PK2sBwkXTk+/iYoKgxwxsMJjl1nLlRXkHp4dMKbgOIz7GdiNJqli3h3X1CAa4J/Hame
         3mw8yxgG8NIn+nrZyakhqVwmdKQzrrlYSJ4OZMNF+r9SroGByJE+ooR76MYb/Dta2b1F
         n9EVUITjU8REdgrDpZQgFqoOCwyuwVNk5nnDmn7n382oNXWyN10uLAIr1JpuxjalAYAV
         02WMu0xi7VnyOd9wzCql/K3QHIQ+KJfw18+mdIc3lYyxqWT0jwjg29uNH9LyX01ddhUz
         XFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tQV1kRQ20YwhnWLmHfqr2w2A3Kc59XbkN+jbNl0MHpQ=;
        b=Utf4dQ45du/QQBnbC1gJdwQUXuz0sT7H7lorUHPb+hqZ01oNUdix5nNvpwbzBeEno3
         /I1euajlIwZBUQF74XP//BobYghh10jYITqaMecPgdADcRembGslay4ZAfscShBOMr0G
         d1UEIKjQM5qIINFUAbKV5GmNOv1+Egom1KtEyKFzgt6yN3tTdpazvWSOdJ8aCrrk9S8v
         gvu6dxx+QXS2uBwviI0pFhKvTx+wSQRuM64tBP6tRMs5TXd1dPrUA8El9m4CLxgpwIPc
         GKrDlYt80fX1nGxr3VCapgKHC4RkgvpduvAoSmDO8Ry8P+dKnyANjZp33n2GKzemgYkV
         3d0g==
X-Gm-Message-State: AOAM5315dVnSymmZ5cS1u8bzLf28Sjfy8Hte+ybseP9uZHLYhH0CVUMP
        5xMGRVT2yYdHo0KvpoEGl/C4533obId27NnW
X-Google-Smtp-Source: ABdhPJzpyMXxGnAFAdTJgz1LRrt07zFKP8DlWX/P5lOyqzRYQ9n4XaZ2K4I1zlmVPuqZCHQ2ixT3UA==
X-Received: by 2002:a17:90a:d3d6:: with SMTP id d22mr7834144pjw.242.1632567412006;
        Sat, 25 Sep 2021 03:56:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r5sm10533704pjd.13.2021.09.25.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 03:56:51 -0700 (PDT)
Message-ID: <614f0073.1c69fb81.31d2.0a43@mx.google.com>
Date:   Sat, 25 Sep 2021 03:56:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-09-24-v5.15-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master sleep: 8 runs,
 19 regressions (renesas-devel-2021-09-24-v5.15-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 8 runs, 19 regressions (renesas-devel-2021-09-24-v5.1=
5-rc2)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
18         =

rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-09-24-v5.15-rc2/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-09-24-v5.15-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2c0b11dd6f8ce5c74e91b71a38505ae9088bf68c =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
18         =


  Details:     https://kernelci.org/test/plan/id/614ee407690837cff899a2df

  Results:     3 PASS, 20 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-odroid=
-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-odroid=
-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-10: https://kernelci.org/test/case/id/614ee4076908=
37cff899a2e1
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:16.021076  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:16.021658  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-freeze-9: https://kernelci.org/test/case/id/614ee40769083=
7cff899a2e2
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.994020  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.994522  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-freeze-8: https://kernelci.org/test/case/id/614ee40769083=
7cff899a2e3
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.974500  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.974950  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-freeze-7: https://kernelci.org/test/case/id/614ee40769083=
7cff899a2e4
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.950522  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.950830  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-freeze-6: https://kernelci.org/test/case/id/614ee40769083=
7cff899a2e5
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.932558  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.932814  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-freeze-5: https://kernelci.org/test/case/id/614ee40769083=
7cff899a2e6
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.915870  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.921753  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-freeze-3: https://kernelci.org/test/case/id/614ee40769083=
7cff899a2e8
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2) =


  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/614ee40769083=
7cff899a2e9
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.844651  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.845023  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-freeze-1: https://kernelci.org/test/case/id/614ee40769083=
7cff899a2ea
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.821849  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.822350  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-9: https://kernelci.org/test/case/id/614ee407690837cf=
f899a2ec
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.770547  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.771016  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-8: https://kernelci.org/test/case/id/614ee407690837cf=
f899a2ed
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.750447  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.750933  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-7: https://kernelci.org/test/case/id/614ee407690837cf=
f899a2ee
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.730510  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.730975  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-6: https://kernelci.org/test/case/id/614ee407690837cf=
f899a2ef
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.704633  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.704970  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/614ee407690837cf=
f899a2f0
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.676088  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.676671  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/614ee407690837cf=
f899a2f1
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.660354  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.660799  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/614ee407690837cf=
f899a2f2
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.640589  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.641058  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/614ee407690837cf=
f899a2f3
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.619075  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.619452  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/614ee407690837cf=
f899a2f4
        new failure (last pass: renesas-devel-2021-09-20-v5.15-rc2)

    2021-09-25T08:55:15.600086  rtcwake: assuming RTC uses UTC ...
    2021-09-25T08:55:15.600443  rtcwake: read rtc time failed: Invalid argu=
ment   =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/614ee6d7f71693746299a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/614ee6d7f71693746299a2e4
        failing since 11 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =20
