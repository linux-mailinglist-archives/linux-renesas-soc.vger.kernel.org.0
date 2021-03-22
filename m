Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0C8344983
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 16:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhCVPnn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 11:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbhCVPn1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 11:43:27 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85213C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 08:43:27 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id ay2so6792867plb.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 08:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mlA+dMYCla+y2NnHpw0f+PhN00mlwxzkqf7hWGqQdYs=;
        b=fFlJUrqssgyop22RfYkHRDVg26Qr+vkS/ok/n1PIHQZYKXfMCnefafuOqaUjRkSFlJ
         HUyICUM9odIfJ5CAHvneQORhaYpiMR1rVoo1MXo9LXc+d8LbQfU/KlcPO0VKseij1JDO
         6jnmUJxIxjghjV/+cVM3a3fnjHwEC2E82M4Ev2/WKt8mlHFbf90dQAWlzu8jwNV5iWEU
         owJlgb5EYwE9Qjf/yIJhXNfdC0hiuRLuev+ftZZwggbkcqdQvm98NA6ZR18zHeQ/NtL1
         t9P2grBPkHMR4kNtbrdRSwVnebn/EQlw+fgY/npsxrpT4W3065nXUr742PAVhTxh7gyM
         wuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mlA+dMYCla+y2NnHpw0f+PhN00mlwxzkqf7hWGqQdYs=;
        b=dh0Gn7Bx7ut1MbZPBAOPb/FoyQYhAK6Cc2xA5VFOiTgKfcZh9RIh6vPo9JDgHnyG8o
         PInrHKUUmTor1x4lrzrzkDrcTd3rrMD+Z2swbiZ5p1h87QHHZ8O/3S67THzDl1SpbsuQ
         m56LXup/WTcJ9u4R2cSdpt+qcRXL8pv0lTy6NT0Z+mGv7KJTrZ1qP6AQt1RxnUmFWQ3r
         QzbwzYmwtHVb2J60IIAfJ7ImACzGn5RpkoqpmjOxTZTe425KH8OduO/ui4CjxjMs/Eg6
         IW0E0YqB8IEO/btlRFChRr0NUfoapWpP34rSMMqkeQbo7Rwojj71qwOUJRd9uT/qELhD
         7/1A==
X-Gm-Message-State: AOAM532goHAaKDCKKpWop0GLaWv9zIcAwEvJFi/g6QU3NKlcQ8wHx1hS
        Q+MXDhT7fE6LrS2zC/t+q0voE8b+8COQTg==
X-Google-Smtp-Source: ABdhPJxxaIIgPv8986V4DDbKSeeqYeNR0BxiiCj8hooGfxYrlfc5vWprRgk6z5VxkLchGNKnHKp6vg==
X-Received: by 2002:a17:902:c382:b029:e4:33bb:8a3f with SMTP id g2-20020a170902c382b02900e433bb8a3fmr275776plg.9.1616427806933;
        Mon, 22 Mar 2021 08:43:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w191sm15405231pfd.25.2021.03.22.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:43:26 -0700 (PDT)
Message-ID: <6058bb1e.1c69fb81.650cb.4a2e@mx.google.com>
Date:   Mon, 22 Mar 2021 08:43:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-03-22-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 21 runs,
 1 regressions (renesas-next-2021-03-22-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 21 runs, 1 regressions (renesas-next-2021-03-22-=
v5.12-rc2)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-22-v5.12-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-22-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7ad9aafe713bdca552efdf6309a196e4f3eec177 =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6058b79f6defbdefffaddcd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6058b79f6defbdeff=
faddcd1
        new failure (last pass: v5.12-rc2-14-g6f56f6c26099) =

 =20
