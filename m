Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A39F34D984
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 23:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhC2VU7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 17:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhC2VUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 17:20:38 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C027AC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 14:20:37 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id m7so10230064pgj.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=owbwP7P1YhCf8PICQPtsFxuoSjiQDw6v7cD0kFBTHo8=;
        b=BnIZ5f+dLyHEQFZrRozPdzg4TfVyeMX9Finxuw7/m8eszHTZ3XTDz1gvKgpvbvsZHy
         iShfFZ+Hl8T3MpUDzr2kJBO1PmPeWqU3AIJ7OB8k3yxbQBqTVVwEHVPmjBEzmQHfDd2C
         TgaijZPs3ifRCTB1W/0aQGl0b+pLYaerl7zU25sQUmIed9CPnQOeGVtAtUhjQYc+Agew
         2z8rLu6AJApXJtq1FnMhU6LWt+eAK1XztdTKLlWWpMAiREz+oL+QKE4xMq7xomq1etnd
         xgNPizJZ6nqXXrFayx5ZS5mJggOBRlIQxbrj0bavYKPpdMHjqF2/Y+B0XeacPxnV4+M+
         nU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=owbwP7P1YhCf8PICQPtsFxuoSjiQDw6v7cD0kFBTHo8=;
        b=t5azWn8vv3oeiEidKOC9IR4pgaXObTpgRsSywDGBvzTXHxhpyvya+BpoH40V67sWWN
         s7SstgwcwYujcwem9P68Gm/MM2A1FQ9ku8y1jzKOO10nEL6zOdphPMar6J0MNUeZVX03
         MdaODXo/HSBNjtXv8A2ZJKdnJShiPLp4fOwrfF6roCPGFhNnJL+LNVrZxcYdg8oNkUmW
         +Lf1Gsyxayp8KwB6FCMS4PEfPmK+v5HVs3fODBXCrMFfwtrQY1cinVynd18abYrKqJyo
         RuuAi80ATHb4MRs8F7tgZXmZoBE544UxUd89u0cZOCWl5OJkCLcEzgy32Ofs205JHbur
         iAow==
X-Gm-Message-State: AOAM531XDrCqFPtCQz0Hs1lyFyHQSd9YtqasNue5an/vVGDZ9jaAbRGc
        MG50rhqMy4vEBzh2POidT0W7zJmA7rfvBA==
X-Google-Smtp-Source: ABdhPJxb5O5S3hJR2U1BDbhcTkEq935AI/zFYjYWZweejL+m2e6FkiDbBZ6pcFbwx5onre/2o6L71A==
X-Received: by 2002:a63:d449:: with SMTP id i9mr24838007pgj.227.1617052837130;
        Mon, 29 Mar 2021 14:20:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s22sm4599349pfe.150.2021.03.29.14.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 14:20:36 -0700 (PDT)
Message-ID: <606244a4.1c69fb81.8ef21.b0fa@mx.google.com>
Date:   Mon, 29 Mar 2021 14:20:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-03-29-v5.12-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 17 runs,
 1 regressions (renesas-next-2021-03-29-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 17 runs, 1 regressions (renesas-next-2021-03-29-=
v5.12-rc2)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-29-v5.12-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-29-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d084e52e5b7b16d25a5e32c4625fb205a2b272d8 =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/606216aab74de860fbaf02d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/606216aab74de860f=
baf02d1
        failing since 7 days (last pass: v5.12-rc2-14-g6f56f6c26099, first =
fail: renesas-next-2021-03-22-v5.12-rc2) =

 =20
