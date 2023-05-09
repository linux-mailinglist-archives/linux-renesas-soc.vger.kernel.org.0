Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19FF16FC8E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 16:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235936AbjEIO02 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 10:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235925AbjEIO0V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 10:26:21 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91A24EC5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 07:26:03 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-643912bca6fso4727870b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 07:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683642362; x=1686234362;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z11pjhFbFHSNfMtnNbdy+h6I1r2iBmSDR+pgjDq/QYA=;
        b=Wtum3juyDPYwl3mWh/rBl1QvfKfZlqWMlF/iBM9Ix8k5poBQLyV/LDNOOVVV2cjjwr
         av/o+VLQCG4/c1kih2Hafricbx1dnQZAZLxAI9JV52mHyj7lKy2IqADaOQ1N2TWMTOmf
         aoTPtkO9M3jocKSFMIZhf4JdwxI94tecD1Q/ZYCmAlP4wIZ8cIpu8G3z7mA1VQ51KD9F
         aMpDRaAXRT/g8dOxB0JPZzW8f1Sdt8Ztib2kUhHV0BEpABmlBIuaYVShdBSMka0DXel6
         G0IJ9o6lxlTviFY8nmvAoDgcqOR85XixtvzB7MSge0DUWWh2nkIFHaV72fB9EQ/5Ptmt
         L9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642362; x=1686234362;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z11pjhFbFHSNfMtnNbdy+h6I1r2iBmSDR+pgjDq/QYA=;
        b=OG1PgZdrDIY4CckPY0yOilRaOm/Y7n+em9TeuuXrZphLNRQgIVjKlup+MYb9bu4yxl
         ccyKSUz+rwzfrlgGNTbL5e7voKaLIrNfnLerrFycHoyjA3B1i5beYNzISz3ftpp3u/C5
         D0eKLY4Fw0/DZC9J1FwBuG+wa6dxM2Pwxyos7mgfHzYjNndnjy4mOoaVTUsXKFnqJ8UT
         6/1+jv/RtuPckiosIamxKRw3GjGP72UKkrX93IsNdzM8piz1SitXyA8/rcARvWUgYzJH
         4WHp66UG8pb+FgrLTRbzQPTiy0w9FQgji1/YNAtMYd9bU9t/ZEMrQQB6s71Z8L0C7C/h
         DFOA==
X-Gm-Message-State: AC+VfDzKz21xIFJT6wVCUr/7zmTX0JFfb5QgR+VwvYwDWxXpe+lycvwr
        fu7wtMnbHbXastfQ5Te9HueBwEtN2XfXmvFaiBwsfQ==
X-Google-Smtp-Source: ACHHUZ7MyHTZgzpV8OtOLqEO9SMhEuFZl7hJ+g3tUHd72uF84rfJ9cN52B5gDFtfMRxw+3e76VSf5Q==
X-Received: by 2002:a05:6a00:a8a:b0:63f:158a:6e7b with SMTP id b10-20020a056a000a8a00b0063f158a6e7bmr20658149pfl.6.1683642362411;
        Tue, 09 May 2023 07:26:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a14-20020a630b4e000000b0051b460fd90fsm1396849pgl.8.2023.05.09.07.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 07:26:00 -0700 (PDT)
Message-ID: <645a57f8.630a0220.7f589.235d@mx.google.com>
Date:   Tue, 09 May 2023 07:26:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-09-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master v4l2-compliance on uvcvideo: 4 runs,
 3 regressions (renesas-devel-2023-05-09-v6.4-rc1)
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

renesas/master v4l2-compliance on uvcvideo: 4 runs, 3 regressions (renesas-=
devel-2023-05-09-v6.4-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-09-v6.4-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-09-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dce70215cdd5598b16b34f41c88d168ad124cd45

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  c7823a3f5f8846561d91e7ae77fea82fab63fff1 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4b8fcdcc80ea3f2e8872

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230303.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/645a4b8fcd=
cc80ea3f2e8873
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4a5e1e77c63af82e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230303.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/645a4a5e1e=
77c63af82e85f6
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a49718bea9d18a62e85fd

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230303.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
645a49718bea9d18a62e85ff
        new failure (last pass: renesas-devel-2023-04-24-v6.3)

    2023-05-09T13:23:45.583804  / # =


    2023-05-09T13:23:45.587106  =


    2023-05-09T13:23:45.692896  / # #

    2023-05-09T13:23:45.695701  #

    2023-05-09T13:23:45.799877  / # export SHELL=3D/bin/sh

    2023-05-09T13:23:45.803600  export SHELL=3D/bin/sh

    2023-05-09T13:23:45.906789  / # . /lava-10258546/environment

    2023-05-09T13:23:45.910409  . /lava-10258546/environment

    2023-05-09T13:23:46.012764  / # /lava-10258546/bin/lava-test-runner /la=
va-10258546/0

    2023-05-09T13:23:46.016118  /lava-10258546/bin/lava-test-runner /lava-1=
0258546/0
 =

    ... (62 line(s) more)  =

 =20
