Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B64393427
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 18:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhE0QlE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 12:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbhE0QlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 12:41:04 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E87C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 09:39:30 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x188so1000394pfd.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=70RX4fEXvRLYGB06fr/fHQHaV0nPizREBhfk8MzdhCo=;
        b=AWAC++63DxcSHJT7XBd0HK9GRcQJO0IVyJ5+JMzbEZRQ51LkGmCyZOwPVEkYFzUHyn
         tEfJ/+w2PowIKOwB+apcvtOms6ujVLp3CMTm3Ww9FnydgUOGtfd4ndxmJvVB1N986aAt
         TiWt046/YtCMBk4tbPSJmIdGZFtgIoXhi9qsbCrMYs2fYic3EPTI1FXPoN0KGObA+Abv
         GVg3ECoPbCMBEkJRubDaA7TyvoOpqILiHj066vJOL7LJ30HYX4kB73WLMMLVAXybV2pI
         z4TRV3cMvUsTQlhfy01R1KVQ0pmXmJ06fP35CHr3Lu53fhDUd2/jOuhE2cQsNNdOFeFW
         NbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=70RX4fEXvRLYGB06fr/fHQHaV0nPizREBhfk8MzdhCo=;
        b=N6IVO17GekzcviVjDlaRH/VPiiwXc6t0KMMoDgVUHyGRh2lmi02sTnOAsJFLAttwI5
         0S/EGpqQwpZiPQgpEEOqgZ+W3tbhUyHBkOC+SkmkVrkwswpCz6A20P8vMXkKRpFhGlP+
         /GL/ygr0n9YrvupmBa1L/k/KTD3K3lTSnUbSIfyoba6+4L1IKhuDhc71FWN+KJKP3t2C
         F+Ht/+9ycrGrtou1Wzpl2YZ5+tZIVCrih+yZCY7iChkGFaQQo5cS88rpjf4/VEjNsZLS
         x06832q9CmvSBSq87NnR4pG222Za7UyB8MWIAc3l3gMkpMnYyiKhC+RhuJt44yQQ6U4b
         x2jQ==
X-Gm-Message-State: AOAM531qd0dCOrehhjhN/zhWk1Z0TuzzG5235mAt8zyARY9oJuZOIqWu
        Tyc12MbUG1dl/djDzFEYiYZg4nq/pyOH6A==
X-Google-Smtp-Source: ABdhPJy0wa7prP11BAjQQZEdn+s9c7kS/ZuUUczKw1+QNf59fqvpmGhB63f52BYGYQcUoQ4zHZktuw==
X-Received: by 2002:a65:4608:: with SMTP id v8mr4462698pgq.435.1622133568994;
        Thu, 27 May 2021 09:39:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mj7sm2376200pjb.47.2021.05.27.09.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 09:39:28 -0700 (PDT)
Message-ID: <60afcb40.1c69fb81.59efd.829a@mx.google.com>
Date:   Thu, 27 May 2021 09:39:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-27-v5.13-rc3
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 12 regressions (renesas-devel-2021-05-27-v5.13-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 12 regressions (renesas-devel-2021=
-05-27-v5.13-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 12       =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-27-v5.13-rc3/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-27-v5.13-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      526d21d2400220747c84b171477371984e3d1671

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  bf08984682a2bc7c4a1e01dd2af8d4c1d75cea46
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  126a3f6fc0e97786e2819085efc84e741093aed5 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 12       =
  =


  Details:     https://kernelci.org/test/plan/id/60afb7a9adc5066324b3afc1

  Results:     68 PASS, 28 FAIL, 138 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210503.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/60afb7aaadc5066324b3b01d
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:05.727000+00:00  on igt_require_pipe, file ../lib/igt_=
kms.c:2094:
    2021-05-27 15:14:05.735000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:05.739000+00:00  Pipe F does not exist or not enabled
    2021-05-27 15:14:05.758000+00:00  <6>[   86.791219] Console: switching =
to colour dummy device 80x25
    2021-05-27 15:14:05.764000+00:00  <14>[   86.798758] [IGT] kms_vblank: =
executing
    2021-05-27 15:14:05.777000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc3 aarch64)<14>[   86.804954] [IGT] kms_vblank: starting su=
btest pipe-A-accuracy-idle
    2021-05-27 15:14:05.778000+00:00  =

    2021-05-27 15:14:05.782000+00:00  Starting subtest: pipe-A-accuracy-idle
    2021-05-27 15:14:05.860000+00:00  Beginning pipe-A-accuracy-idle on pip=
e A, connector eDP-1
    2021-05-27 15:14:06.249000+00:00  (kms_vblank:567) CRITICAL: Test asser=
tion failure function accuracy, file ../tests/kms_vblank.c:248: =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/60afb7aaadc5066324b3b01e
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:06.919000+00:00  <14>[   87.954482] [IGT] kms_vblank: =
executing
    2021-05-27 15:14:06.934000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc3 aarch64)<14>[   87.961513] [IGT] kms_vblank: starting su=
