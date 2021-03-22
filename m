Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353B3344927
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 16:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhCVPXV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 11:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhCVPXS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 11:23:18 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6E4C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 08:23:18 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id x126so11159664pfc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 08:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xEp3A9xuPu5Qt8AWD3lXvnawebMsfxBJaoDcFmFx4VQ=;
        b=L/j4SM53v25TVL6Gq5gpSnytPYKpEtx2P2Zj3nE7FKghf+yeOpaRnQTVWTpMDkjSwm
         TKe1LiDc7JbFt7TAVNxOB8+hkI1ZzeSlfs93+KPa8b0faz2t56NrN9hVjdFRd2mI+Zg4
         Er6FjuYURsaMJBrfFzrnfM+iT8iVW8s8eeCeDn5g2S5HxjBItJ6hNxl9ZfI+yuR7oIoI
         hYBc5vEBB7zhwi10/L4FC3Vqhyj1k4AZiDmPuHmZGQCacOs+gb4vKn3M26VmHY7G4SrS
         X0s2WYRZTUu1Ecu9AtXTqICRpl5MKdy9azDeRG0J+ZfE0fKqZlzuaiuBkUd0vqy29NSY
         yXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xEp3A9xuPu5Qt8AWD3lXvnawebMsfxBJaoDcFmFx4VQ=;
        b=kVXrSXRZ5KTAD80RNUVWYkubu6gboExq43XrqmLhUPEsvzjrMizrLVtuZpfnshmjG8
         9ggk8KMM4li60t7LGv1lB/3sXbSsQdbPrk5hEM6isJrCsjNtB2T51/qj3xye+wojO1xX
         Xayf4V1tsZhhPL1UaHiL6LV8OwXwQ2BWtIh2ZyqxAUM4zdexv340nK/+KF2rhMk9QoNP
         TpSHi7GLtsHY3K+CZta9Q0s0lwAkF70kRclP3WdTxxzwQIHiPoAy+ZuXMszbpkStC6al
         EG3KlrI5QiZNXEefFGHOgDtQdMcR3gTepaZedm9XcsWOdgOHrGptxa3QeZFgUW4YtXbn
         KNAw==
X-Gm-Message-State: AOAM532U/ZapURLC4PuBMnJIpa5LESWllRBR3fDC3joec/HGO+0KfOU3
        1Mw9j4e3h0y2lrCfTFx8DueNvWae9CV5aw==
X-Google-Smtp-Source: ABdhPJzzycI0kKmC10syXWytv7u97hd0G7AgT0YzoR+y6VBgcqjsp5o0JpkM7M+XYZJtbocGTYkZYA==
X-Received: by 2002:a62:170e:0:b029:1fa:7161:fd71 with SMTP id 14-20020a62170e0000b02901fa7161fd71mr39877pfx.35.1616426596389;
        Mon, 22 Mar 2021 08:23:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l190sm14033959pfl.73.2021.03.22.08.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:23:16 -0700 (PDT)
Message-ID: <6058b664.1c69fb81.db89f.174c@mx.google.com>
Date:   Mon, 22 Mar 2021 08:23:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-22-v5.12-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 22 runs,
 3 regressions (renesas-devel-2021-03-22-v5.12-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 22 runs, 3 regressions (renesas-devel-2021-03-=
22-v5.12-rc4)

Regressions Summary
-------------------

platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
r8a77950-salvator-x       | arm64 | lab-baylibre | gcc-8    | defconfig    =
      | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | sunxi_defconf=
ig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-22-v5.12-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-22-v5.12-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      98d704ec88d32a3ece2e35f14ee85c45fe9d5d9d =



Test Regressions
---------------- =



platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
r8a77950-salvator-x       | arm64 | lab-baylibre | gcc-8    | defconfig    =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/6058829242ccdfde3cadddac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6058829242ccdfde3=
cadddad
        new failure (last pass: renesas-devel-2021-02-15-v5.11) =

 =



platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6058b352cc27bfc796addcba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6058b352cc27bfc79=
6addcbb
        new failure (last pass: renesas-devel-2021-02-15-v5.11) =

 =



platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | sunxi_defconf=
ig    | 1          =


  Details:     https://kernelci.org/test/plan/id/6058ab814631b35ae7addcfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-22-v5.12-rc4/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6058ab814631b35ae=
7addcfe
        new failure (last pass: renesas-devel-2021-02-15-v5.11) =

 =20
