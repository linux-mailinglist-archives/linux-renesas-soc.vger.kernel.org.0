Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E8748A08F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 20:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244994AbiAJTz2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 14:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243923AbiAJTzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 14:55:24 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED32DC061201
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jan 2022 11:55:18 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id t18so4083017plg.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jan 2022 11:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x2O75ZZ2JGUC7gmEU+nWgdtpIQhWW97Xx4VNOS2l4t8=;
        b=CRmP3TOZXae9gHGPJ0Wjyk9DxJ2R+uBPsjpNhOH7b8Yb3LnDkXWXq8RCNH6bak/U1x
         O9cWb91wgMwEx7ncRdueNtW/Rw/BDwkiG8jaQfeLbVMSkK03zauAsVa9LiRRcIsIndN7
         PlpKcflQhj1o7AchHB+s/BK9Hteq/bmow4GIgNydiyLl3vqbRiQbNae0NmnTwgxek7VC
         s32voCquBIfr7wbnfS5otFWLGdMGtPWlMGtOM5NKeb6zzorjYWG0B1YszOvEYjJpJix8
         O3DVuzZz88eqe7oPRRwk97L7MHgFSNrLkyV8PHbZVBdnpBHIO5StlDWtxgqyNrmJtNrw
         mkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x2O75ZZ2JGUC7gmEU+nWgdtpIQhWW97Xx4VNOS2l4t8=;
        b=Lhv5euSkRF2un2lqow82h4ykVZwvVNa32hyrmEmXxzCVbr/6yRCw0IBNx/X+hoVHYA
         vjCvee361Q0hkHFXuX1yWg1fCupTenydK8MLYUg848rxCpK54nQmxtmA5gZUEItrYYHV
         x8q99u7/eToWce/o4E73vcD+jgWu4YCdIHk21dYoVErvbnMMOuYg8MQeV7kMbnGZc+dS
         PNBj7sVynn3N4+m2EdjEZNv5+PhRSCJx0A844t7rOGgJ7wz5DacpD0E7TxbSVLxZA1xW
         fzzToef4T8txTDOs8lbDGUK/18KUBQRF+/vMnWML6eq5kHkmmUP4C8gRjRZJ5nG0vOwf
         Mp8g==
X-Gm-Message-State: AOAM5301I4TTxXZc6tdKh2yooSCSB83JrR0De+xYl8KAZfGotQuAl9q1
        IfQ689JQloDRXJD0cLSlqjzC+i0AYxvNAsO3
X-Google-Smtp-Source: ABdhPJw/jT719QZ+T5yYW+br5z1V92odL/392x0auR1Ln2qj3TirNayqbRcSQAA/EsiM+iqpS612mQ==
X-Received: by 2002:a17:902:e5c4:b0:149:5945:72e8 with SMTP id u4-20020a170902e5c400b00149594572e8mr988857plf.142.1641844517970;
        Mon, 10 Jan 2022 11:55:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d8sm3379335pfu.141.2022.01.10.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 11:55:17 -0800 (PST)
Message-ID: <61dc8f25.1c69fb81.e3248.87a2@mx.google.com>
Date:   Mon, 10 Jan 2022 11:55:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-01-10-v5.16
X-Kernelci-Branch: master
Subject: renesas/master sleep: 8 runs,
 6 regressions (renesas-devel-2022-01-10-v5.16)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 8 runs, 6 regressions (renesas-devel-2022-01-10-v5.16)

Regressions Summary
-------------------

platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
hp-11A-G6-EE-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =

rk3288-rock2-square | arm    | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 5          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-10-v5.16/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-10-v5.16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      20430dcf04d1ee6f9b5af4b2b23fe6e097006565 =



Test Regressions
---------------- =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
hp-11A-G6-EE-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61dc7b31b1ee9b84d0ef6749

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-10-v5.16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-10-v5.16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211224.1/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/61dc7b31b1ee9=
b84d0ef675b
        new failure (last pass: renesas-devel-2022-01-03-v5.16-rc8)

    2022-01-10T18:28:54.420087  rtcwake: assuming RTC uses UTC ...
    2022-01-10T18:28:54.426734  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Jan 10 18:29:00 2022
    2022-01-10T18:28:54.429848  <6>[   34.457478] PM: suspend entry (deep)
    2022-01-10T18:28:54.436608  <6>[   34.469501] Filesystems sync: 0.000 s=
