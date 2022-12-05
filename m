Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A99AB642978
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 14:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiLENez (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 08:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiLENey (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 08:34:54 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D192110FC9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 05:34:53 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id h193so10488824pgc.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Dec 2022 05:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b3cnLIhuo4x/b/CH/YNHAkYEOFnk2Yn0KdVXIVDbEf0=;
        b=uSNJXdhumTsNpphE6tKDrSm7g6kkvBi18lIs7xmSVzIUQ27HX1QA/yK+7k2fS5hxvl
         7I7Bby5QMwz/RXTkT9TyKE9q8YljAibEdeIwPsO58ce5NjbK/GoHKgrVnPfIVu5MC3LP
         Gam+a18N08deE7VtHTpqacp7qvoc5rFVRBPtGI8GCXOjPjnpiQXi7/ynMCux/cBT/+/0
         O8nTbmdVc2PoSocp7Dxkffzz3R1ZdSonOLOwNVG6QIwZyq5a7chrGcd9FzrN7eTlnhdK
         RRr96gnZo6St+38fco8/1nCsXjJhtIhFsgBu3tBU9dhdCijVdCaeSkQ6SSnYRbOPkR/e
         2NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3cnLIhuo4x/b/CH/YNHAkYEOFnk2Yn0KdVXIVDbEf0=;
        b=qYNnDloBPLVKjKAsWLDxbD72oygw01Gwt6oYTVGnHoibvn6wQi3XnA/9e5Go2Y9JI0
         RZ0oQ5hf8oe6Gp7j4Dgrwicv0/OsEXB03QMv3qXl//0FOQ73+QcJqLpMdIORKJn1FdOJ
         r7NjhOg1u0liTIlbcqYzyJ9jk739wB6I75b0QKF8l3W57lGt8dndaM0Ah2N+es1M0UUX
         4waGgv0+1CU5xWZnw5bmeNU7Zo//StwDtO81KyaBa7DsnwvQFsAUrS1ri0FAiQlKIwum
         c/yJV6oeXzaGuH52Wz96aRrNiZa7i51bTPNaK65T4ZSJ2QZU4g8FaV/Bp5EaHlY5QCHP
         T14w==
X-Gm-Message-State: ANoB5pkaOsIAVNEAqiHS5l4t8a43W7p6oqQsx1ykUb9iKKe6O/cRWoua
        AQ6wfiZBIXmNSzIDh5s8a6bBaWUZARqORTPIVJ11Qw==
X-Google-Smtp-Source: AA0mqf4TTMSFXENjIY1bTXpDqO3XXjtZbI6RB5RPvZRBB+ztAipyewDjn2702pc7lkWO+IMxXCXQpQ==
X-Received: by 2002:a62:150c:0:b0:576:e1dd:958f with SMTP id 12-20020a62150c000000b00576e1dd958fmr6023314pfv.53.1670247293043;
        Mon, 05 Dec 2022 05:34:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r13-20020aa79ecd000000b005768b4f2d0dsm4741859pfq.64.2022.12.05.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:34:52 -0800 (PST)
Message-ID: <638df37c.a70a0220.8d24e.7488@mx.google.com>
Date:   Mon, 05 Dec 2022 05:34:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: v6.1-rc8-929-g112502470f50
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 26 runs,
 1 regressions (v6.1-rc8-929-g112502470f50)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 26 runs, 1 regressions (v6.1-rc8-929-g112502470f50)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v6.1=
-rc8-929-g112502470f50/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: v6.1-rc8-929-g112502470f50
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      112502470f50792e9df5df75de0090fbeb7b8500

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  498247917f40b0a82cb149e2ec1cb518acd7b632 =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/638de368acb45588d12abd06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-hihope-=
rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-hihope-=
rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20221125.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/638de368acb45588d12abd=
07
        new failure (last pass: renesas-devel-2022-11-21-v6.1-rc6) =

 =20
