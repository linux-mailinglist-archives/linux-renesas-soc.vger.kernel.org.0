Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A448C67D882
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 23:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjAZWfq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 17:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjAZWfp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 17:35:45 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B533530E5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:35:04 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id be8so3207423plb.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4U7H0SzNFBbY4mplI53jwmmS+FyZnVpQZRoxHWvEHEQ=;
        b=YMIHuL5NBUcWTXhCOfuWYyiCHwBVwrW3o5RhnyW3eZVxjHklChVVgpzFYYUOGJ1U6s
         JHMlCEaWoTg3cdYa1vE03GKZtEDd49JFSaFK9tSj44BVYi2vamo3VlUgHwEmg1vafCr7
         exbsRRt4bUHVHswHSGo+EAWTnVqqzmhwF/axc5Id70PIEJPQ0jeafQj34KYb21Eh3+wE
         T9EWcFetSuSFaOq75K50ZCV7Jk7zWYlpKdKffurcGTcXfUlDdCPlNFMabtz1ljAfxG2c
         +jrfhP1wmogVlBbSPmM9VvyM9Yu0L3NPCI2NFaxmZC81GfW2ji5gBN+ENfkb+K8J1LXq
         2ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4U7H0SzNFBbY4mplI53jwmmS+FyZnVpQZRoxHWvEHEQ=;
        b=nh4ZryXClysduTI4sXZE/wxGMFDnsnrGwOe1nB5ih3swKt6glEjYZehM2u6AHtMdam
         OCqnwEZpSqhjtuCpdMucFoemBVj1RGKvLw+uvRu/N9fHNEJhfd5OZ3su8A5E/0ybWa34
         ZDyk1x/T5Vh8HEQssWSnKdHRhlbu9HnRXRSFu8FAq10ElAjd5vgDkWr8b4lMg99KLquL
         c0qoQvu5QrNo0Wf9DZhUaIaY7RNWlsrb/7qSQByvooBZTCqPi0tsvQxhIpID7lSUTlRT
         ki2KsP/5ASVsfstmaemdXGPmzd/2i4/3JdWgBRbj+hmf2gELIGHPU5pvDqmpaRPtoaWh
         Wlhg==
X-Gm-Message-State: AO0yUKVKrOSIDRAKTCrmJ9fO9JmU3rbviKz92/K3dmEXjnJqlGHllrfh
        WbLuEhGwiaCLj0jLo1w+UCNqVxZHnpc4dw4WYhyErw==
X-Google-Smtp-Source: AK7set9+MKvkJicP5tXnR40AWGodfG9JKXoj8kVdGarOMstYEqGJ+6IHuLeNXtb+45VW4y2dHr5OCQ==
X-Received: by 2002:a05:6a20:658a:b0:b0:3329:c395 with SMTP id p10-20020a056a20658a00b000b03329c395mr3047005pzh.30.1674772484079;
        Thu, 26 Jan 2023 14:34:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c9-20020a6566c9000000b0046ff3634a78sm1182459pgw.71.2023.01.26.14.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 14:34:43 -0800 (PST)
Message-ID: <63d30003.650a0220.256a1.234c@mx.google.com>
Date:   Thu, 26 Jan 2023 14:34:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-26-v6.2-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2023-01-26-v6.2-rc5)
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
-01-26-v6.2-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-26-v6.2-rc5/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-26-v6.2-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      635b2020aa8744f7174ce492c342357cb34c9e86

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


  Details:     https://kernelci.org/test/plan/id/63d2edd8ea5ac00acb915eda

  Results:     66 PASS, 23 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230120.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/63d2edd8ea5ac00acb915f67
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:49.157703   requirement not met in function igt_requir=
e_pipe, file ../lib/igt_kms.c:2358:
    2023-01-26T21:14:49.166003  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-26T21:14:49.168771  Pipe F does not exist or not enabled
    2023-01-26T21:14:49.169528  =

    2023-01-26T21:14:49.177929  <6>[   68.935202] Console: switching to col=
our dummy device 80x25
    2023-01-26T21:14:49.183551  <14>[   68.941835] [IGT] kms_vblank: execut=
