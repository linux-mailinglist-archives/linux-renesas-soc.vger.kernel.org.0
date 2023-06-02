Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42CDB720677
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 17:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235996AbjFBPqd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 11:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235166AbjFBPqc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 11:46:32 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7EB518D
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 08:46:30 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2568caabfbfso1166395a91.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Jun 2023 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685720789; x=1688312789;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DwqqsyKDlu8UIXQnSuChX10JTK2IDZ2CyaD+mNS+siU=;
        b=B/OXFlCv19ToyCZqFK3PZPwruxUEkN/mNt9/H1uzh62dmJxBsl3JyfIJmL48ZN5p9J
         5he6DoMiLvPWGSezNTX3xnaX6TDyb8tdn1FtGeglpLiaVrEFMwPq82ORn3EPL047IW2l
         KkPJyaxzG0saZ+CUraFBtAkby4vBoJzZ0xtq/abDAimw8Iu5bnNWun8HbHxN/i+chWwa
         muhB08KqtXWzBRHO1Gd9Z9BTIN5bFNc5sBkDKowU1n/0jm+mOcO8Ty2+6FqEiCQWZ47F
         OIDt0fhDT92c9bscUvs5k1PCbqcIcW7wQ24Ses2UbsMdocslCgIuSSqUtT33xqTzP7Dl
         oOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685720789; x=1688312789;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwqqsyKDlu8UIXQnSuChX10JTK2IDZ2CyaD+mNS+siU=;
        b=NgoqeMeia0htvSGGgxBtrf9uP0M+vitRFGt3M/cMLGyfijfso+GihmKR6ji2fqpm0e
         Jrx6HqzYj5CcLj9/Rt7efpOLBXb/OlYj+moDmMqbpKqgjtdmGnKGHupZpWB9Wq6CMAvA
         rugr+GraQFmJ7DhqADijU287fh+UGT382RaUhqdY2Q4l1fKWidHLSw1ldHEMY6680fE7
         eF4ZU1BhlTHaCF2ozUNAi8od5SQrW7nY0ZFWkkCFsw+lxqNEnmYrJfTx0qrk41cLDxEt
         CHsGEGri1UZ1Wbs4AoCwyVhLgm/Lhs4sgNiSoQc9MPnHAKWmomFfpVpfVUYbJupKtZl1
         L+MQ==
X-Gm-Message-State: AC+VfDwW/yg3jcOTOtbwxHTPi09ytKrWSZaIFlNSQRrJdZoBHQ+Q1bEg
        7S33aroMy/x10/g2wcSZt8XqGvuy/dp8eLCPtB4o/Q==
X-Google-Smtp-Source: ACHHUZ4FHPc8vrHdYpPgr22EeS22rrPpcLuX2wE3w81rnFsMPCUF+DRGxOo5DYssKa3IG04hGwPd9Q==
X-Received: by 2002:a17:90a:c08e:b0:247:8029:fb30 with SMTP id o14-20020a17090ac08e00b002478029fb30mr209634pjs.42.1685720789632;
        Fri, 02 Jun 2023 08:46:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 21-20020a630c55000000b0051b71e8f633sm1370110pgm.92.2023.06.02.08.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 08:46:29 -0700 (PDT)
Message-ID: <647a0ed5.630a0220.8dc8c.247c@mx.google.com>
Date:   Fri, 02 Jun 2023 08:46:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-02-v6.4-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 5 runs,
 1 regressions (renesas-devel-2023-06-02-v6.4-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master cros-ec: 5 runs, 1 regressions (renesas-devel-2023-06-02-v6.=
4-rc4)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-02-v6.4-rc4/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-02-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c6f027b1ddedc24bffa0d60dc92d2e774cf3e19e

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647a06ccb7acd10a04f5de80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/amd64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/647a06ccb7acd10a04f5de=
81
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4) =

 =20
