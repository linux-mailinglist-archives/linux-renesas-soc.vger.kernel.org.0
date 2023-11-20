Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2E17F156A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 15:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbjKTONw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 09:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233624AbjKTONm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 09:13:42 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAD21BB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 06:13:39 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so4545644b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 06:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700489618; x=1701094418; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=84FU7gvLbRmod4ugEykb1dFzV1IfMd6kN3dOdux7zTs=;
        b=twjtynlupFbTFkt7MEsbsS7eStfZ67CIxBGTc3JVNnX4ifbRnPVt+8bBSpyTI0QXXJ
         rd1qpXfYROoU0EY7jGC7SCFsXHxyZD1vmV7OSzl5CArRWm31Rvv2EDTWlOvoQjVDeUZB
         MZ8ptDL4uJvexakjNn1BHddqdUgB1524dt+6cWzFao7nlp6aD5668wDVjt3P5vsn45BD
         7K7RzI5H/l0aw/AqstWr5m+Lqw6LQSUJ+4c2atP3FNcZZM+I4I9YwUVh7PwSwoKcG4n7
         jhG/Gt52eIn2a/B4lqFX3tsG22aHpeVm9ocsH6Yp6kZZVWI2FRrU33Z/3gLQPLneSvB9
         5Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700489618; x=1701094418;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84FU7gvLbRmod4ugEykb1dFzV1IfMd6kN3dOdux7zTs=;
        b=tVxpL68JFuseEGWqfqFG1gpa7aH0Kl6P3+vs693NhILpVjFl+82EV2aoq56y21FLs3
         rcgu3nLQAZseVFE1sWcxaCGPzxR4w6v/TAvS60lq6tUziLXV/hvHPdthQ/e0XCpXmSf9
         LSJ6WxNhb74zFOLWk/28+cWSf70WLI/NR5HpkbFi2tKxYiaqYN7YSnqo5+G+iIVew1T+
         3IsKAYlTYlyD6xKYXJ4lo1WcKARQZrXSPUxUEGBvGeo/mFCEsffIhP97zxcIRkMP5n1M
         cvSaVA7vUT1vF1iO2OGhM9DNznvu03zQig6uqox9wBF9o7wisJU89MyX7h1/fdP0dqx8
         t45Q==
X-Gm-Message-State: AOJu0YwPMopMwMRWRLCyKJLuE/Hno8RxpkNBs+OVZAr+qOtvcbaJ3KhN
        A0KsWPUCPp82rEns7rM230wVG3txhIkBrfrHuss=
X-Google-Smtp-Source: AGHT+IH/DqW8xMNwCGumjz/yxTodV64HuGx6fEx+dOnN+BUiish0a/R1bZZRxxPd9WlHHbss0MuFnQ==
X-Received: by 2002:a17:90a:f181:b0:280:125:e52e with SMTP id bv1-20020a17090af18100b002800125e52emr7649969pjb.35.1700489618377;
        Mon, 20 Nov 2023 06:13:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q4-20020a170902bd8400b001c62c9d7289sm54046pls.104.2023.11.20.06.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 06:13:37 -0800 (PST)
Message-ID: <655b6991.170a0220.bc246.03de@mx.google.com>
Date:   Mon, 20 Nov 2023 06:13:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-11-20-v6.7-rc2
Subject: renesas/master baseline-nfs: 22 runs,
 2 regressions (renesas-devel-2023-11-20-v6.7-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 22 runs, 2 regressions (renesas-devel-2023-11-=
20-v6.7-rc2)

Regressions Summary
-------------------

platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
beaglebone-black | arm  | lab-cip         | gcc-10   | multi_v7_defconfig |=
 1          =

dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-11-20-v6.7-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-11-20-v6.7-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cc8b9449ce641fbe55b06b2e8652abf7091bb827 =



Test Regressions
---------------- =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
beaglebone-black | arm  | lab-cip         | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/655b50cc12837e287b7e4ad8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-20-v6.7-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-20-v6.7-rc2/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/655b50cc12837e287=
b7e4ad9
        new failure (last pass: renesas-devel-2023-11-14-v6.7-rc1) =

 =



platform         | arch | lab             | compiler | defconfig          |=
 regressions
-----------------+------+-----------------+----------+--------------------+=
------------
dove-cubox       | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/655b3772ea67eea47f7e4a73

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-20-v6.7-rc2/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-20-v6.7-rc2/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/655b3772ea67eea47=
f7e4a74
        failing since 6 days (last pass: renesas-devel-2023-06-26-v6.4, fir=
st fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =20