btest pipe-A-query-idle
    2021-05-27 15:14:06.934000+00:00  =

    2021-05-27 15:14:06.938000+00:00  Starting subtest: pipe-A-query-idle
    2021-05-27 15:14:07.011000+00:00  Beginning pipe-A-query-idle on pipe A=
, connector eDP-1
    2021-05-27 15:14:07.398000+00:00  (kms_vblank:570) CRITICAL: Test asser=
tion failure function vblank_query, file ../tests/kms_vblank.c:283:
    2021-05-27 15:14:07.404000+00:00  (kms_vblank:570) CRITICAL: Failed ass=
ertion: wait_vblank(fd, &vbl) =3D=3D 0
    2021-05-27 15:14:07.410000+00:00  (kms_vblank:570) CRITICAL: Last errno=
: 22, Invalid argument
    2021-05-27 15:14:07.416000+00:00  (kms_vblank:570) CRITICAL: error: -22=
 !=3D 0
    2021-05-27 15:14:07.416000+00:00  Stack trace: =

    ... (66 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/60afb7aaadc5066324b3b020
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:08.095000+00:00   !display->pipes[pipe].enabled)
    2021-05-27 15:14:08.098000+00:00  Pipe D does not exist or not enabled
    2021-05-27 15:14:08.107000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-27 15:14:08.115000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:08.118000+00:00  Pipe E does not exist or not enabled
    2021-05-27 15:14:08.129000+00:00  Test requirement not met in function =
igt_requir<6>[   89.158695] Console: switching to colour dummy device 80x25
    2021-05-27 15:14:08.133000+00:00  e_pipe, file ../lib/igt_kms.c:2094:
    2021-05-27 15:14:08.140000+00:00  Test requirement: !(pipe >=3D<14>[   =
89.169856] [IGT] kms_vblank: executing
    2021-05-27 15:14:08.145000+00:00   display->n_pipes || !display->pipes[=
pipe].enabled)
    2021-05-27 15:14:08.154000+00:00  Pipe F does<14>[   89.181635] [IGT] k=
ms_vblank: starting subtest pipe-A-query-forked =

    ... (120 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/60afb7aaadc5066324b3b022
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:09.375000+00:00  ipe].enabled)
    2021-05-27 15:14:09.379000+00:00  Pipe D does not exist or not enabled
    2021-05-27 15:14:09.387000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-27 15:14:09.394000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:09.397000+00:00  Pipe E does not exist or not enabled
    2021-05-27 15:14:09.411000+00:00  Test requirement not met in function =
igt_require_pipe, file ../li<6>[   90.440335] Console: switching to colour =
dummy device 80x25
    2021-05-27 15:14:09.412000+00:00  b/igt_kms.c:2094:
    2021-05-27 15:14:09.422000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes <14>[   90.451302] [IGT] kms_vblank: executing
    2021-05-27 15:14:09.425000+00:00  || !display->pipes[pipe].enabled)
    2021-05-27 15:14:09.434000+00:00  Pipe F does not exist or not <14>[   =
90.462931] [IGT] kms_vblank: starting subtest pipe-A-query-busy =

    ... (75 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/60afb7aaadc5066324b3b024
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:10.593000+00:00  .enabled)
    2021-05-27 15:14:10.596000+00:00  Pipe D does not exist or not enabled
    2021-05-27 15:14:10.605000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-27 15:14:10.612000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:10.616000+00:00  Pipe E does not exist or not enabled
    2021-05-27 15:14:10.629000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/ig<6>[   91.659097] Console: switching to col=