econds
    2022-01-10T18:28:54.439737  <6>[   34.473959] PM: suspend entry (s2idle)
    2022-01-10T18:28:54.443332  <6>[   34.477976] PM: suspend exit
    2022-01-10T18:28:54.443754  rtcwake: write error
    2022-01-10T18:28:54.452760  <6>[   34.481609] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-01-10T18:28:54.456268  <6>[   34.488326] r8152 2-4:1.0 eth0: carri=
er on
    2022-01-10T18:28:54.459392  <6>[   34.490390] OOM killer disabled. =

    ... (1149 line(s) more)  =

 =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
rk3288-rock2-square | arm    | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 5          =


  Details:     https://kernelci.org/test/plan/id/61dc77f8de2f8d4173ef674b

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-10-v5.16/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-ro=
ck2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-10-v5.16/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-ro=
ck2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211224.1/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/61dc77f8de2f8d41=
73ef6751
        new failure (last pass: renesas-devel-2022-01-03-v5.16-rc8)

    2022-01-10T18:12:30.291466  rtcwake: assuming RTC uses UTC ...
    2022-01-10T18:12:30.291841  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 10 18:12:36 2022
    2022-01-10T18:12:30.313051  <6>[   98.315519] PM: suspend entry (deep)
    2022-01-10T18:12:30.313581  <6>[   98.319994] Filesystems sync: 0.000 s=
econds
    2022-01-10T18:12:50.360890  <6>[   98.326416] Freezing user space proce=
sses ... =

    2022-01-10T18:12:50.361701  <3>[  118.342589] Freezing of tasks failed =
after 20.010 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-10T18:12:50.366496  <6>[  118.353049] task:systemd-udevd   stat=
e:D stack:    0 pid:  122 ppid:   116 flags:0x00000081
    2022-01-10T18:12:50.366971  <6>[  118.362788] [<c1049bec>] (__schedule)=
 from [<c104a0d4>] (schedule+0x48/0xd0)
    2022-01-10T18:12:50.367345  <6>[  118.371050] [<c104a0d4>] (schedule) f=
