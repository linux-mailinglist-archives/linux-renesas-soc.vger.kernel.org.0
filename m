Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4357B5826
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 18:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237886AbjJBQfI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 12:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237799AbjJBQfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 12:35:08 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1809D
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 09:35:05 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-692c02adeefso10647160b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Oct 2023 09:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696264504; x=1696869304; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ogIH2UFcx7tsCi8pZ5mmV/4zrhtJm40UtbIC8hOmmZY=;
        b=k4eNskMx4Z0az6XWdevWwMXDbVBOpuRYjdkW2b5m7xOXqZxOov6Ns4KjF6Qhw8YzVA
         uDY1ktwUjoDTT6AB4fRMJunBPsjsPzkbo/ULrIJbe3svSeu745N3nS7jCQIusBVQOZvZ
         H0PkoeKO/ilzjfGn9w9AqBKChv5iqQCWfnYOsv22+w+1Ub8B7WWoAr5UXq9vyX5DoOPu
         ZH6LmLPOVaGVY1OAyuluV/8PMamdHFo8J2wutdw17m6fjBaVS6KKwy5yR5qr8is5hbxH
         e0zL2UzADvKtG00fVGIeHyFsLRZyKTwMQroCynrAXom2OfVT3R75Qz28hbK7XNX5aoGq
         MXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696264504; x=1696869304;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogIH2UFcx7tsCi8pZ5mmV/4zrhtJm40UtbIC8hOmmZY=;
        b=VtrOT1Ks9hBveQIMjDMnbd6GBWKE03ioWimBXkN7bHTarKyAfNk5gezJbfLkcRFMoG
         HC/fXmjJ3YPXUsWh8bctbWcrXfDqk/XxE8c0w7l3+PqwZlXPV/M0R1VPCgDyMX6bQY0+
         PiubG5QzZfJKn5FGUiZ5rE0UjJbsgzjS95ruz4FTpZAD21PiQWcyrtpE+huIto9WfeD1
         N/xNs9k9cHtxLDUx6SuY8xndO4TFdPPmBx56Ggkz0nPOk5zHW9Ijn2vGQMT0qh8r1Fad
         zOsChp800QxGHCdtrxzESxBz7hq0j7z1PiaN+nX/PoGXxgyHHU3auJuqYQDQFhtR2+IU
         VibA==
X-Gm-Message-State: AOJu0Yx2yKgi6odjWbkbkWzyCicgSt5+Nne2BSMy8u6M7UAxGJTSu7dG
        N1LCCHwTJGMmPLhuohyKXtcNqU8wXaUofH2Rkd/S9Q==
X-Google-Smtp-Source: AGHT+IG+Ut9CycTJT/5/ZkerPqewSPlecqnA0CmtXHi24g050pu9EJ1IMznn6YHjVBGz0I/myEt9Ow==
X-Received: by 2002:a05:6a00:1586:b0:68b:e6e0:5047 with SMTP id u6-20020a056a00158600b0068be6e05047mr11670574pfk.14.1696264504478;
        Mon, 02 Oct 2023 09:35:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y7-20020aa78047000000b006879493aca0sm8452776pfm.26.2023.10.02.09.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 09:35:03 -0700 (PDT)
Message-ID: <651af137.a70a0220.84285.65bc@mx.google.com>
Date:   Mon, 02 Oct 2023 09:35:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-10-02-v6.6-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 12 runs,
 1 regressions (renesas-devel-2023-10-02-v6.6-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 12 runs, 1 regressions (renesas-devel-2023-10-=
02-v6.6-rc4)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-10-02-v6.6-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-10-02-v6.6-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e7f4ce54899fc69930f8d28194311678b5e3d64b =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/651ac2175d09033bc38a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-02-v6.6-rc4/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/651ac2175d09033bc=
38a0a54
        failing since 48 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-08-14-v6.5-rc4) =

 =20
