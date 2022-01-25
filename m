Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98F249BD38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 21:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbiAYUde (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 15:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbiAYUdc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 15:33:32 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7883C061747
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 12:33:31 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id u10so16297325pfg.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0X1g2f91k1h7fcj6LzyKF8WxLFxTHLg1h5fggF6zLG4=;
        b=oTrG1IiQeNB8oxT2aqW8ZBIzzL/l+xyz56UCU64f7jd7cBB06ihWX3GTVU2hyewgkH
         zs17cAwewIGVStEeU7MKBOqPx/KP3WkfbSnZyP6BposrQ5NttsYBAB4IMA64uQ1fK78E
         xnNPXKi6dG9oV9mq2anyZTzFu163UsCjknww0/tKrtkOSd9tkGbfoioozPIaXpqyo/nG
         Vw5+640ZQIdEmiZJlpo2+hn62KxQcXw1sJakmQl2LR1ODTmaIEoCozhjnLRXbgYGgPHL
         ClfGuQI63ox1ZDAMZKXAqiYWQ1RJom2NF0Vc1V8vNuK18T3fZ2EmioPzC+JcDg+4Uhs2
         NUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0X1g2f91k1h7fcj6LzyKF8WxLFxTHLg1h5fggF6zLG4=;
        b=Uzilfpj0FYI+p1E/oxaM7zXVb7vJCn7T4rfyVPY26iUrYO92AaoMCJjeDVS4NND9/U
         AgJtwP+Gp/b5Wdm3O3Q+0KbJHyz39bkF7hS+3NVpem77vg0ImTT6vTfnb8QNU/YAjeZH
         a/A955RTgqYgYCAzXFlP5u1R4wJYsKXsjTWlAiK8uCbLIR4H1DPFBKJaFt8hcAhBIhKh
         /B3o1En4Pjc5kadavoc0MGUpfomoY6PMVdeYqvZPEX8Wu7Lg2iM42G6FnAjxj8ZX91dV
         re4UCVd00OdSmVCAvu8nO2cG5xjJB7xk1E010uLJ/SGpwNknoB3Ovvl+MBcR9K6otyP0
         eeOw==
X-Gm-Message-State: AOAM531YI5BXxVH744Ooy73QvRLsfb/bI2IB+3LtW6iL8HzYpr/CetRh
        NTZbMTTKRNdevv9OPR0pYOD99C/ez3p2MunT
X-Google-Smtp-Source: ABdhPJw+eIz3SvS5FCZx3UO/bgNN9g+qQBAaKw7AUeaaZH8uekmiLboJXSCn+h+2W8vcSnDXb3uafg==
X-Received: by 2002:a63:da4e:: with SMTP id l14mr16755053pgj.220.1643142811071;
        Tue, 25 Jan 2022 12:33:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y12sm5245456pfa.132.2022.01.25.12.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 12:33:30 -0800 (PST)
Message-ID: <61f05e9a.1c69fb81.6673f.def1@mx.google.com>
Date:   Tue, 25 Jan 2022 12:33:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-01-25-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 28 runs,
 1 regressions (renesas-devel-2022-01-25-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 28 runs, 1 regressions (renesas-devel-2022-01-=
25-v5.17-rc1)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-25-v5.17-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-25-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ac6604366d67f174f4ba9d29aab00854ab78cb61 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f026d7160bca2979abbd23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61f026d7160bca297=
9abbd24
        new failure (last pass: renesas-devel-2022-01-11-v5.16) =

 =20
