Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00BB75AB7AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 19:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbiIBRl0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 13:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237105AbiIBRlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 13:41:25 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750ADDF0A2
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 10:41:22 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id r22so2540910pgm.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2022 10:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=IPI+dDGd+3nSyZ4yuv7EIuQI665s26Qor8HeH2rikbI=;
        b=1I9u/gg8H5QyW7by9q6Cx+Der98IIAygSVdThHJNqm5+nP8mCVfuf/P/BAt7IPnnq6
         68xr4oiVdggh9wuA038SaGHYMtiejLxrTVPWwJoZVhCnL5k2fsu2X7Xee5hU56X66JgP
         hPawVv2H5H6WbgMniOW4phdYzDo6eZ+qRnmfxLDf1QfwPtUi7TcxQsco+IvBEWXa5DKE
         Eu1aJg+zZJwhkflGUlqila0Quyb0QPB0SSYteYwAqDJmG+Bl4zaoJBYrc3oLGsuDK7Cp
         iOKXPiEwS8dgqu7odFb1epI7E4sNRVEVZGO4xJgjXU2U/eG6XZcmyr7qhODV8ZRq7rNC
         +UVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=IPI+dDGd+3nSyZ4yuv7EIuQI665s26Qor8HeH2rikbI=;
        b=hFHb6PLenLobI1gaXswHRdQ0Rpi3G/cjdOOcp8lqyhIWyvL+Uiv6QQIVrvHTzQf9H3
         HJKaTMISs5j0lPnqy3bO2C0wmTjN9ahi0i9hOJn6N8JXiqSs6R55fhlHjhp5fX8RCtr+
         pLIbmEmAjE38JgIVVTJZDbfYz6jFNq4Ebl/qqwIKlwe9+S36lzAstjJhiN7Jg22EmzFt
         G4666t+ugyA1oDEh+VRWMZtSiLvWGK8+mvxfAL4FvAoif7R3S2JGYsxqPxb+ecDXe4zK
         vtsOnhYiv2/inm38TmUV+iFhdV8hhqdspt++d9BxhdoDLiLzyMlApqaswZPaN/ADT/nt
         Szig==
X-Gm-Message-State: ACgBeo1woZp49pLBH7dPLdAgOYTVpROmXkoyOsaUkGoM0L/zN0OwDw0r
        7zcjSP/Zjv7ho9ckkZEj0sfcTtE/6zNIOYN3XI0=
X-Google-Smtp-Source: AA6agR6zXbqbS7vEQQiWnpyYwvLUckP+oK0zXTk78bjGmcsTMnHLcvOZgXczhurGZtYHOK+TlgnhEA==
X-Received: by 2002:a65:5205:0:b0:41d:f6f7:b38a with SMTP id o5-20020a655205000000b0041df6f7b38amr30945521pgp.121.1662140481791;
        Fri, 02 Sep 2022 10:41:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d29-20020aa797bd000000b005380832c1fesm2212018pfq.10.2022.09.02.10.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:41:21 -0700 (PDT)
Message-ID: <63124041.a70a0220.a6647.3f6f@mx.google.com>
Date:   Fri, 02 Sep 2022 10:41:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-02-v6.0-rc3
Subject: renesas/master ltp-ipc: 13 runs,
 2 regressions (renesas-devel-2022-09-02-v6.0-rc3)
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

renesas/master ltp-ipc: 13 runs, 2 regressions (renesas-devel-2022-09-02-v6=
.0-rc3)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig              | reg=
ressions
-----------------+------+---------+----------+------------------------+----=
--------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+ima | 1  =
        =

beaglebone-black | arm  | lab-cip | gcc-10   | omap2plus_defconfig    | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-02-v6.0-rc3/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-02-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cac9a30c2d54cde55723b592346005941a139ded

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  48cfd7a9977e6268b4aa2600608cebad7e0e42b8 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig              | reg=
ressions
-----------------+------+---------+----------+------------------------+----=
--------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+ima | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/63123e980be97472f23556dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220826.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/63123e980be97472f23556=
dd
        failing since 10 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform         | arch | lab     | compiler | defconfig              | reg=
ressions
-----------------+------+---------+----------+------------------------+----=
--------
beaglebone-black | arm  | lab-cip | gcc-10   | omap2plus_defconfig    | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/63123c6e830a5611f6355649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-02-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220826.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/63123c6e830a5611f63556=
4a
        failing since 3 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =20
