Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6406FC8E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 16:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235550AbjEIO0X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 10:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235905AbjEIO0T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 10:26:19 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8EB4C2C
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 07:26:00 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-643557840e4so6416891b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683642358; x=1686234358;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DY+Keg7LOrhUs7a/VtbKVppCAbBWHg9qxaTQKGMX3u0=;
        b=2EjVb2szslg/snbjzTgImneD5LgqEfR8kwWBHIQ6mx1b99oC2NH0o4RF+LDSKS9Mho
         XoP4BGvS6N6qT3Mf/3g4lwxFKAWZX0NpEAM/k1ourEPWyVrCQm5/wT/kO181RlqArn0k
         An0LIAPpYCl4q6OlpzhgTafnPMue3MPWvQexojtW7n1S+OhPRsQSBZYJdIiF22+lFLVE
         8GZLtzb9NbtYyuTz6BkgyJEnzX++0378eX1JNUu/RxTJTt+fkjmD+qDJylNcuO3KZeZ9
         M0RXsb3CN9UuXLmHQFEWWZjU/iImVJxmtNnXcKyB2y+49Szm6CDKTjkNQWpC14MoiRfa
         Z3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642358; x=1686234358;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DY+Keg7LOrhUs7a/VtbKVppCAbBWHg9qxaTQKGMX3u0=;
        b=KQeRLYlTmWcEamSBq+DynwBwYYf76rZd9QBoL7pNJBaNKFiuVpuz99py41tFoLXUPm
         e0Ks3Ky2MsVGflmGQezDnu1FWLZ2TvpLeyKYD7RnDIGOD8Vb64MNDY6cVUH3qfDNEMn+
         L++idCQRTpUTu4+uq6roJz16u4B/YDEC9c40quoj3qVjeO2A1aEUgSsRm2CJrP/Fkk6W
         r0ekerofa2/Y9FMZ0WmCiLRB4Su4bZc5/6ZIUl08C5onxSrg7+6njn69h6iT+KfHzQVA
         Rs3669k79pTJImLKeyzuyRd1lIzlKgcHA7pt4EKX5Y7/b+HmDmLahAgX+dLfOOMvhNmk
         29Hw==
X-Gm-Message-State: AC+VfDyWQvktyEco+TyV/JlQr+NQ4FaCVc/jHFci2ppZFtp/zj7PM4/u
        mGtBBuNHvgYGZ+7poV5JE6yG25NmRzy1ygWdyxwabQ==
X-Google-Smtp-Source: ACHHUZ4b1lmVslwhF9WTd+Tn70+LM+bbVyL7xznW7onh3HFbXCDxPcQfPQ0WDw+K0Ga2TVU54QovdQ==
X-Received: by 2002:a05:6a20:42a4:b0:ef:f558:b80 with SMTP id o36-20020a056a2042a400b000eff5580b80mr18338200pzj.58.1683642358499;
        Tue, 09 May 2023 07:25:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q17-20020a62ae11000000b0063b8ce0e860sm1860134pff.21.2023.05.09.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 07:25:57 -0700 (PDT)
Message-ID: <645a57f5.620a0220.e2d74.3e7a@mx.google.com>
Date:   Tue, 09 May 2023 07:25:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-09-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master cros-ec: 8 runs,
 2 regressions (renesas-devel-2023-05-09-v6.4-rc1)
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

renesas/master cros-ec: 8 runs, 2 regressions (renesas-devel-2023-05-09-v6.=
4-rc1)

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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-09-v6.4-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-09-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dce70215cdd5598b16b34f41c88d168ad124cd45

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


  Details:     https://kernelci.org/test/plan/id/645a4c6a11fedc7e412e863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230421.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/645a4c6a11fedc7e412e86=
3c
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a48f67f903e47362e86c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20230421.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/645a48f67f903e47362e86=
ca
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =20
