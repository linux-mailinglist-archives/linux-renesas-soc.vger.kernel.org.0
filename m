Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CBE49A5F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 03:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3418222AbiAYCNO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 21:13:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3414885AbiAYAwx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 19:52:53 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B649C0E5313
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 14:34:23 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id u130so13199477pfc.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 14:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aEbuGg3RfUOIJ+7yeIsn57BsaXLAd9EQUcv/YuCgp38=;
        b=RFuVEvx50uXVY+bdt7KJQFczVjxLU50pvztFktwT4FS4cM7YC4d/b7EiDM4h/6LEdZ
         rUk2TsLuIojw5+s8MPoayzivBhznZAcVaK1ZGOVSN60o+gv8QUK7wnzoQ8KN0UhAkIxb
         fSlxhWu3PykILAXsw2xR5VFbKpRiECBKZ0enUEYS2ZrSostjpmuPuJK60j3xPOylIDOe
         zsUOabTyrmLXODYMSr5IeYVOmdPpjLwaQb/RA3UdziGQeVf7tGQ5sdhf26YA/GGcPyp0
         +xrwOBZoCkQ1B2jGcJr2mkYmlLPJdJ6Q5M5BQCp1S6Qf0/u3jiHTX9NhCzFBkDNUzSJG
         aLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aEbuGg3RfUOIJ+7yeIsn57BsaXLAd9EQUcv/YuCgp38=;
        b=WPnoRuhtuy8Wi4D5gVSRYu7TSsnuhpC3edIDCRn3lhfCtwVBZ6x9mAXnAJSV1qeF2K
         IT5Bmk6rbdlxk/4+6M1wtLINyn58oNHW8GgdLQreTuHv7BbjUd1mH6rM2GCb9Y0oUnee
         BjbIrgqxtebT5OjGqFDfeMU9ZBnhFo6FyE7uMVGEPmLELkLlo7y2cbP+JG9kpvd/AH0/
         ts04iOUJX6gC4ObOBfKAIYEIzC0ZE1LxD0bl1uzjyDstG7Z52FS/Nyd5y8dV9OTMSJCT
         GlqzA33MjbTM+9a8Oa7JLmURmHpIffkIgU8tmHqRl8p5E1+QD5EMMh0aC2507h3GedLw
         utzQ==
X-Gm-Message-State: AOAM531kPHjLHSph2IvjBqUglZ6RsG/0IGYHIl4ebCzBNirkKBbGZu8J
        dzS4NxiQgH8EKxjWv8bL33O2MFvGuky414KQ
X-Google-Smtp-Source: ABdhPJw0VIkfWxoixOJbdyGvJa4oRnksjs/ouQeZadpLW2wv4VUkCiGlPkQ8fmw8jOvqOJxlTTKrHA==
X-Received: by 2002:a63:7210:: with SMTP id n16mr13309536pgc.527.1643063662332;
        Mon, 24 Jan 2022 14:34:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ml14sm323092pjb.10.2022.01.24.14.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:34:22 -0800 (PST)
Message-ID: <61ef296e.1c69fb81.16bcd.16b8@mx.google.com>
Date:   Mon, 24 Jan 2022 14:34:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-611-g4ccda2778be0
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 2 runs,
 1 regressions (v5.17-rc1-611-g4ccda2778be0)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 2 runs, 1 regressions (v5.17-rc1-611-g4ccd=
a2778be0)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
7-rc1-611-g4ccda2778be0/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: v5.17-rc1-611-g4ccda2778be0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4ccda2778be03d61d70b8c8da55ef54d69a7f3cd

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f73008bac9a8db0779264b170f630483e9165764 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef19b0aa52fe494aabbd26

  Results:     79 PASS, 15 FAIL, 142 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-kms-=
rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-kms-=
rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220121.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
1ef19b0aa52fe494aabbdcc
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:24:24.891134  <8>[   44.334025] <LAVA_SIGNAL_TESTSET STOP>
    2022-01-24T21:24:24.929206  <8>[   44.370819] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-01-24T21:24:24.961836  <6>[   44.403456] Console: switching to col=
our dummy device 80x25
    2022-01-24T21:24:24.966935  <14>[   44.410121] [IGT] kms_setmode: execu=
ting
    2022-01-24T21:24:24.979262  IGT-Version: 1.26-gf73008b (aarch64) (Linux=
: 5.17.0-rc1 aarch64)<14>[   44.415798] [IGT] kms_setmode: starting subtest=
 basic
    2022-01-24T21:24:24.980043  =

    2022-01-24T21:24:24.981909  Starting subtest: basic
    2022-01-24T21:24:24.985833  Testing: basic 1 connector combinations
    2022-01-24T21:24:25.086424    Test id#1 CRTC count 1
    2022-01-24T21:24:25.093774      CRTC[37] [Pipe A] Mode: 2400x1600@60Hz =
Connectors: eDP-1[49] =

    ... (67 line(s) more)  =

 =20
