Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA7AC50EA00
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 22:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245174AbiDYUWA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 16:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245173AbiDYUVy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 16:21:54 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A0C4506B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 13:18:49 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id p6so929963pjm.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MBZyyz/+0EWLBuksFhxBx1mOHdv21l40e1YbaoFTKok=;
        b=H3Mg7Bk+DhYGoclRpQ4pWmAMu2gineNpLPnJsSlhAMqhNxNnOY6I9H/128KB2Dsn3m
         XBnZZklpwIWqyTVcSNto1j0N+0ObMNZWaBWwK7FZNSjeJjvMdY0RQq1aBg51fJM0D6VF
         zXKHGh00ImB/S5RkKdAGdi8lk4fMF+kvYXbjIGc3x8awfKg8KQUFDAnBEj2f+2PuVFwt
         kko/Msxej43d/ViWGLPVmeoHndUZIaoSo+aGw1YXxzfMANmgwH5izv3osy/Fw+9Ps+5z
         IVIdVQJRie+cn+6FlKz0qnlWgMt33zvFZe+O+jpZ/IhKvS1syGmxzbVTpm1DTcnveCT/
         ja8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MBZyyz/+0EWLBuksFhxBx1mOHdv21l40e1YbaoFTKok=;
        b=k8HLoRtJHaY5KcwNd1Uu1W6B/Xd96iW133H8h09vsBnH13ZsOKizazYO8bqffVkSyf
         47e4BhaUYLcaL3TQxkQB9SMqbTSgHqaRP5+488duh2O0nQh0egZ4KkGUv+J/k+En3TLL
         bpbYiFO6U8igtGc90+eARAyYQ11Q9ytdxfvsAzqXjDiqvrFFQkIFa0UJEjjpuDOrGWVk
         UV7imoRN+4LaMzx1F2pJawkxOIAhfU2ZuAJ6f43/HDVk50cpXyr0qgl802Ttpfwhhoj2
         jH204wN5JTSfkBPOxtK2wG62ciT+aWzixmt/zXPi2/XqokYJnB3heaI4hmWSwQ0RlJxf
         T7/w==
X-Gm-Message-State: AOAM531ofa4j6jTOMd28PMsemar3PJI7C41wd2DLGmAgK6kphyxbzDhG
        8mgcc6EPQIAX3Ze/ZUm2movyeOKIlVt+q4FWL5I=
X-Google-Smtp-Source: ABdhPJzZWcYRJCJCeKjlM/Va5NN9ij3vKrAP6DpEh8QZrKK/c8vMj16h+Nul4EUveuLQnnazE70Vbw==
X-Received: by 2002:a17:90b:350e:b0:1d2:e1ad:5be6 with SMTP id ls14-20020a17090b350e00b001d2e1ad5be6mr22964405pjb.30.1650917929275;
        Mon, 25 Apr 2022 13:18:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id fh20-20020a17090b035400b001cb978f906esm207494pjb.0.2022.04.25.13.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 13:18:48 -0700 (PDT)
Message-ID: <62670228.1c69fb81.8cc65.0af7@mx.google.com>
Date:   Mon, 25 Apr 2022 13:18:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-04-25-v5.18-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 69 runs,
 1 regressions (renesas-next-2022-04-25-v5.18-rc1)
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

renesas/next baseline-nfs: 69 runs, 1 regressions (renesas-next-2022-04-25-=
v5.18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-25-v5.18-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-25-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      36f093d12e3c242cf7d9ef8358c73e2eca6c313d =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6266d013d4d15fbb60ff9478

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-25-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-25-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220422.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6266d013d4d15fbb60ff949e
        failing since 19 days (last pass: renesas-next-2022-02-25-v5.17-rc1=
, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-04-25T16:44:52.875125  <8>[   35.921106] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-25T16:44:53.911491  /lava-6172962/1/../bin/lava-test-case
    2022-04-25T16:44:53.938281  <8>[   36.985115] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
