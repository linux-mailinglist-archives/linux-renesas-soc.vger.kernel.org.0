Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60EF96D6D31
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 21:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235855AbjDDTcg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 15:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236013AbjDDTcb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 15:32:31 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFCD3A92
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 12:32:30 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id n14so16463435plc.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680636749;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EenleOKvsVLXXw8pG9gLQRx7UzbnKycHpwHQ/WEb4b0=;
        b=lVFzntG3p1SAokpCGn/qIC/mrRlvF5efCZZ2+LlFJmSYeSH+GJ+r8T8kVmxtYnyLGK
         VVhOgFC5PIIpnIO8tRfsHRywQ8ii5zgKk5nLJaRmg0sI4yY9iT/M3j6Pz5ha5Er38yjv
         isNG2GkVzyNsaLbuHVxd2CGvfv+f18rmWCmWkHPrrpQXiTYK1RuXscoxwLSQMKeNUZNP
         3u560MtaKFw9//ctqGVDDw1KZrHfSFEMv+bJNTVqiv4sNGGadecrncfaeOCNK40/d97D
         fhM+Wk8A+czeQd7zUFbSpliTI5tPGph6mkTKoAFzpGO/kpR49mwlW6hiP4Wvg+Toct91
         rqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680636749;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EenleOKvsVLXXw8pG9gLQRx7UzbnKycHpwHQ/WEb4b0=;
        b=JsLYvwriHoxdMuzKn6mSfVFzRsyNiuNbxGLUXcdRhF67t/l/iSfoJpVkSWY32tcBUM
         4WYS3/csZKjMTOZsGZqbSqEG2SqQ7spbUHyVQulozzbmOpj13EgM13Lwfo/22BBtgtop
         1Tcqd/0vAYiqZF9/ShMhivEInAt+j7jwF7xWxlCdeTLz4Im+Th5cIJM9yF9qiMKnhnC0
         6ezfVJwkiuawc997+wBjP9DvNw4tqxO1FjY/F5xHvdTS3sQQF8fvEIM8J2Lh808QtbD3
         cN/rUe9rqWP6uPdGb2ydiqQuseOIaXUl05ALpy6+YOI8ha/8eNx7J21r9OkqySUUbmjp
         c3fw==
X-Gm-Message-State: AAQBX9e0jUxOERscA1LolatHKqwNUgxXMmTjMxNko2chZFeb1LII8Yf0
        KjFHlxTNSavKUfl1PaWSLe0IGuHI7FePzGF8BCCryQ==
X-Google-Smtp-Source: AKy350aruF+dphygRHyLO++Sao06rk9uuIXkM4AT1MLX2GeIK1C/m/3+XFFWQOtBpSU3tDDeISxyew==
X-Received: by 2002:a17:902:e18c:b0:19d:297:f30b with SMTP id y12-20020a170902e18c00b0019d0297f30bmr3225934pla.19.1680636749282;
        Tue, 04 Apr 2023 12:32:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v6-20020a170902b7c600b001967580f60fsm8605167plz.260.2023.04.04.12.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 12:32:29 -0700 (PDT)
Message-ID: <642c7b4d.170a0220.ef157.1521@mx.google.com>
Date:   Tue, 04 Apr 2023 12:32:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-04-04-v6.3-rc5
Subject: renesas/master usb: 1 runs,
 1 regressions (renesas-devel-2023-04-04-v6.3-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 1 runs, 1 regressions (renesas-devel-2023-04-04-v6.3-rc=
5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-04-v6.3-rc5/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-04-v6.3-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b4dd84fbb7628443a99f26465ef2fcee5c99583f =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6ada53abde7efc79e95a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/us=
b-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/us=
b-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/642c6ada53abde7efc79e95b
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2) =

 =20
