Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE185609F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 21:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiF2TGz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 15:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbiF2TGy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 15:06:54 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C6920F4E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:52 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id go6so16595378pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yIYWt7BqKW4gzXavkH7QATLvgSQju9lJM8I2VBBwrKA=;
        b=gPnO1RpoTWYozcVklBJLTmzqPYjJYP4O+bVs5gVQak3ymVEh4ix1Qu/sZB1TxRhiF1
         1n48oDhJAJHGFVkXxuSlV784sM7qp+bbFE3FHvJXwJwpYOqSSmF20k9gxrJh3tyKNX0s
         kvxtZXu14HSR3YWYeEibE4Hzl2k5saxrfb3eK6/2o/Hf9Mubi+pQKek4wtjL+qox7+PT
         fUSNfk2FAlw04rorx2p+yppTfGuuhdEmISPSMGwTji4Yz6PAK11j8f1WQfDOWYESKeV0
         ups/K5NKDEsF2Mt/R4sA86zzvg/FnDe60i6yBpFXFP3qT3lUVmrwic132qOj4Ec0C89D
         4p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yIYWt7BqKW4gzXavkH7QATLvgSQju9lJM8I2VBBwrKA=;
        b=CeYz5+5KxJiF9GSaQGwexPmM8wfF+oqZ/RuYgP51NCrx38jskbIva0hatAXW7W+DFz
         ySXD1o+c/7Yur/ZLQYXZx+qfxhFC6xRQUwCN7U37DpmtNKzaVcd4Z65uSaBhyiswEPuO
         gmzJz+lCHfjR457esr3/mXgT1B11+pxmsNll0jlsARFdiqa5C2Q/VnPtzVvZm0OAc2Oc
         RI/08rxPiM/QD2X1gScQ9zsD0I0D1SQk7JEESxg6PM+vFVqXr2mcwbxZvbsX+LbN2R6K
         Jb33qWMpvePujqAVUHD3+8sIbkQr4E4SKMZQo2IrxpCA5IVcIOB8J6ZcwdoMezQvsK/o
         c8pA==
X-Gm-Message-State: AJIora9pBxRjKkxyFghSdjTwvsP0XeO8U+ckJxwyfPwA8Hil0bdVhq6z
        hGU34xR6A6mtmhT7pIoYZ3zJ4ZwDahIRuXAjSys=
X-Google-Smtp-Source: AGRyM1uyqCZ5vYkDqCIUnZli8TKAfhV66wr1C3K03Tt88l+h6mt1rg9wu9tu2463EUG+hbSCTYirNg==
X-Received: by 2002:a17:90b:2251:b0:1ed:29d2:e013 with SMTP id hk17-20020a17090b225100b001ed29d2e013mr7006824pjb.223.1656529611250;
        Wed, 29 Jun 2022 12:06:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bq16-20020a056a000e1000b0050dc762815asm11682401pfb.52.2022.06.29.12.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 12:06:50 -0700 (PDT)
Message-ID: <62bca2ca.1c69fb81.f6cff.0cc9@mx.google.com>
Date:   Wed, 29 Jun 2022 12:06:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-29-v5.19-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 2 runs,
 11 regressions (renesas-devel-2022-06-29-v5.19-rc4)
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

renesas/master igt-kms-rockchip: 2 runs, 11 regressions (renesas-devel-2022=
-06-29-v5.19-rc4)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 10         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-29-v5.19-rc4/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-29-v5.19-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33401641a5eb2a82fb3eeeb71752594b1d8016bc

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  f7828dc180ba3427b5e405fab25e9846c07322bc
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  02153f109bd422d93cfce7f5aa9d7b0e22fab13c =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc99fc02e17c7198a39c9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-roc=
kchip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-roc=
kchip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220624.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/62bc99fc02e17=
c7198a39c9c
        failing since 22 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 10         =


  Details:     https://kernelci.org/test/plan/id/62bc912ecd61ecdc82a39bda

  Results:     65 PASS, 24 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220624.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked-busy: https://kernelci.o=
