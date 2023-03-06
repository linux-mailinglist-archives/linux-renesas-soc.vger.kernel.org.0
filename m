Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39986AC60C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 17:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjCFQAF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 11:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjCFP7t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 10:59:49 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804E9274AE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 07:59:46 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id x11so6345131pln.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Mar 2023 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678118386;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nSi6Y4m8Fjqv00zxn6MhvSi0dFaGZHHusu0SvQ+sc68=;
        b=pAfkxi44j8TurK0QCfmafIVTlW0GknoUwJWVx8YA8OwFVCLPUxlToYu4VFNd89Ddbo
         EOJNl7lWY4Xmqaz8xMdpLzxHOt2ABEKK15qICgbEISw0IVQ+90czapNyatM4c2Srze0j
         NKbmapP941qFd478IhOexP9bTpjj4DLkse1pl00SvtSiaJLLfu7D38OVd8MMFstIs0dk
         aySLpvAUACBXKsnEBMLJWEaiBKVcssDexxCTPfnw6NxgYxRQK2IRLxjJT+wyq3uebCnv
         ZHxIE6R5v6ct9U7vYDzBnTBVOjXC/7QcgU3Us1xa0lJEEH1i3DpqUdOqslWo5I8CXn5G
         1ywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678118386;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSi6Y4m8Fjqv00zxn6MhvSi0dFaGZHHusu0SvQ+sc68=;
        b=cssNZHdrPCN+KV2SlsrW+dUvcFHDLiIeQU0MWjJgVsEVzCht4hhAw31rDh98hnH5V3
         Jk45fCCoYeT+2YLBSBDpbqkCi0yjqucy/egdX1L8XfNLCJ2fV36r0o4lMcLhHFdYA6C+
         YQe9NKNoUe6Pg+ztR5aaeOiWg80JXuqwp4TSpQIGRia+vPvN7IGoIVipQ4E9wJ36+VQN
         y/PRQIG6ghTY1//Fsf0feaYU6oB3IR5v9QcFM4KNA/0O8ABhroMgSOtK1Nb4cOSebwoY
         fNdXF66xkw7aLVkZkKqndy4NVv+1W5wSqy3ae7UUx20TchYlfSIUzTPAhp2PUs3q8WoW
         rPgQ==
X-Gm-Message-State: AO0yUKU2E9RYmMrjGWFtlBGkpJcF/RKfOMdEgERRph1ohAnnJmWJ0eR4
        gPL4yi6mAo7FdqRqOV87aN91WW5rKbCtX/x4Kom/7g1Y
X-Google-Smtp-Source: AK7set+JDipvvtW0GHwuRYKJ578engpORf9Gx2gaxhSOqjTHoAmCPoOylM9X+mEr+sRmCBIyMuoG3w==
X-Received: by 2002:a17:902:f7c2:b0:19a:b588:6fe2 with SMTP id h2-20020a170902f7c200b0019ab5886fe2mr12359675plw.13.1678118385782;
        Mon, 06 Mar 2023 07:59:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kt4-20020a170903088400b00186cf82717fsm6954059plb.165.2023.03.06.07.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 07:59:45 -0800 (PST)
Message-ID: <64060df1.170a0220.4aa99.c671@mx.google.com>
Date:   Mon, 06 Mar 2023 07:59:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-03-06-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next sleep: 9 runs,
 1 regressions (renesas-next-2023-03-06-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 9 runs, 1 regressions (renesas-next-2023-03-06-v6.3-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-03-06-v6.3-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-03-06-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f8f70cfd66498277779fd34bd2266ea83ce3944b =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/640601841a8a6a48ea8c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124-=
nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124-=
nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/640601841a8a6a48ea8c8657
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =20
