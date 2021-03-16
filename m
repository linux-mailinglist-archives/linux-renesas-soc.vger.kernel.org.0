Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9E233D3C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 13:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhCPMZx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 08:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbhCPMZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 08:25:34 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645FFC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 05:25:33 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id 30so12310401ple.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JE90bXyyZAIGIyl94hhTvgaRv8YTDee26079BnzBgrY=;
        b=R8EhgEgGXvUTXmoNAyfjgcrQqoZnXsyvDkSf+1ZyWKOWaeXpZgoLY3KF9AHef1f/Dt
         SHB6BoxRi+Vq+MgJRXFD5OoaL8i0vJWMjPCdqn56gkyqIwT37M+Qok3qlay17e3qmgs5
         dyo2oB0LV0Zr9W9od3defnzYJQz24cJpfFTHLJPT3SnSdrneLkGjXaZhhJIogEV8owzo
         B3AvBioRW8zBxSAYFZKR2Em/gZzQy4eHD4ooEiwLV4L9ksWtHowH5rMwkMr7wKWPH0MU
         KBQ9e1gKw8eefYwS0POj9caAQfRCLcQXstxTplw46WFULGkkqWFlsmcKryqi24k2GkWB
         Rpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JE90bXyyZAIGIyl94hhTvgaRv8YTDee26079BnzBgrY=;
        b=snKvqqS+65wnEpwZm60PWF/V5QP6226EdycE+dcWeqViROlthotvAQx1+kEil097O7
         s7e4zqMmT4xKFDkjhSk137r1fgz29fKIRpkM3gQqWZKzxewEiWq7QS+1eb7Px1Hig+9N
         ffg2iKhLC5vPZrlwHQJ+oyVAyFJUL7Jyi7KXULRxs2UveGggzWY7rX+EaTOI2rn//zM/
         qyacjOBKvddFi48wnhFH9GvAqnKhM4i16GhtkU+uvrqEGOA/JPrSUp7ILr5lDmA5hVfx
         c/2EVrBQz8SRKw2JcL5G4bPVTaFHYCCf4cLVBOZThcNT4J5XcRk3gCnnB0KQPRC5Q5XD
         U8Iw==
X-Gm-Message-State: AOAM531/uYZIIDAFlTGiMdxzOgyY90XjPS0EIA7JfWyOhnn+Wy9IBtoK
        iaKc1jdQJvFQvhhRq1SC2ayHd+X8ioE6FA==
X-Google-Smtp-Source: ABdhPJxRMgccjdSPHv4GwfelLoVYI2n1VLNrUYSEf3asZLQv2oBWWPUBS7IF0/KHv6tsfl8FKhjAbQ==
X-Received: by 2002:a17:90a:5b0b:: with SMTP id o11mr4712486pji.18.1615897532843;
        Tue, 16 Mar 2021 05:25:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gk12sm2840447pjb.44.2021.03.16.05.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 05:25:32 -0700 (PDT)
Message-ID: <6050a3bc.1c69fb81.332dd.6f8e@mx.google.com>
Date:   Tue, 16 Mar 2021 05:25:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-03-16-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 10 runs,
 1 regressions (renesas-next-2021-03-16-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 10 runs, 1 regressions (renesas-next-2021-03-16-v5.12=
-rc2)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-16-v5.12-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-16-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ca7b445e2e7b0cd757c5c29249f37baf9ca71747

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  c4f669f13106862b6d8be38adf7825ae00ca7ac5 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6050a0b61c8c2f3e14addcb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/ltp-ipc-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/ltp-ipc-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210208.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6050a0b61c8c2f3e14addc=
b3
        failing since 0 day (last pass: v5.12-rc2-14-g6f56f6c26099, first f=
ail: v5.12-rc2-21-g604bd2d4786e9) =

 =20
