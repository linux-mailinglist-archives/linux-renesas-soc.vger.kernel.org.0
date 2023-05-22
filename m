Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63EB670BE71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 14:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbjEVMhh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 08:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjEVMhc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 08:37:32 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A957FE72
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:09 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ae52ce3205so40508625ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684759028; x=1687351028;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JBNNK2ruhJYck19CqGHIuxqIK82vJcVyBfrdRVFMzMI=;
        b=m4bcj7/eSodqgikNV7CJBpRe8o5UpgljvyQV44yrPZctmKA2wVMDdMBJjX6gzdE8l2
         P8kDIlHz/4WvVDAty7d6a/Rp+MZDXmm15scEo98H/omhZvjGvnOeWPvBwwpdusXrAiAv
         RxeOU6ey6CrsRrVKAgw1LCg+v2JphoTFq302a3N/Lz1b7tLry7//8eKCPZKy/Wh3g/hF
         qeIrry6bU6dI86GV5U7xS0O9vDcHrYIrgcwQHggtQgoWBj9GqL5Eu5PREx4v2NjKbfPH
         Q8yJRzqVDD88nOB93sZqRPv3TsJ5SVA74iHKWt4Knt/L5cvhsZG5lkr90VrUxcMkfU7m
         BqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759028; x=1687351028;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBNNK2ruhJYck19CqGHIuxqIK82vJcVyBfrdRVFMzMI=;
        b=bdHnhUTO97fMooce0JFSKKElLxxCymMOrpJe1AlRw4MWoWkWTvAuQ7+65ByPblaEWT
         XjIybt1W8ePC8YzLjdp1f+q1QOhQxdp4/EeG+QFj0093tkC5SnW+X0opC/pWw40Zj1vJ
         M5ww+hb2wAaNUHAzQcQu5VE2thj/BghEbUSkc8sNDxXXZx00Gal6dxSW+kc2yCy3fjOH
         oXrryjgD3W05ifkdyEtRLzlFKJHEZv+d8loRL6aJdSkxOmWI6Id2XhpjKcOYPCe4nXcy
         jVyMusFaNH0A1wxa9rupM8JXj9IpPP99+gD7vRxAxhMA03Egq72LpYJiHoq5zItp6CEz
         AIUw==
X-Gm-Message-State: AC+VfDw/UP5JPMIk5UsbAgSRqiR6hkAXrNzDRKo4U9pi3St1tGlgAZeZ
        IYAbI/MLr0kq3q7KZuhZZo4+i/BAXRjG9w8qkx1bcA==
X-Google-Smtp-Source: ACHHUZ494L0jEqgdKXTxEC/HY3x5rXQWOpSZNKnwu323Bb5lCHPW2u30yutbfcT7h418YF/6DNYLVg==
X-Received: by 2002:a17:903:2444:b0:1ab:1a6:34bc with SMTP id l4-20020a170903244400b001ab01a634bcmr13681329pls.9.1684759027995;
        Mon, 22 May 2023 05:37:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902e80c00b001ac78ac2cafsm4768858plg.239.2023.05.22.05.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:37:07 -0700 (PDT)
Message-ID: <646b61f3.170a0220.66ef2.75bc@mx.google.com>
Date:   Mon, 22 May 2023 05:37:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-22-v6.4-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master cros-ec: 10 runs,
 2 regressions (renesas-devel-2023-05-22-v6.4-rc3)
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

renesas/master cros-ec: 10 runs, 2 regressions (renesas-devel-2023-05-22-v6=
.4-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-22-v6.4-rc3/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-22-v6.4-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      44b93b667d845927e0168aa763b3a14e93b21a66

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b581c35a8543de12e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230512.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/646b581c35a8543de12e85=
ef
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b549b9bac58ac992e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230512.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/646b549b9bac58ac992e85=
f8
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
