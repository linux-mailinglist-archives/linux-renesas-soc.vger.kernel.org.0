Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5DCE519315
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 02:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244830AbiEDBDO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 21:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243418AbiEDBDO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 21:03:14 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C1C41610
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 17:59:40 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a15-20020a17090ad80f00b001dc2e23ad84so3837370pjv.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 17:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xKHxn3CoEXY55xvRX65CVLo2mYKokjFabfPKrwyiVKg=;
        b=FTdq0p5W7Be731he6itrbqC7g+wtCY2CHsSFv72ksqAs3HXRGxlpZESZv6bWm/rdq9
         k0/XIy2mGFbGJmkClwWnTmbqU4yGNBzTxdYrjrg3taGoKptTR6mw9W/F68GVyDWekMbP
         1Fg4frvqlwz6K4wST3ic83VpdZ97pk6oKWFTPk/YGzYgWoF1bVXroqMi1SioZH0Sup88
         1pnlBbiWtNbOl8wDYuUqs8BIYfpTs8GIv9G5WeXnZGg0m0n0af58L8yXyM/oEdyH8JrT
         OzAW7QOlevbjoC0lSKvKui/0jzg/C8UuzR3mZXd7dmGSsIuN1VrFs1MecsCHcngRIigo
         t/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xKHxn3CoEXY55xvRX65CVLo2mYKokjFabfPKrwyiVKg=;
        b=mTExNbehgGFkfFVPvr37nzSjAA3U1w+qR9aUBIhKJkE+Toa1oNMAHRqAUcOd9xgPKe
         t4dizx6a+rAaXQAOC5jL4d44dCd+LUe7UfMA/Q5OjfbfjotQHQKOHp3miqhvw0CLOfm7
         MPEkNOo6Ux51qdxeHLD9jcQn6wC+4Re5nj51OGIMoUxs7vh6L3Q4fEgebNi6yP1Qgs1h
         eyW1GWvP0DOJIakV/M2DGbSXZgZRL1kzE+hIc7PvyWI22c0WyulxVsmDTeZW/s3N7bBk
         UccBu4xwqW0hDDUQCfHENFFYzkIDZ0eLgvMGejghNkL+wa6OzGkqBtBkF8HLW4Ktlybv
         /12w==
X-Gm-Message-State: AOAM532Feyk3RMXjtCnxr1+rhoj+7jsAVYciaKG6s/PORJSVWdvnEPEL
        iQyzQ2KhyYlHsCWPylhV3ep13WOP04BeUKQg8x4=
X-Google-Smtp-Source: ABdhPJykvVsv+pdi3up0RtN4e4KjOhfo91kTkugebtAiW+RkbDLNXisK2NdakZubmsKfScx7VKan8Q==
X-Received: by 2002:a17:903:14a:b0:15c:f657:62cd with SMTP id r10-20020a170903014a00b0015cf65762cdmr19369635plc.36.1651625979558;
        Tue, 03 May 2022 17:59:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m13-20020aa78a0d000000b0050dc7628162sm6925501pfa.60.2022.05.03.17.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 17:59:39 -0700 (PDT)
Message-ID: <6271cffb.1c69fb81.cb196.1ec8@mx.google.com>
Date:   Tue, 03 May 2022 17:59:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-05-03-v5.18-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next sleep: 6 runs,
 2 regressions (renesas-next-2022-05-03-v5.18-rc1)
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

renesas/next sleep: 6 runs, 2 regressions (renesas-next-2022-05-03-v5.18-rc=
1)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-05-03-v5.18-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-05-03-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      513cc648e77c3a2a859bc8d69421ac231c72bbf4 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6271c8ae0a18a95b89dc7b97

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-05-03-v5.18-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-9: https://kernelci.org/test/case/id/6271c8ae0a18a=
95b89dc7b9a
        new failure (last pass: renesas-next-2022-04-25-v5.18-rc1)

    2022-05-04T00:27:49.143378  <6>[   87.015932] PM: suspend entry (deep)
    2022-05-04T00:27:49.146674  rtcwake: assuming RTC uses UTC ...
    2022-05-04T00:27:49.153389  rtcwake: wakeup from \"freeze\" using rtc0 =
at Wed May  4 00:27:53 2022
    2022-05-04T00:27:49.160030  <6>[   87.020030] Filesystems sync: 0.000 s=
econds
    2022-05-04T00:27:49.163102  <6>[   87.033775] PM: suspend entry (s2idle)
    2022-05-04T00:27:49.166367  rtcwake: <6>[   87.033777] PM: suspend exit
    2022-05-04T00:27:49.166868  write error
    2022-05-04T00:27:49.176618  <6>[   87.042184] Freezing user space proce=
sses ... (elapsed 0.000 seconds) done.
    2022-05-04T00:27:49.179088  <6>[   87.050429] OOM killer disabled.
    2022-05-04T00:27:49.196718  <6>[   87.053921] Freezing remaining freeza=
ble tasks ...  =

    ... (1165 line(s) more)  =


  * sleep.rtcwake-mem-8: https://kernelci.org/test/case/id/6271c8af0a18a95b=
89dc7ba5
        new failure (last pass: renesas-next-2022-04-25-v5.18-rc1)

    2022-05-04T00:26:31.526754  rtcwake: assuming RTC uses UTC ...
    2022-05-04T00:26:31.533555  rtcwake: wakeup from \"mem\" using rtc0 at =
Wed May  4 00:26:35 2022
    2022-05-04T00:26:31.536829  <6>[   30.257261] PM: suspend entry (deep)
    2022-05-04T00:26:31.540293  <6>[   30.266025] Filesystems sync: 0.000 s=
econds
    2022-05-04T00:26:31.551022  <6>[   30.270606] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-05-04T00:26:31.554382  <6>[   30.279318] OOM killer disabled.
    2022-05-04T00:26:31.597804  <6>[   30.282810] Freezing remaining freeza=
ble tasks ... =

    2022-05-04T00:26:31.604566  <6>[   30.322167] usb 2-1.4: new full-speed=
 USB device number 33 using xhci_hcd
    2022-05-04T00:26:31.676211  <3>[   30.400281] usb 2-1.4: device descrip=
tor read/64, error -32
    2022-05-04T00:26:31.849834  <3>[   30.574058] usb 2-1.4: device descrip=
tor read/64, error -32 =

    ... (1167 line(s) more)  =

 =20
