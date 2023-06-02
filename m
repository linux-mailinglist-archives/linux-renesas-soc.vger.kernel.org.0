Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50B4072055B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 17:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236311AbjFBPHG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 11:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236334AbjFBPHF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 11:07:05 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EABFE43
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 08:07:04 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-651f2f38634so1610973b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Jun 2023 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685718423; x=1688310423;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MvB/d/9dhzrm6hTM0eZ7ppdvQwO7qIgBUAbp5StxFEY=;
        b=u4ohRKKZcVInSKEFnsMKsSH4J2iF1gM4xNYjrgx2Uqov7m00EGtheF/mN2cCtVUYlq
         IXZXVRMqLW9+mYAllKVChllvbxWACf0rKLAFInIvN4wvk0te2ftC5dlHzuny2fsFeDQg
         W/sRxrRLPt7aWdG1HnP/+es3wA3fqBao+tpR1+Ew0622I94z4TXOKlN0+4Pgd44d8+yn
         mdXRFbU5vGBxUJHPlym13RKbm+hYmx4TeZYJjfb95CEpufPsc8isklLdNEf7xoia93W5
         zRIaWhkygMRyFo7AknhKix592Up1wnRyTf/zq5emr0dKU9SGLwMCWxnMSX7AnFfB1GR7
         5sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685718423; x=1688310423;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvB/d/9dhzrm6hTM0eZ7ppdvQwO7qIgBUAbp5StxFEY=;
        b=NdtuvGDwT4m+f0q8WufiLRt8pm1zy5NduvHpFb3epqkZayE1UxBnbWTlWzbHv0EufK
         y183Igtlqpsw+iTaX19E8ae/xWO9o510AdLLMKDQdxewp6pHPzkb8ck8Sve2hdF8Ggqn
         D54tZt5GVi8gf/r9iHNezrBC8LVDge0wD3Ia5F/rE0LX2YvHysqIvavNhqXMI09u+/fx
         pSmpWuOyDJDegVXzEImLqOE1ie1jUyWTNH9rmPO6XnwdivPXLq8Su1HdXJrJnPWaGH5v
         0CvTWAE5IC28nmgwt4GZYlfjOqQmpt9obXWP6Eq/x2PpjZ1oyBo1RJRWWjagoojeoW37
         VFYA==
X-Gm-Message-State: AC+VfDzNLwPj9AaS8DzXzQ4jD0StwvkaFjbbqEmn96trSIHIf0ANQuYT
        ovousRJQ4uK6zBj7wSnNuL0lMpJ8goZuNfwFuZt2+w==
X-Google-Smtp-Source: ACHHUZ5yiQuYO6aygK2+Too227b/HgNV7MSOi4Ii0xngw3ZIzKZ2l9YxsQWxMsbyJfDeTD//t09t0w==
X-Received: by 2002:a17:902:eccf:b0:1b0:6e16:b92c with SMTP id a15-20020a170902eccf00b001b06e16b92cmr224710plh.54.1685718422750;
        Fri, 02 Jun 2023 08:07:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jf12-20020a170903268c00b001b176d96da0sm1505509plb.78.2023.06.02.08.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 08:07:02 -0700 (PDT)
Message-ID: <647a0596.170a0220.bfc0f.271e@mx.google.com>
Date:   Fri, 02 Jun 2023 08:07:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-02-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 10 runs,
 2 regressions (renesas-next-2023-06-02-v6.4-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 10 runs, 2 regressions (renesas-next-2023-06-02-v6.4-=
rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-02-v6.4-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-02-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      256ba57a94d64c7d95e8f620dc8d1299c15fbc35

  Test suite revisions:
    cros-ec-tests
      URL:  https://github.com/kernelci/cros-ec-tests.git
      SHA:  fad9423ae3c64bfd48c207de34a1177000d45fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f398a526ef11c5f5de52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6479f398a526ef11c5f5de=
53
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f4f3652c025472f5e073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230527.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6479f4f3652c025472f5e0=
74
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1) =

 =20
