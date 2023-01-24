Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5032E679C36
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 15:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233542AbjAXOm0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 09:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbjAXOmZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 09:42:25 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD1F4AA46
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 06:41:59 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 141so11452002pgc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EbpCMRV1p7cfeoN3IY/Q7kP7jNtph57pL8RIwAo1fcE=;
        b=I2ddKcB6kk7eh6a7kYl9+hzo5E/Yyj+NVOgK7iPtvgDo/1c4m8dNYf8FLRtDmMXalX
         fpbDzUWSgzx1sHsQxqWCGe70+9mo/KEonF2liGntnZoWbAjP1RmJ2HnHaJoM0A2QG7Hi
         rVJU8JlpliUrDcIX3ru4NJKEZT73GOkioJwbiMm1m8OgYMBlco462tGHtmcryYg4rUx1
         LwZeYPE0ngdHK4jANbgwhs4/HZo5jci0DoQt8sQTICRXIV2KxUhJnTZaqjRQRJPVQToA
         hgKU402xAJvFeUToGsNa5sPRuKG0OeMUQjB5mHaAxvgPsjHu3TQJMyMHbIb+6hkhRBFG
         pg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbpCMRV1p7cfeoN3IY/Q7kP7jNtph57pL8RIwAo1fcE=;
        b=x1Ooh/QYcWpP/Uq4kbLgCdmYlb6dth7ESUvSVay2Xm5Xopc7OH4CeSfHWEM19Nloj1
         FQvPCy/9HniWVvWE+G/Q7S8ORioXwrq+RiT4M5YB2xK1fonpBn26Dh/lmSvEUYYt5Sgg
         38K41cTuMgbYDUWH/LTnPm1GVgDjuE/nMpTPaS/mDyH0k6I1hNjKgxFixkpTbKrkjRWO
         LWQReSvTyNRzwmk8zkkGFG1MJBpSoQS0EBZf95UumZt7ZsitNZRgPgkEh12DwrKvjP2W
         peU2qPYwDDrSao3vk6Vjxg3nTMlb98uGX2rMzZfplWgN5MiMA7DUKfHlaWt4oS3hH+Ir
         Nb1A==
X-Gm-Message-State: AFqh2koTo9oDkFAKhc55QrqkFRR58be1uuuShS9xRoQ9Uyd+uq1PVosu
        tfXOBrhz/450CzF+VFgZ/PCGpAu82Yorxk+wdc4=
X-Google-Smtp-Source: AMrXdXt1fLxyHvraD2lNtWImso8jNixXDmAXPu0fEjGLrIy8Z419xpSjqq9TCpJWkrY7Sv/yEO7LMA==
X-Received: by 2002:a62:79d2:0:b0:582:b089:d9be with SMTP id u201-20020a6279d2000000b00582b089d9bemr29812776pfc.13.1674571318686;
        Tue, 24 Jan 2023 06:41:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w127-20020a627b85000000b005815837164fsm351367pfc.59.2023.01.24.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:41:58 -0800 (PST)
Message-ID: <63cfee36.620a0220.a83de.08ea@mx.google.com>
Date:   Tue, 24 Jan 2023 06:41:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2023-01-24-v6.2-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next ltp-ipc: 17 runs,
 1 regressions (renesas-next-2023-01-24-v6.2-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 17 runs, 1 regressions (renesas-next-2023-01-24-v6.2-=
rc1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-01-24-v6.2-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-01-24-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      29fea68a8aaad7d0cab07f538d02aa03ad75fb48

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  d042c168dd037bb0128b86ee4ac4f5c526eddc7b =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfdf6360f1c352ae915ecb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/ltp-ipc-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/ltp-ipc-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230120.0/amd64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/63cfdf6360f1c352ae915e=
cc
        new failure (last pass: renesas-next-2023-01-12-v6.2-rc1) =

 =20
