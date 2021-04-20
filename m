Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C7E36500F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Apr 2021 04:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhDTCBy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Apr 2021 22:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhDTCBy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 22:01:54 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CB1C061763
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Apr 2021 19:01:23 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id p12so25550037pgj.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Apr 2021 19:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LlFYROiz629P24Lfh0wmKvqKCL0wk7OZmlOkXhVWrtE=;
        b=EwPmSFH9fu79OjizKA4AUXac3f+vcrDehff6hYHPZFNnGN3F51/xjjbsbAAAfJJ2vV
         4by5i6Lpo4sg8uJWgdKymCPM2veK+4nplWRRy6ZDdOOpjKA0JgKSpced3Bd7qJQxNfhm
         E6TQEh5OJJZwsZ7o6IsWXtOznlrZ9NVPYKsAnFgDyfOXww1FuK9WtN0tAqqT1TFf25K/
         a/hBIv9QLwx5inHOkLtYTLVbzHjbgTf3+E9AIbIqyXWsBugizUjhkoMFyymo+73Wu7Z4
         y2RU6RgV7bIpLOvuEkCAchsrpqyuQM4XY+XEMkQJXIZhcn9FQyqADX9OkBljYfLAx8iX
         YSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LlFYROiz629P24Lfh0wmKvqKCL0wk7OZmlOkXhVWrtE=;
        b=Ho2YcIExV4UI4V9XzAwMLuY8SZ6lZ6d5QAqbijctRjzXqVxitip7zuJ4XFmoQB1YaY
         7ZVZ5tM0voFD3CRlj5cRzjXAEd4dny3524axS1oW2nibQ87WEn4lrj8Xkf/CNnkd7yRc
         yNtnCRUhPhwBzYkT62B1/sGKFoXJ6wUmkyJFazc9JUBZgLKb+v2DW/IQGA5B+hvzlsuP
         WXX7awnJW1AuyLg/wYyaU1pOqHPiKf1FqqbYueymMdGsjTpm85z/eF6AC0sXhj34shrT
         255Vrx3QAVUGXxtPD34FDhUKTvQ5vsjjVm10TxdVWJkXIzMIQO2d0ELt2nz7fEjyFPEg
         Q+mw==
X-Gm-Message-State: AOAM533gy3mfNF1MfVVmaDahes/9Nmk4f6+nOZpFC7g8xG+csgXkwzvW
        qffX35/30vOH90vR3i2QdnBgMxWz/8PBqeuj
X-Google-Smtp-Source: ABdhPJxsg/aEiVUhT5akgA4wmjX8akPaPICJ2ROWDqXCVnwaapLjU+80dJ2LWEkN89+Vs4JdN7SjYA==
X-Received: by 2002:a63:40c1:: with SMTP id n184mr14490430pga.219.1618884083290;
        Mon, 19 Apr 2021 19:01:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e190sm13356071pfe.3.2021.04.19.19.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 19:01:23 -0700 (PDT)
Message-ID: <607e35f3.1c69fb81.37305.3c85@mx.google.com>
Date:   Mon, 19 Apr 2021 19:01:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-04-19-v5.12-rc8
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master ltp-ipc: 10 runs,
 1 regressions (renesas-devel-2021-04-19-v5.12-rc8)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 10 runs, 1 regressions (renesas-devel-2021-04-19-v5=
.12-rc8)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-19-v5.12-rc8/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-19-v5.12-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a07b5a56e02f9a237f18f2335bd7f029b63739e3

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  3e0e60074495e1c350b634848e5dd1f7993ec2ef =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/607e34eac489a5dd119b77c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-odro=
id-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-odro=
id-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210324.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/607e34eac489a5dd119b77=
c4
        failing since 12 days (last pass: renesas-devel-2021-03-24-v5.12-rc=
4, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
