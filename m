Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3884F2223
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 06:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbiDEEdY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Apr 2022 00:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbiDEEdL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 00:33:11 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED7419021
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 21:30:29 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id j8so9882071pll.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Apr 2022 21:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=A1iYBin1V6Q9T44bid17e3Lzo7hHkolb4mgocUt8g0E=;
        b=n3GU59d34Emj3If8aYahZAZQQTGskQwdbeT+wGiHcPiG4fY+TknG7ysZmon4Ym+tbD
         MZwq9q0F5LCsWQB/QFRMSGb98KEGYN/YeoEwMdkbdqspxOhGMu7kpfIZGVLwARB9z7+O
         usUNpdevEL+xMQFdqIhrBSVbxjRVWzzZvIeN/G9MNN+Xva52oUyr+HlOvT7GMp51qmQ/
         WTTaDPOxmXd//BEqFZRwAyV6iwxMI7jav3QDLniKtvoQzknVXzjQo6jr+GQRw95uGIaL
         Dfe2Y9mb40AO4xmUl+diQL4dNwXsfIdh7a098CTgMi5Sik/PjMeot8ZYLnrYpG5QprTX
         LHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=A1iYBin1V6Q9T44bid17e3Lzo7hHkolb4mgocUt8g0E=;
        b=O4PhDmUkkaWcE9jv6fW0FFHRbS9dkaeqi5j+Y1R9YGyE57nxgTtS4Rz5tjH3mx7PE4
         S7T5eWuK6bX/Mc8FdDJgWlisEDrqYixhTiTxTV5zDoo6ID4ln7MVawImXx8ARJo8H3rm
         hn6DRTo+JuZg8GNO9+Mj1CIPceVHCneXyHtorIpw5SiIeYAub+b1erRYhFpeJQTjkh6T
         3p1SX5Gf+FvC+pOie9YzBztVJNGUhn05F8e2hjkdysVomyyERJJuyZNmxYDGtcVWP92E
         BlSUCjrsx+Ehh66kstGunVUDq34cnMHhTkr6MO8h1nHT+QXgp9oH/0/K+Y1/LSO5YZgd
         os0Q==
X-Gm-Message-State: AOAM532a1CP/GJ6Ra+aWu7PIPIvfD6O76bjUwqs1O9YlT3lSGdd4Xx6U
        IRePg8CYZrPYEmO7qHVE2/7PNtGJ5DBqLP+kZyI=
X-Google-Smtp-Source: ABdhPJyYTNxtXYs6CRhfUJbO5exU5HPj1IzQWXOKQeGJmV4ijfNgaXWg1oDYANZOgcfBK6w9QN+CaA==
X-Received: by 2002:a17:90a:a4c:b0:1ca:a723:aa76 with SMTP id o70-20020a17090a0a4c00b001caa723aa76mr1857193pjo.101.1649133028644;
        Mon, 04 Apr 2022 21:30:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g6-20020a056a000b8600b004faa49add69sm13651125pfj.107.2022.04.04.21.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 21:30:28 -0700 (PDT)
Message-ID: <624bc5e4.1c69fb81.a12a7.4958@mx.google.com>
Date:   Mon, 04 Apr 2022 21:30:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-04-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 55 runs,
 1 regressions (renesas-devel-2022-04-04-v5.18-rc1)
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

renesas/master baseline-nfs: 55 runs, 1 regressions (renesas-devel-2022-04-=
04-v5.18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-04-v5.18-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-04-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d2f27dc76d3d5a290f9dfcafae3047e5c9d0ba2b =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624b90fcbc493acdd5ae0685

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-04-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-04-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220401.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/624b90fcbc493acdd5ae06a7
        failing since 27 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-05T00:44:30.757448  <8>[   37.611859] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-05T00:44:31.802081  /lava-6021606/1/../bin/lava-test-case
    2022-04-05T00:44:31.832985  <8>[   38.687791] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
