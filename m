Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E02917D83A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Oct 2023 15:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbjJZNcp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Oct 2023 09:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345053AbjJZNco (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Oct 2023 09:32:44 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51864E5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Oct 2023 06:32:42 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6b9af7d41d2so848153b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Oct 2023 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698327161; x=1698931961; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=++LErbjPo3D4KvKUgSvsKYnQXUhkI8xQpLZpHnBjbec=;
        b=X/WwpJHJ8maL/cyCX6soCOPpTz4uXSoKP7yt39sdrG8zugroaJPDtPqiwyyr7fqKrt
         JwAbYlJnk33b7YQS3ybz1GIkc5pRNX8b6gpM2WrzO/aAFNRot0ynKAZJF3An76eluIWn
         tlBZiWXhGFrq1cKIrLoHCbmkeoFtWDO8LSfFA8Vc9SCw+zfY7aJmjIhgpydhBDKGByoI
         5CTnT2n05nfavrZFLVB2Rv/sg+CYkSy09PbxIU6g9CMB7Dz5gPAKeaQgGWdoL5YJMRs5
         vxMqggoooAgnSnFhhKn2umI/f0k5Uf9XqzPtw95qyKfJJTQsed7z8iy4TAjeMBGk62X4
         KYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698327161; x=1698931961;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++LErbjPo3D4KvKUgSvsKYnQXUhkI8xQpLZpHnBjbec=;
        b=ffXCGn9vIfBy+LAfI0CbebtCEMYZYdXUMDgRhV//mkToNf2tYObNpM0PlbnYwv91oy
         5g0TFduSK+/FvBhdQ7rm1WvBAKPtQ+TBcJAbQR3dc7m8ZBPwkPVGCRtYz8ZgiVdDHuuR
         UEZe74xB+gIEt9mf+oE9CtHf71fYeM8dQczURuR3kKLSbmGVxmLH7SyfNPVuwhdsnCZG
         RNo7NPowU1K+S5bTYIShizYj94faX0OdWckoTzYPz7BPLulztG04gWtL9RnYyfEKFKd8
         ABbAxTqxGZI2UIif4GHAeENFrfNDv0c/Hmq2GEacU2HKdHPw4QEajUXI5ptR50uKxaK7
         3MtQ==
X-Gm-Message-State: AOJu0YxRYsqF6F64qrV6pkq+41oFfiwWvGSKiPq3FM1AAQ1hZdOagP1E
        SAyTke/Hqx4xcV504gJ2dQsHHlNSFR8QV68evX4=
X-Google-Smtp-Source: AGHT+IEmkOmo4UDa8rghTqxDnvllAyR97lYKkexnKQQgW7BQdtHEdvQw8d3CKbo1GriRrSI3yUZlyQ==
X-Received: by 2002:a05:6a20:7289:b0:15d:42d5:6cb5 with SMTP id o9-20020a056a20728900b0015d42d56cb5mr10662079pzk.28.1698327161180;
        Thu, 26 Oct 2023 06:32:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v27-20020aa799db000000b006870ed427b2sm11467934pfi.94.2023.10.26.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 06:32:40 -0700 (PDT)
Message-ID: <653a6a78.a70a0220.64ee0.6716@mx.google.com>
Date:   Thu, 26 Oct 2023 06:32:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-10-26-v6.6-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 48 runs,
 1 regressions (renesas-next-2023-10-26-v6.6-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 48 runs, 1 regressions (renesas-next-2023-10-26-v6.6=
-rc1)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-10-26-v6.6-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-10-26-v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      fb39831a07ec1fd914da56caede80e2997f1dbc5 =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/653a3acc23abeb040fefcf0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-26-v6.6-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-10-26-v6.6-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653a3acc23abeb040fefc=
f0c
        new failure (last pass: renesas-next-2023-10-05-v6.6-rc1-7-g11476f3=
1ceafc) =

 =20
