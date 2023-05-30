Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7BB8715D46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 13:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjE3Lbo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 07:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjE3Lbm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 07:31:42 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F212110
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:39 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d41763796so3153503b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685446298; x=1688038298;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vErrdPSViBTC2QP1uljM3Wxgyo5yZ+70MMX2ENHXrW8=;
        b=m/QjcLhSk3d5OLKTJVkQ0BvRgVhfZtlelXDQARwwqCNm6HLsCSPsGYbkW13GdzsXUc
         mVKEX4BCGoAtOA3KZOfumsapDrc6hH3JdLkA1zeNSb8a+1BmKb/veW+RyHSD4aI56xp0
         ASamiTkK8RrIUA6SW4JACsf41XnrGMa5IyNbaVs3i8nITE0nL/r+hTbTpIXBphGvgmk/
         YpEzTINQdGYCt7VMdCBgvAsK71ur582emsTZknlcnwpWKyi6hmfZs6lwZbb2UekL4ovb
         X7TNujpJK9Ccn61MwhjVYCwGlQBxItfhawtlTEbswO8C3qMuqPtXeONqMLeAwjX334Po
         cD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446298; x=1688038298;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vErrdPSViBTC2QP1uljM3Wxgyo5yZ+70MMX2ENHXrW8=;
        b=WQgqXqz1qQOIFRU6FOyqxLScX4G9d886MhaWSd5Uv3WoVPwcV8OEfzFCPwmlB2eWRy
         Pf9nez5nqhXbBbi+MQ/rBBq2NaGau6vd8ZTadclSGBSYQfl0bBbkfeEsIcbJYdsidnr1
         sgc4roguk93GI8C5fISDh7GPuyZBV6XJbuGoTgkZnZRuWITsCEBSUW+NR6fod6NCAtyZ
         Q5nFxqajChvOeMa9tdPUqBP+gig+U5nMd0mZ/WCPCYPgc3rsIrODvJmYhZxQS4i6TPdZ
         ke84+YF/T9fKiTzgIJ1X2UX+ckxgizRwSfQXHuIrFjtgnPXhEUHptVNDkxhRHAuypsTQ
         LaCw==
X-Gm-Message-State: AC+VfDxreQWJvu9ZtnECJ+W2cLe/co4R82fTsS6kg8kSA9spWTy7CJDK
        KeydMz4zXlC6r8dVMtr3SuZ2zfQGtrr1NDNy14dYmw==
X-Google-Smtp-Source: ACHHUZ68PR58OaDNaSqzBnWyY79GankC/2vSdqrcMMB6rI2wrnF3Y/SpBmeyNtCc3F1cEeX0NKhYMQ==
X-Received: by 2002:a05:6a00:1aca:b0:64d:1d84:aeb4 with SMTP id f10-20020a056a001aca00b0064d1d84aeb4mr2364519pfv.24.1685446298082;
        Tue, 30 May 2023 04:31:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y24-20020a62b518000000b00643aa9436c9sm1445502pfe.172.2023.05.30.04.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 04:31:37 -0700 (PDT)
Message-ID: <6475de99.620a0220.84fe5.298b@mx.google.com>
Date:   Tue, 30 May 2023 04:31:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-30-v6.4-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 4 runs,
 4 regressions (renesas-devel-2023-05-30-v6.4-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 4 runs, 4 regressions (renesas-=
devel-2023-05-30-v6.4-rc4)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-30-v6.4-rc4/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-30-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      520bf28625c74fdd976c6c37fb519ccad1cef65b

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  52926c1f2f03aebe34d96056e8380ab07c8f512d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cc21e4dacaf60b2e8683

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
6475cc21e4dacaf60b2e8685
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3)

    2023-05-30T10:12:36.565323  / # =


    2023-05-30T10:12:36.567242  =


    2023-05-30T10:12:36.670052  / ##

    2023-05-30T10:12:36.672169   #

    2023-05-30T10:12:36.774210  / # export SHELL=3D/bin/sh

    2023-05-30T10:12:36.776751  export SHELL=3D/bin/sh

    2023-05-30T10:12:36.878423  / # . /lava-10522853/environment

    2023-05-30T10:12:36.880293  . /lava-10522853/environment

    2023-05-30T10:12:36.983249  / # /lava-10522853/bin/lava-test-runner /la=
va-10522853/0

    2023-05-30T10:12:36.985657  /lava-10522853/bin/lava-test-runner /lava-1=
0522853/0
 =

    ... (7 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475d1005ad669167b2e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/6475d1005a=
d669167b2e85f0
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ccc3af79eb32b72e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/6475ccc3af=
79eb32b72e85f4
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cc3bf432f84fc02e85e6

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230527.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
6475cc3bf432f84fc02e85e8
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)

    2023-05-30T10:13:04.510816  / #

    2023-05-30T10:13:04.512575   =


    2023-05-30T10:13:04.615730  / # #

    2023-05-30T10:13:04.618734  #

    2023-05-30T10:13:04.721352  / # export SHELL=3D/bin/sh

    2023-05-30T10:13:04.723931  export SHELL=3D/bin/sh

    2023-05-30T10:13:04.826780  / # . /lava-10522874/environment

    2023-05-30T10:13:04.829375  . /lava-10522874/environment

    2023-05-30T10:13:04.932541  / # /lava-10522874/bin/lava-test-runner /la=
va-10522874/0

    2023-05-30T10:13:04.935428  /lava-10522874/bin/lava-test-runner /lava-1=
0522874/0
 =

    ... (62 line(s) more)  =

 =20
