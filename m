Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E652C916D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 23:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgK3Wrl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 17:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbgK3Wrl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 17:47:41 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F08AC0617A7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 14:46:38 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id ms7so83pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 14:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5eO+ftKhS8TfKxEM9oA0tJNt5B9Yj1/eXB6yH63I7wU=;
        b=k/je1c/XmfbkGgKcmZizAugX8i0/oXWsuu30T0//LZ6hqVIIn1tB3bYf6qjn/YbPPM
         wNDm0ejgq8KIZHkM4b2sAGG+zfmXRqVk1dpf1Szoa+oO6uLnSTtkgmpO9i98E41R928H
         ztWjDVbZEBK5csa47Q5K7CfYpaW7LP6Hwlup9utXwyqUYtm6fyohZZGTj+ts2jOKpbvU
         po2qyMZIA50KXPNI4LqyW+CzoiDBwhaEVLjxZanV6dwYxeNBcBRdX75g49lslcVfWNSL
         BC/Cvco13P5dZTufOq4eyn4XRYnxAE1KimnonFCVaDQPMw9dJeVsqyv7TR/fMlH7LdfP
         SQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5eO+ftKhS8TfKxEM9oA0tJNt5B9Yj1/eXB6yH63I7wU=;
        b=hem0TCF9uAmzDzBus9ZBbNLfgI1N7D2Zaw9ygaZtkt+FSbjjc3i6sXsUwBxnWgPCoj
         PwMD/eLuFlSztTRGVFpmKXBRPXYp1tRt8SZSrhbTiaOikSemCNvOYTveRbXyX+43UhsY
         9CEyQwZ6RVyRRpPEXGF2BZaMFo5eTPnD1BqI93zaBZTK0ZcFQ4FflKoJ0a/NF4EVjSPx
         7qTBkm2GH2gj0/3FK/oIbJFNE9mAZ9Ph17Njj+OoaUjwYDg37fBatxScD7yfZxwz2loR
         tsa8FCgveDzyR3wvMdbuLCdusLXMPvldoAID8sW7j6dJLHyg6RwLVJeWpAFesXlSP/c0
         H/lQ==
X-Gm-Message-State: AOAM532kXXG87rcw5H1rWJ2DuB5qEMYjYvCTI4rRr3qVGRP9fFxBQQGT
        QwAzLuDqHAxFKUk7RI0G1rzujvSz8fZvlw==
X-Google-Smtp-Source: ABdhPJz10AE4dZ4Dkz3lbrlk+HBAovXhjvDn4UOIBX3N/JKmuD5NlU0Q/6mWVD7LBepPvN7HAsn4zQ==
X-Received: by 2002:a17:902:8212:b029:d9:d097:f9d5 with SMTP id x18-20020a1709028212b02900d9d097f9d5mr21020495pln.34.1606776397538;
        Mon, 30 Nov 2020 14:46:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b2sm18406pjq.20.2020.11.30.14.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 14:46:36 -0800 (PST)
Message-ID: <5fc5764c.1c69fb81.aa73e.00cc@mx.google.com>
Date:   Mon, 30 Nov 2020 14:46:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2020-11-30-v5.10-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next usb: 3 runs,
 1 regressions (renesas-next-2020-11-30-v5.10-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 3 runs, 1 regressions (renesas-next-2020-11-30-v5.10-rc1)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig          | re=
gressions
----------------+------+---------------+----------+--------------------+---=
---------
imx6q-sabrelite | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1 =
         =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2020-11-30-v5.10-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2020-11-30-v5.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c51a6c86347a721c328a37adf4c3f8892aa10330 =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig          | re=
gressions
----------------+------+---------------+----------+--------------------+---=
---------
imx6q-sabrelite | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/5fc56550dda021c4b3c94cc0

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-imx6q-sabre=
lite.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-imx6q-sabre=
lite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/rootfs.cpio.gz =



  * usb.usb-presence: https://kernelci.org/test/case/id/5fc56550dda021c4b3c=
94cc2
        failing since 34 days (last pass: renesas-next-2020-09-25-v5.9-rc1,=
 first fail: renesas-next-2020-10-26-v5.10-rc1)

    2020-11-30 21:32:37.570000+00:00  [Enter `^Ec?' for help]
    2020-11-30 21:32:38.664000+00:00  =00
    2020-11-30 21:32:38.665000+00:00  =

    2020-11-30 21:32:38.667000+00:00  U-Boot 2019.01+dfsg-7co6bv2021dev1b1 =
(Mar 11 2020 - 10:36:34 +0000)
    2020-11-30 21:32:38.668000+00:00  =

    2020-11-30 21:32:38.673000+00:00  CPU:   Freescale i.MX6Q rev1.2 at 792=
 MHz
    2020-11-30 21:32:38.673000+00:00  Reset cause: POR
    2020-11-30 21:32:38.674000+00:00  Board: SABRE Lite
    2020-11-30 21:32:38.674000+00:00  I2C:   ready
    2020-11-30 21:32:38.675000+00:00  DRAM:  1 GiB =

    ... (602 line(s) more)  =

 =20
