Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBCA5F31D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 16:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiJCOSG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 10:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiJCOSD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 10:18:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2384D14A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 07:18:01 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso11233691pjq.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=E15DPZA4jDlMUR9uR4OIgfwXtDZe0kQis8jnecKlDDU=;
        b=npGLNxqswxjBic0AxwJw6kX/4VvbytaxSEW9FF9wG62l5S9vH8C4TksM8G/+U2v2Fo
         j/k8VjV65ZYYR9TZjUiGMwmcRjKYQQ6sfVqZaZduMSUqBCo2urh7I+KlVUZcBt01ho0H
         8wCY/lnbpSF18BEA+J3SyQmR8WDpjFS4ApLDNDZ7uUEwpxwgFuuXNJwUU91lLJ9cMCZ7
         z0Zqo/njaXuNy1D+CPb6Z5J3hJkgQv6l+zbaafkYTjnX1nkKX4AVv35ErFiRxHod4pY0
         YBYcOgqyVbho2SvrMhe2V60I8UNv3/mm/3Fujebb06lPKlYll/sn7qoumLt3DP6wtome
         4qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=E15DPZA4jDlMUR9uR4OIgfwXtDZe0kQis8jnecKlDDU=;
        b=7ljb5+KgZjW8agKkvsA8IGwnRyKsZyA5MX9PFRL11foTrsp/jfGqhad6c+3kDjrQu1
         XmQ9Sr7k5j3v4KWgMXyUgNIlHQZJHQurcK+E5vzP10GA1VlWm9BAfsodFPCoCtWaLvPq
         GgRfSzLQdgbCFnWsiMdusZ50aTD7rGnF/hlYXVpD5BNGaW27KI4TpMicumaQZgjkG9Bo
         RU5w/7BYJsXwn5S32L6KZvC4WWabYloBbDIUN1+cHeJPrpe5jO+LYQg3NGJE2chx+UCV
         ng75wUODjkTBZRE15BjAy0orWwqxc17EfwqsRQW4Pz4ob4UpcobTiSAo/2ziSLXfvsnx
         NfkQ==
X-Gm-Message-State: ACrzQf1uEUxiHyTmazYaNjd6ntFmieaJKe9m/LYqb/8KJ1IJo7jrJnUf
        jfbLlvuagsqq6itbbwgO4OQNwl7TV033ljKgwQY=
X-Google-Smtp-Source: AMsMyM73h43xMz+FjbyszdtOAQh6IzkhHX/Eaw/h7XPp4AQzDiIsVlFlE7efGjd+CkzEOL52H0u/iA==
X-Received: by 2002:a17:90a:4d8d:b0:20a:85c0:1f2c with SMTP id m13-20020a17090a4d8d00b0020a85c01f2cmr8885321pjh.43.1664806680451;
        Mon, 03 Oct 2022 07:18:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x184-20020a6263c1000000b00541206f9379sm7678763pfb.99.2022.10.03.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 07:18:00 -0700 (PDT)
Message-ID: <633aef18.620a0220.6e22c.c405@mx.google.com>
Date:   Mon, 03 Oct 2022 07:18:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-10-03-v6.0
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 10 regressions (renesas-devel-2022-10-03-v6.0)
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
-10-03-v6.0)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-03-v6.0/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-03-v6.0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f0dbcd134f5abcdd4e2ad16bc81a158b2a23e2d9

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  474894ed17a037a464e5bd845a0765a50f647898
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  dcb1d7a8822e62935f4fe3f2e6a04caaee669369 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 10         =


  Details:     https://kernelci.org/test/plan/id/633ae666447bda4044cab87d

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-03-v6.0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220923.1/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/633ae666447bda4044cab90a
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:40.730774  quirement: !(pipe >=3D display->n_pipes || =
!display->pipes[pipe].enabled)
    2022-10-03T13:38:40.734414  Pipe D does not exist or not enabled
    2022-10-03T13:38:40.742300  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-03T13:38:40.750857  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-03T13:38:40.753951  Pipe E does not exist or not enabled
    2022-10-03T13:38:40.761083  Test re<6>[   55.875997] Console: switching=
 to colour dummy device 80x25
    2022-10-03T13:38:40.772534  quirement not met in function igt_require_p=
ipe, file ../lib/igt_<14>[   55.887008] [IGT] kms_vblank: executing
    2022-10-03T13:38:40.772981  kms.c:2302:
    2022-10-03T13:38:40.785330  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   55.900854] [IGT] kms_vblank: starting subtest pipe-A-wait=
