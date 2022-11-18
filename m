Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8DD62FF55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 22:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiKRVZK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 16:25:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiKRVZJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 16:25:09 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68B79DBB3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 13:25:08 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so5785076pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 13:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0r/XxLuRbZ+4LS/2zGruyEmZMlrpVTSqO+h9507urfA=;
        b=JszGU1U6c92/3Ep7tIOoW6Y3KnYKOzQDvFfBI3SoU0LaCM7w0v6UB0C7+lfFqJdlrZ
         X5uqb9G2a3GHFRH1v4wk+Rg2DpOko2/cH9bZEW8EqSpyMef/uLowKu1nf3XVauDZkUxU
         H1VamIH3r6gteZiE5mr79W7z55NTDaKmORZHwIti0r6y0EIz6wRN1Ut3R3FDGIXYp0J+
         xCg1BMr/9X/kd+tjOvzDP0oP/MfZAnP5AxjB+5G9Da7IOZhnk+QXxs7ljFX+CIupM3JT
         YLWry939Zxn2rFmsepsBsZzVHQoLPOq3tHd3L6IwWMK0Q49nwMDYHOl7YXDrjmeDxpJ7
         vvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0r/XxLuRbZ+4LS/2zGruyEmZMlrpVTSqO+h9507urfA=;
        b=d515vd4UW/rASHsP4/Iz+elP7SdXv/jBsdiPoDt6k9d0tbuS4uZRTnjbBsOHWUjS/q
         D2jUjsL4uaYdXLUGPQayDzXvBIHR4u9yp8zCrARt3y6Ai1zfemr+rhgij9UNIJPAeAVo
         mEM3hZIuwm5G2immqEGdnzCaxEab7vpRmaMU05htzSvqto3IfuMXFNYNC7gyZajeKjft
         aey/9na56oRgWpc5C+K8tE+bZQU+xeoC0hgwelIBCBGU2FxCAz11E7c/iFkBsfmYl8Bx
         9F5GI+YmzCQnGjKWB/qKRyT0udB9vEWySfXxyIXbti4/Id/i2vGl6D2+kRzNslVVaizz
         GgoQ==
X-Gm-Message-State: ANoB5pmF7QnBjrHLS+CdoHZ0acyZTosn4RppOGRi7kIngjgh1R8O1P9i
        2mseltJL5Bd4ZBcw/+e6uIVL5JAdAVRLskQST5A=
X-Google-Smtp-Source: AA0mqf6fVJDV2ZlQlNVnw/wJZe+dBPocwIuscF3wIFdqy4OUBYKeZcz8qXYdYrPl1YuScH/wpwKT6w==
X-Received: by 2002:a17:903:278b:b0:188:aa84:14 with SMTP id jw11-20020a170903278b00b00188aa840014mr1384717plb.17.1668806708018;
        Fri, 18 Nov 2022 13:25:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709027e0200b00176ab6a0d5fsm4165578plm.54.2022.11.18.13.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 13:25:07 -0800 (PST)
Message-ID: <6377f833.170a0220.f569a.71fa@mx.google.com>
Date:   Fri, 18 Nov 2022 13:25:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 121 runs,
 2 regressions (renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967)
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

renesas/master baseline-nfs: 121 runs, 2 regressions (renesas-devel-2022-11=
-17-v6.1-rc5-5-gf68db0d22967)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f68db0d2296736d50da811c3d26889e9b803eb83 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6377bf8d6d1a72af8c2abd06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm/at91_dt_defconfig/gcc-10/lab-broonie=
/baseline-nfs-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm/at91_dt_defconfig/gcc-10/lab-broonie=
/baseline-nfs-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6377bf8d6d1a72af8=
c2abd07
        failing since 0 day (last pass: renesas-devel-2022-11-10-v6.1-rc4, =
first fail: renesas-devel-2022-11-17-v6.1-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6377c7c036203188a62abcfb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm64/defconfig+arm64-chromebook/gcc-10/=
lab-collabora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm64/defconfig+arm64-chromebook/gcc-10/=
lab-collabora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6377c7c036203188a=
62abcfc
        failing since 94 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =20
