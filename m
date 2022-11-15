Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA6F62A179
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 19:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbiKOSlz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 13:41:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiKOSlr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 13:41:47 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3412CE2A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 10:41:46 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id h14so14068444pjv.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 10:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tg6bRDDTWrv+dNaX9Mev5ak1oHfwCKPqRLhOEnUhsUU=;
        b=lka7NED1BZA1wQsS7DoHLOCLcFlTIETnrQD/1wyDWHhr0WjO71ogRfWENHO/FUdLmm
         asRFG1kVWikB0GHIJc8q/mnPpAqAdV8SNc+GxhE3mjdjfkNzmytIW8sWcP4f2JMhqLJQ
         JiYX78QWTZzQAPn1kXbJCATexd0o66N48YGDPLzxjLPHPUbAJiGsLtvWiYl67X++H3iv
         XrVG0oI4hJXY/ttH3SrIrtXaVDwlKoYEQpJwUauJbGuCHP6xKyTVKZpp5fszjjxedI78
         xD55bc24j8FJ3uF1N1kFeE7GD4ojp285YPfU0KKP0iXRfGl9ppluN2A/2bV0KnCer0B6
         +8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tg6bRDDTWrv+dNaX9Mev5ak1oHfwCKPqRLhOEnUhsUU=;
        b=Ks3Iz3zK/N5mZATa+l4ZdUHdtiPSeY38yEkcho7yVFsppvW+M8bcwt48p/8b+3B2t2
         JAPTSuUtDIcDzB9w6S28N7wqOfkDQuBqNnFLh67MeWIj1dGPOhvn/DbdoQVuJGmBsI/v
         DkX70f/XLuhNVSxCZij6bXLkX5W8zP9Kex0y48fPT7j39CZghnA4kij/IC2HbVjl/lLP
         IDaH5/GIi1F4frnFd5kwD2feyGqwiGGH2eciRgwRE8Slxd0QKYKdK0PpbN5R2yQlRMqa
         q3M7Z+H0ijwv4AsP/3bnCubmBXvORjcfvng4ZZhpm0uWhc/QmuxVAaj63ZUpT0i4/wcD
         kLZg==
X-Gm-Message-State: ANoB5pmpXvMIEpNhQtLIKR5HY4S1YrniHiIc6f9x16KXy9rNLqoVptMF
        jkTdf0W8fdE2fFCEeSq4dv/4iVVIi/JJFLP6luQ=
X-Google-Smtp-Source: AA0mqf5pD8DGksV6GcypJGXq4OtFN8r7aukl2r26Gt+95JImMjdMistcL+4y15Dz6Yh04WK2AePI5A==
X-Received: by 2002:a17:902:8b83:b0:186:a2ef:7a74 with SMTP id ay3-20020a1709028b8300b00186a2ef7a74mr5233691plb.148.1668537705951;
        Tue, 15 Nov 2022 10:41:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u14-20020a170903124e00b00186fd3951f7sm5525070plh.211.2022.11.15.10.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 10:41:45 -0800 (PST)
Message-ID: <6373dd69.170a0220.505ba.8df9@mx.google.com>
Date:   Tue, 15 Nov 2022 10:41:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-11-15-v6.1-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 140 runs,
 2 regressions (renesas-next-2022-11-15-v6.1-rc1)
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

renesas/next baseline-nfs: 140 runs, 2 regressions (renesas-next-2022-11-15=
-v6.1-rc1)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig           =
         | regressions
-----------------+------+-----------------+----------+---------------------=
---------+------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig+i=
ma       | 1          =

jetson-tk1       | arm  | lab-baylibre    | gcc-10   | multi_v7_defc...CONF=
IG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-11-15-v6.1-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-11-15-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dff206d2346220aeff53f02783b9315d70d23be6 =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig           =
         | regressions
-----------------+------+-----------------+----------+---------------------=
---------+------------
imx6dl-riotboard | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig+i=
ma       | 1          =


  Details:     https://kernelci.org/test/plan/id/6373aa52206c2b3abae7db79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-15-v6.1-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-15-v6.1-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6373aa52206c2b3ab=
ae7db7a
        new failure (last pass: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform         | arch | lab             | compiler | defconfig           =
         | regressions
-----------------+------+-----------------+----------+---------------------=
---------+------------
jetson-tk1       | arm  | lab-baylibre    | gcc-10   | multi_v7_defc...CONF=
IG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6373ac48d50af0e1b2e7db78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-15-v6.1-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-15-v6.1-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6373ac48d50af0e1b=
2e7db79
        new failure (last pass: renesas-next-2022-11-10-v6.1-rc1) =

 =20