ing
    2023-01-26T21:14:49.196852  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   68.947705] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked-busy
    2023-01-26T21:14:49.197567  =

    2023-01-26T21:14:49.197836  )
    2023-01-26T21:14:49.201306  Starting subtest: pipe-A-wait-forked-busy =

    ... (146 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/63d2edd8ea5ac00acb915f69
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:47.861722  ib/igt_kms.c:2358:
    2023-01-26T21:14:47.869380  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-26T21:14:47.873142  Pipe F does not exist or not enabled
    2023-01-26T21:14:47.901636  <6>[   67.658740] Console: switching to col=
our dummy device 80x25
    2023-01-26T21:14:47.906636  <14>[   67.665881] [IGT] kms_vblank: execut=
ing
    2023-01-26T21:14:47.920918  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   67.672469] [IGT] kms_vblank: starting subtest =
pipe-A-wait-busy
    2023-01-26T21:14:47.921009  )
    2023-01-26T21:14:47.921383  =

    2023-01-26T21:14:47.924807  Starting subtest: pipe-A-wait-busy
    2023-01-26T21:14:48.017607  Beginning pipe-A-wait-busy on pipe A, conne=
ctor eDP-1 =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/63d2edd8ea5ac00acb915f6b
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:46.583993  <8>[   66.339108] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-wait-idle-hang RESULT=3Dskip>
    2023-01-26T21:14:46.616498  <6>[   66.373782] Console: switching to col=
our dummy device 80x25
    2023-01-26T21:14:46.621888  <14>[   66.380400] [IGT] kms_vblank: execut=
ing
    2023-01-26T21:14:46.634987  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   66.386166] [IGT] kms_vblank: starting subtest =
pipe-A-wait-forked
    2023-01-26T21:14:46.635255  )
    2023-01-26T21:14:46.639827  Starting subtest: pipe-A-wait-forked
    2023-01-26T21:14:46.717754  Beginning pipe-A-wait-forked on pipe A, con=
nector eDP-1
    2023-01-26T21:14:46.718040  =

    2023-01-26T21:14:46.991576  (kms_vblank:594) CRITICAL: Test assertion f=
ailure function vblank_wait, file ../tests/kms_vblank.c:319:
    2023-01-26T21:14:46.991890   =

    ... (141 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/63d2edd8ea5ac00acb915f6d
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:45.255966  pipes || !display->pipes[pipe].enabled)
    2023-01-26T21:14:45.259660  Pipe D does not exist or not enabled
    2023-01-26T21:14:45.267692  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2358:
    2023-01-26T21:14:45.275758  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-26T21:14:45.283128  Pipe E does n<6>[   65.039503] Console: swi=
tching to colour dummy device 80x25
    2023-01-26T21:14:45.286359  ot exist or not enabled
    2023-01-26T21:14:45.294121  Test requirement not met in function ig<14>=
[   65.047043] [IGT] kms_vblank: executing
    2023-01-26T21:14:45.299318  t_require_pipe, file ../lib/igt_kms.c:2358:
    2023-01-26T21:14:45.307301  Test requirement: !<14>[   65.059018] [IGT]=
 kms_vblank: starting subtest pipe-A-wait-idle
    2023-01-26T21:14:45.313621  (pipe >=3D display->n_pipes || !display->pi=
pes[pipe].enabled) =

    ... (112 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/63d2edd8ea5ac00acb915f6f
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:43.961722  led
    2023-01-26T21:14:43.999560  <6>[   63.756741] Console: switching to col=
our dummy device 80x25
    2023-01-26T21:14:44.004333  <14>[   63.763428] [IGT] kms_vblank: execut=
ing
    2023-01-26T21:14:44.004594  =

    2023-01-26T21:14:44.018430  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   63.769802] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked-busy
    2023-01-26T21:14:44.019378  )
    2023-01-26T21:14:44.023744  Starting subtest: pipe-A-query-forked-busy
    2023-01-26T21:14:44.119086  Beginning pipe-A-query-forked-busy on pipe =