rom [<c104a1b4>] (io_schedule+0x34/0x44)
    2022-01-10T18:12:50.408912  <6>[  118.379428] [<c104a1b4>] (io_schedule=
) from [<c043f668>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61dc77f8de2f8d41=
73ef6752
        new failure (last pass: renesas-devel-2022-01-03-v5.16-rc8)

    2022-01-10T18:12:10.089191  rtcwake: assuming RTC uses UTC ...
    2022-01-10T18:12:10.089614  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 10 18:12:16 2022
    2022-01-10T18:12:10.110449  <6>[   78.113537] PM: suspend entry (deep)
    2022-01-10T18:12:10.110940  <6>[   78.118015] Filesystems sync: 0.000 s=
econds
    2022-01-10T18:12:30.156199  <6>[   78.125723] Freezing user space proce=
sses ... =

    2022-01-10T18:12:30.156841  <3>[   98.137555] Freezing of tasks failed =
after 20.006 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-10T18:12:30.157233  <6>[   98.148116] task:systemd-udevd   stat=
e:D stack:    0 pid:  122 ppid:   116 flags:0x00000081
    2022-01-10T18:12:30.157636  <6>[   98.157971] [<c1049bec>] (__schedule)=
 from [<c104a0d4>] (schedule+0x48/0xd0)
    2022-01-10T18:12:30.157980  <6>[   98.166365] [<c104a0d4>] (schedule) f=
rom [<c104a1b4>] (io_schedule+0x34/0x44)
    2022-01-10T18:12:30.206379  <6>[   98.174835] [<c104a1b4>] (io_schedule=
) from [<c043f668>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61dc77f8de2f8d41=
73ef6753
        new failure (last pass: renesas-devel-2022-01-03-v5.16-rc8)

    2022-01-10T18:11:49.888176  rtcwake: assuming RTC uses UTC ...
    2022-01-10T18:11:49.888555  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 10 18:11:56 2022
    2022-01-10T18:11:49.909595  <6>[   57.911459] PM: suspend entry (deep)
    2022-01-10T18:11:49.910142  <6>[   57.915915] Filesystems sync: 0.000 s=
econds
    2022-01-10T18:12:09.960293  <6>[   57.921820] Freezing user space proce=
sses ... =

    2022-01-10T18:12:09.960900  <3>[   77.941897] Freezing of tasks failed =
after 20.014 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-10T18:12:09.961290  <6>[   77.952320] task:systemd-udevd   stat=
e:D stack:    0 pid:  122 ppid:   116 flags:0x00000081
    2022-01-10T18:12:09.961694  <6>[   77.962055] [<c1049bec>] (__schedule)=
 from [<c104a0d4>] (schedule+0x48/0xd0)
    2022-01-10T18:12:09.962044  <6>[   77.970316] [<c104a0d4>] (schedule) f=
rom [<c104a1b4>] (io_schedule+0x34/0x44)
    2022-01-10T18:12:10.008855  <6>[   77.978684] [<c104a1b4>] (io_schedule=
) from [<c043f668>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61dc77f8de2f8d41=
73ef6754
        new failure (last pass: renesas-devel-2022-01-03-v5.16-rc8)

    2022-01-10T18:11:29.691015  rtcwake: assuming RTC uses UTC ...
    2022-01-10T18:11:29.691398  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 10 18:11:36 2022
    2022-01-10T18:11:29.712258  <6>[   37.713875] PM: suspend entry (deep)
    2022-01-10T18:11:29.712749  <6>[   37.718258] Filesystems sync: 0.000 s=
econds
    2022-01-10T18:11:49.757290  <6>[   37.724101] Freezing user space proce=
sses ... =

    2022-01-10T18:11:49.758176  <3>[   57.737757] Freezing of tasks failed =
after 20.008 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-10T18:11:49.758597  <6>[   57.748310] task:systemd-udevd   stat=
e:D stack:    0 pid:  122 ppid:   116 flags:0x00000081
    2022-01-10T18:11:49.758963  <6>[   57.758189] [<c1049bec>] (__schedule)=
 from [<c104a0d4>] (schedule+0x48/0xd0)
    2022-01-10T18:11:49.759310  <6>[   57.766582] [<c104a0d4>] (schedule) f=
rom [<c104a1b4>] (io_schedule+0x34/0x44)
    2022-01-10T18:11:49.805883  <6>[   57.775051] [<c104a1b4>] (io_schedule=
) from [<c043f668>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/61dc77f8de2f8d41=
73ef6755
        new failure (last pass: renesas-devel-2022-01-03-v5.16-rc8)

    2022-01-10T18:11:09.497566  rtcwake: assuming RTC uses UTC ...
    2022-01-10T18:11:09.497890  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 10 18:11:15 2022
    2022-01-10T18:11:09.502744  <6>[   17.511630] PM: suspend entry (deep)
    2022-01-10T18:11:09.509812  <6>[   17.517145] Filesystems sync: 0.000 s=
econds
    2022-01-10T18:11:29.556448  <6>[   17.523387] Freezing user space proce=
sses ... =

    2022-01-10T18:11:29.557055  <3>[   37.537357] Freezing of tasks failed =
after 20.008 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-10T18:11:29.557493  <6>[   37.547817] task:systemd-udevd   stat=
e:D stack:    0 pid:  122 ppid:   116 flags:0x00000081
    2022-01-10T18:11:29.557870  <6>[   37.557571] [<c1049bec>] (__schedule)=
 from [<c104a0d4>] (schedule+0x48/0xd0)
    2022-01-10T18:11:29.562412  <6>[   37.565878] [<c104a0d4>] (schedule) f=
rom [<c104a1b4>] (io_schedule+0x34/0x44)
    2022-01-10T18:11:29.605244  <6>[   37.574257] [<c104a1b4>] (io_schedule=
) from [<c043f668>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =

 =20
