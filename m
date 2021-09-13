Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A8E409F3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 23:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345063AbhIMVhE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 17:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345151AbhIMVhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 17:37:01 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92422C061764
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 14:35:45 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id v2so2836141plp.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 14:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WlFJpAQ6DmI+b6vqMEZXEARauaClYIIo2TcPjs6PphY=;
        b=xR1+ZGpVYJ60Ik8rfp2G2QX6TOSHsEvcLf1ebuA36rbGumFa6pBh9BYaljragJh6PX
         4G4+Oadb85hNiXCk+9FbCWz0A1CQX2Z9gT7IK1nvn6Scbm6AywUf3j75yAZM+ojceY97
         fhg2csOqUC5mTCt6fvc+2ASnHalqSQGR7eGs5741RaUupZW6HFoiPO6dltL0gmxSVEJd
         WFnx3ZGdbPU1TRP73PwgzrYryrBpSF+6MlRRTZ7Fr282mVByoQ63o7nbZakveYpb3SCM
         Yc1hZsCy3ZIeu9OIuJ3/lxozrcrMSKsWldzbYIXurQpuq31EW/3gD5+RbDiSSvRneE4e
         a+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WlFJpAQ6DmI+b6vqMEZXEARauaClYIIo2TcPjs6PphY=;
        b=3T81ltAYevKvLGM7Vn/19GFQ9uZvnL5hMe2P5BwEX7SmZf0klqSM/I6J+xoRTmQb5Z
         9mgTXGEwtMmfuzxJxRg2wjN+QYOpEL6bQn07igBvn1xweSW/dn2BWAoFf/psMruKBug5
         gEDfEnXh36/kgNhRtBzfqxMdSLzO0iHh1hSQZlCCdycwCkzQpE/44zhGulQFsz5g/jR8
         H2ksVwVxz45r5wT/AOLVz/nUwW6ql2xAMmCRsCv9K7tzgzI+7CQd1VR0r2k3PngzQX+K
         wfD7faJixovlfl81k7kL/6l/vEcApVJ32OFdcfghW8jGYxYA9WoLDKZkhKarAWRg8nQX
         kQ3A==
X-Gm-Message-State: AOAM533GQ+njLw/Ne9VIKzTnSvakeMOcAv6YeKIdM6NilguJcMRb9UZ2
        2xVSPGSckpefzCMRURCvrg4K6YW3/taRTC0C
X-Google-Smtp-Source: ABdhPJwsoIBbHy9xD/OrwuEgDDdkF/WgNPVWsgVRjOpoWeiZBcPyDIKwDmstOmiJRiEFLBq0SFvvqw==
X-Received: by 2002:a17:90a:8d03:: with SMTP id c3mr1812786pjo.10.1631568944922;
        Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s204sm7940973pfs.33.2021.09.13.14.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Message-ID: <613fc430.1c69fb81.8eb7d.6707@mx.google.com>
Date:   Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-39-gcbbd8f16ae1c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next v4l2-compliance on uvcvideo: 2 runs,
 2 regressions (v5.15-rc1-39-gcbbd8f16ae1c)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next v4l2-compliance on uvcvideo: 2 runs, 2 regressions (v5.15-rc1-=
39-gcbbd8f16ae1c)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.15-=
rc1-39-gcbbd8f16ae1c/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   next
  Describe: v5.15-rc1-39-gcbbd8f16ae1c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cbbd8f16ae1c24d6f82712bf5ef798a8a62b0233

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  22466798f9a9044fa20ae3bb367d9fc29d37e054 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/613fadf8b69ae9ac8899a341

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt8173-el=
m-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-mt8173-el=
m-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210827.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.device-presence: https://kernelci.org/test/case/id/=
613fadf8b69ae9ac8899a343
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1)

    2021-09-13T20:00:47.558898  / # =

    2021-09-13T20:00:47.561312  =

    2021-09-13T20:00:47.666795  / # #
    2021-09-13T20:00:47.669443  #
    2021-09-13T20:00:47.771897  / # export SHELL=3D/bin/sh
    2021-09-13T20:00:47.774651  export SHELL=3D/bin/sh
    2021-09-13T20:00:47.879220  / # . /lava-4513797/environment
    2021-09-13T20:00:47.881490  . /lava-4513797/environment
    2021-09-13T20:00:47.984141  / # /lava-4513797/bin/lava-test-runner /lav=
a-4513797/0
    2021-09-13T20:00:47.987883  /lava-4513797/bin/lava-test-runner /lava-45=
13797/0 =

    ... (7 line(s) more)  =

 =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/613fb9ab80e2ac96a899a2f4

  Results:     47 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-v4l2=
/20210827.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.Streaming-ioctls_Test-input-0.USERPTR-no-poll: http=
s://kernelci.org/test/case/id/613fb9ab80e2ac96a899a2f9
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1)

    2021-09-13T20:50:33.625465  		fail: v4l2-test-buffers.cpp(1580): buf.qb=
uf(node)
    2021-09-13T20:50:33.651099  		fail: v4l2-test-buffers.cpp(1683): setupU=
serPtr(node, q)
    2021-09-13T20:50:33.666480  	test USERPTR (no poll): FAIL   =

 =20
