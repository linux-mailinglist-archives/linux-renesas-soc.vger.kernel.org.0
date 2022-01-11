Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795E348B1A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jan 2022 17:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349822AbiAKQJa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jan 2022 11:09:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349821AbiAKQJ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 11:09:28 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A4DC061748
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 08:09:28 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id l15so17901916pls.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 08:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SRdwKiIY8V1aUnysbaW8JbSb4AIcBplBy+oXieLk6Vk=;
        b=m62CQ+XMjpV6Uqg94MBYnrjq641ZNvJNSaR6kqKmznHOCW6YPOcQDYtgSySL7+qCJg
         IXXIXB/+Y6wLrNLY4jqUZd/rWJQx3AWC83xueMaCf8GBrIr5fSTeWa/PnFTQ2WQ2S9r6
         Efk2RBK15czCFrHxKblnn20Q4+JNhrbC26vvjkg11q99KGYkFsl87CwE/OlCMre3gMVJ
         fAw07gYwWgyAX7RPGMR3fGODclq5Ge3YE2dg02JN/6B7iDAHLKayQWDvaHltpIMaaEkd
         nAf7u5UXjKRz0LHuTDAHpq773NLBOVXT4lQWgnYc3oIHmt4jdpNfABOZ/wmuy9BqcKiU
         jL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SRdwKiIY8V1aUnysbaW8JbSb4AIcBplBy+oXieLk6Vk=;
        b=guHKi60M0YmIIYWLqeeVXZ1hxrlyUEeHfmNrDxXaL3v98hGjvhH3FHLUI71l51FId/
         iRbDmM39koAF/ezJ6Yo+4SBalS3JQmESR9pj9MC71a4RQbhKTZeuhYRaEvD5oRNG97Iv
         Ys3q8zngRPua1Se3Vpqcj1O+WunQTVWnjN8lKHbQVHo1frzjYGnExFRZPaStuyLVGTyS
         O4dfVClpvmXjHBOC7zqTd9VX9QpjqNi1hlg9XU1VNf/xKvbJrNzR6SJKAp6C8yWQaST9
         PjHFVbA9/nE9Depmm3LKZw2qNrKzWc9Xik3NOjPk7vw4jQC7OmVtRIUbKtYEQfP6DVct
         oGmA==
X-Gm-Message-State: AOAM532OhZ+qTWeSUgFL9XpBYIgy6Xcb/jt8AFNUTMhK9sYcoyqWURY1
        v3dnZ/GuuzlhoTJAprj36TiU89jC7vAE/FPe
X-Google-Smtp-Source: ABdhPJyvl4GsUgqPmjUQLO7KWu9d/D0GPVthVzG6TnnU55v2f1/5WWe02CLzH9X+FlU3uvLIlQ97vA==
X-Received: by 2002:a17:902:9a8b:b0:149:be04:40ab with SMTP id w11-20020a1709029a8b00b00149be0440abmr5033262plp.159.1641917367805;
        Tue, 11 Jan 2022 08:09:27 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p4sm4596958pfo.21.2022.01.11.08.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:09:27 -0800 (PST)
Message-ID: <61ddabb7.1c69fb81.84227.b779@mx.google.com>
Date:   Tue, 11 Jan 2022 08:09:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-01-11-v5.16
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 65 runs,
 3 regressions (renesas-devel-2022-01-11-v5.16)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 65 runs, 3 regressions (renesas-devel-2022-01-=
11-v5.16)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
       | regressions
-----------------------------+-------+--------------+----------+-----------=
-------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-11-v5.16/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-11-v5.16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6db3d37d04fb23ae868d4ab8b0f4a869c32e0b4b =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
       | regressions
-----------------------------+-------+--------------+----------+-----------=
-------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto | 1          =


  Details:     https://kernelci.org/test/plan/id/61dd8f2fe0dc039e17ef6769

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211224.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61dd8f2fe0dc039e1=
7ef676a
        new failure (last pass: renesas-devel-2022-01-10-v5.16) =

 =



platform                     | arch  | lab          | compiler | defconfig =
       | regressions
-----------------------------+-------+--------------+----------+-----------=
-------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima    | 1          =


  Details:     https://kernelci.org/test/plan/id/61dd781edf27969310ef6780

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211224.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61dd781edf2796931=
0ef6781
        new failure (last pass: renesas-devel-2022-01-10-v5.16) =

 =



platform                     | arch  | lab          | compiler | defconfig =
       | regressions
-----------------------------+-------+--------------+----------+-----------=
-------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto | 1          =


  Details:     https://kernelci.org/test/plan/id/61dd7c05c772c06a18ef6786

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211224.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61dd7c05c772c06a1=
8ef6787
        new failure (last pass: renesas-devel-2022-01-10-v5.16) =

 =20
