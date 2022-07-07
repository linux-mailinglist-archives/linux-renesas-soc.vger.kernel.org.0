Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4B056A24C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jul 2022 14:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbiGGMuD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jul 2022 08:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbiGGMuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 08:50:02 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFF327163
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jul 2022 05:50:01 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id s27so18298958pga.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jul 2022 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8j0auhzL3hPE2VquQyoDu0LMy8rNuEAYxqWSUf4dyeg=;
        b=NzL40Yl9X61/KGXhjgtT83MTaJP1Gdxhsp9fDKnSeFx/mOPJ8TpNBF+PnKLnnhJ9PP
         fnoe4PMAmNcsUBqwJFYzG5GCGJneb+2eRO5Fv+l/00dySaOn4kDRxez8+5YZocS3VDFO
         r7E8d1NDcjcdSfiTjbNHUxS+JjtKeDrjMP8kEhA0000CR2foJPMchfs20JhHeh1315sM
         uaUkSI9jjPe4k5mFqiKcDtUN/XemSCmWbGZd+RGR8DVtPiVgJiKE9OroosJDbEtaBDtX
         1RRovSG8w4ArH0pdVpHWAxOP8GTo9rgmO+omQ16i9q51o8SjKewxdpfLuqGIXb5klVA8
         0VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8j0auhzL3hPE2VquQyoDu0LMy8rNuEAYxqWSUf4dyeg=;
        b=JS57nTc6YY+LSx2e7k2/03RVtJChT0xbl2UjCeib/yoRC95l+z/Tbf2qlfZO3az9B0
         oS7JVZoNBf7DHLqowY92u3BsZtoyHAj//5i1CkUvcQ+WoATwEh31SpKA1HwBc6N4saKA
         pX59cw/8u6S1PBbye0piVBC2RlfV1fSSAIc0AH8mhWdb1eWV3maZd3asTv413jkrLYnc
         itNxmqwKWqc6JvQbCH+UIVVHp1zjeObjKbKN6ZoKXlTbibSjXvtqy2EsPhsuURDvHoix
         mtOxUp6vXaA94r6YHAHgrY5jdHLKboM/LWfQWM+dLhN1OrrvC7IoVEE4b5EzOBVNXhoQ
         3oPA==
X-Gm-Message-State: AJIora/cVU76AmDlqREj3ewvgS140LUnVAE+K3EQqYoS4PvYmrpAM3+P
        BdMyqS0WqSWUwYeZJ9j1yL9aIJ6g5iFiZRXv
X-Google-Smtp-Source: AGRyM1spWzT0JlhVVDVf7TDWYiL6pKVityWU52cV4o9m7VwW9vi0i3X7ufv6XDUn5lRaIh0CiA/QOg==
X-Received: by 2002:a17:90a:f40c:b0:1ef:8132:368f with SMTP id ch12-20020a17090af40c00b001ef8132368fmr4947278pjb.81.1657198201313;
        Thu, 07 Jul 2022 05:50:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6-20020a17090abd8600b001efb8804720sm3422341pjr.46.2022.07.07.05.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 05:50:00 -0700 (PDT)
Message-ID: <62c6d678.1c69fb81.43f8a.528c@mx.google.com>
Date:   Thu, 07 Jul 2022 05:50:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-07-07-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next sleep: 6 runs,
 1 regressions (renesas-next-2022-07-07-v5.19-rc1)
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

renesas/next sleep: 6 runs, 1 regressions (renesas-next-2022-07-07-v5.19-rc=
1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-07-07-v5.19-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-07-07-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b5468cb7909f0068dd977e1f63ea39132098dbb7 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c6c770516ef9866ea39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62c6c770516ef9866ea39be2
        failing since 29 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
