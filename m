Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E323B65B160
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jan 2023 12:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbjABLnc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Jan 2023 06:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235937AbjABLnH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jan 2023 06:43:07 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718F26569
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jan 2023 03:42:37 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 124so18531836pfy.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jan 2023 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9REJ/xqPjcYEsIXmHSAD2a7NvdsbkGhX/uUCj9S0R4Y=;
        b=N91Nwgr1nQtHuRjx98W9w2Qqs9vaRNfdK2IpXx3OwXgsGyRG9DVcL+9LSgaAYvCUBs
         3S/FgQ3ynf+yvwgE/O/96xF3jEcrF1LX0mrz3apgwl3Zpa/HDvOHYDf+tuXlFsQqa5Yq
         SoQzPZDBZWwM9tCtxE/xIQICj2gNqHAJYNEXofzwhZZqHp5BEpw66FNGjVwkCtmSpysM
         LeVt8ijN5+DZVJLQlZXQYvH2UcD4UwCIRqi4R3YdIGL4rxBmYgCEiUo/FXazEiuIA4In
         3e8KhVV5g3ycSs/nXKr1XCu6yZnYLS3MCwCllUC6Mg0r3r43rTeU8Mbo51HJb0gsl7zl
         fxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9REJ/xqPjcYEsIXmHSAD2a7NvdsbkGhX/uUCj9S0R4Y=;
        b=NaqhSZIz7JP6TiQoO2jaFwh2JBG6zaz5wQRGnFI2eO+/ytP3SfbkWQG8hdv9F5dxvU
         l+Pt4uQ5RHNzf6G5U6ygW+Ozvn06FWpiZTRlj/MFtOe99ooVzguZ/9WiCnslqdyxYX+Y
         hkmSiJGwi8KRTPwnLCQwgJYa88g8iO0QWymRyaJ+weSC95cFcVcr3qND1sik4V1ALcjQ
         mdZSV/Lqs4M1+m4M8sbqv2WXhNBg3j8xjYj40DQQ4DXMe+GAZ9vvl6JNHzTL+Xe6soyw
         Ag11kXgC8G4IbdvT7yhhd+SeAhxxBdixEvFM7rkzcZcsGgwNQkdRenPZ5cOW9LVy7kox
         JN3Q==
X-Gm-Message-State: AFqh2krwfR02ujciKq2ewq03r4XezE/Q1toVu5HMhs7HAohh69BuGqdu
        6L5xBJOF0NVL3sHj0BBt7L6G5gtyyCUR43XsLCA=
X-Google-Smtp-Source: AMrXdXvqzi1YhRCd1aJ1mHMkiausFHcoFW/bi07tlsLqcscAsB/kDMWWfQU9eF8kQXpVJ++Yl448EQ==
X-Received: by 2002:a62:3841:0:b0:582:5460:a63c with SMTP id f62-20020a623841000000b005825460a63cmr5592419pfa.30.1672659757142;
        Mon, 02 Jan 2023 03:42:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r30-20020aa79ede000000b005815a371177sm11553399pfq.52.2023.01.02.03.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 03:42:36 -0800 (PST)
Message-ID: <63b2c32c.a70a0220.40a5a.0fa2@mx.google.com>
Date:   Mon, 02 Jan 2023 03:42:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-02-v6.2-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 43 runs,
 1 regressions (renesas-devel-2023-01-02-v6.2-rc2)
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

renesas/master ltp-ipc: 43 runs, 1 regressions (renesas-devel-2023-01-02-v6=
.2-rc2)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-02-v6.2-rc2/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-02-v6.2-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b61285fe1d0f3d98f4780d0889af30b13655c32e

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  9547e6a3a3dce0fce39215b54f4fe314de54a5a8 =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig         |=
 regressions
-------------------------+-------+---------+----------+-------------------+=
------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | renesas_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/63b2b1c533f46e630c4eee3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-=
hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-02-v6.2-rc2/arm64/renesas_defconfig/gcc-10/lab-cip/ltp-ipc-r8a774a1-=
hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20221216.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/63b2b1c533f46e630c4eee=
3b
        new failure (last pass: renesas-devel-2022-12-26-v6.2-rc1) =

 =20
