Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F74632886
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 16:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiKUPqT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 10:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbiKUPqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 10:46:05 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5908013E0E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 07:45:51 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id b29so11656653pfp.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 07:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uk46dV7h8dj11rbFo9apIAzOZBTzhom08v/3u2LDEkw=;
        b=lYHlTbOnBZO0BFRdBOp5+aV3IU2w+pUtHV0vPql8vEziyNf5fnImMO6Z4CYV6gEtKl
         QlB+rcPuONqgmBYX4+Ub8nk/geVY/+6hCC7kxMpRhi5F6vRHDCqFZBiQ/fYBtZev1bnQ
         9KKlDPiG3tbXWTxeojw6Te7/Xql60OsSKFrA8pz5H0lOCm7kb8XPFtA8BYiSw4t29E7U
         gp35qHI6xYs9PvZcOfA4G7kmpH1ggUykZNPJkHpIiPf7vTbTl5PPaIxJnbdhXam7a/C7
         96I+mWd8jWA0hx3NtqXbQy/Nw7BX0CEyo5ooCnIyQZ5o4i0GpWsd3O077VoFIT2LvGUe
         iNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uk46dV7h8dj11rbFo9apIAzOZBTzhom08v/3u2LDEkw=;
        b=mGHuq42sx2p9ZKvR+Avk15ed9kBNY3V7wUyaKay/5TEMrXuJtx2mCloLnV9bDafKpr
         Qgdx7BzxoAK7kSjrR5/Q33TPnvuIEcphWt7xRKiTrTw/Jt7QpyjQEINblfTCLgBVpG/6
         cDUbRaYDRV14fXU6YurJDyYsDE3kh4PfRPGXbJH18OTVWcaW37S0/6/V6HT4029DC8lU
         uhIiqL8RpM7Y1ODmMxHycUuyI7ov4ySQCJ28Ql72M12Az4PNTQJFH4wnFoSj/dTDgao3
         krDHyT/a3Q0wYy7la45Qu9VRXPHt7ACmm0EpUt4z2e4wt98vCq8I19S4aaqp7o364IbQ
         CVJg==
X-Gm-Message-State: ANoB5pnHb/KjGpZy4jx3excupfUmsAi+CSYdIwD/9bGbD/UBUA0amEsk
        CNv5J+aPfmR3OAEeoC3FH8YpZdk9Dii0pyFXzxM=
X-Google-Smtp-Source: AA0mqf6kPcdmnwLzKZ6ToWpGsnNZhOMnQNeD2u81oTvV1owstKazsTDQVaRcmk3YSy2BIAp9hTleuA==
X-Received: by 2002:a63:68e:0:b0:439:753f:c81f with SMTP id 136-20020a63068e000000b00439753fc81fmr4411307pgg.51.1669045550602;
        Mon, 21 Nov 2022 07:45:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h129-20020a625387000000b00571bdf45888sm8854901pfb.154.2022.11.21.07.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 07:45:50 -0800 (PST)
Message-ID: <637b9d2e.620a0220.fb3d2.c6e1@mx.google.com>
Date:   Mon, 21 Nov 2022 07:45:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-21-v6.1-rc6
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 146 runs,
 2 regressions (renesas-devel-2022-11-21-v6.1-rc6)
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

renesas/master baseline-nfs: 146 runs, 2 regressions (renesas-devel-2022-11=
-21-v6.1-rc6)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
       | regressions
-----------------------------+-------+-------------+----------+------------=
-------+------------
at91sam9g20ek                | arm   | lab-broonie | gcc-10   | at91_dt_def=
config | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie | gcc-10   | defconfig+d=
ebug   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-21-v6.1-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-21-v6.1-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2cfa2abd5264510d47f2d4a07621a48c01152209 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
       | regressions
-----------------------------+-------+-------------+----------+------------=
-------+------------
at91sam9g20ek                | arm   | lab-broonie | gcc-10   | at91_dt_def=
config | 1          =


  Details:     https://kernelci.org/test/plan/id/637b66d1e34bbff8ff2abd44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-21-v6.1-rc6/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-21-v6.1-rc6/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/637b66d1e34bbff8f=
f2abd45
        failing since 3 days (last pass: renesas-devel-2022-11-10-v6.1-rc4,=
 first fail: renesas-devel-2022-11-17-v6.1-rc5) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
       | regressions
-----------------------------+-------+-------------+----------+------------=
-------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie | gcc-10   | defconfig+d=
ebug   | 1          =


  Details:     https://kernelci.org/test/plan/id/637b89dc0b0f6027b22abd09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-21-v6.1-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-21-v6.1-rc6/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/637b89dc0b0f6027b=
22abd0a
        failing since 3 days (last pass: renesas-devel-2022-11-10-v6.1-rc4,=
 first fail: renesas-devel-2022-11-17-v6.1-rc5) =

 =20
