Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAC769E382
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Feb 2023 16:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbjBUPeE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Feb 2023 10:34:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233273AbjBUPeD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2023 10:34:03 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C55B749
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 07:33:55 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id c23so485654pjo.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 07:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ4ffk8P7DJR/yUpexSHRM03Gm13+jsdCb97daKXkRM=;
        b=fpvlPQUFJVFwCszs4B3vBPpjjpcko2FaHGHRYZKK+8Md8Vmgl/VX4Du3qAGHWEBoYW
         QRx6HrbhQI4JwNrubz+l6xjElLU5CzMro2iJbrj0Lhb/FHO2hZinfmvSaJp/XEgV2lze
         0dhFzQJ6Trcqx1XlW/ufiSRy5wDBuUdT2TEwdIlRb+C+mHenSdddvX972QwkXSoONW9F
         v1qk29qUhESXLxpXoXBqaOrFKPAY14o6mWdVhBApqqEZeus90Knm2gSoAtWw5bd45X7i
         +CRnWLCTotjXwAsXDBKr8EeT91gwdQBh+oKHlgrvMM50tMd9bIN9iaR41c3nLMG6kAWB
         zdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ4ffk8P7DJR/yUpexSHRM03Gm13+jsdCb97daKXkRM=;
        b=PjNR6BR4zevxdv0ahrYy7A16FzEVD1onVA532KGxPj2gTC5odkxk4VZPvnHkf+icap
         gSycxhhcYSOAruZUsQ4esTYf9B2vaBiQ64EK7P4tka52s2wRZ61//nprKnzkuasuPWQ4
         AaY2gKZFCUdTCUPIMb81BYmrG0pSLQciSg5Q00xrGZI9+M08z9Xovk7X3fMaKHLKTEPK
         h29NC5uS5tJU2VzvKGiv6ZMMbuWwzJL4hTj13IvdqB/aq+gMpnZWBADn8b6cBG0v5Bzy
         Zj/A9CweftU6v3kbccE9KhkrrKvPKOOjOhAKwwt8A1mOeHbPrxU7Jc50tUOnKqLn2eLd
         jnQg==
X-Gm-Message-State: AO0yUKUjhpBEWC8qqtjn1Ml0+gE/C+5yuM7cA70TrAG0yrSLYHXOPk44
        TyEDj04C9fp8W0pakIoXqc9YO9YtEj0A5RFUGMo=
X-Google-Smtp-Source: AK7set/AQP8NCA6Nh0EzhtYcLWHBWzPgTJmCXs7oxqVzF23F8M7j0R7uOeLS92Zb+H1vxhNVBHBnYg==
X-Received: by 2002:a17:902:e851:b0:19a:7758:e5e6 with SMTP id t17-20020a170902e85100b0019a7758e5e6mr8158151plg.48.1676993634529;
        Tue, 21 Feb 2023 07:33:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b00198e12c499dsm3111766pld.282.2023.02.21.07.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:33:54 -0800 (PST)
Message-ID: <63f4e462.170a0220.f48b.4fdc@mx.google.com>
Date:   Tue, 21 Feb 2023 07:33:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-02-21-v6.2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 122 runs,
 5 regressions (renesas-devel-2023-02-21-v6.2)
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

renesas/master baseline-nfs: 122 runs, 5 regressions (renesas-devel-2023-02=
-21-v6.2)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+ima       | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

juno-uboot               | arm64 | lab-broonie     | gcc-10   | defconfig+c=
rypto             | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | renesas_def=
config            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-02-21-v6.2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-02-21-v6.2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5b96f8a28064829e9c31a235f5b4a3f566743b9c =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b721e3c559c8518c8666

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63f4b721e3c559c8518c866f
        failing since 0 day (last pass: renesas-devel-2023-02-13-v6.2-rc8, =
first fail: renesas-devel-2023-02-20-v6.2)

    2023-02-21T12:20:39.828425  + set[   28.274820] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 910133_1.6.2.3.1>
    2023-02-21T12:20:39.829015   +x
    2023-02-21T12:20:39.942166  / # #
    2023-02-21T12:20:40.044495  export SHELL=3D/bin/sh
    2023-02-21T12:20:40.044890  #
    2023-02-21T12:20:40.146157  / # export SHELL=3D/bin/sh. /lava-910133/en=
vironment
    2023-02-21T12:20:40.146619  =

    2023-02-21T12:20:40.247899  / # . /lava-910133/environment/lava-910133/=
bin/lava-test-runner /lava-910133/1
    2023-02-21T12:20:40.248427  =

    2023-02-21T12:20:40.251561  / # /lava-910133/bin/lava-test-runner /lava=
-910133/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b7eb70347c6c808c870a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63f4b7eb70347c6c808c8713
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-02-21T12:24:01.852577  + set[   26.969455] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 910144_1.6.2.3.1>
    2023-02-21T12:24:01.852799   +x
    2023-02-21T12:24:01.959611  / # #
    2023-02-21T12:24:02.061054  export SHELL=3D/bin/sh
    2023-02-21T12:24:02.061419  #
    2023-02-21T12:24:02.162527  / # export SHELL=3D/bin/sh. /lava-910144/en=
vironment
    2023-02-21T12:24:02.162905  =

    2023-02-21T12:24:02.263918  / # . /lava-910144/environment/lava-910144/=
bin/lava-test-runner /lava-910144/1
    2023-02-21T12:24:02.264469  =

    2023-02-21T12:24:02.267346  / # /lava-910144/bin/lava-test-runner /lava=
-910144/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4b8eca1bee7848b8c8669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63f4b8eca1bee7848=
b8c866a
        failing since 14 days (last pass: renesas-devel-2023-01-30-v6.2-rc6=
, first fail: renesas-devel-2023-02-06-v6.2-rc7) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
juno-uboot               | arm64 | lab-broonie     | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4df4d09237f111f8c88be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-juno-=
uboot.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-juno-=
uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63f4df4d09237f111=
f8c88bf
        failing since 27 days (last pass: renesas-devel-2023-01-09-v6.2-rc3=
, first fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | renesas_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4d439e9d6f6a20a8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1=
-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-21-v6.2/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1=
-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63f4d439e9d6f6a20=
a8c8632
        new failure (last pass: renesas-devel-2023-02-20-v6.2) =

 =20
