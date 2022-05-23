Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B431531343
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 May 2022 18:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237668AbiEWPUV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 May 2022 11:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237716AbiEWPUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 May 2022 11:20:19 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1005DA6B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:17 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id j6so13974854pfe.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZXptlh4V+rQ6iHBmrAhMWRKRO9+Fbgtvw6Lc1qBUlH4=;
        b=nnFLNnSBB1rU8godVVxT11IEQ8o9jWHUgU34hGhfS/ZrXCbbYo5RBENs8xGWe+dLk7
         3ypHVXbw2vovFFXot+5JJChIGZjHxOo4qLiupWAcqUh20sdQsMZwD/OSr0A5Fc5KHQWh
         YN8A0+WvM69X/5/KEvPkX11/a/46r4QM6+KSGz40VxjLPdHWkuAWNpdTfu+kzrV8fStO
         /ylqkr5YeCPMidTHJM+LJhksP9o+8QyRiDA0q/lSSh7625KsaxmBhjxhPRymuINJkA0f
         Mq1YebikHLxRSa9Ll3QkjrVc+QIpXB8vp4d/WPOlk10MdYNMn4w2E8WISCIvOxaO16+h
         g00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZXptlh4V+rQ6iHBmrAhMWRKRO9+Fbgtvw6Lc1qBUlH4=;
        b=476fnJ6A30ywzKD0KZpbwSS+r9IaK0gci+dwIrKsVjALz+1TTjj4jDYc+bhhsr3bs1
         DU8Cry33md8c5FgnnJVQbSlIAsrc76+he0DXkqNBTwkQOg4v4Empyz8XJv+P7Vew1PRW
         J+7KlKBa6dMT6SB22iDxahQ2hgOjltoTgUaATSEvn8XnYSBVCjPBqFeJFBLAEwjwy0MV
         OWLVudv5Gckot++AxXovKnbxYdx5NzvIpm/pFDpHaeK6/2W7QcEzRUnI+0ipV+WhfmN2
         UIh7+hJEImesh3m1U1Vo7Rzq5meGM0kIxIupjmGU86elaV/GIMFd5Nwl7z5n/TTxlQ4m
         CmBg==
X-Gm-Message-State: AOAM530IaGF3X6kakzv5dHAJ42Alx68jPDUNfcb01DlN1vs3KilI/1b5
        wYgZKug51ah/0Fx+NcMje8LR1nzxpEFHzxSlQew=
X-Google-Smtp-Source: ABdhPJxqCzassQ+rHS7SnzQLjpnKKB/FyZNYAJgetzH95NqpIAgOcXQItOWdITPjvrOzvcsnls6TTA==
X-Received: by 2002:a05:6a00:729:b0:4f7:77ed:c256 with SMTP id 9-20020a056a00072900b004f777edc256mr24178372pfm.1.1653319216562;
        Mon, 23 May 2022 08:20:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i11-20020a1709026acb00b001617ffc6d25sm5315453plt.19.2022.05.23.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 08:20:16 -0700 (PDT)
Message-ID: <628ba630.1c69fb81.82c20.c475@mx.google.com>
Date:   Mon, 23 May 2022 08:20:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-23-v5.18
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
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

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2022-05-23-v5.18)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-23-v5.18/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-23-v5.18
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d7344501bd97263caeccbd7a972c0db04024a081

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  163144712a46229f3476b04f6c0037c4b7f00299 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/628b98838edb885bd4a39ce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-23-v5.18/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20220513.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/628b98838e=
db885bd4a39ce4
        failing since 6 days (last pass: renesas-devel-2022-05-09-v5.18-rc6=
, first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =20
