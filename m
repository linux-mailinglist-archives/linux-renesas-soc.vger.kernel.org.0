Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD3515AD1D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Sep 2022 13:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237481AbiIELxG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Sep 2022 07:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237349AbiIELxF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2022 07:53:05 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4919D5C9EC
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Sep 2022 04:53:04 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fv3so2107807pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Sep 2022 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=RjSZWAbhWacsf8HFr3+nGxx3aHTSFcAUDFenHpqr9YY=;
        b=RULkMOSatubQmPqj4FHgnB4PHY3lXBaqb3xldj495kKPO3kDK9LPC+qqS8zJ8DaAOh
         I7TFTEJDJ2Wnqcxo9A7dhJuh/32MaZthp9GMLO6qfl9Fb2IlWCDVh1oyHZGk+u0aEXs5
         GADt6vQfEdb3S/JbCV5+MC46GSgpgQLBuhVH0Mnb26I1XQbcLQcFwmrVMVpQwojY8m7Y
         GjpPnBsA6CYCzzEOFbA24RX9sMNyRq5nL8OgdaycY2XzwSVcuACX5UaZwZiz70k7aHJX
         7B9q+tzbMqxUcm5iBEZWLM/hUI+rsHv6MophrJ3M6Y4l49nEHtM/sgyYeRXwT6qNCheE
         ltfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=RjSZWAbhWacsf8HFr3+nGxx3aHTSFcAUDFenHpqr9YY=;
        b=xYhmJkI8U7oKSvU/NByRGUfjsLXu2J0TEyz/6Mphe5rT5fVjgqM4OyOIsGXR6trBVM
         cty0hA0JJaOOR7Busgdt/HF7m4HYQCSPfg0PsaTN0AArIqHWQX/ojYnYm7enjo65uJZ7
         Vi3vqQ3JvZH6oEij3yRVTwq/QgpFcBLRLqAveQTe9rviEWTpDVmd2L5wXdgRCkMHl5pr
         /zuUS8tx6PSWKvOikQ6KAg8jyTaRQaAdobqo+m+v+udyVIrZxBMTyHRNqOS1hlyqdmjn
         2uWEMqtl7Ag8ortFtHt92fI1nYeVWfxnAvtmH9eqEsqx/JLxkxOa7k92H/H5zT4VbbCI
         PosA==
X-Gm-Message-State: ACgBeo2adL20nIdBMrocEV5t+ASBLkf6qk/go/92IgfqR3lsQpznlAmo
        Hz/aRsr5045a6uxrtkNUvVlC2atUGSTcGvTlr38=
X-Google-Smtp-Source: AA6agR653TOpP+MLCzPIpRiNCpzLPNSbyZOg7jShTcYl0XTgfj5TMYMy7EHCFhcxxuG5ZI9VNY8gzQ==
X-Received: by 2002:a17:902:cf0c:b0:16f:9023:e07b with SMTP id i12-20020a170902cf0c00b0016f9023e07bmr48245571plg.143.1662378783144;
        Mon, 05 Sep 2022 04:53:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d29-20020aa797bd000000b005380832c1fesm7854326pfq.10.2022.09.05.04.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 04:53:02 -0700 (PDT)
Message-ID: <6315e31e.a70a0220.a6647.c29b@mx.google.com>
Date:   Mon, 05 Sep 2022 04:53:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-05-v6.0-rc4
Subject: renesas/master cros-ec: 3 runs,
 3 regressions (renesas-devel-2022-09-05-v6.0-rc4)
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

renesas/master cros-ec: 3 runs, 3 regressions (renesas-devel-2022-09-05-v6.=
0-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-05-v6.0-rc4/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-05-v6.0-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ce5bd4a14031a91fb83af3882c226513c60d5bf1

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6315cfeff86cae395535566f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6315cfeff86cae39553556=
70
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3) =

 =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6315cfb495f22da1c235564b

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
15cfb495f22da1c235565c
        failing since 20 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
315cfb495f22da1c235565e
        failing since 20 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-05T10:30:04.718174  / # =

    2022-09-05T10:30:04.721562  =

    2022-09-05T10:30:04.830695  / # #
    2022-09-05T10:30:04.834441  #
    2022-09-05T10:30:04.938183  / # export SHELL=3D/bin/sh
    2022-09-05T10:30:04.941367  export SHELL=3D/bin/sh
    2022-09-05T10:30:05.044593  / # . /lava-7188372/environment
    2022-09-05T10:30:05.047802  . /lava-7188372/environment
    2022-09-05T10:30:05.151604  / # /lava-7188372/bin/lava-test-runner /lav=
a-7188372/0
    2022-09-05T10:30:05.154989  /lava-7188372/bin/lava-test-runner /lava-71=
88372/0 =

    ... (8 line(s) more)  =

 =20
