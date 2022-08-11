Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5F9458FDB5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 15:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbiHKNuX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 09:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234320AbiHKNuV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 09:50:21 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA3565E3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 06:50:19 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id 17so16945003plj.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=zCSfbakhs10XyNLerLk068xTdnsi32gq2WdpLU53ccM=;
        b=ezq1NMrYR65CzGQ1aomYuDpdSK2D7mA+qR532izR2a0m8+1bRo/pTmYkI/BdEsOGd/
         7mWjDVO1PaAFa2nMwxu7qaoN/IedqEVOtTh/ndi/Lj4k4GFFyDzxpM6X5WLtBqnahn/e
         54guwYA2CASYb9dqwCuHuqKQYURH4cMEiMuuGIYQbeB0qBS94Af2AZJve3lwhdl3KKmm
         aVQ9V/QjKOCS6zbuXhKnqbAAqbF2UAGZJx9gX7pdQzd/dBK0zlrtUCo/7SCqiAvHBLI9
         0dWptgyBGMI/uY9dJIEs+CrML7xZIIX5oyU1pQbtln77BUt6d01F8WBjQXT2h/fpWjOA
         uKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=zCSfbakhs10XyNLerLk068xTdnsi32gq2WdpLU53ccM=;
        b=L4RRZtywArvmRw3NF6GG6P0FIbhNExwYb9R2SFvhUWA7JXu3OcEp3aNnq2GfLTrOhW
         9av7b114azimTfeyuJB8PqNCqGdLX9cpXBLKvBM/Ti5yuHM4Zp8BJzeX+X/ndz/IfRbq
         Sc9P4wg2zxSz4qUOBWyHXK3F6ZaZ/9UabjY8OGBS1hq2wJhH/A0HYRe3uZbwvEyzIUuD
         Fg4Gh9ey9p795o5nnUWoHbguTowJA9ths4FQ2x9CzHKXmdq49u7FWUfUezVnrahknNMo
         mmaCwUL99ovUV0ZIMbxzjhdYYYIB7bp6QQ4vaImYdMn1SHWAgTnsJndYWT7S9n/8CO9K
         QkKg==
X-Gm-Message-State: ACgBeo3mYsgKBxxJt/2lOvT7k/FOzjlIW+qUEv2HEN1Yqsaq0t8N0wNX
        m/kkGvd2InDSlOfOE/n/+eoIBpjAf+o0bxti0Uw=
X-Google-Smtp-Source: AA6agR6/UESC3n6CFsFuqHgoMxse6H+1aURy7Sm1c2u07Jl7RRY3ZeB98+EjIw7awwYR2gOVN6hV0w==
X-Received: by 2002:a17:902:7c05:b0:16d:2c63:da90 with SMTP id x5-20020a1709027c0500b0016d2c63da90mr31963079pll.27.1660225818952;
        Thu, 11 Aug 2022 06:50:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e14-20020a17090301ce00b0016dc26c7d30sm15114766plh.164.2022.08.11.06.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 06:50:14 -0700 (PDT)
Message-ID: <62f50916.170a0220.c4c4f.9678@mx.google.com>
Date:   Thu, 11 Aug 2022 06:50:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-11-v5.19
Subject: renesas/master cros-ec: 10 runs,
 1 regressions (renesas-devel-2022-08-11-v5.19)
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

renesas/master cros-ec: 10 runs, 1 regressions (renesas-devel-2022-08-11-v5=
.19)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-11-v5.19/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-11-v5.19
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      afa6e8225571047286d61812f393c879ef344b1d

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4f6a97b4ad59d2bdaf066

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220805.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62f4f6a97b4ad59d2bdaf0=
67
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8) =

 =20
