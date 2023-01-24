Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A46A679D69
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 16:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbjAXP07 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 10:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbjAXP06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 10:26:58 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0670125B1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 07:26:56 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id b12so11503998pgj.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 07:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OW0sX2n8SH0WOB0ESvKViQglAshru9c8MVWPC+zQvZU=;
        b=OuuBMpHPe4jabf+DAVhyYQu7VgVKpl5kWVgh4YoW51TJwN+fL1VucflvrrutZHQcUj
         vRNpjIVDCAxYlH5q7+uh9mv/X3MS3Rs39384uaSt03WBqTSxUnitwzcAReuXKlbKAnWS
         alW7OsiJR2scpFXZaRRwPT5SejheM2NrLvklD0RpitrBhT/RwD6/2jTaDF6+o8R9SNTg
         o4j9TchPQA+UrK3aXLjpg1KnpBkNQdRTIbzv67FBSqa7PhPQOa0jY80pFE5stGz9gmRS
         ttdaXpTGzUPrxcLxGEsMlqWE4vTEqv9dkV7CtgeK0Mluyn9xiRaZ+6HKCbGdRPA48rVy
         Vomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW0sX2n8SH0WOB0ESvKViQglAshru9c8MVWPC+zQvZU=;
        b=xzoqs6UykE2bL94CrjyU0idNLpQUBjlDjg8mf4iiyyyY2xLr9MiCJ5LzjA/FLaKjJ2
         Efniw4CEVuiWRD+spzOcgbOHRIH1eGFBTH0wC5h3X8eB/zRmh9iENtCt3z/pXHyGM9wA
         9C52yV9IFG/PGFZtur6jg4YIx0vYuPuaKPzJUc/Nwkc1hVXlTenWaXaSitDGQ3yga/OU
         f2uLyejls3xSDOX+QoHgpOASJ2Bx3kA9M21zXm2tHtEHbpXprVDx/n0MHSwVBBH9q7pt
         MeuuPUKZ1zraWriHZHz1I1Q4etnZMCY2Vmg96GXbbvNe9cLFEgOwqkDNekNAjrGVD9xQ
         v51Q==
X-Gm-Message-State: AFqh2koB0MeNlZP3rseYL4+HNOcWQ1xaeE0t0vRkAtmkzEyAPjI+IPYY
        qycAftflNVNvWNKihmVwwPpDKNLm/B1gXHBujI8=
X-Google-Smtp-Source: AMrXdXuTjTmka3IvawWdZaoNMvg1LpXX/wggBeHORmLV2LL5Gv274HZx6+o1+kTkMgDF/a+2/UqTJw==
X-Received: by 2002:a05:6a00:438c:b0:58d:a0ad:6d72 with SMTP id bt12-20020a056a00438c00b0058da0ad6d72mr33937379pfb.17.1674574015964;
        Tue, 24 Jan 2023 07:26:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x15-20020aa7956f000000b0058ba6f416besm1720952pfq.183.2023.01.24.07.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 07:26:55 -0800 (PST)
Message-ID: <63cff8bf.a70a0220.d5212.28ad@mx.google.com>
Date:   Tue, 24 Jan 2023 07:26:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-24-v6.2-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-01-24-v6.2-rc5)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-01-24-v6.2-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-24-v6.2-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-24-v6.2-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f23ed7e4efa3e68c99d217f9dc00fc689c7e661d

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  0e2c7d05712d65903a9b77fb9f960ddff43bac64
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  7816773163a1b0d248dd9dd34d14e632ad8903be =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/63cfe773860c494357915fab

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230120.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63cfe774860c494357916038
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:11:05.860986  !display->pipes[pipe].enabled)
    2023-01-24T14:11:05.864743  Pipe F does not exist or not enabled
    2023-01-24T14:11:05.898640  <6>[   68.191539] Console: switching to col=
our dummy device 80x25
    2023-01-24T14:11:05.903917  <14>[   68.198235] [IGT] kms_vblank: execut=
