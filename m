Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B9569D071
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Feb 2023 16:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjBTPTI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Feb 2023 10:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbjBTPTH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Feb 2023 10:19:07 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7018B211E0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Feb 2023 07:18:48 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id g14so1663206pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Feb 2023 07:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t35FVlHL6YUbBJoJPeHcuy6MD0lxDoxJi5JPVqFxuA8=;
        b=f34Z9+4mniEWHm/vYwTd31CKuE5aI1/vKa1FyCa7FabM6Qy9y4i/mmmu5gMYh0OTmj
         55V2ANJFoi7neXI91VmnrKDYtIQpOZCeZfiyE58eAyLD9HZ5I4KxT8ASsGxDVfmjYpB/
         a3Xtqu9TPxMKIF3DpK0u/ugKK+VKfEmjyyOPystwKaoIYAVh6pw7i4IjW1fVOGLev6Xc
         d+4wRPVqqegU54NE26l+F/sSCeJLoeRJqikfcBaEUfCIL9+kglZbxwOXa1Qs/ghHyX7n
         ymM1kjNQ8jBwNMMCNe88+3lNUwDp99L66fAqi50MPSUfIvJi4GsaLLAda4Zs/EU7wjMw
         VLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t35FVlHL6YUbBJoJPeHcuy6MD0lxDoxJi5JPVqFxuA8=;
        b=hQL5cbooUWCu37cPB+LSvVDZaHNkDGZ9C6DID4+PwMeaYBRQgVV7U77oSgaPYsKR9g
         9EWlfG3FNYJaZKso+VJG2gZSMAVngaq8mXqEtBDSmAWYCqpG+TPuWNy+bInQN41YKI8M
         TVTBJQuWvPIBRfyPl9WISjpU7IQ12cWk1ayo/ZAX/zGXedr6LaBfQudzU/48moscyQe1
         gSa1jq/cPr9N/0F5XAw7req8evlgya77jiOJ6heFspuD1MHpeWoa/C2Na03DyTBXbb3g
         hry8bz8q8xGQHjuzYL21iPUQ9344SOJeuDITUpYb9M3PxmexClk7LzZTxePR5imMxF7t
         Dq4A==
X-Gm-Message-State: AO0yUKWyl3zn9y2moOZeImkvCv/yLxP5ruA8NTz3JRTPjFsNKLMTrs9o
        Rr6hg3dvYhKBSnbvm3OnaM55on9KP3iGiFduYTk=
X-Google-Smtp-Source: AK7set+wwRsWFSY49uML8N5dVm4Nds1ZwTNeK0lSRpzgIaUJBX/dI4VCqsovDXZ4RLdDXEicSJk5ow==
X-Received: by 2002:a17:902:9a4b:b0:199:30c3:b3f0 with SMTP id x11-20020a1709029a4b00b0019930c3b3f0mr3055508plv.11.1676906323795;
        Mon, 20 Feb 2023 07:18:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iz15-20020a170902ef8f00b00189c4b8ca21sm4175399plb.18.2023.02.20.07.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 07:18:43 -0800 (PST)
Message-ID: <63f38f53.170a0220.54735.660a@mx.google.com>
Date:   Mon, 20 Feb 2023 07:18:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-02-20-v6.2
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 192 runs,
 3 regressions (renesas-devel-2023-02-20-v6.2)
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

renesas/master baseline-nfs: 192 runs, 3 regressions (renesas-devel-2023-02=
-20-v6.2)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig           =
   | regressions
-----------------+------+-----------------+----------+---------------------=
---+------------
imx53-qsrb       | arm  | lab-pengutronix | gcc-10   | imx_v6_v7_defconfig =
   | 1          =

imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig+i=
ma | 1          =

imx6dl-udoo      | arm  | lab-broonie     | gcc-10   | imx_v6_v7_defconfig =
   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-02-20-v6.2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-02-20-v6.2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9737ff6b7ac85bfd246c51d8df015cb8635f35c5 =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig           =
   | regressions
-----------------+------+-----------------+----------+---------------------=
---+------------
imx53-qsrb       | arm  | lab-pengutronix | gcc-10   | imx_v6_v7_defconfig =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/63f36587205056c3ed8c86b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-20-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-20-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63f36587205056c3e=
d8c86b1
        new failure (last pass: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform         | arch | lab             | compiler | defconfig           =
   | regressions
-----------------+------+-----------------+----------+---------------------=
---+------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig+i=
ma | 1          =


  Details:     https://kernelci.org/test/plan/id/63f367a3ba3485ce728c876a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-20-v6.2/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-20-v6.2/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63f367a3ba3485ce728c8773
        new failure (last pass: renesas-devel-2023-02-13-v6.2-rc8)

    2023-02-20T12:29:01.273412  + set[   28.392583] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 908938_1.6.2.3.1>
    2023-02-20T12:29:01.273629   +x
    2023-02-20T12:29:01.385577  / # #
    2023-02-20T12:29:01.487211  export SHELL=3D/bin/sh
    2023-02-20T12:29:01.487609  #
    2023-02-20T12:29:01.588925  / # export SHELL=3D/bin/sh. /lava-908938/en=
vironment
    2023-02-20T12:29:01.589321  =

    2023-02-20T12:29:01.690534  / # . /lava-908938/environment/lava-908938/=
bin/lava-test-runner /lava-908938/1
    2023-02-20T12:29:01.691048  =

    2023-02-20T12:29:01.694001  / # /lava-908938/bin/lava-test-runner /lava=
-908938/1 =

    ... (12 line(s) more)  =

 =



platform         | arch | lab             | compiler | defconfig           =
   | regressions
-----------------+------+-----------------+----------+---------------------=
---+------------
imx6dl-udoo      | arm  | lab-broonie     | gcc-10   | imx_v6_v7_defconfig =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/63f369d09a001d018d8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-20-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-02-20-v6.2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230211.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63f369d09a001d018=
d8c8630
        failing since 13 days (last pass: renesas-devel-2023-01-30-v6.2-rc6=
, first fail: renesas-devel-2023-02-06-v6.2-rc7) =

 =20
