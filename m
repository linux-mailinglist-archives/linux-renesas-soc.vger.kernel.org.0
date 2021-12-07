Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AF846C6FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 22:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237515AbhLGV7N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 16:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbhLGV7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 16:59:13 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C64C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Dec 2021 13:55:42 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id x7so521575pjn.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Dec 2021 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QwWmRUPgOLXCmnRAnXBelrTUH3Z4fzOacddXYcnUlLA=;
        b=Vou5CWnUSKWDn5CBo2VFuVsfLvjyPqbWcOmp2dhntHSQqKldNr4HCO4ZiQsAjK/o8r
         scZ94OmiH07b4rYrk085lVVWI3usEAMz26I2uo1032Hqnrh9bEzy9/MP36e4O5Ky/2+G
         3CdXQSCnZqkY8s0tnctTYhva4/jsXfmFcrqd2K9jKhvb57BcKemd9wDwOZ4+YXPXacBS
         abg+idxr3HAVOSMqBHUvK3eJbOWIlpav+90v+ptsDW06TetSQvauYbahOijrJVtezW0a
         DO7stBFMPlDdlqnvtprUd4M8nZICC6MKJnJ8H6+r4oPXygsU8mKsCidBPSVPaDMlxnWe
         L7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QwWmRUPgOLXCmnRAnXBelrTUH3Z4fzOacddXYcnUlLA=;
        b=KuISG1+IxZ4llA+yuaSumu0upQOhKto495kR7uPzFv7oLXcKj8brJwmPJ8nPLsDSVK
         1OuMN0o6ewbGWMQxpRmzWaY9tGycyODytFykEMNoBPGXClHooHoCkzOn07sarOAa6z7A
         wDfgE8cDQU34TWdIqnZsrcyJRk4J5PZ4AC+ufohOeUce+IzAWQbVnx5OpjrfHyTm6yzH
         HNVxfgtAYUbFY/FEI//1x38RxusIa3WgkmL+l8qAdQ9Uz2UtZhv5xR3C7l/BbcI3Nh0N
         5WiIYjBsaHKEvq2eWryuyKZltACVE/NNexgwfAd+JCj0yFJHE5QSkfaYzPOYI55Qm1jN
         lGeQ==
X-Gm-Message-State: AOAM53069xyZbql173gD5S+djJOfRsXjVZJdi0HJgcBMoQCctgLfVgUC
        RW2zgFLBe6UTxHQAM/h/CmvQknJbsueZUWfZ
X-Google-Smtp-Source: ABdhPJwzL607qnlfSRpDAC0EOpgcFcD1uGMfV7Ah/HivzJL75plCgpXdIEx1DbU0TPOKusZCIrrISg==
X-Received: by 2002:a17:902:b68f:b0:143:7bf7:c9cb with SMTP id c15-20020a170902b68f00b001437bf7c9cbmr54585790pls.7.1638914141681;
        Tue, 07 Dec 2021 13:55:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 12sm3709310pjn.16.2021.12.07.13.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 13:55:41 -0800 (PST)
Message-ID: <61afd85d.1c69fb81.c5b61.b387@mx.google.com>
Date:   Tue, 07 Dec 2021 13:55:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 73 runs,
 1 regressions (renesas-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 73 runs, 1 regressions (renesas-next-2021-11-30-=
v5.16-rc1-14-g0940300f8e1d)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0940300f8e1df4451b3a5c9e079a74cacc6b854d =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61afa0682a518b68a61a94e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CON=
FIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CON=
FIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211203.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61afa0682a518b68a=
61a94e1
        failing since 21 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =20
