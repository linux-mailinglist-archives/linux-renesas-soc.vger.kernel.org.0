Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABEB5AD1D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Sep 2022 13:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237646AbiIELxG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Sep 2022 07:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237459AbiIELxG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2022 07:53:06 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D2145C9EE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Sep 2022 04:53:05 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so4510722pjl.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Sep 2022 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=gnzVpAp7fy/Pi1y+Tp+hHIlAeytI1L0CCXnvCbaMz/E=;
        b=sHVJQgjJymM/qHroB93AfUUXOcfMINsJitGVIpRI5xIuRhyJ0gTiM6WtspVT/XMC8V
         I8pA4JBy/m24vtLqS0piWPmRPmAQexh3uXbt16/oZsvX0nDLO3siA5ckqvu4wtKvCh73
         cKqQzxjyN3PntJY8E9lXrDeHvZbsQr2BY0ZHNKKLRHOv/FmzZ9pXUjfKPIb4mLjkBber
         TKAqt+hpN5bXwnUkeFtutI+IoOTDx39AO14+ZMLO8Ap5yCj4lPMmj4QaGCQP23s1qI4Q
         6jlngrUHIc1RopqrRIc+l/lx3YxBoDegbxwemSxI7aaLSijLVlRukB1oyluCGYkXbCmK
         8uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=gnzVpAp7fy/Pi1y+Tp+hHIlAeytI1L0CCXnvCbaMz/E=;
        b=Do2UPWcwQUbsmS1eNCLfqs5ChL/MBriSIjd6lYsqLeKICwVtB31Mf9VsU0GdrfObEJ
         pjcN42IcVxQJKGfNkJVpye4LQmoXHGLH9f5h/LMII1iQtpsNYnPEMjpWDzhG7GNFOPSm
         Eho2VE5I4AJoH1D0/fQ++GiWYvqVOsQzEyUxOcGoVpIMQSyeZ0sh8oFISPxgz6vaOxL+
         V7+z4YbttRODmBCjmAaT8lO0oQUeSTlROpxKYVdwacQ/OW9hj/mtIdQnxRahRWeS/KxQ
         Fita47NzkccSJUAA1nXOIWeGrWbU1eejo3acIGWCu8QICqjAHX2IXM/YQOrwv37f1jxp
         ym6w==
X-Gm-Message-State: ACgBeo1dOdsJRNi9CB51oU/ANRyR79c/S/m02qSjKrmB9wWFfukjlHo4
        tk6B8VeB4JB07OImnz8EV/H6aXxPa5WGxGI/qEA=
X-Google-Smtp-Source: AA6agR6GkWTmt7pIwNLrTo7vIRWWeFJ9a3Y2d9gqni5FhopCcLMUbJgKOQ83/ukrAui/2nQGxSzvjA==
X-Received: by 2002:a17:90b:4a87:b0:1fd:f44a:1d9e with SMTP id lp7-20020a17090b4a8700b001fdf44a1d9emr19120358pjb.241.1662378784521;
        Mon, 05 Sep 2022 04:53:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a12-20020a170902710c00b00174c235e1fdsm7283403pll.199.2022.09.05.04.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 04:53:04 -0700 (PDT)
Message-ID: <6315e320.170a0220.dbf33.adf0@mx.google.com>
Date:   Mon, 05 Sep 2022 04:53:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-05-v6.0-rc4
Subject: renesas/master ltp-ipc: 8 runs,
 1 regressions (renesas-devel-2022-09-05-v6.0-rc4)
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

renesas/master ltp-ipc: 8 runs, 1 regressions (renesas-devel-2022-09-05-v6.=
0-rc4)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-05-v6.0-rc4/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-05-v6.0-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ce5bd4a14031a91fb83af3882c226513c60d5bf1

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  48cfd7a9977e6268b4aa2600608cebad7e0e42b8 =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6315d106cc6f84a7a6355681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-=
hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-=
hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220826.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6315d106cc6f84a7a63556=
82
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3) =

 =20