our dummy device 80x25
    2021-05-27 15:14:10.630000+00:00  t_kms.c:2094:
    2021-05-27 15:14:10.640000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !<14>[   91.669799] [IGT] kms_vblank: executing
    2021-05-27 15:14:10.643000+00:00  display->pipes[pipe].enabled)
    2021-05-27 15:14:10.654000+00:00  Pipe F does not exist or not enab<14>=
[   91.681598] [IGT] kms_vblank: starting subtest pipe-A-query-forked-busy =

    ... (119 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/60afb7aaadc5066324b3b026
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:11.888000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:11.892000+00:00  Pipe E does not exist or not enabled
    2021-05-27 15:14:11.900000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-27 15:14:11.908000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:11.915000+00:00  Pipe<6>[   92.943018] Console: switch=
ing to colour dummy device 80x25
    2021-05-27 15:14:11.918000+00:00   F does not exist or not enabled
    2021-05-27 15:14:11.922000+00:00  <14>[   92.954803] [IGT] kms_vblank: =
executing
    2021-05-27 15:14:11.936000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc3 aarch64)<14>[   92.963876] [IGT] kms_vblank: starting su=
btest pipe-A-wait-idle
    2021-05-27 15:14:11.937000+00:00  =

    2021-05-27 15:14:11.940000+00:00  Starting subtest: pipe-A-wait-idle =

    ... (72 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/60afb7aaadc5066324b3b028
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:13.167000+00:00  Pipe D does not exist or not enabled
    2021-05-27 15:14:13.175000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-27 15:14:13.182000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:13.186000+00:00  Pipe E does not exist or not enabled
    2021-05-27 15:14:13.194000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-27 15:14:13.202000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:13.209000+00:00  Pipe F does <6>[   94.236512] Console=
: switching to colour dummy device 80x25
    2021-05-27 15:14:13.212000+00:00  not exist or not enabled
    2021-05-27 15:14:13.217000+00:00  <14>[   94.249973] [IGT] kms_vblank: =
executing
    2021-05-27 15:14:13.230000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc3 aarch64)<14>[   94.258205] [IGT] kms_vblank: starting su=
btest pipe-A-wait-forked =

    ... (108 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/60afb7aaadc5066324b3b02a
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:14.410000+00:00  e].enabled)
    2021-05-27 15:14:14.414000+00:00  Pipe D does not exist or not enabled
    2021-05-27 15:14:14.422000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-27 15:14:14.429000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:14.433000+00:00  Pipe E does not exist or not enabled
    2021-05-27 15:14:14.446000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/<6>[   95.476177] Console: switching to colou=
r dummy device 80x25
    2021-05-27 15:14:14.448000+00:00  igt_kms.c:2094:
    2021-05-27 15:14:14.457000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes ||<14>[   95.486124] [IGT] kms_vblank: executing
    2021-05-27 15:14:14.460000+00:00   !display->pipes[pipe].enabled)
    2021-05-27 15:14:14.471000+00:00  Pipe F does not exist or not en<14>[ =
  95.499174] [IGT] kms_vblank: starting subtest pipe-A-wait-busy =

    ... (75 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/60afb7aaadc5066324b3b02c
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:15.711000+00:00  Pipe D does not exist or not enabled
    2021-05-27 15:14:15.720000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_kms.c:2094:
    2021-05-27 15:14:15.728000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !display->pipes[pipe].enabled)
    2021-05-27 15:14:15.732000+00:00  Pipe E does not exist or not enabled
    2021-05-27 15:14:15.745000+00:00  Test requirement not met in function =
