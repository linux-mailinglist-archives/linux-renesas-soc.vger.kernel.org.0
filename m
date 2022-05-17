Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D7B52A0D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 13:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345567AbiEQLzn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 07:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345570AbiEQLzl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 07:55:41 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAAA4667F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:39 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id c14so16682512pfn.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 04:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=d2qCLk+l4CoVgnR1fRBeKuVL0LKdOrMyTeAgwiEwAIU=;
        b=hbMTib/9NsdKqF5/6i1zZCcLJJeryFtPahu63Iel4tel8MGRak5ie4kU5/szNnTECa
         Ezfpm9uyoWOFIqFCwCOv+Avkcyo14r/njUCwC9HjQggv1Iqrx7s3q8ZC2bQvqQ5WDeO8
         cr1apKtlS/XTUW/WKWXEBdJW+mluHiVDZxQnZBDV12hdIBokD9nj+StYj0C3VpjHiyY6
         iYSOoR6fdXgmDGQhvF17AJ9m1cZzpMezmOJ977xS9mmagn9f7RywFde5jjNhr9CzWm3+
         ML/Oo4C94+K5X3m/2mOhG5/OTxAeCvsl4JnVTJhUqZUSYtamNoTlFtRzAQbVdUEvzoqG
         fadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=d2qCLk+l4CoVgnR1fRBeKuVL0LKdOrMyTeAgwiEwAIU=;
        b=K0Pvfpmv3KwoqM49+X1OsigqN0WDS9dkFd5eyxLJfHMKz53mN31NvcKvO38EBK1FQj
         XuI4tQX0iK6u6aAopwp00qAb2LC/EzA57O7mAklYSxPOGVtyIj9mkuGq+fC0k01ntmOX
         Sbxidpt0Qt9hI7N2jYNUAlyWZ6xTMZIwMJF+F0Rs3BtS+1h5VTxypHHhrFYC4Hgt58mM
         IkpEXptPy3XE+ap5bvJmdjnsXlkER+SBxI62TOf9r4zjeEA0OPFZOZjw1Hpt+20Nc5yQ
         Ijz5cbncVhpHGB2YJdu5uaHm5dijrRh079hViIl4L5Zrkw649KpJ4FGxIEB///8WZXBR
         v0Sg==
X-Gm-Message-State: AOAM530twMxvuGSH8Ftjsr97mMtriBoAdjkr8g17Ap7kcjx6gHj2IE0L
        LSud7rYKGdRCsvUEAhHPxIz91gPrXS+hjMscceo=
X-Google-Smtp-Source: ABdhPJwXGOfw24d1Y1DwLHR/87s94bDJAOTdL+yqmKOSh6M32V5HvRfNigDlcfXvSBzM01TLM0g5Lg==
X-Received: by 2002:a05:6a02:10d:b0:381:f4c8:ad26 with SMTP id bg13-20020a056a02010d00b00381f4c8ad26mr18910847pgb.135.1652788538533;
        Tue, 17 May 2022 04:55:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p4-20020a622904000000b0050dc76281d0sm8989807pfp.170.2022.05.17.04.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 04:55:38 -0700 (PDT)
Message-ID: <62838d3a.1c69fb81.a640.6156@mx.google.com>
Date:   Tue, 17 May 2022 04:55:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-05-17-v5.18-rc7
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-devel-2022-05-17-v5.18-rc7)
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

renesas/master v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-=
devel-2022-05-17-v5.18-rc7)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-17-v5.18-rc7/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-17-v5.18-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6bd98cbba53cd9f63aaf4d82982dff95c824b92a

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  163144712a46229f3476b04f6c0037c4b7f00299 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62837cd112b0a906daa39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-17-v5.18-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v=
4l2-compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20220513.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/62837cd112=
b0a906daa39be4
        failing since 0 day (last pass: renesas-devel-2022-05-09-v5.18-rc6,=
 first fail: renesas-devel-2022-05-16-v5.18-rc7) =

 =20
