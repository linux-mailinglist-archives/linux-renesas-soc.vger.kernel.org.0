Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F18C43B384
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Oct 2021 16:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhJZOE1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Oct 2021 10:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhJZOE0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 10:04:26 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B051AC061745
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Oct 2021 07:02:02 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id u6-20020a17090a3fc600b001a00250584aso2328430pjm.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Oct 2021 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Gg6oQEdyzKL8cbZyDJervHTjxjdbTuujDIJbcppmnho=;
        b=VzvWTE58UGIeVCSWgzJOEXnA/7/X5mkxZUNkbK8rWNiZq8WJ7sgK6LUoJdxsiY1x+i
         6TgRj15/YtHysor6ev4vDFfj+4phLHv3x0mtxG2MBK1zSiXcK5dJP0lkCEtDreXzirxP
         mBx/pqr/4NCNV8aq+mva1/IlUIRwU2Ftyi70gVDWH4onxfhGw4RdD6L69wtDk3mPo7rf
         pYGtlQBe3cLZeFCIF4ZgIW7QohmjBMrlTzbh2SqaIn4+aIrSgblq7uNx4rc2xyko+mma
         8lQT6It+xPelIjCmZXmTuym9EMXADTg7JUBaRg+DmFhP4iBo5l6DOv3CNk/Of4YGGXkj
         EfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Gg6oQEdyzKL8cbZyDJervHTjxjdbTuujDIJbcppmnho=;
        b=08NnhZJJDN70oyh3tWS+aa1yRWj1GLkwnBxhDYiYOZ+vNnHkyHM5g5D19njAYv+LVf
         bn9XIEVG61S4a/RImv+wOkc22c+NOgDSJZXTalxJo30Y4yNzjFk/HTv3vZHpkJpsGzy5
         AWG9rd6bg/vhS3L7OccxKFMxrFtM/F/S6V2cbDeJSwjKGCqmtadrN2FyzDoiJYZh6e4j
         lg2cjjWQPY9kpClorRGk5E1W/G8EHPT7pjRGRbcrXOlG90Rv94VsolrZMCrXO053swiE
         1APPtao2gf2Nllga/Lu2mjweSAMh75L9SP/mvnE20F4Tif8ZD3XSGehbg3TTq4Hp2Zpn
         p6eA==
X-Gm-Message-State: AOAM530CZKs7OQXldWNhtkoUA1iqSs/484Sh3OjyKY7LuU4L7kdkT8Js
        KZcKwtlNcugDNSuKbC7wFeuPhSV1mCYtygQC
X-Google-Smtp-Source: ABdhPJy7ATeahxmCIN6ZjpHUlxTb7+33894b4LB+oc86LVnUWKRnkelomh3bt7JWVE0Lkg/pAgoF/Q==
X-Received: by 2002:a17:902:da88:b0:141:636e:46fb with SMTP id j8-20020a170902da8800b00141636e46fbmr495567plx.26.1635256921937;
        Tue, 26 Oct 2021 07:02:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lb5sm1088601pjb.11.2021.10.26.07.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 07:02:01 -0700 (PDT)
Message-ID: <61780a59.1c69fb81.a5dcb.1f87@mx.google.com>
Date:   Tue, 26 Oct 2021 07:02:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-10-26-v5.15-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 43 runs,
 1 regressions (renesas-devel-2021-10-26-v5.15-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 43 runs, 1 regressions (renesas-devel-2021-10-=
26-v5.15-rc7)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-26-v5.15-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-26-v5.15-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1eb1073587ad2566bf2f1746c425ce1804b54276 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6177d2bd13cd326761335912

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-mt818=
3-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-26-v5.15-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-mt818=
3-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1022.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6177d2bd13cd32676=
1335913
        new failure (last pass: renesas-devel-2021-10-18-v5.15-rc6) =

 =20