ing
    2023-01-24T14:11:05.917468  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   68.204790] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy
    2023-01-24T14:11:05.918537  )
    2023-01-24T14:11:05.922146  Starting subtest: pipe-A-wait-forked-busy
    2023-01-24T14:11:06.010948  Beginning pipe-A-wait-forked-busy on pipe A=
, connector eDP-1
    2023-01-24T14:11:06.249166  (kms_vblank:608) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
    2023-01-24T14:11:06.259603  (kms_vblank:610) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319: =

    ... (134 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63cfe774860c49435791603a
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:11:04.639092  s not exist or not enabled
    2023-01-24T14:11:04.639795  =

    2023-01-24T14:11:04.659598  <6>[   66.952100] Console: switching to col=
our dummy device 80x25
    2023-01-24T14:11:04.664169  <14>[   66.958744] [IGT] kms_vblank: execut=
ing
    2023-01-24T14:11:04.678156  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   66.964485] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy
    2023-01-24T14:11:04.678330  )
    2023-01-24T14:11:04.682091  Starting subtest: pipe-A-wait-busy
    2023-01-24T14:11:04.760363  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1
    2023-01-24T14:11:05.017312  (kms_vblank:601) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
    2023-01-24T14:11:05.024683  (kms_vblank:601) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (101 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63cfe774860c49435791603c
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:11:03.404729  <8>[   65.695149] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2023-01-24T14:11:03.405346  =

    2023-01-24T14:11:03.429997  <6>[   65.722474] Console: switching to col=
our dummy device 80x25
    2023-01-24T14:11:03.430333  =

    2023-01-24T14:11:03.435177  <14>[   65.729166] [IGT] kms_vblank: execut=
ing
    2023-01-24T14:11:03.448994  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   65.734930] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked
    2023-01-24T14:11:03.449117  )
    2023-01-24T14:11:03.452979  Starting subtest: pipe-A-wait-forked
    2023-01-24T14:11:03.544543  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1
    2023-01-24T14:11:03.799836  (kms_vblank:591) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319: =

    ... (138 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63cfe774860c49435791603e
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:11:02.144031  =

    2023-01-24T14:11:02.149455  t: !(pipe >=3D display->n_pipes || !display=
->pipes[pipe].enabled)
    2023-01-24T14:11:02.153791  Pipe F does not exist or not enabled
    2023-01-24T14:11:02.171368  <6>[   64.464232] Console: switching to col=
our dummy device 80x25
    2023-01-24T14:11:02.176615  <14>[   64.470849] [IGT] kms_vblank: execut=
ing
    2023-01-24T14:11:02.190379  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   64.476587] [IGT] kms_vblank: starting subtest =
pipe-A-wait-idle
    2023-01-24T14:11:02.190494  )
    2023-01-24T14:11:02.193827  Starting subtest: pipe-A-wait-idle
    2023-01-24T14:11:02.277861  Beginning pipe-A-wait-idle on pipe A, conne=
ctor eDP-1
    2023-01-24T14:11:02.278481   =

    ... (99 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63cfe774860c494357916040
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:11:00.807216  Pipe F does not exist or not e<8>[   63.092=
882] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-busy-hang RESULT=3Ds=
kip>
    2023-01-24T14:11:00.808099  nabled
    2023-01-24T14:11:00.841729  <6>[   63.134478] Console: switching to col=
our dummy device 80x25
    2023-01-24T14:11:00.847161  <14>[   63.141723] [IGT] kms_vblank: execut=
ing
    2023-01-24T14:11:00.861502  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   63.148279] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy
    2023-01-24T14:11:00.862187  )
    2023-01-24T14:11:00.862722  =

    2023-01-24T14:11:00.866368  Starting subtest: pipe-A-query-forked-busy
    2023-01-24T14:11:00.962230  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1
    2023-01-24T14:11:01.284415  (kms_vblank:572) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290: =

    ... (147 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63cfe774860c494357916042
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:10:59.588125  enabled)
    2023-01-24T14:10:59.591435  Pipe C does not exist or not enabled
    2023-01-24T14:10:59.599415  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2023-01-24T14:10:59.606748  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-24T14:10:59.611255  Pipe D does not exist or not enabled
    2023-01-24T14:10:59.624103  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt<6>[   61.910490] Console: switching to colour d=
