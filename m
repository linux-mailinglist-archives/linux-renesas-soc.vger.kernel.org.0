Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71D761166F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 17:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiJ1P41 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 11:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiJ1P40 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 11:56:26 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419701FAE5D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 08:56:25 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 128so5205964pga.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HTHMD3n/e1ZjI0XZTQQZpqBzteqDnz8K37FxHActG3I=;
        b=WPpqZy72DqHA9KiGWPukfYTYdzlKGA881cz2vIde0/8kVekS9IKBzynsNbu/cV/cAT
         lMmjr1yvSmaalIQM0+Qjb2wCgLpv97R4I3r7rh0PMfQIBlzvzhCu0tYqA3KwHzvuqmEf
         xO93zr/kHcbmz1ixkcS7PPhUrJ6geK4EE8laYRrL8nutpXaUIbzdS4p6A8qE9+SFN/nu
         EKCpr1EwrnVjThDewbqxdJcwXUe+DHuV71LAMFM2dVdqR4kQkoTEjrU5Ut5xqkA3i3Fn
         he8Sh9rKGABmXdLPlG9jD2C2CZ885pdUB0rFSN7nQtsE8ue/+3uNDPVeRQT8TsaHOhMz
         LtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTHMD3n/e1ZjI0XZTQQZpqBzteqDnz8K37FxHActG3I=;
        b=mxKkJ6CW9+S1lJz4v7XbA5ARPMtKDW888jYuA+XcoxcDst9oxqa3l+1nsESbHUsI9K
         opMZC202UecU3H7+ZLGyVwmE5D8nOwBfWzbmWEPM6hI32wTTCYHxvck5SzJYkkPiTvYW
         fCFiCVY1sUYcOvX6Rjbc3OxJHkPuDnLpn3BLBEs5qJjKeCAoTg8IIhJ6RJm3LAqKNBwe
         S0PJKavNjiSCAIpIB5+lWYb+iuFZ6E6zQjVUYj+BGbkpPMUhj9H0rH5kxHJ450jhVe7c
         /2jCMLY0xWICYtM4NjEqREJe2BRw4dQHaMcYCINbO4LdQ+5IKI2si09Q/f177xWsaACL
         yR6A==
X-Gm-Message-State: ACrzQf1gCs02A4tUNq0gI/XgOTFFVJCoKAAokiLKhtIdTgw6sz9zqCzd
        eGM7n4iBw/PFl6l9EQTBCPfcOj4Wp31Th/Dv
X-Google-Smtp-Source: AMsMyM5/9EESKf3PxlJamPDhWqDtZHqHdVLCl13f/KKoLC+wylz0SD6KjVeKrgMsvFgv3Wg1PzsXkw==
X-Received: by 2002:a63:4e5a:0:b0:438:9513:da55 with SMTP id o26-20020a634e5a000000b004389513da55mr147107pgl.381.1666972584628;
        Fri, 28 Oct 2022 08:56:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iz15-20020a170902ef8f00b00186a1b243basm3179175plb.226.2022.10.28.08.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:56:24 -0700 (PDT)
Message-ID: <635bfba8.170a0220.f4bbd.653c@mx.google.com>
Date:   Fri, 28 Oct 2022 08:56:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-10-28-v6.1-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 18 runs,
 1 regressions (renesas-devel-2022-10-28-v6.1-rc2)
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

renesas/master ltp-ipc: 18 runs, 1 regressions (renesas-devel-2022-10-28-v6=
.1-rc2)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-28-v6.1-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-28-v6.1-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e3ee6a5b11b04ae5efa890cdfe9c94b77e36f136

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  b79157c8375cfdd2abfc59f63afe8ea09eaa8c5d =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/635bf1dc936a654ea8e7db74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-=
hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-=
hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20221024.1/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/635bf1dc936a654ea8e7db=
75
        failing since 10 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =20
