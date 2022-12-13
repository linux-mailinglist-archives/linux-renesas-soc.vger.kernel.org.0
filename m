Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11A0B64AD72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 03:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiLMCGk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 21:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiLMCGj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 21:06:39 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1711A3B3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 18:06:38 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so2061841pjd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 18:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jx2SzstIEP33ESAqAraLlZZhqj+XzScgVqX+dh0ycrk=;
        b=gt6dZEQr3Zu/zxKWnWX5JH/HT0dslM3k5CNHQY4Qt+Mw9TAKqpTtYGhx73i+R3qCag
         BKEn4wphz3zr+iwC8fac2bAAoSrKEgApDPRKkcufC/gJ4yYafs3otTa7pg1tG++sVK5X
         8nHtT7uU2Ks4F1GR3C9RZtC3rQ/1kYWS0bEhXNE6bG9Tj4NjluhVI3UegClcVEpLNHD3
         muFLwaUtE+/FK10ZwhUdI7xtDY9JQ2ME8vEO4t7qvU6EIpEr9MVlEosf4Swly+qx+8Tv
         osZiu0Tz1Qvpl7YnoaG7EunH5KkAJoezyDgCohNBOiArtBsrDwF99LMovZJ/Q1S/dtXF
         BLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jx2SzstIEP33ESAqAraLlZZhqj+XzScgVqX+dh0ycrk=;
        b=GP88X8iqAAvm4RfpYsvKV6o643ja0AShfnFgVL/AjQ1fBqo/jtHZAqzF8C/iEGMOor
         1bRlKsCyej9IQoJggAfCah2G44mkQl0j9uuL45/fB3NrQUfx8UF2QV0V/ioQTIb1Rcuh
         mbAzCksEzLWGjkrPxDQhvK1CL7s1tmBAb8tr4ppvpVXyOsudnPoLg6UUV1BE+imuLPmg
         GQiG8gpHu/4o4ecu9EvWhASaSRMaL5ZIrklTm1gwtyzwiE2AyqhHwNHwlwWWgR2n0Pkm
         pt51jqBeN+ywEjDPwKFOxQ6OaOuP00MaHAci26TmXHeE4XiExse3zQRnsqmxDYyu7P9p
         4qTg==
X-Gm-Message-State: ANoB5plrV4aZB5zplCxGXxop8qxE9nK7hWS1+dMWSwP8T751rgD1bQuR
        lROH5bnRKiTX4ri7TfOo3svxJo24kPmdSfouCc3H9Q==
X-Google-Smtp-Source: AA0mqf5/dCQFPuueuqv5ftXakYteaHCrnWqokWDnI5DNBsi6J81F4lK3qRYbEmnejTrOZ9JmHzTZSg==
X-Received: by 2002:a05:6a20:1b18:b0:ac:29b4:11bc with SMTP id ch24-20020a056a201b1800b000ac29b411bcmr22437415pzb.21.1670897197660;
        Mon, 12 Dec 2022 18:06:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l14-20020a17090aaa8e00b00213202d77d9sm6076154pjq.43.2022.12.12.18.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 18:06:36 -0800 (PST)
Message-ID: <6397de2c.170a0220.4dbce.ab75@mx.google.com>
Date:   Mon, 12 Dec 2022 18:06:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-12-12-v6.1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 136 runs,
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

renesas/master baseline-nfs: 136 runs, 4 regressions (renesas-devel-2022-12=
-12-v6.1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima     | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-12-12-v6.1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-12-12-v6.1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6397a6f835ac71fb4f2abd0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sa=
m9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sa=
m9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221209.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6397a6f835ac71fb4=
f2abd10
        new failure (last pass: v6.1-rc8-929-g112502470f50) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima     | 1          =


  Details:     https://kernelci.org/test/plan/id/6397c046b44604d3c82abd4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-=
jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-=
jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221209.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6397c046b44604d3c=
82abd50
        new failure (last pass: renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0=
d22967) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =


  Details:     https://kernelci.org/test/plan/id/6397db0211d61df3c62abd30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221209.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6397db0211d61df3c=
62abd31
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6397a919ca99a496992abd22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221209.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6397a919ca99a4969=
92abd23
        failing since 118 days (last pass: renesas-devel-2022-08-11-v5.19, =
first fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =20
