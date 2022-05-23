Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C17531226
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 May 2022 18:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237711AbiEWPUY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 May 2022 11:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237717AbiEWPUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 May 2022 11:20:19 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D495DA6A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:16 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id bo5so14004446pfb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RYcOjjPMWfuyDwa2r6tBMeHAviPVX+6XvJIUwveqF4k=;
        b=h7PtAIuR+ORvkZAr8JwpPfvzulpemw3Z1tFEuMUUBFuczu+1sbfP2JyQhGgRfXxtND
         Dd4Qhve9X/c2fHoLnVEHwsUB2POwgL2OkmV6x8p5epvBYLyF+Wn7wmzqLB/jpUHAUiFD
         cdbaa26yzr4yNV992fBVRbyb68IUaCPIN3OwDXsBcHKx97XgolPVd9BsWdm+wRUYL/jA
         HAT+Ir4XTetE2Jy0dsqP6a8xt/2V00Ui6/+Vd+nI80KriP/0J1VVr4UZwddFa/i4J/wM
         5eAHmPfVW459nwgRLUhFxZHVyL81hRcCMHbjMvPwgCj4+ZxWa0iE8SLD2Ws7XeaWOl2o
         mRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RYcOjjPMWfuyDwa2r6tBMeHAviPVX+6XvJIUwveqF4k=;
        b=ru4eIBchbYpRwjaNX0eHjDhSGF8KJ6Su0ov6AD6POI5wDjENEUY5AfMghc76p5EF4V
         Uvo6pj+mPcYUV8UnKdnH2ejd5d5NlNa5dRhcpGhaMweCUtHMqV/r84K2fnZwj0fudbBa
         hgB9kBTNWX44CeE8jZDcEenDsf0Srj1xEag1E6LUp7SoxKncoJ/JvZghzWMBxK2+dWQS
         m0jt7BqEEUC+94SesX0AxFPkB8lA6wBD/xpbegih1sqI6RDJYxjMDIOc1yFmO+DFe7Vg
         M0dhj9xl/6DSCddlaxWilHi4fDncwwu546TatQGU2b3fosyDsNbLZzNPfovqHna6kMym
         W98w==
X-Gm-Message-State: AOAM532+u0Y8drUgkBmuFyJwZs1OtORoJCsz8/q8U7w64jW5u5TLh4aN
        HTq8OUn1V98GcXumvSyyQfkqCqj9M4rYnQ9XUjs=
X-Google-Smtp-Source: ABdhPJyg27ENsH1+Ef8uYx0dU2qk12lVZHuP37c3s2zDBl8nRxBFC0JMUvKa9XJIsCzeVB0j+EkRWw==
X-Received: by 2002:a05:6a00:2310:b0:4fa:7eb1:e855 with SMTP id h16-20020a056a00231000b004fa7eb1e855mr24455231pfh.14.1653319216246;
        Mon, 23 May 2022 08:20:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e6-20020a17090a7c4600b001df30f3dec1sm7321251pjl.44.2022.05.23.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 08:20:16 -0700 (PDT)
Message-ID: <628ba630.1c69fb81.d9bb8.0fb2@mx.google.com>
Date:   Mon, 23 May 2022 08:20:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-23-v5.18
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 3 runs,
 1 regressions (renesas-devel-2022-05-23-v5.18)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 3 runs, 1 regressions (renesas-devel-2022-05-23-v5.18)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-23-v5.18/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-23-v5.18
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d7344501bd97263caeccbd7a972c0db04024a081 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/628ba2e0316b6585e8a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-ny=
an-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-ny=
an-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/628ba2e0316b6585e8a39bce
        new failure (last pass: renesas-devel-2022-05-17-v5.18-rc7) =

 =20
