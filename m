Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22735609F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 21:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiF2TGz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 15:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbiF2TGy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 15:06:54 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE5621835
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:53 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id x1-20020a17090abc8100b001ec7f8a51f5so433703pjr.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 12:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nuuzOUTeSzEE4Rt6MWTSoQqeAYMLRvBtHRTY6n6N09c=;
        b=Moe7l6WFdhtmiK1S2wRuNGrzmUaHaIUt5Igpln/IBbyxPy7sApKLaWA8cO1iS22kGK
         walqbLwtQFqIrdrrw1UdyfNJxKzLWNidw3AdN0YLqBcfTXTQvvlYkPbTsBcuCItKMdKu
         B1ABpWv1GfocGtlyrxOqigswvXhc5OQQPEHvtelU5SKYeJZ7Oqvbdn41j/iftjSNZSyG
         9GVL4wiHv2hVWPPwuaFWznaEyi+U6xofts5YYndusKh6C1DM5TWKlf5SsJTUxIY5EZqX
         d9pxEPB2A9xML0//g4W/08Jd77KPZ+/mWQILgNviojq9I3l98VoeeA+Ee46pBVYhPw+r
         5L+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nuuzOUTeSzEE4Rt6MWTSoQqeAYMLRvBtHRTY6n6N09c=;
        b=i84R1A1yta1qStpcpy9rOPOVRzBcs0eRhZOKokylykjsBBv+lsnFqyoSzSjge8ecPX
         Gr1U8LzPrIXb0JpOdz4QeqJHvljkPqt6Pne4wF3YDOzMKh6ziroeOccx+egsBRnt7Xem
         K/hoLHd3k/D/2++KJS9XARjavhbdUBpQsc8bFWxKTAfhZ5V6y7Ss6ljkLn51Gx6nFev4
         buLaXQhX4m9pa6CB0ZxpQLOyp04U2b/T6ZfaRWhaoxgjCcOqLk75FVZPmVUH6PKr/LcR
         /gD8R9SnfeYVWvL+AMBiGXxspeAQHVPjEkgSY3KTCMn1lqTC7/LqW9pR1F2awOusiKqK
         +E+g==
X-Gm-Message-State: AJIora+fNL95qLvwWo5TPiBe+9g32FvCpCnwWvRT+Dtka9UToRhg+kgf
        XhluN90PktYkG3XFm+xWmxQJ3zLq4c3Xx+EpE4w=
X-Google-Smtp-Source: AGRyM1sTlw7gdSq+daTa0K6WPEHMklchpisUO3GmVUukTwxhuLqATWBq7MX/m5o6rzosozghMLO7bg==
X-Received: by 2002:a17:90b:4d81:b0:1ed:50e2:8547 with SMTP id oj1-20020a17090b4d8100b001ed50e28547mr5491570pjb.169.1656529612569;
        Wed, 29 Jun 2022 12:06:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y5-20020a1709029b8500b00163f6428657sm11760253plp.6.2022.06.29.12.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 12:06:51 -0700 (PDT)
Message-ID: <62bca2cb.1c69fb81.6ad2a.0c9c@mx.google.com>
Date:   Wed, 29 Jun 2022 12:06:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-29-v5.19-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 25 runs,
 1 regressions (renesas-devel-2022-06-29-v5.19-rc4)
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

renesas/master ltp-ipc: 25 runs, 1 regressions (renesas-devel-2022-06-29-v5=
.19-rc4)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-29-v5.19-rc4/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-29-v5.19-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33401641a5eb2a82fb3eeeb71752594b1d8016bc

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  e98f9465925434349d0aa6eb71e81b5464e76df4 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc917407515d1a85a39cab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-29-v5.19-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/l=
tp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220610.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62bc917407515d1a85a39c=
ac
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3) =

 =20
