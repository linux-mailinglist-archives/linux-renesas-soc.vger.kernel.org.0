Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C28352FD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 21:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbhDBTfJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 15:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235256AbhDBTfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 15:35:09 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93FDC0613E6
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Apr 2021 12:35:06 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso5013369pji.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Apr 2021 12:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xse4oVJOPyQaTplfgWmGHoV9IERYFo3k1hPSmsi7Li0=;
        b=F7KBWNy/lDa4lwkHP4Hy4Ncfdl5DfneUI8pA/DoYogJeDm/Pc1agziLBPppvNjIV2x
         9L5QUqngIZOqoxHg823dIqCrzLgmGH39vmbVxi+lO6F3SGchcSN6UeiY5SeJxv5OqTwD
         5bHUDCEcmMjfxypd9W1s/WRFXIw7EoeCN5XUGLK6giKvuND8DwZ/HDZHTxbB6vR9W/kY
         xa9EEG8H3+Ug5xkSaQ+GG2nEsn1OFHnikchhgRHg11iiwZLGm8v5xlZF3+AD8gXPvXkO
         VaD0pa3LbbkQs+8rbyzV/40V2v4PhDZGMmEe+7UrorTnVi2RTaPeCVAkBj+6xmXhTPuR
         0N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xse4oVJOPyQaTplfgWmGHoV9IERYFo3k1hPSmsi7Li0=;
        b=ZzQaWo5FUSaeGx/87hOJsX4C47Ru3Xb0dq3uP9PCTSuFfGOYvdkN3o6BC2Mwl3a9Ob
         6MzEPv8SySLFnNXaASJ9jMR0Oj+/lvA0Ecuu0pc73Z0KiqV8AasMTWB0918w1SoK/fhQ
         CcCAdsiBbMl/6UtmT7ok2jQcKslbikGbbMYexKrTUTr7qKak1AMmqJev1QlpFVuZFfk4
         dZJtBmSC3xz3WjjqE6El4SC44fb8AhE+zjmZrNcPoOPCsNfM/ea+ZeHEEvVggjqiWfHH
         Oc9d2X2Gs4iT5qqjnNjrHg+PdHIio1MocI8sgYXX+1R7iFiLQZ2qpYwjRKCxDdjgSAws
         UqWw==
X-Gm-Message-State: AOAM5330dBQCOYlOwtHkzRNiYUZfsQV5tSmjlnworkeEHzj9PHpLdDXl
        MTIBn2fOvUPAHjBC91+1qGVrI5MZzfYe5Q==
X-Google-Smtp-Source: ABdhPJzL3fEJXSPLeyi2I0WWx2NYKhU19exYVR5KO9HZ6z/7jU6CuyKTM07DJa4wuynEU4jqwKOasw==
X-Received: by 2002:a17:90a:a603:: with SMTP id c3mr15115033pjq.107.1617392106073;
        Fri, 02 Apr 2021 12:35:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v27sm8765343pfi.89.2021.04.02.12.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 12:35:05 -0700 (PDT)
Message-ID: <606771e9.1c69fb81.88502.6c59@mx.google.com>
Date:   Fri, 02 Apr 2021 12:35:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-04-02-v5.12-rc2
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 22 runs,
 2 regressions (renesas-next-2021-04-02-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 22 runs, 2 regressions (renesas-next-2021-04-02-=
v5.12-rc2)

Regressions Summary
-------------------

platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
meson-gxm-q200            | arm64 | lab-baylibre | gcc-8    | defconfig    =
      | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-04-02-v5.12-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-04-02-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e9903a1559e0802fcdc79f28c7e79db04a59678d =



Test Regressions
---------------- =



platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
meson-gxm-q200            | arm64 | lab-baylibre | gcc-8    | defconfig    =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/6067373f5194cf508cdac715

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6067373f5194cf508=
cdac716
        new failure (last pass: renesas-next-2020-10-26-v5.10-rc1) =

 =



platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/606741ec1e4f70ee87dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0324.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/606741ec1e4f70ee8=
7dac6b2
        failing since 11 days (last pass: v5.12-rc2-14-g6f56f6c26099, first=
 fail: renesas-next-2021-03-22-v5.12-rc2) =

 =20
