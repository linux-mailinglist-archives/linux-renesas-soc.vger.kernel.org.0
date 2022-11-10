Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA3B624BFD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 21:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbiKJUgc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 15:36:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbiKJUgQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 15:36:16 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7891843AFF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 12:35:58 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id v17so2531516plo.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 12:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kMY3FuQra2vlVxguXgW6qhkPPR+/CNGrqp+0eGyfd2g=;
        b=XFriLJpOcWjpYkvv4J6n8pcAke5/DF30Nckx4Lfd5FoOmv84tHRRsn72dheByGFhdo
         eLbd31RWDXQkHpTnmdhjquJfXhbebhqVVjyhrjcNWi9I05+6+0tB28da3ef+Hi0eWoDN
         VAG4hj6DeQDRBfpug5pKMUkXGYpOOQ2hyuAfTLCIBI05Mmi9i1LOz4e4JhAbehJNsNy+
         glQjndK785Ng6+mPuT8wPvnBzRq7MdXe/7GIzuvEHuv9HJ0mgDofurvaPH+0+/Wy8x+u
         2i/LlUFciBCXUjm3eCD5280l2IV8YWDefCkF1Exf0sVcIQLXl6Estp4bWpXz5D7Womew
         oHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMY3FuQra2vlVxguXgW6qhkPPR+/CNGrqp+0eGyfd2g=;
        b=X2iXeUCPpdPuKs9qunTHz7NS9LfrnwAM9aIGbziLakdsBNnxaWgi3nVuJbuQQWCJ3B
         xUthRYFNEQvXo7nZyzne0bpWFNoRBn4ZwS+adKLbW67gaeymrUZbqHEMbbhjLJwoQDSl
         fkSCF6Xauazhwlhu+QYmZaKGEOjIlujtUMU3Etr9wrSVT6lWJp+8GTNVXBKf9lU9ABxn
         7n34FCBzTBXNvmAtUdvQhj1hfsKfXjOwIVQbtqTdDrPAvEz7av5xI6EutWFzUH/OIJNB
         eNylkgmr3Cx/d09Ug7fVIb8zLindCYjGb/jojKsdn/jiJML9NWXHSFACwTIfEo7hTen7
         Oaxg==
X-Gm-Message-State: ANoB5pm3z5/ATrQ1Fr3u3MKuYYYU116m7UoGrXUj0cWPRh3tOfNegXyH
        iAhbHY5i6cZGU79zNTz3zSYtFPb6mnub4CWiV/8=
X-Google-Smtp-Source: AA0mqf5wWuetYMzSn/kmUQwgGHl8g+KZKPJFYiiSJP1KNHCR/SkAUjV7q+RwK6thfQp8ftDrtlZ0Xg==
X-Received: by 2002:a17:902:b194:b0:186:e377:f4e1 with SMTP id s20-20020a170902b19400b00186e377f4e1mr11346565plr.8.1668112557682;
        Thu, 10 Nov 2022 12:35:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d15-20020a170902cecf00b001871461688esm91937plg.175.2022.11.10.12.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 12:35:57 -0800 (PST)
Message-ID: <636d60ad.170a0220.e01d0.02eb@mx.google.com>
Date:   Thu, 10 Nov 2022 12:35:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-10-v6.1-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-11-10-v6.1-rc4)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2022=
-11-10-v6.1-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-10-v6.1-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-10-v6.1-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      35f5248b8c44355d69637ca0ae3fc3fbfc8aa2d0

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  82b2b1e8987c182d14fcaf5a3a3b8ee1b4d5e1df
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  9eff5fba09403bf1df3a1edd655b66fa1b60de2e =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/636d4dbb791e2c99bae7db5d

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20221024.1/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/636d4dbb791e2c99bae7db76
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:58.317941  Test requirement not met in function igt_re=
quire_pipe, fil<8>[   72.021142] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-=
A-wait-busy-hang RESULT=3Dskip>
    2022-11-10T19:12:58.318730  e ../lib/igt_kms.c:2318:
    2022-11-10T19:12:58.319488  =

    2022-11-10T19:12:58.327495  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:58.330357  Pipe E does not exist or not enabled
    2022-11-10T19:12:58.338131  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-10T19:12:58.339004  =

    2022-11-10T19:12:58.346978  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:58.349856  Pipe F does not exist or not enabled
    2022-11-10T19:12:58.388140  <6>[   72.098841] Console: switching to col=
our dummy device 80x25 =

    ... (138 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/636d4dbb791e2c99bae7db78
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:57.024705  t or not enabled
    2022-11-10T19:12:57.032613  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-10T19:12:57.039489  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:57.043435  Pipe F does not exist or not enabled
    2022-11-10T19:12:57.094613  <6>[   70.804957] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:12:57.099600  <14>[   70.811770] [IGT] kms_vblank: execut=
ing
    2022-11-10T19:12:57.105744  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64)
    2022-11-10T19:12:57.112972  <14>[   70.819052] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-busy
    2022-11-10T19:12:57.113426  =

    2022-11-10T19:12:57.117199  Starting subtest: pipe-A-wait-busy =

    ... (98 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/636d4dbb791e2c99bae7db7a
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:55.691802  e ../lib/igt_kms.c:2318:
    2022-11-10T19:12:55.699166  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:55.703324  Pipe E does not exist or not enabled
    2022-11-10T19:12:55.711627  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-10T19:12:55.719276  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:55.722767  Pipe F does not exist or not enabled
    2022-11-10T19:12:55.758933  <6>[   69.469814] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:12:55.765164  <14>[   69.477033] [IGT] kms_vblank: execut=
ing
    2022-11-10T19:12:55.770662  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64)
    2022-11-10T19:12:55.779109  <14>[   69.483749] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-forked =

    ... (139 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/636d4dbb791e2c99bae7db7c
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:54.415329  splay->n_pipes || !display->pipes[pipe].ena=
bled)
    2022-11-10T19:12:54.418174  Pipe E does not exist or not enabled
    2022-11-10T19:12:54.426576  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-10T19:12:54.433597  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:54.434355  =

    2022-11-10T19:12:54.437856  Pipe F does not exist or not enabled
    2022-11-10T19:12:54.482031  <6>[   68.192402] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:12:54.486854  <14>[   68.199712] [IGT] kms_vblank: execut=
