Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1821B7C7ACA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 02:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234509AbjJMAVB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Oct 2023 20:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjJMAVB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 20:21:01 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0DEC0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 17:20:59 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-690d2441b95so1155077b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 17:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697156459; x=1697761259; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5nhobMinlmxgfabHaEhekyiIxZ14Y0dm1ozm2fGwmF0=;
        b=vTkctrPdju+f+gEpjrVWsl2A6+DZPLKb7YTNpJwKq0cVnuHjbzgt76lp0sbMZdBZYP
         bIfShweoNHMOOcXAJ3liCkH26cXoOsJ1xLC252bUY/OuEBwqD0mE+NHosGKYX2c2BuJ+
         AY5ajD1firAoEsjBmKy0Zt9IdSs45ipkQfocfdLkXNBogNDMdsFXHqyBW0PN3raQU/I9
         znMP9PRGebp8g/ps6mNI7UfY4V4p4ehJ9gTmRZq3mvu4QCKClNS/V+ECwId7nG+vD27t
         1XeaGl9d7ZCgp6g0TONWlRHAqyKoB56aoCn1v6X54J8VjoCj3xWf3GYuUw9CxiGD8LxD
         QiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697156459; x=1697761259;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nhobMinlmxgfabHaEhekyiIxZ14Y0dm1ozm2fGwmF0=;
        b=b41d51Fg9+6ugG8y+mAYM+GYdwcgfued0Ej+jaSn1hhTZHpdCSI2mkVmMbr2DUukLH
         Ultc1yn1D5qpvAHRZZsOpyWdu/3UmORbNq1bLgAyUzRB0x6vkoxzLfqL0VfS/+oSLFMV
         AjKUMh8nQM6c8pEK7XiggB7yEgClnIvCv41LSwd2RUZzyIF3vUVH8MShMHk8csags9Lv
         3jQV7mcZmHUZu/1ldsvFcKnz9C6NlBI1UqJA64RlxLVVlibOu/zmHvOFyPA4JZsKiDR2
         IP111FGj/uYq4YSfna0Lea4/aZGWhQ59Nkng47W1NtgnwAkLMe9d2Me7XY5sv40OrhU+
         Fr9Q==
X-Gm-Message-State: AOJu0YwxFkvdmU6apLPEdvirKG4zUdOH1crL6/oAsRmow/r+EIetQI5z
        OPnO4FCM52eFW6CCq35p3bm7kPEpRjNc9qJnBV41lw==
X-Google-Smtp-Source: AGHT+IGpI33PGNyphB/35rxc+WsGfalC8TGiQbxNeLLWJ2ZdeFAhhqhkAgVvVmL3JQB3zdzm6tmz/g==
X-Received: by 2002:a05:6a00:1ad1:b0:68f:d44c:22f8 with SMTP id f17-20020a056a001ad100b0068fd44c22f8mr31055876pfv.1.1697156458981;
        Thu, 12 Oct 2023 17:20:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y3-20020a62b503000000b00692b7011349sm12360448pfe.188.2023.10.12.17.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 17:20:58 -0700 (PDT)
Message-ID: <65288d6a.620a0220.30576.2d3d@mx.google.com>
Date:   Thu, 12 Oct 2023 17:20:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-10-09-v6.6-rc5-11-g2f3e3edcf49e6
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 12 runs,
 1 regressions (renesas-devel-2023-10-09-v6.6-rc5-11-g2f3e3edcf49e6)
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

renesas/master baseline-nfs: 12 runs, 1 regressions (renesas-devel-2023-10-=
09-v6.6-rc5-11-g2f3e3edcf49e6)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-10-09-v6.6-rc5-11-g2f3e3edcf49e6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2f3e3edcf49e6363f99490192359aa6662bf55ea =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65285fc83d31b68c57efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-cip/baselin=
e-nfs-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-09-v6.6-rc5-11-g2f3e3edcf49e6/arm64/defconfig/gcc-10/lab-cip/baselin=
e-nfs-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65285fc83d31b68c5=
7efcef4
        failing since 59 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-08-14-v6.5-rc4) =

 =20
