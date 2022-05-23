Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B095531498
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 May 2022 18:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237712AbiEWPUZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 May 2022 11:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237715AbiEWPUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 May 2022 11:20:17 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08AF5DA7F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:16 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id b135so2255151pfb.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=igm4D2G+CD8AllZwlcYZVFlP5/SBhymVjdWH429ya+M=;
        b=qtDXvq87y4y2UJsD0nhKRBMTkSazoVdL8OLaSA4hySFuN/7uXXmd8mOpwmg1bHWPgs
         EKlTcP9puBmFhfJ1p5kDs20X2QkPb/BOQOhicPozSFG+6gZebPQi0jWpDUS2pHSn1L+e
         M019rMjv91zeA1AtNrcQL+DEw2iit9xTXnUl63V4uffzX2MiwF8F4LNsYUxxiQi9Ym8v
         SJoxzryNUM1GukNZyeumr8880IczUGib28NK33rnaAX8V6snTR83u6vS1XmRK3Xf6CoY
         qToRlP5+sW/FSvvUk5PMKXvALmylgDv36Clmi/8VwbbaKP8sJxHW27/R8dAvJT2Ko2DV
         VFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=igm4D2G+CD8AllZwlcYZVFlP5/SBhymVjdWH429ya+M=;
        b=29r8QMRItSkHhdjrORALG/q2RYfo7CCAQLjiyuRJuhqYgL0C85UQA5VjRqbURfXM3/
         BEOw4kYLOL5twnRQYLM3uu/+bWRKJsDJ/7XTqiTRRGZmuref5OCy9s1agKUgSlpWRBfB
         2ZXgVQbg2RJU8RX7qo/u7g6Xl4G6xZNh7IDPtHiQ/d5QN1jAgGG0SC7vNmYYbH35xB23
         aNtUYoS3NqPsZ9ZPC8VlbOIs1+5lR1knYK1xc7Q52NGMYnFEmFf/fAu8/n6kJsuiRIOG
         PZxrEblhVeZUAMqTq5MhmPDqOR25+nXDKJLBQ7YhGpjfe6mFXEoX6JpuPri2w5CKTwF5
         8+Yg==
X-Gm-Message-State: AOAM5333Pz33KQwYLxeTOvGa/7VcyS4rPExWjgoft+TVJwp+jKRmTRUy
        4BjVleTD0vQ7DLcCC269V+ztn/hZea58RIQ09Ko=
X-Google-Smtp-Source: ABdhPJzCuN9ZJmSK94oU8+rMpioP0OCWAT/Ot9YA9rFyq4w6fW/gnhDlvl84v8GzomtT25AD6fXp2w==
X-Received: by 2002:a63:6b42:0:b0:3da:ebd8:2e38 with SMTP id g63-20020a636b42000000b003daebd82e38mr20935237pgc.273.1653319215840;
        Mon, 23 May 2022 08:20:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x21-20020a1709027c1500b0015e8d4eb272sm5258723pll.188.2022.05.23.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 08:20:15 -0700 (PDT)
Message-ID: <628ba62f.1c69fb81.7db13.c107@mx.google.com>
Date:   Mon, 23 May 2022 08:20:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-23-v5.18
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 7 runs,
 1 regressions (renesas-devel-2022-05-23-v5.18)
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

renesas/master sleep: 7 runs, 1 regressions (renesas-devel-2022-05-23-v5.18)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-23-v5.18/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-23-v5.18
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d7344501bd97263caeccbd7a972c0db04024a081 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/628b99019b14d43f43a39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/628b99019b14d43f43a39bf0
        failing since 6 days (last pass: renesas-devel-2022-05-09-v5.18-rc6=
, first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =20
