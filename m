Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADECB41B757
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 21:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242262AbhI1TSG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 15:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242422AbhI1TSG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 15:18:06 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C885C06161C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 12:16:26 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id n2so14843386plk.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 12:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yX6P4z2ZvnmZyiZc3QqHPxxuPgMvmcoF36Lsb55RFWI=;
        b=CjcQ8/7YSDk0AQ9el288JHvIvKxi74rCd4l0hXKY0I2D8xgTpwEOmxZtAZvLQU5LM5
         mDPv7MoiotXPww/ZlhQYgCCE1l7yIWcd+7+S2G0h6YMXzQKX0xXpZ80ngNcAObLcTttX
         b+dN9h00SX/QiBCWbQSuROXe66tFpabC/1lmR4ZU+CXpNw2hVQrxTbsbQAjaCPfUxocv
         uipc7W7f/y20EDt2APj5N28Fr8N9WDHFVttKlUoZ8mOatT+V42iQrUXb8F7sDYdZkjGf
         eJ3+fjB/sDFed7SR4HUIJtCNnMFoQge/510ZlMkO/lffTyAJq9W8N+AMYGQj853EJku2
         NDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yX6P4z2ZvnmZyiZc3QqHPxxuPgMvmcoF36Lsb55RFWI=;
        b=jT2yBOiq0ap0/vtMP6qefDz/RJJl88UWgmL0BWVLgmAFkrgcuWRmeqIxDlJfTD50Ar
         QiQbJWgLcHGuRDiJpq0E3wwOFiM0MsyfCsXp+Gw9PDm2MLcV7jKgDurbXRiFLSvaoZpS
         f+PKlwTnwsHd47okXtVddEetQhbAbOXXwPsceNX9OltV6dbt3N2JxD/KRTa0lIr9zIjx
         tcjO3s1eMfQElptUK0s3WkKoYPv9JFqv8K7T42X3+9JT1OAMP0t4OY+mlnsoaaacTsw4
         vHN/lwJu55uwVyScRq/ftMj8lDRujEcbaFlWOpZgWTcJH4AA8sKhT9AsjwLee78+nQYv
         q0tA==
X-Gm-Message-State: AOAM533uocNfzQH5D+N96h7Gj1SX5tbqYU9w3cyga5RGl1Yxxs7hWUDG
        29mR4T6HpnUF7LwvP5tCWa7wtmXZZezfFBg7
X-Google-Smtp-Source: ABdhPJzohbuCQjM+wJ2tXhue2ZEsmK5AfFfDcFwcPDh26YY9XxQzreixDfUr4GINnQdnQhe+aogQMg==
X-Received: by 2002:a17:903:11cd:b0:13e:596c:d9a7 with SMTP id q13-20020a17090311cd00b0013e596cd9a7mr1098951plh.37.1632856585824;
        Tue, 28 Sep 2021 12:16:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b10sm20932832pfi.122.2021.09.28.12.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 12:16:25 -0700 (PDT)
Message-ID: <61536a09.1c69fb81.23116.4154@mx.google.com>
Date:   Tue, 28 Sep 2021 12:16:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-28-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 8 runs,
 2 regressions (renesas-next-2021-09-28-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 8 runs, 2 regressions (renesas-next-2021-09-28-v5.15-=
rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-28-v5.15-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-28-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a462ac13da67252c742a2c044b302f37eae9d089

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


  Details:     https://kernelci.org/test/plan/id/61535765155a8dd4cf99a2fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/ltp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/ltp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/61535765155a8dd4cf99a2=
fd
        failing since 14 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/615357fa78805ba3ba99a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-28-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/615357fa78805ba3ba99a2=
ec
        failing since 14 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =20