rg/test/case/id/62bc912fcd61ecdc82a39c68
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:34.628673  requirement: !(pipe >=3D display->n_pipes |=
| !display->pipes[pipe].enabled)
    2022-06-29T17:49:34.632470  Pipe D does not exist or not enabled
    2022-06-29T17:49:34.640540  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-29T17:49:34.648198  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-29T17:49:34.651940  Pipe E does not exist or not enabled
    2022-06-29T17:49:34.659106  Test <6>[   73.482471] Console: switching t=
o colour dummy device 80x25
    2022-06-29T17:49:34.669812  requirement not met in function igt_require=
_pipe, file ../lib/ig<14>[   73.493198] [IGT] kms_vblank: executing
    2022-06-29T17:49:34.671346  t_kms.c:2251:
    2022-06-29T17:49:34.683777  Test requirement: !(pipe >=3D display->n_pi=
pes || !<14>[   73.505512] [IGT] kms_vblank: starting subtest pipe-A-wait-f=
orked-busy
    2022-06-29T17:49:34.686972  display->pipes[pipe].enabled) =

    ... (103 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-busy: https://kernelci.org/test=
/case/id/62bc912fcd61ecdc82a39c6a
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:33.556169  inux: 5.19.0-rc4 aarch64)
    2022-06-29T17:49:33.560193  Starting subtest: pipe-A-wait-forked-hang
    2022-06-29T17:49:33.570364  Test requirement not met in function gem_co=
ntext_require_bannable, file ../lib/i915/gem_context.c:324:
    2022-06-29T17:49:33.575193  Test requirement: has_ban_period || has_ban=