-forked-busy
    2022-10-03T13:38:40.789021  splay->pipes[pipe].enabled) =

    ... (103 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/633ae666447bda4044cab90c
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:39.659819  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enable<8>[   54.771853] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dpipe-A-wait-forked-hang RESULT=3Dskip>
    2022-10-03T13:38:39.659915  d)
    2022-10-03T13:38:39.663355  Pipe E does not exist or not enabled
    2022-10-03T13:38:39.672196  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-03T13:38:39.679455  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-03T13:38:39.682951  Pipe F does not exist or not enabled
    2022-10-03T13:38:39.688570  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0 aarch64)
    2022-10-03T13:38:39.696801  Starting subtes<6>[   54.810021] Console: s=
witching to colour dummy device 80x25
    2022-10-03T13:38:39.700138  t: pipe-A-wait-forked-hang
    2022-10-03T13:38:39.708345  Test requirement not met in function<14>[  =
 54.822703] [IGT] kms_vblank: executing =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/633ae666447bda4044cab90e
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:38.577887  ipe C does not exist or not enabled
    2022-10-03T13:38:38.585637  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-03T13:38:38.593475  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-03T13:38:38.597287  Pipe D does not exist or not enabled
    2022-10-03T13:38:38.605723  Test requirement <6>[   53.719892] Console:=
 switching to colour dummy device 80x25
    2022-10-03T13:38:38.617174  not met in function igt_require_pipe, file =
../lib/igt_kms.c:2302<14>[   53.731428] [IGT] kms_vblank: executing
    2022-10-03T13:38:38.617445  :
    2022-10-03T13:38:38.629971  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pip<14>[   53.743212] [IGT] kms_vblank: starting subtest p=
ipe-A-wait-forked
    2022-10-03T13:38:38.631934  es[pipe].enabled)
    2022-10-03T13:38:38.635477  Pipe E does not exist or not enabled =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/633ae666447bda4044cab910
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:37.531242  t_kms-DEBUG: display:     MoveCursor pipe B=
, (0, 0)
    2022-10-03T13:38:37.535018  (kms_vblank:614) igt_kms-DEBUG: display: }
    2022-10-03T13:38:37.544214  (kms_vblank:614) igt_debugfs-DEBUG: Opening=
 debugfs directory '/sys/kernel/debug/dri/0'
    2022-10-03T13:38:37.552209  (kms_vblank:614) INFO: Beginning pipe-A-que=
