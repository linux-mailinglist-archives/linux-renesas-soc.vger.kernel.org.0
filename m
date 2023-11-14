Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C597EAFED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 13:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjKNMg5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 07:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbjKNMg4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 07:36:56 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B10130
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 04:36:52 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc4f777ab9so41957215ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 04:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699965412; x=1700570212; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YGYP9fVfGkZiJrBqQeiq370qrrL0KXPBb8k9ZVDQb9c=;
        b=LwvT6T3neGAGhUiOSOkTnwMbCg7QM15mXpvdUkDCwucz3Je92aU8OBCJWUFhxkC6vR
         uuQX2BH7BPg7mwoLyktiWXfAucUAdASfmCL+yecdW74g307MjBzFe6ilPWQwlDWJxLdH
         IfxiskFCxmAC1z3O2PAAH0yrncVQ3LxHPFuc2SRN0pT93rOMkTCBqRLA4VGiavYt/shI
         BtkSJ4RV0XhVCZYaBBElZ9brjkH34MeFOnONOsOlsTXPpjALxc9ZyC1SgqNx3iJgiUQp
         fWvte6aNimsFn7voADEyEckMPUNLzdVNvJyy9jHOhu/O20nLsvkopH3C37e2/kpBEWqy
         uv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699965412; x=1700570212;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGYP9fVfGkZiJrBqQeiq370qrrL0KXPBb8k9ZVDQb9c=;
        b=g6IhDbe8D+rtGWkf4DBqdOGjeMETPG6yBOxJRwJsqQiUlIGpO1bBqqzoBsZ3b7ThEP
         ahMt0QWJ8QSB4Ed6H2UdzYc7CEGEcPqv7LtOLo0c53o2kd+sbl4HsXJTzE4OlyukeN6R
         3SF8XTsUQE8gio2QnHpOjX3AW23Ewn8RtlcFtfGm/G9FhtmkLFEC3aTDx97D2LfoU54Z
         iV37RqNd0f2rbLefmsGr/M6VvaoiXyLtuUaTDhSkySfsDKAx/yTf8qOL+++9rn2ogSUm
         i/CIb02A861VOK9sElwTOPGJ/OfW8MrM0NhkEoqYMB2gA5sKMacU5A+l5mxLPC5AZRG4
         O/QA==
X-Gm-Message-State: AOJu0YzYDK+JnMO+1tQdfrS8RQLoWoxegg9lpFBHf2s5wcP7tQB072Yj
        0gDEGKrGD9aevhf2JDaV9OX5pD5GRLUqOygpk1IqOA==
X-Google-Smtp-Source: AGHT+IF3qR85JL5bHfvMtNQF4HveJFzWYqL0OxoL/qgSL9O2s0LFfY14V0LtS+RSQESCTBlR1J4JwQ==
X-Received: by 2002:a17:902:bd41:b0:1cc:1efb:1bab with SMTP id b1-20020a170902bd4100b001cc1efb1babmr2094791plx.38.1699965411904;
        Tue, 14 Nov 2023 04:36:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001cc41059a11sm5566424pli.196.2023.11.14.04.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 04:36:51 -0800 (PST)
Message-ID: <655369e3.170a0220.cafdc.cbdb@mx.google.com>
Date:   Tue, 14 Nov 2023 04:36:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-11-14-v6.7-rc1
Subject: renesas/master baseline-nfs: 23 runs,
 1 regressions (renesas-devel-2023-11-14-v6.7-rc1)
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

renesas/master baseline-nfs: 23 runs, 1 regressions (renesas-devel-2023-11-=
14-v6.7-rc1)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-11-14-v6.7-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-11-14-v6.7-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3524d199ff621832e00185afe178777fce60eb0b =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-10   | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/6553395caf469339be7e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-14-v6.7-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-14-v6.7-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6553395caf469339b=
e7e4a6e
        failing since 0 day (last pass: renesas-devel-2023-06-26-v6.4, firs=
t fail: renesas-devel-2023-11-13-v6.7-rc1) =

 =20
