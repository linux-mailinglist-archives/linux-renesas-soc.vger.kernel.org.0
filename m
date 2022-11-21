Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D256322E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 13:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiKUM5o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 07:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiKUM5n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 07:57:43 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE78D2E4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 04:57:42 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so13133442pjt.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 04:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hyp18WTIBaX3SSvgNTYu+OnYjnR55CjJm4mTJsfrrFE=;
        b=ci90+OMTrC7JyOb5SvNgSAbEgkVPRwhw19S7vMyUbt0TglzUiZ1q8hEXg4u8tZpO4e
         DXF/wnbKlEbELY4V2eu3SC6Sw3n1n1dj3bdSKxRvU2D2tm47Y66FPeLggF6dMe1rrfn1
         POfKl5T6ubnuvYGxPTkGEaqBB490T3eiZQ6+zWf4Xb/qF4Fy4PuJDaiss+EWxxMf2aHK
         7NnnwRcxk+kduMeXzbtTKoCA5G3OVdKDbDqsCSsB51BgL3086QN8z/5MAI5YQ1+zba9m
         0WLsoIwy1MfjqL+Upgr6um7QFhwyeXx4x3qcLFEtvgbdtsg3ndXhR5D0J1wKjQKEkTkU
         puYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hyp18WTIBaX3SSvgNTYu+OnYjnR55CjJm4mTJsfrrFE=;
        b=kndYLO8m3R3UnfbQlS1gnNg4uTyc6/B+X0p6WVWcQBxcYE7IfzVbcd1/LFHWjgCot/
         BPgZo7G9hIZPQlSmRaQ7aAPEskCu5vJSR7OxGyU7lIN+KoXeiPtgEUZaYDjMDXjl0hTx
         HKSIdpZK4RCP92TSpEt4ePV3LjQzOtlPPAwmc5hQRpLFpFNaxKR9swaq3RIEh9j72nAd
         VR9N7pNDD23kscHDH1IfaxabLNQw2ED/A7QUodlp5xAgI2LdrabNJiziI0jitdNMOEyj
         ZU4XHUl0Fh2t8xeMw0ZWBUt1IhPPPoYSvM1xE1wRp20kgvNQsE5+VQyziIZ6OjAciA05
         l+sA==
X-Gm-Message-State: ANoB5pltm0KpQvakRPBebUQ3ftLXKSxF+JYZnbZAp273AGd2ifG2CBvj
        EUaUndINGkAZehW3btJrDuSKRx2JIDOKdj8nAc4=
X-Google-Smtp-Source: AA0mqf531nRxS4RyHBTECyRGtTsxh79BV1Yl5KX0nAh9pI0wWYwiV5pLJ3XoeD1rhlgSyUDYuht1rQ==
X-Received: by 2002:a17:90a:4fc1:b0:213:16b5:f45e with SMTP id q59-20020a17090a4fc100b0021316b5f45emr25799379pjh.170.1669035461577;
        Mon, 21 Nov 2022 04:57:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kb6-20020a17090ae7c600b001fde655225fsm24497515pjb.2.2022.11.21.04.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 04:57:41 -0800 (PST)
Message-ID: <637b75c5.170a0220.b0337.dd92@mx.google.com>
Date:   Mon, 21 Nov 2022 04:57:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-11-21-v6.1-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 8 runs,
 5 regressions (renesas-next-2022-11-21-v6.1-rc1)
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

renesas/next cros-ec: 8 runs, 5 regressions (renesas-next-2022-11-21-v6.1-r=
c1)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-11-21-v6.1-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-11-21-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      00841e945654c53409a811ab1ddaa934631ac54c

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


  Details:     https://kernelci.org/test/plan/id/637b60bd78c35dbde02abd00

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
7b60bd78c35dbde02abd11
        failing since 98 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
37b60bd78c35dbde02abd13
        failing since 98 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-21T11:27:38.110553  / # =

    2022-11-21T11:27:38.115312  =

    2022-11-21T11:27:38.217288  / # #
    2022-11-21T11:27:38.221751  #
    2022-11-21T11:27:38.322872  / # export SHELL=3D/bin/sh
    2022-11-21T11:27:38.327550  export SHELL=3D/bin/sh
    2022-11-21T11:27:38.428356  / # . /lava-8062684/environment
    2022-11-21T11:27:38.433452  . /lava-8062684/environment
    2022-11-21T11:27:38.534409  / # /lava-8062684/bin/lava-test-runner /lav=
a-8062684/0
    2022-11-21T11:27:38.539808  /lava-8062684/bin/lava-test-runner /lava-80=
62684/0 =

    ... (8 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/637b5ec7267b3d1a2c2abd20

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
7b5ec7267b3d1a2c2abd31
        failing since 98 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
37b5ec7267b3d1a2c2abd33
        failing since 98 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-21T11:19:12.464738  / # =

    2022-11-21T11:19:12.469631  =

    2022-11-21T11:19:12.571085  / # #
    2022-11-21T11:19:12.575965  #
    2022-11-21T11:19:12.676755  / # export SHELL=3D/bin/sh
    2022-11-21T11:19:12.682442  export SHELL=3D/bin/sh
    2022-11-21T11:19:12.783340  / # . /lava-8062630/environment
    2022-11-21T11:19:12.788354  . /lava-8062630/environment
    2022-11-21T11:19:12.889283  / # /lava-8062630/bin/lava-test-runner /lav=
a-8062630/0
    2022-11-21T11:19:12.894371  /lava-8062630/bin/lava-test-runner /lava-80=
62630/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/637b69b96985ab57b82abd55

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
37b69b96985ab57b82abd65
        failing since 98 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-21T12:06:07.296843  / # =

    2022-11-21T12:06:07.299821  =

    2022-11-21T12:06:07.408531  / # #
    2022-11-21T12:06:07.411955  #
    2022-11-21T12:06:07.516877  / # export SHELL=3D/bin/sh
    2022-11-21T12:06:07.520114  export SHELL=3D/bin/sh
    2022-11-21T12:06:07.624124  / #. /lava-8063365/environment
    2022-11-21T12:06:07.627822   . /lava-8063365/environment
    2022-11-21T12:06:07.730999  / # /lava-8063365/bin/lava-test-runner /lav=
a-8063365/0
    2022-11-21T12:06:07.734689  /lava-8063365/bin/lava-test-runner /lava-80=
63365/0 =

    ... (10 line(s) more)  =

 =20
