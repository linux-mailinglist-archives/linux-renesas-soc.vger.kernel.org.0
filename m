Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0184E6B5783
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 02:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjCKBZb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 20:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjCKBZJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 20:25:09 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1306150EDD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 17:24:37 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id l1so6967548pjt.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 17:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678497856;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lUO1g/LlFOGUFYfiNTCsmnsLJZLQKq99yfqdJpudmKc=;
        b=xzfB7y+FlsbvCYh8NX0RKQU3FbU42ASHLWsLrGmlwDMitD+KFEv1lZ8mhLYWtkZ37Y
         7Ks74Fpx21/X/SZmylYlHXiPt/qI2ko3DrbkCCWedQt7LkOuj6UfUagVIlIi6KRrLKRN
         E33S4m3pdbhcLnkm+hYqrOvnkTDiGB/RXCovD0OXlB7ZtIASJUouJC470iQ2yeW8797V
         Cox/5oaANGFJs8htMe45ZPqEdCO+e/T1AgOEJIgdKkGnythtyIuVAdnT1StUZbS6aReL
         e/p/oiOJewz/VZ7CFWWNrTEiPIepBUHauxp0wh8g2XCtldMQNhPqgNPFFSdxM72zbR8Y
         GIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678497856;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUO1g/LlFOGUFYfiNTCsmnsLJZLQKq99yfqdJpudmKc=;
        b=YOMMCmBl4DI8rHdpM3i2qO8lUrRzykr4BSM3UUNQ2ysvJ0cXdGL1e2SPug922I+OE0
         yqAZqBqKWxRb7iKglxZ11s5vJaXEQNFpRL4Pa+snPwPrsPiY4PftN+xCeenqZDwhktBd
         fdmdXwF8Ijrr8h6gLOBOpDuFoYz+mAeAv8BmAKQVhJEAlVINftayH7Dw5IsgtlISghW5
         4zP2UpZ1SIY2KUtcPUuYUKI+qdG1dE9i6XNEwEZtupR9iQow5z7xf32LRvEgn1rgb966
         0X24XXFozv2ihlm6QdwO77TB/nxU4aoXfro727BOBui8+e7egjL8Dzt66xSLfIl7pnGq
         ncYQ==
X-Gm-Message-State: AO0yUKUcxAQnNpCAMsBsdsqsjo5OYWmJWxKIAyhu/nxonUNYCkoObhUe
        1tOndU/qObr+S3pkKbWYUPjgL05E9FNuJHPLLUUeGe7s
X-Google-Smtp-Source: AK7set8UhDWYhYSv4/+SGZ7NJJw/tUK/lANBRTAyQVGj9N9+9kqnhAWQLHWe0/L1smhwqCn+z5PGfg==
X-Received: by 2002:a17:903:120b:b0:19e:786f:4cac with SMTP id l11-20020a170903120b00b0019e786f4cacmr30883244plh.53.1678497856561;
        Fri, 10 Mar 2023 17:24:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kq5-20020a170903284500b0017a032d7ae4sm566931plb.104.2023.03.10.17.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 17:24:16 -0800 (PST)
Message-ID: <640bd840.170a0220.e0fd3.1f21@mx.google.com>
Date:   Fri, 10 Mar 2023 17:24:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-10-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 15 runs,
 1 regressions (renesas-devel-2023-03-10-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 15 runs, 1 regressions (renesas-devel-2023-03-10-v6=
.3-rc1)

Regressions Summary
-------------------

platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
asus-cx9400-volteer | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-10-v6.3-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-10-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c520d1376b59c054cec31c3ca09f4df3eddd5296

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  3cbaaddf6f785d91aeb370beb75d0623f8c48624 =



Test Regressions
---------------- =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
asus-cx9400-volteer | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640bc61f5e5d4a90388c8679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/ltp-ipc-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/ltp-ipc-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230303.0/amd64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/640bc61f5e5d4a90388c86=
7a
        new failure (last pass: renesas-devel-2023-03-07-v6.3-rc1) =

 =20
