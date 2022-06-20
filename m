Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB8E355163D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jun 2022 12:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240411AbiFTKtC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jun 2022 06:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240600AbiFTKs5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 06:48:57 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E6263A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:56 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x4so3542266pfq.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 03:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5WRgWMWSG5uH20cht42Vgja+kpp44tTwXxK0cXwBEQ4=;
        b=JLG7dEHqMoP0REn8cixcHREI5EFrDG5oYLYQhxbLMJdaGkPHJLyrhl6xanqfOEy1Cv
         /60N8hcnjSajIl8Hk4XBfE5/X1lVRJHhFrwV8nNvYDQDp6v0DuHuExh6m1bS33yCLFSU
         55Lp67+K0jTpElySXLQzMC4dd9ZMJ+KDYMY6/iVQE7+2Q/nrqEcRTyYC88Mbtj4IBv/c
         s5ylpHKpFO6i44U9prPf2WvyZxldLhRzaWpyvNR5erGvU8q2iExQWATYJDJICUsxGdwj
         72BbyxJA9rrSfxlgwIIl5aMSgTjRzK+jTQOsXyzK8BkqRQ/uowHwZlnK8lwe+v+tW4y7
         SpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5WRgWMWSG5uH20cht42Vgja+kpp44tTwXxK0cXwBEQ4=;
        b=a0E+FiwtsMbyDSqr2WAX886OU1x/n4bda92tZhGXqDvy0F0+v6g87mW5pOjKWmB5cX
         TR2abYXMvONgsUz2f/HzoFfjCY5soqG96v4d84/XQM7eJiUas+TAERjUaRBz8g0bN+4B
         2uDyA51Mfl4NVMp6y/yz9KNLVJLx3SQLpUVmXz/30pO0kV92NFZ+zKvoUMEqVrZsoAVy
         mjuXzOO7znVrTa9Fe+/r6FWWgJBpstkdPLJwRqEKV1j53sPdbceUF8ktfDvkb9KXfSe3
         2700g22uGRtThXRb0D/frzAFE1mVNs8CN2D1M8R9qlYWFXoHPyFz1t9wBzV9kISA9CK6
         T/JQ==
X-Gm-Message-State: AJIora+rigpY8sDoJnLqR+zpnPIdqzR5jGxxq9ArB8+t3diwtHuvp92t
        7HDy223+TNeHpkx8CktYzf927I91U6+6+/2KhRw=
X-Google-Smtp-Source: AGRyM1uJ/0EsieSjbcfv5dDcs7x5MsL9lIyPWmRsVHP6J5Os8cKUBlZpBiYqVy8md8WGSs7mWNnZGg==
X-Received: by 2002:a05:6a00:1496:b0:525:24b0:8243 with SMTP id v22-20020a056a00149600b0052524b08243mr4155625pfu.84.1655722135492;
        Mon, 20 Jun 2022 03:48:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e13-20020a17090301cd00b0015e8d4eb1d2sm8519128plh.28.2022.06.20.03.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 03:48:55 -0700 (PDT)
Message-ID: <62b05097.1c69fb81.f452b.c052@mx.google.com>
Date:   Mon, 20 Jun 2022 03:48:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-20-v5.19-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 9 runs,
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

renesas/master sleep: 9 runs, 2 regressions (renesas-devel-2022-06-20-v5.19=
-rc3)

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
sas-devel-2022-06-20-v5.19-rc3/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-20-v5.19-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ebde835d00b25f6852cef819b7b8c96e07c709b5 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62b04c026f29c79a4ba39be9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62b04c026f29c79a4ba39bea
        failing since 13 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62b04430b34def392ea39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra=
124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra=
124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62b04430b34def392ea39bdc
        failing since 27 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
