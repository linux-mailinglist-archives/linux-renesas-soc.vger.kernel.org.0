Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A878C3443F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 13:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhCVMzv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 08:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbhCVMxT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 08:53:19 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA05C061763
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 05:53:18 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id o11so8553671pgs.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 05:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rO/9T7JMR6WEB+sO33ltV8T7u/FOJCDOWVhEj45Z4+4=;
        b=GWqRyEfWrLaKg4RTYjJwSpJkudadq0UHb8XVCFughQ7MPhpTl3Rt+8BxWEme2+pDIY
         itd/4QbLmfyTFSNecxG1NYecav+nZplmdSMfQcGzY0TK/wOgdkRGqTNhhEzNMwILJ20Y
         bN7O2Gcn6QDWtrpYZHY3Jb8GU10whzufaj6GAJ9mKvsDy2ryPsSGeEiob+Skr5asJpDC
         ReLh5Ev24pVhkSD9M3WM7vBFcVpKtDaNxQS0ddKEOqCR9jAHs+wWjrGnjPqFqF4rOr99
         WBw4yVrYUU/qAZBMc5T2xvQi6t0d57IduQNutfzdmY7XWY2r2oEIsgYtoYjE1U8PyiwE
         KoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rO/9T7JMR6WEB+sO33ltV8T7u/FOJCDOWVhEj45Z4+4=;
        b=akmvK2ci2vAzluJfQDyFHAzxm9i/ajzflvQhWLMoxNL294ENPqoEWVSx5ULA3wS8KK
         cPhG8vuqfImWgJc+J1pjIqxhuHAMNA+Sye2tMbokvlVn/TNoii6UBkEf4r4Y0a4sv8jq
         OdIVWsX63fxeAfhTGS8QHLge41b0/x0eB+yNZ0ikT3gJOwb5Jmkfw2RAMTyIHXNW4980
         Ch8oT/yvOQwzdEm8Ldyrdzlt4M5R7PMQhZcvBfhEecQXDYN7Xu87BYghrGVM6Kl3+Yb5
         2bwCmL9qYSyfeiFGfGgI36X6UHM/vPODz8rvIQ6ftNpncY9gaPhfwtqPwld1qS0Doe6I
         /3Vg==
X-Gm-Message-State: AOAM530PDGlPsiYzbw8FdmYklF4U2yNE4UZxt+Qwlpj5gYB94E2uvNz9
        jkl/Kfj7bghes5UDOUHMT1RkF66nG9f4lw==
X-Google-Smtp-Source: ABdhPJwFP5mVICLSsnBKIix6Lomu63VZ2+WGj0H1HfwD3FH8jclrjA4FJrAscYa2uzjdG1EvZFiizw==
X-Received: by 2002:a65:63c6:: with SMTP id n6mr23109173pgv.298.1616417598181;
        Mon, 22 Mar 2021 05:53:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d19sm13553173pjs.55.2021.03.22.05.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 05:53:17 -0700 (PDT)
Message-ID: <6058933d.1c69fb81.97cb.0868@mx.google.com>
Date:   Mon, 22 Mar 2021 05:53:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-22-v5.12-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2021-03-22-v5.12-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2021-03-22-v5.12-rc4)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-22-v5.12-rc4/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-22-v5.12-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      98d704ec88d32a3ece2e35f14ee85c45fe9d5d9d

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  02f295d4c4c1b401cdb589df5bef2645c7f83813 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig | regressions
----------------+-------+---------------+----------+-----------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/605881f95bca432b63addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210315.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/605881f95b=
ca432b63addcb2
        new failure (last pass: renesas-devel-2021-03-16-v5.12-rc3) =

 =20
