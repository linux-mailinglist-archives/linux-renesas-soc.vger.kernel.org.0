Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113D44271AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 21:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhJHT7n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 15:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241709AbhJHT7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 15:59:42 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0F1C061570
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Oct 2021 12:57:45 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id j15so6846776plh.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Oct 2021 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ioOw9pqBkdzONQTs75H9lBWLLhMFYDms9zLDXPYXt4c=;
        b=6/VQB5Es8QnRL50TXtN3e4gZSEr49nZOQtaeKdxZH/9xh85t6GYzr/slcGhNHKCi74
         iQ+fSA+iPdz+anBcp0b7rdE/PBG2NeQoFVDwzqri77qtSSpZ4NQ5TTcNl7l6TOLq1nq1
         xcUN2veV6V/jltCp3zp2zvd7+qFJ7bDtnHJeqswUCXqruP3JXkVH1k/dqn7VpeY+KVNE
         U5w4GS4byuuKiP8O/97FjkpnmkZnBOxDfCmAStphrEy7dq1bRT07aiBe1jWSvI4//6GR
         kdzSlQDSszNLVlyEX9bn87C8bR4mUUipFFa5LnelJV4Oban+mgI75B/xoEqRqDn5Zcsm
         Fk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ioOw9pqBkdzONQTs75H9lBWLLhMFYDms9zLDXPYXt4c=;
        b=qWw9JUX4Zbb9nWQH8hWS4CfRbyp99oQYBAJCvXjgNO9RMeRfKfb5qxt27d7/6vjYTj
         k8EqgG/lgOZkaIDpK4IkNXPmnj8nhJvKdHvVAnDdoiYBhny+MkHgpLX1fLET9F3WZBSO
         LsvfpGVtgznWKSkZpnuktdJFKw6cnoNMJw5/A9F3Yb1ipuyk6eRy86gmPgMi9UHoWeQW
         J753L0/chPyAoUYuXjXNZvg363dZ9Ptg5Ox4B1UYEs6yqpPSlUzuX1/nKVrgqnv1WzmU
         JRgDLAvj3+7LSGZpiFx9y+8Sq1IDxVu4XFVE05ly5Jh/g634MrGIt5R/IBaR/HOvCXjY
         U5XQ==
X-Gm-Message-State: AOAM532ji1BVc9m/5ExNFOnhrWVFMN4QbuiVANP424u9AhpoIIpmQVuN
        juOcY0HOJaZTY/kyIXdOPzqnnCQCeO9dozhu
X-Google-Smtp-Source: ABdhPJycYxg65z/VBafQzFoUc/++G67fPzwoLpkRUE9u9sNA6eFXRd8DkKDFdmc9kSlrGmjB6Vvl6w==
X-Received: by 2002:a17:902:6ac2:b0:13e:2b51:ca27 with SMTP id i2-20020a1709026ac200b0013e2b51ca27mr11133871plt.65.1633723065290;
        Fri, 08 Oct 2021 12:57:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id il17sm72623pjb.52.2021.10.08.12.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 12:57:45 -0700 (PDT)
Message-ID: <6160a2b9.1c69fb81.fb1c9.0532@mx.google.com>
Date:   Fri, 08 Oct 2021 12:57:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-10-08-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 10 runs,
 3 regressions (renesas-next-2021-10-08-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 10 runs, 3 regressions (renesas-next-2021-10-08-v5.15=
-rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto      =
       | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima         =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-08-v5.15-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-08-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4dad7e7e2891c1acd6d07d221d854f2d67fd30a9

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
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61608bd6d1144a850599a305

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-08-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/ltp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-08-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/ltp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/61608bd6d1144a850599a3=
06
        failing since 24 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto      =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/61608dcedd31d9335899a305

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-08-v5.15-rc1/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-08-v5.15-rc1/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/61608dcedd31d9335899a3=
06
        failing since 24 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima         =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/6160919834e75fe39e99a2f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-08-v5.15-rc1/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-08-v5.15-rc1/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6160919834e75fe39e99a2=
f5
        failing since 24 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =20
