Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B48421B17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 02:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhJEA11 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 20:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhJEA11 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 20:27:27 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF96EC061749
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 17:25:37 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id kk10so3476247pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 17:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FBnPyV1e71Qu4BN+JSADy8RO92znuhMVCQ35ixiTIas=;
        b=SzDrsmGG/kn0nKrNc5ENwtQoM0Y2xUEFFB+4XhADFEI8dGHHl2xO4E4rRxz2hjIRFW
         tagYvPQQIPUS4vP/6peTCI/GpIl/hAw3fRJT0bq+z5WxDFKBC21R/d/nqeMD2bRSDdxZ
         usiPTsRkFY5g3nUZwcNCQv3pRhTVQH8HwBy7IH4iKdS8Z1pqIYWNPSM78yHbnGLfrqSf
         zw6kY2PYvGurbIOSDGz181qgivW/aATMPdAPnBcklLNQLSbxFJUJxUgnlwNRhlt9+qAp
         2l6v5X+BiBHHdq78HWnBGGhrM9iEWwfrUCfoCOaVR0SQ0AZztAxiWYyEH+lEsXADC79c
         IlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FBnPyV1e71Qu4BN+JSADy8RO92znuhMVCQ35ixiTIas=;
        b=CBrV6flhn1cVP+EnLQfQ7AU70Ui+aWVNbH0+KuJjIHrASX0j5XMygfutNJsXPntzRX
         hTpLc933OWWSadeXu5MhuuFaNzfYaXJgeFv71ufV0dQFJAk4b9y3NDzgsQlzsiFkVV57
         Ss34Yol9Hg9jPbSXD++XVFH/rMUMl1AYBa/GK6orb7dtIo5SHqhaB112x9sT+gZl74y+
         b1bfGd+ibazdnsdanRTa2EgxERr9fMPUErrrM7QMmlM0WfBE9r+L+gVmFwAxIa12816z
         oC1xY4RFdx/7KRQJV1I9yl/MuznRcZXkAej1z3Fl6INMvgnmsdwWMZPKn7cyY7+Gc3Du
         UIEQ==
X-Gm-Message-State: AOAM533BW8O1q3rgcqChW+Fp6cRba9v+O835kKnQrc6ZYbhChEYfE+4D
        x7tF96EzxTBVY+bBKv1Mr1I8ByuRtyB7K/qb
X-Google-Smtp-Source: ABdhPJyimLKADm/magCKbiDkD4lEjRmL2t/x3djg8jRqEb8ScBTc5gb6ga+90Zoy7rp7a/DUxjRz5g==
X-Received: by 2002:a17:902:e8c9:b0:13d:dae7:1d5b with SMTP id v9-20020a170902e8c900b0013ddae71d5bmr2365010plg.39.1633393537106;
        Mon, 04 Oct 2021 17:25:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l185sm15622533pfd.29.2021.10.04.17.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:25:36 -0700 (PDT)
Message-ID: <615b9b80.1c69fb81.45249.f711@mx.google.com>
Date:   Mon, 04 Oct 2021 17:25:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-04-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master ltp-ipc: 12 runs,
 4 regressions (renesas-devel-2021-10-04-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 12 runs, 4 regressions (renesas-devel-2021-10-04-v5=
.15-rc4)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima         =
       | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto      =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-04-v5.15-rc4/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-04-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      022b9ed809ab70e8e1cac03f6a50d8cb91cf4098

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  37fa90294a830ccc2860b5c7378b821a686b6ca0 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima         =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/615b8344580369652e99a321

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/615b8344580369652e99a3=
22
        failing since 21 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615b85a7ccfa76c2a799a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/615b85a7ccfa76c2a799a2=
e7
        failing since 13 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/615b86f14332e84f5b99a33d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-=
hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-=
hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/615b86f14332e84f5b99a3=
3e
        failing since 21 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto      =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/615b871b163ddd899099a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-04-v5.15-rc4/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/615b871b163ddd899099a2=
f7
        failing since 21 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =20
