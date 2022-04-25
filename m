Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8B150E84E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 20:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244439AbiDYSeU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 14:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236586AbiDYSeU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 14:34:20 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2D4BEF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 11:31:15 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id w5-20020a17090aaf8500b001d74c754128so174063pjq.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+Bj1B/tRXmKSeDyvjDlLblZPNXV9AVP6UM7p1K5gcQo=;
        b=E0RRdxDWbMl/bWFlN3yaoPqfYMJ1eQu79x9p4g9n8cCpI9+2ikssd7ISjEAoThtQo4
         uZ1ENtVNdD2gQ7ON1ShvYVZS7eg6zsXmJu30lYfgMR+ANupGuOZuzStNcsvkaRCq8u3f
         ND19Oco7DL89y1EVjkQmlLxxNLKemw0MzQliisLSMHY/hH8xXoP4WhjUS7oArLzMh1a4
         ByJhTuQjVdhX4dZ3BgqPnzw/H+KI+Pi2O1CLaOYOXLc2C9P9gxvNqqtAro7wpaCfLqC/
         U3Px+QHrR/3A++63aCo5cTVL7eeqGwf9JCNjRlcXBKvi50lP13BhWdF3DcvxiOwpVOfw
         ZeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+Bj1B/tRXmKSeDyvjDlLblZPNXV9AVP6UM7p1K5gcQo=;
        b=ftnPTtdArwlsTEcBR28ec9s7KvFlk+74gXl0rYX9CwkYPwhn+4hm/Y1SEFPp91CTs1
         K06fGbjUflm+ITd9Btgms59z+376rPgqzslIJTX8R6dXCei1Kj0t5ofXSlBU7iHiOwQb
         DhiG0Hi9WUimkNZbqDkX51W+FdMleieuXN2quUB2rm8tayz1b8GU5xMBpGDgL+g/B7LM
         nqKs2qgJ2zuKJ8Ts4cpeDhr88CeA7MJYTQeWPeopAuiJrJazYw4XWFeMCtKO5c3g44nH
         kYN2nkqhqzljS8UOjWTzITheEjNx2ybFIp8i1XfLAZ1H9b9kNHBf5LkQz0+wOhEQDi/o
         epBw==
X-Gm-Message-State: AOAM5325M7UZhgtoneU7m+T/KXkuEnRE9YEUYwzGKO0ROJVUvqT0ZPL5
        5ETXKbOkA2sCDxeAsNcQS8Y2qG14Wf0DMTXdSeM=
X-Google-Smtp-Source: ABdhPJzVlzD9c33UpDC9pObY7Y6N/X/afdOh8bF7E6nFPCyiDQ1sK2noMSpnuxaXqlp9csKckwtxIw==
X-Received: by 2002:a17:90a:1509:b0:1d9:44a9:28c7 with SMTP id l9-20020a17090a150900b001d944a928c7mr12878279pja.89.1650911474910;
        Mon, 25 Apr 2022 11:31:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090aba0700b001d93ed0d97csm8358313pjr.45.2022.04.25.11.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 11:31:14 -0700 (PDT)
Message-ID: <6266e8f2.1c69fb81.22b5c.2acf@mx.google.com>
Date:   Mon, 25 Apr 2022 11:31:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-04-25-v5.18-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 382 runs,
 1 regressions (renesas-devel-2022-04-25-v5.18-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 382 runs, 1 regressions (renesas-devel-2022-04-25-=
v5.18-rc4)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-25-v5.18-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-25-v5.18-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      478f2e469bfe9bc7010e78ab874415b0f8549427 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6266b41297ef60b973ff9487

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-25-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-25-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6266b41297ef60b973ff94ad
        failing since 48 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-25T14:45:16.281168  <8>[   33.851363] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-25T14:45:17.304408  /lava-6171768/1/../bin/lava-test-case   =

 =20
