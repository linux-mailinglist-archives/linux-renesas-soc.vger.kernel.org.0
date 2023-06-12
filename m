Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20C772C52B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jun 2023 14:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236636AbjFLM4i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jun 2023 08:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236651AbjFLM4W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 08:56:22 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0851C2950
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:21 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-65311774e52so3237017b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686574495; x=1689166495;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W4wx1gPSXV2X+A8QVSqn7TRW9HbvMHEi0VfeikNtUf0=;
        b=BOUQdo2zvKWEybB5ZNr2cjBAQSmik0vBCk3T1ON5gnuLL3RwLiIBG4oPqbPXodMHHj
         YwbUcYt5a1MtHpR/p6RdW42P/Qpz2E2eXPofoyIcf5OZq92g/Saz/g//Swji/tFj9hKh
         uKf7eCdt9KTPUo+o/WaMHSDOGphEF1eOx/3/nP5zZUeaHhj4uhGSAeoSy7R/TyFO8sJz
         d81hBjZ+EkJHP8fZzIvmxvSfDxma2MRNdGC6/ij0wouncH0N/OpFkbDeLpqFrY3Ajr0T
         t02Oi1gF8thf6bxxRfFm6KmCu+w0aIf6ku1iz3roRkpT2lzMcu1ATGUjFvdibZDf2sFS
         qerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574495; x=1689166495;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4wx1gPSXV2X+A8QVSqn7TRW9HbvMHEi0VfeikNtUf0=;
        b=TkRBJJ+esOy38gEQwnVIPej0hPGhV8PgUYIbr7FSAb+r+2mmPzK0KOoJgFgqqZ3KsX
         odLWjFYLQ8Ae6Z0++gPbDDdnVRxbnrj1PRu0MynVIG+R6aWraV8zNUrZf/tS9NFXVYEA
         IzwPtyN/ckjhYVRQTj5WJpRR0Hh05NEimtkQayEHxtgIDY5POu28hqiwitfSKUPUIoXC
         XSeVEnnBj4g8vvP+veIhHGR/TvTERt/C2xF9MrUtNCw1x/sIjoELobtE81nVSIEk87ys
         82Daq455IjraCzZ2DWsFSgq6i0Z8RRBJkR6co+yOUhOoPOPusd1g3I03svENaFsr3HDq
         ETEg==
X-Gm-Message-State: AC+VfDympcnjZRwOtvRkM3TdQXQ9gon6QC+CZHVr3mHBrazht+uBC5pg
        qZc7bqNwy/klCXeFrbwZeZmJRkoAY9g/sS8aHIgDxg==
X-Google-Smtp-Source: ACHHUZ4CpRzFV3zFostruW1hJbwcOkub0AuQtXJEMbG3CNOYPDYJR4ozqvtyUNi2fDj9qTwjzR9Y2w==
X-Received: by 2002:a05:6a00:238c:b0:653:a9ac:44c with SMTP id f12-20020a056a00238c00b00653a9ac044cmr10120229pfc.11.1686574495370;
        Mon, 12 Jun 2023 05:54:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k16-20020aa792d0000000b00665a76a8cfasm870270pfa.194.2023.06.12.05.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 05:54:54 -0700 (PDT)
Message-ID: <6487159e.a70a0220.f893d.14ce@mx.google.com>
Date:   Mon, 12 Jun 2023 05:54:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-06-12-v6.4-rc6
Subject: renesas/master cros-ec: 10 runs,
 2 regressions (renesas-devel-2023-06-12-v6.4-rc6)
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

renesas/master cros-ec: 10 runs, 2 regressions (renesas-devel-2023-06-12-v6=
.4-rc6)

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
sas-devel-2023-06-12-v6.4-rc6/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-12-v6.4-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eec974413697190538e69788efc6048763f9b64e

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648703623e650e6567306178

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/648703623e650e65673061=
79
        failing since 33 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648704f44e3e4a47e5306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/648704f44e3e4a47e53061=
34
        failing since 33 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