igt_require_pipe, file ../lib/igt_<6>[   96.775926] Console: switching to c=
olour dummy device 80x25
    2021-05-27 15:14:15.746000+00:00  kms.c:2094:
    2021-05-27 15:14:15.756000+00:00  Test requirement: !(pipe >=3D display=
->n_pipes || !di<14>[   96.785866] [IGT] kms_vblank: executing
    2021-05-27 15:14:15.759000+00:00  splay->pipes[pipe].enabled)
    2021-05-27 15:14:15.770000+00:00  Pipe F does not exist or not enable<1=
4>[   96.797650] [IGT] kms_vblank: starting subtest pipe-A-wait-forked-busy
    2021-05-27 15:14:15.771000+00:00  d =

    ... (107 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60afb7aaadc5066324b3b032
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3)

    2021-05-27 15:14:35.409000+00:00  <14>[  100.972050] [IGT] kms_vblank: =
executing
    2021-05-27 15:14:35.424000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc3 aarch64)<14>[  100.978424] [IGT] kms_vblank: starting su=
btest pipe-A-ts-continuation-suspend
    2021-05-27 15:14:35.425000+00:00  =

    2021-05-27 15:14:35.430000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-05-27 15:14:35.506000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-05-27 15:14:35.537000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-05-27 15:14:35.544000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Thu May 27 14:28:49 2021
    2021-05-27 15:14:35.556000+00:00  <6>[  101.119811] PM: suspend entry (=
deep)
    2021-05-27 15:14:35.562000+00:00  <6>[  101.124223] Filesystems sync: 0=
.000 seconds
    2021-05-27 15:14:35.572000+00:00  <6>[  101.130171] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/60afb7aaadc5066324b3b04a
        failing since 80 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-27 15:15:22.730000+00:00  <14>[  133.449837] [IGT] kms_vblank: =
executing
    2021-05-27 15:15:22.736000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc3 aarch64)
    2021-05-27 15:15:22.854000+00:00  <14>[  133.570705] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-dpms-suspend
    2021-05-27 15:15:22.860000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-dpms-suspend
    2021-05-27 15:15:23.810000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:44=
47:
    2021-05-27 15:15:23.818000+00:00  (kms_vblank:779) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-05-27 15:15:23.825000+00:00  (kms_vblank:779) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-05-27 15:15:23.826000+00:00  Stack trace:
    2021-05-27 15:15:23.832000+00:00    #0 ../lib/igt_core.c:1745 __igt_fai=
l_assert()
    2021-05-27 15:15:23.835000+00:00    #1 [igt_wait_for_vblank+0x4c] =

    ... (62 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-modeset: https://ker=
nelci.org/test/case/id/60afb7aaadc5066324b3b04c
        failing since 80 days (last pass: renesas-devel-2021-02-15-v5.11, f=
irst fail: v5.12-rc2-394-g4e589d84c742)

    2021-05-27 15:15:27.541000+00:00  <14>[  138.261524] [IGT] kms_vblank: =
executing
    2021-05-27 15:15:27.548000+00:00  IGT-Version: 1.26-g126a3f6 (aarch64) =
(Linux: 5.13.0-rc3 aarch64)
    2021-05-27 15:15:27.708000+00:00  <14>[  138.424277] [IGT] kms_vblank: =
starting subtest pipe-B-ts-continuation-modeset
    2021-05-27 15:15:27.712000+00:00  Starting subtest: pipe-B-ts-continuat=
ion-modeset
    2021-05-27 15:15:28.663000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Te=
st assertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:44=
47:
    2021-05-27 15:15:28.672000+00:00  (kms_vblank:785) igt_kms-CRITICAL: Fa=
iled assertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2021-05-27 15:15:28.678000+00:00  (kms_vblank:785) igt_kms-CRITICAL: La=
st errno: 22, Invalid argument
    2021-05-27 15:15:28.681000+00:00  Stack trace:
    2021-05-27 15:15:28.688000+00:00    #0 ../lib/igt_cor<14>[  139.401885]=
 [IGT] kms_vblank: exiting, ret=3D98
    2021-05-27 15:15:28.690000+00:00  e.c:1745 __igt_fail_assert() =

    ... (62 line(s) more)  =

 =20
