Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD6BC7EA78E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 01:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjKNAhX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 19:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbjKNAhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 19:37:22 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D2ED67
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 16:37:18 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5c186f027cfso973203a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 16:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699922238; x=1700527038; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AWN9Bn0MUUxxQmm5lG/sGt7vvZrilL+rzeAGqPdlj6s=;
        b=cCfBYDMi4/Sg5WyZc+Tfu68plQXeMm486jMMKwl8NtHm7A6dKtuIEKHcJeWqmLW4zd
         dW1nvHBKJPuJg0fbqkacWDWFP3xKcfekM/+KwxsSA3VgVFgp6f1Z4yB/9SojexVfJCKN
         XDngfwQMRc7kSRffi4OzANrq0esWb+vAD5IfbBa4Cx0faFbBYQ1rGHrPzZaTcflpZnQ8
         x+L6xk+IWl1blb8aAGDzwRcn0PRzztPRZ3hEnVqG2WkW5T8Q57YpmHfIy+Xk+QWY1YdQ
         xpcrjW6DCzIcF2M6IbeU/+qoLcHQ3EllXB2r4i2BcvBOJ76qXXpsRAjUP+WYm7dbmO32
         Rvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699922238; x=1700527038;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWN9Bn0MUUxxQmm5lG/sGt7vvZrilL+rzeAGqPdlj6s=;
        b=W7U/g4m0ZhBjVVfAbla/PFUeiikynXtKlxJTCwZIIQMLSYPzlqzVj1Kc7bvU6p9Xzt
         T6PcVZ34P0DNDVCZ9/L185iO0Ni/6rRPwt+PvE34V/28SWVJUB1QuuqR3epdrzihxo3N
         m8yPlaIg941k1X+WN5AGMzqtQmh7REEFmE8vTiAX/U8gu2ZFfP28oer4lfMSNFabmjPY
         mMrUlbGdvB/n8RAWON0DmZhj9z83Rwbp9W9pok7Rt3CZDV62w5L+DPwfz7a4WQJ4i4U1
         AA5hFlnq7xACeF5iTkckJKIF9iMQtdcnZGxqQGVpDVUAdupyk0MS5/ZxrywPjyVW5gd4
         GFdQ==
X-Gm-Message-State: AOJu0YxUuttmMePGLiQuRpItY2TVp1vKUSwuRPmU3dD86Vgfc6CWjSwh
        0Mk5DOm+Vi3hN4xakZ1+jGdst5m+CEu+3juawmPvIw==
X-Google-Smtp-Source: AGHT+IH8Z/JrHBGVKocpMNCX3FdqxKOkpelyM94ufpxY0Cz+N2ePCK66spR18J8Z7I6SU0MeMvpNqw==
X-Received: by 2002:a05:6a20:8e07:b0:185:9c2d:6f35 with SMTP id y7-20020a056a208e0700b001859c2d6f35mr7902402pzj.13.1699922237799;
        Mon, 13 Nov 2023 16:37:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l5-20020a17090aaa8500b0028031e87660sm6047652pjq.16.2023.11.13.16.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 16:37:17 -0800 (PST)
Message-ID: <6552c13d.170a0220.e14cc.e92a@mx.google.com>
Date:   Mon, 13 Nov 2023 16:37:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-11-13-v6.7-rc1
Subject: renesas/master baseline: 65 runs,
 1 regressions (renesas-devel-2023-11-13-v6.7-rc1)
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

renesas/master baseline: 65 runs, 1 regressions (renesas-devel-2023-11-13-v=
6.7-rc1)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-11-13-v6.7-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-11-13-v6.7-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2cbe2219523d8ff9bc5d81dfd3bb6cf97807ab2d =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65528fa95d707715b77e4a8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-13-v6.7-rc1/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-i=
nnocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-11-13-v6.7-rc1/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-i=
nnocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65528fa95d707715b77e4=
a90
        new failure (last pass: renesas-devel-2023-10-31-v6.6) =

 =20
