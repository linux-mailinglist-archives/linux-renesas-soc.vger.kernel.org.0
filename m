Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3E05609F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 21:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiF2TG4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 15:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiF2TGy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 15:06:54 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E211F632
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:53 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cv13so16520635pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2mFFVmUPntecFBzpZ5BiSJ7gNvNWfKM/ccl+f3ApBCA=;
        b=emCVDZXGwx+Z/3izFaC//Bg8nh/K0huxFvLUW+lHlgpz3soID07UUU0QmzVb7UDUUT
         xlhPSwL3N0QUdt1SH5xgoYYwvNKqM36Cv9/n58rzfNiBhaHooOdKcp3ICRptcmHMb7lJ
         9dJw5+3bpDQ8sHGindrAfqM+TQ3LNG2vxijguw8wGJAjSS6WnSvz/LNfBV4+m8bWDAQ8
         rbbZ9sDIULzkYdIEGGVzll2b6Ij5v96dpGAqknrgYn95fn682Xr0u9OmO/jLvnODi2Qp
         zW5EVuYP11EOm7KEOo+fZyecgW69Z2dRk2sCszN4oa27cKvQmPxiwZsQou46Uil78BJz
         bANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2mFFVmUPntecFBzpZ5BiSJ7gNvNWfKM/ccl+f3ApBCA=;
        b=29uAxlUGntEyz2azKvnDgLVXpwL/SrRtWqvFFA1+ULL5e5TtA6qEkZJjQoXlvo2tXn
         VwrKXa1cXN02PGD+9R0NCnACWZpU5g/I6KsrXWIlOiWVCoAkevTj49B7ehqrGM3xgwZr
         hxs/PUtnYx2AnjP8f5e2w7v0fHSvgmqEBjkzCLEgZhWBdWfHFNQyit0rCQvgetUbJ5Eq
         n5xf4Wg2nT+0z/q6w1rkj+cvLy5gAOFuYFVU6XPsC1ObT04AzqyeXcrGDuYrPrDffKn3
         Z2FQrEK26SAURvJa7wJ92UiUC5fYHZml1OIIrQ6LXaHPDfeLk6GrM9AMnlrqxEkB9BpW
         LllA==
X-Gm-Message-State: AJIora/0DcS0dxItBN4lRuWZGWnvSjsm22/Po8+CJN/r8Tz4OJ/Bgnuv
        pl5nDuU4hAK/RCYw18U5scMQ6Y0IUG06Y/u4Wco=
X-Google-Smtp-Source: AGRyM1sa+Qa0KOBlj9+IbotRCk3rvocg5d6zx5zzLf3iCXGVMiRqsx4pmYyR5Ms8KXOXxejyt2X4QQ==
X-Received: by 2002:a17:902:f2d3:b0:169:77a:2e82 with SMTP id h19-20020a170902f2d300b00169077a2e82mr10613946plc.146.1656529612854;
        Wed, 29 Jun 2022 12:06:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id nb15-20020a17090b35cf00b001ec839fff50sm2509200pjb.34.2022.06.29.12.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 12:06:51 -0700 (PDT)
Message-ID: <62bca2cb.1c69fb81.5bf02.4149@mx.google.com>
Date:   Wed, 29 Jun 2022 12:06:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-29-v5.19-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2022-06-29-v5.19-rc4)
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
devel-2022-06-29-v5.19-rc4)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-29-v5.19-rc4/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-29-v5.19-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33401641a5eb2a82fb3eeeb71752594b1d8016bc

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  ef8c5223b4a5b2610e0dfbdff5257cf96c124f96 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc9184e12b75773aa39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20220624.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/62bc9184e1=
2b75773aa39bd7
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3) =

 =20
