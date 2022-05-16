Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB77528A55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 May 2022 18:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiEPQ2u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 12:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343554AbiEPQ2r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 12:28:47 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4913B019
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 09:28:46 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id r71so14224018pgr.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 May 2022 09:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4eQslNyG4B2OPpssOcYWIQ4RjgswRtLgdms6XJiXJKI=;
        b=l2qTM2Q7m+63hrINtSeLpOFHddlN5GAbtX6TYjsOCU1RO9XxezHxKUAFhVzE6Q8n8p
         lIjf9lrUWZBNcSieCS5wRylBXYfYkRHMapmUZJej6dlhZK/Z84+kh4JDFDdvgc2I0RSW
         hqK4xXDeZ0lyag8L+KjpY5vE5b7X54QLRHuYLNwGZsCVMg6OsccLbqEiRPOX1JGcIRaO
         SHjNXPRRguRde1dQM7IhNYMJh4OtNS3DHrM8y80glI/CRL5WtAZad/v6ujIM9CCftZpv
         UVZtmOf60VG3OQTeFAMBFf4PHfTHmwUy7/z7p8yMCA2jvC+e++Y/MdzgtD/1VqR+mag4
         JYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4eQslNyG4B2OPpssOcYWIQ4RjgswRtLgdms6XJiXJKI=;
        b=QNtgacE88kYXpNH5VBnYguaD1zHkALefNYABb48ZdEq0ULW+LZ1xSkrCuAOPOO5eFe
         6iP+EFqeTlcnA5OxFBHFQQYZm9+v7vjd44JSgSv7htlk/9S4SHcglV1NOKRm7UL2uwuX
         oP0iioFfPFF75f6+k/avNooe3r+eJfOHhQNijwGTRDOE1+LvsQXkKb63B244BplPQ2/L
         4trMn0lCxJYCp98xEioZ89lcHpzDKuNu9TYGFlc7RzvAWzRoBN9TbA8WrPa2DxvkCM61
         bfF4L1Hr6z0OSEkz2zenUazhcfsZi9yike5cG5r3yzlVHB/jnZ/xaK3MYfRgwPAdjrn+
         6zxw==
X-Gm-Message-State: AOAM530iqwWByT7QkVj97GCy6t7e3CdAxSiROtwNU4cOcmqmMCCQFvI5
        4UQUiEQXmhaQo/zUkBAseUGQYPFMGLrunlE4ts0=
X-Google-Smtp-Source: ABdhPJwlkDGpud+U8c023bc7lLY2UiUzY1x/OZo4/FT5a9eX8P0D5+Yp/Sfvprq97kCBCXPnKTkRjA==
X-Received: by 2002:a63:ba03:0:b0:3db:8498:fd56 with SMTP id k3-20020a63ba03000000b003db8498fd56mr15996126pgf.396.1652718525887;
        Mon, 16 May 2022 09:28:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ix3-20020a170902f80300b0015e8d4eb238sm7258014plb.130.2022.05.16.09.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:28:45 -0700 (PDT)
Message-ID: <62827bbd.1c69fb81.ae401.1939@mx.google.com>
Date:   Mon, 16 May 2022 09:28:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-16-v5.18-rc7
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
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

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2022-05-16-v5.18-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-16-v5.18-rc7/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-16-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f35c24489921b1d4963dbb55053b97fb0e53f471

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


  Details:     https://kernelci.org/test/plan/id/62826dae7bfcda1a378f571f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-16-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20220513.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/62826dae7b=
fcda1a378f5720
        new failure (last pass: renesas-devel-2022-05-09-v5.18-rc6) =

 =20
