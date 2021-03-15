Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6407833B139
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 12:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhCOLeH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 07:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhCOLdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 07:33:36 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F5EC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 04:33:36 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d21so337964pfn.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Mar 2021 04:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HnZHPlZBA01xASns36cB2qdTJZ7ddWTf8n3eXYyM1Jk=;
        b=MdByvVP+ykwccgMYQOF6SpWPgOraBEO+evyIjYUVoGP+nvJSyxCnJwuZxeQujClc4m
         8BaNS09vPISXjMbaquVf/wog+cllG7z95a751Ribnkr3i2x/WmgEM+GYx/AaRlj5wxD1
         GenuuxCpFXl99s9FwRWKnlNAvVzx4Ec8urKVO8kmIAo9RGn63GnZ0rURGM8s2jO/QKf0
         SpR664ktN8u7RUEcnkIrikemG9+51xn6i8WytphzDtYesdZc3azvW3ACeCNroMPli/0b
         Ru1+Vy2a44hOipnMUnXQYMMVoIXKZ1D4wHt28qvQl9JaZ8NtWV56wJUqSFnXn+8IjM10
         eXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HnZHPlZBA01xASns36cB2qdTJZ7ddWTf8n3eXYyM1Jk=;
        b=PykL3HOGrKtlMPLjwOzLLda4UdDZ7gEKXlT0NgrMt5PZYDSzANB3khRZiiu/Jyh0RS
         +iyDp4pZxRIbQJz8UO4ZUwZupiqAVNdmSNgpXWuyjNl41sd5uXSS2bbPiY5QByIRnUeK
         wGitOIqZmbG8n7p5z37F0b5Nfvz+uHy7RrQKnsovbbJWqWrGyjPgnitK8LURYbws5fB6
         121UsQq5ypwxNYwNd0Z3IdPsULkGAkAugRT0SharXpI/VSVC3+RN2ewoBepelYZB/F13
         7lTlcQzDFxdo56MnAvJK1jYrQAw1BPFnjuZVL/an1LfS2F0acj/FtMp77iQSmrbwcI8r
         tX+w==
X-Gm-Message-State: AOAM5337b4zImP2N9CmnFooZOXjG+NWySOKNBNPX5fH1sjXWTRz7YVYk
        0/vJ2XEvfqH5tDd1l15WaSkgICj8EC+5tw==
X-Google-Smtp-Source: ABdhPJwTEdqm4OUp+3uuftgEj4S7k0X6/TBPR5d0sJqIIkr8dM/yumw5CVYRxxZkHvv396pxmHEchQ==
X-Received: by 2002:aa7:858e:0:b029:1f1:5df2:1f70 with SMTP id w14-20020aa7858e0000b02901f15df21f70mr9899946pfn.46.1615808015915;
        Mon, 15 Mar 2021 04:33:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u7sm12912492pfh.150.2021.03.15.04.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:33:35 -0700 (PDT)
Message-ID: <604f460f.1c69fb81.a22a.03eb@mx.google.com>
Date:   Mon, 15 Mar 2021 04:33:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-03-15-v5.12-rc3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master ltp-ipc: 10 runs,
 1 regressions (renesas-devel-2021-03-15-v5.12-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 10 runs, 1 regressions (renesas-devel-2021-03-15-v5=
.12-rc3)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-15-v5.12-rc3/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-15-v5.12-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7bd4543a30a76f48903e745f7b9decce1f019ece

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  c4f669f13106862b6d8be38adf7825ae00ca7ac5 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/604f3364b3450b9f8daddce7

  Results:     8 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-15-v5.12-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210208.0/arm64/initrd.cpio.gz =



  * ltp-ipc.pipeio_5: https://kernelci.org/test/case/id/604f3364b3450b9f8da=
ddcec
        new failure (last pass: renesas-devel-2021-03-12-v5.12-rc2) =

 =20
