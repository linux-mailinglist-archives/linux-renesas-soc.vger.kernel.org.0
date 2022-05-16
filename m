Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22821528D93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 May 2022 20:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345232AbiEPS6v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 14:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345158AbiEPS6q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 14:58:46 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779693EABF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 11:58:45 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a23-20020a17090acb9700b001df4e9f4870so186820pju.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 11:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xV5nBkvCPOF0usACThAExxP14GKv6rmywKbbBPL+pwU=;
        b=DK7gaLlqs5J173a4fKmJvWjNfrPsOjAjrOAPKIA65ihQdYZub3wj83jz+b7qUrNco2
         0VUfepUim9kKus+ISBQVIt7Fi6ORu1CiVjDFrTSQHqhaLJmctS87i6b2t+26fDR10ITT
         AkZQ1YSX53CAkoJ41jupOocy/HZOTrGpLBiHvGZTRmnJCkqqKKPTiuCZn9jrJYpTWyrZ
         ipbF3xX7kVX4MnVkAwemPrKPA3Ol+l5zbZ4Tv4c9n8oGRAlBxqC8eEqkscdEV4Yfx6fm
         EaF/M3qDGOpYHAJuz/giIodeqUg27xmsfTm2VdsyoFyXeXirqWAX0ez0F3qjnMQclaxF
         +xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xV5nBkvCPOF0usACThAExxP14GKv6rmywKbbBPL+pwU=;
        b=cW4K0HQGOAtzR5a8CuhAz3QvSgRLQB0wernvRhat3zsR0181hG4aee+x7p6a1Q+FEA
         pkr7Azrmaxqt+TyurRFet9EluV1zw+vwffPfbU7/N49l4bLc0v6JyNMD5nCSiuRrH5el
         AptZdlMEjvrvFgT4jQI+C1CJWs2plc2GE4Je2ubj9yjR/NDCuA1QvRjFKoLe2nuxwA/e
         PD0GZBYH7pALClwMaoLNO+dEJBtcUf7MEsJDPJJjS01opg61WpxrdGQGA6thFL1gPBcC
         YRi4Ot/c++R0A0Z+YcRsl3npOfw1T7EZnW1Gt61ElwL98u6XQfN3tm/GQVecHyggPJdX
         7Psw==
X-Gm-Message-State: AOAM530CMd1+owPeYSe8p1eo3UXiIF4tcnrnoZ8VYlLrycR63Kc/o5yI
        ZLKtSUNPwWktwKNoflZCxojOOklNe3H2lAqMKq0=
X-Google-Smtp-Source: ABdhPJysDpk3mqv1C+YoBv0CpjnlznN6Ay8cDQHztRQiFHGeN9tnvDBso8E+gMAY2KOrqsjD3uJvJg==
X-Received: by 2002:a17:902:bb90:b0:158:a031:2ff2 with SMTP id m16-20020a170902bb9000b00158a0312ff2mr19048807pls.117.1652727524793;
        Mon, 16 May 2022 11:58:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jj2-20020a170903048200b0016168e90f2dsm3446977plb.219.2022.05.16.11.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 11:58:43 -0700 (PDT)
Message-ID: <62829ee3.1c69fb81.5f7be.865f@mx.google.com>
Date:   Mon, 16 May 2022 11:58:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-16-v5.18-rc7
Subject: renesas/master baseline-nfs: 44 runs,
 5 regressions (renesas-devel-2022-05-16-v5.18-rc7)
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

renesas/master baseline-nfs: 44 runs, 5 regressions (renesas-devel-2022-05-=
16-v5.18-rc7)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-16-v5.18-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-16-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f35c24489921b1d4963dbb55053b97fb0e53f471 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6282820dba911c87e58f5746

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6282820dba911c87e=
58f5747
        failing since 11 days (last pass: renesas-devel-2022-05-03-v5.18-rc=
5, first fail: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =


  Details:     https://kernelci.org/test/plan/id/628288216ea647d6448f5725

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/628288216ea647d64=
48f5726
        new failure (last pass: renesas-devel-2022-05-05-v5.18-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62826d6c0f01b3682e8f5748

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62826d6c0f01b3682=
e8f5749
        new failure (last pass: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62826c0410b99deaa38f57b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62826c0410b99deaa=
38f57b7
        new failure (last pass: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62826c41aac357d8978f581e

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/62826c41aac357d8978f5840
        failing since 69 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-05-16T15:22:27.621363  <8>[   37.385549] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-16T15:22:28.669371  /lava-6391391/1/../bin/lava-test-case
    2022-05-16T15:22:28.700574  <8>[   38.465177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
