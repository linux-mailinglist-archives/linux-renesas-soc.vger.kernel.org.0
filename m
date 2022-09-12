Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026A75B5AE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Sep 2022 15:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiILNKv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Sep 2022 09:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiILNKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2022 09:10:49 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0655025E98
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 06:10:48 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id q63so8228829pga.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=VUqp/t9eHeJSqpy2TC0ptwEi+8L58zikRG4vyozlyNI=;
        b=RpNHsWrGVT3NiGn+bsQLTO4JAjWyaG6/OZN0qV/dgXeium4l6Hjp8qKPqFlBE2aRW2
         lVlQZFwhbsvc83fKbMMFGsj8Nn8kinkPdXQo6rRdS4dhfmeSwCR3/xoPuEbw4bbSfGQe
         VpDX77viKZ8t5p5LW5gUJoJe2FOGW+wbdxmeaYuCUDOVf3wkW38blWORfXnM2YqhlJUi
         stMpEi6aYw9ArfNEUf6eu9tf69AfopHVpLc4qlpotW4iPLwoz+s8Q19Q85hYipugfEIW
         gswIENaGMxYtfIzUt7FFnqzQ3IpRE8okjXhfEm+4P5gc8MU0XMV+LVak8fjfDVGx8FuZ
         5f1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=VUqp/t9eHeJSqpy2TC0ptwEi+8L58zikRG4vyozlyNI=;
        b=56nSvxebob4CwkLTg0qi7GNUgIFj+90zTcDyO/xjaXbVH9/cbzI4+x/gAbgBkcpCht
         lgh/DUAK6rvmtRY0OKRv95lQ1PiR4MkMXDpy8T3Q2DEQKeXs51hwXMlORucclnG9Jk1Y
         ygKdaCnogw562ydzujkHMTve1aWnTOzOUb5Ll+QyvEdqcPGLcAYqGiP5IXtgiy8Ty6hK
         oGtM0Zcq23k/XUwY8f+8pRILZKsNzpQ2jk8fooV1s2f76UrLtAvMTpZEzf/dlcnGd3oK
         P+w6POZxvGRHx4xZe56hBezPrRhL2ZYjgghEx/WwGj7AxAAJSn3CJcJsZs/bVs8wvKAs
         T1AQ==
X-Gm-Message-State: ACgBeo2XftSIGTLpKY/i0nz7pxEC1HsqixUoMCiUV0Nd7IyJ5iT03MDN
        UsqQuXDHdFJXP7GYXda21CZ0QVXrYN0o6PKhZXU=
X-Google-Smtp-Source: AA6agR5kpZnSxgzfsIMOyfXFVM/E4DdUqUKbnooBkCjY18e8DUAaqI5xGjKFy77KLdEDMFCJ+eYDcw==
X-Received: by 2002:a63:1e11:0:b0:41c:d233:31f8 with SMTP id e17-20020a631e11000000b0041cd23331f8mr23437055pge.228.1662988247336;
        Mon, 12 Sep 2022 06:10:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902710200b00172f4835f60sm5894242pll.189.2022.09.12.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 06:10:46 -0700 (PDT)
Message-ID: <631f2fd6.170a0220.44339.96d7@mx.google.com>
Date:   Mon, 12 Sep 2022 06:10:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc5-843-g94f27a9ea269
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (v6.0-rc5-843-g94f27a9ea269)
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

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (v6.0-rc5-843-g94f27=
a9ea269)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v6.0=
-rc5-843-g94f27a9ea269/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: v6.0-rc5-843-g94f27a9ea269
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      94f27a9ea2691030ed8a87c33e1e6a0badc3bde9

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  d4bb19e2c49de32a01cef56ad739cc10e9afd237
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1298b5f0e1b3e010657ffba41d2e775fab028e08 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1e711d35b76315355648

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-gpu-p=
anfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-gpu-p=
anfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220826.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/631f1e711d35b7631535564b
        new failure (last pass: renesas-devel-2022-09-05-v6.0-rc4)

    2022-09-12T11:56:16.197973  <6>[   25.126618] Console: switching to col=
our dummy device 80x25
    2022-09-12T11:56:16.204008  <14>[   25.133740] [IGT] panfrost_submit: e=
xecuting
    2022-09-12T11:56:16.218494  IGT-Version: 1.26-g1298b5f (aarch64) (Linux=
: 6.0.0-rc5 aarch64)<14>[   25.139495] [IGT] panfrost_submit: starting subt=
est pan-unhandled-pagefault
    2022-09-12T11:56:16.222551  Starting subtest: pan-unhandled-pagefault
    2022-09-12T11:56:16.340069  (panfrost_submit:347) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   25.264636] [IGT] panfrost_submit: exiting, ret=3D98
    2022-09-12T11:56:16.340400  :
    2022-09-12T11:56:16.353774  (panfrost_submit:347) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-09-12T11:56:16.354865  Stack trace:
    2022-09-12T11:56:16.359481    #0 ../lib/igt_core.c:1819 __igt_fail_asse=
rt()
    2022-09-12T11:56:16.362634    #1 [<unknown>+0xd4651c78] =

    ... (9 line(s) more)  =

 =20
