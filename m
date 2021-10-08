Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B93427233
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 22:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242279AbhJHU1x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 16:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242193AbhJHU1x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 16:27:53 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8500AC061570
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Oct 2021 13:25:57 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id v11so4155789pgb.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Oct 2021 13:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KZLiqJqYe5FuNYk1FcLwiMnWDVxwmdt0gyhvD4iaD4s=;
        b=svgksbwVFGEdYIsPgcjOaOlmEkAKDeVOiPhPoVngUP5W6Vh4+7Q1OlHDiTlYIsGYrL
         wQdEfVjnCTQNwu7cxTTdN0PM0OcTycjFRab0VpGGTg7MXZ0lrTCekKNaZeUuF17ef/Fz
         BejimGFGaiUvX7RGZD+shaRpZpCn2h4pOwMegNBJU81Y/EwmzsMRYI9koYdkXuMCw05Q
         Z3I1lbl971pPCQPn6NN4ov7rxMTnorf2XT51Aa+6wGT7iFJ0t9Q5DM9VsrFVkHOS6vt2
         NOVcoHWRw30SH//tTgt7x+KpCPtt3vJj9uUrCBIiBtTegV3mKZajoDva074KAri/gVAl
         vBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KZLiqJqYe5FuNYk1FcLwiMnWDVxwmdt0gyhvD4iaD4s=;
        b=DRyNnumHoC0CBss93xT+cA+jELr43cCxd4mIQxkmzgWsqrLXP+daXCjIG/1coarThx
         lI/WrLHpTHN/xn68RIseavGUA0W4RyXv62vkiOx2026NgFIFyW2VW6a03B/HJXaDQEr8
         w0IiZqpD1hz3l73/DYoNhF/Htm+QtzG1Zrc/o0mLKnlJDZsR8ls21hNQpc+jDJw1uFfS
         Jrf78l8lIy6shKLzJwmnBq5GWZMR1Zkzoi3OYd2tt3S3IOsQ7mk/NwjjGrU8CCFUwEdL
         uzvcOTrFE9f6JTlQkBgFiTuXX9BSrNKXLynKxSpFmrmKuEdwJqKzGZxFlulVq78mep81
         KPlA==
X-Gm-Message-State: AOAM533GI+44k0Jc0gKIzhCwRCrTuKG2gruwVockuj2g6lKoNGm5OnLY
        wsohhlFGYqwFAif/3JrGbF7dSJHio/RHKGKV
X-Google-Smtp-Source: ABdhPJyzFc3rDWnNXIWG6m12jp6WKvUAD/SI23gIxeMn/m96XUd33ktggIeeTy7CldYMrgz7vNPvpw==
X-Received: by 2002:a05:6a00:2449:b0:44c:2221:8c38 with SMTP id d9-20020a056a00244900b0044c22218c38mr12338296pfj.74.1633724756892;
        Fri, 08 Oct 2021 13:25:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n19sm187574pff.37.2021.10.08.13.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:25:56 -0700 (PDT)
Message-ID: <6160a954.1c69fb81.a3779.0d64@mx.google.com>
Date:   Fri, 08 Oct 2021 13:25:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-08-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2021-10-08-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2021-10-08-v5.15-rc4)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-08-v5.15-rc4/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-08-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c2a19dc748287f470b9f2117e1b50206988efa8f

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  05a468e033af0e4c775aaa10fe4d02c45de698ae =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/61609250afe08f131299a317

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210913.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
61609250afe08f131299a319
        failing since 24 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a)

    2021-10-08T18:47:29.685153  / # =

    2021-10-08T18:47:29.688960  =

    2021-10-08T18:47:29.795090  / # #
    2021-10-08T18:47:29.798660  #
    2021-10-08T18:47:29.901261  / # export SHELL=3D/bin/sh
    2021-10-08T18:47:29.904090  export SHELL=3D/bin/sh
    2021-10-08T18:47:30.007445  / # . /lava-4676761/environment
    2021-10-08T18:47:30.010974  . /lava-4676761/environment
    2021-10-08T18:47:30.114050  / # /lava-4676761/bin/lava-test-runner /lav=
a-4676761/0
    2021-10-08T18:47:30.117702  /lava-4676761/bin/lava-test-runner /lava-46=
76761/0 =

    ... (7 line(s) more)  =

 =20
