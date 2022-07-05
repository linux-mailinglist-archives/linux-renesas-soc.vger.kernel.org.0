Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C9456698D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 13:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiGELdk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 07:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiGELdk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 07:33:40 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8C22FA
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 04:33:39 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 67so1599341pfy.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2022 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PQbQJ9XfejsjouxbBWhIjjP/BDjWTU3GqMdrGNEbIOU=;
        b=IOI8CVb/fMuE4z55VwpyDDdNUxocSpK1SqLvfECKqc4LexErePilHBfpZ9KkibHIh7
         YnvkQthurPSigcDM+b3PWPh4e8tLD4gmFZMUZuvs8FwGvKT8FY0ci2Rv67pXLbmydxZ7
         iWMwUx474xvQ/txfVGJ5hikbgnqQUGz5/GYP1XwUzP3cVpFN3caewAsHBftrNwaAKfWy
         vl+4bgj3uOE3XE+BGd3lSroUTavBFCjfcEX5Mj4W3Dd5RqV9R6utowP0Eaon9ggIxpFw
         0Faw9QoGzavgVcpPui+tsNreuWpR3Prsi7yCRkYw9PZYfprYQOdVfSA1yUxD0em1VSaB
         2bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PQbQJ9XfejsjouxbBWhIjjP/BDjWTU3GqMdrGNEbIOU=;
        b=0jvTstlu/7eqjrwgmdfFrdUpy92KWAA0+bmk6PAbyhQZ7cOwwT1dSUOaLB4cMwHE/D
         MS7wD2BqipzY/okCH1REMJiHEmZ9rj8iAvVw00Cmo04DXxrKKzdnAo9xECE6MZsa8axg
         aZpHZZ8M/YkQuHaprWZt4aeq8q4XrUZS1QouKPNo4JOHkl3EDYC/kSvThM/it3hUgZtx
         Fy3tm6To9xM+5xBfCH5c0i4m7OdQ/mrxs9Ue3ElEKjQzB4DsYKPIxaHdUfapHnYPFv8W
         WBmkaFLzYGC44MBcKTBAHVEShBzz2cAmHU3A/2zQAahLz/ahiLz6plkObSaJ/rHKGbIG
         55Xw==
X-Gm-Message-State: AJIora+8JNmmLv7oMHR5aOcmgwb+fyCgupHHvk5AXhXr6zEMHR9UZeQ0
        4lc8X7xQp0LkAn4j0XdOWe8q4/Uz2XmGhez1
X-Google-Smtp-Source: AGRyM1us60+lAJ/rtk61mobVUEIIO+pF3l5tViVM88rexpIE5DxjAuDFgmJGQdIfEDm2eEq7nL21QQ==
X-Received: by 2002:a65:6bcc:0:b0:3f6:1815:f541 with SMTP id e12-20020a656bcc000000b003f61815f541mr28630288pgw.183.1657020818833;
        Tue, 05 Jul 2022 04:33:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x2-20020a170902b40200b001675d843332sm22992905plr.63.2022.07.05.04.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:33:02 -0700 (PDT)
Message-ID: <62c4216e.1c69fb81.aac4f.0e58@mx.google.com>
Date:   Tue, 05 Jul 2022 04:33:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-05-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 4 runs,
 2 regressions (renesas-devel-2022-07-05-v5.19-rc5)
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

renesas/master usb: 4 runs, 2 regressions (renesas-devel-2022-07-05-v5.19-r=
c5)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-05-v5.19-rc5/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-05-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b83d3c70c208b5154097ddfcf4be9a802b12966e =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c412cf314c028bfda39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62c412cf314c028bfda39bdf
        new failure (last pass: renesas-devel-2022-07-04-v5.19-rc5) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c40f12514e6e036fa39c11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra12=
4-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-05-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra12=
4-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62c40f12514e6e036fa39c12
        failing since 42 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
