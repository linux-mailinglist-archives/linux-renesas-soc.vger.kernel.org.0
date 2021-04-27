Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B5636BF1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 08:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhD0GJv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Apr 2021 02:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhD0GJv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 02:09:51 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E1AC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 23:09:08 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id k3-20020a17090ad083b0290155b934a295so170835pju.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 23:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GwOlCnU4CX7Q3HpFJh/8mMNgANO1cd8BitaV/UHsL4s=;
        b=H9NPxzNwoA3O2kUuz1YHS4IwtEZPvDHLI4DdhbygzC/y2epvSrb1+jvCLBNXzVjeVf
         HHpyNku+OKQ19lrvAvF/Gf9f7xEwRMRd2l8g60UzFeqqKWkawOd5e0d12FbkUW6FOJiq
         1mxyJTz0HC+7O6oDL7ZNqcjKinv1VK+/nTYCPJrjMf3tpsNeI1wBAdvjinV3zAXf41Zp
         JOpESzlf3cgIFg4uXaotej+VHi97AxxnPLHyw2yFdvqw6Vl4wpI4PNnmHdQURshVj3pC
         WRlP4vGmxuDmyzUksShG+5cHkvNvlSwMy9Bt1vXcIgoT0ax0jy6wSXpSHehwC+ba2iBN
         R1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GwOlCnU4CX7Q3HpFJh/8mMNgANO1cd8BitaV/UHsL4s=;
        b=TTl0854MjHsQ2vtKWOZsBS2tQf2D6XO+dhtup5pGbRVId6fglydoHINVkElERykhgu
         zkNJ9DZCnzUmoVdKoic9tDc4S+e/TdqI1LWfZysqGfzbZOKTp3m9SqjL/JgGh0OEdrL4
         EelWn31VCVZDp0J7yuLcU8CPnaYSAKA1ybb9cUKv93S7DF42IxBeollSedD1pyifXk9F
         rd4ikaQpxNTfgTNsHQIYNwuSd9hmKHKY7mTkpcGOUBfR/1lzVtLhce9Gdd/JI7gG4khh
         6w9nyCot76vUIV5V/j1Rf6nVrTNVjNwttubes4BiD3/baNdIGR8WPyg0WZnxv086kTde
         khaA==
X-Gm-Message-State: AOAM532hMSA2GLoXgcS/oaoBw/hG+lQdopANivt+rzrmWAGhnj7C8hrn
        4JxJMDW+62FmQAT//N5j59XkMExCnPTVlKwn
X-Google-Smtp-Source: ABdhPJz846J8yMnl859ZtmCg1TCKl7XRTKQejeswQisSrjjcXmCt3oI+UsZO08e2uDdqwwMk65GPHg==
X-Received: by 2002:a17:90b:184:: with SMTP id t4mr1202377pjs.223.1619503747979;
        Mon, 26 Apr 2021 23:09:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z17sm1321177pfe.181.2021.04.26.23.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 23:09:07 -0700 (PDT)
Message-ID: <6087aa83.1c69fb81.056c.4f60@mx.google.com>
Date:   Mon, 26 Apr 2021 23:09:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-451-gae657abc971d2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 21 runs,
 1 regressions (v5.12-451-gae657abc971d2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 21 runs, 1 regressions (v5.12-451-gae657abc971=
d2)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
2-451-gae657abc971d2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: v5.12-451-gae657abc971d2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ae657abc971d2b6cc75a35bee45fe7486ccd9c42 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/608775fa9119d2d5d49b77b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-451-gae65=
7abc971d2/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-dove-cu=
box.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-451-gae65=
7abc971d2/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-dove-cu=
box.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0426.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/608775fa9119d2d5d=
49b77b6
        new failure (last pass: renesas-devel-2021-04-12-v5.12-rc7) =

 =20