ry-forked-busy on pipe A, connector eDP-1
    2022-10-03T13:38:37.556937  (kms_vblank:614) DEBUG: Spawning 6 threads
    2022-10-03T13:38:37.563640  ****<6>[   52.679116] Console: switching to=
 colour dummy device 80x25
    2022-10-03T13:38:37.565047    END  ****
    2022-10-03T13:38:37.573939  [1mSubtest pipe-A-query-forked-busy: FAIL (=
0.696s)<14>[   52.689300] [IGT] kms_vblank: executing
    2022-10-03T13:38:37.575136  [0m
    2022-10-03T13:38:37.587388  Test requirement not met in function igt_re=
quire_pipe, fil<14>[   52.701649] [IGT] kms_vblank: starting subtest pipe-A=
-wait-idle =

    ... (118 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/633ae666447bda4044cab912
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:36.512513  00s)[0m
    2022-10-03T13:38:36.520310  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-03T13:38:36.528671  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-03T13:38:36.536229  Pipe C does not ex<6>[   51.654719] Console=
: switching to colour dummy device 80x25
    2022-10-03T13:38:36.538492  ist or not enabled
    2022-10-03T13:38:36.547734  Test requirement not met in function igt_re=
q<14>[   51.662013] [IGT] kms_vblank: executing
    2022-10-03T13:38:36.551580  uire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-03T13:38:36.561031  Test requirement: !(pipe<14>[   51.673847] =
[IGT] kms_vblank: starting subtest pipe-A-query-forked-busy
    2022-10-03T13:38:36.567258   >=3D display->n_pipes || !display->pipes[p=
ipe].enabled)
    2022-10-03T13:38:36.570886  Pipe D does not exist or not enabled =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/633ae666447bda4044cab914
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:35.463627  query-forked on pipe A, connector eDP-1
    2022-10-03T13:38:35.468372  (kms_vblank:596) DEBUG: Spawning 6 threads
    2022-10-03T13:38:35.469900  ****  END  ****
    2022-10-03T13:38:35.474854  [1mSubtest pipe-A-query-forked: FAIL (0.737=
s)[0m
    2022-10-03T13:38:35.483064  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-03T13:38:35.490799  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-03T13:38:35.497433  Pi<6>[   50.612700] Console: switching to c=
olour dummy device 80x25
    2022-10-03T13:38:35.501586  pe C does not exist or not enabled
    2022-10-03T13:38:35.508747  Test requirement not met in <14>[   50.6236=
40] [IGT] kms_vblank: executing
    2022-10-03T13:38:35.514176  function igt_require_pipe, file ../lib/igt_=
kms.c:2302: =

    ... (104 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/633ae666447bda4044cab916
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:34.374624  Test requirement: !(pipe >=3D displa<8>[   =
49.489698] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-idle-hang RESU=
LT=3Dskip>
    2022-10-03T13:38:34.378800  y->n_pipes || !display->pipes[pipe].enabled)
    2022-10-03T13:38:34.382451  Pipe C does not exist or not enabled
    2022-10-03T13:38:34.390206  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2302:
    2022-10-03T13:38:34.398177  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-10-03T13:38:34.402243  Pipe D does not exist or not enabled
    2022-10-03T13:38:34.411502  Test requirement not met in functi<6>[   49=
.527624] Console: switching to colour dummy device 80x25
    2022-10-03T13:38:34.416922  on igt_require_pipe, file ../lib/igt_kms.c:=
2302:
    2022-10-03T13:38:34.423092  Test requireme<14>[   49.537586] [IGT] kms_=
vblank: executing
    2022-10-03T13:38:34.436198  nt: !(pipe >=3D display->n_pipes || !displa=
y->pipes[pipe].enabled)<14>[   49.549685] [IGT] kms_vblank: starting subtes=
t pipe-A-query-forked =

    ... (106 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/633ae666447bda4044cab918
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:33.283055  <8>[   48.399548] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-10-03T13:38:33.316979  <6>[   48.436078] Console: switching to col=
our dummy device 80x25
    2022-10-03T13:38:33.322677  <14>[   48.442730] [IGT] kms_vblank: execut=
ing
    2022-10-03T13:38:33.328214  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0 aarch64)
    2022-10-03T13:38:33.335529  <14>[   48.448505] [IGT] kms_vblank: starti=
ng subtest pipe-A-query-idle
    2022-10-03T13:38:33.338368  Starting subtest: pipe-A-query-idle
    2022-10-03T13:38:33.412773  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-10-03T13:38:33.735557  (kms_vblank:590) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-10-03T13:38:33.742550  (kms_vblank:590) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-10-03T13:38:33.748737  (kms_vblank:590) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (71 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/633ae666447bda4044cab919
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:32.241808  <8>[   47.358497] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrtc-id RESULT=3Dpass>
    2022-10-03T13:38:32.271381  <6>[   47.390151] Console: switching to col=
our dummy device 80x25
    2022-10-03T13:38:32.276385  <14>[   47.396784] [IGT] kms_vblank: execut=
ing
    2022-10-03T13:38:32.281946  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0 aarch64)
    2022-10-03T13:38:32.290104  <14>[   47.402562] [IGT] kms_vblank: starti=
ng subtest pipe-A-accuracy-idle
    2022-10-03T13:38:32.293185  Starting subtest: pipe-A-accuracy-idle
    2022-10-03T13:38:32.363385  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-10-03T13:38:32.718730  (kms_vblank:586) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-10-03T13:38:32.726140  (kms_vblank:586) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-10-03T13:38:32.732139  (kms_vblank:586) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (80 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
33ae666447bda4044cab922
        failing since 107 days (last pass: renesas-devel-2022-06-06-v5.19-r=
c1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-10-03T13:38:28.959666  <8>[   44.075402] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2022-10-03T13:38:28.966054  <8>[   44.086660] <LAVA_SIGNAL_TESTSET STOP>
    2022-10-03T13:38:29.002211  <8>[   44.121999] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-10-03T13:38:29.037040  <6>[   44.155533] Console: switching to col=
our dummy device 80x25
    2022-10-03T13:38:29.041626  <14>[   44.162256] [IGT] kms_setmode: execu=
ting
    2022-10-03T13:38:29.048243  IGT-Version: 1.26-gdcb1d7a (aarch64) (Linux=
: 6.0.0 aarch64)
    2022-10-03T13:38:29.053950  <14>[   44.167699] [IGT] kms_setmode: start=
ing subtest basic
    2022-10-03T13:38:29.056571  Starting subtest: basic
    2022-10-03T13:38:29.061749  Testing: basic 1 connector combinations
    2022-10-03T13:38:29.170554  <14>[   44.287755] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1 =

    ... (78 line(s) more)  =

 =20
