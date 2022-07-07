Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B5756A24D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jul 2022 14:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234912AbiGGMuD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jul 2022 08:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235355AbiGGMuD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 08:50:03 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F29B2B639
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jul 2022 05:50:02 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id g4so18348677pgc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jul 2022 05:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gUTERDFVd9CQgtkvwsbYpA2/Dd0+tfZ+I68b15bGoxw=;
        b=a9VwAmUo6nqFL7x0I4OpSDZm+D4lVJVArSS4NgRNieKXU9kca5bVpaHFw9WQitaPEF
         +b3Piizz0mn/k/5mfKL6LdKr1e47GOWJ1BpIs0R/r1RXldDMSFgBfaJDfVUgEu1cgv7z
         8JUO4EO8numz0wwNMHbh1KpDT87wZj1RgueoGpfJMLJ7z1dhuUcx6S/ZmtF0JrK2aFVW
         GdKB8MXwK35jcqFQ264Br65xORSqzBqL5BoOLtjiRMpiKsmzb2rkGolQdKT3jhQjQdmn
         /4eQoh1/NKv0J4K1IQ4dDTVvfe2LaBc8cMaD241w0aReE89zp/5O1joR86QjLhv0h+Pk
         G96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gUTERDFVd9CQgtkvwsbYpA2/Dd0+tfZ+I68b15bGoxw=;
        b=t/PzZ5DUh8JbPrrEuD2A+jyGTVJF75IfVi8LFhExBVJW96a+Qr5/EqblES93LD9+Hd
         quUaBrmHUEoxVME4Cow3CVET8ffJFfi2ysK2zzM5bojVCs2oHu4m2OAeDt5kjZg6Usai
         XQNXxe0n4ryOEXQXknpLVhlX5RWf9D+N//DSuySqrMV+Zy+LA4Bm6UVBnr6cDaKV02iP
         A3KUVqFuOXsT7tuqLirGbzWOgeVr3mQaBwSuY0LznZchXLGlgQtKgsdGMByndH0oEtqc
         l6DJsB303WOgKNz4P8VNOaQEFnLfCNsEwePJNnxGR+7vE9Gw2h2kMmjMZpM+5nuCtym6
         vkZw==
X-Gm-Message-State: AJIora8F/MT1EkvzRQTnP8GeanxTGx/UrtuzoLSeXkyGOeg+LLxdnFjf
        Ks41Y2C+DHOGZVM2jxAsWvENOo/capaUqSAM
X-Google-Smtp-Source: AGRyM1vblg/clx9fYwEGY0YT+it+cW9RvStQZtbFA9VnzgA71iSZz2RREfmOs4WdLrL19RXT/Zp1RA==
X-Received: by 2002:a17:90a:8048:b0:1ef:79e7:ecf6 with SMTP id e8-20020a17090a804800b001ef79e7ecf6mr4871290pjw.188.1657198201657;
        Thu, 07 Jul 2022 05:50:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s9-20020a170902b18900b0016c09a0ef87sm2546527plr.255.2022.07.07.05.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 05:50:00 -0700 (PDT)
Message-ID: <62c6d678.1c69fb81.7043b.3eba@mx.google.com>
Date:   Thu, 07 Jul 2022 05:50:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-07-07-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next usb: 3 runs,
 1 regressions (renesas-next-2022-07-07-v5.19-rc1)
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

renesas/next usb: 3 runs, 1 regressions (renesas-next-2022-07-07-v5.19-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-07-07-v5.19-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-07-07-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b5468cb7909f0068dd977e1f63ea39132098dbb7 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62c6c610bea0182fe0a39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-n=
yan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-07-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-n=
yan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220624.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62c6c610bea0182fe0a39bd4
        failing since 29 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
