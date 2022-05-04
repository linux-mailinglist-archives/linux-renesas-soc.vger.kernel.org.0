Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6B35195FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 05:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343728AbiEDDdQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 23:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239255AbiEDDdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 23:33:13 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6342FD7C
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 20:29:39 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id j14so319081plx.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 20:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5G2rDvKllWotpPMWb4JRUEHUYHi+y1+ZbZjx2rfPIYk=;
        b=jbjfxKS5j7AOxiHH6ZK8WShYHtbe24s4zzk0ogint4CuXHx+azDtSak4MJfXBf3d67
         wqNq1nc2ecHOzPtz6i9IvM2QkmMESCZI51WwJXe6sfY7eVr9a79IjSLGc9SZxXxLCAFq
         pVckrubUWcvozfsqWwNq8wbK7nmHjs3+oKkRm5hwMQqW+LvCgTKF7EOMpv78byLHQM7/
         ZBH87S4pxFj8ZrumU9IUrMkFrFtdp8O1ogmHjLuuokoHgCZ+/wqPOyUUZztIPQwTUpNg
         VthGtT0whHKeaCcBfiZyZXvjz+hv3VSfBwDQ2zNDWGBvGIel9NkimsiaQdQ3pjGzuQLH
         cSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5G2rDvKllWotpPMWb4JRUEHUYHi+y1+ZbZjx2rfPIYk=;
        b=r6mE8tVwDDP/hOnXmeqaVHBbPguYeFiYwoqNuh5XUvZmJiSapvU86tf3Sju5yFfFqH
         dhMbCy3SHokEHQVIQdGXeK4KhkZyxBy41Z7+2NNa0ktmEljS1jtlcxytyRFBRF0Q8vdU
         PuKIWq7aE7wLwECDNKsf2VkHClyjDnM5ktPQEd+zLaTJb9vuw0I+sExtfwuII3k4lBTo
         +0j0w/h1NtnD+Mzz34bK+f7AqtZp6bz+l24Z0p1XONkhBKe/e9xfIo06IK4YeUU0J30P
         VvXNtVKL5MVkbhbtbEk693t2BcPiLp+Cslv848CnvivI8cAxU/NQ6IDbKBQRajn3iK3s
         gU7A==
X-Gm-Message-State: AOAM5315piZx6CkQbZ6Wwrm0jZZ1uVhB2KxVYpgta0Uo+lpjlC0mEoO+
        CaM4ryxn0yCS99YJ8RRE684Lp0DxjAfXgnHGJFA=
X-Google-Smtp-Source: ABdhPJyLEb2LXBtDXd2o+QSTakRkHKxs38r40+G5x6ExdDXuNcdF30gPg8EyntY0nytPcioxbi9BQg==
X-Received: by 2002:a17:902:dacd:b0:15e:a53e:3239 with SMTP id q13-20020a170902dacd00b0015ea53e3239mr12867833plx.7.1651634978803;
        Tue, 03 May 2022 20:29:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y13-20020a170902cacd00b0015e8d4eb2e5sm7020059pld.303.2022.05.03.20.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 20:29:38 -0700 (PDT)
Message-ID: <6271f322.1c69fb81.626f3.19e3@mx.google.com>
Date:   Tue, 03 May 2022 20:29:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-05-03-v5.18-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 196 runs,
 2 regressions (renesas-next-2022-05-03-v5.18-rc1)
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

renesas/next baseline: 196 runs, 2 regressions (renesas-next-2022-05-03-v5.=
18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
panda            | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig  =
      | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-05-03-v5.18-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-05-03-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      513cc648e77c3a2a859bc8d69421ac231c72bbf4 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
panda            | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig  =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/6271bd3ae175dc1929dc7b3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6271bd3ae175dc1929dc7=
b40
        failing since 22 days (last pass: renesas-next-2022-02-24-v5.17-rc1=
, first fail: renesas-next-2022-04-11-v5.18-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6271c083fd28debd9adc7b22

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6271c083fd28debd9adc7b47
        failing since 28 days (last pass: renesas-next-2022-02-25-v5.17-rc1=
, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-05-03T23:53:14.598005  /lava-6255067/1/../bin/lava-test-case
    2022-05-03T23:53:14.608805  <8>[   33.741838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
