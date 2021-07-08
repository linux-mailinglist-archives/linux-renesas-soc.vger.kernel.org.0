Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B2D3C1A5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jul 2021 22:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhGHUL2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 16:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhGHUL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 16:11:27 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FA0C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jul 2021 13:08:45 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id d9-20020a17090ae289b0290172f971883bso6196846pjz.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jul 2021 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yf+UGyUyya6f+AIvgm8P9vTdW05AmDs3uXsApWiqoko=;
        b=ZOwleDTpYBldiciUNl8KWa8ovo++pgrgEmLn2+HHrGpW2HgdpzhDIfcgjrPfcznIoo
         Zh4bzM4+RcDwpKhXwev3b0QHSfLDFWL4wbTWofu7Y5fuP01yZ3aBHIrkYpQIKuqYg3My
         UgTy0aMhZ52ZyPhxOpbPDaHxgXOJh3HyKXreK8+N5YBngT/VUosekCSLVBDthvATwyGL
         V2iMH3v9trupweL+04h+hoFHvfGWXzZGWt9sXi5hsTVbcuPePSKBA/R+4sCSHXnguS11
         rLK++m8PyfZO0IyyX5o0kZt+n3ZmMcLnWxIMfTxLW9bMpHrlqhmSBTz2bYZkkf38XNCj
         rCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yf+UGyUyya6f+AIvgm8P9vTdW05AmDs3uXsApWiqoko=;
        b=ixsy+adT/M1kCqhg0yOatq3djmpNzWGX397dmzcUjLa1kknNlE90X2bvkpydSA0VvS
         ILk7/pCvXvCbTyJ52cszXMCgUN/qFot0nqh5avoLPk4QBhJGPj79530xWp4koNwSfBw8
         3cAOhepyrfq4VOS4I8ZHouofQr/l0aR8x4JQqlwXOXNs0QMzvEz0DcT2Ogage19ph3Mx
         iYfFKyL2PjP+1975gypIoi9jXQmWXmyR4en71MR4epTtfnu9AlTuPJ1hHfrEyBVxl0Zm
         Yk/x2mCAH+srDRqq7OxmnEdLS0T/f9EHLkibb9vPK697nOe/JH7wyqdybP3tBvD5waqb
         cAZQ==
X-Gm-Message-State: AOAM5325OtAkqJm0fJlI7jKdQ8gjKaxbmdBBGjh5+2pdVJb+NTvnm460
        Pt9NHdarIhSx+oRiWbJzcFRxS7T0CcTc3pYQ
X-Google-Smtp-Source: ABdhPJzunM3k7rf3oSuZUbPc+B1xcCUhPRREwxh6Gqy80QDOfNclVIxYPleNOgaaJth98keEMZkUjw==
X-Received: by 2002:a17:902:aa0a:b029:128:c224:4f0a with SMTP id be10-20020a170902aa0ab0290128c2244f0amr27370643plb.58.1625774925111;
        Thu, 08 Jul 2021 13:08:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j13sm4103796pgp.29.2021.07.08.13.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 13:08:44 -0700 (PDT)
Message-ID: <60e75b4c.1c69fb81.9fa4e.c8ba@mx.google.com>
Date:   Thu, 08 Jul 2021 13:08:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-07-08-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next cros-ec: 7 runs,
 1 regressions (renesas-next-2021-07-08-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 7 runs, 1 regressions (renesas-next-2021-07-08-v5.13-=
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
s-next-2021-07-08-v5.13-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-08-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb9ec119eee98db6f908226234823a0fef906cd6

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


  Details:     https://kernelci.org/test/plan/id/60e744f2198fd1bd2b117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/cros-ec-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20210520.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/60e744f2198fd1bd2b1179=
78
        new failure (last pass: renesas-next-2021-06-10-v5.13-rc1) =

 =20