ing
    2022-11-10T19:12:54.494464  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64)
    2022-11-10T19:12:54.500702  <14>[   68.206453] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-idle =

    ... (97 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/636d4dbb791e2c99bae7db7e
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:53.088491  n_pipes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:53.091994  Pipe E does not exist or not enabled
    2022-11-10T19:12:53.100920  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-10T19:12:53.108008  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:53.108384  =

    2022-11-10T19:12:53.111813  Pipe F does not exist or not enabled
    2022-11-10T19:12:53.155765  <6>[   66.866602] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:12:53.160743  <14>[   66.873277] [IGT] kms_vblank: execut=
ing
    2022-11-10T19:12:53.167724  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64)
    2022-11-10T19:12:53.174390  <14>[   66.879692] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-forked-busy =

    ... (130 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/636d4dbb791e2c99bae7db80
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:51.874018  =

    2022-11-10T19:12:51.876393  ay->n_pipes || !display->pipes[pipe].enable=
d)
    2022-11-10T19:12:51.880502  Pipe E does not exist or not enabled
    2022-11-10T19:12:51.888790  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-10T19:12:51.895897  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:51.900107  Pipe F does not exist or not enabled
    2022-11-10T19:12:51.942809  <6>[   65.653980] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:12:51.947662  <14>[   65.660637] [IGT] kms_vblank: execut=
ing
    2022-11-10T19:12:51.954861  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64)
    2022-11-10T19:12:51.961985  <14>[   65.666995] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-busy =

    ... (94 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/636d4dbb791e2c99bae7db82
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:50.504330  =

    2022-11-10T19:12:50.505991  le ../lib/igt_kms.c:2318:
    2022-11-10T19:12:50.513612  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:50.517139  Pipe E does not exist or not enabled
    2022-11-10T19:12:50.525645  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2318:
    2022-11-10T19:12:50.532716  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-11-10T19:12:50.536899  Pipe F does not exist or not enabled
    2022-11-10T19:12:50.576376  <6>[   64.286357] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:12:50.581484  <14>[   64.293020] [IGT] kms_vblank: execut=
ing
    2022-11-10T19:12:50.587735  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64) =

    ... (130 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/636d4dbb791e2c99bae7db84
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:49.327857  <6>[   63.038716] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:12:49.332664  <14>[   63.045362] [IGT] kms_vblank: execut=
ing
    2022-11-10T19:12:49.339808  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64)
    2022-11-10T19:12:49.346799  <14>[   63.051154] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2022-11-10T19:12:49.347248  =

    2022-11-10T19:12:49.350882  Starting subtest: pipe-A-query-idle
    2022-11-10T19:12:49.437701  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-11-10T19:12:49.438740  =

    2022-11-10T19:12:49.794117  (kms_vblank:590) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-11-10T19:12:49.801836  (kms_vblank:590) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (85 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/636d4dbb791e2c99bae7db85
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:48.119311  <6>[   61.829847] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:12:48.124778  <14>[   61.836950] [IGT] kms_vblank: execut=
ing
    2022-11-10T19:12:48.125541  =

    2022-11-10T19:12:48.131732  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64)
    2022-11-10T19:12:48.138669  <14>[   61.843533] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-11-10T19:12:48.139537  =

    2022-11-10T19:12:48.139979  =

    2022-11-10T19:12:48.142942  Starting subtest: pipe-A-accuracy-idle
    2022-11-10T19:12:48.238934  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-11-10T19:12:48.643689  (kms_vblank:587) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255: =

    ... (94 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
36d4dbb791e2c99bae7dc02
        failing since 146 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-11-10T19:12:43.876806  <8>[   57.589906] <LAVA_SIGNAL_TESTSET STOP>
    2022-11-10T19:12:43.878055  =

    2022-11-10T19:12:43.958558  <8>[   57.670241] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-11-10T19:12:44.031500  <6>[   57.742490] Console: switching to col=
our dummy device 80x25
    2022-11-10T19:12:44.037090  <14>[   57.749212] [IGT] kms_setmode: execu=
ting
    2022-11-10T19:12:44.043773  IGT-Version: 1.26-g9eff5fb (aarch64) (Linux=
: 6.1.0-rc4 aarch64)
    2022-11-10T19:12:44.049513  <14>[   57.754545] [IGT] kms_setmode: start=
ing subtest basic
    2022-11-10T19:12:44.049821  =

    2022-11-10T19:12:44.052239  Starting subtest: basic
    2022-11-10T19:12:44.055696  Testing: basic 1 connector combinations =

    ... (92 line(s) more)  =

 =20
