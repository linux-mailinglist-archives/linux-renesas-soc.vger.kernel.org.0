Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C895D64AB99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 00:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbiLLXgk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 18:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiLLXgj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 18:36:39 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E56192A5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 15:36:38 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id c13so1040410pfp.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 15:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M3MKyPZP8fQzJ/HF9vwlyCWnpc3LDmumPopS9HLngdE=;
        b=h9e2RHp7RoPrlFyuEMCkbLPY+xQ4826Bou/lPxDMx5anb6hGgX3pEgMKTofDOaHot8
         L2WpM7WVxefwI5PAIfY05xFOS+KB2REVV4EEx3uYEUo8iexfDMgvPHRB75LJOoL59EqY
         pj7aUwHBODNK4aso9Ii4kYxf++wBJYdaN/+ga/IyuXZ8msp7DcpC0StQbaBxZfyxQ7uK
         cNtoiUvV103bVcr4oA8LEClNAOJ1s5FRd/TZmqkhTzwQt7k/kOXZefoTFNYPTp7QvfOT
         Q0qdM+9CSoYKBwQBrPAf2GmuMric1cfmFsL7y0lUNy2zBo98yYtMgLWQyPcD4fjZsO5d
         CPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3MKyPZP8fQzJ/HF9vwlyCWnpc3LDmumPopS9HLngdE=;
        b=HcshO9fDUjU9z/SwuyJVnVSRkaFM8gYk7NcgeHbh6TGJSsBoQRbIma1CsVa7NVq2TM
         SxC5ASoYbf8YLXEsF5iwnecEJdJ8S1FTlDryQ2T+xJcrdD56IToGJ5JToCQtCfIBR8u0
         I6reBujJNbjwlhfwDf2sGsnSM6ejYcACv5TonlmcVIwMTLsegrgKnH09iQdIJzkUq6V5
         hWaR3wt4NjXe9OYgIDkQTBlfolz+BFES0JWffg67+YJ1n+loR3z4ifApq7TrsNiz1Lt8
         9HDtnuVflZ4imVq7vNZU90n1fr8GN3lQFmYUhpkB4/ChpcUe5RWcNjr+hvGCe8NB7Pr4
         1+3w==
X-Gm-Message-State: ANoB5pmlYaPhmjaCWtRrTyr79hMsJbQglJOkDq2f6SGtzJGPnC/t9/Ap
        9k5isvHVdzbNjNLjxJ1ALLQ2fi4BWWMvPC9bmEmE+Q==
X-Google-Smtp-Source: AA0mqf6zfNnKjM8I/CixNVU01HBK5VdigsQJzsrl7+9ianh+bPmnOvW1pqM+Qkgza4xOdP63uEBPgQ==
X-Received: by 2002:a62:870d:0:b0:576:f02e:d0ef with SMTP id i13-20020a62870d000000b00576f02ed0efmr17048691pfe.4.1670888197469;
        Mon, 12 Dec 2022 15:36:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x17-20020aa79411000000b005777fe7681esm6337543pfo.20.2022.12.12.15.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 15:36:36 -0800 (PST)
Message-ID: <6397bb04.a70a0220.a01d4.ba20@mx.google.com>
Date:   Mon, 12 Dec 2022 15:36:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-12-12-v6.1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 7 runs,
 4 regressions (renesas-devel-2022-12-12-v6.1)
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

renesas/master cros-ec: 7 runs, 4 regressions (renesas-devel-2022-12-12-v6.=
1)

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
sas-devel-2022-12-12-v6.1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-12-12-v6.1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e

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


  Details:     https://kernelci.org/test/plan/id/6397aa91d4db32fab92abcfa

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221209.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
97aa91d4db32fab92abd0b
        failing since 118 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
397aa91d4db32fab92abd0d
        failing since 118 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-12-12T22:26:11.044826  / # =

    2022-12-12T22:26:11.050758  =

    2022-12-12T22:26:11.156885  / # #
    2022-12-12T22:26:11.162924  #
    2022-12-12T22:26:11.265209  / # export SHELL=3D/bin/sh
    2022-12-12T22:26:11.271283  export SHELL=3D/bin/sh
    2022-12-12T22:26:11.372816  / # . /lava-8351040/environment
    2022-12-12T22:26:11.377809  . /lava-8351040/environment
    2022-12-12T22:26:11.479054  / # /lava-8351040/bin/lava-test-runner /lav=
a-8351040/0
    2022-12-12T22:26:11.483833  /lava-8351040/bin/lava-test-runner /lava-83=
51040/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6397a9d1900c1d273d2abd0a

  Results:     5 PASS, 2 FAIL, 10 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-e=
c-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-e=
c-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221209.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
97a9d1900c1d273d2abd19
        failing since 118 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-12-12T22:23:09.492438     =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
397a9d1900c1d273d2abd1b
        failing since 118 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-12-12T22:23:08.429307  / # =

    2022-12-12T22:23:08.431736  =

    2022-12-12T22:23:08.432001  =

    2022-12-12T22:23:08.535119  / ##
    2022-12-12T22:23:08.537016   #
    2022-12-12T22:23:08.537620  =

    2022-12-12T22:23:08.640659  / #export SHELL=3D/bin/sh
    2022-12-12T22:23:08.642353   export SHELL=3D/bin/sh
    2022-12-12T22:23:08.745255  / # . /lava-8350950/environment
    2022-12-12T22:23:08.745475  . /lava-8350950/environment<6>[   31.160350=
] mwifiex_pcie 0000:01:00.0: info: FW download over, size 638992 bytes =

    ... (15 line(s) more)  =

 =20