ummy device 80x25
    2023-01-24T14:10:59.625373  _kms.c:2358:
    2023-01-24T14:10:59.626119  =

    2023-01-24T14:10:59.634653  Test requirement: !(pipe >=3D display->n_pi=
pes || !d<14>[   61.922874] [IGT] kms_vblank: executing
    2023-01-24T14:10:59.637461  isplay->pipes[pipe].enabled) =

    ... (105 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63cfe774860c494357916044
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:10:58.274481  nabled
    2023-01-24T14:10:58.310004  <6>[   60.601711] Console: switching to col=
our dummy device 80x25
    2023-01-24T14:10:58.314656  <14>[   60.609071] [IGT] kms_vblank: execut=
ing
    2023-01-24T14:10:58.329334  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   60.615576] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked
    2023-01-24T14:10:58.329824  )
    2023-01-24T14:10:58.330560  =

    2023-01-24T14:10:58.332629  Starting subtest: pipe-A-query-forked
    2023-01-24T14:10:58.429462  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1
    2023-01-24T14:10:58.783615  (kms_vblank:557) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2023-01-24T14:10:58.784504   =

    ... (128 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63cfe774860c494357916046
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:10:56.972309  <8>[   59.262117] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2023-01-24T14:10:56.997201  <6>[   59.288928] Console: switching to col=
our dummy device 80x25
    2023-01-24T14:10:57.001221  <14>[   59.295560] [IGT] kms_vblank: execut=
ing
    2023-01-24T14:10:57.001892  =

    2023-01-24T14:10:57.007791  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64)
    2023-01-24T14:10:57.015422  <14>[   59.307033] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2023-01-24T14:10:57.018748  Starting subtest: pipe-A-query-idle
    2023-01-24T14:10:57.019030  =

    2023-01-24T14:10:57.112684  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2023-01-24T14:10:57.535220  (kms_vblank:547) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290: =

    ... (96 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63cfe774860c494357916047
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:10:55.705693  <6>[   57.997839] Console: switching to col=
our dummy device 80x25
    2023-01-24T14:10:55.710164  <14>[   58.004455] [IGT] kms_vblank: execut=
ing
    2023-01-24T14:10:55.723800  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   58.010219] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle
    2023-01-24T14:10:55.724610  =

    2023-01-24T14:10:55.725005  )
    2023-01-24T14:10:55.728012  Starting subtest: pipe-A-accuracy-idle
    2023-01-24T14:10:55.813509  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2023-01-24T14:10:56.285722  (kms_vblank:543) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2023-01-24T14:10:56.292966  (kms_vblank:543) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2023-01-24T14:10:56.298208  (kms_vblank:543) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (96 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3cfe774860c494357916050
        failing since 220 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-24T14:10:51.696522  <8>[   53.990589] <LAVA_SIGNAL_TESTSET STOP>
    2023-01-24T14:10:51.735835  <8>[   54.027497] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2023-01-24T14:10:51.772538  <6>[   54.065168] Console: switching to col=
our dummy device 80x25
    2023-01-24T14:10:51.773310  =

    2023-01-24T14:10:51.778014  <14>[   54.071901] [IGT] kms_setmode: execu=
ting
    2023-01-24T14:10:51.790536  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   54.077236] [IGT] kms_setmode: starting subtest=
 basic
    2023-01-24T14:10:51.791007  )
    2023-01-24T14:10:51.791690  =

    2023-01-24T14:10:51.793093  Starting subtest: basic
    2023-01-24T14:10:51.797682  Testing: basic 1 connector combinations =

    ... (90 line(s) more)  =

 =20
