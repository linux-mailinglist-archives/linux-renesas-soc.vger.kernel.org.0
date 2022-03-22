Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4814E37CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Mar 2022 05:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236302AbiCVED1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Mar 2022 00:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236262AbiCVEDT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Mar 2022 00:03:19 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446F512F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 21:01:52 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id e6so11746373pgn.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 21:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=brpFJ0NsT+IH8UPHQhieGjeTfppMAPHLQAuet6rXTdQ=;
        b=A95a4Zc/62kLOuQVEMVaxikjPpqz4Rm6M504Rg5L/D/r4Ty2R8oUAdMjfFxzH5G8pJ
         hE6oitpKqjSoGCtgCyq6D64i5/kqjtqen/z4TSt+jxWB1l1r94YB9mmYwydoQav9sGBv
         3p6gbjz7SLiSFAPteyLcpOC3xHVA++8+CerCMvxSn2v/HSrAEWS3xu8sFLEATjUA58Wm
         jfzPFWjCKSIXkHiAVW/ztvBKXYUlD47Ow08YQBODXETLzcjs5M//epNvledhRAb11mYJ
         xSMndJ/GnLOAAKTFmZhqQ1r3e0qvL5tlRK3YOh2eU+oE0pN2phGiFZObNUbwzh4EmvYJ
         fBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=brpFJ0NsT+IH8UPHQhieGjeTfppMAPHLQAuet6rXTdQ=;
        b=juIu7EXgE59c3HDfgm/YgdS2buLbBJnwlE9TtlWLgtJIcUYR31EWagcd6gpZ7OMsL8
         g+7Ifk+aCtRqybxk5hb8yxIT6QuojHVnUQmliwi+ULeXZHWlPqNRGfZ30IgXkuzkTZo8
         gpFy7WhTPba1Fpg9MM2UsvXHRWrV7jG69RTDBEdKQK1WTIHWW+7zv6H9uJqabysRCJDh
         lWu0RqpEM0pydV7E5IfgOvE/T+yg0xl4zSQbjz1hk3olo7hD3pYHWRfu5KT3vJDFmRZj
         EHwp8qjNLM4hhd4EtjA0NQIo/hjhkfdb4EcwRwEYd+4EafwKZSRWbcJ8YeViNuV8GaZn
         Al2w==
X-Gm-Message-State: AOAM533voVpBSWVapz/Nfv7LImEI/1GioiTpgWk3zXZPa2TrMifYg9jV
        aNCMjy8fQSc3jmB9q2iZ3hjKfHf6VHHa5bL+aq4=
X-Google-Smtp-Source: ABdhPJy5/O0SCv6qvMbdFcI8plKGsavl7iAqDZZA05kIHHWpPYmHhV1QUsGusk2WxlbFKVFJWLrNeQ==
X-Received: by 2002:a05:6a00:852:b0:4f6:feac:9c3e with SMTP id q18-20020a056a00085200b004f6feac9c3emr27509228pfk.1.1647921711535;
        Mon, 21 Mar 2022 21:01:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x2-20020a63aa42000000b0038265eb2495sm6230501pgo.88.2022.03.21.21.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 21:01:51 -0700 (PDT)
Message-ID: <62394a2f.1c69fb81.facca.1a4d@mx.google.com>
Date:   Mon, 21 Mar 2022 21:01:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-03-21-v5.17
Subject: renesas/master baseline-nfs: 57 runs,
 2 regressions (renesas-devel-2022-03-21-v5.17)
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

renesas/master baseline-nfs: 57 runs, 2 regressions (renesas-devel-2022-03-=
21-v5.17)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
         | regressions
--------------------+-------+---------------+----------+-------------------=
---------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto  =
         | 1          =

rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-03-21-v5.17/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-03-21-v5.17
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bb77d4c08c656dc6f9863818e8405efba05abf1e =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
         | regressions
--------------------+-------+---------------+----------+-------------------=
---------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto  =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/623919c183d8827ba721731a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220311.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/623919c183d8827ba=
721731b
        new failure (last pass: renesas-devel-2022-03-14-v5.17-rc8) =

 =



platform            | arch  | lab           | compiler | defconfig         =
         | regressions
--------------------+-------+---------------+----------+-------------------=
---------+------------
rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook | 1          =


  Details:     https://kernelci.org/test/plan/id/623914f30eb0f8270e2172b9

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-03-21-v5.17/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220311.1/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/623914f40eb0f8270e2172db
        failing since 13 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-03-22T00:14:31.649763  /lava-5918956/1/../bin/lava-test-case   =

 =20
