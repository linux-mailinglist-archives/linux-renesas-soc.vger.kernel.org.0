Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B5B722B29
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 17:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjFEPfx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 11:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbjFEPfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 11:35:52 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4A9D2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 08:35:51 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so4359104a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685979350; x=1688571350;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/c2hScU9+lajTzTKITq65bMpxOhEF20MnQCTR0h3Jvc=;
        b=TKAVYK+eUBVLzyuVzNHF6vhCIbN9pVtiRdSX0dSrfj7kzI/C1MehRLoALsFTSGcCqb
         DmbI2fY7S9IPSP2EI/AsGLXILNWAGxc0eNxvyX2sjJpgihhmcOAeQ3CaUVz5GP0GgK1S
         9cn30i261YqrrqFKXvoEslz1v9xTopM2SX3ufjXATxLnnfLxYamhPEpDUy0Ll59yPGmI
         VXdLJYrEYy+DziN/8aX6fRqP+21rDB6N115/SJ+VcooEGo4mWp6fkbuLw7AwcOWRR8ai
         8TqA1zonoSKNmgPJzlMYShMe3z0cYPwSjJva07ow4n4Ol4Qewo1YDj1TYinAUFA064z1
         dqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979350; x=1688571350;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/c2hScU9+lajTzTKITq65bMpxOhEF20MnQCTR0h3Jvc=;
        b=dZiSTnrTdHIccYHIeNp4jAJlYFyYcNIV+IeFhfyLO9Wzgn2qRYPDKCB9p9DXF3Jb2z
         xqPOiDLTZAGTKFpVvYOIusHTlVoEw0TzS8TAuYu9/lmQKnBaZ9ntv+wtbgcR89LyLWvz
         JtB+wWqA5S621HKjdOOWdHUZmeITFj+mTLnrmeece+06AGzvzjIiDMCb8gBfENqwtF0/
         wNQVv6meJUVhG6OmXc/AI+egFLUoFB9Hi3C2N5PqM408ndT7iuJ3ajW4QLgIqRnJYKxH
         EPh9DYDIiFLP1wmDLisW3CexWB/XRuxQ5xfa5M7wtnXdrBdd7SNIwtweqbIcuZ6rR2a+
         mbVw==
X-Gm-Message-State: AC+VfDyOFhuZ+9s71A3s24Uzi7g5CEHvZXUwoMKl9CLFC5LGh+rlh8tG
        FpZEgkWLI+J9BXMdOkUThddbctD1Ze+2yu3mGAhO9Q==
X-Google-Smtp-Source: ACHHUZ57zjjimJBcn6zDnVANVQNav5mYwwcdonYVPsszVntaQgbP6Ylf3Qtanw+FyqG8gsCUgNdLvg==
X-Received: by 2002:a17:902:e886:b0:1b0:f8:9b2d with SMTP id w6-20020a170902e88600b001b000f89b2dmr10469221plg.29.1685979350380;
        Mon, 05 Jun 2023 08:35:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x21-20020a17090300d500b001ae469ca0c0sm6733248plc.245.2023.06.05.08.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:35:49 -0700 (PDT)
Message-ID: <647e00d5.170a0220.4a29e.b7bf@mx.google.com>
Date:   Mon, 05 Jun 2023 08:35:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-05-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 10 runs,
 2 regressions (renesas-devel-2023-06-05-v6.4-rc5)
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

renesas/master cros-ec: 10 runs, 2 regressions (renesas-devel-2023-06-05-v6=
.4-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-05-v6.4-rc5/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-05-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f669ef29adafb15e4632ab82c733cdf32339a90e

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647deea4378f5939eff5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/647deea4378f5939eff5de=
26
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647dec91dc99675cdcf5de71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/647dec91dc99675cdcf5de=
72
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
