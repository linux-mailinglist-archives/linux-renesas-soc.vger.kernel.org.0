Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0B83C66A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 01:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhGLXHY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 19:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhGLXHX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 19:07:23 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073E4C0613E9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 16:04:34 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id cu14so5702686pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 16:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MNh6xIVXd5EPHoFfVAxRAHcKjToStnP22h1iJerkkpQ=;
        b=EhfNoHYajQMYwn0Uz/HilzzrqybtFrQMNLnsAod7Cnrt7rthBuKp+7SZswfsT8SCrv
         UjzrxTN4MfXqy/s+zaEFdnH6XL5+KAY7bxakHCYvv/hQajWBdBUbxmM8YjAa2N7I+uCt
         eJ0wtXRkV8D11LYsl3qtt+2a0zZh50w4H4BOqoog0vDnRbhHgSewRyVZWInacihHEPkz
         5jQxx55/kffcQTzakHghnFBOHRK5RKghQjMhbpVdGGQar7OggbZ1G1JTfC5Lo8aGYR8f
         X6H+hcibJ3LUp1W9C0+KuwhdRRFItIV7TY+17Aopr/Ru6t6IXvnn+dJjJki/9alCbh+l
         a9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MNh6xIVXd5EPHoFfVAxRAHcKjToStnP22h1iJerkkpQ=;
        b=asKmR7HEd4qaR6ccbtmxvn0ypwGb0K8xYOInn2rH3VYpHUXKePiAA5jhm0CtRB8QK5
         fcir3QRqPf2uPflEwMK0lWhzkm91quKmUCAAtgn1XYWXlgNrUiNBFFxcPFd5OYtGTFK2
         g35EX0NDK3bTBEomgSNeD+xufP2S2OQbprWtr5eu2VFJXNddpWWgrZPOEc4oWAOZdZmB
         7LEcZNiD3iFii2XOi+bk68twMT9Y/sK8IxB3+DqdcQyAcw0Bh5JCraWWS0xYMhfPh28R
         pX0uGEq4uI3CeFtSqXzsswD4NIu5kR/bVKS3JLBGgcP52vQNUckZ9n97Tu6VC6iNUJEf
         Um7w==
X-Gm-Message-State: AOAM531x9TU5KrXLhuaeiOcSp8SRLBxlUcfnTmarg2PBuXFmrmj+BJSs
        hORgZhUz/ypAuWWY0LXpyFGE+XQakQ2oTxIp
X-Google-Smtp-Source: ABdhPJzPIAQtQHCKuJjjbqb2kH5FQqkRSBvy52xXcRDEWeVlqLJMBEr9HVuFst+ROg/mC7g05VFMAw==
X-Received: by 2002:a17:902:b78a:b029:12a:fb53:35c8 with SMTP id e10-20020a170902b78ab029012afb5335c8mr978899pls.67.1626131074232;
        Mon, 12 Jul 2021 16:04:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x128sm9930369pfd.167.2021.07.12.16.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 16:04:33 -0700 (PDT)
Message-ID: <60ecca81.1c69fb81.ea160.d353@mx.google.com>
Date:   Mon, 12 Jul 2021 16:04:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.14-rc1-477-g3c037963715c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master ltp-ipc: 8 runs,
 3 regressions (v5.14-rc1-477-g3c037963715c)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 8 runs, 3 regressions (v5.14-rc1-477-g3c037963715c)

Regressions Summary
-------------------

platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defconfig    =
       | 1          =

beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 1          =

beaglebone-black | arm  | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
4-rc1-477-g3c037963715c/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: v5.14-rc1-477-g3c037963715c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3c037963715cb04671b4fed157cb11268b526adf

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  f631c87593cc624848c5b9521727d912a0b00b4c =



Test Regressions
---------------- =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defconfig    =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecb9825506363219117984

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ecb98255063632191179=
85
        new failure (last pass: renesas-devel-2021-06-14-v5.13-rc6) =

 =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecc0292f4e6ef11c11798c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ltp-=
ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ltp-=
ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ecc0292f4e6ef11c1179=
8d
        new failure (last pass: renesas-devel-2021-06-14-v5.13-rc6) =

 =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecbc3f01ba239bef117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/omap2plus_defconfig/gcc-8/lab-collabora/ltp-ipc-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc1-477-g=
3c037963715c/arm/omap2plus_defconfig/gcc-8/lab-collabora/ltp-ipc-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ecbc3f01ba239bef1179=
78
        new failure (last pass: renesas-devel-2021-06-14-v5.13-rc6) =

 =20
