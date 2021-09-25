Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B675B4181C1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 13:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240182AbhIYLwr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 07:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbhIYLwq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 07:52:46 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67083C061570
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 04:51:12 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w19so11210956pfn.12
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 04:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1dnb9i9oWiBr2lxOUcvhm9fWFLasibJanDGrBHEhap4=;
        b=Fqp7IbcaRq2Mwixb3NWLoKtGcvNl312J3cEVAsN52uDXaWHsYjTLEoayyKukGGdnJd
         PyD/c4/Z/DHx8NCqh7owMEkfGVJkevFi6qFoQCNXZSAfFY9E4hIRRgxQNtTYqftCLcsX
         YUTkYFkY7Cb3DnBT5NI4ZbT32QmhL0Hdyt87i76Hl7zK4mknanIcU53nCoJBd1PTT2wp
         gGIgjuQXcVo+TozkUFOusQRvrc0/kDZHEfqvYPBCWwecWVOjDv2U5SL2V0zUE1ZwwXLR
         tz0QrZqm+nV0wCEFi0m2d3Ux5wPzgRpvLytJs/Tq9XKvE7S9gunZNBkHoOJZ9SoezB05
         u8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1dnb9i9oWiBr2lxOUcvhm9fWFLasibJanDGrBHEhap4=;
        b=W9JlskNtswVtUgJXtBSrtRL8oiWY6s3ogZXaQH0bUWCkroE5uoqk2+e2no4RL6tcoz
         n4n2XlBfrPv0gJMcPtwNzKM5tIZiGdJAF0W0ZQzxYYjuLZ62En8YHVemRw+pbcwdX09T
         /gwTTaxplxa1+W5mlw33fG5049SMKRuRJq0gKKtolj9KJoqx2cPo29m1tYLR3KeDWAe1
         31tW5pE1ZA0OqQkkW5N2d+R2ysT6WtB4pCeQJqbfbF9Dv4pvmqCjKQowLpiSAQbmcy42
         ZSa9MRY9ZjLzCBEDbf5BNL0BSKSifH52GmJpT1/l6BR3LR+ngKFPFQYVz6r8BZMvMDmm
         mKNg==
X-Gm-Message-State: AOAM532fxVVrahxeXeIyEYYWdTmWbaiNot51sI9OKU4sH7ba4iykJ1BX
        GtC7Ye0UFd6x8viGsZiEi93VusoZIzYwvPxO
X-Google-Smtp-Source: ABdhPJz2QIx1MzjxpuWv77kzhakIhE57dR2YUhK16tiGqk3gntiwLNih7XU8I5+H11yRcSeedGjslw==
X-Received: by 2002:a62:184c:0:b0:447:3cf0:80e5 with SMTP id 73-20020a62184c000000b004473cf080e5mr14177647pfy.54.1632570671776;
        Sat, 25 Sep 2021 04:51:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i7sm13081647pgp.39.2021.09.25.04.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 04:51:11 -0700 (PDT)
Message-ID: <614f0d2f.1c69fb81.8bafc.75b4@mx.google.com>
Date:   Sat, 25 Sep 2021 04:51:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-24-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 6 runs,
 1 regressions (renesas-next-2021-09-24-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 6 runs, 1 regressions (renesas-next-2021-09-24-v5.15-=
rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig     | regres=
sions
----------------+-------+---------------+----------+---------------+-------=
-----
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-24-v5.15-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-24-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3b298ae535792fe0eda485add5fc0537c9ea3f0f

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  37fa90294a830ccc2860b5c7378b821a686b6ca0 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig     | regres=
sions
----------------+-------+---------------+----------+---------------+-------=
-----
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+ima | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/614ef388716ae487a499a344

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-elm=
-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm64/defconfig+ima/gcc-8/lab-collabora/ltp-ipc-mt8173-elm=
-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/614ef388716ae487a499a3=
45
        failing since 11 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =20
