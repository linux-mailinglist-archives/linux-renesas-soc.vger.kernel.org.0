Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7257960A722
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 14:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbiJXMsD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 08:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234964AbiJXMqM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 08:46:12 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A83857D4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:10:33 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id jo13so4661997plb.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7W/Hh7zE7QWlpAYFZcAjW9MfJ3wpYv7P20Q38rYmnxQ=;
        b=bhJX4rqwZeQbfeGhXm4HRXmTvMVYSOb3B+Kk3n/eRYvAjNDMxX1o1d2YaizU3BPfYz
         tcDEDz4PhwZFEFLCnd7SucqObC16HJ/EHNzMZPj/JLnERHfX/5weyIRIOno2okxgRJHY
         gojJCoG8GBqWSnfKVQ9yGywMnsaguQeaccou/CL85hZp1+KgjukK82yWHCPPJQrxz6Qa
         VS6P+N7vVCVOIJCBHW8E6QQ5jbcf+Wp2TcoEecj6qAkS22rf1qOa7xQp9M10SuFFzLtk
         7LJ5sKTkh46HhE4UOA6pwfdfDckFT3IQDymGGodFvvXOl7geJq0sAag1CHXE/3KbLIHa
         58Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7W/Hh7zE7QWlpAYFZcAjW9MfJ3wpYv7P20Q38rYmnxQ=;
        b=5iMUVifWVz0ADqB52qIfDxd6WfbB4nxeDAK8JO6OE8AK8B+4/Te0oabNUoLczFIKVG
         eEZXp8ej8uzI8X459X33tdSRNAY05a6jnFYWembliKfxboDwDL7gSx49dvGcsJNB0aWy
         zP5zewZ0KPzKec7EOa63Wcd68Y6WYbxGItSinkJla6kszSXukvSkbdENmZnRGDtuKFQ9
         t6WLhZS/z4zKPW9Px2RZ83/oTP9i0QtEsjuVqKfCY2QjFaxOmajB/fcJZVg7Sf8lgJxj
         L2EkMBy/Dx1fCGUpu3rYe8Q8j9jZCRhJuuay8ORDFkkJhKpLyMZ0fv+FIfGuryZCLsIT
         Pb5g==
X-Gm-Message-State: ACrzQf3SbSslQsFmIXZ5AxZn5Q5qeid3VKAF7V0jmWoMB58oMcDrg0ft
        xTZQPp+hZHDz+QGkTNwklx657WLoWsJXskGx
X-Google-Smtp-Source: AMsMyM6FC3jqfHjtl1yoywXkZ6dSyipGH4oJGx13orlAZ2r92jBMONoMG/bexTpnv2jzsZ2hzJYIPw==
X-Received: by 2002:a17:902:e804:b0:186:5736:2b70 with SMTP id u4-20020a170902e80400b0018657362b70mr27252421plg.127.1666613335892;
        Mon, 24 Oct 2022 05:08:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090a4d0100b0020dda7efe61sm4051357pjg.5.2022.10.24.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 05:08:55 -0700 (PDT)
Message-ID: <63568057.170a0220.5ee3a.6f09@mx.google.com>
Date:   Mon, 24 Oct 2022 05:08:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-10-24-v6.1-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 8 runs,
 4 regressions (renesas-devel-2022-10-24-v6.1-rc2)
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

renesas/master cros-ec: 8 runs, 4 regressions (renesas-devel-2022-10-24-v6.=
1-rc2)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-24-v6.1-rc2/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-24-v6.1-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      547a476a7857aadfcaa264982527697926c55d6a

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63566a79d88e444ac15e5b6d

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
566a79d88e444ac15e5b7e
        failing since 69 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3566a79d88e444ac15e5b80
        failing since 69 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-10-24T10:35:20.045425  / # =

    2022-10-24T10:35:20.050245  =

    2022-10-24T10:35:20.152048  / # #
    2022-10-24T10:35:20.157429  #
    2022-10-24T10:35:20.258500  / # export SHELL=3D/bin/sh
    2022-10-24T10:35:20.263230  export SHELL=3D/bin/sh
    2022-10-24T10:35:20.364254  / # . /lava-7695032/environment
    2022-10-24T10:35:20.369435  . /lava-7695032/environment
    2022-10-24T10:35:20.470447  / # /lava-7695032/bin/lava-test-runner /lav=
a-7695032/0
    2022-10-24T10:35:20.475369  /lava-7695032/bin/lava-test-runner /lava-76=
95032/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63566bebdfbd7d561f5e5ba8

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221007.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
566bebdfbd7d561f5e5bb9
        failing since 69 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
3566bebdfbd7d561f5e5bbb
        failing since 69 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-10-24T10:41:33.403987  / # =

    2022-10-24T10:41:33.407030  =

    2022-10-24T10:41:33.515602  / # #
    2022-10-24T10:41:33.519185  #
    2022-10-24T10:41:33.625122  / # export SHELL=3D/bin/sh
    2022-10-24T10:41:33.628621  export SHELL=3D/bin/sh
    2022-10-24T10:41:33.731683  / # . /lava-7695195/environment
    2022-10-24T10:41:33.735205  . /lava-7695195/environment
    2022-10-24T10:41:33.838768  / # /lava-7695195/bin/lava-test-runner /lav=
a-7695195/0
    2022-10-24T10:41:33.843038  /lava-7695195/bin/lava-test-runner /lava-76=
95195/0 =

    ... (8 line(s) more)  =

 =20
