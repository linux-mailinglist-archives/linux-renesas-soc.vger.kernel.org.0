Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11118409E0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 22:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242672AbhIMUS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 16:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242637AbhIMUS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 16:18:27 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E7FC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 13:17:11 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id oc9so7206608pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 13:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Y8zo3dIRqhYz4z9qfDZhwKSgRhKaFbIyD8smB7WuxgM=;
        b=eWzwKZ3OWYmX5ywsgcYn0KsNbzNpZe22ZRK/ETq4iVyDz/GW98WlL1cONlu0dgwEfR
         t3g1xxjWwcFmp8OgBQSw1z/yJRG2KS2AYdKzD3m+XTB4CllJpnNyLm0l494EjEZPPoAK
         MK01S9kmgIuTkxnJK6NVcKrPDMb3+oIXDGsaIc/J7vqo9YioBinmrBtK68Es5qB4vHid
         92Sif9lAQh+79mtnpxr6Uqss+Q9zosYzTSG/k3O3vdMlGGwVYlVCRAdlhWwz0WPMOCC5
         G37ZnYto/uB+ju/WcN6aVerVGBudZabWa5Znke6uIYt9xhGhhR6xhN98pJOttmzhqDl9
         Iy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Y8zo3dIRqhYz4z9qfDZhwKSgRhKaFbIyD8smB7WuxgM=;
        b=GikWszVdb0G33z5m60Hdj6w3XCvYmugBRZRvxaszaZ/dZs128CvtowK4t8Nu0jrjM5
         ofNYS5tDVLnenuXeofF9zmbGzDZ2FpJsgKWiaUprljseqjDxvjRgFN1tdger0MmqsVui
         LpYwvotFpcp8wQI1t8tT/HrlHhJNTCPkjC127ChUKFR1AYdtSvCg354OVaB+nSWP/6tG
         lrHAWRByHKHQFA89QeX4w3ZKEM2hfL2twE+K47BZllf8O5qq9nwWWYlwj4pYXsllwDRD
         O6vKnhbPP5IuzAF1l7jiHA/GEXZcG/jAkYZ3CoDXCvsrQKAivvib2FYPuLf+pkuMArhK
         pEbw==
X-Gm-Message-State: AOAM531AEIyDBGs1zKKBP9SxnAZKEEo5yxBWaPvPw5uC17kvqoLOCpv/
        5h0GU+P+kxqxUTCGEJ5effpGCmYS/Trsl273
X-Google-Smtp-Source: ABdhPJwJzDel1TZTBorwcLf8gXsxVAtSUJNkCz+gR6u7BAfrygtHjp4w9OZMRjNII3VocZAXFCw9AA==
X-Received: by 2002:a17:902:780f:b0:13a:3919:e365 with SMTP id p15-20020a170902780f00b0013a3919e365mr11972360pll.63.1631564230386;
        Mon, 13 Sep 2021 13:17:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d7sm9304940pgu.78.2021.09.13.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 13:17:10 -0700 (PDT)
Message-ID: <613fb1c6.1c69fb81.746c3.b1ad@mx.google.com>
Date:   Mon, 13 Sep 2021 13:17:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-564-ge23d26d2dc9a
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master ltp-ipc: 10 runs,
 3 regressions (v5.15-rc1-564-ge23d26d2dc9a)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 10 runs, 3 regressions (v5.15-rc1-564-ge23d26d2dc9a)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig        | reg=
ressions
----------------+-------+---------------+----------+------------------+----=
--------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima    | 1  =
        =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig        | 1  =
        =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto | 1  =
        =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
5-rc1-564-ge23d26d2dc9a/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: v5.15-rc1-564-ge23d26d2dc9a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e23d26d2dc9ad4831b447fc9ef348b1621fac32d

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  feb7725b28e877f8a11b2e64c16970c16bd5765c =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig        | reg=
ressions
----------------+-------+---------------+----------+------------------+----=
--------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima    | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/613f9c8ecaa0d57ae999a2fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210827.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/613f9c8ecaa0d57ae999a2=
fb
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform        | arch  | lab           | compiler | defconfig        | reg=
ressions
----------------+-------+---------------+----------+------------------+----=
--------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig        | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/613f9fa4816dbbbe9a99a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-hana.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210827.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/613f9fa4816dbbbe9a99a2=
e3
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =



platform        | arch  | lab           | compiler | defconfig        | reg=
ressions
----------------+-------+---------------+----------+------------------+----=
--------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+crypto | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/613fa0a983fddc592f99a309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-=
hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.15-rc1-564-g=
e23d26d2dc9a/arm64/defconfig+crypto/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-=
hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210827.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/613fa0a983fddc592f99a3=
0a
        new failure (last pass: renesas-devel-2021-08-23-v5.14-rc7) =

 =20
