Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40185312B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 May 2022 18:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237573AbiEWPUU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 May 2022 11:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237711AbiEWPUQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 May 2022 11:20:16 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFA85DA79
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:14 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id z25so1302804pfr.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ahbabummz28xMCTQCZFdfXxl83F6CoyFLjP56IdaJ4c=;
        b=wZXhJSV+PKx9jbeLoViGsVGnWMWuj5Li3BS4PdwT67MoI1rV+znf8KKBpQKJorbZSR
         X67Pkb8ymgElbWknZIKCLPmTz08ANofWZm2k07UZ3T1FPk5W1kEM+QkcJPhL7BjPd4Jg
         KyR9V+BmybZ4TA34S8RBYJ/aCfYxEB/CNlhXPljEM4dub4xTq+lN9ELsDmoNm1A/bs0b
         3BvsF5hW+uiKa0qN5ZPTi7tXBjIgP7Os2+W7yjpfF4t4VMZC2qAE6KOwTlu/kzIOKcSu
         51aiN8JHWm5CrBcTs7BS2sE3Cm1iBKZ8cssMMAjq1EEOP8K0e5C+8hW/0W4tsBzgsi9n
         7TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ahbabummz28xMCTQCZFdfXxl83F6CoyFLjP56IdaJ4c=;
        b=TF5G6ZQKblTG7Sjq9bRb6XzouC3U/9D6XGuR1k0WYVE124Rc78QmXQk2HqFNMShzSh
         T9ht1Bt7C02KkFY0rUCLdGUihUkaprMEfQo22B8e5y+poEP06P1fNGymq57wvJtDhaeX
         f17FsDqpftGoIfb6WnQrU+lylTuoV3F5DCP5xPN1yLCxB1Y/HAGFurY/WO/o/4QKeIqf
         ieA6H6/gBaamfSN24cHV4QqilRcuDRhqeQz1l0ssdTl57tFHpIrB9l1NL1WE4OmJ4tW7
         2hp7H5m0bonqmhHqXdxoiWZ/f0B+oOIgVuna7y02tK2+4cN3gt9ODd6zchJIF1W/AsvU
         dL/g==
X-Gm-Message-State: AOAM53099hRFTjPCIXxEL1eeqFpwBgoJccJA6v90MkSle6clbdY08wEI
        /yw5JzymtLkoWjGVBXhKDUPC2ek8tSpSevu2eTs=
X-Google-Smtp-Source: ABdhPJytUlFD4HYSvnIp2HAIzW2Q9x/WGyGtVwIgxBL4laJvQH+ZBOcVvHHVX8S5k1uzx/hJN8i+Bw==
X-Received: by 2002:a63:2cc3:0:b0:3db:5e24:67fa with SMTP id s186-20020a632cc3000000b003db5e2467famr20506651pgs.46.1653319214259;
        Mon, 23 May 2022 08:20:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q21-20020aa79835000000b0050dc762817esm2163912pfl.88.2022.05.23.08.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 08:20:13 -0700 (PDT)
Message-ID: <628ba62d.1c69fb81.ac472.4d56@mx.google.com>
Date:   Mon, 23 May 2022 08:20:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-23-v5.18
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 9 runs,
 2 regressions (renesas-devel-2022-05-23-v5.18)
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

renesas/master cros-ec: 9 runs, 2 regressions (renesas-devel-2022-05-23-v5.=
18)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-23-v5.18/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-23-v5.18
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d7344501bd97263caeccbd7a972c0db04024a081

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/628b96e34570f86aa0a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220513.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/628b96e34570f86aa0a39b=
cf
        failing since 6 days (last pass: renesas-devel-2022-05-09-v5.18-rc6=
, first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/628ba50a273b5fb890a39bed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra12=
4-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra12=
4-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220513.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/628ba50a273b5fb890a39b=
ee
        new failure (last pass: renesas-devel-2022-05-17-v5.18-rc7) =

 =20
