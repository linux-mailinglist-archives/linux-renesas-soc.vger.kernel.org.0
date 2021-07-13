Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C35C3C7A3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 01:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236769AbhGMXo6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 19:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235437AbhGMXo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 19:44:58 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4FAC0613DD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:42:06 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id j199so222396pfd.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gVnbqRm9OrJrqgIR8Ht4M3sbC3dqEr5wWTLyCl0NLS4=;
        b=s0dYlU51iPCsHx9N7/qWtbMSGH+yLoWeqRnQWOtVcJZdy000/fwj+zNzgtU7gYIUY8
         DxrhL0y+zkM8iU7Ow9IDGQefGxa1JvnmQd+e5c2w4gstMfUrtcKBP+CuCRkqWxytZxez
         JV3k/lyZSmhfNPt8LMLzpgAFTBElCxDRriki+s22dZURqTFJpC8J6X/9LRvLwM7WhDT9
         iTCSVnVubaxAG5TjtbO7nWNL4YGLOgvnRl/b8oHOElJuvMCbJrfef7h4yv8J4xrPainH
         ay+5YrJGf2cjiuLyDDf42xAHyufn95D+D267onKzoHDy4X28YlB0GO/D/n2YOWvsANon
         g8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gVnbqRm9OrJrqgIR8Ht4M3sbC3dqEr5wWTLyCl0NLS4=;
        b=RN1vxnRKMEKqYaf03HRb5HI0buY0SWY/dDZ9AqCT3Ukl+nDXdLF0F+9zefEh1g9P4d
         A/ypZWGqSM5lneQSI241x00BgHMY584KYk9qkPet4G6s2z++5gEiytoE7i/OUYt4hGE2
         KsgMMPimWeZ0sCpXx6yCj23oK8kcTSWiQbUEON+MZ1+rt9QTKsCXTQ2FNLCyXpOfxBZZ
         2WOe362DGh3kDey2Ph1Cfwww9saG7BeiFrj6ugxEGV6fNCMV6xuxcn3l7buZzkd6Y6st
         o0JWDTJrL8Nfsgd7iF33gFwpi7V0GO26K0RCUP2z0kyMO3wU7QRkK+iEZvbjvHXdy5MY
         +RQQ==
X-Gm-Message-State: AOAM5301Ipmgg7PsbRjuGVoSuz7wA52ppVzUZ4uuOvfRUK1B2VbSTies
        A+xC5ALId5LVklUFBbFujjuemzDqXpIwlT0b
X-Google-Smtp-Source: ABdhPJwqJjrXv66M0mFgSXunqotNwHBK2BQ4N01aLXTJz5XhkIloX2ZiCgkLPMFMCrL3ijReqYRCIQ==
X-Received: by 2002:a63:8f04:: with SMTP id n4mr6361975pgd.317.1626219726266;
        Tue, 13 Jul 2021 16:42:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l6sm268431pff.74.2021.07.13.16.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:42:05 -0700 (PDT)
Message-ID: <60ee24cd.1c69fb81.22357.17cd@mx.google.com>
Date:   Tue, 13 Jul 2021 16:42:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2021-07-13-v5.14-rc1
Subject: renesas/next cros-ec: 4 runs,
 1 regressions (renesas-next-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 4 runs, 1 regressions (renesas-next-2021-07-13-v5.14-=
rc1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-13-v5.14-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      51832d6b6211d53dd4145b477a0b0d0fc87d84cb

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  e4c91962f6e19466c1e43629a2c6cd04ff012e06 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0f5b2a7fdd51b38a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210709.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/60ee0f5b2a7fdd51b38a93=
9c
        new failure (last pass: v5.14-rc1-17-gcd117793e1ac) =

 =20
