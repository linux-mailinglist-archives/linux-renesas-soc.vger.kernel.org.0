Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9693B62EB82
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 02:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbiKRB7w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 20:59:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbiKRB7w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 20:59:52 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB6369DD8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 17:59:51 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id m14so3285165pji.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 17:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IhIQxXMYDuRma8QgxyrGl4pnew8x1qciccXvXgJgwlM=;
        b=ge53hi8QtBSO+hK2jWXehOuy4jVUkcmlWYZsT6IslT7ufH3zqp5w3VshJLOrZrk2RN
         +YQ4f9u8h7Jir24DMGVx7jo2Xa5Vw0ej1Qwc8uFRqznWqLexrbCoeLa2PNkBHVGVP6F0
         hiZQHRlEua3zcquiNK3APM3j1wqJUjmt4+YJk7wpAjwV+FxhenI6ocbTUt79wUbpAiVT
         W+w5LmpSJJS6ojjlzohThM2wbcxJk0AveVRF6B1ho8Wk23X6wGXL1or4DYh+MvawaV1W
         mvuiDHr7v+qjr45pkegy25TGvO1TxAYOL5gRxb1gE70u67Q1+J+UVs0bFmuq9XaEtyqd
         vQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhIQxXMYDuRma8QgxyrGl4pnew8x1qciccXvXgJgwlM=;
        b=s5ryDrIXr9RympHE9v7KUqt1bX+XS9ercYjDLGgmecVfMGRFnTSwyJumsq7EN42D1f
         iWrm36kFptC7MWVIEj50EDs1D+8ttMfJlz8HCvKxf2Fb7sdwQW9H1EMW2qk+qIscUVIJ
         99JywMZntm3zRu9+BCTFwgRSupF6B2dssE6gYWVneSauILLDR+Rry1q7tyCbtlAxLKqM
         kHaFsYH03srb58wW/UCU6DtEmkUSnZgX5+1U04+b9oW414ZsMXXySHrWQVw6TEOnA0nh
         1YGfJIL7BU+zAcTChmlL+NJDf69SJ8fKQJGWmEYuVzkptFc/CU2o0Oyn0rXJuWgwagYl
         XRRg==
X-Gm-Message-State: ANoB5pmwMWMHXIcNZkG+GnyGAIOktwA0goJWjplUOF9UW3ahBkk7rysA
        iELq0q97KMzBzWIm65YOZxoVdAzSQf86omWTfUU=
X-Google-Smtp-Source: AA0mqf5YexlbOKS9HvAflhVltlIIHsIcfVOhgKi9xZ45kfvuAmZhnYWm2In1nO+xfBtG9mIlI/ND4Q==
X-Received: by 2002:a17:903:22d2:b0:17c:9a37:72fb with SMTP id y18-20020a17090322d200b0017c9a3772fbmr5260666plg.82.1668736790374;
        Thu, 17 Nov 2022 17:59:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x3-20020aa78f03000000b00561b02e3118sm1836012pfr.106.2022.11.17.17.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 17:59:19 -0800 (PST)
Message-ID: <6376e6f7.a70a0220.dc77a.3b8d@mx.google.com>
Date:   Thu, 17 Nov 2022 17:59:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-17-v6.1-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 133 runs,
 4 regressions (renesas-devel-2022-11-17-v6.1-rc5)
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

renesas/master baseline-nfs: 133 runs, 4 regressions (renesas-devel-2022-11=
-17-v6.1-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-17-v6.1-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-17-v6.1-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      882ccb9771f9e9985a9ada17c5e35b4863258378 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6376a7c327a1a9ebb22abd15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6376a7c327a1a9ebb=
22abd16
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6376acacf7662adedb2abd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6376acacf7662aded=
b2abd17
        failing since 93 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6376a870904001308e2abd5b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6376a870904=
001308e2abd62
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4)
        1 lines

    2022-11-17T21:32:18.902867  kern  :emerg : Disabling IRQ #35
    2022-11-17T21:32:19.145732  <8>[   44.867383] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b253db6e5259532abd0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6376b253db6e52595=
32abd10
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =20
