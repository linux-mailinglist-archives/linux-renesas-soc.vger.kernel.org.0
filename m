Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D335F43FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Oct 2022 15:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiJDNNq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Oct 2022 09:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiJDNNp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2022 09:13:45 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9C02CC86
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 06:13:40 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q9so12670593pgq.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Oct 2022 06:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=iGF2VOxsLaopU8bnrPWeUbfmT5WZk0MYWakEZcbQrfE=;
        b=nP55vZERYQC+U5kf8JXogquk0jYadxZJ9qtUhfOjWcrFIQEPqEOA08730qnnUOS/Hg
         +xTikCquDSBqeb8IekgG0CEvr0gIEhCmC53Z0nMMea0DWhY63eIBu4vCBwQP9xD1FCRV
         i8TgCyjNDqtC5MO+ApVUlpY/yk8Hb2K8BfVqTLqyXLwPjVSrhEaQTcKNH+fhWRfHF1dQ
         3XVVwjxQ5IZBP6V2VWvGWNSH5AmIt3jFEWFicLrr2lGxwtu3ag9IrfdW6A2XOBMAVczc
         rTr/35ZqFoPBgbStED81USfX1jnfZH3BcG2AvqDTmzCYNPIgjME/YQ+zgHSc+bGSZz7z
         zKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=iGF2VOxsLaopU8bnrPWeUbfmT5WZk0MYWakEZcbQrfE=;
        b=dXvW9jiKatXpK5HJM9tJ4/G1U3Bgbe29pjj8DVMieoNsfCkK9i+M7kzdrWmp0lB/dU
         zn8WIurHmgHJ+CLgcPiJZnOKWFAAmD8eZnAzdC0zEJK0ZLSF8yovh9M37Af4TBJ4M+ny
         upH0jok06TUhUBRatYP7BMUpZ08cpdm6pk98jrBOX797Hc5QjcaLrDkea5XAjbvFJmDg
         2+3Gbep3hHX7+ggEqmlpVfGPDWKzKgYyRFCOCZdjMfwnGos9QP0HhCVytFI5qsfYUqWr
         rf8syVJ8WIaFYnGtIzQ/kalbccQfzo3fifmCdfra1h0VapsnkbVyyon4yotHyIUshZdb
         6x3Q==
X-Gm-Message-State: ACrzQf04Ny/NetfqXrnREm267jQ88CNtpYbbmMa+HgbDUwHmD1G576Qy
        qgcrVU6rIV6D1BAiwq7VJNHmTXo70pKgPTFkNN8=
X-Google-Smtp-Source: AMsMyM4hQUAeEUYT/sisAYc2/D+FoCySq5jQqWawB/vciBXE3PDaDhEhEtwr60mItBaMNkg7LvYISw==
X-Received: by 2002:a63:8548:0:b0:454:92b9:9379 with SMTP id u69-20020a638548000000b0045492b99379mr3590596pgd.579.1664889220267;
        Tue, 04 Oct 2022 06:13:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902d4c800b00178bd916c64sm8943242plg.265.2022.10.04.06.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:13:39 -0700 (PDT)
Message-ID: <633c3183.170a0220.4ee4.f72f@mx.google.com>
Date:   Tue, 04 Oct 2022 06:13:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-10-04-v6.0
X-Kernelci-Report-Type: test
Subject: renesas/master cros-ec: 6 runs,
 2 regressions (renesas-devel-2022-10-04-v6.0)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 6 runs, 2 regressions (renesas-devel-2022-10-04-v6.=
0)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-04-v6.0/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-04-v6.0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a341ff11c47c3b9175e02fd34c584a0c19c12e0b

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


  Details:     https://kernelci.org/test/plan/id/633c1fcafb0a944d7dcab64b

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-04-v6.0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220923.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
3c1fcafb0a944d7dcab65c
        failing since 49 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
33c1fcafb0a944d7dcab65e
        failing since 49 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-10-04T11:57:43.824922  / # =

    2022-10-04T11:57:43.829252  =

    2022-10-04T11:57:43.930855  / # #
    2022-10-04T11:57:43.935735  #
    2022-10-04T11:57:44.036748  / # export SHELL=3D/bin/sh
    2022-10-04T11:57:44.041673  export SHELL=3D/bin/sh
    2022-10-04T11:57:44.142595  / # . /lava-7493435/environment
    2022-10-04T11:57:44.147206  . /lava-7493435/environment
    2022-10-04T11:57:44.248221  / # /lava-7493435/bin/lava-test-runner /lav=
a-7493435/0
    2022-10-04T11:57:44.253646  /lava-7493435/bin/lava-test-runner /lava-74=
93435/0 =

    ... (7 line(s) more)  =

 =20
