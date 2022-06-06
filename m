Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970EF53EEBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jun 2022 21:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiFFTlB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jun 2022 15:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbiFFTlA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 15:41:00 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C42B6B03A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 12:40:57 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id h1so12910833plf.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jun 2022 12:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1bz7KPmbrVqV93RSKQMsKKIdGQ6b2bWg7z5mt5vb3Xk=;
        b=otNMLewDRAucjM3mKpEOZfhyq/YqbsN/oWE4PiIK62wvK8X7Go4KdQu0JoRvqqGeP7
         Rx//Hp9aKKibmOu60EH88mjVdGHYMj3ZyVA/BAmcd8pYT33/dNRs/LiLG7aQShPRFBNl
         tIQQ757o0DvhrAORap9hs//Sybgnp8Tl7dnodhn5pkUZkOcafz0kg+2rNzNenoLLdk1Q
         lSBB43PEr+dWevJr6xCdEO+Ylr1OpVGupAQBdKiyMlNTMcDW2WA9XBxxZQVYJPCNqnyR
         VNaTGhUOhOI2E4IuWCQVZPUZqCtTiOpFIH+aYNVbtHZZtIJoQIbh6fHw4yve/DMN0mRD
         GlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1bz7KPmbrVqV93RSKQMsKKIdGQ6b2bWg7z5mt5vb3Xk=;
        b=ApL5DI0+CL7hdumTdDSAsb6PwfLdU0luOR+0qAYvquzT5WWjj7RJ9PADFZJLVS6sz7
         zJglKHtUVY1vgxSRG+LbsfcQe8eUX66vys0ppcL2uCwZ4ilgntaYQ/A4HvdK6zwzPQhF
         3ZrmW52MqjHYN4m3iNhffZk0eJItuYkap0TAt3rDQgBqDE1UbPbTDrSa0JLF031iRBaO
         hmpYBN/iPMI8wrPcAbNK2hHgEUiPAqwJTY/bqkks4bDjHIxU1LQzjInShDoqvV2fsvn0
         8fh0Dmw+YqQcQuWbFHZm094uiSl0uPdgucOgr2OazDmlOw/mYKIFgCMswkHYV/SJHNuW
         B4iw==
X-Gm-Message-State: AOAM531TwKHo/Wj0h/d0KntHVNrfWHhu5Dk9YmxrEQXz1IqeXwuIp2pC
        Dg/tzqyyUUu1i0nbdXRYb8Enw6PLBGMcpr6M
X-Google-Smtp-Source: ABdhPJwJ++wWDa3IHnQD+yphsRQQqjxKBO3RW0JjpIL1CikykYcEi4019CKPfQgWhADVp0iAFRn4mA==
X-Received: by 2002:a17:90a:c7d7:b0:1e8:3d2d:dd67 with SMTP id gf23-20020a17090ac7d700b001e83d2ddd67mr19337235pjb.89.1654544456715;
        Mon, 06 Jun 2022 12:40:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t20-20020a170902dcd400b0016184e7b013sm10804929pll.36.2022.06.06.12.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:40:55 -0700 (PDT)
Message-ID: <629e5847.1c69fb81.b79a.8b19@mx.google.com>
Date:   Mon, 06 Jun 2022 12:40:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-06-v5.19-rc1
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 10 runs,
 2 regressions (renesas-devel-2022-06-06-v5.19-rc1)
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

renesas/master cros-ec: 10 runs, 2 regressions (renesas-devel-2022-06-06-v5=
.19-rc1)

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
sas-devel-2022-06-06-v5.19-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-06-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      997b2d66ff4e40ef6a5acf76452e8c21104416f7

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/629e4ceb26adf7caffa39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-rk3=
288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-rk3=
288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220603.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/629e4ceb26adf7caffa39b=
d0
        new failure (last pass: renesas-devel-2022-05-23-v5.18) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/629e4d0826adf7caffa39cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-teg=
ra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-06-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-teg=
ra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220603.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/629e4d0826adf7caffa39c=
c9
        failing since 14 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
