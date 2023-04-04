Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFAF6D6D30
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 21:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbjDDTcf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 15:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236019AbjDDTcb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 15:32:31 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C323C05
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 12:32:30 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so37245471pjt.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680636750;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/PLMogZAvpDRvpre3kzjwqeV9EbABdy2ULYKZDY0NG4=;
        b=3WoqlszUfco7/l/H0ggDki+cAx+AbqKExewkmX+gpk3K90098nbgt1IyalR9dJXqbD
         N5/qo5SW6tPGViPNCpWodb94SHrdNLvE5Regx4yZ3QFH0GLK6L6NUoeTb+AWFeEb67d1
         7iXjD7zHs+LutCUYmTsjm6/K2AvgT1TQJbr/6uRItZVmNTj8GYa7X8eZ8LzEuvTnsg4A
         HKNpUVMcKJeY6EYYedxyMy+C99yKKwt6P+MXIv///QtP++DC0eeHTtsd1ZpS1TdADLn9
         GqpAcvcGwZ2BXy2XRkELxAWclF0ivonsq097SU6p719DrPomJOm509q0aD3ze80Clyor
         vGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680636750;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PLMogZAvpDRvpre3kzjwqeV9EbABdy2ULYKZDY0NG4=;
        b=B67TLDpI+6atN3Wk6IJDWJwZ9FATqcJcNfFK3j6BDC2B3we4gJ4dyfaHZfKtVUf4SD
         FVa0FHZHctRDlvLj/wxSp1W5h3gRlE4f/cUwVkj5cMfGSFTz2TUrQvnLlcSBlkCR2jVt
         3f0gc0pFQllnvieVZfwEiUOERsnKQ8tRsKxxiNzrp0cXVAGrduwzDF4tUe8YZyqdmm+z
         DsYhBOnipxqgXxrH35PihGEbMk68cpLzA1iMvx0WVdiob5zyZRucx2lPA2G+G3Q3UBpQ
         YC72mGvAqsTqYp2ZEcwIEkhD0NMhxQI2oXIegVlMI94241FaJmXtbg44UPKJJncWfK7H
         c1yg==
X-Gm-Message-State: AAQBX9fUY7EiDT35JrZBJzDA4J3IESqmaT2sXwf8HdVaOcsjrN7kn6pv
        xGt3MQEz0eXFrMI6XqsqBbAb29C6r9OlU3Gu+3xDzg==
X-Google-Smtp-Source: AKy350ZBLDxBWeeGKvl/VqJWAFEobyXhZG/ZG2shRU3zOqz6VNQt4vJoNH0Cljov84oWmPqWK+cssA==
X-Received: by 2002:a17:903:1c3:b0:1a3:d392:2f29 with SMTP id e3-20020a17090301c300b001a3d3922f29mr4578617plh.20.1680636749759;
        Tue, 04 Apr 2023 12:32:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jk15-20020a170903330f00b001966d94cb2esm8674455plb.288.2023.04.04.12.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 12:32:29 -0700 (PDT)
Message-ID: <642c7b4d.170a0220.7b54d.1d43@mx.google.com>
Date:   Tue, 04 Apr 2023 12:32:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-04-04-v6.3-rc5
Subject: renesas/master v4l2-compliance on uvcvideo: 4 runs,
 1 regressions (renesas-devel-2023-04-04-v6.3-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master v4l2-compliance on uvcvideo: 4 runs, 1 regressions (renesas-=
devel-2023-04-04-v6.3-rc5)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-04-v6.3-rc5/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-04-v6.3-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b4dd84fbb7628443a99f26465ef2fcee5c99583f

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  c7823a3f5f8846561d91e7ae77fea82fab63fff1 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c644acc4e0e37d879e923

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4=
l2-compliance-uvc-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20230303.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/642c644acc=
4e0e37d879e924
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2) =

 =20
