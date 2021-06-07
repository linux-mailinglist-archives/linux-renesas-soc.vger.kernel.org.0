Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF4739DD3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 15:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhFGNCU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 09:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbhFGNCT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 09:02:19 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08809C061787
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 06:00:13 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so10395107pjq.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZRB0TzIQ5kQsNISvpBj5zfoz8biQH62L0XMu8qcX9H0=;
        b=lfVKxBnRpbIu8DkdG/ANV3W5zwO34FzHs9LAWMmB+HzNN7pAuHfalYuHdILDQJuVVr
         NrG2OdQZnSAugD0SwgCTj0xZVrUejOGAxYVQHWWVooOs1F1LIXDp41vZRo3o46QmFJdz
         2VI0zyzczvn6wA/t2lzXiQGXBeavniwi0KhXCAC7YfrAL8X6Dk1R4R41F8WOVK5T8Csa
         J/7vWgPatKO5oYDuwTyGDzHG0geIBgb0QPrSRbKCsT4rNhUhiI4VGviS157gJXus2FzI
         nQ1ZldZhyd9mSvbuohuOe0WmPZb0ZXACwGPFVLIKhHbh6gI0b4yYFFszHPql5q0rRgrR
         d2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZRB0TzIQ5kQsNISvpBj5zfoz8biQH62L0XMu8qcX9H0=;
        b=kUtdFydkQIhzZkT49kTXcif/z1jKWo3zlyeAPd6d4H0Y90egwnVnllHlp+wYIYxOBq
         ri3bA8gBwKzaJLJM+x7lF+6QkcOX6nSQTwSUgGpB/QyWFYGHytVFgEafMZawTj+9T9QB
         yFdiYtyUOl7uoIMbk8zl3fEsyGDtAbZ63EoMkcxLxKKvv1s9h3NLKAUuKzv9VoOvrI93
         ER4ULNxquz55kCUN7FZgA7OSAjFdT1qEMYuRZAZDQARiSiGNx1cfApY94Tw+bjk+9Mpr
         O/YkRcgEkzFDJ32DiDNibxzyTD1UxQn4ffJMTPmQpkOLqKPOsfleGmAevm3Mkkx5Sxt7
         I0OQ==
X-Gm-Message-State: AOAM531CQlACXvEfTHmBJVmI/FFn5D6mZvAZlZQkG4redHeEK2u1klpd
        xiPfqfhTwle01dXTkCGBRHuj3zZOp9fYaUuy
X-Google-Smtp-Source: ABdhPJwIWjslRiaDIwh4pu1FgmagLQHOla0E52Qtxdq0+ELUsTkma+44t9LDSzlP7YLTisuCTAbBKw==
X-Received: by 2002:a17:90b:1805:: with SMTP id lw5mr10767277pjb.120.1623070812327;
        Mon, 07 Jun 2021 06:00:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 1sm8728166pjm.8.2021.06.07.06.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 06:00:11 -0700 (PDT)
Message-ID: <60be185b.1c69fb81.aba75.93eb@mx.google.com>
Date:   Mon, 07 Jun 2021 06:00:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-07-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 5 runs,
 1 regressions (renesas-devel-2021-06-07-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 5 runs, 1 regressions (renesas-devel-2021-06-07-v5.13-r=
c5)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-07-v5.13-rc5/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-07-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0dc27258c7ad2021418a2aa43fb14a9dda2dd46d =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60be0268f2311886210c0e15

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60be0268f23118862=
10c0e18
        failing since 6 days (last pass: renesas-devel-2021-05-27-v5.13-rc3=
, first fail: renesas-devel-2021-05-31-v5.13-rc4)

    2021-06-07 11:21:28.792000+00:00  + lsusb
    2021-06-07 11:21:28.792000+00:00  + awk {print $6}
    2021-06-07 11:21:28.792000+00:00  + sort
    2021-06-07 11:21:28.792000+00:00  + seq 1 3
    2021-06-07 11:21:28.792000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-06-07 11:21:28.793000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-06-07 11:21:28.793000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Mon Jun  7 11:21:31 2021
    2021-06-07 11:21:28.851000+00:00  <6>[   13.363575] PM: suspend entry (=
s2idle)
    2021-06-07 11:21:28.851000+00:00  <6>[   13.368251] Filesystems sync: 0=
.000 seconds
    2021-06-07 11:21:28.851000+00:00  <6>[   13.375019] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (148 line(s) more)  =

 =20
