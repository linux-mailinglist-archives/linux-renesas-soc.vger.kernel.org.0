Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEAB418124
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 12:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbhIYK60 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 06:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235805AbhIYK6Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 06:58:25 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C37C061604
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:51 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id k17so11168907pff.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HexIx85fVYpdK2zVeLMFgiw4j4Eywsa+RKqdSeyCRyw=;
        b=3b2IKOFgrgMCC4kFvhfCF8sVRKdRr2hmgPPH+ollmHKQTPCvvFKOjjM+YitmAMEFJy
         599azSwDkXwGMnXbrQMpdmjmDJFd6dxfGWzsbB/dSVWTkojvEiOyM7hTl9fvNFGnDDEI
         jFiuqaM+NdzD+r+e0m2YAGOzq5sEoGEM4XpSVTcL2rLb9om6KUF3rxjakN4ycaTw9a5Q
         ogXKQ8jzZsfAAEUb1Ez2qm+qS7wlwKTsLrz+ajcvS90H3417L05qUHs1iVAf6elOYPM/
         DHz9+jAfZtRRzi5fAzYnFPA5rEE8GgMVBExItzWfCzfvqUTJK+GXuRLweU4ZQ3wEEsIp
         69zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HexIx85fVYpdK2zVeLMFgiw4j4Eywsa+RKqdSeyCRyw=;
        b=MtsYOhCAkWD7oUCfvAkWjn1lq8KJjeGKozA48ydkrwRdcmg9C6Lvjo5WSyg2Go8TAv
         j25MyG+9AQWP8o32z5JILqgCNukD7Ki6gPaCVdKfUAPSjoBc0cASxPSLZWd50cFA/k3b
         Ta+c2sjqGYvUTQVsv4zvkbr/Af+xelg7V0UD2kQcFnJRHDSl81HpSVyZHNkMxn6KRgs9
         /UDeHw+1PsZyioOGCn+/zSarLbxepvFW5F/iZTnyz7lZ9fItU07S0lw2nn8W0Alvn5Yq
         opVzKYug6ZorEib78JCsXZ9vP9nPV5UWtk8si6ZiXpAAE0mjjPEHqjIXm+vzMbKrv6BW
         1swg==
X-Gm-Message-State: AOAM531hWSKdcGaceybT5iuR5/U5JAu7Ntal68hapRe+Rxm6KG5dDOPF
        tFzpfxQ0CZMsJSJjGqbSgy/4uaqFhXl/7euE
X-Google-Smtp-Source: ABdhPJw2+nQq5xXgzHjZIByyJctNSelcjMxKVvk7W7zZY+8itGv2dYOy3HgF8jyl42uoFJAWw9N5TQ==
X-Received: by 2002:a63:b448:: with SMTP id n8mr7833731pgu.31.1632567410621;
        Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w13sm14682333pjc.29.2021.09.25.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
Message-ID: <614f0072.1c69fb81.d7557.ebcb@mx.google.com>
Date:   Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-09-24-v5.15-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2021-09-24-v5.15-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2021-=
09-24-v5.15-rc2)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-09-24-v5.15-rc2/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-09-24-v5.15-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2c0b11dd6f8ce5c74e91b71a38505ae9088bf68c

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1084c5eb74fd0daf8c9b8e83e85f5208c396579b =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/614ee9aff4b00f6d8999a2fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-gpu-panf=
rost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-gpu-panf=
rost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210913.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/614ee9aff4b00=
f6d8999a2fd
        failing since 11 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =20
