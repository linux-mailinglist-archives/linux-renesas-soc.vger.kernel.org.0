Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A19605609F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 21:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiF2TG5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 15:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiF2TG4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 15:06:56 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C1E201A7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:54 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id x8so11584247pgj.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Olo+9ECRWwSqPBjY7gstfhSpsFRqJpDBk/MII3RJPOg=;
        b=1h5htSwJeSFhkxixCKz9Y/+nKoH0BqWv5s4qlYaIrpi0rzZnox0IlsN6EFRlev8PLh
         fxQV9aCzbuDiuqBXWa0EGVgsKCXKMTC22mLwTKGg8kismeLRetJFZeAB4ZnNj8AXUrLG
         581hOphq5HW9Etoq13cEyU2iVFysr0PnGm/0diwDyx5wTyBXxfhjGJjM7kPD/DJ2J17G
         7URtsWCyp2HNevFmLXHcVDk+Zidk52Z1oGfmg5oBBhj5s6JL96jQ0mcaMzKoJW9ktk/h
         cTCa3adMGWCQEuh/4g3dyw9ZC6jTzHFeS5zaqOSmetKTLcrOQtzIZeo8RpO9vhMD1OOt
         Yahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Olo+9ECRWwSqPBjY7gstfhSpsFRqJpDBk/MII3RJPOg=;
        b=GZHEjEh9Q7bXVLNkfqB6aVI5hW/Dxlp024O2XiAe7DT8UoIryXhZQSkkFxEzRdbXge
         E3SZu4WcPvLwXH6/zQnVfJymq/hSAYCibx9YMFa65tWM33nNa4XqFEkea4Pr91pIxgLz
         8shdMxDUUgqPuIoaG4WWPoKGeFntvuJ9goZ4eVdXkluR56ThJ6jeXLum86gyp6VUtg22
         bxyWTByWSzYc0UGZNES4JQBSZCjzAUGCKz/sctS+syl2wUx6TxkJracphoGSMbu1BfEw
         3X2tf78T7mG/fESPy9EAFm1Io9Pw2VBAygj81nKjpF0asqlkxh+eV+ew1lxqwv+49oj5
         eqIw==
X-Gm-Message-State: AJIora9veVqgnPpIQTgqTxybtgchsyekg2XE+cMeJ/pathwIo5CQHH/o
        LGxlEjNfWVBsDZP5m2zifojOKWowdR3vC3G2VYM=
X-Google-Smtp-Source: AGRyM1v4BoOo+Zf5ir6tH9b+/Y0pF54r8xg0jhdxNF3nJH6OG37sh1lJh4ThDl6aCBdwh0c1XwaEdw==
X-Received: by 2002:a63:8142:0:b0:40d:314c:57bd with SMTP id t63-20020a638142000000b0040d314c57bdmr3967810pgd.427.1656529614218;
        Wed, 29 Jun 2022 12:06:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902da8600b00169c54f6d01sm12047642plx.221.2022.06.29.12.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 12:06:51 -0700 (PDT)
Message-ID: <62bca2cb.1c69fb81.141f.1102@mx.google.com>
Date:   Wed, 29 Jun 2022 12:06:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-29-v5.19-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 4 runs,
 2 regressions (renesas-devel-2022-06-29-v5.19-rc4)
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

renesas/master usb: 4 runs, 2 regressions (renesas-devel-2022-06-29-v5.19-r=
c4)

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
sas-devel-2022-06-29-v5.19-rc4/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-29-v5.19-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33401641a5eb2a82fb3eeeb71752594b1d8016bc =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62bc9ac4f964a76037a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62bc9ac4f964a76037a39be0
        failing since 22 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62bc9aa50082c2c360a39c20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra12=
4-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra12=
4-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62bc9aa50082c2c360a39c21
        failing since 37 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =20
