Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3202F2F6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 13:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388301AbhALMzB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 07:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732025AbhALMzA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 07:55:00 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A9CC061575
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 04:54:20 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id iq13so1536823pjb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 04:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=egj4r9ZSUtdbM5jq2/rSJkt07r9u8Ewdj58C6W7/OHA=;
        b=nzy8XkK4+j4yLhGCOtKRi1PFzzTJ/0+TPNMRkkEtPTYHeNY4YIclkTvx32PZE6cXhz
         TCK99HnObOy54q4kDIDunEOF57K27K8n/U12YyvQ7OG1KQUg/2ggt3FDySK3bwwLQV5e
         JI/sQSnRWjJMRYNVJYmcZ7TQ6EUjYi1yOtYaVRg5mFYZP9un+jvJNKHlGHNd8mCRFcLz
         BNYrc9gN3k1l8ucBFWfoZChwoR15lX6f1lovW7U2itZSKNIwnUMa4X30TKAm5ILP3qBc
         xQ3x8RYuzpJADLGJ/KmBhI0/gj73pGuehiA6t9nt2nOUWjuLJe2Vufr4JXKl/pEEqY7V
         520g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=egj4r9ZSUtdbM5jq2/rSJkt07r9u8Ewdj58C6W7/OHA=;
        b=Uc5WrJZAjWTeWZK0s/bO/HYkaxu+9foS+HuiqF508VNUl6T4NgW4IhKBx9f6n9+vQe
         ZmuWx6+Zt6ew0NsldAd1EHUTa0f7i2/TgdN/hYwIsDYF7qsX2xlKI4j/9MvO2S+LIL0Q
         r6C4+/r+hCIS51uxwnw9IHF0h3QI+jRvvKflC72qNa8LUhSNm4TZs4d6NQfUzmnrruv5
         Zj3L8RmrxcM05paHU6GmtBrJ/2GNOdEz8gU46anxrwPdJUjEQTmQA0n+E2vjIHW7fzZS
         JVsPTKL6xXaoZwnzFHcjbWqGnqtjAcw2jAKHuFC+WAzBZWePGFMyl4mT2+j1euVJSjeo
         YCxw==
X-Gm-Message-State: AOAM530s8q3yyxaFQUvIDjyTTtITdvFO5Rr9hBoRQrTnj3+z5fXVx8xC
        oiod2QFVwI4eLwNpKxk2MSpYY1bA2aiDKQ==
X-Google-Smtp-Source: ABdhPJy+ltbY6ckcnExKDdSnwDKxvMTO2ScCOeXVzT8Z3nau8Dv9CnBwM3KETtb2xROiQwxgybMFIQ==
X-Received: by 2002:a17:902:7d94:b029:da:f673:18b9 with SMTP id a20-20020a1709027d94b02900daf67318b9mr4981246plm.37.1610456056108;
        Tue, 12 Jan 2021 04:54:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v125sm3508565pgv.6.2021.01.12.04.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:54:15 -0800 (PST)
Message-ID: <5ffd9bf7.1c69fb81.b8a4f.6a3d@mx.google.com>
Date:   Tue, 12 Jan 2021 04:54:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-01-11-v5.11-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 18 runs,
 1 regressions (renesas-devel-2021-01-11-v5.11-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 18 runs, 1 regressions (renesas-devel-2021-01-11-v5=
.11-rc3)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig          | re=
gressions
----------------+------+---------------+----------+--------------------+---=
---------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1 =
         =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-01-11-v5.11-rc3/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-01-11-v5.11-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c3703437e37f2e38e831c893dda362271f836100

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  b7ca00a6faa75fee42cb63d40f709cbfe65ec378 =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig          | re=
gressions
----------------+------+---------------+----------+--------------------+---=
---------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/5ffd93d0ae994c87f1c94dea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-11-v5.11-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-bcm2=
836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-11-v5.11-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-bcm2=
836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20201221.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/5ffd93d0ae994c87f1c94d=
eb
        failing since 7 days (last pass: renesas-devel-2020-12-21-v5.10, fi=
rst fail: renesas-devel-2021-01-04-v5.11-rc2) =

 =20
