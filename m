Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8C3D42A3E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 14:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236322AbhJLMJj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 08:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236367AbhJLMJc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:09:32 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF153C06174E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id oa4so14806954pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mnIT7xI/aHPSwn+Eie02tpMhDJcqxKelBjA2ughpyg8=;
        b=tYNz4+Sx1I5+bZOA2p9jnUWSqXga/G7yxgQyNT7hAQeqhMybxUFRDohgDBQG6ni75k
         RrtGGJ4nC8ZC9q7bMUtTEecR1f0F6qCU52vD/AIxkRy25tKPLGLBkFo6Hew7/4sS+tzQ
         dD3YNo0trtUdJj2+BBAtU26iOQ9UQj7mE9PkYwW6+9+EESqe5llYs0I8jnbU0o7OqwDa
         O/oNWAga8eH3Bu9Srz5aJ527ckeS8CDQNp3Nz7jMc0ASJ7pU+HIgNgqeTCjLJnUxlasg
         2hqpJ5znHULdiFDLvh9Gxn8/te39zC7xJvoAUnYx4SjXlLpFWLHuAClFrik6ZRcf9EOx
         jtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mnIT7xI/aHPSwn+Eie02tpMhDJcqxKelBjA2ughpyg8=;
        b=o9+PIiuv1Qm/IkvHxXqXA6Ch/9qo7AKN/Mb8RKpZUyWWB9PhfFIutUDQMp9P6cB6E4
         +InWOvIO54XAmzVUCm9j/5L6v/a8+L6T+qV/JPPpGVJpv/H25mZ7gSULWg8ni2UpYS0d
         aB38xh1OpcXZmPAkeqUOpIaA+NkN7rXE8HIcQaiig9r3gfe2AV5xty8UkNVH4G5nhWZx
         Vz+k8u9ni8/tp0psSwD/r4CvhungDX3o6WYmSuDOiMhQ5dLrVdjRMDJcb86j4Ir5oZIA
         YZd8dz9ggz9O28KCLFfz2xBfE23pvqLHfYbdg9JyBIv5u391w5BMJOEW2+3JCIkmLSb0
         GvmA==
X-Gm-Message-State: AOAM533UcQOUtswA1hOgkOj8LkGrK5Ed91J5kTjASnlT8ErcwACSON9g
        BdG+cwJyzOoXrTrXNxWR6WCiK6419Dl5lS8i
X-Google-Smtp-Source: ABdhPJxSls6tsIPX8bG2IUUDNxFDFOajuUu/vg0BBO4MaNaXo+HwvFsqyWkdzwiMN1j4++egyCDhgQ==
X-Received: by 2002:a17:90a:a585:: with SMTP id b5mr5513601pjq.97.1634040450207;
        Tue, 12 Oct 2021 05:07:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u65sm3205618pfb.208.2021.10.12.05.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Message-ID: <61657a81.1c69fb81.abb03.9579@mx.google.com>
Date:   Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-10-11-v5.15-rc1
Subject: renesas/next usb: 5 runs,
 1 regressions (renesas-next-2021-10-11-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 5 runs, 1 regressions (renesas-next-2021-10-11-v5.15-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-11-v5.15-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-11-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      321d106e70eb261bd55bee08d881cbd5468d9d64 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6165678d26d005c69f08faa7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/6165678d26d005c69f08faa8
        failing since 20 days (last pass: renesas-next-2021-08-10-v5.14-rc1=
, first fail: renesas-next-2021-09-20-v5.15-rc1) =

 =20
