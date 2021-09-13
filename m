Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689CC409F3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 23:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245192AbhIMVhE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 17:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345063AbhIMVhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 17:37:01 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36379C061762
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 14:35:45 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id nn5-20020a17090b38c500b0019af1c4b31fso304963pjb.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 14:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x+mkmoDidc0jJWuHSJV9yDn6sG3CJdiW+hXWKmuQgoA=;
        b=zpkoUAwfqwQmKz25oM3Cj+HElJepL322gDEvxhksbCgfrFkSi9rZ2I7UCtFrmz3Rkk
         YuoCz0K+RahEjfQL8qdUH0NgTOaXw5V8vTVVX6wjnSWmjNW57JOY4HmNuHHBfBJotO2z
         YiA8B59CNtGs3rnIylMepaoZwppDM8M2HjxQBlL0ljdGKtQqRfnbvRYP3v+daYYAkwVZ
         eQB3gBYUp+NtoRr2f0vwJNWm9pcnxeAlFcH7Nkw5wc4o1nXcUp+dSFgS2ZYqEi2GMPb/
         6T3oPWDKS7xYmvZuLD0NDtfbIARregrO3VIx1btAeAhS3lYoMQwGaghh/ClewwWDtxLI
         Ve0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x+mkmoDidc0jJWuHSJV9yDn6sG3CJdiW+hXWKmuQgoA=;
        b=MnLy6tYgvXPV5utWs4/JQ5mHCzSqsYceRdvS1zVfxRT+BVzaL+NHSglAeU/vrQtZeD
         ccFG9uBW9FYdtvrSOp/YP1zXOdW7vSVg17ujncuOTasa0YI0dHFKsKcdrWkuwuaUbscl
         Ef2nbqduxbpU42iRB6Nfy7disMbrH1Ysgi9tzGAstlpmyJKSQ+efz6jpbkriPjgB/wlB
         pNSOPK2ENurFlm8aE7et79uf0f3Ljxv7ep1SMRYfEWi9wB3v5qHq5HTwl37s6HN3/Ddb
         sJRKcDrQsU4PUMuxZBgFLIia7UC2zeIg/MvWN5DxyHpwzHi/OUWwC4Rt8TDt/6+BJ3m2
         rYMA==
X-Gm-Message-State: AOAM532NaYqnHzGQhuBcHaE5quEurT1dWkQG6ru5LvuDTpPBKSDuKz0g
        1fju7m2u+ml9BM4XlcgkBZzhmSsxf2umzihG
X-Google-Smtp-Source: ABdhPJwk+d4BGZkQvDZPE5Fv3YREFmjySnaGzXQuGjqmJRaU7VoGkDU6FsmxRLt3XsvOJ94hNOj1QQ==
X-Received: by 2002:a17:903:24e:b0:13c:49b6:ee98 with SMTP id j14-20020a170903024e00b0013c49b6ee98mr2192288plh.51.1631568944535;
        Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l9sm7756849pjz.55.2021.09.13.14.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Message-ID: <613fc430.1c69fb81.2a625.6cd5@mx.google.com>
Date:   Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-39-gcbbd8f16ae1c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 12 runs,
 4 regressions (v5.15-rc1-39-gcbbd8f16ae1c)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 12 runs, 4 regressions (v5.15-rc1-39-gcbbd8f16ae1c)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima         =
       | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto      =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.15-=
rc1-39-gcbbd8f16ae1c/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: v5.15-rc1-39-gcbbd8f16ae1c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cbbd8f16ae1c24d6f82712bf5ef798a8a62b0233

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  feb7725b28e877f8a11b2e64c16970c16bd5765c =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima         =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/613fac2e772610efa699a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-hana.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-hana.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210827.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/613fac2e772610efa699a2=
dc
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/613fae66414f5a650299a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210827.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/613fae66414f5a650299a2=
f4
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613faef6049cfd460999a35a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/ltp=
-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/ltp=
-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210827.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/613faef6049cfd460999a3=
5b
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto      =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/613fafa15016e1dc9a99a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210827.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/613fafa15016e1dc9a99a2=
e7
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1) =

 =20
