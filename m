Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 275AD566A2D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbiGELv4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbiGELvz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:51:55 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E007175AB
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:51:54 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso6975388pjo.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uYYBMp/WGuJpX5GkU2vwM+J81IcheGLioniUftOyWPk=;
        b=UQmIkrFKj8v8i+sg1suLQkxsto0THR4Rgs9X1+vUPHp2bJX1it+duz2yqm414Kpof/
         VXBJ8jibiTxDAN1TameRXsSZvRhgTM2YghPGxKbUm6GnVDBkXgi2ScJoWX8m2rhOfyQM
         nudzghOykmMZo+MsOtDr5e9efeLcBq6SwKRBDIRrgv9PsXcRBxoVMobXVGLBXMsSjfPs
         8xPt8HaKBIjnKTPJlvZeJWN83f2ilfWnIjNox1YZoN3WiJca4LFMMWCAtnuHgZo2ADQw
         W6T1tWGiZCPWIQxJz7ihNCrzbslFsK2pkB+0xOlyqTENjYSwXN0YqX9BOHO3y1dSbthD
         bA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uYYBMp/WGuJpX5GkU2vwM+J81IcheGLioniUftOyWPk=;
        b=BepQk6/L2myNfiM5d2kf+WWmzDrykAdTFDCzRVfguQvFtw2VujyO2pSGIRfFQPM5pz
         8FbONi1p5xFPj0qNKhEBEQuPaen13F3w372XEtHXFrSKVV923o8bdHfvBS/5Yfpvh5kp
         AeFNGTqL1p/dBO3pIJh+vP8xjVnerddAa9WoyVquEKWMChIjk6WYpLY7qsZIVDcUeb3W
         hbPhS1QnulK2pfedSzXQjODGpq4q+ia+oN99C2c0risRrOfyTXq58uE4Fl28IWmn9fbw
         YbCz23nDPoSllfkdM4eeoyOhHqHcFm3q1iATQxihIBzM5rFq7dimpontuoIkfJ0Zqlvm
         6wVQ==
X-Gm-Message-State: AJIora/NjGORURPFGtUKbvKoRnBAzRB6U1XkQLxMpZoXiEegsHOw9QpO
        uAHSZQcTN+dNfyan+vjgzY5sRgFIyF/gwyCJ
X-Google-Smtp-Source: AGRyM1udvKoImqjV4l4Z4JAv+bOwK9CmfrliQmhMxScZxJ4rR7BW953kytkbcq4cAVvA0eq+qMuCZg==
X-Received: by 2002:a17:902:e80a:b0:16a:311a:a672 with SMTP id u10-20020a170902e80a00b0016a311aa672mr41071280plg.161.1657021913487;
        Tue, 05 Jul 2022 04:51:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u12-20020a056a00098c00b00525184bad5csm22830615pfg.63.2022.07.05.04.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:51:52 -0700 (PDT)
Message-ID: <62c425d8.1c69fb81.20b3f.ff8d@mx.google.com>
Date:   Tue, 05 Jul 2022 04:51:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-07-05-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-gpu-panfrost: 2 runs,
 2 regressions (renesas-next-2022-07-05-v5.19-rc1)
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

renesas/next igt-gpu-panfrost: 2 runs, 2 regressions (renesas-next-2022-07-=
05-v5.19-rc1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-07-05-v5.19-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-07-05-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b7d295b5ef2e2985496b2a3b9c4594189db6bbb0

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


  Details:     https://kernelci.org/test/plan/id/62c421c509a70f64efa39bd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfro=
st-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfro=
st-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220624.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/62c421c509a70=
f64efa39bd6
        failing since 27 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62c4152614b5ed2df2a39bda

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-05-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220624.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/62c4152614b5ed2df2a39bdd
        failing since 17 days (last pass: renesas-next-2022-06-07-v5.19-rc1=
, first fail: renesas-next-2022-06-17-v5.19-rc1)

    2022-07-05T10:40:20.029616  <8>[   40.561983] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpan-submit-and-close RESULT=3Dpass>
    2022-07-05T10:40:20.068665  IGT-Version: 1.26-g02153f1 (aarch64) (Linux=
: 5.19.0-rc1 aarch64)<6>[   40.599467] Console: switching to colour dummy d=
evice 80x25
    2022-07-05T10:40:20.073755  <14>[   40.599552] [IGT] panfrost_submit: e=
xecuting
    2022-07-05T10:40:20.081675  <14>[   40.609997] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-07-05T10:40:20.082403  =

    2022-07-05T10:40:20.086043  Starting subtest: pan-unhandled-pagefault
    2022-07-05T10:40:20.182484  (panfrost_submit:354) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178:
    2022-07-05T10:40:20.195877  (panfrost_submit:354) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-07-05T10:40:20.196727  Stack trace:
    2022-07-05T10:40:20.201648    #0 ../lib/igt_core.c:1819 __igt_fail_asse=
rt() =

    ... (12 line(s) more)  =

 =20
