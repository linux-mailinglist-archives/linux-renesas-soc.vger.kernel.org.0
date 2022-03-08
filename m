Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36AB64D1992
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 14:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbiCHNts (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Mar 2022 08:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiCHNts (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 08:49:48 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224681C129
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Mar 2022 05:48:51 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id w37so16520095pga.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Mar 2022 05:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=34gQtLbsJZcMVtesteLNnwPU/D8/e6sKJfc6TdJUGIk=;
        b=6r8BJ5Pq+Gbr1fkXjl6IOC6pz3epAXU2ayIfB8jsgENj6EG6oBE+tTvk/zBcOqI223
         roanv3t3yAffk/J6Yt8MH4HHMwaxTPrme7UfiofLujYXHyuUtrp2x3EFN3kuHqfXOlem
         5q0S2qGSgz+pvrFD0kDkEhqLLPyoYW1xw/dyBfNmXI+56eLwnm64WK/gjPpGbujpuVI4
         jmm6oLnx+qZSClz3ip0DD/ceoBFjbBKxxHNlFXLwBuNkEQ6K5+Xyo4c8M94+80GgAuwG
         DqQxD8tgLPAl00Nr5+6yyWWNYXLszYxd4JsFJabYynhzUZyYRnKuuIIVAlY6kioIxSdP
         i62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=34gQtLbsJZcMVtesteLNnwPU/D8/e6sKJfc6TdJUGIk=;
        b=KyMmYRosRY6CskT+ac2IwF3v4esid/v8AKmdoh8VuY5xTRb8bXr+HEtmOoIXHpn0Lk
         4zTEeMcPQHw7WDZsuDG1wzBKm6Iibb3mXlKjKDbyHEfKSSXntR6LOSor8y4LYTqRTkza
         QYLpKW+oEhJ1w748qBObX0jhJv1kQGFfFvri6FEHMZd81ioPeCQ5KSxBWObySNlt9OPu
         lxaUmiePfK3Otfy3s7qXtxWE2tjegQOlTwWaBOR1TfQFJqBeLL7DQKMDhvqtiAzYfDoU
         YMqGh8x7qBLRoU6POqdWBa4s7UbonUTu0LvByozPhWb//5WazYlJV/azx37UWuw4YMvd
         7K1g==
X-Gm-Message-State: AOAM531RPx4xw6ZxITQOEg/oOc/XPwzdtuoF8jIadTugyCNLHEf56PCJ
        RUOl1Bmy6yd+wPZ2nUNG7UFfVs034AL+fzoJmHs=
X-Google-Smtp-Source: ABdhPJypU3Ffg36uMVU6jmhTK2W4tvfD/Sq4zySOVsTJceww1+ac1oP8qUTyahNqtoaQ4nrP7/OoxA==
X-Received: by 2002:a63:80c6:0:b0:380:a1ef:a9be with SMTP id j189-20020a6380c6000000b00380a1efa9bemr797482pgd.284.1646747330422;
        Tue, 08 Mar 2022 05:48:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c9-20020a634e09000000b003790829fbc1sm15412403pgb.53.2022.03.08.05.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 05:48:50 -0800 (PST)
Message-ID: <62275ec2.1c69fb81.de4f9.6e8c@mx.google.com>
Date:   Tue, 08 Mar 2022 05:48:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-03-08-v5.17-rc7
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2022-03-08-v5.17-rc7)
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

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2022-=
03-08-v5.17-rc7)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-03-08-v5.17-rc7/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-03-08-v5.17-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ac86fa2bcb4ab9ea979876e0abedf4a00bc6544f

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8376362245e5cc61e4fa4932ecbcc5cc1566e98f
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  c90e2633f9acfce3e03a5aa49ca71c2d574a72f9 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62274e6cf78b03426ec62975

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-08-v5.17-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-gpu-panfrost-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220228.1/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/62274e6cf78b03426ec62978
        new failure (last pass: renesas-devel-2022-02-28-v5.17-rc6)

    2022-03-08T12:38:50.515945  <6>[   23.214571] Console: switching to col=
our dummy device 80x25
    2022-03-08T12:38:50.521038  <14>[   23.221262] [IGT] panfrost_submit: e=
xecuting
    2022-03-08T12:38:50.527928  IGT-Version: 1.26-gc90e263 (aarch64) (Linux=
: 5.17.0-rc7 aarch64)
    2022-03-08T12:38:50.546742  <14>[   23.243866] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-03-08T12:38:50.551396  Starting subtest: pan-unhandled-pagefault
    2022-03-08T12:38:50.669854  (panfrost_submit:341) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   23.365675] [IGT] panfrost_submit: exiting, ret=3D98
    2022-03-08T12:38:50.670840  :
    2022-03-08T12:38:50.683362  (panfrost_submit:341) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-03-08T12:38:50.684681  Stack trace:
    2022-03-08T12:38:50.689670    #0 ../lib/igt_core.c:1754 __igt_fail_asse=
rt() =

    ... (12 line(s) more)  =

 =20
