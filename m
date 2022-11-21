Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E957163233F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 14:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiKUNPx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 08:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiKUNPw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 08:15:52 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F46D18B24
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 05:15:51 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id d192so11335690pfd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 05:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=31KoPvgXp+iWgoSNkSdaGO+xDLtRASXqZ4nVpPLamug=;
        b=YKhxMfDzmT+egRgLZHVkMEqhUZAnCyM4KjNGbIpUobWFlD8SGyF7PZ9eV7nD9Hgc+K
         9AePMgz87uYZYKg9zTpolCgRyX5gyXsryELyUamghA5QTUZ3qt/pKQSKVp4BEDFgqXiL
         p0d94q4GTmoojfGe+6Mr6Q8xoUSNzKedtWcIwOuguCxIJHuUMJp+RpYJjRlOzdaAMLb1
         uCNknPBo6YVZP3lGskitKtoQRTE+L8Tq9XzY24cYyZgiqMck0QgR7VxbdLJ9hSTefOeT
         X5azY4y0/T8dCMUnbsr8c2wlueDqryq7WdinF1d5fCXYfyasZcDYs22byGq2wwqdHqe8
         U3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31KoPvgXp+iWgoSNkSdaGO+xDLtRASXqZ4nVpPLamug=;
        b=xvZFJ7CP6ws8SVkkbzTVXjofpCagDMrDXZz3+lUGMtsPFeCYbl+KVO7FLtb/beIVnZ
         GMYuc61fUX14jv8UzBWww3Mw3wodO60x72YuqTEGkAJ6OvECR91qRw6nWbXovUeSGLAg
         f638VNBK3IO6Hx40kBu0fGqipkYU8ywfj4ysSpbIcXSB2+12elbTmtvO5xo6rRYqx4Fb
         beRxOis42MKuGo2V0LPMxmAzwXLGKoDI5Yf10grxe5FOytJ86Jff1qm84ikuxH5kPaKT
         amvNdNdXYWC3zYrxmgfsa5sJjfuJ5BPhRL86d/1Jx5WqdVZhivzYBDFjNDJJ6zlYWsK9
         z43w==
X-Gm-Message-State: ANoB5pmFHhYpqH7qCEBkpY0ptMMqjVVzG4Kg8xpY2dMpHUnPo3uyqHjM
        UVpXpsYzXm6DsN9KwwC0fja0dhrEI/TboFFf
X-Google-Smtp-Source: AA0mqf6A/o3LS/W0xzzAxNKTEtrYsZoez+ZG0uDw/UY1PnzcnVb1Dyjt/LSa+Bv2TPCmByQeMhviAg==
X-Received: by 2002:aa7:8684:0:b0:56c:5afe:67f6 with SMTP id d4-20020aa78684000000b0056c5afe67f6mr20319659pfo.20.1669036550836;
        Mon, 21 Nov 2022 05:15:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j28-20020a63fc1c000000b004702eca61fcsm7560843pgi.36.2022.11.21.05.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 05:15:50 -0800 (PST)
Message-ID: <637b7a06.630a0220.fd4c0.a6f3@mx.google.com>
Date:   Mon, 21 Nov 2022 05:15:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-21-v6.1-rc6
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 5 runs,
 2 regressions (renesas-devel-2022-11-21-v6.1-rc6)
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

renesas/master cros-ec: 5 runs, 2 regressions (renesas-devel-2022-11-21-v6.=
1-rc6)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-21-v6.1-rc6/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-21-v6.1-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2cfa2abd5264510d47f2d4a07621a48c01152209

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


  Details:     https://kernelci.org/test/plan/id/637b6378fb627641382abd20

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-21-v6.1-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-21-v6.1-rc6/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
7b6378fb627641382abd31
        failing since 97 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
37b6378fb627641382abd33
        failing since 97 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-11-21T11:39:20.785475  / # =

    2022-11-21T11:39:20.791182  =

    2022-11-21T11:39:20.897521  / # #
    2022-11-21T11:39:20.903321  #
    2022-11-21T11:39:21.005828  / # export SHELL=3D/bin/sh
    2022-11-21T11:39:21.012336  export SHELL=3D/bin/sh
    2022-11-21T11:39:21.114505  / # . /lava-8063048/environment
    2022-11-21T11:39:21.120470  . /lava-8063048/environment
    2022-11-21T11:39:21.222740  / # /lava-8063048/bin/lava-test-runner /lav=
a-8063048/0
    2022-11-21T11:39:21.229238  /lava-8063048/bin/lava-test-runner /lava-80=
63048/0 =

    ... (7 line(s) more)  =

 =20
