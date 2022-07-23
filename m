Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7533957EAB1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Jul 2022 02:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiGWAlw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 20:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiGWAlv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 20:41:51 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C7B11143
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 17:41:50 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id p8so5808150plq.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 17:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7j7QYeIlymmhYttiENx3fXDODbSUr/PDyPUDhgWodCI=;
        b=a6S5cpo1im18gN0qWxpOPUUh3rTl9Hc5V8/OHy5VUh4DhtOasa1tgd5AprwoY6p0dE
         x9hSEPQbyWWtca5HO+lkNBjoxoPyzf/17xnfiDm7YcP5acOiPZDt2WdMQ/ZYD59hgnt9
         VaO00CshJPHdJhzT18H4j0grKTKmEbUyeMu6HhyH7xsXkKpph4bxiUGl93hhhWCVjTv/
         aknIiY2tD2QJ98QU//uwnU96fOjybDlsz80vW55oec/sKM1uLWvnewCGjUFARFLVZr4G
         6Oo9+0mvJm/hAImtUkPc9UWdY1V8G0x2dnJe51tNOwA2pcNKvr9Oeih0slYomcN6OMEI
         O9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7j7QYeIlymmhYttiENx3fXDODbSUr/PDyPUDhgWodCI=;
        b=opsl97X20YfcDNLwD5Newjq/rEY/X/cfRjvw4jUsCzU2VkQyEr1p7aPXS49xNhv0Fn
         2u1aOZI0joSNQWZxH5swVgGDsOLm6nGKES+S0FbLvX9O38u7aJKvw8l1SynpjQ607M5r
         5AGoK9IO8gm1It/PuCJg5mPHkT/qECX6P11CQA5wQyMmAvsXiXF7Xgk5PAhPSA126kNt
         fqvx792iEFcwWgff5TdqlCRFqzCU1KnS4897wPqfDC80zRAFF+ADfED83nFn1Ukoot/q
         YFnz921I6Xk7BE9ZoUKg11P+9dy1RbgasyARsrIXzAvPGlsbq8dWNZcDhhJpa39UDJEa
         OIUw==
X-Gm-Message-State: AJIora+pQrsO7b0dNGyZm08YGLMdI30h822eCLRSit/nE3TbnMlXrHLQ
        BoYC2aXl6wMcHWL+A+FBudY1Rzxz4Iq+cH2x
X-Google-Smtp-Source: AGRyM1syxRxW4q4dkVQGj8NULw+i9Ky/fRpuVoPNmonYmo7unl2VPKCaHDOCuUFOctKipIVcUFHxKw==
X-Received: by 2002:a17:902:b20b:b0:16c:f2f6:ef93 with SMTP id t11-20020a170902b20b00b0016cf2f6ef93mr2384764plr.44.1658536909970;
        Fri, 22 Jul 2022 17:41:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7950d000000b00528c3ad8e09sm4484519pfp.66.2022.07.22.17.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 17:41:49 -0700 (PDT)
Message-ID: <62db43cd.1c69fb81.5f925.79c2@mx.google.com>
Date:   Fri, 22 Jul 2022 17:41:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-22-v5.19-rc7
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2022-07-22-v5.19-rc7)
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

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2022-07-22-v5.19-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-22-v5.19-rc7/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-22-v5.19-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3ddd67eca4592c2e96f8aa938195d645d1f8324b

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  ae7f823bb2ea355bf2ea7039449ed2c71ec879be =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62db3103a660095f8fdaf067

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-22-v5.19-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20220716.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/62db3103a6=
60095f8fdaf068
        new failure (last pass: renesas-devel-2022-07-19-v5.19-rc7) =

 =20
