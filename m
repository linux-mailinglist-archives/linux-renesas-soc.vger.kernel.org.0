Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF93852A0D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 13:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344757AbiEQLzn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 07:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345568AbiEQLzl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 07:55:41 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D624E4C431
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:38 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id g184so16751304pgc.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ykqW+yQfGvG2mCUljqEJkb2C+jK/MCW9BxS6VMing4E=;
        b=wxqbL0LObSxv0QqVEbQLse5owhtgIgHwrRuluoJwU4DiiI2dHfzAjOJrF8d33MBvrB
         anLxTZ5gOhcwAV44O/tojs7J6xkvIq7rUIxmu8skEVf2xVwu0qtTHfpnX3SXImfeWo0e
         ICIyH4oPDMWR8F0WSRAXa6i9D2IYqYKDcaYSezJToI8irFmGM/rgNTLQZHq1YZt18HPF
         Ok1B/XYx9bL6UFyO3t1d3b1pLs0hMeZJuITsJnoRyqDLQRA0bw9yc3bSWf64nTRalwKH
         aQ4OFlhkIe2geE/PPNCwSE4hmVn+8dKPCOiJ3rpu/S0BvkSg0xu4PlVZUJPFbEWilMGn
         logQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ykqW+yQfGvG2mCUljqEJkb2C+jK/MCW9BxS6VMing4E=;
        b=12Ssx7Pa+ffZkHqSEtYINAhhBYZTFr0Qt0TsOZG6B3b5ozw5Lw64zgtBBAHT86tDmU
         SxvfymZmSk0CB71O8HPPeUQj6doK7pBUvhvYwpRk5d1P7cKqSkwWMMFXvdf371UYIEQd
         OAFbeSuIk1eC/Ws3kIJcJGOuiF4TvDQ1VGfgXesPEnvhwn+mMlpRV/ECwXIXj+YdjiI6
         aOGvFW21s9019lsqaUMbNKVBYX41WmQczjDNL0kWpHm5F/Z+z9IAWq44Qs+GY2oak42X
         Dp1BCPu/MFAayyErXfd7pUvcsZMGOVVUpwp8P892YqevCM0Rb2i1YAXi2Tzo71aruVak
         Fq8Q==
X-Gm-Message-State: AOAM532yqPzRn7Xi0o4Bz6W3k8dQfxfjFI1xghYkHP9ps6WtpQKu9bHK
        b0e/EnM6CLp4VarpySzA0A5Q7mzWwmf0qArmJxA=
X-Google-Smtp-Source: ABdhPJzUR37jOkC+nJuUrkHj0+fHxE2S4Oc7xHCFSAs1qNNtlcWP+QMkxh41j8vXPmUSOqmup/l/fA==
X-Received: by 2002:a63:9752:0:b0:3c6:5a7a:5bd6 with SMTP id d18-20020a639752000000b003c65a7a5bd6mr19496338pgo.390.1652788538135;
        Tue, 17 May 2022 04:55:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709027fcc00b0015e8d4eb234sm8823408plb.126.2022.05.17.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 04:55:37 -0700 (PDT)
Message-ID: <62838d39.1c69fb81.d436e.5883@mx.google.com>
Date:   Tue, 17 May 2022 04:55:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-17-v5.18-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 6 runs,
 2 regressions (renesas-devel-2022-05-17-v5.18-rc7)
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

renesas/master sleep: 6 runs, 2 regressions (renesas-devel-2022-05-17-v5.18=
-rc7)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-17-v5.18-rc7/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-17-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6bd98cbba53cd9f63aaf4d82982dff95c824b92a =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62837d938d12634d80a39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62837d938d12634d80a39bda
        failing since 0 day (last pass: renesas-devel-2022-05-09-v5.18-rc6,=
 first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62837b7ab4defeb49aa39c15

  Results:     12 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220513.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-7: https://kernelci.org/test/case/id/62837b7ab4defeb4=
9aa39c1a
        new failure (last pass: renesas-devel-2022-05-16-v5.18-rc7)

    2022-05-17T10:35:05.207201  rtcwake: assuming RTC uses UTC ...
    2022-05-17T10:35:05.213127  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue May 17 09:02:12 2022
    2022-05-17T10:35:05.227269  <6>[   33.176212] PM: suspend entry (deep)
    2022-05-17T10:35:05.249135  <6>[   33.197309] Filesystems sync: 0.000 s=
econds
    2022-05-17T10:35:05.265970  <6>[   33.208811] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-05-17T10:35:05.274120  <6>[   33.223312] OOM killer disabled.
    2022-05-17T10:35:05.290269  <6>[   33.230491] Freezing remaining freeza=
ble tasks ... (elapsed 0.003 seconds) done.
    2022-05-17T10:35:05.301016  <6>[   33.246065] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2022-05-17T10:35:11.811551  =06=00=00<3>[   33.260190] mwifiex_pcie 000=
0:01:00.0: adapter is not valid
    2022-05-17T10:35:11.830104  <6>[   33.542921] Disabling non-boot CPUs .=
.. =

    ... (44 line(s) more)  =

 =20
