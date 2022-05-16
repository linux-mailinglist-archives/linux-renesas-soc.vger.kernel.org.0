Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB449528A53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 May 2022 18:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343574AbiEPQ2s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 12:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbiEPQ2q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 12:28:46 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775623A720
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 09:28:45 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q76so14543666pgq.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rB5NcVvQZe7YaFUGHdT9DEZnkbpHZdk7EX5Fe8uhJf0=;
        b=oyB0AY1BSIwKcGRpRNT8WiMaePKg4InF5I4o+t1tsqH/AJz05GcS1l/DJOruAQEg74
         sOU25muC+Vqz5ik4jIb2Y0wPvgmdg2fMouIkWoiUKRUNDi3bhhpHnXqRs0Tup8YBoZmN
         EFL3nNrTUveQqzbVvJrcy6hhqSFzT5iPU9Pf8XmuA6Yh2abDfh4EFT9aYKm47ih0TLA8
         cH1AoppdHQ+aF4av7a87rbFizE4GZCAfgXHwQVzuDFF/knvJKndquCUkmYOAtG12KjcA
         wNl8JasoagnIpXrwsrV9VCxNgg9sAzCtcZLABsrPbOjU3Ywb+NmtXnJWBrvHCmBs7YgH
         6mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rB5NcVvQZe7YaFUGHdT9DEZnkbpHZdk7EX5Fe8uhJf0=;
        b=AN6zNchL9BYB5xEk4T8i+0Pf8F1biXDcT3fIZIM/Ktib15AY9CAtlGTP87FISXMSqH
         FLgNRk3YPsmGTXZoqxeCEzIc2nKZuuUCJ5M7G/TZbf3iu121u4R46bzuvN48XoiagbBX
         3Dsb2KcY+qLBOx9tP42tgZC/sZIbUCl+LjATheos8suR85/xwWvkP/A+w24mDqOECN8y
         gwJDcGuqShjgwqfaZbj+lKYOABzRp7K9n2snpBNwVhOKQZ0+aqK/LSNWq17PsczV1X+t
         wvDMIE3PjyR5dD+kHELQ+KevXEn5aQ3OIuBdWWrFdFmwKdw75zfpHyNI4X5mA+gsUHNF
         MAvg==
X-Gm-Message-State: AOAM530bAIGFhB+XOOBCIb1uQsVK1hFlFhRDVbtwQVql/Yh+kMl/0ruD
        4G7rHROlVBcqsi9v1p42xXWq2c+tefBTmfERLmE=
X-Google-Smtp-Source: ABdhPJxREZEEkmLGDEm5gjRmqFdjaiCvuA2IBNjX5/BoYXo25idvd2zouwL3qdKNbyUsq9QUpFBYEg==
X-Received: by 2002:a05:6a00:22d4:b0:510:6d75:e3da with SMTP id f20-20020a056a0022d400b005106d75e3damr18080025pfj.3.1652718524890;
        Mon, 16 May 2022 09:28:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v15-20020a17090ad58f00b001d840f4eee0sm8672466pju.20.2022.05.16.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:28:44 -0700 (PDT)
Message-ID: <62827bbc.1c69fb81.c0ccf.4fda@mx.google.com>
Date:   Mon, 16 May 2022 09:28:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-16-v5.18-rc7
Subject: renesas/master sleep: 5 runs,
 1 regressions (renesas-devel-2022-05-16-v5.18-rc7)
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

renesas/master sleep: 5 runs, 1 regressions (renesas-devel-2022-05-16-v5.18=
-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-16-v5.18-rc7/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-16-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f35c24489921b1d4963dbb55053b97fb0e53f471 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62826c001ef072b1928f5734

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62826c001ef072b1928f5735
        new failure (last pass: renesas-devel-2022-05-09-v5.18-rc6) =

 =20
