Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42CC4A707A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 13:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344062AbiBBMJs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 07:09:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbiBBMJs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 07:09:48 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D14C061714
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 04:09:48 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id h12so20044880pjq.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 04:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=auNdbmxw9evuxD1ptaSZtWOcJJe5VtabXSWTQEdqz14=;
        b=UKvufdAtYAQBiKzgcnjh9vee02oQHXeEDz5f23UaurdKmgRIw+MS847YlFjDartPhB
         xkmGZkxvudxODA83dLC+Pw4kf5vTN22bdzv6cxHLhFLxds62H9kthBJbLtkDcxVYcsGw
         yVIAuj37RIq2L9Fzc7avv9h0PCSE1C5uHwg+q+INuldkGGl9NNueN7FHTGI/oT+PkGnY
         oQ3uQ54IImlL4L1WRS/iGS4OwbKT0HXOIALjylnOGpVf1nWXUmPXC/PYgPkrdnviQWGj
         IZFqyFK7199TTpJzoT/3c1GxfBQxn4oEJ4rXQtGYVnA56fzTyZfKvnHhkldWOs9ViqeU
         eHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=auNdbmxw9evuxD1ptaSZtWOcJJe5VtabXSWTQEdqz14=;
        b=Qm9f6Af0JuqgZWPmI7vxkY6hGG2eqJ8oQiaFYEtDC48tZfcBYDlMxRLcOb/0ETpyBe
         HdqqX8PvF34pIcfh7a1E0/hnmKUuvVirnse/WwkcwHbdhsHpvMRNqN6DwfRZ44QP/W6p
         wXDjDU+mTzWSOS/S1GAo4qosxJLOy3hZbHg+retXq/YJ40U30zPyERJOiRmHkJQIB2Vi
         0Ginst+yPGrX30IWrXFaZD2m3zrTgJirkPBDlw5tL4V5v+DZabVVn3/keNF1De7YLcPS
         OTbM57+I+JAI3qE0KO6LDFBEDiqf4Ohf7MZPHAz3fxLgY4SY45gVV36XR5+M4iAIqOgh
         ZOmA==
X-Gm-Message-State: AOAM531g849W0S2Ug1ev2x3GLTcm3mGQQ8fTdg//L/MEgqU3T7rEb5TV
        E3sKPPoctSIUXpDgfvU+lJ8hFu5jq+654mIC
X-Google-Smtp-Source: ABdhPJyDXhRr8e8wDwmRpX2D7H99u5eoO0U8+1vpANshJXpfCfqvaYUkkYn8oCfMdidY68tzCaj2Qg==
X-Received: by 2002:a17:90a:5982:: with SMTP id l2mr7745181pji.100.1643803787436;
        Wed, 02 Feb 2022 04:09:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e12sm21758432pfl.8.2022.02.02.04.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 04:09:47 -0800 (PST)
Message-ID: <61fa748b.1c69fb81.a9b01.7ced@mx.google.com>
Date:   Wed, 02 Feb 2022 04:09:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-02-02-v5.17-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master sleep: 5 runs,
 1 regressions (renesas-devel-2022-02-02-v5.17-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 5 runs, 1 regressions (renesas-devel-2022-02-02-v5.17=
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
sas-devel-2022-02-02-v5.17-rc2/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-02-v5.17-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3e49e95eb7db25785124b3ea8ed31fecee9381fc =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa5dcf061ca42e725d6f03

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-02-v5.17-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-02-v5.17-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-10: https://kernelci.org/test/case/id/61fa5dcf061ca42=
e725d6f0f
        new failure (last pass: renesas-devel-2022-01-31-v5.17-rc2)

    2022-02-02T10:31:10.431691  rtcwake: assuming RTC uses UTC ...
    2022-02-02T10:31:10.435232  rtcwake: wakeup from \"mem\" using rtc0 at =
Wed Feb  2 10:31:15 2022
    2022-02-02T10:31:10.445765  <6>[   29.109737] PM: suspend entry (deep)
    2022-02-02T10:31:10.450540  <6>[   29.113612] Filesystems sync: 0.000 s=
econds
    2022-02-02T10:31:10.459696  <6>[   29.118197] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-02-02T10:31:10.462876  <6>[   29.126819] OOM killer disabled.
    2022-02-02T10:31:11.940385  <6>[   29.130305] Freezing remaining freeza=
ble tasks ... (elapsed 1.469 seconds) done.
    2022-02-02T10:31:11.947566  <6>[   30.607989] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2022-02-02T10:31:12.048946  =

    2022-02-02T10:31:12.049510   =

    ... (1146 line(s) more)  =

 =20
