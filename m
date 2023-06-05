Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77039722B2D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 17:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjFEPf6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 11:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233223AbjFEPf5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 11:35:57 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440AF94
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 08:35:55 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-65292f79456so2058844b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jun 2023 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685979354; x=1688571354;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fMbKOaprXMg8B2sNcMxiHDE6a/lCYIa3oZuJfN5UH/8=;
        b=axXQilPnXAomW0ZAao9+TPTooy8D7Cx0yDLuzPQORjfldjh+PrCg5+wjeWgyhjeiX2
         e+rzwbi48o2OdZU60E8vAuxvkxGJ7IwswgMmSp+9RMp1Av4+rATHHK1AEBxuCYE6r33u
         I5soEA12YoJ9mvTIaIaVj48kXO79PC+YMtVslt2zBTe2f/KHO7dVF0Y1OV01j/mkDg8C
         nYyC490XyrR41BZvGKZqxzEZPQBo6I60LtLDWmvcCJzWMLnlPxQW9jiMnxcHJPmz4UEA
         w5WdHPDwLVBkGQnbXGrQUMzeGNFyCdbGU/LtDE9Clq/Gyy73lS44lHJ6QN3QLj1izOOi
         g7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979354; x=1688571354;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMbKOaprXMg8B2sNcMxiHDE6a/lCYIa3oZuJfN5UH/8=;
        b=WOhIuG9IzeufTPmK27RFrI2NtvqkDc8j7XdBjrYvtpJBd7k7GxDeJSBv2lDuAhItaA
         BZubrzuucmUNDzBBdcCUFF1NmZYdhnOZjo7GSun4MeyWcfxwmHhavGV+FlISWNifmo2I
         4CrE0uXZ9x6mY9Z9CK7eKOLlSEGOABmciRUqCJw7TUcESIpmcnrCJEHAlQl3vB/n7IhR
         0XhTNr7LVMGuzgoOPAB+hV+1OGeWuU2nX3gOQPymMTkEkixULUR24Oeh7Xgeu1F9qMre
         P0iRaRxHE+FHSQX+4wiy5XeDQZXZ3nFYLoFDnm/0sziPUY3mnkKbAA/voGbQWUBaB8CP
         MTIg==
X-Gm-Message-State: AC+VfDxa8GQZmNeFcEH6CGgmxixCl478hAHe6JoH9VEsQkkc4lv+1788
        G13d59pVDCaDxICw7vcJ0qEJGZMkRLxAWOLBS71T5A==
X-Google-Smtp-Source: ACHHUZ5EDJ4BiBAwoV1doofjLU9aBmuRU+6+zUSIcD6pWOqIyBVgJLaBS/ignjv8ZHbFqyWrBFvmyA==
X-Received: by 2002:a05:6a20:258b:b0:111:997d:d203 with SMTP id k11-20020a056a20258b00b00111997dd203mr2742812pzd.37.1685979354045;
        Mon, 05 Jun 2023 08:35:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c4-20020aa78c04000000b00654930008dfsm3979146pfd.105.2023.06.05.08.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
Message-ID: <647e00d7.a70a0220.1203b.61f3@mx.google.com>
Date:   Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-05-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-06-05-v6.4-rc5)
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

