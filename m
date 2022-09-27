Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E845EC014
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 12:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiI0Ks0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 06:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiI0KsZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 06:48:25 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334A6106A3D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 03:48:24 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id a80so9335443pfa.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=k9gJJISdQMdVe9lBEQpIL5brpgA+QRGz/qbZT2iIIps=;
        b=rRr1em5J8SC0NE3Vi+mvUTRRtYssE1vWPApXgwFJsPgk+ZMdmBU1bLI7gnFQBvG6G2
         mmQN0LFOZRkkU2iJbCRAbjsH8yEDWhw0OjhZ0udD6vKdrlNurIqclOATjDn66s8oOIOg
         jY+WIRyT0Ch96WBomFnZiLsUUjsZUl+nAr+vwndOPgi4FeZb9sRgOi6WeoFEDLu2rIeR
         Tu0JpM8IMj5PPxZRJEzUJDlbh4+o7dNsXAqpAqOx90e9vSvhZZV1J3qXm2biGLKSUJBt
         ImCbqeU9A9HPqoswJT68bmCpzfOwq86lj/v+v2hWXn0JtaTzfH36Eemnx/F5daWeigCc
         1SYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=k9gJJISdQMdVe9lBEQpIL5brpgA+QRGz/qbZT2iIIps=;
        b=t1VO0UD8V7GyZ3X1bjN0/CYVAAbXfBSwE4OM1S9/54rNYKRdn9n4didnTkczPqTdJp
         mMU6+wwilnx/knu0whn9jxRf48HJ+HXAslzrL+4tdex2oUXeFIS/Impc3eC/5ltSrFQ4
         oN6XVH9/ZXSw6cYhCbtSGcQTiIt8qVe7UM3J6j6dI+sNg490MJ1Rxw3PIbxKbpjQB5pu
         CX7aC+a7ADH7Ca6dr5C8Jui49B/ehhfqIvv0S1+BEMhsbrfq2GZpskWzHOsK+B+NyDTU
         s2+5lhZCdPRrpUx7oZXTJpS9a36PE8xua7Kpfa5oMWfqq0o42dDlkRi3RbtJ0OL6ti0O
         iMuQ==
X-Gm-Message-State: ACrzQf0U/tBnM26Kw/akkEYKUrnYajGh3MoKy5/ytu7YsyitRrNMbnMu
        VQoQtZXhVt6vWPhQbg/rJIsZP8kOPlhkMdz1
X-Google-Smtp-Source: AMsMyM4ecBHHf3vW46QK32S5O2pXoScf3nU99Ezr99R9zZWPbB9XAzbagXlMYJmsOX8whu+Biwnsqg==
X-Received: by 2002:a05:6a00:168e:b0:53b:3f2c:3213 with SMTP id k14-20020a056a00168e00b0053b3f2c3213mr28806646pfc.56.1664275703543;
        Tue, 27 Sep 2022 03:48:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b0016ed8af2ec0sm1250481plg.29.2022.09.27.03.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 03:48:23 -0700 (PDT)
Message-ID: <6332d4f7.170a0220.d59a0.1d8c@mx.google.com>
Date:   Tue, 27 Sep 2022 03:48:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-27-v6.0-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2022-09-27-v6.0-rc7)
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

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2022-=
09-27-v6.0-rc7)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-27-v6.0-rc7/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-27-v6.0-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      021286ccf6c17f224e1137ebdbbbecae1e64612f

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  474894ed17a037a464e5bd845a0765a50f647898
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  dcb1d7a8822e62935f4fe3f2e6a04caaee669369 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6332d12f7f9abd1652ec4ea6

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-27-v6.0-rc7/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panf=
rost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-27-v6.0-rc7/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panf=
rost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220923.1/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/6332d12f7f9abd1652ec4ea9
        new failure (last pass: renesas-devel-2022-09-19-v6.0-rc6)

    2022-09-27T10:31:53.401589  <6>[   16.020077] Console: switching to col=
our dummy device 80x30
    2022-09-27T10:31:53.402091  <14>[   16.026729] [IGT] panfrost_submit: e=
xecuting
    2022-09-27T10:31:53.406757  IGT-Version: 1.26-gdcb1d7a (arm) (Linux: 6.=
0.0-rc7 armv7l)
    2022-09-27T10:31:53.417349  <14>[   16.035700] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-09-27T10:31:53.417854  Starting subtest: pan-unhandled-pagefault
    2022-09-27T10:31:53.548392  (panfrost_submit:289) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178:
    2022-09-27T10:31:53.562145  (panfrost_submit:289) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-09-27T10:31:53.562384  Stack trace:
    2022-09-27T10:31:53.562584    #0 ../lib/igt_core.c:1819 __igt_fail_asse=
rt()
    2022-09-27T10:31:53.574904  <14>[   16.187256] [IGT] panfrost_submit: e=
xiting, ret=3D98 =

    ... (12 line(s) more)  =

 =20