nable
    2022-06-29T17:49:33.578636  Last errno: 22, Invalid argument
    2022-06-29T17:49:33.584012  [1mSubtest pipe-A-wait-forked-hang: SKIP (0=
.000s)[0m
    2022-06-29T17:49:33.591123  Test r<6>[   72.414870] Console: switching =
to colour dummy device 80x25
    2022-06-29T17:49:33.602132  equirement not met in function igt_require_=
pipe, file ../lib/igt<14>[   72.425975] [IGT] kms_vblank: executing
    2022-06-29T17:49:33.603486  _kms.c:2251:
    2022-06-29T17:49:33.615539  Test requirement: !(pipe >=3D display->n_pi=
pes || !d<14>[   72.438394] [IGT] kms_vblank: starting subtest pipe-A-wait-=
busy =

    ... (97 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-forked: https://kernelci.org/te=
st/case/id/62bc912fcd61ecdc82a39c6c
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:32.471246  nabled)
    2022-06-29T17:49:32.474774  Pipe D does not exist or not enabled
    2022-06-29T17:49:32.483126  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-29T17:49:32.490951  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-29T17:49:32.494415  Pipe E does not exist or not enabled
    2022-06-29T17:49:32.507741  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_<6>[   71.331253] Console: switching to colour =
dummy device 80x25
    2022-06-29T17:49:32.509174  kms.c:2251:
    2022-06-29T17:49:32.518988  Test requirement: !(pipe >=3D display->n_pi=
pes || !di<14>[   71.342733] [IGT] kms_vblank: executing
    2022-06-29T17:49:32.521750  splay->pipes[pipe].enabled)
    2022-06-29T17:49:32.532514  Pipe F does not exist or not enable<14>[   =
71.355033] [IGT] kms_vblank: starting subtest pipe-A-wait-forked =

    ... (103 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-wait-idle: https://kernelci.org/test=
/case/id/62bc912fcd61ecdc82a39c6e
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:31.355237  Test requirement not met in function igt_re=
quire_pipe, file ../l<8>[   70.176709] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dpipe-A-query-forked-busy-hang RESULT=3Dskip>
    2022-06-29T17:49:31.357351  ib/igt_kms.c:2251:
    2022-06-29T17:49:31.364910  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-29T17:49:31.368708  Pipe C does not exist or not enabled
    2022-06-29T17:49:31.376911  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-29T17:49:31.384692  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-29T17:49:31.392974  Pipe D does not ex<6>[   70.216360] Console=
: switching to colour dummy device 80x25
    2022-06-29T17:49:31.394873  ist or not enabled
    2022-06-29T17:49:31.403754  Test requirement not met in function igt_re=
q<14>[   70.227378] [IGT] kms_vblank: executing
    2022-06-29T17:49:31.407815  uire_pipe, file ../lib/igt_kms.c:2251: =

    ... (110 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked-busy: https://kernelci.=
org/test/case/id/62bc912fcd61ecdc82a39c70
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:30.295140   gem_context_require_bannable, file ../lib/=
i915/gem_context.c:324:
    2022-06-29T17:49:30.300126  Test requirement: has_ban_period || has_ban=
nable
    2022-06-29T17:49:30.303528  Last errno: 22, Invalid argument
    2022-06-29T17:49:30.308787  [1mSubtest pipe-A-query-busy-hang: SKIP (0.=
000s)[0m
    2022-06-29T17:49:30.316809  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-29T17:49:30.326388  Test requirement: !(pipe >=3D d<6>[   69.15=
0397] Console: switching to colour dummy device 80x25
    2022-06-29T17:49:30.331394  isplay->n_pipes || !display->pipes[pipe].en=
abled)
    2022-06-29T17:49:30.337433  Pipe C does n<14>[   69.160632] [IGT] kms_v=
blank: executing
    2022-06-29T17:49:30.339781  ot exist or not enabled
    2022-06-29T17:49:30.351223  Test requirement not met in function ig<14>=
[   69.174523] [IGT] kms_vblank: starting subtest pipe-A-query-forked-busy =

    ... (114 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-busy: https://kernelci.org/tes=
t/case/id/62bc912fcd61ecdc82a39c72
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:29.237537  Test requirement not met in function igt_re=
quire_pipe, file ../lib/ig<8>[   68.060498] <LAVA_SIGNAL_TESTCASE TEST_CASE=
_ID=3Dpipe-A-query-forked-hang RESULT=3Dskip>
    2022-06-29T17:49:29.238804  t_kms.c:2251:
    2022-06-29T17:49:29.246602  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-29T17:49:29.250366  Pipe D does not exist or not enabled
    2022-06-29T17:49:29.258434  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-29T17:49:29.266388  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-29T17:49:29.274810  Pipe E does not exist o<6>[   68.098650] Co=
nsole: switching to colour dummy device 80x25
    2022-06-29T17:49:29.276580  r not enabled
    2022-06-29T17:49:29.285723  Test requirement not met in function igt_re=
quire_<14>[   68.109652] [IGT] kms_vblank: executing
    2022-06-29T17:49:29.289377  pipe, file ../lib/igt_kms.c:2251: =

    ... (92 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-forked: https://kernelci.org/t=
est/case/id/62bc912fcd61ecdc82a39c74
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:28.074151  [1mSubtest pipe-A-query-idle-hang: SKIP<8>[=
   66.895006] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dpipe-A-query-idle-hang R=
ESULT=3Dskip>
    2022-06-29T17:49:28.075562   (0.000s)[0m
    2022-06-29T17:49:28.083750  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-29T17:49:28.091513  Test requirement: !(pipe >=3D display->n_pi=
pes || !display->pipes[pipe].enabled)
    2022-06-29T17:49:28.095565  Pipe C does not exist or not enabled
    2022-06-29T17:49:28.103262  Test requirement not met in function igt_re=
quire_pipe, file ../lib/igt_kms.c:2251:
    2022-06-29T17:49:28.111784  Test requirement: !<6>[   66.934666] Consol=
e: switching to colour dummy device 80x25
    2022-06-29T17:49:28.117705  (pipe >=3D display->n_pipes || !display->pi=
pes[pipe].enabled)
    2022-06-29T17:49:28.122701  Pip<14>[   66.946389] [IGT] kms_vblank: exe=
cuting
    2022-06-29T17:49:28.126046  e D does not exist or not enabled =

    ... (114 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-query-idle: https://kernelci.org/tes=
t/case/id/62bc912fcd61ecdc82a39c76
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:26.952239  <8>[   65.777246] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-A-accuracy-idle RESULT=3Dfail>
    2022-06-29T17:49:26.985540  <6>[   65.812665] Console: switching to col=
our dummy device 80x25
    2022-06-29T17:49:26.990058  <14>[   65.819381] [IGT] kms_vblank: execut=
ing
    2022-06-29T17:49:27.003999  IGT-Version: 1.26-g02153f1 (aarch64) (Linux=
: 5.19.0-rc4 aarch64)<14>[   65.827267] [IGT] kms_vblank: starting subtest =
pipe-A-query-idle
    2022-06-29T17:49:27.004715  =

    2022-06-29T17:49:27.008189  Starting subtest: pipe-A-query-idle
    2022-06-29T17:49:27.092012  Beginning pipe-A-query-idle on pipe A, conn=
ector eDP-1
    2022-06-29T17:49:27.447871  (kms_vblank:584) CRITICAL: Test assertion f=
ailure function vblank_query, file ../tests/kms_vblank.c:290:
    2022-06-29T17:49:27.454981  (kms_vblank:584) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-06-29T17:49:27.460680  (kms_vblank:584) CRITICAL: Last errno: 22, =
Invalid argument =

    ... (70 line(s) more)  =


  * igt-kms-rockchip.kms_vblank.pipe-A-accuracy-idle: https://kernelci.org/=
test/case/id/62bc912fcd61ecdc82a39c77
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:25.915812  <6>[   64.743243] Console: switching to col=
our dummy device 80x25
    2022-06-29T17:49:25.920674  <14>[   64.750029] [IGT] kms_vblank: execut=
ing
    2022-06-29T17:49:25.934760  IGT-Version: 1.26-g02153f1 (aarch64) (Linux=
: 5.19.0-rc4 aarch64)<14>[   64.756436] [IGT] kms_vblank: starting subtest =
pipe-A-accuracy-idle
    2022-06-29T17:49:25.935278  =

    2022-06-29T17:49:25.938909  Starting subtest: pipe-A-accuracy-idle
    2022-06-29T17:49:26.009650  Beginning pipe-A-accuracy-idle on pipe A, c=
onnector eDP-1
    2022-06-29T17:49:26.381747  (kms_vblank:581) CRITICAL: Test assertion f=
ailure function accuracy, file ../tests/kms_vblank.c:255:
    2022-06-29T17:49:26.388454  (kms_vblank:581) CRITICAL: Failed assertion=
: wait_vblank(fd, &vbl) =3D=3D 0
    2022-06-29T17:49:26.394581  (kms_vblank:581) CRITICAL: Last errno: 22, =
Invalid argument
    2022-06-29T17:49:26.398725  (kms_vblank:581) CRITICAL: error: -22 !=3D =
0 =

    ... (79 line(s) more)  =


  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
2bc912fcd61ecdc82a39c80
        failing since 12 days (last pass: renesas-devel-2022-06-06-v5.19-rc=
1, first fail: renesas-devel-2022-06-17-v5.19-rc2)

    2022-06-29T17:49:22.570422  <8>[   61.395974] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2022-06-29T17:49:22.577369  <8>[   61.406835] <LAVA_SIGNAL_TESTSET STOP>
    2022-06-29T17:49:22.613864  <8>[   61.441927] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-06-29T17:49:22.647189  <6>[   61.474623] Console: switching to col=
our dummy device 80x25
    2022-06-29T17:49:22.652189  <14>[   61.481328] [IGT] kms_setmode: execu=
ting
    2022-06-29T17:49:22.664758  IGT-Version: 1.26-g02153f1 (aarch64) (Linux=
: 5.19.0-rc4 aarch64)<14>[   61.487436] [IGT] kms_setmode: starting subtest=
 basic
    2022-06-29T17:49:22.665200  =

    2022-06-29T17:49:22.667584  Starting subtest: basic
    2022-06-29T17:49:22.671500  Testing: basic 1 connector combinations
    2022-06-29T17:49:22.787572  <14>[   61.613940] [IGT] kms_setmode: start=
ing dynamic subtest pipe-A-eDP-1 =

    ... (77 line(s) more)  =

 =20
