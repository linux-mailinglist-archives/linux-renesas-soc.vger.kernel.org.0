Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3916234820D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 20:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237809AbhCXTjR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 15:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237892AbhCXTjF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 15:39:05 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659C7C061763
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 12:39:05 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id v10so1183855pgs.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BdjGbvZv3il/ZmeecpdBNd33VM+T00XlI8OngCkb3BI=;
        b=jBjsEoEbLUqn/TyrmPoaJ8iT+nY/s7sTGjMRRA0OinXeRKVHAImak4M917cwMN3hn+
         VaxlejFUqPuQGHUlpe1gdf6+l67rer9d3UGwwP+UBYpeCSZcwYmXwnFUXTF0J9OBGVMt
         +blA0uBY1B5FsemcnYXFJWoe2CuokBYIwCTfCW+GHLQkyW6x+OQZ+VUB30wtEeK2NvTQ
         lJe/G2U6pFXAoIjeTtAR3cRtCTwL4jqz1GWqeE5Kv4lar7l61fMc1gnATFhPC1RKeqnO
         s/ocguB7pVNtzyEiFLIuEUNI8T5R79aJ8RnktJ9isXgaT8Ri0tGj5WyEn2GDmIcIKDKo
         +ugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BdjGbvZv3il/ZmeecpdBNd33VM+T00XlI8OngCkb3BI=;
        b=CxoyE+eVZLEOTRnjQgYEUB8uEf3TQKPt4Cqu7d2uxXAqBRQezT88Bfxq21KSk147m+
         Ek+h/fOylR0ugfh24ABTH9+ynqxBMLHIgpndWHxq6n2K9rj3XcEFOwJWz8A06Xks9FEk
         G1QK9H1QmUO1fywqYiKPjsyRr1iOVV2PvbO2BrpzqF+ppAr5e1C3DyH0D43SZeUy324k
         vUy9wfyZA5hRCeVmTLYF7dTcc+MXtVjkTsZDzMnZ0RMHDtqqu9pO+8npS8JKs+5CGjBh
         WotU+OotQQsotQJcuvJl8nsoZO2YTONL47wGR0BX0Yj57P1KZqlSth55p9mRoZ2GLlWv
         vGWQ==
X-Gm-Message-State: AOAM531cQuhibeD4QpfFKK2Pee/3ol6IeFEv4LtKCNM0N3XZpk4Lr/T/
        kFFiBmMRgbk/wMiUjLzbb/IGFUmroDEX1A==
X-Google-Smtp-Source: ABdhPJwoeWxkRr+qrA2Zop+4nzHWkmNXK/XwCdThupoGiK9ZVcYjhmVMR5o1GzMGLf0Z2SO395Rf8g==
X-Received: by 2002:a17:902:ec84:b029:e5:bd05:4a98 with SMTP id x4-20020a170902ec84b02900e5bd054a98mr5058762plg.76.1616614744845;
        Wed, 24 Mar 2021 12:39:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z8sm3201864pjr.57.2021.03.24.12.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 12:39:04 -0700 (PDT)
Message-ID: <605b9558.1c69fb81.26877.7e2f@mx.google.com>
Date:   Wed, 24 Mar 2021 12:39:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-03-24-v5.12-rc4
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 13 runs,
 1 regressions (renesas-devel-2021-03-24-v5.12-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 13 runs, 1 regressions (renesas-devel-2021-03-=
24-v5.12-rc4)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-24-v5.12-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-24-v5.12-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c8e95c41b8503aa53a50110d62643ce210b00001 =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/605b7a51d4108a3e43af02c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-24-v5.12-rc4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-24-v5.12-rc4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/605b7a51d4108a3e4=
3af02c3
        failing since 2 days (last pass: renesas-devel-2021-02-15-v5.11, fi=
rst fail: renesas-devel-2021-03-22-v5.12-rc4) =

 =20
