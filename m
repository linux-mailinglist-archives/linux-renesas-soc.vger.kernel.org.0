Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107F4457242
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 16:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236114AbhKSQBk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 11:01:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbhKSQBj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 11:01:39 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A86C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 07:58:38 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id n8so8451004plf.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 07:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YXyfMzdD8MpvvLEfeFiVMRetKglHykuzlKhJYjbwvkM=;
        b=GQqTeHO9U302W63M8MyPxQlcVYN/ixnT1iiR0l6V6UkUiF1JtVmObZsZdERf3jWBwM
         sxuvA/gHB8i8n5uKlMNxfwUHCFv9aGWOjHeo8ePybjAmOQgc8AFjg3ovVxiROyCNLjfU
         N4WEiySeABxF9DHIqT3zBlUqTmdX8xtuI/ouKjkTXJ4SyDjmmrgWldkImtn83uIU1+Ae
         N/UyYpo1dFrN27W8ozBjAQAoQl4hqZ1CBNYfZr+upcVY+lBoKJSZfnkAFNU+yM51dcvm
         8XlfzUWBlLxy72V6CbESVZ6QpHmPE92XMKVVCWj8/RjhfqKR8dcwX/oYnEeUxhfNyNqx
         1o9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YXyfMzdD8MpvvLEfeFiVMRetKglHykuzlKhJYjbwvkM=;
        b=N0Y5NOFMPvM2abcxyo7y+87KHRiyA1eLiSCLvio4MMMG6NYfvEEq3LzRdR/iuLS4pK
         va7b+plixql1KPDo3UzmfoKK5aKihab73XZO0vX94J95fwpk+4SH41K1QUl54JqdvaHD
         l36uZRiI+Pfy1of5HozKAvJo1+1P01ZlpEm/zsW+zWqMWLl+yusVaqjXiSx4FyRBGMNR
         CZ3Q3+BlYwLVsXk/rAtQUdPKOHyFnGFrtT2KsZ6pYDePoqiZ3SFqao4Dytq0GRMR82w5
         GcmDm368FEnlyKI1ktSUbtfDHGBfmvSF7uaIeT7QospWAWi7SF3ETPejGP9UWkTqRSqY
         4y0A==
X-Gm-Message-State: AOAM5323kTfpKl9y5r63VVV+cpWlLkzAxG/eziN+ByGmuT1V3Mp7GZKj
        iRx0kDN4cb8M/QB2zTYRGaEt5oO4E9PL37aE
X-Google-Smtp-Source: ABdhPJwvxmdaPT05e4vD+PM3tC2cAj/f1klLnh6usI06oOm1EkDh22Lfklk7dh7lXG8HCX8zq2q4zA==
X-Received: by 2002:a17:902:c7c2:b0:143:bdf7:1670 with SMTP id r2-20020a170902c7c200b00143bdf71670mr59169360pla.61.1637337517424;
        Fri, 19 Nov 2021 07:58:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z8sm143508pgc.53.2021.11.19.07.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 07:58:37 -0800 (PST)
Message-ID: <6197c9ad.1c69fb81.2addc.07a2@mx.google.com>
Date:   Fri, 19 Nov 2021 07:58:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-19-v5.16-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 427 runs,
 1 regressions (renesas-next-2021-11-19-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 427 runs, 1 regressions (renesas-next-2021-11-19-v5.=
16-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-11-19-v5.16-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-19-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4789519c215cde2581c9f3e4847bb3bbf4158648 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/619795d84de56cce8fe551d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-19-v5.16-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-mt8183-kukui=
-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-19-v5.16-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-mt8183-kukui=
-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619795d84de56cce8fe55=
1d4
        new failure (last pass: renesas-next-2021-11-15-v5.16-rc1) =

 =20
