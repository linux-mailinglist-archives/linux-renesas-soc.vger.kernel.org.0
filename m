Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 059C8715D43
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 13:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjE3Lbn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 07:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjE3Lbm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 07:31:42 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B82310C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:37 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-53063897412so3858290a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685446296; x=1688038296;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j2TsR6dqK/8ozYNeDgN9HqeC3HFU9M9kcLgAJQorIR0=;
        b=NXuBkHZtWGW+BxkV9HG0cYnvz0+SYY0Ze1ihoNXhoEHO4PoPazeblY8xbrKIH3L9Al
         MnOpJhf/NujFk08rWsqBabtRmF06MzQ0uKfrknQEkJ0n9YwM1dbBCtoW0IL0/TqeV/Wx
         8odHU9CZavELkaU0w6pUgdDSwGY6LgvIhGMNVF2O342oLO4OZn1FDx88Dgu3ObfvBLl3
         SLWilFwfaysWzsrlFu+SibWpsZ+cpv4QkPE64Vcj5ApWnTmQrJtHavjwCUr99HjD/2XF
         SL4oT3cHBTt222bKuhJM0pMD+MeimukY0veTtQRwjGTnYADFf8VlIigIATVeEqWyvcZS
         mFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446296; x=1688038296;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2TsR6dqK/8ozYNeDgN9HqeC3HFU9M9kcLgAJQorIR0=;
        b=ewJOEX1OUZ0jwxgBGeUxywDqNdeYNdwwi13uS70wj1T3Qq7z+fr41QCNrDkKQzLgPm
         xC4Kp0FXchkp2gpmufT3zrd+MDmkXW5uzYFyzU3mrwiSZrfakxMe6y8Y21BdKYYjX0J6
         nZmY9uEup9rHioJY4H/YsKGORkzR9k4OGIe0KHFcefUrJbC60TLMsT6JvNzg5z/gqYDI
         jQl2hIO5Evv142pCnfQ80UKdhqG2k7hKEL+uNkdXW2LXCWyk/1cEpfohchnTpgUYOWz8
         WnhOwN/kGVAjX09Qo06rcRvyFhfnULEqqAjvUvBLedWOGA1s3yyqHTffievWYB670l28
         Wygg==
X-Gm-Message-State: AC+VfDwqMII3C8UNjoaIKAc3lOgUkqJl0K7ch4+ojuwbIU2m/A3AGbb3
        bgMiWBDwGORus3nKE7lHW66mrsVhQf07wNyxhNLqlA==
X-Google-Smtp-Source: ACHHUZ5AoFcvotTg1xOXnMHR5eEcQIyhC3XTPQqidTTt4kruE8FOkfiA/pT8nGKX4Fz2lFBWPGq7Mg==
X-Received: by 2002:a17:902:8c91:b0:1b0:2cca:a1e3 with SMTP id t17-20020a1709028c9100b001b02ccaa1e3mr1914438plo.56.1685446295772;
        Tue, 30 May 2023 04:31:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u12-20020a170903124c00b001b02658db25sm6393125plh.22.2023.05.30.04.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 04:31:34 -0700 (PDT)
Message-ID: <6475de96.170a0220.70f47.ad92@mx.google.com>
Date:   Tue, 30 May 2023 04:31:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-30-v6.4-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master sleep: 7 runs,
 2 regressions (renesas-devel-2023-05-30-v6.4-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 7 runs, 2 regressions (renesas-devel-2023-05-30-v6.4-=
rc4)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-30-v6.4-rc4/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-30-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      520bf28625c74fdd976c6c37fb519ccad1cef65b =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475cfcea971cd63d02e86c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6475cfcea971cd63d02e86c2
        failing since 7 days (last pass: renesas-devel-2023-04-24-v6.3, fir=
st fail: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6475ce4afa8ff8dc032e8714

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-30-v6.4-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/6475ce4afa8ff8dc032e8715
        failing since 20 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
