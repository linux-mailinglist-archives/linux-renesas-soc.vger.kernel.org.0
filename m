Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4CD4A56FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 06:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbiBAFgc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 00:36:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiBAFgb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 00:36:31 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC4C6C061714
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 21:36:31 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id s16so14243520pgs.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 21:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Z+nJkO/mWs+7GxSI7pyzBKojFK5bvGszWyeGS7KHm/s=;
        b=xU3DIG2/PvXUIix8Y8rsFcijz5atc5tt7ByQXS+9WOjCXd737JquSAOSP2zC4vkOiS
         04R0VyrTocBUG/wmLB8PrwY4zRZnTJU/cYinBkFMnU8uIzi/2ttqj1s+3ZzSJxw5baDx
         W5ZKxWWWngBmtQq9LvFtP0J/EWW9PiHNMcRS1m1wcbgvwqlRcfacXvITD3nIcNRtj5RI
         j/18ufqilSKfRxgiMlswjyBnvGR6Gs9vg6uM5oydkYP+xNYKJR/3Zv+v9yWra3VtkkYA
         ak9wG34bgiJzjs8uAeL72F+NWpIpTgiB1tYyCesvtOxtqkqeZMykKYnI5uyDy54+EDxT
         E9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Z+nJkO/mWs+7GxSI7pyzBKojFK5bvGszWyeGS7KHm/s=;
        b=FKBl/MuGvNOpOSg3q+pd4wviNrn2gFFyJD9gkv5Yy5Xi3e5wLs5mlmomaDOL8gRob/
         G4iUw34HVrNc7GG599EPnN9Tm2LlXKGRN1oRc0ohKDJ5XpNg8DmV1TLNIKkZLuq4Yyi3
         XQD26ZxBO1XT+nLpZxoIIvGvjm5BOhFcz8ugjk4y6ugVum5wkdzLQwd97OHCygBOe9Iu
         Eld/TAlqiU58CIFdVfAlTjePNVShpxWPdIODOXaIHsTXqo3LEuzR9gZR5oLB2qiLSN9E
         thJSLILWLLWAeJqE53JcFx9imAi8wnScJtnJ4sJtvvOPEWUb9WbZxjlDi6h26dLF4Z1B
         VJ7g==
X-Gm-Message-State: AOAM531kMVyoO1Uu5F0Ed9I6ExhjP2ruSXvYbIjcXyythI5CWtquOErf
        h88MdFtEPslrA9ZpewF8R13TyOHAicjNLep+
X-Google-Smtp-Source: ABdhPJzU2ZLWP0VFcYC2e5ZuNXUqtqQJ9dmsPDEeePvzb7AsqA660rylBJCy/vHWqEv1bGM9iUmQsw==
X-Received: by 2002:a05:6a00:1682:: with SMTP id k2mr23070312pfc.11.1643693791051;
        Mon, 31 Jan 2022 21:36:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k16sm21788544pgh.45.2022.01.31.21.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:36:30 -0800 (PST)
Message-ID: <61f8c6de.1c69fb81.2d85e.9f75@mx.google.com>
Date:   Mon, 31 Jan 2022 21:36:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-01-31-v5.17-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master sleep: 5 runs,
 1 regressions (renesas-devel-2022-01-31-v5.17-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 5 runs, 1 regressions (renesas-devel-2022-01-31-v5.17=
-rc2)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-31-v5.17-rc2/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-31-v5.17-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3aa8ba88974022cbe2386cf2cd1b93d7244301b5 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61f8af17e52304b3f25d6f03

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-31-v5.17-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/61f8af17e5230=
4b3f25d6f0d
        new failure (last pass: renesas-devel-2022-01-25-v5.17-rc1-11-gba94=
d205dc711)

    2022-02-01T03:53:56.741198  <6>[   34.804903] PM: suspend entry (deep)
    2022-02-01T03:53:56.744214  rtcwake: assuming RTC uses UTC ...
    2022-02-01T03:53:56.750557  rtcwake: wakeup from \"freeze\" using rtc0 =
at Tue Feb  1 03:54:02 2022
    2022-02-01T03:53:56.756672  <6>[   34.809039] Filesystems sync: 0.000 s=
econds
    2022-02-01T03:53:56.760399  <6>[   34.822876] PM: suspend entry (s2idle)
    2022-02-01T03:53:56.763571  <6>[   34.823010] Freezing user space proce=
sses ... =

    2022-02-01T03:53:56.766440  <6>[   34.826898] PM: suspend exit
    2022-02-01T03:53:56.773951  <6>[   34.835918] r8152 2-4:1.0 eth0: carri=
er on
    2022-02-01T03:53:56.777500  <4>[   34.841334] (elapsed 0.014 seconds) d=
one.
    2022-02-01T03:53:56.783835  <6>[   34.845626] OOM killer disabled. =

    ... (1151 line(s) more)  =

 =20
