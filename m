Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83AFC413F24
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 03:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhIVCBM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 22:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhIVCBL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 22:01:11 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919BDC061575
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id c4so716272pls.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GdQjrGZ8RgXGDh0BRPBKTh1xkylHku0EW4ywon8rDks=;
        b=fZjZQEfB7dSy0zPEiec7or/sJEjaac0lMXmXIQaQ2MMmkAyg2qMplyG7J11PzAsjyE
         re3Czf9V4WfjGHgJ0K22wFJ23hFa2U3EC5t51MPnkXjfxNLfC8PeUMAdXhxXfmGHVtEy
         SO+xrPoTyWvPE90K53SjSijT9ZuGpvQjgdlhCUx3em84CgGnS5ay0OCPW5zI0xZNMASU
         yDS8pIoAWmrf0qFn2mhVWrTOteoWw7Kbb1AnXinz/n5SHa0tfWXzdfYdLCmpfUdHCJil
         0tVEf3ED/+Wtp07ZsFFll4zFch/TWy0glWG16yrkbm1qDtv9YUVoC8IxC+9sDpD5FSgF
         +yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GdQjrGZ8RgXGDh0BRPBKTh1xkylHku0EW4ywon8rDks=;
        b=YIU98MH9zP5cEPUG6E4Fj0wKPeoOPvAxE8EvAujuB9CQ7M6AAD3CST+Apqdm9TO/93
         ABKe2PxsS74wIvfcLWSRb6fsmU8s3u1tuh+QjyWe9gT34aXff2q55q+dIo2zY7U91l3u
         rLLlC1HwruFBhT+h4UbOOQBPouPBmUjC3p17l+JLrblq1OT7PN247vreyREQx08E9Atc
         qP3NMgKlCcIS+VOcrqWdEUiHYYqhFEQvcyFz6xfuk0+tQGSyzotoZEuqJh+gNMWr4iDi
         q5RYwfqDMOlQTGTtN0TZlMpd9C16N9/rcU61eQWA21kQ4pokNExDKBfXYGbC5EOtQ8ET
         IhPg==
X-Gm-Message-State: AOAM530F39wRjlXsrwmOowIgIcIqunsvO5Z0tPm2gcFx/2dZJgDkjKZZ
        OeeAGQzf3OQFXHLQiJqqDTZ5f4lVuxJy6cvH
X-Google-Smtp-Source: ABdhPJy8gnJ367xQihBvI0zLf0kBodp283Siiasgirco0sYK9/FOWD+NmNde8+6uunqNrt7f6Nqliw==
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr8428669pjn.195.1632275981905;
        Tue, 21 Sep 2021 18:59:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v12sm307542pjd.9.2021.09.21.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 18:59:41 -0700 (PDT)
Message-ID: <614a8e0d.1c69fb81.1870f.1ebd@mx.google.com>
Date:   Tue, 21 Sep 2021 18:59:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-20-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 10 runs,
 3 regressions (renesas-next-2021-09-20-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 10 runs, 3 regressions (renesas-next-2021-09-20-v5.15=
-rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto      =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-20-v5.15-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-20-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      41c50f42a51cc8630c6a28e9b26f92d920e91780

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
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/614a75d3cac778522599a314

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/614a75d3cac778522599a3=
15
        failing since 8 days (last pass: renesas-next-2021-08-12-v5.14-rc1,=
 first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a775b0566b0f3bb99a30d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/ltp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/ltp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/614a775b0566b0f3bb99a3=
0e
        failing since 8 days (last pass: renesas-next-2021-08-12-v5.14-rc1,=
 first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto      =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/614a78013cb7a798d299a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/614a78013cb7a798d299a2=
e4
        failing since 8 days (last pass: renesas-next-2021-08-12-v5.14-rc1,=
 first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =20