A, connector eDP-1
    2023-01-26T21:14:44.119369  =

    2023-01-26T21:14:44.423050  (kms_vblank:577) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290: =

    ... (143 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/63d2edd8ea5ac00acb915f71
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:42.729983  =

    2023-01-26T21:14:42.732999  _pipe, file ../lib/igt_kms.c:2358:
    2023-01-26T21:14:42.741138  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2023-01-26T21:14:42.744498  Pipe F does not exist or not enabled
    2023-01-26T21:14:42.774122  <6>[   62.531072] Console: switching to col=
our dummy device 80x25
    2023-01-26T21:14:42.779174  <14>[   62.537767] [IGT] kms_vblank: execut=
ing
    2023-01-26T21:14:42.792543  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   62.544331] [IGT] kms_vblank: starting subtest =
pipe-A-query-busy
    2023-01-26T21:14:42.793188  )
    2023-01-26T21:14:42.796716  Starting subtest: pipe-A-query-busy
    2023-01-26T21:14:42.885518  Beginning pipe-A-query-busy on pipe A, conn=
ector eDP-1 =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/63d2edd8ea5ac00acb915f73
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:41.366061  =

    2023-01-26T21:14:41.400906  <6>[   61.158142] Console: switching to col=
our dummy device 80x25
    2023-01-26T21:14:41.401189  =

    2023-01-26T21:14:41.405650  <14>[   61.164831] [IGT] kms_vblank: execut=
ing
    2023-01-26T21:14:41.419219  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   61.171391] [IGT] kms_vblank: starting subtest =
pipe-A-query-forked
    2023-01-26T21:14:41.419486  =

    2023-01-26T21:14:41.419911  )
    2023-01-26T21:14:41.423952  Starting subtest: pipe-A-query-forked
    2023-01-26T21:14:41.518981  Beginning pipe-A-query-forked on pipe A, co=
nnector eDP-1
    2023-01-26T21:14:41.519436   =

    ... (143 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/63d2edd8ea5ac00acb915f75
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:40.058640  <8>[   59.813300] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2023-01-26T21:14:40.089472  <6>[   59.846924] Console: switching to col=
our dummy device 80x25
    2023-01-26T21:14:40.089753  =

    2023-01-26T21:14:40.095332  <14>[   59.853556] [IGT] kms_vblank: execut=
ing
    2023-01-26T21:14:40.108140  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   59.859326] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle
    2023-01-26T21:14:40.108529  )
    2023-01-26T21:14:40.112346  Starting subtest: pipe-A-query-idle
    2023-01-26T21:14:40.202406  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2023-01-26T21:14:40.202740  =

    2023-01-26T21:14:40.625254  (kms_vblank:551) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290: =

    ... (103 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/63d2edd8ea5ac00acb915f76
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:38.662398  <8>[   58.418545] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>
    2023-01-26T21:14:38.705766  <6>[   58.462290] Console: switching to col=
our dummy device 80x25
    2023-01-26T21:14:38.710083  <14>[   58.469012] [IGT] kms_vblank: execut=
ing
    2023-01-26T21:14:38.724323  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   58.477064] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle
    2023-01-26T21:14:38.724806  )
    2023-01-26T21:14:38.725061  =

    2023-01-26T21:14:38.728892  Starting subtest: pipe-A-accuracy-idle
    2023-01-26T21:14:38.820120  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2023-01-26T21:14:39.309052  (kms_vblank:547) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2023-01-26T21:14:39.315943  (kms_vblank:547) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0 =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
3d2edd8ea5ac00acb915f7f
        failing since 223 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2023-01-26T21:14:34.603813  <8>[   54.362464] <LAVA_SIGNAL_TESTSET STOP>
    2023-01-26T21:14:34.643075  <8>[   54.400241] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2023-01-26T21:14:34.678672  <6>[   54.435788] Console: switching to col=
our dummy device 80x25
    2023-01-26T21:14:34.679508  =

    2023-01-26T21:14:34.683687  <14>[   54.442455] [IGT] kms_setmode: execu=
ting
    2023-01-26T21:14:34.696704  IGT-Version: 1.27.1-g7816773 (aarch64) (Lin=
ux: 6.2.0-rc5 aarch64<14>[   54.447903] [IGT] kms_setmode: starting subtest=
 basic
    2023-01-26T21:14:34.697207  )
    2023-01-26T21:14:34.699669  Starting subtest: basic
    2023-01-26T21:14:34.703214  Testing: basic 1 connector combinations
    2023-01-26T21:14:34.811137  <14>[   54.566738] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1 =

    ... (91 line(s) more)  =

 =20
