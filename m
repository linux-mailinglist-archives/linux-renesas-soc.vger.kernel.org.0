Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7147158FDB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 15:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbiHKNuc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 09:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbiHKNu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 09:50:29 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D648DB1D0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 06:50:28 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id p8so16922226plq.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=3WrnZQuouAGhHmcQQLjJvCOVWdzjJDx7PwfVbZV+6TM=;
        b=tjYziNLoxSbnyZ6jtftlbUVWPioMfks7Bbwu7hOm/Qhxhk5Tr1Wip2wWiOAEwDvWn8
         55aDVMcAQRshoJZyGenLGK1i5zokyr5uPoF/D65J3oErWM5MXxQqisHDDS4Xk/lFtOAA
         ZjqNLBu3Y+v1fVEXHhJXKHNanxpYvivLyQa90Qf5Mb9/OAlJtfgGdCfIQTxc0DppHAEZ
         dm4khib7rC8BF9pRwxZnvQPUw4jq5uxfc4J4Dvqns9Z6FsfpiTArrOBskE+hivNTVVGx
         37wxmm4W6j6Y+y29ibrCUIa1NOrLLSRYeNKrDymL3wEeIE3WBRho0uLuaHHo0omjCn/r
         lkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=3WrnZQuouAGhHmcQQLjJvCOVWdzjJDx7PwfVbZV+6TM=;
        b=wndmjG/SV0nuqnmgfHxecUw6MDwZVcHWvYzkYitr7KIcBa/ZE1N1e+OTLW3AeTjEbd
         vgLkYuXc3VIvFpEXTXsUPWLdynI9jUb8hNWjtfW57ORNCP0ocSQyIw8PgPE3qimw1nWb
         kACufOl1I/ib7ifz0A3sMdwyIEBg69gsWZghHS8sMJZ/J0qkLUYw3xDi8GbB+3iaJIIy
         sFoa6u7HIYeYVOsyt9RWHjvV/D820sbQqmSic/K675jtNjiI+xhkOmuTN4ND+yN6obV3
         jBFnTj68AYrk0SVj1gCIn3Yc58r1D4PKMPMySBRvgpXvxxaBdr7fedvirwbLDCMVnwvy
         Y64w==
X-Gm-Message-State: ACgBeo2TXVe/ONbQA5ZLrYqHoLb98cdqaSZhHfp8DOKiu8//vx/V6MDS
        VcRfsUo0cp+rFKddHGMFNwhQmE9MSlqH9gorJqo=
X-Google-Smtp-Source: AA6agR6gGY5EHjlnqUy8i2FZEadMi5uPp+OrtOhWFi25eqP6pqCyT88/lGjLWsfgygmBGizOmPCfqg==
X-Received: by 2002:a17:90b:380d:b0:1f5:2c6d:7de8 with SMTP id mq13-20020a17090b380d00b001f52c6d7de8mr8863051pjb.18.1660225828293;
        Thu, 11 Aug 2022 06:50:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902780300b0016d10267927sm14721360pll.203.2022.08.11.06.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 06:50:18 -0700 (PDT)
Message-ID: <62f5091a.170a0220.25db3.8a23@mx.google.com>
Date:   Thu, 11 Aug 2022 06:50:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-11-v5.19
Subject: renesas/master ltp-ipc: 17 runs,
 1 regressions (renesas-devel-2022-08-11-v5.19)
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

renesas/master ltp-ipc: 17 runs, 1 regressions (renesas-devel-2022-08-11-v5=
.19)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-11-v5.19/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-11-v5.19
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      afa6e8225571047286d61812f393c879ef344b1d

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  7e71b2c4b9a136602d9774c13097f5e06f6f04a9 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4f59ed62360e760daf074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ltp-i=
pc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ltp-i=
pc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220805.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62f4f59ed62360e760daf0=
75
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8) =

 =20
