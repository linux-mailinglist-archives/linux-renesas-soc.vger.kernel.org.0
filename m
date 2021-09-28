Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C522F41B758
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 21:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242431AbhI1TSJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 15:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242422AbhI1TSH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 15:18:07 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931C7C06161C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 12:16:27 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y8so19725321pfa.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lqrLxYxoXXWZtNgxCrDc2iTUtPrSbgSilqocK3HfOmE=;
        b=DASNUfkVh/bxfH+0vPMk1zhdL8m8sc9MbqYQ8RwsXgGUfWyH3/iqJyn6Sxsiv3ITe+
         Dx0QWr6fRRJsTQyvPAslTRgFPSBFo7tFOpZTMPexL3F7gBbyiz66UKHiiY9enOalE468
         y2wsYTESt9PVOlw7USDgkdUfJodiQqXmSleIvxVGW4N3wNszZZvfIIEksov3waJab7XN
         4DcFsqeQYwUzD56zG0DqY2lIULwyI0GyVDwRkNQkSQ1S40ow4A3JLpS2b8oCxS8YB5Da
         0ia5fDI+a8rFfDxY3TT8eWeFAhhQ+hKoUpyMDJWfewz8KsK1oqYEn+eXef+jnY01j/KU
         MNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lqrLxYxoXXWZtNgxCrDc2iTUtPrSbgSilqocK3HfOmE=;
        b=r/GVNEUm3hk4IaO3Pr9jxvTiuwVlywWNTIxUxjEkIY6VgZcukbdq1NkJDCaZ2Zm7rH
         W9T0he7X9+cSAy3Rxtq+gDGsrCuntA+eBvZ5q435XN8efV7tkDXTmzT6h5ltLLK+6cpU
         alwQVABge643GpQ5uWF2UtnT+71QetBKMl+1r7oExR+01GKzRcQPcESE+8k8Rby3m/oR
         vBBIf2Y0E3ecwQSvU5QmkEaroLiY9TmM5ctAaaq9h8jrHNvuqx8tGOtejxW3DbwRxOGh
         bcpUq2BcLpcjR8TIimJYt4HpCAI5NWPhApOaN/QsFfGKJcUxwPlFOpMVFLdW84zpjNAz
         Dp3w==
X-Gm-Message-State: AOAM533RiEmbbnE5sAyM/OYE7z+btiNBRzIPgwWqP1Vvoy4P6ih/oH8t
        Cb8Tk3ZUg9WTpKIIgTzBP/Rh3lWKX/1tTBoS
X-Google-Smtp-Source: ABdhPJwnv+Rn7MiOejamxMzzfnuUR8Gc4GG/lk+TDwjlqc0EggBKd4vF8IhlChKmCBYCcOLMGAsXFA==
X-Received: by 2002:a63:534f:: with SMTP id t15mr6155627pgl.392.1632856586838;
        Tue, 28 Sep 2021 12:16:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p2sm3057424pja.51.2021.09.28.12.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 12:16:26 -0700 (PDT)
Message-ID: <61536a0a.1c69fb81.b2857.9e24@mx.google.com>
Date:   Tue, 28 Sep 2021 12:16:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-28-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-next-2021-09-28-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-ne=
xt-2021-09-28-v5.15-rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-28-v5.15-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-28-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a462ac13da67252c742a2c044b302f37eae9d089

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  05a468e033af0e4c775aaa10fe4d02c45de698ae =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/615357c326f08fab0099a31f

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt=
8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt=
8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210913.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
615357c326f08fab0099a321
        failing since 14 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c)

    2021-09-28T17:58:20.558809  / # =

    2021-09-28T17:58:20.561189  =

    2021-09-28T17:58:20.664626  / # #
    2021-09-28T17:58:20.667099  #
    2021-09-28T17:58:20.769445  / # export SHELL=3D/bin/sh
    2021-09-28T17:58:20.772528  export SHELL=3D/bin/sh
    2021-09-28T17:58:20.874217  / # . /lava-4596911/environment
    2021-09-28T17:58:20.876318  . /lava-4596911/environment
    2021-09-28T17:58:20.978177  / # /lava-4596911/bin/lava-test-runner /lav=
a-4596911/0
    2021-09-28T17:58:20.980786  /lava-4596911/bin/lava-test-runner /lava-45=
96911/0 =

    ... (7 line(s) more)  =

 =20
