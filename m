Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD78518723
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 16:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiECOuT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 10:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237358AbiECOuT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 10:50:19 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E521393C5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 07:46:46 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t13so14186547pgn.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 07:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CkICzkYrr3dA1Nr9QkkPl0Zr+eG/l0FyzebtY7Xk9ec=;
        b=TSO9VI2V3BxqMveHCJs6OdCybguITzV1nUqYzZZZC4qvGMiFFS4UKe/aCp0kMqu3nq
         neDNoeHMi196hSqo3Hw0cr43rDOYWq5gfvU+yBMdMRW4pROWhX1gZB15zK906EEg2zAa
         gJNt9zpnd3Vv2eUhWcuQha7cJ1riPSUYjJz6eueTqULNECJ/FF9D18Xn4/wM93weBTLi
         0uhsZjSYQqcW214sDZvgLZcqHXDrH61jcFfX58HC2FKsRse4VptMQW98TTSISMaNfprQ
         k8Gz0TnZtWbscIEHYq1nBgaVXlnL4CpvzG6r/H8+fqzgM1BaklBpflgWKgN10nXpcdh/
         b8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CkICzkYrr3dA1Nr9QkkPl0Zr+eG/l0FyzebtY7Xk9ec=;
        b=achh5KEvAKI2TGTwGnhK8uBc93FVWp5E2B9QIUmrQ/rgaEhaDJuqjAlG2realDhHpL
         IjixAQ7vc0RQa5R2OoGYZ2V2nGGIzB66+sFJvAARishRJwrbcoECWQ1RQnCjP444iyLw
         9xdTltG5H7nUSKFkncXI9dc22DuyNXfsrD1YAgH2i/c0827TqniTnKCtP5OeVZ/F40FB
         wmiBSeP+Jt08nHPMrDhZ02OUwY8FH/DH9DHAV7tOQNMvGFb1byyD3Jbr4DdabN3Kf3L0
         UfM5ZQ6iEuCThgpfgdK10N1OmPLjJ2oywqevk/CCRPzSza3yeTzEsEvjT+M7BN0Np+Ga
         YFgg==
X-Gm-Message-State: AOAM530lNWL7CMVgRn7jgeQ60bwxrmXLMDKO7CgbdkyZRTNHKeDzaAj6
        Zy66LKLJO0DwQ6fIroqxemnOM2JjGgZTYg+rcbE=
X-Google-Smtp-Source: ABdhPJyGrkAOnky789l/KCejM8Xr59ftN5nf83zRAHBhB2xHSZ6BqIkWOQ4+wWrZRBnu8DOTp1dvbg==
X-Received: by 2002:a63:91c9:0:b0:3ab:11e6:4ff9 with SMTP id l192-20020a6391c9000000b003ab11e64ff9mr12844375pge.121.1651589202770;
        Tue, 03 May 2022 07:46:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e18-20020aa78c52000000b0050dc7628156sm6364998pfd.48.2022.05.03.07.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 07:46:42 -0700 (PDT)
Message-ID: <62714052.1c69fb81.c0d44.f970@mx.google.com>
Date:   Tue, 03 May 2022 07:46:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-05-03-v5.18-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 54 runs,
 1 regressions (renesas-devel-2022-05-03-v5.18-rc5)
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

renesas/master baseline-nfs: 54 runs, 1 regressions (renesas-devel-2022-05-=
03-v5.18-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-03-v5.18-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-03-v5.18-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1446b22ccdefd16ccef5ba375037418bae2fee53 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig |=
 regressions
-----------------------------+-------+-------------+----------+-----------+=
------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/62711556bd95a0673cdc7b69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-03-v5.18-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-03-v5.18-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62711556bd95a0673=
cdc7b6a
        new failure (last pass: renesas-devel-2022-05-02-v5.18-rc5) =

 =20