renesas/master igt-kms-rockchip: 1 runs, 10 regressions (renesas-devel-2023=
-06-05-v6.4-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-05-v6.4-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-05-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f669ef29adafb15e4632ab82c733cdf32339a90e

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98e1db501173303e58ef6a1def94ab7a2d84afc1
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  766edf96979bf13a10c9985c007f2baca5c9e308 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/647ded08ce6e32581af5de3a

  Results:     66 PASS, 23 FAIL, 198 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/647ded08ce6e32581af5def9
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:17.808506   !(pipe >=3D display->n_pipes || !display->=
pipes[pipe].enabled)

    2023-06-05T14:09:17.811959  Pipe F does not exist or not enabled

    2023-06-05T14:09:17.820338  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-05T14:09:17.827183  Test re<6>[   59.052059] Console: switching=
 to colour dummy device 80x25

    2023-06-05T14:09:17.838055  quirement: !(pipe >=3D display->n_pipes || =
!display->pipes[pipe].e<14>[   59.059435] [IGT] kms_vblank: executing

    2023-06-05T14:09:17.839711  nabled)

    2023-06-05T14:09:17.843407  Pipe G does not exist or not enabled

    2023-06-05T14:09:17.852559  Test requirement <14>[   59.071422] [IGT] k=
ms_vblank: starting subtest pipe-A-wait-forked-busy

    2023-06-05T14:09:17.859262  not met in function igt_require_pipe, file =
../lib/igt_kms.c:2429:

    2023-06-05T14:09:17.866834  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
 =

    ... (123 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/647ded08ce6e32581af5defb
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:16.607201  nction igt_require_pipe, file ../lib/igt_km=
s.c:2429:

    2023-06-05T14:09:16.614498  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-05T14:09:16.617798  Pipe C does not exist or not enabled

    2023-06-05T14:09:16.627240  Test requirement not<6>[   57.851959] Conso=
le: switching to colour dummy device 80x25

    2023-06-05T14:09:16.631142  <14>[   57.858591] [IGT] kms_vblank: execut=
ing

    2023-06-05T14:09:16.637559   met in function igt_require_pipe, file ../=
lib/igt_kms.c:2429:

    2023-06-05T14:09:16.644673  <14>[   57.864627] [IGT] kms_vblank: starti=
ng subtest pipe-A-wait-busy

    2023-06-05T14:09:16.652944  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-05T14:09:16.656615  Pipe D does not exist or not enabled

    2023-06-05T14:09:16.665297  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:
 =

    ... (108 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/647ded08ce6e32581af5defd
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:15.388262  kms.c:2429:

    2023-06-05T14:09:15.396536  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-05T14:09:15.400499  Pipe F does not exist or not enabled

    2023-06-05T14:09:15.412752  Test requirement not met in function igt_re=
quire_pipe, file .<6>[   56.637659] Console: switching to colour dummy devi=
ce 80x25

    2023-06-05T14:09:15.416877  <14>[   56.644458] [IGT] kms_vblank: execut=
ing

    2023-06-05T14:09:15.419929  ./lib/igt_kms.c:2429:

    2023-06-05T14:09:15.431101  Test requirement: !(pipe >=3D display->n_pi=
<14>[   56.650514] [IGT] kms_vblank: starting subtest pipe-A-wait-forked

    2023-06-05T14:09:15.435223  pes || !display->pipes[pipe].enabled)

    2023-06-05T14:09:15.438917  Pipe G does not exist or not enabled

    2023-06-05T14:09:15.446920  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:
 =

    ... (121 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/647ded08ce6e32581af5deff
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:14.083057   does not exist or not enabled

    2023-06-05T14:09:14.090370  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc5 aarch64)

    2023-06-05T14:09:14.093123  Opened device: /dev/dri/card1

    2023-06-05T14:09:14.097548  Starting subtest: pipe-A-query-forked-busy-=
hang

    2023-06-05T14:09:14.107256  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_context.c:324:

    2023-06-05T14:09:14.118344  Test requirement: has_ban_period || h<6>[  =
 55.339693] Console: switching to colour dummy device 80x25

    2023-06-05T14:09:14.119190  as_bannable

    2023-06-05T14:09:14.121909  Last errno: 22, Invalid argument

    2023-06-05T14:09:14.128263  =1B[1mSubtest pipe-<14>[   55.350153] [IGT]=
 kms_vblank: executing

    2023-06-05T14:09:14.132924  A-query-forked-busy-hang: SKIP (0.000s)=1B[=
0m
 =

    ... (116 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/647ded08ce6e32581af5df01
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:12.789801  es not exist or not enabled

    2023-06-05T14:09:12.798263  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-05T14:09:12.805388  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-05T14:09:12.809429  Pipe F does not exist or not enabled

    2023-06-05T14:09:12.817502  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-05T14:09:12.824838  Test <6>[   54.047459] Console: switching t=
o colour dummy device 80x25

    2023-06-05T14:09:12.835684  requirement: !(pipe >=3D display->n_pipes |=
| !display->pipes[pipe]<14>[   54.056308] [IGT] kms_vblank: executing

    2023-06-05T14:09:12.836982  .enabled)

    2023-06-05T14:09:12.840520  Pipe G does not exist or not enabled

    2023-06-05T14:09:12.849840  Test requiremen<14>[   54.068719] [IGT] kms=
_vblank: starting subtest pipe-A-query-forked-busy
 =

    ... (125 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/647ded08ce6e32581af5df03
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:11.565687  unction gem_context_require_bannable, file =
../lib/i915/gem_context.c:324:

    2023-06-05T14:09:11.570513  Test requirement: has_ban_period || has_ban=
nable

    2023-06-05T14:09:11.573841  Last errno: 22, Invalid argument

    2023-06-05T14:09:11.579166  =1B[1mSubtest pipe-A-query-forked-hang: SKI=
P (0.000s)=1B[0m

    2023-06-05T14:09:11.587216  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-05T14:09:11.595808  Test requirement: !(<6>[   52.815213] Conso=
le: switching to colour dummy device 80x25

    2023-06-05T14:09:11.601866  pipe >=3D display->n_pipes || !display->pip=
es[pipe].enabled)

    2023-06-05T14:09:11.606202  Pipe<14>[   52.827571] [IGT] kms_vblank: ex=
ecuting

    2023-06-05T14:09:11.610439   C does not exist or not enabled

    2023-06-05T14:09:11.619555  Test requirement not met in fu<14>[   52.83=
9554] [IGT] kms_vblank: starting subtest pipe-A-query-busy
 =

    ... (107 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/647ded08ce6e32581af5df05
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:10.229186  Test requirement not met in functio<8>[   5=
1.446629] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-idle-hang RESUL=
T=3Dskip>

    2023-06-05T14:09:10.234102  n igt_require_pipe, file ../lib/igt_kms.c:2=
429:

    2023-06-05T14:09:10.241611  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)

    2023-06-05T14:09:10.245583  Pipe F does not exist or not enabled

    2023-06-05T14:09:10.253758  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2429:

    2023-06-05T14:09:10.266822  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe]<6>[   51.489421] Console: switching to colour =
dummy device 80x25

    2023-06-05T14:09:10.268197  .enabled)

    2023-06-05T14:09:10.271511  Pipe G does not exist or not enabled

    2023-06-05T14:09:10.277306  Test requiremen<14>[   51.498856] [IGT] kms=
_vblank: executing

    2023-06-05T14:09:10.290810  t not met in function igt_require_pipe, fil=
e ../lib/igt_kms.c:24<14>[   51.510936] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked
 =

    ... (127 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/647ded08ce6e32581af5df07
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:09.475412  (kms_vblank:544) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:314:

    2023-06-05T14:09:09.482620  (kms_vblank:544) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-06-05T14:09:09.488452  (kms_vblank:544) CRITICAL: Last errno: 22, =
Invalid argument

    2023-06-05T14:09:09.493130  (kms_vblank:544) CRITICAL: error: -22 !=3D 0

    2023-06-05T14:09:09.494274  Stack trace:

    2023-06-05T14:09:09.498934    #0 ../lib/igt_core.c:1963 __igt_fail_asse=
rt()

    2023-06-05T14:09:09.501220    #1 [<unknown>+0xb6a620e4]

    2023-06-05T14:09:09.504038    #2 [<unknown>+0xb6a62a5c]

    2023-06-05T14:09:09.508038    #3 [<unknown>+0xb6a632a4]

    2023-06-05T14:09:09.510230    #4 [<unknown>+0xb6a635f8]
 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/647ded08ce6e32581af5df08
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:07.671951  <6>[   48.896782] Console: switching to col=
our dummy device 80x25

    2023-06-05T14:09:07.676168  <14>[   48.903466] [IGT] kms_vblank: execut=
ing

    2023-06-05T14:09:07.690869  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc5 aarch64<14>[   48.911494] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle

    2023-06-05T14:09:07.691573  )

    2023-06-05T14:09:07.694233  Opened device: /dev/dri/card1

    2023-06-05T14:09:07.698311  Starting subtest: pipe-A-accuracy-idle

    2023-06-05T14:09:07.771158  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1

    2023-06-05T14:09:08.258753  (kms_vblank:541) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:279:

    2023-06-05T14:09:08.264871  (kms_vblank:541) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0

    2023-06-05T14:09:08.271549  (kms_vblank:541) CRITICAL: Last errno: 22, =
Invalid argument
 =

    ... (97 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
47ded08ce6e32581af5df2a
        failing since 352 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-06-05T14:09:03.663243  <8>[   44.890108] <LAVA_SIGNAL_TESTSET STOP>

    2023-06-05T14:09:03.702729  <8>[   44.928014] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>

    2023-06-05T14:09:03.734610  <6>[   44.959622] Console: switching to col=
our dummy device 80x25

    2023-06-05T14:09:03.740000  <14>[   44.966269] [IGT] kms_setmode: execu=
ting

    2023-06-05T14:09:03.751514  IGT-Version: 1.27.1-g766edf9 (aarch64) (Lin=
ux: 6.4.0-rc5 aarch64<14>[   44.971592] [IGT] kms_setmode: starting subtest=
 basic

    2023-06-05T14:09:03.752689  )

    2023-06-05T14:09:03.755306  Opened device: /dev/dri/card1

    2023-06-05T14:09:03.757635  Starting subtest: basic

    2023-06-05T14:09:03.762240  Testing: basic 1 connector combinations

    2023-06-05T14:09:03.849089  <14>[   45.072916] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1
 =

    ... (78 line(s) more)  =

 =20
