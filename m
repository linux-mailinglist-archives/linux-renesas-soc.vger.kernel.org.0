Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D0236BD09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 03:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbhD0BxS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Apr 2021 21:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbhD0BxO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Apr 2021 21:53:14 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF27FC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 18:52:27 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso6367038pjn.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 18:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2c/g0kAa449GQWRdup8QRuEz3YaGBp+C1+zR9FEFzX8=;
        b=FZKCPqqJF72v9EJ0iS7NJjhmNwLqseG+JS2Bb6gDn3S86qo54WUYRi0wetCnckPTao
         5IpOKogHDu9gAHoW2KE08JXBfacAGSax+NhL/NZE9KFCFsRTcqLfrJYhIfEkUuDWHFAM
         8lB70cCXFcGX7TXybYQNrrJQt2ejealTHI8gyfl60Sd0IorQFbo51I9LHl+lmu85o/9A
         EL2JaN035ba4UOyFTFjpMKFIkMoOAiRvPJTZecfW+5kzsBG3lZbFaQRH5f7G6rkpJCr6
         vWpr69shUJ2y2wJ6IW6joKFEGujQ/8zm3IwYo75s7S3w+cQmykujKPkxJIuw8bayvmaB
         WhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2c/g0kAa449GQWRdup8QRuEz3YaGBp+C1+zR9FEFzX8=;
        b=jJhULxK3PKkc+pWCBSTogh+yy8W7108pFutlRYzhT0Cm+Nf56+RIu2u0H+x+PCCGu5
         la/PFEMYuH1sE5ZratfFjSdNFbZdyMXFqVpw+eBm5JxFhYSxAWotOgndLOf5bplQnJe3
         CrNkyE46L5MXMxQp9SPJiD9/gXQRbKk2iWz6xL0bPMbvgYqZ1ngBarfRYNwsxZY4zHfj
         e1p7vMPpmBIrAZb7c5T5HxwQCHbgcyDh2SIZot2bXbJbsh2Q6YWrIBgTDrxT9AiJCZkE
         /bP5yWiAEULqiWJA1gn1j+Q/vUIHaZ3uBrjdgJwLG9BWs2eeZx0zCxn7XCwYwEBVaNOa
         T/xw==
X-Gm-Message-State: AOAM531mNViXRAU1qsU5Ovdq97gdQl9SSe9H5A7TOIwVMxA2YkiKze6v
        x8O5kI9lmVp7jikxvoC6JHatap/LFnIkh4/v
X-Google-Smtp-Source: ABdhPJwR7R+yz/0HZNlhgONMGxtXffWEtTWvXW1CD1y02w8IZ0FJ5bOKRPbYx5N+CJXAmtU2zzmLSw==
X-Received: by 2002:a17:90a:cf8f:: with SMTP id i15mr2202256pju.188.1619488347149;
        Mon, 26 Apr 2021 18:52:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o15sm529106pjk.48.2021.04.26.18.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 18:52:26 -0700 (PDT)
Message-ID: <60876e5a.1c69fb81.fa772.2c36@mx.google.com>
Date:   Mon, 26 Apr 2021 18:52:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next ltp-ipc: 11 runs,
 1 regressions (renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 11 runs, 1 regressions (renesas-next-2021-04-02-v5.12=
-rc2-3-g0bacf4d3d276)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0bacf4d3d27649e90a1223b1bc0a128316138030

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  484c2f26ebc4d7e6d6e7e0fd909d95680024a27d =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60876b6093e0c83ed69b77b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONF=
IG_ARM_LPAE=3Dy/gcc-8/lab-collabora/ltp-ipc-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONF=
IG_ARM_LPAE=3Dy/gcc-8/lab-collabora/ltp-ipc-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210419.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60876b6093e0c83ed69b77=
b5
        new failure (last pass: renesas-next-2021-03-22-v5.12-rc2) =

 =20
