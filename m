Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702566D4284
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Apr 2023 12:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbjDCKuY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Apr 2023 06:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbjDCKuW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2023 06:50:22 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4727ED8
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Apr 2023 03:50:21 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso32138189pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Apr 2023 03:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680519020;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pBGL1euQQ47r7G3p95mbUgcFjmkpnzoCy4QR+7NreLA=;
        b=SngcpYKckwDqooc90GD//XSCV+PJ63W+konadIJAjJNHfi7/YfkxCErUg6MsDfE6Q7
         zCaOueVxzJq8k7wjXXF9UnW1Ob67+bszxct31juUg2EHPFtWOKdbiHSrlXaEOLaHMlXK
         MNqpL05lRLWTEeag3FG5nbV1JWibJk3qAFmlYsk8aI/Warct84adm07uCTrbCs85fQYp
         XXFuC5I1lEXiJbfxftOTLRiOlpRi8ymom4bZ2ECrvz5eLytSzcNcjqWpXmUfce2vvCW4
         g8BjSLHcEXOgk5ZbdY+sifGTI1vI6rU0XpDAHscz1pKjcGTwEDnHRE7acG7A9BDWmaJ6
         bADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680519020;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBGL1euQQ47r7G3p95mbUgcFjmkpnzoCy4QR+7NreLA=;
        b=Qcp89vTYbp0AiaWDWXEpLcUFT0P0kPguPWRgsfWY4Fd7StsNy34QojTUuzPry9FYez
         GlRLb/N78EEokf3joRT8C4uCqQG5KFK3kN4VMrfDonSddYKLS5dGCBETfPWfJEMKqzyl
         fkOtT5Ak5X2iUI/CX8s6PB309u+MFsTAme26WzMT/YnBjG4F2ncpw5rwA6YWbeejJh9X
         Q2zMsrH+Aggkqs+02UUP8a9fTbSg4uk9oeUM+MvogPjMcI1oHxlF1lGw6v1eY5+5I9Np
         6TWpJHkJmzcfmnaG0UGP883AqGG4BTlQ8gGM8BgMfPm2flcRA3qgwX4mzxMZGbZVXyfE
         KklA==
X-Gm-Message-State: AAQBX9eRgnIc+iMt3Wx+3ROu+MxI3OF6kj2QkXR9CjIKgz8dvB28P/SA
        yZIEP+rKqvCnPGQxhr/7DRcjOeVrf05hpfavtIU=
X-Google-Smtp-Source: AKy350btx6FHAUp4bFw5OrWLPXn78Xuz5PJpIE4GScL4SvOpE4PHPj/r6LjNFvBv0wSSCZIfs+OM1Q==
X-Received: by 2002:a17:90a:e7cb:b0:237:d44c:5861 with SMTP id kb11-20020a17090ae7cb00b00237d44c5861mr43069634pjb.12.1680519020686;
        Mon, 03 Apr 2023 03:50:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v2-20020a17090a0e0200b00240aff612f0sm6056382pje.5.2023.04.03.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 03:50:20 -0700 (PDT)
Message-ID: <642aaf6c.170a0220.e225c.b5f3@mx.google.com>
Date:   Mon, 03 Apr 2023 03:50:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-04-03-v6.3-rc5
Subject: renesas/master sleep: 4 runs,
 1 regressions (renesas-devel-2023-04-03-v6.3-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 4 runs, 1 regressions (renesas-devel-2023-04-03-v6.3-=
rc5)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-03-v6.3-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-03-v6.3-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      afd92422804c35e1936a1650617642c7cde8fda7 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a9fe9523b1288dc62f775

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-03-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230324.0/amd64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/642a9fe9523b1288dc62f776
        failing since 3 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4) =

 =20
