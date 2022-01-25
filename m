Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F8149AB10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 05:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S249636AbiAYELm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 23:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1312898AbiAYCq5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 21:46:57 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F23EC055A8C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 18:14:10 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id r59so461088pjg.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 18:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Jt+oxRje2pzjrG/w3055/mGQ8nksxm1nuMYDkQbRUxk=;
        b=iifPM7KSi422E7H9j1ISEGKhQk2wRk8W3/rok+sPjBlk1zGy5dGSAbGVq3sK/Ek3Hj
         hngfncf99c05/Z7gNXOusdrVSh0JjS2+XB1tpPqoXXg/nVV7dnfNcx9ILFOb+2O4Qpyw
         inN9KH865ca1241BSl5j0zrlhK1ghOOHtOZDecsKFdHRlVBU2+0eV29Cs52gZHAOhWnc
         IlUCW7wxJpsUMp3vyfTYYEyofOU/0AlZCFNNVQEMfHS+boxaY5aBHi3kZDy6vI8nIJ3p
         +HDcWtb1GuhQosVWWSKBDNimVN69kiFwfW16UPmuP2m0Yibqk50BFL09K1m+SA2v9mEn
         hN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Jt+oxRje2pzjrG/w3055/mGQ8nksxm1nuMYDkQbRUxk=;
        b=ePCzNBujt+PBLtIWnK5nSXbQbOjFvA/6gk+mtm0x7+wlU2p9at+aG/VKHXV6rw1AXI
         x4S14WR0UrPDg721q7smoLu7koKM+8bDA+vSU6IvtesDwy6fOeQ11Aqmb1ANm4z0j5U3
         a+1ZCRKWlSpxooQvBy/wNK3w6J11XzvHUpJZhRkz4d74fWD2meoVt96wbqGF+N2ra9pI
         0Cgiw+IFiC5xhAge6GRCH12yUzwqO+KwjRlciThUzCy330CHeHnRt0QrWvEgxe5JPq2a
         fgZHp6pM3xrO2oQZAk0N+cDPW+n3ciG1UfdhIC76Go6Fd4jMMuNzL2UeHcqUZXOXPZ3Q
         Nvwg==
X-Gm-Message-State: AOAM532ZYsDJloSxNst6iCaVHSacyhTn+igexQOln0Z3BEN0Ea6fK+x8
        Pj2mtNhcCNfOLufdX0a2m61WGsatN1GwTA/K
X-Google-Smtp-Source: ABdhPJxScdQlTUEXxWUQTwJUeizJovzYkX2n17ThwHlRziR7orqTzn5BONaOzTmOIMVPKr/5FX0EsA==
X-Received: by 2002:a17:902:9b95:b0:14b:1339:58d2 with SMTP id y21-20020a1709029b9500b0014b133958d2mr16783697plp.138.1643076849817;
        Mon, 24 Jan 2022 18:14:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l17sm4422615pfu.61.2022.01.24.18.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 18:14:09 -0800 (PST)
Message-ID: <61ef5cf1.1c69fb81.c8d3d.bf50@mx.google.com>
Date:   Mon, 24 Jan 2022 18:14:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-18-g925b6371c834
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 47 runs,
 1 regressions (v5.17-rc1-18-g925b6371c834)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 47 runs, 1 regressions (v5.17-rc1-18-g925b6371c8=
34)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.17-=
rc1-18-g925b6371c834/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: v5.17-rc1-18-g925b6371c834
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      925b6371c8340f967fc54b8102fdf6b94e87013b =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef2372d6a8d266a6abbd39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/bas=
eline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/bas=
eline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61ef2372d6a8d266a=
6abbd3a
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1) =

 =20
