Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBE3614ADE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 13:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbiKAMjX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 08:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbiKAMjN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 08:39:13 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC4A5FA4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 05:39:12 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id p3so13430550pld.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nq3zY2rl2buBmUBrzR1sHaB2m+yNU5obepMU2CBxZJg=;
        b=3/l+dEtGyU21xr6RUeqgqyvgdvnGqt8/F86OjObpnEGvifBE5z5wVdRbmtbuc1Pq5j
         /FUsNPKFqzPpmGta4EIQ0FNdwZ+lg+b2mHGlGbB2sazZI07ricLfTEFRJLnAooo7B25S
         EG6WA4WzjnaxAhAZQTRehplzxFLf9h25hYCV2lsi39TXUHN+9mgx6kajOuEi9G/8+5B2
         lH7hwH0x6WOwfq5IaYF6NLgsFqk56d++vqD0xbncL/imL+F4Z2wxVnsswEm/voNdUq0J
         ZIdwnShLsn7Kb59HaOdzF6GM7zOKYP+kBiCEYEIMOd5FRtQiXg3Ay0dYQGFhcVmhjStC
         QK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nq3zY2rl2buBmUBrzR1sHaB2m+yNU5obepMU2CBxZJg=;
        b=ZGsbPygu+uoYpUCiqfRRRy6BC+mAxr9IqO2H9NLNO6yN85sChn2uyVTrm36XuNkE5j
         hSC9xcQdNYDsR3ZU3QeK5+S9p3VFtm2TPFsaG4NKQpy4diTzbCQpak4e71ll3ku21l29
         X5rRfX1hZRrSkgHrkS4x4y/kHU10NxQ9KvR5SS77H1g/+LRFPDrFXDPeWLo165r3H6p9
         bG8+0D+768eGDbY4LEAgYVz5wfebaUPaxk5vtvBIroLNtBmgH7hzvsZXtgGraV3mBb+X
         djReoKZyPEUSCPrRRt5Yvf/CG/x2dKG2aIKPmFV6vXqrHG0uxRxEFFl6JkVVLSvViPIy
         Cckg==
X-Gm-Message-State: ACrzQf0N64x+nbZ5lUVjfHtMBWPYxSzxmaBu8MqkYZZnb3JHdbbY4KE2
        KVJ2V9+EOCdpe3lrwYhuQMpQ2mIm6YUfRQO9
X-Google-Smtp-Source: AMsMyM7H809KsyqFL4hwVUlEkRssSkPN4N19Y4M4c9MN5JlcI1lnS6UzFpcUwVn8CLkTxRS2/7NQmQ==
X-Received: by 2002:a17:90b:2305:b0:213:7a2f:aed8 with SMTP id mt5-20020a17090b230500b002137a2faed8mr20391832pjb.129.1667306351369;
        Tue, 01 Nov 2022 05:39:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c8-20020a631c08000000b0046ff6b380f8sm883184pgc.68.2022.11.01.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:39:10 -0700 (PDT)
Message-ID: <6361136e.630a0220.51683.134d@mx.google.com>
Date:   Tue, 01 Nov 2022 05:39:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-01-v6.1-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 9 runs,
 5 regressions (renesas-devel-2022-11-01-v6.1-rc3)
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

renesas/master cros-ec: 9 runs, 5 regressions (renesas-devel-2022-11-01-v6.=
1-rc3)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-01-v6.1-rc3/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-01-v6.1-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      484e5fc34235bd38f3d58742e7af8455e2699205

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


  Details:     https://kernelci.org/test/plan/id/6360fed01359c9138be7db93

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
60fed01359c9138be7dba4
        failing since 77 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
360fed01359c9138be7dba6
        failing since 77 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-11-01T11:10:56.955007  / # =

    2022-11-01T11:10:56.960430  =

    2022-11-01T11:10:57.062844  / # #
    2022-11-01T11:10:57.068419  #
    2022-11-01T11:10:57.169485  / # export SHELL=3D/bin/sh
    2022-11-01T11:10:57.174547  export SHELL=3D/bin/sh
    2022-11-01T11:10:57.275554  / # . /lava-7802130/environment
    2022-11-01T11:10:57.281131  . /lava-7802130/environment
    2022-11-01T11:10:57.382172  / # /lava-7802130/bin/lava-test-runner /lav=
a-7802130/0
    2022-11-01T11:10:57.388249  /lava-7802130/bin/lava-test-runner /lava-78=
02130/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6360ff686c2f597437e7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6360ff686c2f597437e7db=
4f
        new failure (last pass: renesas-devel-2022-10-28-v6.1-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/636100119c38e2d263e7db57

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-01-v6.1-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
6100119c38e2d263e7db68
        failing since 77 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
36100119c38e2d263e7db6a
        failing since 77 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-11-01T11:16:12.802071  / # =

    2022-11-01T11:16:12.805155  =

    2022-11-01T11:16:12.913391  / ##
    2022-11-01T11:16:12.916395   #
    2022-11-01T11:16:13.020486  / #export SHELL=3D/bin/sh
    2022-11-01T11:16:13.020660   <6>[   31.283740] mwifiex_pcie 0000:01:00.=
0: info: FW download over, size 638992 bytes
    2022-11-01T11:16:13.022430  export SHELL=3D/bin/sh
    2022-11-01T11:16:13.126078  / #. /lava-7802057/environment
    2022-11-01T11:16:13.128410   . /lava-7802057/environment
    2022-11-01T11:16:13.231646  / # /lava-7802057/bin/lava-test-runner /lav=
a-7802057/0 =

    ... (15 line(s) more)  =

 =20
