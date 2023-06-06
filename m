Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5B1723FAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 12:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbjFFKfa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 06:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236966AbjFFKey (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 06:34:54 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D48DE67
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 03:34:45 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-33d5df1a862so16771165ab.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686047684; x=1688639684;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QGmc5iDx2LJJ+SFeJT4FKw9ESdqpY5WV8u9KXhU7j5c=;
        b=S6YvDkyWdqZ11nqmjaBwYff/Rj2HyQO6MhT9a4rglTUINWLxXEiv1rUoATtttoOLtR
         IhkRzR04zHxQHPYo87uO2ovEQfHxYWdd600g11O8ySeiSrKX7mTAez+hDjQE6yAmukzX
         8joIMgKr98AFqnKoxom3ncs0IodOn3ZTeVe6n1QVIkPpWMKv1RXGi8OSsxsQD+B6QJKP
         H3KKV4B0W5sQTBemlykGZHxHx9uUC+uL7/yh7Aj6mmi9n3hZ20Votg/Ql2jlloltwDM2
         eU35K6ciiM0ZKNz7gV69zre00NXCTgKGxt+EAmUhAWYEgkCwXAtAPQ1Ou3TMW6plVSze
         ZFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047684; x=1688639684;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGmc5iDx2LJJ+SFeJT4FKw9ESdqpY5WV8u9KXhU7j5c=;
        b=aAWkeRlIEfXyluGh8hKwnD/eblgqVI6+fHWeGOFp7dBAA5ySsq3dAd2OBkk+ojpYOS
         dX9HLBZJ3TI5WvPFtjnzKJ7oFDVih3HZASCrFk95fs9remYXFEzl6mXdBlQeVmaEp/XV
         NnqGWuh8lIXV9PsV3cKZKfA6jEp8UQb2tomFo2TYXCQQDR+RQX09a7doDVKQMQap87PI
         Dkglr40s52kk9OEUoEs8WPi0k3avno6NApNLiIKYSyQJ+LNJitcMzD6DAqA6qn1h7ntN
         bqOlBDeTxAhuPWVLuOBQMFupG1AV8MaMlTqxtLyD3Z8sQlkVJ24Lwfgn4sL9AQG4CW+W
         LBDg==
X-Gm-Message-State: AC+VfDyFDcd10QS5iEtQTHT3RCZfpRId0oUUkLDhJX0ea+306cCtFKgp
        6QaOc/yChRevr3XonAp4FekqDBhqOGFbj8xCtOKJBQ==
X-Google-Smtp-Source: ACHHUZ72/fOr9u//WP1d3IZkVn/wLTI3D3PYL3h2vd+dXbjfAopCHK3/vjicwk3PDT2r7XFmxmk0xA==
X-Received: by 2002:a92:cd05:0:b0:33d:72c0:1b0 with SMTP id z5-20020a92cd05000000b0033d72c001b0mr2275673iln.17.1686047683798;
        Tue, 06 Jun 2023 03:34:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t8-20020a6564c8000000b00542d7720a6fsm4872273pgv.88.2023.06.06.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:34:43 -0700 (PDT)
Message-ID: <647f0bc3.650a0220.c19db.7a4e@mx.google.com>
Date:   Tue, 06 Jun 2023 03:34:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-06-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next ltp-ipc: 18 runs,
 1 regressions (renesas-next-2023-06-06-v6.4-rc1)
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

renesas/next ltp-ipc: 18 runs, 1 regressions (renesas-next-2023-06-06-v6.4-=
rc1)

Regressions Summary
-------------------

platform         | arch | lab         | compiler | defconfig           | re=
gressions
-----------------+------+-------------+----------+---------------------+---=
---------
beaglebone-black | arm  | lab-broonie | gcc-10   | omap2plus_defconfig | 1 =
         =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-06-v6.4-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-06-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7762defcdaf029da668d5af3304d3d940d43199e

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  604701dc19c5499403ae5afe48103b8e2872952b =



Test Regressions
---------------- =



platform         | arch | lab         | compiler | defconfig           | re=
gressions
-----------------+------+-------------+----------+---------------------+---=
---------
beaglebone-black | arm  | lab-broonie | gcc-10   | omap2plus_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/647f05994d883d3421f5de4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/ltp-ipc-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/ltp-ipc-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/647f05994d883d3421f5de=
50
        new failure (last pass: renesas-next-2023-06-02-v6.4-rc1) =

 =20
